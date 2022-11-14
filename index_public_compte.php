<?php

session_start();
$identifiant = "";
if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

include('class/class_generique.php');
require('class/class_backoffice.php');

require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

//récupération des infomations passée en post
$aVariable = array("idc","idp");
for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = htmlspecialchars($_GET[$aVariable[$i]]);
    } else {
        ${$aVariable[$i]} = "";
    }
}

$objConnexion = new class_generique('', '', '');
$bConnexion = $objConnexion->verificationConnexion(1, '');

$objClassAlaxione = new class_alaxione('', '', '');
$bresult= $objClassAlaxione->verificationConnexion(1, '');
$aTableauUrl= $objClassAlaxione->get_version__url_centre($idc);

$sUrl ="";
$aTabResult=array();
if (!empty($aTableauUrl)) {
    $sUrl = $aTableauUrl[0]['url_widget_entite'];
}

$schaine = $sUrl."?idc=".$idc."&idp=".$idp."&mode=compte";
$pagetpl="index_public_compte.tpl";

$aTableauUrl= $objClassAlaxione->get_version__url_centre($idc);
//*****************************récupération des informations sur le centre**************************
$sRequete_info_centre ="select actifwidget_entite, nom_entite, indicatif_telephonique_entite,url_centre_widget_entite from alaxione_entite where identifiant_entite='$idc'";
$aTableauInfoCentre = $objConnexion->renvoi_info_requete($sRequete_info_centre);

//recupération blogage general des widget
$sRequete_info_centre ="select valeur_champ_vrac from outil_champ_vrac where identifiant_champ_vrac='majmaintgeneral'";
$aTableauInfoBmaintenance = $objConnexion->renvoi_info_requete($sRequete_info_centre);
$bBloqueAll=false;
if (!empty($aTableauInfoBmaintenance)) {
    if ($aTableauInfoBmaintenance[0]['valeur_champ_vrac']=="ok") {
        $bBloqueAll=true;
    }
}



//on bloque le centre s'il n'est en maintenance
if ($aTableauInfoCentre[0]['actifwidget_entite']=='N' or $bBloqueAll) {
    $pagetpl = "maintenance.tpl";
    $aTableauUrl=array();
    $sUrl ="";
}


if (!empty($aTableauUrl)) {
    if (!isset($token_rdv)) {
        $token_rdv = "";
    }

    if (!isset($optin)) {
        $optin = "";
    }
    $mode="compte";
    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreact1.0anest") {
        $schaine = $objClassAlaxione->linkreactwidget."?idc=" . $idc . "&typewidget=aneth&idp=" . $idp."&token_rdv=".$token_rdv."&optin=".$optin."&mode=".$mode;
    }

    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreactcal1.1") {
        $schaine = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=normal&appointment=calendar&idp=" . $idp."&mode=".$mode;
    }



    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreact1.1") {
        $schaine = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=normal&idp=" . $idp."&token_rdv=".$token_rdv."&optin=".$optin."&mode=".$mode;
    }

    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreact1.0decision") {
        $schaine = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=question&idquestion=" . $aTableauUrl[0]['identifiant_sequence_defaut'] . "&idp=" . $idp."&token_rdv=".$token_rdv."&optin=".$optin."&mode=".$mode;
    }

    if( $aTableauUrl[0]['versionapp_entite'] == "Versionreact1.0decisioncalendar" ) {
        $schaine = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=question&appointment=calendar&idquestion=" . $aTableauUrl[0]['identifiant_sequence_defaut'] . "&idp=" . $idp."&token_rdv=".$token_rdv."&optin=".$optin."&mode=".$mode;
    }
}

if ($sUrl!="") {
    header("Location:".$schaine);
}

$objBackoffice = new class_backoffice();

$cookie = date('YmdHis').$objConnexion->random(8);

$urlsite = $objConnexion->get_urlsite($idc);

$tabInfoStructure = $objBackoffice->renvoi_info_structure($idc);

$tabListeParent = $objBackoffice->liste_lien_parente();
$tabListeCivilite = $objBackoffice->liste_civilite();

$stime = time();

//*****************************récupération des informations sur le centre**************************
$sRequete_info_centre ="select indicatif_telephonique_entite from alaxione_entite where identifiant_entite='$idc'";
$aTableauInfoCentre = $objConnexion->renvoi_info_requete($sRequete_info_centre);

$objSmarty->assign("sURLSite", "");
$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("cookie", $cookie);
$objSmarty->assign("idc", $idc);
$objSmarty->assign("idp", $idp);
$objSmarty->assign("urlsite", $urlsite);
$objSmarty->assign("stime", $stime);
$objSmarty->assign("tabListeParent", $tabListeParent);
$objSmarty->assign("tabListeCivilite", $tabListeCivilite);
$objSmarty->assign("typeWidget", $tabInfoStructure[0]['type_widget_rdv']);
$objSmarty->assign('indicatif_structure', $aTableauInfoCentre[0]['indicatif_telephonique_entite']);

$objSmarty->display($pagetpl);
