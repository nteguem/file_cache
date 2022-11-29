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

    //liste_recommandations 
    $objSmarty->assign('jsQuery',filemtime('js/jquery.js'));
    $objSmarty->assign('bootstrapMin',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign('pluginsJquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('pluginsJqueryUiTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('couroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign('jsPlugins',filemtime('js/plugins.js'));
    $objSmarty->assign('pluginsBreakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('pluginsDatables',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('pluginsPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('pluginsMyCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('pluginsTagInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('pluginsBoostrap',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('pluginsBlockUi',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pluginsPNotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('theme',filemtime('js/theme.js'));
    $objSmarty->assign('custom',filemtime('custom/custom.js'));
    $objSmarty->assign('pluginsBootstrapWizard',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('datePicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('modernizr22',filemtime('js/modernizr.js'));
    $objSmarty->assign('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign('jquerryMaskedInput',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign('compteWidget',filemtime('js/compte_widget.js'));

    //modal degue
    $objSmarty->assign('jsRechercherCodePostal',filemtime('js/rechercher_code_postal.js'));

    //modal_disponilibite_duplication
    $objSmarty->assign('jQuery_2',filemtime('js/jquery.js'));
    $objSmarty->assign('bootstrapMin_02',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign('jQcustomMin_02',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punchMin_02',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('caroufred_03',filemtime('js/caroufredsel.js'));
    $objSmarty->assign('plugins_03',filemtime('js/plugins.js'));
    $objSmarty->assign('breackPoint_02',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('jqueryDataTablesMin_2',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('pluginJqueryPrettyPhoto_2',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));

    $objSmarty->assign('ContctMin_3',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('tagsInput_3',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));

    $objSmarty->assign('bootstrapSwitchMin_2',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));

    $objSmarty->assign('blockUI_3',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pNotify_3',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('theme_3',filemtime('js/theme.js'));

    $objSmarty->assign('custom_3',filemtime('custom/custom.js'));

    $objSmarty->assign('wizardMin_3',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));

    $objSmarty->assign('dataPickerFr_2',filemtime('js/js/datepicker-fr.js.js'));


    $objSmarty->assign('modernzr_2',filemtime('js/modernizr.js'));

    $objSmarty->assign('mobileDetectMin_2',filemtime('js/mobile-detect.min.js'));

    $objSmarty->assign('mobileDetectModernizr_2',filemtime('js/mobile-detect-modernizr.js'));

    $objSmarty->assign('jqueryMaskedinputMin_2',filemtime('js/jquery.maskedinput.min.js'));

    $objSmarty->assign('pluginsCkeditorCkeditor_2',filemtime('plugins/ckeditor/ckeditor.js'));

    $objSmarty->assign('ckeditorAdaptersJquery_2',filemtime('plugins/ckeditor/adapters/jquery.js'));

    //modal disponibilite supression box

    $objSmarty->assign('jQuery_7',filemtime('js/jquery.js'));
    $objSmarty->assign('bootstrapMin_07',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign('jQcustomMin_07',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punchMin_07',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));

    $objSmarty->assign('caroufred_07',filemtime('js/caroufredsel.js'));

    $objSmarty->assign('plugins_07',filemtime('js/plugins.js'));

    $objSmarty->assign('breackPoint_07',filemtime('plugins/breakpoints/breakpoints.js'));

    $objSmarty->assign('jqueryDataTablesMin_7',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    
    $objSmarty->assign('pluginJqueryPrettyPhoto_7',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));

    $objSmarty->assign('ContctMin_7',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));

    $objSmarty->assign('tagsInput_7',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('bootstrapSwitchMin_7',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));

    $objSmarty->assign('blockUI_7',filemtime('plugins/blockUI/jquery.blockUI.js'));

    $objSmarty->assign('pNotify_7',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('theme_7',filemtime('js/theme.js'));

    $objSmarty->assign('custom_7',filemtime('custom/custom.js'));
    $objSmarty->assign('wizardMin_7',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('dataPickerFr_7',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('modernzr_7',filemtime('js/modernizr.js'));
    $objSmarty->assign('mobileDetectMin_7',filemtime('js/mobile-detect.min.js'));

    $objSmarty->assign('mobileDetectModernizr_7',filemtime('js/mobile-detect-modernizr.js'));

    $objSmarty->assign('jqueryMaskedinputMin_7',filemtime('js/jquery.maskedinput.min.js'));

    $objSmarty->assign('pluginsCkeditorCkeditor_7',filemtime('plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign('ckeditorAdaptersJquery_7',filemtime('plugins/ckeditor/adapters/jquery.js'));

    //modal liste fiches patients 

    $objSmarty->assign('customCarousel_1',filemtime('js/customCarousel.js'));
    $objSmarty->assign('pluginsCkeditorCkeditor_7',filemtime('plugins/ckeditor/ckeditor.js'));

    //modal Patient profilage 

    $objSmarty->assign('jQueryPatient',filemtime('../js/jquery.js'));
    $objSmarty->assign('bootstrapMinPatient',filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign('jQcustomMinPatient',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('punchMinPatient',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('caroufredPatient',filemtime('../js/caroufredsel.js'));
    $objSmarty->assign('pluginsPatient',filemtime('../js/plugins.js'));
    $objSmarty->assign('pluginsBreakpointsBreakPatiPatient',filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('jqueryDataTablesPatient',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('pluginJqueryPrettyPatient',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('ContctMinPatient',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('tagsInputPatient',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('bootstrapSwitchPatient',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blockUIPatient',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pNotifyPatient',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('themePatient',filemtime('../js/theme.js'));
    $objSmarty->assign('customPatient',filemtime('../custom/custom.js'));
    $objSmarty->assign('wizardMinPatient',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('dataPickerPatient',filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign('modernzrPatient',filemtime('../js/modernizr.js'));
    $objSmarty->assign('mobileDetectPatient',filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign('mobileDetectModernPatient',filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign('jqueryMaskedinputPatient',filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign('autoCompletePatient',filemtime('../js/jquery.autocomplete.min.js'));
    $objSmarty->assign('principalPatient',filemtime('../js/principal.js'));

    $objSmarty->assign('intlTelInputPatient',filemtime('../js/intlTelInput.min.js'));
    $objSmarty->assign('maskChampPatient',filemtime('../js/maskchamps.js'));
    $objSmarty->assign('inputmaskPatient',filemtime('../js/inputmask.js'));
    $objSmarty->assign('jQueryInputMaskPatient',filemtime('../js/jquery.inputmask.js'));


    //fichiers css 

    //index_public_bloque.tpl
    $objSmarty->assign('cssBoostrapMinCss',filemtime('css/bootstrap.min.css'));
    $objSmarty->assign('cssFontAwesomeMinCss',filemtime('css/font-awesome.min.css'));
    $objSmarty->assign('cssFontEntypoCss',filemtime('css/font-entypo.css'));
    $objSmarty->assign('cssFontCss',filemtime('css/fonts.css'));
    $objSmarty->assign('pluginsJqueryUiJquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign('pluginsPrettyPhotoCss',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign('pluginsIsotopeCss',filemtime('plugins/isotope/css/isotope.css'));
    $objSmarty->assign('plugingsPnotifyCss',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign('pluginsGoogleCodeCss',filemtime('plugins/google-code-prettify/prettify.css'));
    $objSmarty->assign('pluginsMCustomScrollbarCss',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign('pluginsTagsInputCss',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign('pluginsBoostrapSwitchCss',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign('pluginsDaterangepickerCss',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign('pluginsBoostrapTimepickerCss',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
    $objSmarty->assign('pluginsColorpickerCss',filemtime('plugins/colorpicker/css/colorpicker.css'));
    $objSmarty->assign('pluginsDataTablesCss',filemtime('plugins/dataTables/css/jquery.dataTables.css'));
    $objSmarty->assign('pluginsDataTableCssBootstrap',filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
    $objSmarty->assign('cssThemeMinCss',filemtime('css/theme.min.css'));
    $objSmarty->assign('cssChromeCss',filemtime('css/chrome.css'));
    $objSmarty->assign('cssThemeResponsiveMinCss',filemtime('css/theme-responsive.min.css'));
    $objSmarty->assign('cssCustomCss',filemtime('custom/custom.css'));

    //index_public_compte 
    
    $objSmarty->assign('cssBoostrapMinCss',filemtime('css/bootstrap.min.css'));
    $objSmarty->assign('cssFontAwesomeMinCss',filemtime('css/font-awesome.min.css'));
    $objSmarty->assign('cssFontEntypoCss',filemtime('css/font-entypo.css'));
    $objSmarty->assign('cssFontCss',filemtime('css/fonts.css'));
    $objSmarty->assign('pluginsJqueryUiJquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign('pluginsPrettyPhotoCss',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign('pluginsIsotopeCss',filemtime('plugins/isotope/css/isotope.css'));
    $objSmarty->assign('plugingsPnotifyCss',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign('pluginsGoogleCodeCss',filemtime('plugins/google-code-prettify/prettify.css'));
    $objSmarty->assign('pluginsMCustomScrollbarCss',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign('pluginsTagsInputCss',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign('pluginsBoostrapSwitchCss',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign('pluginsDaterangepickerCss',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign('pluginsBoostrapTimepickerCss',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
    $objSmarty->assign('pluginsColorpickerCss',filemtime('plugins/colorpicker/css/colorpicker.css'));
    $objSmarty->assign('cssThemeMinCss',filemtime('css/theme.min.css'));
    $objSmarty->assign('cssChromeCss',filemtime('css/chrome.css'));
    $objSmarty->assign('cssThemeResponsiveMinCss',filemtime('css/theme-responsive.min.css'));
    $objSmarty->assign('cssJqueryMCustomScrollbarMinCss',filemtime('css/jquery.mCustomScrollbar.min.css'));
    $objSmarty->assign('cssCustomWidgetCss',filemtime('custom/custom_widget.css'));


    //index_public_profilage//////////////////////////////////////////
    $objSmarty->assign('cssBoostrapMinCss',filemtime('css/bootstrap.min.css'));
    $objSmarty->assign('cssFontAwesomeMinCss',filemtime('css/font-awesome.min.css'));
    $objSmarty->assign('cssFontEntypoCss',filemtime('css/font-entypo.css'));
    $objSmarty->assign('cssFontCss',filemtime('css/fonts.css'));
    $objSmarty->assign('pluginsJqueryUiJquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign('pluginsPrettyPhotoCss',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign('pluginsIsotopeCss',filemtime('plugins/isotope/css/isotope.css'));
    $objSmarty->assign('plugingsPnotifyCss',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign('pluginsGoogleCodeCss',filemtime('plugins/google-code-prettify/prettify.css'));
    $objSmarty->assign('pluginsMCustomScrollbarCss',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign('pluginsTagsInputCss',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign('pluginsBoostrapSwitchCss',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign('pluginsDaterangepickerCss',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign('pluginsBoostrapTimepickerCss',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
    $objSmarty->assign('pluginsColorpickerCss',filemtime('plugins/colorpicker/css/colorpicker.css'));

    $objSmarty->assign('cssThemeMinCss',filemtime('css/theme.min.css'));
    $objSmarty->assign('cssChromeCss',filemtime('css/chrome.css'));
    $objSmarty->assign('pluginsDataTablesCss',filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
    $objSmarty->assign('cssThemeResponsiveMinCss',filemtime('css/theme-responsive.min.css'));
    $objSmarty->assign('cssJqueryMCustomScrollbarMinCss',filemtime('css/jquery.mCustomScrollbar.min.css'));
    $objSmarty->assign('cssCustomWidgetCss',filemtime('custom/custom_widget.css'));

    //index_validation_profilage

     $objSmarty->assign('cssBoostrapMinCss',filemtime('css/bootstrap.min.css'));
    $objSmarty->assign('cssFontAwesomeMinCss',filemtime('css/font-awesome.min.css'));
    $objSmarty->assign('cssFontEntypoCss',filemtime('css/font-entypo.css'));
    $objSmarty->assign('cssFontCss',filemtime('css/fonts.css'));
    $objSmarty->assign('pluginsJqueryUiJquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign('pluginsPrettyPhotoCss',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign('pluginsIsotopeCss',filemtime('plugins/isotope/css/isotope.css'));
    $objSmarty->assign('plugingsPnotifyCss',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign('pluginsGoogleCodeCss',filemtime('plugins/google-code-prettify/prettify.css'));
    $objSmarty->assign('pluginsMCustomScrollbarCss',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign('pluginsTagsInputCss',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign('pluginsBoostrapSwitchCss',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign('pluginsDaterangepickerCss',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign('pluginsBoostrapTimepickerCss',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
    $objSmarty->assign('pluginsColorpickerCss',filemtime('plugins/colorpicker/css/colorpicker.css'));

    $objSmarty->assign('cssThemeMinCss',filemtime('css/theme.min.css'));
    $objSmarty->assign('cssChromeCss',filemtime('css/chrome.css'));
    $objSmarty->assign('cssThemeResponsiveMinCss',filemtime('css/theme-responsive.min.css'));
    $objSmarty->assign('cssCustomCss',filemtime('custom/custom.css'));

    // liste_centre_client.tpl

    $objSmarty->assign('cssBootstrapMinCss',filemtime('../css/bootstrap.min.css'));
    $objSmarty->assign('cssFontAwesomeCss',filemtime('../css/font-awesome.min.css'));
    $objSmarty->assign('cssFontEntypoCss',filemtime('../css/font-entypo.css'));
    $objSmarty->assign('cssFontCss',filemtime('../css/fonts.css'));
    $objSmarty->assign('pluginsJqueryUiJqueryUiCss',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign('pluginsPrettyPhotoPluginCss',filemtime('../plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign('pluginsIsotopeCss',filemtime('../plugins/isotope/css/isotope.css'));
    $objSmarty->assign('pluginsPnotifyCss',filemtime('../plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign('pluginsGoofleCodeCss',filemtime('../plugins/google-code-prettify/prettify.css'));
    $objSmarty->assign('pluginsMCustomScrollbarCss',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign('pluginsTagsInputCss',filemtime('../plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign('pluginsBootstrapSwitchCss',filemtime('../plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign('pluginsDaterangePickerCss',filemtime('../plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign('pluginsBootstrapTimepickerCss',filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
    $objSmarty->assign('pluginsColorpickerCss',filemtime('../plugins/colorpicker/css/colorpicker.css'));
    $objSmarty->assign('pluginsDatatablesCss',filemtime('../plugins/dataTables/css/jquery.dataTables.min.css'));
    $objSmarty->assign('pluginsDataTablesBootstrapCss',filemtime('../plugins/dataTables/css/dataTables.bootstrap.css'));
    $objSmarty->assign('pluginsJqueryFileUploadCss',filemtime('../plugins/jquery-file-upload/css/jquery.fileupload.css'));
    $objSmarty->assign('pluginsJqueryFileUploadUiCss',filemtime('../plugins/jquery-file-upload/css/jquery.fileupload-ui.css'));
    $objSmarty->assign('pluginsBootstrapWusiwygCss',filemtime('../plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css'));
    $objSmarty->assign('pluginsFullCalendar231',filemtime('../plugins/fullcalendar-2.3.1/fullcalendar.css'));
    $objSmarty->assign('pluginsFullcalendar231Print',filemtime('../plugins/fullcalendar-2.3.1/fullcalendar.print.css'));
    $objSmarty->assign('cssThemeCss',filemtime('../css/theme.css'));
    $objSmarty->assign('cssChromeCss',filemtime('../css/chrome.css'));
    $objSmarty->assign('cssThemeResponsiveCss',filemtime('../css/theme-responsive.min.css'));


    //modal_ajout_patient.tpl
    $objSmarty->assign('cssBoostrapMinCss',filemtime('css/bootstrap.min.css'));
    $objSmarty->assign('cssFontAwesomeMinCss',filemtime('css/font-awesome.min.css'));
    $objSmarty->assign('cssFontEntypoCss',filemtime('css/font-entypo.css'));
    $objSmarty->assign('cssFontCss',filemtime('css/fonts.css'));
    $objSmarty->assign('pluginsJqueryUiJquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign('pluginsPrettyPhotoCss',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign('pluginsIsotopeCss',filemtime('plugins/isotope/css/isotope.css'));
    $objSmarty->assign('plugingsPnotifyCss',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign('pluginsMCustomScrollbarCss',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign('pluginsTagsInputCss',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign('pluginsBoostrapSwitchCss',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign('pluginsDaterangepickerCss',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign('pluginsBoostrapTimepickerCss',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'));
    $objSmarty->assign('pluginsColorpickerCss',filemtime('plugins/colorpicker/css/colorpicker.css'));
    $objSmarty->assign('pluginsDataTableCssBootstrap',filemtime('plugins/dataTables/css/dataTables.bootstrap.css'));
    $objSmarty->assign('cssThemeMinCss',filemtime('css/theme.min.css'));
    $objSmarty->assign('cssChromeCss',filemtime('css/chrome.css'));
    $objSmarty->assign('cssThemeResponsiveMinCss',filemtime('css/theme-responsive.min.css'));
    $objSmarty->assign('cssJqueryMCustomScrollbarMinCss',filemtime('css/jquery.mCustomScrollbar.min.css'));
    $objSmarty->assign('cssCustomWidgetCss',filemtime('custom/custom_widget.css'));
    
   






    







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
