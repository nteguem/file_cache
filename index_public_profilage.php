<?php

session_start();
$identifiant = "";
if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

include('class/class_alaxione.php');
require_once('class/class_backoffice.php');
require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

//récupération des infomations passée en post
$aVariable = array("idunique", "idc", "idp", "idl", "idu", "idm");
for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$objConnexion = new class_alaxione('', '', '');
$bConnexion = $objConnexion->verificationConnexion(1, '');

$objBackoffice = new class_backoffice();

$cookie = date('YmdHis').$objConnexion->random(8);

$urlsite = $objConnexion->get_urlsite($idc);

$phrase_bas_widget = $objBackoffice->get_information_bas_widget($idc, $idp);
$pagetpl="index_public_profilage.tpl";

//*****************************récupération des informations sur le centre**************************
$sRequete_info_centre ="select actifwidget_entite, nom_entite from alaxione_entite where identifiant_entite='$idc'";
$aTableauInfoCentre = $objConnexion->renvoi_info_requete($sRequete_info_centre);

$bBloqueAll=false;
//recupération blogage general des widget
$sRequete_info_centre ="select valeur_champ_vrac from outil_champ_vrac where identifiant_champ_vrac='majmaintgeneral'";
$aTableauInfoBmaintenance = $objConnexion->renvoi_info_requete($sRequete_info_centre);
if (!empty($aTableauInfoBmaintenance)) {
    if ($aTableauInfoBmaintenance[0]['valeur_champ_vrac']=="ok") {
        $bBloqueAll=true;
    }
}

$aTableauInfoprofilagee = $objConnexion->cb_info_profilage($idunique);



//on bloque le centre s'il n'est en maintenance
if ($aTableauInfoCentre[0]['actifwidget_entite']=='N' or $bBloqueAll) {
    $pagetpl="maintenance.tpl";
}

$stime = time();

$sTitreNon = "Bonjour ".$aTableauInfoprofilagee[0]['abreviation_civilite']." ".$aTableauInfoprofilagee[0]['nompatient'];


$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("cookie", $cookie);
$objSmarty->assign("sTitreNon", $sTitreNon);
$objSmarty->assign("idunique", $idunique); //identifiant unique
$objSmarty->assign("urlsite", $urlsite);
$objSmarty->assign("phrase_bas_widget", $phrase_bas_widget);
$objSmarty->assign("stime", $stime);
$objSmarty->assign("nomEntite", $aTableauInfoCentre[0]['nom_entite']);

$objSmarty->display($pagetpl);
