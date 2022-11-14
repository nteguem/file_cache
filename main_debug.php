<?php
session_start();

try {
    ini_set("display_errors", "ON");
    header('Accept: text/event-stream');
    ini_set('display_errors', 1);
    require 'libs/initialise_framework.php';
    require 'class/class_alaxione.php';
    require 'class/class_user.php';

    require('libs/Smarty.class.php');
    //require 'class/class_oplus.php';
    $time =86400;
    if (!isset($_COOKIE['AlaxioneAutreCentre'])) {
        $_COOKIE['AlaxioneAutreCentre']="";
    }

    $sCookieAdv = "";
    if (!isset($_COOKIE) || !isset($_COOKIE['cookie_alaxione'])) {
        header('location:index.php');
        $u=0;
    } else {
        $sCookieAdv = $_COOKIE['cookie_alaxione'];
    }




    if (!isset($_COOKIE['AlaxioneFiltreAgenda'])) {
           header('Set-Cookie: AlaxioneFiltreAgenda=;Max-Age='.$time.'; SameSite=None; Secure',false);
    }

    $aVariable = array('dir', 'sim', 'lefocus', 'brefresh', 'lefocus', 'svide', 'bcalendar','binfofile',"pagesimple","lstfiltreagenda", "action"
    ,"basculecentre","identifiant_centre");
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

    $objClassGenerique = new class_alaxione('', '', '');

    $bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv, "", false, "", $dir);

    if (!$bDroit) {
        header("location:index.php");
    }


    $Listefonctiononload = '';



    if (isset($_COOKIE['AlaxioneFiltreAgenda'])) {
        $lstfiltreagenda = $_COOKIE['AlaxioneFiltreAgenda'];
    }


    $sRequete_heure_serveur = "SELECT now() AS dateheure;";
    $aTabH = $objClassGenerique->renvoi_info_requete($sRequete_heure_serveur);

    header('Set-Cookie: AlaxioneDateSSEMessagerie='.$aTabH[0]['dateheure'].';Max-Age='.$time.'; SameSite=None; Secure',false);

    //activation blocage travaille sur un autre centre
    $bblocagecentre = false;


    // on essaye e changer dans le cookie idenitifiant du l'autre centre pris en gestion
    $idc_fils =$objClassGenerique->identifiant_entite;

    if ($basculecentre=="ok") {
        $objClassGenerique->redirection_centre($identifiant_centre);
         header('Set-Cookie: AlaxioneFiltreAgenda=alaxionefiltre;Max-Age='.$time.'; SameSite=None; Secure',false);
    } else {
        $objClassGenerique->redirection_centre($_COOKIE['AlaxioneAutreCentre']);
    }

    $aTableauDirection = $objClassGenerique->tableauDirection();


    if ($dir == '') {


        //print_r($aTableauDirection);
        if ($objClassGenerique->dirdefault!="") {
            $sPageDirection = 'modules/'.$aTableauDirection[$objClassGenerique->dirdefault];
            $dir = $objClassGenerique->dirdefault;
        } else {
            $sPageDirection = 'modules/utilisateur/compte.php';
        }

        //$sPageDirection = 'modules/dashboard/dashboard.php';
    } else {
        $sPageDirection = 'modules/'.$aTableauDirection[$dir];
    }


    //redirestion vers une page erreur
    if ($bblocagecentre) {
        $sPageDirection = "modules/erreur/erreur_acces_centre.php";
    }



    $aTableauMenu = array();

    $aTableauMenu = $objClassGenerique->renvoi_menu_central($dir);





    $bConfigActionModif=false;
    $bConfigActionSupp=false;

    //*******************récupération des différentes actions autorisée par ce groupe *****************
    $sRequete_select_info_groupe ="select actif_ecriture_groupe,actif_supression_groupe from   alaxione_groupe where id_groupe='".$objClassGenerique->id_groupe."'";

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

    $sReqPhoto = "select photo_user, id_civilite from alaxione_user where id_user = '".$objClassGenerique->id_user."'";
    $tabPhoto = $objClassGenerique->renvoi_info_requete($sReqPhoto);

    if ($objClassGenerique->niveau>9) {
        $binfofile="ok";
    }

    //*****************récupération des informations sur le centre******************
    $sRequete_info_centre ="select nom_entite, fichier_consigne, autoriser_rdv_prive_entite
    from alaxione_entite 
    where identifiant_entite='".$objClassGenerique->identifiant_entite."'";
    $aTableauInfoCentre =  $objClassGenerique->renvoi_info_requete($sRequete_info_centre);

    //**************************calcul sur les demande en attente pas encore confirler
    $iAlertRdvattente="";
    $aTableauvariable = $objClassGenerique->renvoi_info_variable_config($objClassGenerique->identifiant_entite);
    $nbrjour="";

    if (isset($aTableauvariable['nbrtpsrappeldeplacerdv'])) {
        $nbrjour = $aTableauvariable['nbrtpsrappeldeplacerdv'];
    }
    $aTableauListeRDVattente = array();
    /*$aTableauListeRDVattente =  $objClassGenerique->liste_rdv_attente_confirmation($nbrjour);

    if(count($aTableauListeRDVattente)>0)
        $iAlertRdvattente=count($aTableauListeRDVattente);
    */


    $aTableauListeCentre = array();
    $sRequete_liste_centre = "SELECT identifiant_entite, nom_entite
    FROM alaxione_entite 
    WHERE entite_supplogique = 'N' 
    AND identifiant_entite in (select identifiant_entite_fils from alaxione_entite_gestion_pere where supplogique_entite_gestion_pere='N' and identifiant_entite='".$idc_fils."')";
    $aTableauListeCentre = $objClassGenerique->renvoi_info_requete($sRequete_liste_centre);

    if (!empty($aTableauListeCentre)) {
        $aTableauListeCentre[] = array("identifiant_entite"=>$idc_fils, "nom_entite"=>"Centre principale");
    }

    $objUser = new class_user();
    $valeur_cgu="";

    $valeur_cgu = $objUser->verification_cgu($objClassGenerique->identifiantuser);

    $objBackoffice = new class_backoffice();
    $tabListeCivilite = $objBackoffice->liste_civilite();
    $TabAssurance = $objBackoffice->get_assurance();


    /*****************************************************************
     * Autorisations fonctionnalités
     ***************************************************************/

    /*$objCentral = new class_alaxione_central();

// fonction sms_de_retour

$tabAutorisationSmsRetour = array();
$tabParam = array(
    'guid_entite' => $objClassGenerique->guid_entite,
    'libelle_fonction' => 'sms_de_retour'
);
$tabAutorisationSmsRetour = $objCentral->autorisation_fonction($tabParam);

$objSmarty->assign('smsRetourVisible', $tabAutorisationSmsRetour[0]['visible']);
$objSmarty->assign('smsRetourModification', $tabAutorisationSmsRetour[0]['modification']);
*/

    if ($objClassGenerique->idinterpro != "0") {
        $objSmarty->assign('smsRetourVisible', "N");
    } else {
        $objSmarty->assign('smsRetourVisible', "Y");
    }
    $objSmarty->assign('smsRetourModification', "Y");

    $objSmarty->assign('bfom2', false);
    $objSmarty->assign('tabListeCivilite', $tabListeCivilite);
    $objSmarty->assign('TabAssurance', $TabAssurance);
    $objSmarty->assign('valeur_cgu', $valeur_cgu);
    $objSmarty->assign('idcivilite', $tabPhoto[0]['id_civilite']);
    $objSmarty->assign('pagesimple', $pagesimple);
    $objSmarty->assign('idc', $objClassGenerique->identifiant_entite);
    $objSmarty->assign('id_entite', $objClassGenerique->identifiant_entite);
    $objSmarty->assign('ident_user', $objClassGenerique->identifiantuser);
    //	$objSmarty->assign('urloplus', $urloplus);
    $objSmarty->assign('binfofile', $binfofile);
    $objSmarty->assign('idfiltreagenda', $lstfiltreagenda);
    $objSmarty->assign('aTableauListeRDVattente', $aTableauListeRDVattente);
    $objSmarty->assign('aTableauMenu', $aTableauMenu);
    $objSmarty->assign('titrehautprincipal', $sTitreHautPrincipal);
    $objSmarty->assign('iAlertRdvattente', $iAlertRdvattente);
    $objSmarty->assign('level_droit', $iLevelDroit);
    $objSmarty->assign('niveau', $iNiveauUser);
    $objSmarty->assign('bcalendar', $bcalendar);
    $objSmarty->assign('prenomuser', $objClassGenerique->nomuser);
    $objSmarty->assign('idinterpro', $objClassGenerique->idinterpro);
    $objSmarty->assign('photouser', $tabPhoto[0]['photo_user']);
    $objSmarty->assign('filescript', str_replace("modules/", "", $sPageDirection));
    $objSmarty->assign('lefocus', $lefocus);
    $objSmarty->assign('sim', $sim);
    $objSmarty->assign('dir', $dir);
    $objSmarty->assign('action', $action);
    $objSmarty->assign('lecentre', $aTableauInfoCentre[0]['nom_entite']);
    $objSmarty->assign('fichierconsigne', $aTableauInfoCentre[0]['fichier_consigne']);
    $objSmarty->assign('tabLstCentre', $aTableauListeCentre);
    $objSmarty->assign('Listefonctiononload', $Listefonctiononload);
    $objSmarty->assign('sLangueUser', $objClassGenerique->slangue);
    $objSmarty->assign('bActivtraduction', $objClassGenerique->bActivtradcution);
    $objSmarty->assign('rdv_prive_actif', $aTableauInfoCentre[0]['autoriser_rdv_prive_entite']);

    include $sPageDirection;

    if ($pagesimple=="ok") {
        $objSmarty->display('principal_seul.tpl');
    } else {
        $objSmarty->display('principal.tpl');
    }



    $objClassGenerique->db = null;
} catch (Exception $e) {
    echo $e->getMessage();
}
