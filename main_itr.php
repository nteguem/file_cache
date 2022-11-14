<?php
    header('Accept: text/event-stream');
    header('Content-Type: text/html; charset=utf-8');
    ini_set('display_errors', 1);
    require 'libs/initialise_framework.php';
    require 'class/class_alaxione.php';
    require('libs/Smarty.class.php');

    $sCookieAdv = "";

    $objClassGenerique = new class_alaxione('user@systeme.fr', 'ufa66fr2#3', '');

    $bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv);

    $aVariable = array('dir', 'sim', 'lefocus', 'brefresh', 'lefocus', 'svide', 'bcalendar','binfofile');
    $aCountVariable = count($aVariable);
    
    for ($i = 0; $i < $aCountVariable; $i++) {
        if (!isset(${$aVariable[$i]})) {
            ${$aVariable[$i]} = isset($_GET[$aVariable[$i]]) ? $_GET[$aVariable[$i]] : '';
        }
    }

    if (!empty($_POST)) {
        for ($i = 0; $i < $aCountVariable; $i++) {
            if (!isset(${$aVariable[$i]})) {
                ${$aVariable[$i]} = isset($_POST[$aVariable[$i]]) ? $_POST[$aVariable[$i]] : '';
            }
        }
    }

    $sPageDirection = 'modules/backofficecabinet/import_temps_reel.php';
    $aTableauMenu = array();
    $bConfigActionModif=false;
    $bConfigActionSupp=false;

    //*******************r?cup?ration des diff?rentes actions autoris?e par ce groupe *****************
    $sRequete_select_info_groupe =	"SELECT actif_ecriture_groupe,actif_supression_groupe 
									FROM alaxione_groupe 
									WHERE id_groupe='".$objClassGenerique->id_groupe."'";

    $aTableauInfoGroupe =  $objClassGenerique->renvoi_info_requete($sRequete_select_info_groupe);

    if (!empty($aTableauInfoGroupe)) {
        if ($aTableauInfoGroupe[0]['actif_ecriture_groupe']=='Y') {
            $bConfigActionModif=true;
        }

        if ($aTableauInfoGroupe[0]['actif_supression_groupe']=='Y') {
            $bConfigActionSupp=true;
        }
    }

    $urloplus="";
    $sTitreHautPrincipal = 'Alaxione';
    $iLevelDroit = 10;
    $iNiveauUser = $objClassGenerique->niveau;
    



    $objSmarty = new Smarty();
    $objSmarty->setTemplateDir('templates/VersionA/templates');
    $objSmarty->setCompileDir('templates/VersionA/templates_c');
    $objSmarty->setCacheDir('templates/VersionA/cache');
    $objSmarty->setConfigDir('templates/VersionA/configs');

    $objSmarty->assign('id_entite', $objClassGenerique->identifiant_entite);
    $objSmarty->assign('binfofile', $binfofile);
    $objSmarty->assign('aTableauMenu', $aTableauMenu);
    $objSmarty->assign('titrehautprincipal', $sTitreHautPrincipal);
    $objSmarty->assign('level_droit', $iLevelDroit);
    $objSmarty->assign('niveau', $iNiveauUser);
    $objSmarty->assign('bcalendar', $bcalendar);
    $objSmarty->assign('prenomuser', $objClassGenerique->nomuser);
    $objSmarty->assign('photouser', "");
    $objSmarty->assign('filescript', str_replace("modules/", "", $sPageDirection));
    $objSmarty->assign('lefocus', $lefocus);
    $objSmarty->assign('sim', $sim);
    $objSmarty->assign('dir', $dir);
    
    include $sPageDirection;

    $objSmarty->display('principal_itr.tpl');
