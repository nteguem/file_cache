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
$aVariable = array("id_patient", "validation", "idlieu", "typerdv", "datedebut", "datefin", "heuredebut", "heurefin","idactivite","idtranche","consigne",
 "day", "id_user", "idunique", "idtranche", "saction", "btn_del", "btn_update", "idactivite", "idsalle", "consigne","opentwidget"
,"opentel","opentinterpro", "idbox","idplanning_type");
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

$aTableauLieu = array();
$aTableauTyperdv = array();
$aTableauInfoTranche = array();
$aTableauTypeRdv = array();
$aTableauJourSemaine = array();


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
    $identifianjour="";
    if (!empty($day)) {
        foreach ($day as $valeur) {
            $identifianjour.=$valeur.";";
        }
    }

    $identifianrdv="";
    if (!empty(typerdv)) {
        foreach (typerdv as $valeur) {
            $identifianrdv.=$valeur.";";
        }
    }

    $sRequete_enreg_type="INSERT alaxione_description_type_planning set
	id_planning_type='".$idplanning_type."',
	jour_description_type_planning ='".$identifianjour."',
	heuredebut_description_type_planning ='".$heuredebut."',
	heurefin_description_type_planning ='".$heurefin."',
	listemotifrdv_description_type_planning ='".$identifianrdv."',
	idl_ieu='".$idlieu."',
	id_box ='".$idbox."',
	ouverture_telephone ='".$opentel."',
	ouverture_widget ='".$opentwidget."',
	ouverture_interpro ='".$opentinterpro."',
	idactivivite ='".$idactivite."',
	id_salle ='".$idsalle."'";

    $bwarning=true;
    $sMessageWarning=$sRequete_enreg_type;
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
$bActionmodif=true;

if ($idtranche!="") {
    $aTableauListesurplanning = $objClassGenerique->get_surplanning($idtranche);

    if (!empty($aTableauListesurplanning)) {
        $bActionmodif=false;
    }
}
if ($isOplus) {
    $bblocaction=true;
}
//$bsucess = 0;

$aTableauplanning=array();

$objSmarty->assign("dir", "");
$objSmarty->assign("aTableauplanning", $aTableauplanning);
$objSmarty->assign("bblocaction", $bblocaction);
$objSmarty->assign("id_user", $id_user);
$objSmarty->assign("idbox", $idbox);
$objSmarty->assign("idactivite", $idactivite);
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
$objSmarty->assign("aTableauLieu", $aTableauLieu);
//$objSmarty->assign("aTableauSalle",$aTableauSalle);
$objSmarty->assign("aTableauTyperdv", $aTableauTyperdv);
$objSmarty->assign("jsEvent", $jsEvent);
$objSmarty->assign("sAction", $sAction);
$objSmarty->assign("idcalendar", $idcalendar);
$objSmarty->assign("idplanning_type", $idplanning_type);
$objSmarty->assign("idunique", $idunique);
$objSmarty->assign("idtranche", $idtranche);
$objSmarty->assign("saction", $saction);
$objSmarty->assign("aTableauActivite", $aTableauActivite);
$objSmarty->assign("bActionmodif", $bActionmodif);
$objSmarty->assign("idsalle", $idsalle);
$objSmarty->assign("consigne", $consigne);
$objSmarty->assign("opentwidget", $aTableauInfoTranche[0]['ouverture_widget_planning_dispo']);
$objSmarty->assign("opentel", $aTableauInfoTranche[0]['ouverture_telephone_planning_dispo']);
$objSmarty->assign("opentinterpro", $aTableauInfoTranche[0]['ouverture_interpro_planning_dispo']);

$objSmarty->display("modal_type_disponibilite.tpl");
