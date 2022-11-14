<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

include_once('class/class_alaxione.php');
include_once('class/class_user.php');

//include_once('libs/smartyDM_fleet.php');

//if($_GET['debug']=="ok")
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


if (!$bDroit) {
    echo "<h2 align='center'>Votre connexion a expiré reconnectez vous</h2>";
    exit();
}

$objClassGenerique->redirection_centre($_COOKIE['AlaxioneAutreCentre']);

$idtranche = "";

//récupération des infomations passée en post
$aVariable = array("id_patient", "validation", "idlieu", "typerdv", "datedebut", "datefin", "heuredebut", "heurefin",
 "day", "id_user", "idunique", "idtranche", "saction", "btn_del", "btn_update", "idactivite", "idsalle", "consigne","opentwidget"
,"opentel","opentinterpro", "idbox", "id_salle");
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
$jsEvent="";
$sAction="";
$idcalendar="";

$aTableauTyperdv = array();
$aTableauInfoTranche = array();
$aTableauTypeRdv = array();
$aTableauJourSemaine = array();

$sReqLieux = "SELECT id_lieux
 FROM alaxione_salle 
 WHERE supplogique_salle='N' 
 AND id_salle='".$idbox."'";

$aTableauidLieu = $objClassGenerique->renvoi_info_requete($sReqLieux);

$idlieux = $aTableauidLieu[0]['id_lieux'];

$sReqSalleAttente = "SELECT id_salle, nom_salle
 FROM alaxione_salle 
 WHERE supplogique_salle='N'
  AND type_salle = 'attente'
 AND id_lieux='".$idlieux."'";

$aTableauSalleAttente = $objClassGenerique->renvoi_info_requete($sReqSalleAttente);



//**********************renvoi id_lieuuser
//$aTableauSalle = $objUser->renvoi_salle_attente($id_user);

//**********************renvoi liste motif rdv
$aTableauTyperdv = $objClassGenerique->renvoi_type_rdv($objClassGenerique->identifiant_entite);

$sReqActivite = "SELECT identifiant_activite, abreviation_type_activite, libelle_type_activite, color_type_activite
 FROM alaxione_type_activite 
 WHERE type_activite_supplogique='N' 
 AND identifiant_entite='".$objClassGenerique->identifiant_entite."' ORDER BY libelle_type_activite";

$aTableauActivite = $objClassGenerique->renvoi_info_requete($sReqActivite);


$reqListePraticien = "SELECT alaxione_user.nom_user as nom, alaxione_user.prenom_user as prenom, alaxione_user.id_user, alaxione_civilite.abreviation_civilite from alaxione_user
		inner join alaxione_lieu_user on alaxione_lieu_user.id_user = alaxione_user.id_user and supplogiqueid_lieu_user='N'
		inner join alaxione_lieux on alaxione_lieux.id_lieux = alaxione_lieu_user.id_lieux and lieux_supplogique='N'
		left join alaxione_civilite on alaxione_civilite.id_civilite = alaxione_user.id_civilite
		where alaxione_lieu_user.id_lieux='$idlieux' and user_supplogique='N'			 
		and actifcalendar_user='Y' and actif_user='Y'
		group by alaxione_user.id_user order by nom ";


$aTableauPraticien = $objClassGenerique->renvoi_info_requete($reqListePraticien);


$daySemaine = array();
$selectType = array();

if ($validation=="ok") {
    $bsuite=1;

    if (empty($day)) {
        $bsuite=0;
        $berror = 1;
        $sMessageError = "Veuillez cocher un ou plusieurs jour de la semaine";
        $day = array();
    }

    if (empty($typerdv)) {
        $bsuite=0;
        $berror = 1;
        $sMessageError = "Veuillez cocher un ou plusieurs motif(s) de rendez vous";
        $typerdv = array();
    }

    if ($bsuite) {

        // rechercher le id_lieu_user
        $sReqLieuxUser = "SELECT id_lieu_user
		 FROM alaxione_lieu_user
		 WHERE id_user='".$id_user."' 
		 AND id_lieux='".$idlieux."' 
		 AND supplogiqueid_lieu_user='N'";

        $aTabidLieuxUser = $objClassGenerique->renvoi_info_requete($sReqLieuxUser);

        $id_lieux = $aTabidLieuxUser[0]['id_lieu_user'];

        if ($idtranche!="") {
            if ($btn_del) {
                //**********************supprimer
                //saction : 1 = seulement la tranche selectionnée
                //saction : 2 = Toutes les tranches qui correspondent à ces critères
                if ($saction==1) {
                    $sresult = $objClassGenerique->del_tranche_disponibilite($id_user, $idunique, $idtranche);
                } else {
                    $sresult = $objClassGenerique->del_tranche_disponibilite($id_user, $idunique);
                }

                //exit();
            }

            if ($btn_update) {
                //**********************modifier
                //saction : 1 = seulement la tranche selectionnée
                //saction : 2 = Toutes les tranches qui correspondent à ces critères
                if ($saction==1) {
                    $day = array();
                    //on récupère les valeurs de la tranche
                    $sRequete_date_tranche ="SELECT date_debut_plannig_dispo from alaxione_plannig_dispo where id_plannig_dispo='".$idtranche."'";
                    $aTableauDateDebut = $objClassGenerique->renvoi_info_requete($sRequete_date_tranche);

                    //**********************récupérer id jour
                    $aTableauDecoupeijour = explode("-", $aTableauDateDebut[0]['date_debut_plannig_dispo']);
                    $ladatedebut = $aTableauDecoupeijour[2]."/".$aTableauDecoupeijour[1]."/".$aTableauDecoupeijour[0];

                    $ilejour =date("w", mktime(0, 0, 0, $aTableauDecoupeijour[1], $aTableauDecoupeijour[2], $aTableauDecoupeijour[0]));
                    $sRequete_id_jour ="SELECT id_champ_vrac from outil_champ_vrac where valeur_champ_vrac='".$ilejour."' 
					and filtre_champ_vrac='joursem'";
                    $aTableauInfoIdjour = $objClassGenerique->renvoi_info_requete($sRequete_id_jour);

                    $day[0] = $aTableauInfoIdjour[0]['id_champ_vrac'];




                    $sresult = $objClassGenerique->update_tranche_disponibilite_bak(
                        $id_user,
                        $id_lieux,
                        $ladatedebut,
                        $ladatedebut,
                        $heuredebut,
                        $heurefin,
                        $day,
                        $typerdv,
                        $idunique,
                        $idactivite,
                        $idtranche,
                        $idsalle,
                        $consigne,
                        0,
                        $opentwidget,
                        $opentel,
                        $opentinterpro,
                        $idbox
                    );
                } else {
                    $sresult = $objClassGenerique->update_tranche_disponibilite_bak(
                        $id_user,
                        $id_lieux,
                        $datedebut,
                        $datefin,
                        $heuredebut,
                        $heurefin,
                        $day,
                        $typerdv,
                        $idunique,
                        $idactivite,
                        "",
                        $idsalle,
                        $consigne,
                        0,
                        $opentwidget,
                        $opentel,
                        $opentinterpro,
                        $idbox
                    );
                }
            }
        } else {

            //**********************ajouter la tranche

            $sresult = $objClassGenerique->add_tranche_disponibilite(
                $id_lieux,
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
                0,
                $opentwidget,
                $opentel,
                $opentinterpro,
                $idbox
            );
        }
            
        if ($sresult[0]['success']==1) {
            $bsucess = $sresult[0]['success'];
        } else {
            $berror = $sresult[0]['success'];
            $sMessageError = $sresult[0]['message'];
        }
    }

    $daySemaine = $day;
    $selectType = $typerdv;

    $jsEvent="";
    $sAction="";
    $idcalendar="1";
}


if ($idtranche!="") {
    $aTableauInfoTranche = $objClassGenerique->get_info_tranche_disponibilite($idtranche);



    if (!empty($aTableauInfoTranche)) {
        $idlieu = $aTableauInfoTranche[0]['id_lieu_user'];
        $idactivite = $aTableauInfoTranche[0]['identifiant_activite'];
        //$typerdv = $aTableauInfoTranche[0][''];

        $aTableauDecoupeijour = explode("-", $aTableauInfoTranche[0]['date_debut_plannig_dispo']);
        $datedebut = $aTableauDecoupeijour[2]."/".$aTableauDecoupeijour[1]."/".$aTableauDecoupeijour[0];

        $aTableauPartOneDateFin = explode(" ", $aTableauInfoTranche[0]['timestamp_fin_planning_dispo']);
        $aTableauDecoupeijour = explode("-", $aTableauPartOneDateFin[0]);
        $datefin = $aTableauDecoupeijour[2]."/".$aTableauDecoupeijour[1]."/".$aTableauDecoupeijour[0];

        $heuredebut = $aTableauInfoTranche[0]['heure_debut_plannig_dispo'];
        $heurefin = $aTableauInfoTranche[0]['heure_fin_plannig_dispo'];
        $idsalle = $aTableauInfoTranche[0]['id_salle'];
        $idbox = $aTableauInfoTranche[0]['id_box'];
        $consigne = $aTableauInfoTranche[0]['text_consigne_praticien'];
        $id_user = $aTableauInfoTranche[0]['id_user'];


        
        $aTableauTypeRdv = $objClassGenerique->get_type_rdv_tranche_disponible($idtranche);

        foreach ($aTableauTypeRdv as $sTabType) {
            $selectType[] = $sTabType['id_type_rdv'];
        }
        


        $aTableauJourSemaine = $objClassGenerique->get_jour_semaine_tranche_disponible($idunique);

        foreach ($aTableauJourSemaine as $sTabJour) {
            $daySemaine[] = $sTabJour['id_jour'];
        }
    }
} else {
    $aTableauInfoTranche[0]['ouverture_widget_planning_dispo']='Y';
    $aTableauInfoTranche[0]['ouverture_telephone_planning_dispo']='Y';
    $aTableauInfoTranche[0]['ouverture_interpro_planning_dispo']='Y';
}
$isOplus = $objClassGenerique->is_module_oplus_actif($objClassGenerique->identifiant_entite);

$bblocaction=false;

if ($isOplus) {
    $bblocaction=true;
}
//$bsucess = 0;

$objSmarty->assign("dir", "");
$objSmarty->assign("bblocaction", $bblocaction);
$objSmarty->assign("id_user", $id_user);
$objSmarty->assign("idbox", $idbox);
$objSmarty->assign("idlieu", $idlieu);
$objSmarty->assign("id_lieux", $idlieux);
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
//$objSmarty->assign("aTableauSalle",$aTableauSalle);
$objSmarty->assign("aTableauTyperdv", $aTableauTyperdv);
$objSmarty->assign("aTableauPraticien", $aTableauPraticien);
$objSmarty->assign("aTableauSalleAttente", $aTableauSalleAttente);
$objSmarty->assign("jsEvent", $jsEvent);
$objSmarty->assign("sAction", $sAction);
$objSmarty->assign("idcalendar", $idcalendar);
$objSmarty->assign("idunique", $idunique);
$objSmarty->assign("idtranche", $idtranche);
$objSmarty->assign("saction", $saction);
$objSmarty->assign("aTableauActivite", $aTableauActivite);
$objSmarty->assign("idactivite", $idactivite);
$objSmarty->assign("idsalle", $idsalle);
$objSmarty->assign("consigne", $consigne);
$objSmarty->assign("opentwidget", $aTableauInfoTranche[0]['ouverture_widget_planning_dispo']);
$objSmarty->assign("opentel", $aTableauInfoTranche[0]['ouverture_telephone_planning_dispo']);
$objSmarty->assign("opentinterpro", $aTableauInfoTranche[0]['ouverture_interpro_planning_dispo']);

$objSmarty->display("modal_disponibilite_box.tpl");
