<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

include_once('class/class_alaxione.php');
include_once('class/class_user.php');

//include_once('libs/smartyDM_fleet.php');

//if($_GET['debug']=="ok")
ini_set('memory_limit', '256M');
ini_set("display_errors", "On");

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

$typerdvchooice[] = array();
if (!$bDroit) {
    echo "<h2 align='center'>Votre connexion a expiré reconnectez vous</h2>";
    exit();
}

$objClassGenerique->redirection_centre($_COOKIE['AlaxioneAutreCentre']);

$idtranche = "";

//récupération des infomations passée en post
$aVariable = array("id_patient", "validation", "idlieu", "typerdv", "datedebut", "datefin", "heuredebut", "heurefin","actiontranche",
 "day", "id_user", "idunique", "idtranche", "saction", "btn_del", "btn_update", "idactivite", "idsalle", "consigne","opentwidget"
,"opentel","opentinterpro","idtranchesup","idsurcharge","opentteleconsultation","opentbackoffice","nombreactive");

for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

if (!empty($_POST)) {
    for ($i=0;$i<count($aVariable);$i++) {
        if (isset($_POST[$aVariable[$i]])) {
            ${$aVariable[$i]} = $_POST[$aVariable[$i]];
        } else {
            ${$aVariable[$i]} = "";
        }
    }
}



$objUser = new class_user();

//init variables
$bsucess = 0;
$berror = 0;
$bwarning = 0;
$sMessageError = "";
$sMessageWarning = "";
$sMessageSuccess  = "";
$jsEvent="";
$sAction="";
$idcalendar="";

$aTableauLieu = array();
$aTableauTyperdv = array();
$aTableauInfoTranche = array();
$aTableauTypeRdv = array();
$aTableauJourSemaine = array();


//**********************renvoi id_lieuuser
$aTableauLieu = $objUser->renvoi_structure_user($id_user);

//**********************renvoi id_lieuuser
//$aTableauSalle = $objUser->renvoi_salle_attente($id_user);

//**********************renvoi liste motif rdv
$aTableauTyperdv = $objClassGenerique->renvoi_type_rdv($objClassGenerique->identifiant_entite);

$sReqActivite = "SELECT identifiant_activite, abreviation_type_activite, libelle_type_activite, color_type_activite
 FROM alaxione_type_activite 
 WHERE type_activite_supplogique='N' 
 AND identifiant_entite='".$objClassGenerique->identifiant_entite."' ORDER BY libelle_type_activite";

$aTableauActivite = $objClassGenerique->renvoi_info_requete($sReqActivite);



$daySemaine = array();
$selectType = array();

if ($validation=="ok") {
    $bsuite = 1;

    /*if( empty($day) ) {
        $bsuite = 0;
        $berror = 1;
        $sMessageError = "Veuillez cocher un ou plusieur jour de la semaine";
        $day = array();
    }
    */

    if (empty($typerdv)) {
        $bsuite = 0;
        $berror = 1;
        $sMessageError = "Veuillez cocher un ou plusieurs motif(s) de rendez vous";
        $typerdv = array();
    }

    if ($bsuite) {
        if ($idtranche != "") {
            if ($btn_update) {


                //**********************ajouter la tranche
                if ($idtranchesup=="") {
                    $sresult = $objClassGenerique->add_tranche_disponibilite_partition(
                        $idlieu,
                        $datedebut,
                        $datefin,
                        $heuredebut,
                        $heurefin,
                        $day,
                        $typerdv,
                        $id_user,
                        $idactivite,
                        $idsalle,
                        $consigne,
                        $idtranche,
                        $saction,
                        $opentwidget,
                        $opentel,
                        $opentinterpro,
                        "",
                        $opentteleconsultation,
                        $opentbackoffice,
                        false,
                        $nombreactive
                    );
                } else {
                    $sresult = $objClassGenerique->modifier_tranche_disponibilite_partition(
                        $idlieu,
                        $datedebut,
                        $datefin,
                        $heuredebut,
                        $heurefin,
                        $day,
                        $typerdv,
                        $id_user,
                        $idactivite,
                        $idsalle,
                        $consigne,
                        $idtranche,
                        $saction,
                        $opentwidget,
                        $opentel,
                        $opentinterpro,
                        $idtranchesup,
                        "",
                        $opentteleconsultation,
                        $opentbackoffice,
                        $nombreactive
                    );
                }
            }

            

            if ($sresult[0]['success'] == 1) {
                $bsucess = true;
                $sMessageSuccess=$sresult[0]['message'];
                $idtranchesup="";
            } else {
                $berror = true;
                $sMessageError = $sresult[0]['message'];
            }
        }

        $daySemaine = $day;
        $selectType = $typerdv;

        $jsEvent = "";
        $sAction = "";
        $idcalendar = "1";
    }
}
//desactiver une tranche seule
if ($actiontranche=="desa") {
    $sRequete_desactiver="UPDATE alaxione_plannig_dispo
	SET desactivation_planning_dispo='Y'
	WHERE id_plannig_dispo='".$idtranchesup."'";

    

    $bresult  = $objClassGenerique->executionRequete($sRequete_desactiver);
    if ($bresult) {
        $bsucess = true;
        $sMessageSuccess="Désactivation de la tranche reussie";
        $objClassGenerique->activation_desactivation_planning($idtranche);
    } else {
        $berror = true;
        $sMessageError = "Problème survenue pendant la desactivation de cette tranche";
    }
    $idtranchesup="";
}

//methoode de desactivation de toutes les  tranche associée
if ($actiontranche=="desaall") {

    // reupération id unique all du surplanning
    $sRequete_info_planning="Select  unique_plannig_dispo,
	id_pere_decoupe_plannig_dispo
	FROM alaxione_plannig_dispo
	WHERE id_plannig_dispo='".$idtranchesup."'";
    $aTableauInfoPlanning = $objClassGenerique->renvoi_info_requete($sRequete_info_planning);
    

    //recuperation de la liste des planning qui sont associé
    $sRequete_all_planning="Select  id_plannig_dispo,
 	id_pere_decoupe_plannig_dispo
	FROM alaxione_plannig_dispo
	WHERE unique_plannig_dispo='".$aTableauInfoPlanning[0]['unique_plannig_dispo']."'";
    $aTableauAllPlanning = $objClassGenerique->renvoi_info_requete($sRequete_all_planning);
    

    if (!empty($aTableauAllPlanning)) {
        foreach ($aTableauAllPlanning as $valeur) {
            $sRequete_desactivation ="UPDATE alaxione_plannig_dispo
			SET desactivation_planning_dispo='Y'
			WHERE id_plannig_dispo='".$valeur['id_plannig_dispo']."'";
            
            $bresult  = $objClassGenerique->executionRequete($sRequete_desactivation);
            $bsucess = true;
            $sMessageSuccess="Désactivation de toutes les tranches associées reussie";
            $objClassGenerique->activation_desactivation_planning($valeur['id_pere_decoupe_plannig_dispo']);
        }
    }

    $idtranchesup="";
}

if ($actiontranche=="supp") {
    $sRequete_desactiver="UPDATE alaxione_plannig_dispo
	SET suplogique_plannig_dispo='Y'
	WHERE id_plannig_dispo='".$idtranchesup."'";

    

    $bresult  = $objClassGenerique->executionRequete($sRequete_desactiver);
    if ($bresult) {
        $bsucess = true;
        $sMessageSuccess="Suppression de la tranche reussie";
        $objClassGenerique->activation_desactivation_planning($idtranche);
    } else {
        $berror = true;
        $sMessageError = "Problème survenue pendant la suppression de cette tranche";
    }
    $idtranchesup="";
}


//methoode de desactivation de toutes les  tranche associée
if ($actiontranche=="supaall") {

    // reupération id unique all du surplanning
    $sRequete_info_planning="Select  unique_plannig_dispo
	FROM alaxione_plannig_dispo
	WHERE id_plannig_dispo='".$idtranchesup."'";
    $aTableauInfoPlanning = $objClassGenerique->renvoi_info_requete($sRequete_info_planning);
    

    //recuperation de la liste des planning qui sont associé
    $sRequete_all_planning="Select  id_plannig_dispo 
	FROM alaxione_plannig_dispo
	WHERE unique_plannig_dispo='".$aTableauInfoPlanning[0]['unique_plannig_dispo']."'";
    $aTableauAllPlanning = $objClassGenerique->renvoi_info_requete($sRequete_all_planning);
    

    if (!empty($aTableauAllPlanning)) {
        foreach ($aTableauAllPlanning as $valeur) {
            $sRequete_desactivation ="UPDATE alaxione_plannig_dispo
			SET suplogique_plannig_dispo='Y'
			WHERE id_plannig_dispo='".$valeur['id_plannig_dispo']."'";
            
            $bresult  = $objClassGenerique->executionRequete($sRequete_desactivation);
        }

        $bsucess = true;
        $sMessageSuccess="Suppression de toutes les tranches associées reussie";
        $objClassGenerique->activation_desactivation_planning($idtranche);
    }

    $idtranchesup="";
}

if ($idtranche!="") {
    if ($actiontranche=="modification") {
        $aTableauInfoTranche = $objClassGenerique->get_info_tranche_disponibilite($idtranchesup);
    } else {
        $aTableauInfoTranche = $objClassGenerique->get_info_tranche_disponibilite($idtranche);
    }

    

    if (!empty($aTableauInfoTranche)) {
        $idlieu = $aTableauInfoTranche[0]['id_lieu_user'];
        $idactivite = $aTableauInfoTranche[0]['identifiant_activite'];
        //$typerdv = $aTableauInfoTranche[0][''];

        $aTableauDecoupeijour = explode("-", $aTableauInfoTranche[0]['date_debut_plannig_dispo']);
        $datedebut = $aTableauDecoupeijour[2]."/".$aTableauDecoupeijour[1]."/".$aTableauDecoupeijour[0];

        $aTableauPartOneDateFin = explode(" ", $aTableauInfoTranche[0]['timestamp_fin_planning_dispo']);
        $aTableauDecoupeijour = explode("-", $aTableauPartOneDateFin[0]);
        //$datefin = $aTableauDecoupeijour[2]."/".$aTableauDecoupeijour[1]."/".$aTableauDecoupeijour[0];
        $datefin=$datedebut;
        $heuredebut = $aTableauInfoTranche[0]['heure_debut_plannig_dispo'];
        $heurefin = $aTableauInfoTranche[0]['heure_fin_plannig_dispo'];
        $idsalle = $aTableauInfoTranche[0]['id_salle'];
        $consigne = $aTableauInfoTranche[0]['text_consigne_praticien'];

        
        
        $aTableauTypeRdv = $objClassGenerique->get_type_rdv_tranche_disponible($idtranche);
        foreach ($aTableauTypeRdv as $sTabType) {
            $selectType[] = $sTabType['id_type_rdv'];
        }

        if ($actiontranche=="modification") {
            $aTableauTypeRdvSupplanning = $objClassGenerique->get_type_rdv_tranche_disponible($idtranchesup);
            foreach ($aTableauTypeRdvSupplanning as $sTabType) {
                $typerdvchooice[] = $sTabType['id_type_rdv'];
            }
        } else {
            $typerdvchooice[] = array();
        }

        


        $aTableauJourSemaine = $objClassGenerique->get_jour_semaine_tranche_disponible($idunique);

        foreach ($aTableauJourSemaine as $sTabJour) {
            $daySemaine[] = $sTabJour['id_jour'];
        }
    }
}

if ($idtranchesup!="") {
    $sTitreplanningpere =" Modification du Sur-planning du ".$datedebut." de ".substr($heuredebut, 0, 5)." à ".substr($heurefin, 0, 5);
} else {
    $sTitreplanningpere ="Planning du ".$datedebut." de ".substr($heuredebut, 0, 5)." à ".substr($heurefin, 0, 5);
}

//recupération de la liste de planning en surcouche
$aTableausurplanning=$objClassGenerique->get_surplanning($idtranche);




$aTmpList = array();
$aTmpList["0"] = "Inactif";
$aTmpList["1"] = "1 Jour";
$aTmpList["2"] = "2 Jours";
$aTmpList["3"] = "3 Jours";
$aTmpList["4"] = "4 Jours";
$aTmpList["5"] = "5 Jours";
$aTmpList["6"] = "6 Jours";
$aTmpList["7"] = "7 Jours";
$aTmpList["8"] = "8 Jours";
$aTmpList["9"] = "9 Jours";
$aTmpList["10"] = "10 Jours";
$aTmpList["11"] = "11 Jours";
$aTmpList["12"] = "12 Jours";
$aTmpList["13"] = "13 Jours";
$aTmpList["14"] = "14 Jours";
$aTmpList["15"] = "15 Jours";
$aTmpList["16"] = "16 Jours";
$aTmpList["17"] = "17 Jours";
$aTmpList["18"] = "18 Jours";
$aTmpList["19"] = "19 Jours";
$aTmpList["20"] = "20 Jours";
$aTmpList["21"] = "21 Jours";
$aTmpList["22"] = "22 Jours";
$aTmpList["23"] = "23 Jours";
$aTmpList["24"] = "24 Jours";
$aTmpList["25"] = "25 Jours";
$aTmpList["26"] = "26 Jours";
$aTmpList["27"] = "27 Jours";
$aTmpList["28"] = "28 Jours";
$aTmpList["29"] = "29 Jours";
$aTmpList["30"] = "30 Jours";
$aTmpList["35"] = "35 Jours";
$aTmpList["40"] = "40 Jours";
$aTmpList["45"] = "45 Jours";
$aTmpList["50"] = "50 Jours";
$aTmpList["55"] = "55 Jours";
$aTmpList["60"] = "60 Jours";
$aTmpList["65"] = "65 Jours";
$aTmpList["70"] = "70 Jours";
$aTmpList["75"] = "75 Jours";
$aTmpList["80"] = "80 Jours";
$aTmpList["85"] = "85 Jours";
$aTmpList["90"] = "90 Jours";
$aTmpList["95"] = "95 Jours";
$aTmpList["100"] = "100 Jours";
$aTmpList["110"] = "110 Jours";
$aTmpList["120"] = "120 Jours";
$aTmpList["130"] = "130 Jours";
$aTmpList["140"] = "140 Jours";
$aTmpList["150"] = "150 Jours";
$aTmpList["160"] = "160 Jours";
$aTmpList["170"] = "170 Jours";
$aTmpList["180"] = "6 mois";
$aTmpList["210"] = "7 mois";
$aTmpList["240"] = "8 mois";
$aTmpList["270"] = "9 mois";
$aTmpList["300"] = "10 mois";
$aTmpList["330"] = "11 mois";
$aTmpList["365"] = "1 An";
$aTmpList["456"] = "1 An et 3 mois";
$aTmpList["547"] = "1 An et 6 mois";
$aTmpList["638"] = "1 An et 9 mois";
$aTmpList["730"] = "2 Ans";
$aTmpList["1095"] = "3 Ans";
$aTmpList["1460"] = "4 Ans";
$aTmpListdecalagejour=array();

foreach ($aTmpList as $key=>$value) {
    $aTmpListdecalagejour[]=array("id"=>$key,"label"=>$value);
}

if(!empty($aTableausurplanning)){
    $i=0;
    foreach($aTableausurplanning as $valeur){
        $aTableausurplanning[$i]['nbrjour_pour_acitvation_plannig_dispo']=$aTmpList[$aTableausurplanning[$i]['nbrjour_pour_acitvation_plannig_dispo']];
        $i++;
    }
}

//$bsucess = 0;
$bteleconsul=true;
$objSmarty->assign("aTmpListdecalagejour", $aTmpListdecalagejour);
$objSmarty->assign("nombreactive", $nombreactive);
$objSmarty->assign("stitreplanningpere", $sTitreplanningpere);
$objSmarty->assign("idtranchesup", $idtranchesup);
$objSmarty->assign("id_user", $id_user);
$objSmarty->assign("idlieu", $idlieu);
$objSmarty->assign("typerdv", $selectType);
$objSmarty->assign("datedebut", $datedebut);
$objSmarty->assign("datefin", $datefin);
$objSmarty->assign("heuredebut", $heuredebut);
$objSmarty->assign("heurefin", $heurefin);
$objSmarty->assign("day", $daySemaine);
$objSmarty->assign("bsucess", $bsucess);
$objSmarty->assign("berror", $berror);
$objSmarty->assign("bwarning", $bwarning);
$objSmarty->assign("sMessageError", $sMessageError);
$objSmarty->assign("sMessageWarning", $sMessageWarning);
$objSmarty->assign("sMessageSuccess", $sMessageSuccess);
$objSmarty->assign("aTableauLieu", $aTableauLieu);
$objSmarty->assign("typerdvchooice", $typerdvchooice);
$objSmarty->assign("aTableauTyperdv", $aTableauTyperdv);
$objSmarty->assign("jsEvent", $jsEvent);
$objSmarty->assign("sAction", $sAction);
$objSmarty->assign("idcalendar", $idcalendar);
$objSmarty->assign("idunique", $idunique);
$objSmarty->assign("idtranche", $idtranche);
$objSmarty->assign("saction", $saction);
$objSmarty->assign("aTableauActivite", $aTableauActivite);
$objSmarty->assign("aTableausurplanning", $aTableausurplanning);
$objSmarty->assign("idactivite", $idactivite);
$objSmarty->assign("idsalle", $idsalle);
$objSmarty->assign("bteleconsul", $bteleconsul);
$objSmarty->assign("consigne", $consigne);
$objSmarty->assign("opentwidget", $aTableauInfoTranche[0]['ouverture_widget_planning_dispo']);
$objSmarty->assign("opentel", $aTableauInfoTranche[0]['ouverture_telephone_planning_dispo']);
$objSmarty->assign("opentinterpro", $aTableauInfoTranche[0]['ouverture_interpro_planning_dispo']);
$objSmarty->assign("opentteleconsultation", $aTableauInfoTranche[0]['ouverture_teleconsult_planning_dispo']);
$objSmarty->assign("opentbackoffice", $aTableauInfoTranche[0]['ouverture_backoffice_planning_dispo']);

$objSmarty->display("modal_disponibilite_partition.tpl");
