<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

ini_set("display_errors", "ON");

include('class/class_alaxione.php');
include_once('class/class_oplus.php');
include_once('class/class_backoffice.php');
include_once('class/class_user.php');
include_once('class/class_widget.php');
//include('libs/smartyDM_fleet.php');

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


$objBackoffice = new class_backoffice();
$objWidget = new class_widget();

//récupération des infomations passée en post
$aVariable = array("idinterpro","id_patient", "validation","civilite_mod_up","nom_mod_up", "prenom_mod_up","prenom","medecintrait","profession_mod_up","email","adresse_mod_up",
                        "email_mod_up", "tel_mod_up", "nom_fille_mod_up", "date_naissance_mod_up", "num_secu_mod_up","timerdvreel","ville_mod_up",
                        "tel_fixe_mod_up", "adresse_mod_up", "code_postal_mod_up", "timerdv","tpsconsultation","idtyperdv","provenance","timerdvaff",
                        "ville_medecin_mod_up", "idstatus", "selectassurance", "medecin_traitant_mod_up","idrdv","jsEvent","idcalendar","remarque");


for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$aTableaupraticien = $objBackoffice->liste_praticien_interpro($idinterpro);

//$aTableauCivilite = $objClassGenerique->renvoi_civilite();

$aTableauCivilite = $objBackoffice->liste_civilite();

//$aTableauAssurance = $objWidget->renvoi_liste_assurance($objClassGenerique->idinterpro);



$stime = date('Ymdhis');
//$objsmarty->assign("bmoduleexterne",$bmoduleexterne);

$objSmarty->assign("stime", $stime);
$objSmarty->assign("interpro", $idinterpro);
$objSmarty->assign("aTableaupraticien", $aTableaupraticien);
$objSmarty->assign("aTableauCivilite", $aTableauCivilite);
$objSmarty->assign("identifiant_entite", $objClassGenerique->identifiant_entite);
$objSmarty->assign("prenom", $prenom);
$objSmarty->assign("ville_mod_up", "");
$objSmarty->assign("email", "");
$objSmarty->assign("adresse_mod_up", "");
$objSmarty->assign("medecintrait", "");
$objSmarty->assign("ville_medecin_mod_up", "");
$objSmarty->assign("profession_mod_up", "");
$objSmarty->assign("remarque", "");

$objSmarty->display("modal_widget_interpro.tpl");
