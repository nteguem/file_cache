<?php

session_start();

if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

ini_set("display_errors", "On");

include('class/class_generique.php');
require('class/class_backoffice.php');
include('config/alaxioneconf.php');
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
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$objConnexion = new class_generique('', '', '');
$bConnexion = $objConnexion->verificationConnexion(1, '');

$objBackoffice = new class_backoffice();

$cookie = date('YmdHis').$objConnexion->random(8);

$urlsite = $objConnexion->get_urlsite($idc);

$phrase_bas_widget = $objBackoffice->get_information_bas_widget($idc, $idp);
$pagetpl="index_borne.tpl";

//*****************************récupération des informations sur le centre**************************
$sRequete_info_centre ="select actifwidget_entite from alaxione_entite where identifiant_entite='$idc'";
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

$tabListeParent = array();
$tabListeCivilite = array();

$tabListeParent = $objBackoffice->liste_lien_parente();
$tabListeCivilite = $objBackoffice->liste_civilite();

//on bloque le centre s'il n'est en maintenance
if ($aTableauInfoCentre[0]['actifwidget_entite']=='N' or $bBloqueAll) {
    $pagetpl="maintenance.tpl";
}

$stime = time();


$tabInfoStructure = array();

$sRequete = "SELECT nom_entite, raison_sociale_entite, num_siren_entite, adresse_entite, 
code_postal_entite, ville_entite, tel_entite, fax_entite, email_entite, site_logo_entite, 
urlsite_entite, titre_site_entite, keyword_site_entite, description_site_entite,
raccourcir_admin_entite, message_accueil_borne, image_accueil_borne, message_final_borne
FROM alaxione_entite
WHERE entite_supplogique='N' 
and identifiant_entite='".$idc."'";

$tabInfoStructure = $objBackoffice->objClassGenerique->renvoi_info_requete($sRequete);


$slogo = $tabInfoStructure[0]['image_accueil_borne'];
$smessageaccueil = $tabInfoStructure[0]['message_accueil_borne'];
$smessagefinal = $tabInfoStructure[0]['message_final_borne'];


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
$objSmarty->assign("is_slogo", $slogo);
$objSmarty->assign("slogo", $sLinkAlaxione.'/img_front_end/'.$slogo);
$objSmarty->assign("smessageaccueil", $smessageaccueil);
$objSmarty->assign("smessagefinal", $smessagefinal);


$objSmarty->display($pagetpl);
