<?php
session_start();

if (isset($_COOKIE['cookie_alaxione_itr'])) {
    $identifiant = $_COOKIE['cookie_alaxione_itr'];
} else {
    $identifiant = "";
}

include('class/class_generique.php');

require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

//récupération des infomations passée en post
$aVariable = array("validation","log","pwd","dir","centre");
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

$MessageConnexion="";
$time =86400;
if ($validation == 'ok') {
    $objConnexion = new class_generique($log, $pwd, "");
    $bConnexion = $objConnexion->verificationConnexion(1, $identifiant, "2cdferz");

    //session_start();
    if ($bConnexion) {
        header('Set-Cookie: cookie_alaxione_itr=', $objConnexion->accesdirect.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header("Location:main_itr.php");
        return false;
    } else {
        $MessageConnexion = "Erreur d'authentification !!";
    }
} else {
    if (isset($_COOKIE['cookie_alaxione_itr'])) {
        $objConnexion= new class_generique("", "", "");
        $bConnexion = $objConnexion->verificationConnexion(1, $identifiant);

        if ($bConnexion) {
            header("Location:main_itr.php");
        }
    } else {
        $objConnexion= new class_generique("", "", "");
        $bConnexion = $objConnexion->verificationConnexion(0, $identifiant);
    }
}

$sRequete_recupe_centre="select identifiant_entite,nom_entite from alaxione_entite where entite_supplogique='N'";
$aTabstructure =  $objConnexion->renvoi_info_requete($sRequete_recupe_centre);


$aTableau_champ = array();
$aTableau_valeur = array();

$objSmarty->assign("centre", "2cdferz");
$objSmarty->assign("MessageConnexion", $MessageConnexion);
$objSmarty->assign("aTabstructure", $aTabstructure);
$objSmarty->assign("sURLSite", "");
$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("iLogo", "img/logo-alaxione-blanc.jpg");
$objSmarty->assign("sLostPassword", "index.php?dir=lostpassword");
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
