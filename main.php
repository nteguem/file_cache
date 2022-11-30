<?php

require_once 'class/Database.php';

session_start();

try {
    ini_set("display_errors", "OFF");
    header('Accept: text/event-stream');
    ini_set('display_errors', 1);
    require 'libs/initialise_framework.php';
    require 'class/class_alaxione.php';
    require 'class/class_user.php';
    include __DIR__ . '/config/alaxioneconf.php';
    require('libs/Smarty.class.php');

    $aTableauconnexion = [
        'adminstructure',
        'adnimgeneral',
        'secretaire',
        'interpro',
        'praticien',
        'praticienlimite',
        'operateur',
        'secrelimite',
        'agendaconsult',
        'operateurlimite',
    ];

    if (!isset($_COOKIE['AlaxioneAutreCentre'])) {
        $_COOKIE['AlaxioneAutreCentre'] = "";
    }

    if (isset($_COOKIE['x-alx-sdomaine'])) {
        $sDomaine = $_COOKIE['x-alx-sdomaine'];
    } else {
        $sDomaine = "";
    }

    $sCookieAdv = "";
    $timelastcookie =86400;
    $_SESSION['AlaxioneNumeroAppelant'] = "";
    $_SESSION['AlaxioneNumeroAppele'] = "";

    if (isset($_GET['NUMEROAPPELANT'])) {
        $_SESSION['AlaxioneNumeroAppelant'] = $_GET['NUMEROAPPELANT'];
        header('Set-Cookie: NUMEROAPPELANT='.$_GET['NUMEROAPPELANT'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
    }

    if (isset($_GET['NUMEROAPPELE'])) {
        $_SESSION['AlaxioneNumeroAppele'] = $_GET['NUMEROAPPELE'];
        header('Set-Cookie: NUMEROAPPELE='.$_GET['NUMEROAPPELE'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
    }

    if (!isset($_COOKIE) || !isset($_COOKIE['NUMEROAPPELANT'])) {
        if (isset($_GET['NUMEROAPPELANT'])) {
            header('Set-Cookie: NUMEROAPPELANT='.$_GET['NUMEROAPPELANT'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);


        }
    }
    if (!isset($_COOKIE) || !isset($_COOKIE['NUMEROAPPELE'])) {
        if (isset($_GET['NUMEROAPPELE'])) {
            header('Set-Cookie: NUMEROAPPELE='.$_GET['NUMEROAPPELE'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
        }
        header('location:index.php');
        $u = 0;
    } else {
        $sCookieAdv = $_COOKIE['cookie_alaxione'];
    }
    $iAccess = "10";
    if (!isset($_COOKIE['AlaxioneFiltreAgenda'])) {
        //setcookie('AlaxioneFiltreAgenda', "", time() + (10 * 365 * 24 * 60 * 60), '/');
        header('Set-Cookie: AlaxioneFiltreAgenda=;Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
    }

    $aVariable = [
        'dir',
        'sim',
        'lefocus',
        'brefresh',
        'lefocus',
        'svide',
        'bcalendar',
        'binfofile',
        "pagesimple",
        "lstfiltreagenda",
        "action",
        "basculecentre",
        "identifiant_centre",
        "bdebug",
        'activdebug',
        'id_praticien_copypaste',
        "NUMEROAPPELANT",
        "NUMEROAPPELE",
    ];
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
    $DB = Database::getInstance();

    //récupération des groupes encore actif sur ce centre
    $aTableauSelectListeGroupe = [];
    $aTableauSelectListeGroupe['identifiant_entite'] = $objClassGenerique->identifiant_entite;
    $sRequeteSelectListeGroupeCentre = "SELECT identifiantall_groupe
                                        FROM alaxione_groupe
                                        WHERE identifiant_entite = :identifiant_entite
                                          AND groupe_supplogique = 'N'";

    $aTableauListeGroupe = $DB->execute($sRequeteSelectListeGroupeCentre, ['identifiant_entite' => $objClassGenerique->identifiant_entite]);

    if (!empty($aTableauSelectListeGroupe)) {
        foreach ($aTableauSelectListeGroupe as $key => $value) {
            $sRequeteSelectListeGroupeCentre = str_replace(":" . $key, "'" . addslashes($value) . "'",
                $sRequeteSelectListeGroupeCentre);
        }
    }

    if (!empty($aTableauListeGroupe)) {
        foreach ($aTableauListeGroupe as $valeurGroupe) {
            $aTableauconnexion[] = $valeurGroupe['identifiantall_groupe'];
        }
    }

    if (!$bDroit) {
        if (isset($_GET['NUMEROAPPELANT'])) {
            header('Set-Cookie: NUMEROAPPELANT='.$_GET['NUMEROAPPELANT'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
        } else {
            if (isset($_COOKIE['NUMEROAPPELANT'])) {
                header('Set-Cookie: NUMEROAPPELANT=;Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
            }
        }
        if (isset($_GET['NUMEROAPPELE'])) {
            header('Set-Cookie: NUMEROAPPELE='.$_GET['NUMEROAPPELE'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
        } else {
            if (isset($_COOKIE['NUMEROAPPELE'])) {
                header('Set-Cookie: NUMEROAPPELE=;Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
            }
        }
        header("location:deco.php?administration=" . $_COOKIE['cookie_centre']);
    }

    $token_user = "";
    if (isset($objClassGenerique->token_user)) {
        $token_user = $objClassGenerique->token_user;
    }

    $Listefonctiononload = '';

    if (isset($_COOKIE['AlaxioneFiltreAgenda'])) {
        $lstfiltreagenda = $_COOKIE['AlaxioneFiltreAgenda'];
    }


    $sRequete_heure_serveur = "SELECT now() AS dateheure;";
    $aTabH = $DB->execute($sRequete_heure_serveur);

    header('Set-Cookie: AlaxioneDateSSEMessagerie='.$aTabH[0]['dateheure'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
    header('Set-Cookie: AlaxioneDateSSE='.$aTabH[0]['dateheure'].';Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
    $bblocagecentre = false;



    //********** on essaye e changer dans le cookie idenitifiant du l'autre centre pris en gestion
    $idc_fils = $objClassGenerique->identifiant_entite;

    if ($basculecentre == "ok") {
        $objClassGenerique->redirection_centre($identifiant_centre);
        header('Set-Cookie: AlaxioneFiltreAgenda=alaxionefiltre;Max-Age='.$timelastcookie.'; SameSite=None; Secure',false);
    } else {
        $objClassGenerique->redirection_centre($_COOKIE['AlaxioneAutreCentre']);
    }

    if ($dir == "rechdispo" or $dir == "") {
        if ($objClassGenerique->identifiant_entite == "2cdferz") {
            $dir = "geststruc";
        } else {
            if ($objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, "activvertical",
                "ok")) {
                $dir = "rechdispo";
            } else {
                $dir = "aghorizontal";
            }
        }
    }

    $aTableauDirection = [];
    $aTableauDirection = $objClassGenerique->tableauDirection();
    $sPageDirection = 'modules/' . $aTableauDirection[$dir];

    //redirestion vers une page erreur
    if ($bblocagecentre) {
        $sPageDirection = "modules/erreur/erreur_acces_centre.php";
    }

    $aTableauMenu = [];

    $aTableauMenu = $objClassGenerique->renvoi_menu_user($dir, false, "", $objClassGenerique->iIdTypecentre);

    $bConfigActionModif = true;
    $bConfigActionSupp = true;
    $aTableauInfoGroupe = [];
    //*******************récupération des différentes actions autorisée par ce groupe *****************
    $sRequete_select_info_groupe = "SELECT actif_ecriture_groupe,actif_supression_groupe 
                                    FROM alx_groupemenu 
                                    WHERE identifiantall_groupe='" . $objClassGenerique->identifiantgroupe . "'";
    if (!empty($aTableauInfoGroupe)) {
        if ($aTableauInfoGroupe[0]['actif_ecriture_groupe'] == 'Y') {
            $bConfigActionModif = true;
        }

        if ($aTableauInfoGroupe[0]['actif_supression_groupe'] == 'Y') {
            $bConfigActionSupp = true;
        }
    }

    $urloplus = "";

    if (in_array($objClassGenerique->identifiantgroupe, $objClassGenerique->renvoi_groupe_filtre())) {
        $iAccess = "0";
    }

    if ($objClassGenerique->identifiantgroupe == "secrelimite") {
        $iAccess = "5";
    }

    $sTitreHautPrincipal = 'Alaxione';
    $iLevelDroit = 10;
    $iNiveauUser = $objClassGenerique->niveau;

    $objSmarty = new Smarty();
    $objSmarty->setTemplateDir('templates/VersionA/templates');
    $objSmarty->setCompileDir('templates/VersionA/templates_c');
    $objSmarty->setCacheDir('templates/VersionA/cache');
    $objSmarty->setConfigDir('templates/VersionA/configs');

    $sReqPhoto = "SELECT photo_user, id_civilite FROM alaxione_user WHERE id_user = '" . $objClassGenerique->id_user . "'";
    $tabPhoto = $DB->execute($sReqPhoto);

    if ($objClassGenerique->niveau > 9) {
        $binfofile = "ok";
    }

    //*****************récupération des informations sur le centre******************
    $sRequete_info_centre = "SELECT nom_entite,
                                    fichier_consigne,
                                    autoriser_rdv_prive_entite,
                                    indicatif_telephonique_entite,
                                    activation_plan_traitement_entite,
                                    activation_fusion_patient_entite,
                                    if(heure_debut_agenda_entite='00:00:00','06:00:00',heure_debut_agenda_entite) AS heuredebutdefaut,
                                    if(heure_fin_agenda_entite='00:00:00','22:00:00',heure_fin_agenda_entite) AS heurefindefaut,
                                    if(pas_agenda_entite='0','5',pas_agenda_entite) AS pasgendadefaut    
                             FROM alaxione_entite 
                             WHERE identifiant_entite='" . $objClassGenerique->identifiant_entite . "'";

    $aTableauInfoCentre = $DB->execute($sRequete_info_centre);
    $tab1 = $objClassGenerique->cb_get_info_num_indicatif($aTableauInfoCentre[0]['indicatif_telephonique_entite']);
    if (!empty($tab1)) {
        $num_tab = explode("+", $tab1[0]['prefixe_indicatif']);
        $num_indicatif_structure = $num_tab[1];
    } else {
        $num_indicatif_structure = "33";
    }

    $aTableauInfoModuleExterne = [];
    $bisAlaxioneMaitreModuleExterne = false;
    $sRequete_info_module_externe = "SELECT valeur_config_entite,
                                            module_externe_alaxione_maitre
						             FROM alaxione_config_entite
                                     INNER JOIN alaxione_entite ON alaxione_config_entite.identifiant_entite = alaxione_entite.identifiant_entite
						             INNER JOIN alaxione_variable_config_module ON alaxione_variable_config_module.id_variable_config_module = alaxione_config_entite.id_variable_config_module
						             WHERE supplogique_config_entite = 'N' 
						               AND identifiant_variable_config_module = 'typemodule' 
						               AND alaxione_entite.identifiant_entite = '" . $objClassGenerique->identifiant_entite . "'";

    $aTableauInfoModuleExterne = $DB->execute($sRequete_info_module_externe);

    if (!empty($aTableauInfoModuleExterne)) {
        if ($aTableauInfoModuleExterne[0]['module_externe_alaxione_maitre'] == 1) {
            $bisAlaxioneMaitreModuleExterne = true;
        }
    }


    $aTableauListeCentre = [];
    $sRequete_liste_centre = "SELECT identifiant_entite, 
                                     nom_entite
                              FROM alaxione_entite 
                              WHERE entite_supplogique = 'N' 
                              AND identifiant_entite IN (SELECT identifiant_entite_fils 
                                                         FROM alaxione_entite_gestion_pere 
                                                         WHERE supplogique_entite_gestion_pere='N' 
                                                           AND identifiant_entite='" . $idc_fils . "')";
    $aTableauListeCentre = $DB->execute($sRequete_liste_centre);

    if (!empty($aTableauListeCentre)) {
        $sRequeteEntite = "SELECT nom_entite FROM alaxione_entite WHERE identifiant_entite = '" . $idc_fils . "'";
        $aTableauInfoEntite = $DB->execute($sRequeteEntite);
        if (!empty($aTableauInfoEntite)) {
            $nom_entite = $aTableauInfoEntite[0]['nom_entite'];
        } else {
            $nom_entite = 'Centre principal';
        }
        $aTableauListeCentre[] = ["identifiant_entite" => $idc_fils, "nom_entite" => $nom_entite];
    }

    $objUser = new class_user();
    $valeur_cgu = "";

    $valeur_cgu = $objUser->verification_cgu($objClassGenerique->identifiantuser);
    $objBackoffice = new class_backoffice();
    $tabListeCivilite = $objBackoffice->liste_civilite();
    $tabListeInterpolType = $objBackoffice->liste_type_patient($objClassGenerique->identifiant_entite);
    $idInterpolTypeDefaut = $objBackoffice->getIdDefautTypeInterpol($objClassGenerique->identifiant_entite);

    $sRequeteGetRaisonsAppelInterpol = "SELECT * FROM alc_raison_appel_patient WHERE type_appel = 'patient' and supplogique_raison = 'N' and identifiant_entite = '" . $objClassGenerique->identifiant_entite . "'";
    $aTableauRaisonsAppelInterpol = $DB->execute($sRequeteGetRaisonsAppelInterpol);

    $sRequeteGetRaisonsAppelCentre = "SELECT * FROM alc_raison_appel_patient WHERE type_appel = 'centre' and supplogique_raison = 'N' and identifiant_entite = '" . $objClassGenerique->identifiant_entite . "'";
    $aTableauRaisonsAppelCentre = $DB->execute($sRequeteGetRaisonsAppelCentre);

    $tabListeParent = $objBackoffice->liste_lien_parente();
    $TabAssurance = $objBackoffice->get_assurance();

    /*****************************************************************
     * Autorisations fonctionnalités
     ***************************************************************/

    /*récupération liste des droits de l'uilisateur*/
    $tabdroituser = [];
    $bmenuraccourci = false;

    //récupération la liste des acces de l'utilisateur
    $sRequeteSelectDroit = "SELECT fils.ledir_menu AS dirfils,
                                   pere.ledir_menu AS dirpere 
                            FROM alr_droit_user 
        INNER JOIN alaxione_menu AS fils ON fils.id_menu  = alr_droit_user.id_menu
        LEFT JOIN alaxione_menu AS pere ON pere.identifiant_menu = fils.idantifiantpere_menu
        AND pere.identifiant_menu<>''
        WHERE id_utilisateur='" . $objClassGenerique->id_user . "' 
        AND c_droit_user=1 
        AND bsupplogique=0";

    $aTableauListeDroit = $DB->execute($sRequeteSelectDroit);

    $aTableauVisibleDir = [];
    if (!empty($aTableauListeDroit)) {
        foreach ($aTableauListeDroit as $value) {
            $tabdroituser[] = $value['dirfils'];
            $tabdroituser[] = $value['dirpere'];
        }
    }

    if (in_array("listerdv", $tabdroituser) or in_array("listerdvatraiter", $tabdroituser) or
        in_array("listeprofilageenattente", $tabdroituser)
        or in_array("print_recap_paiement_rdv", $tabdroituser) || in_array("reponsemail", $tabdroituser) || in_array("voiravispatients", $tabdroituser) || in_array("statistique", $tabdroituser)) {
        $bmenuraccourci = true;
    }

    $TableauBlocage = $objClassGenerique->different_blocage_centet($objClassGenerique->identifiant_entite);

    $bmoduleexterne = false;
    $bismoduleexterne = false;

    if ($TableauBlocage['module_externe'] != "" || $TableauBlocage['niveau_blogage'] == "total") {
        $bmoduleexterne = true;
    }

    if ($TableauBlocage['module_externe'] != "") {
        $bismoduleexterne = true;
    }

    $numero_version_alaxione = "107";

    if ($objClassGenerique->idinterpro != "0") {
        $objSmarty->assign('smsRetourVisible', "N");
        $objSmarty->assign('bloquerInterpro', "Y");
    } else {
        $objSmarty->assign('smsRetourVisible', "Y");
        $objSmarty->assign('bloquerInterpro', "N");
    }

    $objSmarty->assign('smsRetourModification', "Y");

    $bmodifdate = false;

    $bismobile = $objClassGenerique->isMobile();
    $iAlerterreurSynchro = "";

    $sRequeteSelectListeErreur = "SELECT id_module, 
                                         identifiant_module_externe 
                                  FROM alx_erreur_module_externe 
                                  WHERE identifiant_entite='" . $objClassGenerique->identifiant_entite . "' 
                                    AND status_traitement=0";

    $aTableauSynchroErreu = $DB->execute($sRequeteSelectListeErreur);

    if (!empty($aTableauSynchroErreu)) {
        $iAlerterreurSynchro = count($aTableauSynchroErreu);
    }

    $bActifPlantraitement = false;
    $bActifAnesthesiste = false;
    $bActifSurvey = false;

    if ($objClassGenerique->renvoi_produit_entite_actif($objClassGenerique->identifiant_entite, "actif_anesthesiste")) {
        $bActifAnesthesiste = true;
    }

    if ($objClassGenerique->renvoi_produit_entite_actif($objClassGenerique->identifiant_entite, "alaxsurv79")) {
        $bActifSurvey = true;
    }

    //on regarde ici si le plan de traitement est actif sur ce centre
    if ($aTableauInfoCentre[0]['activation_plan_traitement_entite'] == 'Y') {
        $bActifPlantraitement = true;
    }


    //************************** calcul sur les demandes en attente pas marqué comme traité
    $iAlertRdvattente = "";
    $aTableauvariable = $objClassGenerique->renvoi_info_variable_config($objClassGenerique->identifiant_entite);
    $nbrjour = "";
    if (isset($aTableauvariable['nbrtpsrappeldeplacerdv'])) {
        $nbrjour = $aTableauvariable['nbrtpsrappeldeplacerdv'];
    }

    $typemodule = "";
    if (isset($aTableauvariable['typemodule'])) {
        $typemodule = $aTableauvariable['typemodule'];
    }


    $nbrjour = 0;
    $nbrrdvattenteconifrmation = 0;
    $aTableauListeRDVattente = [];
    $aTableauListeSynchro = [];
    $nbrrdvsuppressiongroupe = 0;

    // requete les rdv en attente de confirmation
    $sRequeteRDVAttente = "SELECT id_prise_rendez_vous  
                           FROM alaxione_prise_rendez_vous 
                           WHERE supplogiquefixe_prise_rendez_vous = 'N' 
                             AND ((etat_prise_rendez_vous='valide' 
                                    AND validdeplace_prise_rendez_vous='en attente' 
                                    AND supplogique_prise_rendez_vous='N')
                                 ) 
                             AND identifiant_entite_rdv='" . $objClassGenerique->identifiant_entite . "' 
                             AND traiter_liste_rdv='N' 
                             AND alaxione_prise_rendez_vous.iddocteur_user 
                                 IN (SELECT id_user 
                                   FROM alaxione_user 
                                   WHERE user_supplogique = 'N' 
                                   AND identifiant_entite='" . $objClassGenerique->identifiant_entite . "' 
                                   AND actifcalendar_user='Y' 
                                   AND type_user='USER')";

    $aTableauListeRDVattenteconfirmation = $DB->execute($sRequeteRDVAttente);

    if (count($aTableauListeRDVattenteconfirmation) > 0) {
        $iAlertRdvattente = count($aTableauListeRDVattenteconfirmation);
        $nbrrdvattenteconifrmation = $iAlertRdvattente;
    } else {
        $nbrrdvattenteconifrmation = 0;
        $iAlertRdvattente = 0;
    }

    // recupération nombre suppression  groupé
    $sRequeteSuppressiongroupe = "SELECT id_prise_rendez_vous 
                                  FROM alaxione_prise_rendez_vous 
                                  WHERE supplogiquefixe_prise_rendez_vous = 'N' 
                                    AND (etat_prise_rendez_vous='repropose' OR etat_prise_rendez_vous='suppression_groupe') 
                                    AND identifiant_entite_rdv='" . $objClassGenerique->identifiant_entite . "' 
                                    AND traiter_liste_rdv='N' 
                                    AND alaxione_prise_rendez_vous.iddocteur_user 
                                    IN (SELECT id_user FROM alaxione_user WHERE user_supplogique='N' 
	                                    AND identifiant_entite='" . $objClassGenerique->identifiant_entite . "' 
	                                    AND actifcalendar_user='Y' 
	                                    AND type_user='USER')";

    $aTableauListeSuppresionGroupe = $DB->execute($sRequeteSuppressiongroupe);

    if (count($aTableauListeSuppresionGroupe) > 0) {
        $nbrrdvsuppressiongroupe = count($aTableauListeSuppresionGroupe);
        $iAlertRdvattente = $iAlertRdvattente + $nbrrdvsuppressiongroupe;
    }

    // récuperation du nombre de rdv en conflit par encore traité
    $sRequeteListeRdvconflit = "SELECT id_prise_rendez_vous 
                                FROM alaxione_prise_rendez_vous AS principal
                                WHERE (principal.etat_prise_rendez_vous='valide' OR principal.etat_prise_rendez_vous='suppression_groupe') 
                                AND principal.id_prise_rendez_vous and principal.idpatient_user <>'0' and principal.iddocteur_user  <>'0'
                                      and principal.id_prise_rendez_vous  NOT IN (SELECT id_rdv FROM alr_rdv_diffusion_utilisateur 
                                        WHERE status_rdv_diffusion_utilisateur='traite')";

    $aTableauListeDif = $objClassGenerique->visibilite_liste_diffusion($objClassGenerique->id_user, "alertrdvconflit");

    //echo"<pre>";print_r($aTableauListeDif);echo"</pre>";

    $sRequeteListeRdvconflit .= " and principal.id_action='rdvdeprogramme' and principal.iddocteur_user in (0";

    if (!empty($aTableauListeDif['praticien'])) {
        foreach ($aTableauListeDif['praticien'] as $item) {
            $sRequeteListeRdvconflit .= "," . $item;
        }
    }
    $sRequeteListeRdvconflit .= ")";

    $sRequeteListeRdvconflit .= " and principal.id_lieux  in (0";
    if (!empty($aTableauListeDif['lieu'])) {
        foreach ($aTableauListeDif['lieu'] as $item) {
            $sRequeteListeRdvconflit .= "," . $item;
        }
    }
    $sRequeteListeRdvconflit .= ")";

    if (!empty($aTableauListeDif['lieu']) or !empty($aTableauListeDif['praticien'])) {
        $sRequeteListeRdvconflit .= " and principal.id_service  in (0";

        if (!empty($aTableauListeDif['uf'])) {
            foreach ($aTableauListeDif['uf'] as $item) {
                $sRequeteListeRdvconflit .= "," . $item;
            }
        }

        $sRequeteListeRdvconflit .= ")";
    }

    $sRequeteListeRdvconflit .= " Group by principal.id_prise_rendez_vous ";



    $nbrrdvconfliconge = 0;
    $aTableauListeRDVConflit = $DB->execute($sRequeteListeRdvconflit);
    $NbrListeRDVConflit = count($aTableauListeRDVConflit);

    if ($NbrListeRDVConflit > 0) {
        $nbrrdvconfliconge = $NbrListeRDVConflit;
        if (is_numeric($iAlertRdvattente)) {
            $iAlertRdvattente = $iAlertRdvattente + $NbrListeRDVConflit;
        } else {
            $iAlertRdvattente = $NbrListeRDVConflit;
        }
    }

    $bpushfileintepro = "nop";
    $aTableauConfigTableau = $objClassGenerique->is_oplus_activ($objClassGenerique->identifiant_entite);
    if (isset($aTableauConfigTableau['pushdocinterpro'])) {
        $bpushfileintepro = $aTableauConfigTableau['pushdocinterpro'];
    }

    $bactivefusionpatient = false;
    if ($aTableauInfoCentre[0]['activation_fusion_patient_entite'] == 'Y') {
        $bactivefusionpatient = true;
    }

    //on regarde si on a des erreurs activer leicone erreur synchro ftp hl7
    $bErreurSynchorFtp = false;
    $sRequeteVerifErreurSyncho = "SELECT id_erreur_module_externe 
                                  FROM alx_erreur_module_externe 
                                  WHERE supplogique_erreur_module_externe='N' 
                                  AND identifiant_entite='" . $objClassGenerique->identifiant_entite . "' 
                                    LIMIT 0, 10";

    $aTableauVerifErreurSynchro = $DB->execute($sRequeteVerifErreurSyncho);

    if (!empty($aTableauVerifErreurSynchro)) {
        $bErreurSynchorFtp = true;
    }

    $bIsIntepro = false;

    if ($objClassGenerique->idinterpro != 0) {
        $bIsIntepro = true;
    }

    $bboutonhistorique = true;

    if ($objClassGenerique->idinterpro != 0) {
        $bboutonhistorique = false;
    }

    $idPraticien = "0";
    // on regarde si il y a une demande copi colle
    if (trim($id_praticien_copypaste) != "") {
        $idPraticien = $id_praticien_copypaste;
    }

    if (!isset($sLinkAlaxioneSurvey)) {
        $sLinkAlaxioneSurvey = "";
    }

    if (!isset($sLinkAlaxioneSurveyApi)) {
        $sLinkAlaxioneSurveyApi = "";
    }

    $id_lieux = "";
    $locations = [];
    $sMessageLieuxNotFound = "";
    $numerosInternes = [];

    // @T7342-CF18 NUMEROAPPELE est en fait le numéro SDA du centre et pas le numéro publique
    // on fait donc la verif avec le champ numero_sda de la table alaxione_lieux
    if ($NUMEROAPPELE != "") {

        // On réinit les ID lieux pour être sur de ne rien garder de l'ancienne vue
        $id_lieux="";

        $aVarGetLieux = ["numeroappele" => $NUMEROAPPELE, 'idc' => $objClassGenerique->identifiant_entite];
        $sGetIdlieux = "SELECT id_lieux, nom_lieux, adresse_lieux, complement_adresse_lieux, code_postal_lieux, ville_lieux, horaires_ouverture_lieux, infos_pratiques_lieux
                        FROM alaxione_lieux 
                        WHERE REPLACE(numero_sda, ' ', '') = :numeroappele 
                        AND identifiant_entite = :idc";

        $aTableauVerifLieux = $DB->execute($sGetIdlieux, $aVarGetLieux);

        if (!empty($aTableauVerifLieux)) {
            foreach ($aTableauVerifLieux as $alieu) {
                if ($id_lieux == "") {
                    $id_lieux = $alieu['id_lieux'];
                } else {
                    $id_lieux .= ", " . $alieu['id_lieux'];
                }
                $consigns = $objClassGenerique->getConsigns($alieu['id_lieux'], NULL, NULL, $objClassGenerique->identifiant_entite, true, null, 'ts');
                $consigns = array_merge($consigns, $objClassGenerique->getConsigns($alieu['id_lieux'], NULL, NULL, $objClassGenerique->identifiant_entite, false, null, 'ts'));
                $alieu['consigns'] = $consigns;
                $locations[] = $alieu;
            }

            $sql = "SELECT *
                    FROM alc_lieux_numero_interne
                    WHERE id_lieux IN (" . $id_lieux . ")
                    AND supplogique_lieux_numero_interne = 'N'";

            $numerosInternes = $DB->execute($sql);
        } else {
            $sMessageLieuxNotFound = "Aucun centre trouvé avec ce numéro. Veuillez contacter votre administrateur.";
        }

        // On set les id_lieux récupérés dans les Cookies car on va s'en servir pour filtrer les résultats à plusieurs endroits de l'appli
        // Si on à trouvé aucun lieux, on set le cookie quand même pour ne pas voir l'ancienne vue.
        $_SESSION['AlaxioneIdLieux'] = $id_lieux;
    }

    $objSmarty->assign('idPraticien', $idPraticien);
    $objSmarty->assign('bactiveprofilage', $objClassGenerique->verif_autorisation_action("profilage_rdv"));
    $objSmarty->assign('bErreurSynchorFtp', $bErreurSynchorFtp);
    $objSmarty->assign('nbrrdvconfliconge', $nbrrdvconfliconge);
    $objSmarty->assign('bboutonhistorique', $bboutonhistorique);
    $objSmarty->assign('nbrrdvattenteconifrmation', $nbrrdvattenteconifrmation);
    $objSmarty->assign('nbrrdvsuppressiongroupe', $nbrrdvsuppressiongroupe);
    $objSmarty->assign('bActifAnesthesiste', $bActifAnesthesiste);
    $objSmarty->assign('bActifSurvey', $bActifSurvey);
    $objSmarty->assign('bactivvisulog', $objClassGenerique->verif_autorisation_action("visuhistolog"));
    $objSmarty->assign('bactivvisuhistordvpatient', $objClassGenerique->verif_autorisation_action("voirhistordv"));
    $objSmarty->assign('bactivvisuhistopatient', $objClassGenerique->verif_autorisation_action("voirhistopatient"));
    $objSmarty->assign('bActifPlantraitement', $bActifPlantraitement);
    $objSmarty->assign('bBlockprofilage', $objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, "activvertical","ok"));
    $objSmarty->assign('bActivefusionNom', $objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, "activfusionNom","ok"));
    $objSmarty->assign('bmodifdate', $bmodifdate);
    $objSmarty->assign('bmodifdate', $bmodifdate);
    $objSmarty->assign('bIsIntepro', $bIsIntepro);
    $objSmarty->assign('bfom2', false);
    $objSmarty->assign('tabListeCivilite', $tabListeCivilite);
    $objSmarty->assign('tabListeInterpolType', $tabListeInterpolType);
    $objSmarty->assign('idInterpolTypeDefaut', $idInterpolTypeDefaut);
    $objSmarty->assign('tabListeRaisonsAppelInterpol', $aTableauRaisonsAppelInterpol);
    $objSmarty->assign('tabListeRaisonsAppelCentre', $aTableauRaisonsAppelCentre);
    $objSmarty->assign('tabListeParent', $tabListeParent);
    $objSmarty->assign('bActiModif', $objClassGenerique->active_modif_rdv($objClassGenerique->identifiant_entite, $typemodule));
    $objSmarty->assign('TabAssurance', $TabAssurance);
    $objSmarty->assign('valeur_cgu', $valeur_cgu);
    $objSmarty->assign('idcivilite', $tabPhoto[0]['id_civilite']);
    $objSmarty->assign('pagesimple', $pagesimple);
    $objSmarty->assign('idc', $objClassGenerique->identifiant_entite);
    $objSmarty->assign('id_entite', $objClassGenerique->identifiant_entite);
    $objSmarty->assign('ident_user', $objClassGenerique->identifiantuser);
    $objSmarty->assign('iddebug_user', $objClassGenerique->id_user);
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
    $objSmarty->assign('iAlerterreurSynchro', $iAlerterreurSynchro);
    $objSmarty->assign('sGroupe', $objClassGenerique->identifiantgroupe);
    $objSmarty->assign('lecentre', $aTableauInfoCentre[0]['nom_entite']);
    $objSmarty->assign('fichierconsigne', $aTableauInfoCentre[0]['fichier_consigne']);
    $objSmarty->assign('tabLstCentre', $aTableauListeCentre);
    $objSmarty->assign('aTableauListeSynchro', $aTableauListeSynchro);
    $objSmarty->assign('Listefonctiononload', $Listefonctiononload);
    $objSmarty->assign('sLangueUser', $objClassGenerique->slangue);
    $objSmarty->assign('bActivtraduction', $objClassGenerique->bActivtradcution);
    $objSmarty->assign('rdv_prive_actif', $aTableauInfoCentre[0]['autoriser_rdv_prive_entite']);
    $objSmarty->assign('module_externe', $typemodule);
    $objSmarty->assign('indicatif_structure', $aTableauInfoCentre[0]['indicatif_telephonique_entite']);
    $objSmarty->assign('numero_version_alaxione', $numero_version_alaxione);
    $objSmarty->assign('num_indicatif_structure', $num_indicatif_structure);
    $objSmarty->assign('iAccess', $iAccess);
    $objSmarty->assign('bmoduleexterne', $bmoduleexterne);
    $objSmarty->assign('bismoduleexterne', $bismoduleexterne);
    $objSmarty->assign('bpushfileintepro', $bpushfileintepro);
    $objSmarty->assign('bIsMobile', $bismobile);
    $objSmarty->assign('bisAlaxioneMaitreModuleExterne', $bisAlaxioneMaitreModuleExterne);
    $objSmarty->assign('token_user', $token_user);
    $objSmarty->assign('email_user', $objClassGenerique->leemail);
    $objSmarty->assign('sServerIp', $sAlaxioneIP);
    $objSmarty->assign('iWebsocketPort', $iWebsocketPort);
    $objSmarty->assign('linkApiLog', $sLinkAlaxioneLogAPI);
    $objSmarty->assign('activdebug', $activdebug);
    $objSmarty->assign('sNomServeurDBB', $sAlaxioneLeServeur);
    $objSmarty->assign('bmenuraccourci', $bmenuraccourci);
    $objSmarty->assign('tabdroituser', $tabdroituser);
    $objSmarty->assign('bactivesupprpdf', $objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, "bactivesupprpdf", "ok"));
    $objSmarty->assign('bactivefusionpatient', $bactivefusionpatient);
    $objSmarty->assign('heureagendedebutdefaut', $aTableauInfoCentre[0]['heuredebutdefaut']);
    $objSmarty->assign('heureagendefindefaut', $aTableauInfoCentre[0]['heurefindefaut']);
    $objSmarty->assign('pasagendadefautpas', $aTableauInfoCentre[0]['pasgendadefaut']);
    $objSmarty->assign('sDomaine', $sDomaine);
    $objSmarty->assign('sLinkAlaxioneSurvey', $sLinkAlaxioneSurvey);
    $objSmarty->assign('sLinkAlaxioneSurveyApi', $sLinkAlaxioneSurveyApi);
    $objSmarty->assign('sServeurWebSocket', $sServeurWebSocket);
    $objSmarty->assign("numeroappelant", $_COOKIE['NUMEROAPPELANT']);
    $objSmarty->assign("numeroappele", $_COOKIE['NUMEROAPPELE']);
    $objSmarty->assign("numerosInternes", $numerosInternes);
    $objSmarty->assign("id_lieux", $id_lieux);
    $objSmarty->assign("locations", $locations);
    $objSmarty->assign("sMessageLieuxNotFound", $sMessageLieuxNotFound);

    $objSmarty->assign('modernizr_1', filemtime('js/modernizr.js'));
    $objSmarty->assign('modrnCentreClient', filemtime('../js/modernizr.js'));
    $objSmarty->assign('detectMinCentreClient', filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign('detectModernizClient', filemtime('../js/mobile-detect-modernizr.js'));

    $objSmarty->assign('plugInCentreClient', filemtime('../plugins/fullcalendar-2.3.1/lib/jquery.min.js'));
    $objSmarty->assign('bootstapCentreClient', filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign('customCentreClient', filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punchCentreClient', filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('caroufRedCentreClient', filemtime('../js/caroufredsel.js'));
    $objSmarty->assign('pluginsCentreClient', filemtime('../js/plugins.js'));
    $objSmarty->assign('frameCentreClient', filemtime('../js/framwork_js.js'));
    $objSmarty->assign('autoCentreClient', filemtime('../js/jquery.autocomplete.min.js'));
    $objSmarty->assign('breakinPointCentreClient', filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('dataTablesCentreClient', filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('prettyPhotoCentreClient', filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('contactMinCnetreClient', filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('tagsInputCentreClient', filemtime('./plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('switchCentreClient', filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blocKUiCentreClient', filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnofyCentreClient', filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('themeCentreClient', filemtime('../js/theme.js'));
    $objSmarty->assign('custCustomCentreClient', filemtime('../custom/custom.js'));

    $objSmarty->assign('modrnCentreDispoModif', filemtime('../js/modernizr.js'));
    $objSmarty->assign('detectMinCentreDispoModif', filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign('detectModernizDispoModif', filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign('jQueryDisPoModif', filemtime('../js/jquery.js'));
    $objSmarty->assign('bootstrapDispoModif', filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign('customDispoModf', filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punhDispoModf', filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('caroufDispoModf', filemtime('../js/caroufredsel.js'));
    $objSmarty->assign('plugDispoModf', filemtime('../js/plugins.js'));
    $objSmarty->assign('breakDispoModif', filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('dataDispoModif', filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('prettyDispoModif', filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.'));
    $objSmarty->assign('contactDispoModif', filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('tagsDispoModif', filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blockdispoModif', filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnotifyDispoModif', filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('pnotifyDispoModif', filemtime('../js/theme.js'));
    $objSmarty->assign('pnotifyDispoModif', filemtime('../custom/custom.js'));
    $objSmarty->assign('timePickDispoModif', filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign('wizarDispoModif', filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min..js'));
    $objSmarty->assign('datePiDispoModif', filemtime('../js/datepicker.js'));
    $objSmarty->assign('frDispoMofi', filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign('clokDispoModif', filemtime('../js/jquery-clockpicker.min.js'));
    $objSmarty->assign('maskDispoModif', filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign('ckDispoModif', filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign('adapDispoModif', filemtime('../plugins/ckeditor/adapters/jquery.js'));
        
    $objSmarty->assign('jQuery_v1', filemtime('../js/jquery.js'));
    $objSmarty->assign('bootstrapDis', filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign('jqueryCustomMinDis', filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punhDis', filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('carouDis', filemtime('../js/caroufredsel.js'));
    $objSmarty->assign('plugDis', filemtime('../js/plugins.js'));
    $objSmarty->assign('breakpointsDis', filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('dataTablesDis', filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('preDis', filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('mContDis', filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('tagsDis', filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('switchDis', filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blockDis', filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnoDis', filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('themDis', filemtime('../js/theme.js'));
    $objSmarty->assign('cusDis', filemtime('../custom/custom.js'));
    $objSmarty->assign('btimDis', filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign('wizDis', filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('pickDis', filemtime('../js/datepicker.js'));
    $objSmarty->assign('frDis', filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign('clocDis', filemtime('../js/jquery-clockpicker.min.js'));
    $objSmarty->assign('zrDis', filemtime('../js/modernizr.js'));
    $objSmarty->assign('mobildetecDis', filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign('moderDis', filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign('maskDis', filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign('inMaskDis', filemtime('../js/jquery.inputmask.js'));
    $objSmarty->assign('ckDis', filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign('adDis', filemtime('../plugins/ckeditor/adapters/jquery.js'));
    
    $objSmarty->assign('jqInterpol', filemtime('js/jquery.js'));
    $objSmarty->assign('minInterpol', filemtime('js/bootstrap.min.js'));
    $objSmarty->assign('cMinInterpol', filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punchInterpol', filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('crInterpol', filemtime('js/caroufredsel.js'));
    $objSmarty->assign('plgInterpol', filemtime('js/plugins.js'));
    $objSmarty->assign('breackInterpol', filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('jqDtInterpol', filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('prtInterpol', filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('mCInterpol', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('mnInterpol', filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('smInterpol', filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blInterpol', filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnInterpol', filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('thInterpol', filemtime('js/theme.js'));
    $objSmarty->assign('ccInterpol', filemtime('custom/custom.js'));
    $objSmarty->assign('wiz_rdv_patient', filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('dpInterpol', filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('zrInterpol', filemtime('js/modernizr.js'));
    $objSmarty->assign('minInterpol', filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign('mzrInterpol', filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign('mskInterpol', filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign('wdInterpol', filemtime('js/compte_widget.js'));
    $objSmarty->assign('autoInterpol', filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign('cnInterpol', filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('mouseInterpol', filemtime('js/jquery.mousewheel.min.js'));
    $objSmarty->assign('e6Interpol', filemtime('js/liste_e6.js'));
    $objSmarty->assign('autoInterpol', filemtime('js/jquery.autocomplete.min.js'));

// agenda_box.tpl
$objSmarty->assign('menuAgenda', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgendaBox', filemtime('css/bootstrap-treeview.css'));
$objSmarty->assign('respAgandaBox', filemtime('css/header_responsive.css'));

// aganda_consult.tpl
$objSmarty->assign('tNuAgendaConsult', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgandaConsult', filemtime('css/bootstrap-treeview.css'));

//aganda_dispo_box.tpl
$objSmarty->assign('jConAgandaDispoBox', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgandaDispoBox', filemtime('css/bootstrap-treeview.css'));

//aganda_dispo_prestajule.tpl
$objSmarty->assign('xtAgandadispoPrestajule', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgandaDispoPrestajule', filemtime('css/bootstrap-treeview.css'));

//aganda_dispo_v3.tpl
$objSmarty->assign('xtAgandaDispoV3', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgandaDispoV3', filemtime('ss/bootstrap-treeview.css'));

//aganda_dispo_v4.tpl
$objSmarty->assign('xtAgandaDispoV4', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgandaDispoV4', filemtime('css/bootstrap-treeview.css'));

//agenda_dispo_vertical.tpl
$objSmarty->assign('xtAgandaDispoVertical', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('treeAgenDispoVertical', filemtime('css/bootstrap-treeview.css'));

//agenda_maquette.tpl
$objSmarty->assign('xtAgandaMaquette', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('tagsAgandaMaquette', filemtime('plugins/tagsInput/jquery.tagsinput.css'));

//agenda_tranche_dispo.tpl
$objSmarty->assign('xtAgandaTrancheDispo', filemtime('css/jquery.contextmenu.css'));
$objSmarty->assign('tagsAgandaTrancheDispo', filemtime('plugins/tagsInput/jquery.tagsinput.css'));

//agenda_vue_tous.tpl 
$objSmarty->assign('calAgandaVueTous', filemtime('css/calendar.css'));
$objSmarty->assign('iComoonAgandaVueTous', filemtime('css/font-icomoon.css'));
$objSmarty->assign('fullMinAgandaVueTous', filemtime('plugins/fullcalendar-v5/main.min.css'));
$objSmarty->assign('xtAgandaVueTous', filemtime('plugins/jquery-contextmenu/jquery.contextMenu.min.css'));
$objSmarty->assign('pikaAgandaVueTous', filemtime('plugins/pikaday1.8.2/pikaday.css'));

//erreur_droit.tpl
$objSmarty->assign('minErreurDroit', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('awErreurDroit', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('entErreurDroit', filemtime('css/font-entypo.css'));
$objSmarty->assign('fntErreurDroit', filemtime('css/fonts.css'));
$objSmarty->assign('mcjErreurDroit', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('prErreurDroit', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('iciErreurDroit', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('pnErreurDroit', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('ErreurDroit', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('mcErreurDroit', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('tagsErreurDroit', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('swErreurDroit', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('bs3ErreurDroit', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('minpikErreurDroit', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('clorErreurDroit', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('thErreurDroit', filemtime('css/theme.min.css'));
$objSmarty->assign('chrErreurDroit', filemtime('css/chrome.css'));
$objSmarty->assign('respErreurDroit', filemtime('css/theme-responsive.min.css'));
$objSmarty->assign('ccErreurDroit', filemtime('custom/custom.css'));

//form_consignes.tpl
$objSmarty->assign('listeConsign', filemtime('css/liste_consignes.css'));
$objSmarty->assign('clFormConsign', filemtime('css/calendar.css'));

//iframe
$objSmarty->assign('xtIframe', filemtime('css/jquery.contextmenu.css'));

//index_borne.tpl
$objSmarty->assign('bootIndexBorn', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('awIndexBorn', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('entIndexBorn', filemtime('css/font-entypo.css'));
$objSmarty->assign('ftIndexBorn', filemtime('css/fonts.css'));
$objSmarty->assign('cmIndexBorn', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('pretIndexBorn', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('iciIndexBorn', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('pnIndexBorn', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('prIndexBorn', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('mcIndexBorn', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('tagsIndexBorn', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('swIndexBorn', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('dateIndexBorn', filemtime('plugins/daterangepicker/daterangepicker-bs3.css"'));
$objSmarty->assign('tmIndexBorn', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('clorIndexBorn', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('wigIndexBorn', filemtime('custom/custom_widget.css'));
$objSmarty->assign('mcMinIndexBorn', filemtime('css/jquery.mCustomScrollbar.min.css'));
$objSmarty->assign('respIndexBorn', filemtime('css/theme-responsive.min.css'));
$objSmarty->assign('chrIndexBorn', filemtime('css/chrome.css'));
$objSmarty->assign('thIndexBorn', filemtime('css/theme.min.css'));
$objSmarty->assign('btdIndexBorn', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));

//index_change_mdp.tpl
$objSmarty->assign('bootIndexChange', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('awIndexChange', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('IentndexChange', filemtime('css/font-entypo.css'));
$objSmarty->assign('ftIndexChange', filemtime('css/fonts.css'));
$objSmarty->assign('cmIndexChange', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('prIndexChange', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('iciIndexChange', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('pnIndexChange', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('pretIndexChange', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('mcIndexChange', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('tagsIndexChange', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('swIndexChange', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('bs3IndexChange', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('mntIndexChange', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('clorIndexChange', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('thIndexChange', filemtime('css/theme.min.css'));
$objSmarty->assign('chrIndexChange', filemtime('css/chrome.css'));
$objSmarty->assign('repsIndexChange', filemtime('css/theme-responsive.min.css'));
$objSmarty->assign('ccIndexChange', filemtime('custom/custom.css'));

//index_public2.tpl
$objSmarty->assign('btpindexPub', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
$objSmarty->assign('DateindexPub', filemtime('plugins/dataTables/css/jquery.dataTables.css'));
$objSmarty->assign('clorindexPub', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmindexPub', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3indexPub', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWindexPub', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsindexPub', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCindexPub', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretindexPub', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnindexPub', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIindexPub', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('preindexPub', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmindexPub', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftindexPub', filemtime('css/fonts.css'));
$objSmarty->assign('entIndexPub', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWindexPub', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTindexPub', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccIndexPub', filemtime('custom/custom.css'));
$objSmarty->assign('respIndexPub', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrIndexPub', filemtime('css/chrome.css'));
$objSmarty->assign('thIndexPub', filemtime('css/theme.min.css'));

//modal_patient_traite.tpl
$objSmarty->assign('clorModalPatTraite', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmModalPatTraite', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3ModalPatTraite', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWModalPatTraite', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsModalPatTraite', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCModalPatTraite', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretModalPatTraite', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnModalPatTraite', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIModalPatTraite', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('preModalPatTraite', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmModalPatTraite', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftModalPatTraite', filemtime('css/fonts.css'));
$objSmarty->assign('entModalPatTraite', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWModalPatTraite', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTModalPatTraite', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccModalPatTraite', filemtime('custom/custom.css'));
$objSmarty->assign('respModalPatTraite', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrModalPatTraite', filemtime('css/chrome.css'));
$objSmarty->assign('thModalPatTraite', filemtime('css/theme.min.css'));

//modal_rdv_patient
$objSmarty->assign('clorModalRemplacant', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmModalRemplacant', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3ModalRemplacant', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWModalRdvPat', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsModalRdvPat', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCModalRdvPat', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretModalRdvPat', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnModalRdvPat', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIModalRdvPat', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('preModalRdvPat', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmModalRdvPat', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftModalRdvPat', filemtime('css/fonts.css'));
$objSmarty->assign('entModalRdvPat', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWModalRdvPat', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTModalRdvPat', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccModalRdvPat', filemtime('custom/custom.css'));
$objSmarty->assign('respModalRdvPat', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrModalRdvPat', filemtime('css/chrome.css'));
$objSmarty->assign('thModalRdvPat', filemtime('css/theme.min.css'));

//modal_remplacant.tpl
$objSmarty->assign('clorModalRemplacant', filemtime('../plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmModalRemplacant', filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3ModalRemplacant', filemtime('../plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWModalRemplacant', filemtime('../plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsModalRemplacant', filemtime('../plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCModalRemplacant', filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretModalRemplacant', filemtime('../plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnModalRemplacant', filemtime('../plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIModalRemplacant', filemtime('../plugins/isotope/css/isotope.css'));
$objSmarty->assign('preModalRemplacant', filemtime('../plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmModalRemplacant', filemtime('../plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftModalRemplacant', filemtime('css/fonts.css'));
$objSmarty->assign('entModalRemplacant', filemtime('../css/font-entypo.css'));
$objSmarty->assign('aWModalRemplacant', filemtime('../css/font-awesome.min.css'));
$objSmarty->assign('booTModalRemplacant', filemtime('../css/bootstrap.min.css'));
$objSmarty->assign('ccModalRemplacant', filemtime('../custom/custom.css'));
$objSmarty->assign('respModalRemplacant', filemtime('../css/theme-responsive.min.css'));
$objSmarty->assign('chrModalRemplacant', filemtime('css/chrome.css'));
$objSmarty->assign('thModalRemplacant', filemtime('../css/theme.min.css'));
$objSmarty->assign('clokModalRemplacant', filemtime('../css/jquery-clockpicker.min.css'));

//modal_widget_backoffice.tpl
$objSmarty->assign('clorModalWidgBack', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmModalWidgBack', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3ModalWidgBack', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWModalWidgBack', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsModalWidgBack', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCModalWidgBack', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretModalWidgBack', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnModalWidgBack', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIModalWidgBack', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('preModalWidgBack', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmModalWidgBack', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftModalWidgBack', filemtime('css/fonts.css'));
$objSmarty->assign('entModalWidgBack', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWModalWidgBack', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTModalWidgBack', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccModalWidgBack', filemtime('custom/custom_widget.css'));
$objSmarty->assign('respModalWidgBack', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrModalWidgBack', filemtime('css/chrome.css'));
$objSmarty->assign('thModalWidgBack', filemtime('css/theme.min.css'));
$objSmarty->assign('minMcModalWidgBack', filemtime('css/jquery.mCustomScrollbar.min.css'));
$objSmarty->assign('bddModalWidgBack', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));

//modal_widget_interpro.tpl
$objSmarty->assign('clorModalWidgetInterPro', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmModalWidgetInterPro', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3ModalWidgetInterPro', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWModalWidgetInterPro', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsModalWidgetInterPro', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCModalWidgetInterPro', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretModalWidgetInterPro', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnModalWidgetInterPro', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIModalWidgetInterPro', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('preModalWidgetInterPro', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmModalWidgetInterPro', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftModalWidgetInterPro', filemtime('css/fonts.css'));
$objSmarty->assign('entModalWidgetInterPro', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWModalWidgetInterPro', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTModalWidgetInterPro', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccModalWidgetInterPro', filemtime('custom/custom_widget.css'));
$objSmarty->assign('respModalWidgetInterPro', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrModalWidgetInterPro', filemtime('css/chrome.css'));
$objSmarty->assign('thModalWidgetInterPro', filemtime('css/theme.min.css'));
$objSmarty->assign('minMcModalWidgetInterPro', filemtime('css/jquery.mCustomScrollbar.min.css'));
$objSmarty->assign('bddModalWidgetInterPro', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));

//principal_itr.tpl
$objSmarty->assign('clorPrincipalItr', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmPrincipalItr', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3PrincipalItr', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWPrincipalItr', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsPrincipalItr', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCPrincipalItr', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretPrincipalItr', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnPrincipalItr', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIPrincipalItr', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('prePrincipalItr', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmPrincipalItr', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftPrincipalItr', filemtime('css/fonts.css'));
$objSmarty->assign('entPrincipalItr', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWPrincipalItr', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTPrincipalItr', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccPrincipalItr', filemtime('custom/custom.css'));
$objSmarty->assign('respPrincipalItr', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrPrincipalItr', filemtime('css/chrome.css'));
$objSmarty->assign('thPrincipalItr', filemtime('css/theme.css'));
$objSmarty->assign('bddPrincipalItr', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
$objSmarty->assign('dmdPrincipalItr', filemtime('plugins/dataTables/css/jquery.dataTables.min.css'));
$objSmarty->assign('fileUpPrincipalItr', filemtime('plugins/jquery-file-upload/css/jquery.fileupload.css'));
$objSmarty->assign('fileUiPrincipalItr', filemtime('plugins/jquery-file-upload/css/jquery.fileupload-ui.{}.css'));
$objSmarty->assign('wyPrincipalItr', filemtime('plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css'));
$objSmarty->assign('fllPrincipalItr', filemtime('plugins/fullcalendar-2.3.1/fullcalendar.css'));
$objSmarty->assign('fllPrintPrincipalItr', filemtime('plugins/fullcalendar-2.3.1/fullcalendar.print.css'));

//principal_simple.tpl
$objSmarty->assign('clorPrincipalSimple', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmPrincipalSimple', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3PrincipalSimple', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWPrincipalSimple', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsPrincipalSimple', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCPrincipalSimple', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretPrincipalSimple', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnPrincipalSimple', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIPrincipalSimple', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('prePrincipalSimple', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmPrincipalSimple', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftPrincipalSimple', filemtime('css/fonts.css'));
$objSmarty->assign('entPrincipalSimple', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWPrincipalSimple', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTPrincipalSimple', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccPrincipalSimple', filemtime('custom/custom.css'));
$objSmarty->assign('respPrincipalSimple', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrPrincipalSimple', filemtime('css/chrome.css'));
$objSmarty->assign('thPrincipalSimple', filemtime('css/theme.css'));
$objSmarty->assign('bddPrincipalSimple', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
$objSmarty->assign('dmdPrincipalSimple', filemtime('plugins/dataTables/css/jquery.dataTables.min.css'));
$objSmarty->assign('fileUpPrincipalSimple', filemtime('plugins/jquery-file-upload/css/jquery.fileupload.css'));
$objSmarty->assign('fileUiPrincipalSimple', filemtime('plugins/jquery-file-upload/css/jquery.fileupload-ui.{}.css'));
$objSmarty->assign('wyPrincipalSimple', filemtime('plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css'));
$objSmarty->assign('fllPrincipalSimple', filemtime('plugins/fullcalendar-2.3.1/fullcalendar.css'));
$objSmarty->assign('fllPrintPrincipalSimple', filemtime('plugins/fullcalendar-2.3.1/fullcalendar.print.css'));

//principal_v1.tpl
$objSmarty->assign('clorPrincipalV1', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmPrincipalV1', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3PrincipalV1', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWPrincipalV1', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsPrincipalV1', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCPrincipalV1', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretPrincipalV1', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnPrincipalV1', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIPrincipalV1', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('prePrincipalV1', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmPrincipalV1', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftPrincipalV1', filemtime('css/fonts.css'));
$objSmarty->assign('entPrincipalV1', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWPrincipalV1', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTPrincipalV1', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccPrincipalV1', filemtime('custom/custom.css'));
$objSmarty->assign('respPrincipalV1', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrPrincipalV1', filemtime('css/chrome.css'));
$objSmarty->assign('thPrincipalV1', filemtime('css/theme.css'));
$objSmarty->assign('bddPrincipalV1', filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
$objSmarty->assign('dmdPrincipalV1', filemtime('plugins/dataTables/css/jquery.dataTables.min.css'));
$objSmarty->assign('fileUpPrincipalV1', filemtime('plugins/jquery-file-upload/css/jquery.fileupload.css'));
$objSmarty->assign('fileUiPrincipalV1', filemtime('plugins/jquery-file-upload/css/jquery.fileupload-ui.{}.css'));
$objSmarty->assign('wyPrincipalV1', filemtime('plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css'));
$objSmarty->assign('fllPrincipalV1', filemtime('plugins/fullcalendar-2.5.0/fullcalendar.css'));
$objSmarty->assign('fllPrintPrincipalV1', filemtime('plugins/fullcalendar-2.5.0/fullcalendar.print.css'));
$objSmarty->assign('schPrincipalV1', filemtime('plugins/fullcalendar-2.5.0/scheduler.css'));

//restriction_fonctionnalite.tpl
$objSmarty->assign('clorRestrictFonction', filemtime('plugins/colorpicker/css/colorpicker.css'));
$objSmarty->assign('tmRestrictFonction', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
$objSmarty->assign('bs3RestrictFonction', filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
$objSmarty->assign('sWRestrictFonction', filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
$objSmarty->assign('tagsRestrictFonction', filemtime('plugins/tagsInput/jquery.tagsinput.css'));
$objSmarty->assign('mCRestrictFonction', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
$objSmarty->assign('pretRestrictFonction', filemtime('plugins/google-code-prettify/prettify.css'));
$objSmarty->assign('pnRestrictFonction', filemtime('plugins/pnotify/css/jquery.pnotify.css'));
$objSmarty->assign('icIRestrictFonction', filemtime('plugins/isotope/css/isotope.css'));
$objSmarty->assign('preRestrictFonction', filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
$objSmarty->assign('cmRestrictFonction', filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
$objSmarty->assign('ftRestrictFonction', filemtime('css/fonts.css'));
$objSmarty->assign('entRestrictFonction', filemtime('css/font-entypo.css'));
$objSmarty->assign('aWRestrictFonction', filemtime('css/font-awesome.min.css'));
$objSmarty->assign('booTRestrictFonction', filemtime('css/bootstrap.min.css'));
$objSmarty->assign('ccRestrictFonction', filemtime('custom/custom_widget.css'));
$objSmarty->assign('respRestrictFonction', filemtime('ss/theme-responsive.min.css'));
$objSmarty->assign('chrRestrictFonction', filemtime('css/chrome.css'));
$objSmarty->assign('thRestrictFonction', filemtime('css/theme.min.css'));







    include $sPageDirection;

    if ($pagesimple == "ok") {
        $objSmarty->display('principal_seul.tpl');
    } else if ($dir == "gestplanninreact") {
        $objSmarty->display('principal_react.tpl');
    }
    if ($dir == "rechdispo" or $dir == "rdvdeprogram" or $dir == "rdvsuppressiongroupe" and $dir == "rdvattenteconf") {
        $objSmarty->display('principal_vertical.tpl');
    } else {
        $objSmarty->display('principal.tpl');
    }

    $DB->closeConn();
    $objClassGenerique->db = null;
} catch (Exception $e) {
    echo $e->getMessage();
}
