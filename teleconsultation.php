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
$aVariable = array( "validation", "stripeToken");
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

echo $stripeToken;

if (!empty($_POST["stripeToken"])) {

    //récupération des info du patient et le montant du paiement
    /*$sRequete_info = "SELECT
        FROM
        WHERE ";

    $aTableauInfoPatient = $this->ClasseGenerique->renvoi_info_requete($sRequete_info);
    */
    /*$sRequete_info = "SELECT
    FROM
    WHERE ";

    $aTableauInfoPrestation = $this->ClasseGenerique->renvoi_info_requete($sRequete_info);

    if(!empty($aTableauInfoPatient) && !empty($aTableauInfoPrestation)){

        $email_patient = $aTableauInfoPatient[0]['email_patient'];
        $montant_prestation = $aTableauInfoPrestation[0]['montant_prestation'];

    }*/

    

    $email_patient = 'y.vendrell@alaxione.fr';
    $montant_prestation = '25';

    $tabInfo = array(
        'email' => $email_patient,
        'token' => $stripeToken,
        'amount' => $montant_prestation,
        'currency_code' => 'EUR',
        'item_name' => 'Téléconsultation'
    );
    //$stripeResponse = $objStripe->prePaiement($tabInfo, "47636B132020Z03Z29X20C15C482A3DC19D401AD4B");

    
    /*
        $amount = $stripeResponse["amount"] /10

    /*
        $param_value_array = array(
            $_POST['email'],
            $amount,
            $stripeResponse["currency"],
            $stripeResponse["balance_transaction"],
            $stripeResponse["status"],
            json_encode($stripeResponse)
        );*/

    /*
    $tabPrePaiement = array(
        'identifiant_stripe_prepaiement' => $stripeResponse['id'],
        'identifiant_rdv' => $identifiant_rdv,
        'montant_prestation' => $montant_prestation,
        'stripe_amount_refunded' => $stripeResponse['amount_refunded'],
        'stripe_failure_code' => $stripeResponse['failure_code'],
        'stripe_paid' => $stripeResponse['paid'],
        'stripe_status' => $stripeResponse["status"]
    );
    $objStripe->addInfoPrePaiement($tabPrePaiement);


    if ($stripeResponse['amount_refunded'] == 0 && empty($stripeResponse['failure_code']) && $stripeResponse['paid'] == 1 && $stripeResponse['status'] == 'succeeded') {
        $successMessage = "Votre Pré Paiement a été effectué avec succès.";
    }else{
        $errorMessage = "Une erreur c'est produite lors de l'envoi de votre Pré Paiement. Aucune transaction n'a été effectué.";
    }
    echo"<pre>";print_r($stripeResponse);echo"</pre>";


    $stripeResponse2 = $objStripe->validerPaiement($stripeResponse['id']);
    if ($stripeResponse2['amount_refunded'] == 0 && empty($stripeResponse2['failure_code']) && $stripeResponse2['paid'] == 1 && $stripeResponse2['captured'] == 1 && $stripeResponse2['status'] == 'succeeded') {
        $successMessage = "Votre Paiement a été effectué avec succès.";
    }else{
        $errorMessage = "Une erreur c'est produite lors de l'envoi de votre Paiement. Aucune transaction n'a été effectué.";
    }

    echo"<pre>";print_r($stripeResponse2);echo"</pre>";
    */
}


//récupération de la clé publique Stripe
/*$sRequete_cle_publique_stripe = "SELECT
    FROM
    WHERE ";

$aTableauCleStripe = $this->ClasseGenerique->renvoi_info_requete($sRequete_cle_publique_stripe);
$key_stripe = $aTableauCleStripe[0]['key_secret']; */

$key_stripe = "pk_test_use2WYbXDCePrsWMdf1YXElr00LMqNAH6y";


$objSmarty->assign("key_stripe", $key_stripe);
$objSmarty->assign("successMessage", $successMessage);
$objSmarty->assign("errorMessage", $errorMessage);

$objSmarty->display("teleconsultation.tpl");
