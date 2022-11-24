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
    $tabListePatientType = $objBackoffice->liste_type_patient($objClassGenerique->identifiant_entite);
    $idPatientTypeDefaut = $objBackoffice->getIdDefautTypePatient($objClassGenerique->identifiant_entite);

    $sRequeteGetRaisonsAppelPatient = "SELECT * FROM alc_raison_appel_patient WHERE type_appel = 'patient' and supplogique_raison = 'N' and identifiant_entite = '" . $objClassGenerique->identifiant_entite . "'";
    $aTableauRaisonsAppelPatient = $DB->execute($sRequeteGetRaisonsAppelPatient);

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
    $objSmarty->assign('tabListePatientType', $tabListePatientType);
    $objSmarty->assign('idPatientTypeDefaut', $idPatientTypeDefaut);
    $objSmarty->assign('tabListeRaisonsAppelPatient', $aTableauRaisonsAppelPatient);
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
    
    $objSmarty->assign('datePickerFr',filemtime('js/datepicker-fr.js'));
        
    //gestion des fichiers js
    $objSmarty->assign('main',filemtime('plugins/fullcalendar-v5/main.min.js'));
    $datepicker->assign ('main',filemtime('js/datepicker-fr.js'));
    $time->assign ('main',filemtime('js/liste_e7.js?{$stime}'));
    $planning->assign ('main',filemtime('js/js_planning_dispo.js?{$stime}'));
    $contextMenu->assign ('main',filemtime('js/jquery.contextmenu.js'));
    $treeview->assign ('main',filemtime('js/bootstrap-treeview.js'));
    $modernizr_1->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetectMin_1->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr_1->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $jQuery_1->assign ('main',filemtime('js/jquery.js'));
    $bootstapMin_1->assign ('main',filemtime('js/bootstrap.min.js'));
    $pluginJqCustomMin->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $punchJqueryUiTouchPunchMin->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufRedSel_1->assign ('main',filemtime('js/caroufredsel.js'));
    $plugins_1->assign ('main',filemtime('js/plugins.js'));
    $pluginsBreackPoints_1->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $pluginsDataTableMin_1->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $pluginsPrettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $pluginsContactMain->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootstrapSwitchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $pluginsBlockUi->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pluginsPnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme_1->assign ('main',filemtime('js/theme.js'));
    $custumCustom->assign ('main',filemtime('custom/custom.js'));
    $mdp->assign ('main',filemtime('js/mdp.js'));
    $jquery->assign ('main',filemtime('js/jquery.js'));
    $bootstrap->assign ('main',filemtime('js/bootstrap.min.js'));
    $jqueryUi->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryUiTouch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $plugin->assign ('main',filemtime('js/plugins.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $mCustomScrollbar->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switch->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $mCustomScrollbarMin->assign ('main',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $mousewheel->assign ('main',filemtime('js/jquery.mousewheel.min.js'));
    $theme->assign ('main',filemtime('js/theme.js?{$stime}'));
    $custom->assign ('main',filemtime('custom/custom.js?{$stime}'));
    $bootstrapWizard->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $datepicker->assign ('main',filemtime('js/datepicker-fr.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $maskedinput->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $widgetAnes->assign ('main',filemtime('js/widget_anesthesiste.js?{$stime}'));
    $liste_e3->assign ('main',filemtime('js/liste_e3.js?{$stime}'));
    $inputmask->assign ('main',filemtime('js/inputmask.js'));
    $inputmaskJquery->assign ('main',filemtime('js/jquery.inputmask.js'));
    $intlTelInput->assign ('main',filemtime('js/intlTelInput.min.js'));
    $jQuery_1->assign ('main',filemtime('js/jquery.js'));
    $bootstrap_1->assign ('main',filemtime('js/bootstrap.min.js'));
    $customMin_1->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $touchPunchMin_1->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufRedSel_1->assign ('main',filemtime('js/caroufredsel.js'));
    $plugins_1->assign ('main',filemtime('js/plugins.js'));
    $breakPoint_1->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $DataTables_1->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto_1->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $contactMin_1->assign ('main',filemtime('jplugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput_1->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootstrapSwitchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $jQblockUi_1->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $contactMin_2->assign ('main',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $mouseWheelMin->assign ('main',filemtime('js/jquery.mousewheel.min.js'));
    $sTime_1->assign ('main',filemtime('js/theme.js?{$stime}'));
    $sTime_2->assign ('main',filemtime('custom/custom.js?{$stime}'));
    $bootstrapWizard->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $datePicker_1->assign ('main',filemtime('js/datepicker-fr.js'));
    $modernizr_1->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetectMin_1->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mibileDectectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $masketInputMin->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $widgetProfilage->assign ('main',filemtime('js/widget_profilage.js?{$stime}'));
    $inputMask->assign ('main',filemtime('js/inputmask.js'));
    $inputMask_1->assign ('main',filemtime('js/jquery.inputmask.js'));
    $commun->assign ('main',filemtime('js/commun.js?{$stime}'));
    $boostrapMin->assign ('main',filemtime('css/bootstrap.min.css'));
    $awesomeMin->assign ('main',filemtime('css/font-awesome.min.css'));
    $entypo_4->assign ('main',filemtime('css/font-entypo.css'));
    $fonts_5->assign ('main',filemtime('css/fonts.css'));
    $customMin->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $prettyphoto_8->assign ('main',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $isotope_2->assign ('main',filemtime('plugins/isotope/css/isotope.css'));
    $pnotify_3->assign ('main',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $prettify_4->assign ('main',filemtime('plugins/google-code-prettify/prettify.css'));
    $customScrollbar_2->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $tagsinput_3->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $boostrapSwitch_3->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $daterangepicker_1->assign ('main',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $jquery->assign ('main',filemtime('js/jquery.js'));
    $bootstrap->assign ('main',filemtime('js/bootstrap.min.js'));
    $jqueryUiCustom->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryUiTouch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $plugin->assign ('main',filemtime('js/plugins.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));

    $mCustomScrollbar->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switch->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $mCustomScrollbarMin->assign ('main',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $mousewheel->assign ('main',filemtime('js/jquery.mousewheel.min.js'));
    $theme->assign ('main',filemtime('js/theme.js?{$stime}'));
    $custom->assign ('main',filemtime('custom/custom.js?{$stime}'));
    $bootstrapWizard->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $datepicker->assign ('main',filemtime('js/datepicker-fr.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $maskedinput->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $liste_e1->assign ('main',filemtime('js/liste_e1.js?{$stime}'));
    $liste_e2->assign ('main',filemtime('js/liste_e2.js?{$stime}'));
    $liste_e3->assign ('main',filemtime('js/liste_e3.js?{$stime}'));
    $liste_e4->assign ('main',filemtime('js/liste_e4.js?{$stime}'));
    $compteWidget->assign ('main',filemtime('js/compte_widget.js?{$stime}'));
    $sequenceOrtho->assign ('main',filemtime('js/sequence_orthoptiste.js?{$stime}'));
    $sequenceOrthoDepist->assign ('main',filemtime('js/sequence_orthoptiste_depistage.js?{$stime}'));
    $sequenceOrthoDepan->assign ('main',filemtime('js/sequence_orthoptiste_depannage.js?{$stime}'));
    $sequenceRno->assign ('main',filemtime('js/sequence_rno_bis.js?{$stime}'));
    $sequenceOrthoGlobal->assign ('main',filemtime('js/sequence_orthoptiste_globale.js?{$stime}'));
    $inputmask->assign ('main',filemtime('js/inputmask.js'));
    $inputmaskJquery->assign ('main',filemtime('js/jquery.inputmask.js'));
    $intlTelInput->assign ('main',filemtime('js/intlTelInput.min.js'));
    $modernizr_1->assign ('main',filemtime('js/modernizr.js'));
    $jQuerry->assign ('main',filemtime('js/jquery.js'));
    $bootstrapMin->assign ('main',filemtime('js/bootstrap.min.js'));
    $jQuerUiCustom->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jQuerryUITouchPunchMin->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $plugins->assign ('main',filemtime('js/plugins.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $jQuerryDataTablesMin->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $jQuerryPrettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $jQuerrymCustomScrollBarConcatMin->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $jQuerryTagsInputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootstrapSwitchMin->assign ('main',filemtime('js/bootstrap.min.js'));
    $bootstrap_1->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $jQuerryBlockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $jQuerryPnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme->assign ('main',filemtime('js/theme.js'));
    $raphaelMin->assign ('main',filemtime('custom/custom.js'));
    $jQuerryBootstrapWizardMin->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetectMin->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE2->assign ('main',filemtime('js/liste_e2.js'));
    $listeE3->assign ('main',filemtime('js/liste_e3.js'));
    $listeE4->assign ('main',filemtime('js/liste_e4.js'));
    $compteWidget->assign ('main',filemtime('js/compte_widget.js'));
    $datepicker->assign ('main',filemtime('js/datepicker-fr.js'));
    $datepicker1->assign ('main',filemtime('js/datepicker-fr.js'));
    $cdnjsCloudflare->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $selectMin->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $libs_2->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $licdnjsCloudflaresteE1->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $datepicker->assign ('main',filemtime('js/datepicker-fr.js'));
    $datepicker1->assign ('main',filemtime('js/datepicker-fr.js'));
    $select2Min->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $datepicker3->assign ('main',filemtime('js/datepicker-fr.js'));
    $Query_1->assign ('main',filemtime('js/jquery.js'));
    $boostrapMin->assign ('main',filemtime('js/bootstrap.min.js'));
    $customMin->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $punchMin->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel_1->assign ('main',filemtime('js/caroufredsel.js'));
    $plugin_1->assign ('main',filemtime('js/plugins.js'));
    $breakpoint_1->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $datatableMin->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $Photo_1->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $concatMin->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsinputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockui_1->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $concatMin_2->assign ('main',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $mousewheelMin->assign ('main',filemtime('js/jquery.mousewheel.min.js'));
    $theme_1->assign ('main',filemtime('js/theme.js?{$stime}'));
    $custom_2->assign ('main',filemtime('custom/custom.js?{$stime}'));
    $wizardMin->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $datepicker_3->assign ('main',filemtime('js/datepicker-fr.js'));
    $mordernizr_3->assign ('main',filemtime('js/modernizr.js'));
    $detectMin_1->assign ('main',filemtime('js/mobile-detect.min.js'));
    $detectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $maskedinputMin->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $autocompleteMin->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $backoffice_1->assign ('main',filemtime('js/liste_widget_prise_rdv_backoffice.js'));
    $queryMin_1->assign ('main',filemtime('js/jquery.js'));
    $boostrapMin_2->assign ('main',filemtime('js/bootstrap.min.js'));
    $customMin_2->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $punchMin_2->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredselMin->assign ('main',filemtime('js/caroufredsel.js'));
    $pluginMin_2->assign ('main',filemtime('js/plugins.js'));
    $breakpoint_2->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $datatableMin_2->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $customscrollbarMin->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsinputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockuiMin->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $themeMin->assign ('main',filemtime('js/theme.js'));
    $customMin_3->assign ('main',filemtime('custom/custom.js'));
    $wizardMin_3->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $datepickerMin_3->assign ('main',filemtime('js/datepicker-fr.js'));
    $modernizrMin->assign ('main',filemtime('js/modernizr.js'));
    $detectMin->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $maskesdinputMin->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $compteWiddget->assign ('main',filemtime('js/compte_widget.js'));
    $autocompleteMin->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $inputmaskMin->assign ('main',filemtime('js/inputmask.js'));
    $inputmaskMin_2->assign ('main',filemtime('js/jquery.inputmask.js'));
    $momentMin->assign ('main',filemtime('js/moment.min.js'));
    $daterangepickerMin->assign ('main',filemtime('js/daterangepicker.js'));
    $select2Min->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $jQuery_8->assign ('main',filemtime('../js/jquery.js'));
    $bootstrapMin_8->assign ('main',filemtime('../js/bootstrap.min.js'));
    $jQcustomMin_8->assign ('main',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $punchMin_08->assign ('main',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufred_08->assign ('main',filemtime('../js/caroufredsel.js'));
    $plugins_08->assign ('main',filemtime('../js/plugins.js'));
    $pluginsBreakpointsBreakpoints_8->assign ('main',filemtime('../plugins/breakpoints/breakpoints.js'));
    $jqueryDataTablesMin_8->assign ('main',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $pluginJqueryPrettyPhoto_8->assign ('main',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $ContctMin_08->assign ('main',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput_08->assign ('main',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootstrapSwitchMin_8->assign ('main',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI_08->assign ('main',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $pNotify_01->assign ('main',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme_08->assign ('main',filemtime('../js/theme.js'));
    $custom_08->assign ('main',filemtime('../custom/custom.js'));
    $pickTime_08->assign ('main',filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $wizardMin_08->assign ('main',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $picker_8->assign ('main',filemtime('../js/datepicker-fr.js'));
    $dataPicker_8->assign ('main',filemtime('../js/datepicker-fr.js'));
    $clockPicker_8->assign ('main',filemtime('../js/jquery-clockpicker.min.js'));
    $modernzr_08->assign ('main',filemtime('../js/modernizr.js'));
    $mobileDetectMin_8->assign ('main',filemtime('../js/mobile-detect.min.js'));
    $mobileDetectModernizr_8->assign ('main',filemtime('../js/mobile-detect-modernizr.js'));
    $jqueryMaskedinputMin_8->assign ('main',filemtime('../js/jquery.maskedinput.min.js'));
    $pluginsCkeditorCkeditor_8->assign ('main',filemtime('../plugins/ckeditor/ckeditor.js'));
    $ckeditorAdaptersJquery_8->assign ('main',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $jQuery_9->assign ('main',filemtime('js/jquery.js'));
    $bootstrapMin_09->assign ('main',filemtime('js/bootstrap.min.js'));
    $customMin_09->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $touchPunch_09->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufRed_009->assign ('main',filemtime('js/caroufredsel.js'));
    $plugins_09->assign ('main',filemtime('js/plugins.js'));
    $breackPoint_09->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables_09->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto_09->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $contactMin_09->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput_09->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootStrap_09->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUi_09->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify_09->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme_09->assign ('main',filemtime('js/theme.js'));
    $customCustom_09->assign ('main',filemtime('custom/custom.js'));
    $maskedIput_09->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $wizardMin_09->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $frPicked_09->assign ('main',filemtime('js/datepicker-fr.js'));
    $modernizr_09->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetectMin_09->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectMdernizr_09->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $compteWidget_09->assign ('main',filemtime('js/compte_widget.js'));
    $autoCompleMin_09->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $selectMin_01->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $customCarousel_1->assign ('main',filemtime('js/customCarousel.js'));
    $jquery_2->assign ('main',filemtime('js/jquery.js'));
    $bootstrapMin->assign ('main',filemtime('js/bootstrap.min.js'));
    $jqueryCustumMin->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryUiTouchPunch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel_2->assign ('main',filemtime('js/caroufredsel.js'));
    $plugins_2->assign ('main',filemtime('js/plugins.js'));
    $breakPoints_2->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $jqueryDataTablesMin->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $jqueryPrettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $mCustomScrollBar_2->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $jqueryTagsInputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootstrapSwitchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $jqueryBlockUi->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $jqueryPnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $themeJs->assign ('main',filemtime('js/theme.js'));
    $custumJs->assign ('main',filemtime('custom/custom.js'));
    $jqueryBootstrapWizard->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $dataPicker_2->assign ('main',filemtime('js/datepicker-fr.js'));
    $modernizr_2->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetectMin->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $maskedInputMin->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $autoCompleteMin->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $select2Min->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $select2->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $jquery_1->assign ('main',filemtime('../js/jquery.js'));
    $boostrapMin->assign ('main',filemtime('../js/bootstrap.min.js'));
    $customMin->assign ('main',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $punchMin->assign ('main',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredelMax->assign ('main',filemtime('../js/caroufredsel.js'));
    $pluginMin->assign ('main',filemtime('../js/plugins.js'));
    $breakpointMin->assign ('main',filemtime('../plugins/breakpoints/breakpoints.js'));
    $datatableMin->assign ('main',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $PrettyPhoto->assign ('main',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $concatMin->assign ('main',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsMin->assign ('main',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $switchMax->assign ('main',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUi_1->assign ('main',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $pnotifyMin->assign ('main',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme_5->assign ('main',filemtime('../js/theme.js'));
    $custom_9->assign ('main',filemtime('../custom/custom.js'));
    $wizardMin->assign ('main',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $datepickerMin->assign ('main',filemtime('../js/datepicker.js'));
    $datepickerMin_2->assign ('main',filemtime('../js/datepicker-fr.js'));
    $clocpickerMin->assign ('main',filemtime('../js/jquery-clockpicker.min.js'));
    $modernizr_8->assign ('main',filemtime('../js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('../js/mobile-detect.min.js'));
    $modernizrDetect->assign ('main',filemtime('../js/mobile-detect-modernizr.js'));
    $maskedinputMin->assign ('main',filemtime('../js/jquery.maskedinput.min.js'));
    $ckeditorMax->assign ('main',filemtime('../plugins/ckeditor/ckeditor.js'));
    $ckeditorAdapter->assign ('main',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $select2Min->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $jQueryPlanning->assign ('main',filemtime('../js/jquery.js'));
    $bootstrapMiPlanning->assign ('main',filemtime('../js/bootstrap.min.js'));
    $jQcustomMiPlanning->assign ('main',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $punchMinPlanning->assign ('main',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredPlanning->assign ('main',filemtime('../js/caroufredsel.js'));
    $pluginsPlanning->assign ('main',filemtime('../js/plugins.js'));
    $pluginsBreakpointsBreakpoiPlanning->assign ('main',filemtime('../plugins/breakpoints/breakpoints.js'));
    $jqueryDataTablesPlanning->assign ('main',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $pluginJqueryPrettyPhPlanning->assign ('main',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $ContctMinPlanning->assign ('main',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInputPlanning->assign ('main',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $bootstrapSwitchPlanning->assign ('main',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUIPlanning->assign ('main',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $pNotifyPlanning->assign ('main',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $themePlanning->assign ('main',filemtime('../js/theme.js'));
    $customPlanning->assign ('main',filemtime('../custom/custom.js'));
    $wizardMinPlanning->assign ('main',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $dataPickerPlanning->assign ('main',filemtime('../js/datepicker-fr.js'));
    $timePickerPlanning->assign ('main',filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $pickerDatePlanning->assign ('main',filemtime('../js/datepicker.js'));
    $clockPickerPlanning->assign ('main',filemtime('../js/jquery-clockpicker.min.js'));
    $modernzrPlanning->assign ('main',filemtime('../js/modernizr.js'));
    $mobileDetectPlanning->assign ('main',filemtime('../js/mobile-detect.min.js'));
    $mobileDetectModernPlanning->assign ('main',filemtime('../js/mobile-detect-modernizr.js'));
    $jqueryMaskedinputPlanning->assign ('main',filemtime('../js/jquery.maskedinput.min.js'));
    $pluginsCkeditorCkPlanning->assign ('main',filemtime('../plugins/ckeditor/ckeditor.js'));
    $ckeditorAdaptersPlanning->assign ('main',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $jQryInputMaskPlanning->assign ('main',filemtime('../js/jquery.inputmask.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $fullCalendar->assign ('main',filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js   '));
    $bootstrap->assign ('main',filemtime('js/bootstrap.min.js'));

    $jqueryUi->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryUiTouch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $Plugin->assign ('main',filemtime('js/plugins.js'));
    $framwork->assign ('main',filemtime('js/framwork_js.js'));
    $autocomplete->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $mCustomScrollbar->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switch->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme->assign ('main',filemtime('js/theme.js'));
    $custom->assign ('main',filemtime('custom/custom.js'));
    $dataTables2->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $dataTables3->assign ('main',filemtime('plugins/dataTables/dataTables.bootstrap.js'));
    $datepicker->assign ('main',filemtime('js/datepicker-fr.js'));
    $timepicker->assign ('main',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $moment->assign ('main',filemtime('plugins/daterangepicker/moment.min.js'));
    $daterangepicker->assign ('main',filemtime('plugins/daterangepicker/daterangepicker.js'));
    $colorpicker->assign ('main',filemtime('plugins/colorpicker/colorpicker.js'));
    $loadImg->assign ('main',filemtime('plugins/jquery-file-upload/js/load-image.min.js'));
    $transport->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js'));
    $fileupload->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js'));
    $process->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js'));
    $image->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js'));
    $audio->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js'));
    $validate->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js'));
    $moment2->assign ('main',filemtime('plugins/fullcalendar-2.3.1/lib/moment.min.js'));
    $fullCalendar->assign ('main',filemtime('plugins/fullcalendar-2.3.1/fullcalendar.min.js'));
    $lang->assign ('main',filemtime('plugins/fullcalendar-2.3.1/lang-all.js'));
    $ckeditor->assign ('main',filemtime('plugins/ckeditor/ckeditor.js'));
    $adapters->assign ('main',filemtime('plugins/ckeditor/adapters/jquery.js'));
    $maskedinput->assign ('main',filemtime('js/jquery.maskedinput.min.js'));
    $maskchamps->assign ('main',filemtime('js/maskchamps.js'));
    $jQuerryMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/lib/jquery.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapMin->assign ('main',filemtime('js/bootstrap.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryCustomMin->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryUITouchPunchMin->assign ('main',filemtime('jplugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $plugins->assign ('main',filemtime('js/plugins.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $framwork_js->assign ('main',filemtime('js/framwork_js.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryAutoCompleteMin->assign ('main',filemtime('js/jquery.autocomplete.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryDataTablesMin->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryPrettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerrymCustomScrollBarConcatMin->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryTagsInputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapSwitchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryBlockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryPnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $datepicker->assign ('main',filemtime('js/datepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $datepickerFr->assign ('main',filemtime('js/datepicker-fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $theme->assign ('main',filemtime('js/theme.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $custom->assign ('main',filemtime('custom/custom.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryBootstrapWizardMin->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryDataTablesMin->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $dataTablebootstrap->assign ('main',filemtime('plugins/dataTables/dataTables.bootstrap.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapTimePickerMin->assign ('main',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $momentMin->assign ('main',filemtime('js/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $daterangepicker->assign ('main',filemtime('js/daterangepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $colorpicker->assign ('main',filemtime('plugins/colorpicker/colorpicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $loadImagMin->assign ('main',filemtime('plugins/jquery-file-upload/js/load-image.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryIframeTransport->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUpload->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadProcess->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadImage->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadAudio->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadValidate->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryUiMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/lib/jquery-ui.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $momentMin2->assign ('main',filemtime('plugins/fullcalendar-3.5.0/lib/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $fullCalendarMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/fullcalendar.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $fr->assign ('main',filemtime('plugins/fullcalendar-3.5.0/locale/fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $schedulerMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/scheduler.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $ckeditor->assign ('main',filemtime('plugins/ckeditor/ckeditor.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jquery3->assign ('main',filemtime('plugins/ckeditor/adapters/jquery.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jqueryMaskedInputMin->assign ('main',filemtime('js/jquery.maskedinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $maskchamps->assign ('main',filemtime('js/maskchamps.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapClockPickerMin->assign ('main',filemtime('js/bootstrap-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryClockPickerMin->assign ('main',filemtime('js/jquery-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $isotopKgdMin->assign ('main',filemtime('js/isotope.pkgd.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $inputMask->assign ('main',filemtime('js/inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryInputMask->assign ('main',filemtime('js/jquery.inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $intlTelInput->assign ('main',filemtime('js/intlTelInput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $principal->assign ('main',filemtime('js/principal.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $mdp->assign ('main',filemtime('js/mdp.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $fonctionAdv->assign ('main',filemtime('js/fonction_adv.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $modernizr->assign ('main',filemtime('js/modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $mobileDetectMin->assign ('main',filemtime('js/mobile-detect.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/lib/jquery.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapMin->assign ('main',filemtime('js/bootstrap.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryUICustomMin->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryUITouchPunchMin->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $plugins->assign ('main',filemtime('js/plugins.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $framwork_js->assign ('main',filemtime('js/framwork_js.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryAutoCompleteMin->assign ('main',filemtime('js/jquery.autocomplete.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryDataTablesMin->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryPrettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerrymCustomScrollBarConcatMin->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryTargsInputMin->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapSwitchMin->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryBlockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $datepicker->assign ('main',filemtime('js/datepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $datepickerFr->assign ('main',filemtime('js/datepicker-fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $theme->assign ('main',filemtime('js/theme.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $custom->assign ('main',filemtime('custom/custom.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryBootstrapWizardMin->assign ('main',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryDataTablesMin2->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $dataTablebootstrap->assign ('main',filemtime('plugins/dataTables/dataTables.bootstrap.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapTimePickerMin->assign ('main',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $momentMin->assign ('main',filemtime('js/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $daterangepicker->assign ('main',filemtime('js/daterangepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $colorpicker->assign ('main',filemtime('plugins/colorpicker/colorpicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $loadImagMin->assign ('main',filemtime('plugins/jquery-file-upload/js/load-image.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryIframeTransport->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUpload->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadProcess->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadImage->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadAudio->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryFileUploadValidate->assign ('main',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryUiMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/lib/jquery-ui.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $momentMin2->assign ('main',filemtime('plugins/fullcalendar-3.5.0/lib/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $fullCalendarMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/fullcalendar.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $fr->assign ('main',filemtime('plugins/fullcalendar-3.5.0/locale/fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $schedulerMin->assign ('main',filemtime('plugins/fullcalendar-3.5.0/scheduler.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $ckeditor->assign ('main',filemtime('plugins/ckeditor/ckeditor.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerry2->assign ('main',filemtime('plugins/ckeditor/adapters/jquery.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryMaskedInputMin->assign ('main',filemtime('js/jquery.maskedinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $maskchamps->assign ('main',filemtime('js/maskchamps.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $bootstrapClockPickerMin->assign ('main',filemtime('js/bootstrap-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryClockPickerMin->assign ('main',filemtime('js/jquery-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $isotopKgd->assign ('main',filemtime('js/isotope.pkgd.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $inputMask->assign ('main',filemtime('js/inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryInputMask->assign ('main',filemtime('js/jquery.inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $intlTelInputMin->assign ('main',filemtime('js/intlTelInput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $principal->assign ('main',filemtime('js/principal.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $functionRdvExist->assign ('main',filemtime('js/function_rdv_exist.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $mdp->assign ('main',filemtime('js/mdp.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $functionAdv->assign ('main',filemtime('js/fonction_adv.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $jQuerryPnotifyMin->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $loader->assign ('main',filemtime('https://www.gstatic.com/charts/loader.js'));
    $select2->assign ('main',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $jquery->assign ('main',filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $bootstrap->assign ('main',filemtime('js/bootstrap.min.js'));
    $jqueryCustom->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryTouch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $plugin->assign ('main',filemtime('js/plugins.js'));
    $framwork->assign ('main',filemtime('js/framwork_js.js'));
    $autocomplete->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.<?php echo $dataTables ?>.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $mCustomScrollbar->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switch->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme->assign ('main',filemtime('js/theme.js'));
    $custom->assign ('main',filemtime('custom/custom.js'));
    $fullcalendar->assign ('main',filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $bootstrap->assign ('main',filemtime('js/bootstrap.min.js'));
    $jquery->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryTouch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $plugin->assign ('main',filemtime('js/plugins.js'));
    $framwork->assign ('main',filemtime('js/framwork_js.js'));
    $autocomplete->assign ('main',filemtime('js/jquery.autocomplete.min.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $mCustomScrollbar->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switch->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme->assign ('main',filemtime('js/theme.js'));
    $custom->assign ('main',filemtime('custom/custom.js'));
    $modernizr->assign ('main',filemtime('js/modernizr.js'));
    $mobileDetect->assign ('main',filemtime('js/mobile-detect.min.js'));
    $mobileDetectModernizr->assign ('main',filemtime('js/mobile-detect-modernizr.js'));
    $jquery->assign ('main',filemtime('js/jquery.js'));
    $bootstrap->assign ('main',filemtime('js/bootstrap.min.js'));
    $jqueryCustom->assign ('main',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $jqueryTouch->assign ('main',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $caroufredsel->assign ('main',filemtime('js/caroufredsel.js'));
    $plugin->assign ('main',filemtime('js/plugins.js'));
    $breakpoints->assign ('main',filemtime('plugins/breakpoints/breakpoints.js'));
    $dataTables->assign ('main',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $prettyPhoto->assign ('main',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $mCustomScrollbar->assign ('main',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $tagsInput->assign ('main',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $switch->assign ('main',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $blockUI->assign ('main',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $pnotify->assign ('main',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $theme->assign ('main',filemtime('js/theme.js'));
    $custom->assign ('main',filemtime('custom/custom.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));
    $listeE1->assign ('main',filemtime('js/liste_e1.js'));






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
