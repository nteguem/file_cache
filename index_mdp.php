<?php
ini_set("display_errors", "On");
$identifiant = "";
if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

include('class/class_alaxione.php');
include('config/alaxioneconf.php');
require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

//récupération des infomations passée en post
$aVariable = array("token");
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

$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(1, "");

$sTxtEchec = "";
if ($token == '') {
    $sTxtEchec = "Le lien de réinitialisation de votre mot de passe n'est pas valide, veuillez copier coller le lien reçu par mail ou contactez votre administrateur.";
}

$tabToken = $objClassGenerique->check_token_link($token);
if (empty($tabToken)) {
    $sTxtEchec = "Le délai de validité du lien est expiré, veuillez contacter votre administrateur pour renouveler la procédure";
    $guid = "";
} else {
    $guid = $tabToken[0]['identifiant_patient'];
}

$objSmarty->assign("token", $token);
$objSmarty->assign("mdp_guid_user", $guid);
$objSmarty->assign("sTxtEchec", $sTxtEchec);
$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("iLogo", "img/logo-alaxione.png");

$objSmarty->display("index_change_mdp.tpl");
