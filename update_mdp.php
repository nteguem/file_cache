<?php
session_start();

$identifiant = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

include('class/class_generique.php');
include('config/alaxioneconf.php');
include('libs/smartyDM_fleet.php');

$objsmarty = new smartyDM_fleet("templates/VersionA");

//récupération des infomations passée en post
$aVariable = array("validation","log","pwd","dir","centre","administration","zf1475");
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



$aTableau_champ = array();
$aTableau_valeur = array();

$bmodifmdp=false;
$sTxtConnectezVousAVotreCompte=" RECEVOIR UN MOT DE PASSE";
if ($zf1475!="") {
    $bmodifmdp=true;
}

$objsmarty->assign("leserveur", $sAlaxioneLeServeur);
$objsmarty->assign("centre", $centre);
$objsmarty->assign("bmodifmdp", $bmodifmdp);
$objsmarty->assign("zf1475", $zf1475);
$objsmarty->assign("MessageConnexion", $MessageConnexion);
$objsmarty->assign("aTabstructure", $aTabstructure);
$objsmarty->assign("sURLSite", "");
$objsmarty->assign("sSite", "Alaxione");
$objsmarty->assign("iLogo", "img/logo-alaxione-blanc.jpg");
$objsmarty->assign("sLostPassword", "index.php?dir=lostpassword");
$objsmarty->assign("sRegister", "index.php?dir=register");
$objsmarty->assign("sTitleRecupPass", "Récupération de mot de passe");
$objsmarty->assign("sTxtRecupPass", "Mot de passe oublié ?");
$objsmarty->assign("sTxtIdentifiant", "Identifiant");
$objsmarty->assign("sTxtEmail", "Email");
$objsmarty->assign("sTxtMDP", "Mot de passe");
$objsmarty->assign("sTxtSeSouvenir", "Se souvenir de moi");
$objsmarty->assign("sTxtConnecter", "Se connecter");
$objsmarty->assign("sTxtConnexionEnCours", "Connexion en cours...");
$objsmarty->assign("sTxtChampsObligatoire", "Vous devez remplir tous les champs obligatoires");
$objsmarty->assign("sTxtEchec", "Echec !");
$objsmarty->assign("sTxtCreerUnCompte", "CREER UN COMPTE");
$objsmarty->assign("sTxtConnectezVousAVotreCompte", $sTxtConnectezVousAVotreCompte);
$objsmarty->assign("sTxtVerifChampsObligatoire", "Veuillez vérifier les champs obligatoires.");
$objsmarty->assign("dir", $dir);

$objsmarty->display("update_mdp.tpl");
