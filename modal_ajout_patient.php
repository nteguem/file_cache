<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

ini_set("display_errors", "ON");

include('class/class_alaxione.php');
include_once('class/class_oplus.php');
include_once('class/class_backoffice.php');
include_once('class/class_user.php');
include_once('class/class_widget.php');
//include('libs/smartyDM_fleet.php');
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


$objBackoffice = new class_backoffice();
$objWidget = new class_widget();

//récupération des infomations passée en post
$aVariable = array("nom", "prenom", "mode", "idpatient", "tel", "age", "retour");


for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$modif = false;
if ($idpatient!="") {
    $modif = true;
}

$aTableauCivilite = $objClassGenerique->renvoi_civilite();

$objSmarty->assign("aTableauCivilite", $aTableauCivilite);
$objSmarty->assign("nom", $nom);
$objSmarty->assign("prenom", $prenom);
$objSmarty->assign("mode", $mode);
$objSmarty->assign("tel", $tel);
$objSmarty->assign("age", $age);
$objSmarty->assign("enmodif", $modif);
$objSmarty->assign("retour", $retour);
$objSmarty->assign("interpro", "");

$objSmarty->display("modal_ajout_patient.tpl");
