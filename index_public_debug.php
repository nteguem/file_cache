<?php

session_start();
$identifiant = "";
if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

include('class/class_generique.php');
//include('libs/smartyDM_fleet.php');
require('class/class_backoffice.php');
require_once 'class/class_alaxione.php';

require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

//if($_GET['debug']=="ok")
ini_set("display_errors", "On");


//récupération des infomations passée en post
$aVariable = array("idc","idp","bdebug");
for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = htmlspecialchars($_GET[$aVariable[$i]]);
    } else {
        ${$aVariable[$i]} = "";
    }
}

$objConnexion = new class_generique('', '', '');
$objClassAlaxione = new class_alaxione('', '', '');
$bConnexion = $objConnexion->verificationConnexion(1, '');
$bresult= $objClassAlaxione->verificationConnexion(1, '');
$aTableauUrl= $objClassAlaxione->get_version__url_centre($idc);


$sUrl ="";
$aTabResult=array();
if (!empty($aTableauUrl)) {
    $schaineURL="";
    $sUrl = $aTableauUrl[0]['url_widget_entite'];
    if (trim($sUrl)!="") {
        $schaineURL = $sUrl . "?idc=" . $idc . "&idp=" . $idp;
    }


    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreact1.0anest") {
        $schaineURL = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=anest&idp=" . $idp;
    }

    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreactcal1.1") {
        $schaineURL = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=normal&appointment=calendar&idp=" . $idp;
    }


    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreact1.1") {
        $schaineURL = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=normal&idp=" . $idp;
    }

    if ($aTableauUrl[0]['versionapp_entite'] == "Versionreact1.0decision") {
        $schaineURL = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=question&idquestion=" . $aTableauUrl[0]['identifiant_sequence_defaut'] . "&idp=" . $idp;
    }

    if( $aTableauUrl[0]['versionapp_entite'] == "Versionreact1.0decisioncalendar" ) {
        $schaineURL = $objClassAlaxione->linkreactwidget."ReactRDV/?idc=" . $idc . "&typewidget=question&appointment=calendar&idquestion=" . $aTableauUrl[0]['identifiant_sequence_defaut'] . "&idp=" . $idp."&token_rdv=".$token_rdv."&optin=".$optin."&mode=".$mode;
    }

}

if ($schaineURL!="") {
    header("Location:".$schaineURL);
    exit();
}


if ($sUrl!="") {
    header("Location:".$sUrl);
    exit();
}



$objClassAlaxione = new class_alaxione('', '', '');
$bresult= $objClassAlaxione->verificationConnexion(1, '');
$aTableauUrl= $objClassAlaxione->get_version__url_centre($idc);

$sUrl ="";
$aTabResult=array();
if (!empty($aTableauUrl)) {
    $sUrl = $aTableauUrl[0]['url_widget_entite'];
}

if ($sUrl!="") {
    header("Location:".$sUrl."?idc=".$idc."&idp=".$idp);
}

$objBackoffice = new class_backoffice();

$cookie = date('YmdHis').$objConnexion->random(8);

$urlsite = $objConnexion->get_urlsite($idc);

$phrase_bas_widget = $objBackoffice->get_information_bas_widget($idc, $idp);
$pagetpl="index_public.tpl";

//*****************************récupération des informations sur le centre**************************
$aVariableRequete_info_centre = array();
$aVariableRequete_info_centre['idc'] = $idc;
$sRequete_info_centre ="select actifwidget_entite, nom_entite, indicatif_telephonique_entite from alaxione_entite where identifiant_entite=:idc";
$aTableauInfoCentre = $objConnexion->renvoi_info_requete_new($sRequete_info_centre, $aVariableRequete_info_centre);

$bBloqueAll=false;
//recupération blogage general des widget
$aVariableRequete_info_centre2 = array();
$sRequete_info_centre ="select valeur_champ_vrac from outil_champ_vrac where identifiant_champ_vrac='majmaintgeneral'";
$aTableauInfoBmaintenance = $objConnexion->renvoi_info_requete_new($sRequete_info_centre, $aVariableRequete_info_centre2);
if (!empty($aTableauInfoBmaintenance)) {
    if ($aTableauInfoBmaintenance[0]['valeur_champ_vrac']=="ok") {
        $bBloqueAll=true;
    }
}

$tabListeParent = array();
$tabListeCivilite = array();

$tabListeParent = $objBackoffice->liste_lien_parente();
$tabListeCivilite = $objBackoffice->liste_civilite();

//on bloque le centre s'il n'est en maintenance
/*if($aTableauInfoCentre[0]['actifwidget_entite']=='N' or $bBloqueAll)
    $pagetpl="maintenance.tpl";
*/
//$urlsite = "http://www.visis.fr";
$stime = time();

$objSmarty->assign("sURLSite", "");
$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("cookie", $cookie);
$objSmarty->assign("idc", $idc);
$objSmarty->assign("idp", $idp);
$objSmarty->assign("urlsite", $urlsite);
$objSmarty->assign("phrase_bas_widget", $phrase_bas_widget);
$objSmarty->assign("stime", $stime);
$objSmarty->assign("tabListeParent", $tabListeParent);
$objSmarty->assign("tabListeCivilite", $tabListeCivilite);
$objSmarty->assign("nomEntite", $aTableauInfoCentre[0]['nom_entite']);
$objSmarty->assign('indicatif_structure', $aTableauInfoCentre[0]['indicatif_telephonique_entite']);

$objSmarty->display($pagetpl);
