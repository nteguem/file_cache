<?php

if (isset($_GET['sTypeSortie'])) {
    if ($_GET['sTypeSortie'] == "android") {
    } elseif ($_GET['sTypeSortie'] == "visu") {
        header('Content-Type: text/html; charset=utf-8');
    } elseif ($_GET['sTypeSortie'] == "csv") {
        header("Content-disposition: attachment; filename=export.csv");
        header('Content-type: text/csv');
        header("Content-Type: application/force-download");
    } elseif ($_GET['sTypeSortie'] == "pdf") {
    } else {
        header('Content-Type: text/html; charset=utf-8');
        $_GET['sTypeSortie'] ="";
    }
} else {
    header('Content-Type: text/html; charset=utf-8');
    $_GET['sTypeSortie'] ="";
}

/**
 * Fichier index.php du framework
 *
 */
if (!file_exists('config/config.inc.php') && file_exists('install.php')) {
    header('Location: install.php');
}
if (file_exists('config/config.inc.php') && file_exists('install.php')) {
    die('<div style="text-align: center;">
            <img src="public/images/flilogo.png" alt="logo">
            <h4 style="font-size: 40px;">Veuillez supprimer le fichier install.php afin de continuer !</h4>
         </div>');
}

require_once 'libs/initialise_framework.php';
require_once 'config/config.inc.php';
//require_once 'controleurs/class_form_list.php';
require_once 'class/class_form_list.php';

$aVar = array( 'fli_module', 'fli_controleur', 'fli_fonction' );


$aVarVal = class_params::nettoie_get_post($aVar);

/*
Verification des information obiligatoire en configuration**************
*/

if (class_fli::get_fli_actif()=="") {
    echo"<h2>Attention il manque les variable de statuts actif dans le fichier de config ligne a rajouter class_fli::set_fli_actif('0');</h2>";
    exit();
}

if (class_fli::get_fli_supp()=="") {
    echo"<h2>Attention il manque les variable de statuts supp dans le fichier de config ligne a rajouter class_fli::set_fli_supp('1');</h2>";
    exit();
}


/*********************************/
foreach ($aVar as $key => $value) {
    $$value = $aVarVal[$key];
}

if (empty($fli_module) || empty($fli_fonction)) {
    $fli_module = class_fli::get_module_defaut();
    $fli_controleur = class_fli::get_controleur_defaut();
    $fli_fonction = class_fli::get_fonction_defaut();
}

if (empty($fli_controleur)) {
    $fli_controleur = 'ctrl_'.$fli_module;
}

class_fli::set_fli_module($fli_module);
class_fli::set_fli_controleur($fli_controleur);
class_fli::set_fli_fonction($fli_fonction);

$objImport = new class_import();



$sModuleauthenfication = class_fli::get_chemin_module_gestion_connexion();
//infoecho class_fli::get_module_authentification()."<br>".class_fli::get_controleur_authentification()."<br>".class_fli::get_fonction_authentification();

if ($_GET['sTypeSortie']=="android") {
    $objSmartyImport = $objImport->import_vue();
    $aTabTpl = $objImport->import_module($fli_module, '', $fli_fonction, $objSmartyImport);
}
if ($_GET['sTypeSortie']=="visu") {
    $stabCle = $objImport->import_module('fli_session', '', 'session', '');
    $aTabDroit = $objImport->import_module(class_fli::get_module_authentification(), class_fli::get_controleur_authentification(), class_fli::get_fonction_authentification(), '');


    $objSmartyImport = $objImport->import_vue();
    $aTabTpl = $objImport->import_module($fli_module, $fli_controleur, $fli_fonction, $objSmartyImport);
    class_fli::execution($aTabTpl, 'version1');
} else {
    $stabCle = $objImport->import_module('fli_session', '', 'session', '');
    $aTabDroit = $objImport->import_module(class_fli::get_module_authentification(), class_fli::get_controleur_authentification(), class_fli::get_fonction_authentification(), '');

    $tTplMenu = $objImport->import_module('fli_menu', '', 'renvoi_menu', $objImport->import_vue());
    $objSmartyImport = $objImport->import_vue();
    $aTabTpl = $objImport->import_module($fli_module, $fli_controleur, $fli_fonction, $objSmartyImport);
    class_fli::execution($aTabTpl, 'version1', $tTplMenu);
}
