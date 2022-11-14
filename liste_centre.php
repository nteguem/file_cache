<?php
session_start();
//ini_set('display_errors',"ON");

exit();
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

/*
if($_GET['debug']=="ok")
    ini_set("display_errors","On");
*/

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

$sRequete_select_centre ="SELECT identifiant_entite,
nom_entite,
raccourcir_admin_entite,
urlsite_entite,
id_entite
FROM alaxione_entite 
WHERE entite_supplogique='N' order by info_filtre_entite,nom_entite";
$aTableauRetour =  $objConnexion->renvoi_info_requete($sRequete_select_centre);

$objSmarty->assign("aTableauRetour", $aTableauRetour);
$objSmarty->assign("dir", $dir);

$objSmarty->display("liste_centre_client.tpl");
