<?php
session_start();
ini_set('display_errors', "ON");
include('class/class_generique.php');
include('config/alaxioneconf.php');

require('libs/Smarty.class.php');
//include('libs/smartyDM_fleet.php');
//$objSmarty = new smartyDM_fleet("templates/VersionA");

$objSmarty = new Smarty();

$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

//récupération des infomations passée en post
$aVariable = array("validation","log","pwd","dir","centre","administration");
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



$objConnexion= new class_generique("", "", "");
$bConnexion = $objConnexion->verificationConnexion(0, $_COOKIE);

$aVariable = $objConnexion->nettoie_get_post($aVariable);

$sRequete_select_centre ="SELECT identifiant_entite,
nom_entite,
raccourcir_admin_entite,
urlsite_entite,
 id_entite 
FROM alaxione_entite 
WHERE entite_supplogique='N' and raccourcir_admin_entite='".$administration."' order by info_filtre_entite,nom_entite";

if (trim($administration)!="") {
    $aTableauRetour =  $objConnexion->renvoi_info_requete_new($sRequete_select_centre);
}

$objSmarty->assign("aTableauRetour", $aTableauRetour);
$objSmarty->assign("dir", $dir);

$objSmarty->display("liste_centre_client.tpl");
