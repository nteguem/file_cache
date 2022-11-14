<?php
ini_set('display_errors', 'off');
$identifiant = '';
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
/*
if($_GET['debug']=="ok")
    ini_set("display_errors","On");
*/

//récupération des infomations passée en post
$aVariable = array('token');
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
$guid = "";
$civilite_nom_prenom_patient = "";
$nom_centre = "";

if ($token == '') {
    $sTxtEchec = "Le lien du consentement profilage n'est pas valide, veuillez copier coller le lien reçu par mail.";
}

$tabToken = $objClassGenerique->check_token_link($token);
if (empty($tabToken)) {
    $sTxtEchec = "Le délai de validité du lien est expiré, veuillez contacter votre centre pour renouveler la procédure.";
} else {

    $aVariableRequete_info = array();
    $aVariableRequete_info['identifiant_patient'] = $tabToken[0]['identifiant_patient'];
    $sRequete_info = "SELECT abreviation_civilite, nom_user, prenom_user, nom_entite
        FROM alaxione_user 
        INNER JOIN alaxione_civilite ON (alaxione_user.id_civilite = alaxione_civilite.id_civilite)
        INNER JOIN alaxione_entite ON (alaxione_user.identifiant_entite = alaxione_entite.identifiant_entite)
        WHERE identifiant_user = :identifiant_patient 
        AND user_supplogique = 'N'";

    $aTabInfo = $objClassGenerique->renvoi_info_requete_new($sRequete_info, $aVariableRequete_info);
    $civilite_nom_prenom_patient = $aTabInfo[0]['abreviation_civilite']." ".$aTabInfo[0]['nom_user']." ".$aTabInfo[0]['prenom_user'];
    $nom_centre = $aTabInfo[0]['nom_entite'];
}

$objSmarty->assign("profilage_guid_user", $guid);
$objSmarty->assign("token", $token);
$objSmarty->assign("sTxtEchec", $sTxtEchec);
$objSmarty->assign("civilite_nom_prenom_patient", $civilite_nom_prenom_patient);
$objSmarty->assign("nom_centre", $nom_centre);

$objSmarty->display("index_validation_profilage.tpl");
