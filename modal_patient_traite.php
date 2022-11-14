<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

include_once('class/class_alaxione.php');
include_once('class/class_user.php');

//include_once('libs/smartyDM_fleet.php');

require('libs/Smarty.class.php');

//if($_GET['debug']=="ok")
ini_set("display_errors", "On");

$sCookieAdv = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $sCookieAdv = $_COOKIE['cookie_alaxione'];
}

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

//récupération des infomations passée en post
$aVariable = array("idrdv", "validation", "bsucess", "message_transmis");

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

$berror=false;
$sMessageError="";

if ($validation=="ok") {
    $sRequete_maj_message_transmis = "UPDATE alaxione_prise_rendez_vous set message_fin_prise_rendez_vous='".addslashes($message_transmis)."'
	WHERE id_prise_rendez_vous='".$idrdv."'";

    $bsucess = $objClassGenerique->executionRequete($sRequete_maj_message_transmis);
}

//$bsucess=false;

$aTabInfoRDV = $objClassGenerique->renvoi_info_rdv($idrdv, "id_prise_rendez_vous", false);

$message_transmis = $aTabInfoRDV[0]['message_fin_prise_rendez_vous'];


$objSmarty->assign("message_transmis", $message_transmis);
$objSmarty->assign("idrdv", $idrdv);
$objSmarty->assign("bsucess", $bsucess);
$objSmarty->assign("berror", $berror);
$objSmarty->assign("sMessageError", $sMessageError);

$objSmarty->display("modal_patient_traite.tpl");
