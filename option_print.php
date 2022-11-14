<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

//ini_set("display_errors","On");
include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');
//include_once('libs/smartyDM_fleet.php');
require_once 'class/class_user.php';
$sCookieAdv = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $sCookieAdv = $_COOKIE['cookie_alaxione'];
}

require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv);

$TabHisto =array();
if (isset($_GET['debug'])=="ok") {
    ini_set("display_errors", "OFF");
}

//récupération des infomations passée en post
$aVariable = array("id_patient", "validation","civilite_mod_up","nom_mod_up", "planning","ladaterech","dir",
                        "email_mod_up", "tel_mod_up", "nom_fille_mod_up", "date_naissance_mod_up", "deplace",
                        "tel_fixe_mod_up", "adresse_mod_up", "code_postal_mod_up", "timerdv","tpsconsultation","idtyperdv","bsucess2",
                        "ville_medecin_mod_up", "horaire", "ladaterech", "jour","idrdv","datesaisie","jsEvent","idcalendar","sAction","debug");


for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}




$bsucess=false;
$sMessageSucess="";
$berror=false;
$sMessageError="";
$bpasse=true;
$bwarning=false;
$sMessageWarning="";

$objBackoffice = new class_backoffice();
$objUser = new class_user();

$brecherche=true;

//mise à jour du status durendez vous
if ($validation=="modistatus") {
    $bresult = $objBackoffice->mise_a_jour_status($idrdv, $idstatus);
    if ($bresult['success'] ==1) {
        $bsucess=true;
        $sMessageSucess="Mise à jour du statut dr endez vous réussie";
    } else {
        $berror=true;
        $sMessageError="Problème survenue pendant la mise à jour du status du Rendez vous";
    }
}

if ($validation=="deplacer") {



    if ($deplace=="") {
        $berror=true;
        $sMessageError="vous avez selectionné aucun prochain Rendez vous";
        $brecherche=true;
    } else {
        $u=0;
        $validation="enreg";
        $planning=$deplace;
        $aTableaudecoupe =explode("-", $deplace);
        $bwarning=true;
        $sMessageWarning="Attention vous allez deplacer ce rendez vous à la date du ".$objClassGenerique->renvoi_jour_mois_format_v2($aTableaudecoupe[2]."/".$aTableaudecoupe[1]."/".$aTableaudecoupe[0])." à ".$aTableaudecoupe[6];
        $brecherche=false;
    }
}

if ($validation=="deplacesimple") {





    $aTableaudecoupeplanning =explode('-', $planning);



    $bresult = $objBackoffice->deplacement_rdv($idrdv, $planning, '', '', $objClassGenerique->id_user, '', $objClassGenerique->identifiant_entite);

    if ($bresult['success'] ==1) {
        $sAction = "deplace";
        $bsucess2=true;
        $sMessageSucess="Votre rendez à bien été déplacé";
        $idrdv=$bresult['idrdv'];
    } else {
        $berror=true;
        $sMessageError="Problème survenue pendant le déplacement du Rendez vous";
    }
}

if ($validation=="deplaceconfirm") {



    $aTableaudecoupeplanning =explode('-', $planning);



    $bresult = $objBackoffice->deplacement_rdv($idrdv, $planning, '', 'ok', $objClassGenerique->id_user, '', $objClassGenerique->identifiant_entite);

    if ($bresult['success'] ==1) {
        $sAction = "deplace";
        $bsucess2=true;
        $sMessageSucess="Votre rendez à bien été déplacé";
        $idrdv=$bresult['idrdv'];
    } else {
        $berror=true;
        $sMessageError="Problème survenue pendant le déplacement du Rendez vous";
    }
}

//suppresion de ce rendez vous
if ($validation=="") {
    $validation="deplacer";
}




$TabInfoRDV = $objBackoffice->get_info_rdv($idrdv);

//***********************recupération de la liste des status
$sRequete_liste_status ="select nom_champ_vrac,	identifiant_champ_vrac,valeur_champ_vrac from outil_champ_vrac where filtre_champ_vrac='liststatusrdv'";
$aTableauListeStatut = $objClassGenerique->renvoi_info_requete($sRequete_liste_status);



$idlieu = $TabInfoRDV[0]['id_lieux'];
$praticien = $TabInfoRDV[0]['iddocteur_user'];
$rdv = $TabInfoRDV[0]['id_type_rdv'];
$iIntervalle=0;



if ($ladaterech!='') {
    if (!$objClassGenerique->verifie_compare_date($ladaterech, "comparer", date('j/m/Y'))) {
        $ladaterech="";

    }
}

if ($ladaterech!='') {
    $datesaisie = $objClassGenerique->renvoi_date($ladaterech, 'eng');
} else {
    $datesaisie = date('Y-m-d', mktime(0, 0, 0, date('m'), date('j')+1, date('Y')));
}



/*$aTableauRDVdispo = $objUser->renvoi_tableau_disponibilite($objClassGenerique->identifiant_entite,$idlieu,$praticien,$rdv,$datesaisie,$iIntervalle,10,$jour,$horaire);

*/
//*******************récupération des information sur l'utilisateur*****************
$sRequete_info="SELECT  identifiant_user
	FROM alaxione_user
	WHERE id_user='".$praticien."'";
$aTableauInfoUser = $objClassGenerique->renvoi_info_requete($sRequete_info);

$aTabParam=array();
$aTabParam['idpraticien'] = $aTableauInfoUser[0]['identifiant_user'];
$aTabParam['idlieu'] = $idlieu;
$aTabParam['idtyperdv'] = $rdv;
$aTabParam['date'] = $datesaisie;
$aTabParam['creneauhoraire'] = $horaire;
$aTabParam['nb_personne'] = 1;
$aTabParam['num'] = "";
$aTabParam['nb_semaine'] = "";
$aTabParam['quand'] = "";
$aTabParam['nbr_affiche'] = 12;
$aTabParam['num_mois'] = "";
$aTabParam['type'] = "";
$aTabParam['id_jour'] = $jour;
$aTabParam['bdebug'] = false;
$aTabParam['idinterpro'] = $objClassGenerique->idinterpro;
$aTabParam['ivisbilite'] = "";
$aTabParam['ball'] = "";
$aTabParam['bpasdecalge'] = "";
$aTabParam['idproffession'] = "";
$aTabParam['widget'] = false;
$aTabParam['tabpraticien'] = "";
$aTabParam['sFinRequete'] = " group by alaxione_plannig_dispo.id_plannig_dispo order by date_rdv_dispo,heure_debut_plannig_dispo limit 0, 600";

$aTableauRDVdispo = $objClassGenerique->algo_proposition_rdv($aTabParam);



//***************************************récupération des minutes******************
$atabtpsConsult=array();

for ($i=1; $i <=30 ; $i++) {
    if ($i==1) {
        $schaineminute=" minute";
    } else {
        $schaineminute=" minutes";
    }

    $atabtpsConsult[]=array('value'=>$i,'nom'=>$i.$schaineminute);
}

$tpsconsultation = $objClassGenerique->renvoi_temp_deux_heure($TabInfoRDV[0]['heuredebut'], $TabInfoRDV[0]['heurefin']);




$objSmarty->assign("dir", $dir);
$objSmarty->assign("idlieu", $idlieu);
$objSmarty->assign("brecherche", $brecherche);
$objSmarty->assign("deplace", $deplace);
$objSmarty->assign("validation", $validation);
$objSmarty->assign("planning", $planning);
$objSmarty->assign("horaire", $horaire);
$objSmarty->assign("jour", $jour);
$objSmarty->assign("ladaterech", $ladaterech);
$objSmarty->assign("idrdv", $idrdv);
$objSmarty->assign("aTableauRDVdispo", $aTableauRDVdispo);
$objSmarty->assign("TabInfoRDV", $TabInfoRDV);
$objSmarty->assign("tpsconsultation", $tpsconsultation);
$objSmarty->assign("bpasse", $bpasse);
$objSmarty->assign("bsucess", $bsucess);
$objSmarty->assign("bsucess2", $bsucess2);
$objSmarty->assign("sMessageSucess", $sMessageSucess);
$objSmarty->assign("berror", $berror);
$objSmarty->assign("sMessageError", $sMessageError);
$objSmarty->assign("bwarning", $bwarning);
$objSmarty->assign("sMessageWarning", $sMessageWarning);
$objSmarty->assign("TabHisto", $TabHisto);
$objSmarty->assign("atabtpsConsult", $atabtpsConsult);
$objSmarty->assign("aTabStatus", $aTableauListeStatut);
$objSmarty->assign("iduserP", $id_patient);
$objSmarty->assign("jsEvent", $jsEvent);
$objSmarty->assign("sAction", $sAction);
$objSmarty->assign("idcalendar", $idcalendar);

$objSmarty->display("modal_deplacer_rdv.tpl");
