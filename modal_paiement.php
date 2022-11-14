<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

include_once('class/class_alaxione.php');
include_once('class/class_user.php');

//include_once('libs/smartyDM_fleet.php');


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

$idtranche = "";

//récupération des infomations passée en post
$aVariable = array("idrdv", "validation", "bsucess", "mode_reglement", "montant_paiement");

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



if ($validation=="ok") {
    $sRequete_maj_paiement= "UPDATE alaxione_prise_rendez_vous set montant_prise_rendez_vous='".$montant_paiement."',id_reglement='".$mode_reglement."'
	WHERE id_prise_rendez_vous='".$idrdv."'";

    echo $sRequete_maj_paiement."<br>";

    $bsucess = $objClassGenerique->executionRequete($sRequete_maj_paiement);
}
$atabReglement = array();


//récupération de la liste des type de  paiement

$sRequete_liste_paiement="SELECT libelle_reglement as nom, id_reglement as value
FROM alaxione_reglement
WHERE supplogique_reglement='N' order by libelle_reglement";
$atabReglement = $objClassGenerique->renvoi_info_requete($sRequete_liste_paiement);



$berror=false;
$sMessageError="";

$aTabInfoRDV = $objClassGenerique->renvoi_info_rdv($idrdv, "id_prise_rendez_vous", false);
$montant_paiement = $aTabInfoRDV[0]['montant_prise_rendez_vous'];
$mode_reglement = $aTabInfoRDV[0]['id_reglement'];
$sMessageTransmis = $aTabInfoRDV[0]['message_fin_prise_rendez_vous'];

if ($aTabInfoRDV[0]['montant_prise_rendez_vous']!="0.00") {
    $berror=true;
    $sMessageError="Attention vous avez un montant déjà saisi sur ce rendez vous";
} else {
    $montant_paiement = $aTabInfoRDV[0]['montant_type_rdv'];
}
// mise a jour du montant


//$bsucess=false;

//$aTabInfoRDV = $objClassGenerique->renvoi_info_rdv($idrdv,"id_prise_rendez_vous",false);






$objSmarty->assign("atabReglement", $atabReglement);
$objSmarty->assign("montant_paiement", $montant_paiement);
$objSmarty->assign("idrdv", $idrdv);
$objSmarty->assign("mode_reglement", $mode_reglement);
$objSmarty->assign("bsucess", $bsucess);
$objSmarty->assign("berror", $berror);
$objSmarty->assign("sMessageError", $sMessageError);
$objSmarty->assign("sMessageTransmis", $sMessageTransmis);

$objSmarty->display("modal_paiement.tpl");
