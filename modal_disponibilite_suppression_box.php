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

//récupération des infomations passée en post
$aVariable = array("id_user", "id_salle", "datedebut", "datefin", "validation","tabdateduplique");
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

//init variables
$bsucess = 0;
$berror = 0;
$bwarning = 0;
$sMessageError = "";
$sMessageWarning = "";

if ($validation=="ok") {
    $aTableauDecoupeijour = explode("/", $datedebut);
    $ladatedebut = $aTableauDecoupeijour[2]."-".$aTableauDecoupeijour[1]."-".$aTableauDecoupeijour[0];

    $aTableauDecoupeijour = explode("/", $datefin);
    $ladatefin = $aTableauDecoupeijour[2]."-".$aTableauDecoupeijour[1]."-".$aTableauDecoupeijour[0];

    $sresult = $objClassGenerique->del_tranche_disponibilite_date_box($id_salle, $ladatedebut, $ladatefin);  

    if ($sresult[0]['success']==1) {
        $bsucess = $sresult[0]['success'];
    } else {
        $berror = $sresult[0]['success'];
        $sMessageError = $sresult[0]['message'];
    }
}


$objSmarty->assign("id_user", $id_user);
$objSmarty->assign("id_salle", $id_salle);
$objSmarty->assign("datedebut", $datedebut);
$objSmarty->assign("datefin", $datefin);
$objSmarty->assign("bsucess", $bsucess);
$objSmarty->assign("berror", $berror);
$objSmarty->assign("bwarning", $bwarning);
$objSmarty->assign("sMessageError", $sMessageError);
$objSmarty->assign("sMessageWarning", $sMessageWarning);

$objSmarty->display("modal_disponibilite_suppression_box.tpl");
