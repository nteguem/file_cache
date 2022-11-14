<?php
ini_set("display_errors", "On");
session_start();

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

$time =86400;

$MessageConnexion="";

if ($validation == 'ok') {
    $objConnexion = new class_alaxione($log, $pwd, "");
    $bConnexion = $objConnexion->verificationConnexion(1, $identifiant, $centre);
    $guid = $objConnexion->accesdirect;
    //session_start();
    if ($bConnexion) {
        $objConnexion->rajout_guid_user($objConnexion->id_user);
        header('Set-Cookie: cookie_alaxione='.$guid.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: AlaxioneAutreCentre='.$objConnexion->identifiant_entite.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-idc='.$objConnexion->identifiant_entite.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-login='.$log.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-token='.$guid.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: linkprecedent_alaxione=mon_compte;Max-Age='.$time.'; SameSite=None; Secure',false);
        header("Location:main.php");
        return false;
    } else {
        $MessageConnexion = "Erreur d'authentification !!";
    }
} else {
    if (isset($_COOKIE['cookie_alaxione'])) {
        $objConnexion= new class_alaxione("", "", "");
        $bConnexion = $objConnexion->verificationConnexion(1, $_COOKIE['cookie_alaxione']);

        if ($bConnexion) {
            $objConnexion->rajout_guid_user($objConnexion->id_user);
            header("Location:main.php");
        }
    } else {
        $objConnexion= new class_alaxione("", "", "");
        if (!isset($_COOKIE['cookie_alaxione'])) {
            $_COOKIE['cookie_alaxione']="";
        }
        $bConnexion = $objConnexion->verificationConnexion(0, $_COOKIE['cookie_alaxione']);
    }
}

if ($administration!="") {
    header('Set-Cookie: cookie_centre='.$administration.';Max-Age='.$time.'; SameSite=None; Secure',false);
} else {
    $administration = "";
    if (isset($_COOKIE['cookie_centre'])) {
        $administration = $_COOKIE['cookie_centre'];
    }
}


if (trim($administration)!="") {
    $sRequete_recupe_centre="select identifiant_entite,nom_entite from alaxione_entite where entite_supplogique='N'and raccourcir_admin_entite='$administration'";
    $aTabstructure =  $objConnexion->renvoi_info_requete($sRequete_recupe_centre);
    $centre=$aTabstructure[0]['identifiant_entite'];
}

$sRequete_recupe_centre="select identifiant_entite,nom_entite from alaxione_entite where entite_supplogique='N'";
$aTabstructure =  $objConnexion->renvoi_info_requete($sRequete_recupe_centre);

$aTableau_champ = array();
$aTableau_valeur = array();

$objSmarty->assign("leserveur", $sAlaxioneLeServeur);
$objSmarty->assign("centre", $centre);
$objSmarty->assign("MessageConnexion", $MessageConnexion);
$objSmarty->assign("aTabstructure", $aTabstructure);
$objSmarty->assign("sURLSite", "");
$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("iLogo", "img/logo-alaxione.png");
$objSmarty->assign("sLostPassword", "update_mdp.php");
$objSmarty->assign("sRegister", "index.php?dir=register");
$objSmarty->assign("sTitleRecupPass", "Récupération de mot de passe");
$objSmarty->assign("sTxtRecupPass", "Mot de passe oublié ?");
$objSmarty->assign("sTxtIdentifiant", "Identifiant");
$objSmarty->assign("sTxtEmail", "Email");
$objSmarty->assign("sTxtMDP", "Mot de passe");
$objSmarty->assign("sTxtSeSouvenir", "Se souvenir de moi");
$objSmarty->assign("sTxtConnecter", "Se connecter");
$objSmarty->assign("sTxtConnexionEnCours", "Connexion en cours...");
$objSmarty->assign("sTxtChampsObligatoire", "Vous devez remplir tous les champs obligatoires");
$objSmarty->assign("sTxtEchec", "Echec !");
$objSmarty->assign("sTxtCreerUnCompte", "CREER UN COMPTE");
$objSmarty->assign("sTxtConnectezVousAVotreCompte", "CONNECTEZ VOUS A VOTRE COMPTE");
$objSmarty->assign("sTxtVerifChampsObligatoire", "Veuillez vérifier les champs obligatoires.");
$objSmarty->assign("dir", $dir);

$objSmarty->display("index.tpl");
