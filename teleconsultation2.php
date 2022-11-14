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
require_once('stripe/init.php');
include('class/class_alaxione_stripe.php');

$objStripe = new class_alaxione_stripe();

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');


//$this->ClasseGenerique = new class_alaxione('', '', '');
//$this->ClasseGenerique->verificationConnexion(0, '');


//récupération des infomations passée en post
$aVariable = array( "validation", "token", "identifiant_user");
for ($i = 0; $i < count($aVariable); $i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

if (!empty($_POST)) {
    for ($i = 0; $i < count($aVariable); $i++) {
        if (isset($_POST[$aVariable[$i]])) {
            ${$aVariable[$i]} = $_POST[$aVariable[$i]];
        } else {
            ${$aVariable[$i]} = "";
        }
    }
}

$successMessage = "";
$errorMessage = "";

echo $token;

if (!empty($_POST["token-account"])) {
    $email_praticien = 'blabla@blabla.fr';

    $tabInfo = array(
        'email' => $email_praticien,
        'account_token' =>  $_POST['token-account'],
        'person_token' =>  $_POST['token-person']
    );


    $stripeResponse = $objStripe->creerCompte($tabInfo);

    echo"<pre>";
    print_r($stripeResponse);
    echo"</pre>";

    $acct = $stripeResponse['id'];

    $stripeResponse = $objStripe->creerPersonne($acct, $_POST['token-person']);

    echo"<pre>";
    print_r($stripeResponse);
    echo"</pre>";

    $stripeResponse = $objStripe->creerBanque($acct, $_POST["token-bank"]);

    echo"<pre>";
    print_r($stripeResponse);
    echo"</pre>";

    if ($_FILES['carte_identite_recto_file'] != "") {
        $stripeResponse = $objStripe->uploadFichier($acct, $_FILES['carte_identite_recto_file'], "identity_document");

        echo"<pre>";
        print_r($stripeResponse);
        echo"</pre>";
    }
    if ($_FILES['carte_identite_verso_file'] != "") {
        $stripeResponse = $objStripe->uploadFichier($acct, $_FILES['carte_identite_verso_filee'], "identity_document");

        echo"<pre>";
        print_r($stripeResponse);
        echo"</pre>";
    }



    $sRequete_update ="INSERT alaxione_user_infosup 
    SET identifiant_user = '".$identifiant_user."',
    cle_user_infosup = 'identifiant_compte_stripe',
    valeur_user_infosup='".$acct."' 
    ON DUPLICATE KEY UPDATE valeur_user_infosup = '".$acct."', 
    suplogique_user_infosup = 'N'";
    $this->executionRequete($sRequete_update);
}
//dev
//$key_stripe = "pk_test_use2WYbXDCePrsWMdf1YXElr00LMqNAH6y";
//prod
$key_stripe = "pk_live_98nURPDMskVJoZpeXOfYDfm100CcPiPUwj";


$objSmarty->assign("identifiant_user", $identifiant_user);
$objSmarty->assign("key_stripe", $key_stripe);
$objSmarty->assign("successMessage", $successMessage);
$objSmarty->assign("errorMessage", $errorMessage);

$objSmarty->display("teleconsultation2.tpl");
