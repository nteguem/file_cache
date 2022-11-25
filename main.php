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
    

    // gestion fichiers    
    $objSmarty->assign('datePickerFr',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('jquery',filemtime('../js/jquery.js'));
    $objSmarty->assign('bootstrap',filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign('jqueryUi',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('jqueryUi',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('jqueryUiTouch',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('caroufredsel',filemtime('../js/caroufredsel.js'));
    $objSmarty->assign('plugin',filemtime('../js/plugins.js'));
    $objSmarty->assign('breakpoints',filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('dataTables',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('prettyPhoto',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('mCustomScrollbar',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('tagsInput',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('switch',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blockUI',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnotify',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('theme',filemtime('../js/theme.js'));
    $objSmarty->assign('custom',filemtime('../custom/custom.js'));
    $objSmarty->assign('wizard',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('datepicker',filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign('modernizr',filemtime('../js/modernizr.js'));
    $objSmarty->assign('mobileDetect',filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign('mobileDetectModernizr',filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign('maskedinput',filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign('ckeditor',filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign('jquery2',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign('listeDispo',filemtime('js/liste_dispo.js'));
    $objSmarty->assign('datepicker2',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('datepicker3',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('flot',filemtime('plugins/flot/jquery.flot.min.js'));
    $objSmarty->assign('resize',filemtime('plugins/flot/jquery.flot.resize.js'));
    $objSmarty->assign('pie',filemtime('plugins/flot/jquery.flot.pie.min.js'));
    $objSmarty->assign('categories',filemtime('plugins/flot/jquery.flot.categories.min.js'));
    $objSmarty->assign('time',filemtime('plugins/flot/jquery.flot.time.min.js'));
    $objSmarty->assign('animator',filemtime('plugins/flot/jquery.flot.animator.min.js'));
    $objSmarty->assign('Vector',filemtime('plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'));
    $objSmarty->assign('world',filemtime('plugins/jvectormap/jquery-jvectormap-world-mill-en.js'));
    $objSmarty->assign('skycons',filemtime('plugins/skycons/skycons.js'));
    $objSmarty->assign('select2',filemtime('https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'));
    $objSmarty->assign('jquerryContextMenu',filemtime('js/jquery.contextmenu.js'));
    $objSmarty->assign('boostrapTreeview ',filemtime('js/bootstrap-treeview.js'));

    $objSmarty->assign('datePicker_1 ',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('listeStime_1 ',filemtime('js/liste_e7.js'));
    $objSmarty->assign('listeStime_2 ',filemtime('js/js_planning_dispo.js'));
    $objSmarty->assign('jqContextMenu ',filemtime('js/jquery.contextmenu.js'));
    $objSmarty->assign('bootstrapTreeView ',filemtime('js/bootstrap-treeview.js'));
    $objSmarty->assign('listeE6 ',filemtime('js/liste_e6.js'));

    $objSmarty->assign('mobileDetect ',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign('mobileDetectModernizr ',filemtime('js/mobile-detect-modernizr.js'));

    $objSmarty->assign('datePicker ',filemtime('js/datepicker-fr.js'));

     $objSmarty->assign('listeDispo ',filemtime('js/liste_dispo.js'));


     $objSmarty->assign('jQuerry ',filemtime('js/jquery.js'));
     $objSmarty->assign('bootstrapMin ',filemtime('js/bootstrap.min.js'));
     $objSmarty->assign('jQuerryUICustomMin ',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('jQuerryUITouchPunchMin ',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
     $objSmarty->assign('caroufredsel ',filemtime('js/caroufredsel.js'));
     $objSmarty->assign('plugins ',filemtime('js/plugins.js'));
     $objSmarty->assign('breakpoints ',filemtime('plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('jQuerryDataTablesMin ',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('jQuerryPrettyPhoto ',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('jQuerrymCustomScrollBarConcatMin ',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('jQuerryTagsInputMin ',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('bootstratSwithMin ',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
     $objSmarty->assign('jQuerryBlockUi ',filemtime('plugins/blockUI/jquery.blockUI.js'));
     $objSmarty->assign('jQuerryPnotify ',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('jQuerrymCustomScrollBarConcatMin2 ',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('jQuerryMouseWheelMin ',filemtime('js/jquery.mousewheel.min.js'));
     $objSmarty->assign('theme ',filemtime('js/theme.js'));
     $objSmarty->assign('custom ',filemtime('custom/custom.js'));
     $objSmarty->assign('jQuerryBootstrapWizardMin ',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('datepickerFr ',filemtime('js/datepicker-fr.js'));
     $objSmarty->assign('mobileDetectMin ',filemtime('js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr ',filemtime('js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jQuerryMaskedInputMin ',filemtime('js/mobile-detect-modernizr.js'));

     $objSmarty->assign('themeTime ',filemtime('js/theme.js'));
     $objSmarty->assign('jquery_1 ',filemtime('js/jquery.js'));
     $objSmarty->assign('bootstrapMin ',filemtime('js/bootstrap.min.js'));
     $objSmarty->assign('jqueryUiCustumMin ',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('jqueryUiTouchPunchMin ',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
     $objSmarty->assign('caroufredsel_1',filemtime('js/caroufredsel.js'));
     $objSmarty->assign('plugins_1',filemtime('js/plugins.js'));
     $objSmarty->assign('pluginsBreakpoints_2',filemtime('plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('pluginsDataTablesJqueryDataTablesMin_2',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('pluginsPrettyPhoto_2',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('pluginsMcustomScrollbarConcatMin_2',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('pluginsTagsInputMin_1',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('pluginsBootstrapSwitchMin_1',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
     $objSmarty->assign('pluginsBlockUi_1',filemtime('plugins/blockUI/jquery.blockUI.js'));
     $objSmarty->assign('pluginsPnotifyMin_2',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('jqueryMcustomScrollbarConcatMin_2',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('jqueryMousewheelMin',filemtime('js/jquery.mousewheel.min.js'));
     $objSmarty->assign('customTime',filemtime('custom/custom.js'));
     $objSmarty->assign('pluginsBootstrapWizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('modernizr_1',filemtime('js/modernizr.js'));
     $objSmarty->assign('mobileDetectMin',filemtime('js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr_2',filemtime('js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jqueryMaskedidnputMin',filemtime('js/jquery.maskedinput.min.js'));
     $objSmarty->assign('compteWidgetTime',filemtime('js/compte_widget.js'));
     $objSmarty->assign('communTime',filemtime('js/commun.js'));
     $objSmarty->assign('inputmask',filemtime('js/inputmask.js'));
     $objSmarty->assign('jqueryInputmask',filemtime('js/jquery.inputmask.js'));
     $objSmarty->assign('intlTelInput',filemtime('js/intlTelInput.min.js'));
     $objSmarty->assign('jQuery_01',filemtime('js/jquery.js'));
     $objSmarty->assign('bootstrapMin_01',filemtime('js/bootstrap.min.js'));
     $objSmarty->assign('jQcustomMin_01',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('punchMin_001',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
     $objSmarty->assign('caroufred_02',filemtime('js/caroufredsel.js'));
     $objSmarty->assign('plugins_02',filemtime('js/plugins.js'));
     $objSmarty->assign('jqueryDataTablesMin_1',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('pluginJqueryPrettyPhoto_1',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('ContctMin_2',filemtime('lugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('tagsInput_2',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('bootstrapSwitchMin_1',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
     $objSmarty->assign('blockUI_2',filemtime('plugins/blockUI/jquery.blockUI.js'));
     $objSmarty->assign('pNotify_2',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('theme_2',filemtime('js/theme.js'));
     $objSmarty->assign('custom_2',filemtime('custom/custom.js'));
     $objSmarty->assign('timePickeMin',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
     $objSmarty->assign('wizardMin_2',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('dataPick',filemtime('js/datepicker.js'));
     $objSmarty->assign('dataPickerFr_1',filemtime('js/datepicker-fr.js'));
     $objSmarty->assign('clockPicker_1',filemtime('js/jquery-clockpicker.min.js'));
     $objSmarty->assign('modernzr_1',filemtime('js/modernizr.js'));
     $objSmarty->assign('mobileDetectMin_1',filemtime('js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr_1',filemtime('js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jqueryMaskedinputMin_1',filemtime('js/jquery.maskedinput.min.js'));
     $objSmarty->assign('pluginsCkeditorCkeditor_1',filemtime('plugins/ckeditor/ckeditor.js'));
     $objSmarty->assign('ckeditorAdaptersJquery_1',filemtime('plugins/ckeditor/adapters/jquery.js'));

     $objSmarty->assign('jQuery_6',filemtime('../js/jquery.js'));
     $objSmarty->assign('bootstrapMin_6',filemtime('../js/bootstrap.min.js'));
     $objSmarty->assign('jQcustomMin_6',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('punchMin_06',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
     $objSmarty->assign('caroufred_06',filemtime('../js/caroufredsel.js'));
     $objSmarty->assign('plugins_06',filemtime('../js/plugins.js'));
     $objSmarty->assign('pluginsBreakpointsBreakpoints_6',filemtime('../plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('jqueryDataTablesMin_6',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('pluginJqueryPrettyPhoto_6',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('ContctMin_06',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('tagsInput_06',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('bootstrapSwitchMin_6',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
     $objSmarty->assign('blockUI_06',filemtime('../plugins/blockUI/jquery.blockUI.js'));
     $objSmarty->assign('pNotify_06',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('theme_06',filemtime('../js/theme.js'));
     $objSmarty->assign('custom_06',filemtime('../custom/custom.js'));
     $objSmarty->assign('min_06',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('pickdate_06',filemtime('../js/datepicker-fr.js'));
     $objSmarty->assign('modernzr_06',filemtime('../js/modernizr.js'));
     $objSmarty->assign('mobileDetectMin_06',filemtime('../js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr_6',filemtime('../js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jqueryMaskedinputMin_6',filemtime('../js/jquery.maskedinput.min.js'));
     $objSmarty->assign('pluginsCkeditorCkeditor_6',filemtime('../plugins/ckeditor/ckeditor.js'));
     $objSmarty->assign('ckeditorAdaptersJquery_6',filemtime('../plugins/ckeditor/adapters/jquery.js'));

     $objSmarty->assign('jQuerry',filemtime('js/jquery.js'));
     $objSmarty->assign('bootstrapMin',filemtime('js/bootstrap.min.js'));
     $objSmarty->assign('jQuerryUICustomMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('jQuerryUITouchPunchMin',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
     $objSmarty->assign('caroufredsel',filemtime('js/caroufredsel.js'));
     $objSmarty->assign('plugins',filemtime('js/plugins.js'));
     $objSmarty->assign('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('jQuerryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('jQuerryPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('jQuerryUICustomScrollBarConcatMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('jqueryTagsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('bootstrapSwitchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
     $objSmarty->assign('jQuerryBlockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
     $objSmarty->assign('jQuerryPnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('theme',filemtime('js/theme.js'));
     $objSmarty->assign('custom',filemtime('custom/custom.js'));
     $objSmarty->assign('jQuerryBootstrapWizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('datepickerFr',filemtime('js/datepicker-fr.js'));
     $objSmarty->assign('mobileDetectMin',filemtime('js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jqueryMaskedInputMin',filemtime('js/jquery.maskedinput.min.js'));
     $objSmarty->assign('jqueryAutocompleteMin',filemtime('js/jquery.autocomplete.min.js'));

     $objSmarty->assign('jQuerry',filemtime('../js/jquery.js'));
     $objSmarty->assign('bootstrapMin',filemtime('../js/bootstrap.min.js'));
     $objSmarty->assign('jQuerryUICustomMin',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('jQuerryUITouchPunchMin',filemtime('../js/bootstrap.min.js'));
     $objSmarty->assign('caroufredsel',filemtime('../js/caroufredsel.js'));
     $objSmarty->assign('plugins',filemtime('../js/plugins.js'));
     $objSmarty->assign('breakpoints',filemtime('../plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('jQuerryDataTablesMin',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('jQuerryPrettyPhoto',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('jQuerryPrettyPhoto',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('jQuerrymCustomScrollBarConcatMin',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('jQuerryTagsInputMin',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('bootstrapSwitchMin',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
     $objSmarty->assign('jQuerryBlockUI',filemtime('../plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('jQuerryPnotifyMin',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('jQuerryClockPickerMin',filemtime('../js/jquery-clockpicker.min.js'));
     $objSmarty->assign('theme',filemtime('../js/theme.js'));
     $objSmarty->assign('custom',filemtime('../custom/custom.js'));
     $objSmarty->assign('jQuerryBootstrapWizardMin',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('datepickerFr',filemtime('../js/datepicker-fr.js'));
     $objSmarty->assign('mobileDetectMin',filemtime('../js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr',filemtime('../js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jQuerryMaskedInputMin',filemtime('../js/jquery.maskedinput.min.js'));
     $objSmarty->assign('ckeditor',filemtime('../plugins/ckeditor/ckeditor.js'));
     $objSmarty->assign('jquery2',filemtime('../plugins/ckeditor/adapters/jquery.js'));

     $objSmarty->assign('jQuerry',filemtime('js/jquery.js'));
     $objSmarty->assign('bootstrapMin',filemtime('js/bootstrap.min.js'));
     $objSmarty->assign('jQuerryUICustomMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
     $objSmarty->assign('jQuerryUITouchPunchMin',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
     $objSmarty->assign('caroufredsel',filemtime('js/caroufredsel.js'));
     $objSmarty->assign('plugins',filemtime('js/plugins.js'));
     $objSmarty->assign('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
     $objSmarty->assign('jQuerryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
     $objSmarty->assign('jQuerryPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
     $objSmarty->assign('jQuerrymCustomScrollBarConcatMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
     $objSmarty->assign('jQuerryTagsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
     $objSmarty->assign('bootstrapSwitchMin',filemtime('bootstrapSwitchMin'));
     $objSmarty->assign('jQuerryBlockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
     $objSmarty->assign('jQuerryPnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
     $objSmarty->assign('theme',filemtime('js/theme.js'));
     $objSmarty->assign('custom',filemtime('custom/custom.js'));
     $objSmarty->assign('bootstrapTimePickerMin',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
     $objSmarty->assign('jQuerryBootstrapWizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
     $objSmarty->assign('datepicker',filemtime('js/datepicker.js'));
     $objSmarty->assign('datepickerFr',filemtime('js/datepicker-fr.js'));
     $objSmarty->assign('jQuerryClockPickerMin',filemtime('js/jquery-clockpicker.min.js'));
     $objSmarty->assign('modernizr',filemtime('js/modernizr.js'));
     $objSmarty->assign('mobileDetectMin',filemtime('js/mobile-detect.min.js'));
     $objSmarty->assign('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
     $objSmarty->assign('jQuerryMaskedInputMin',filemtime('js/jquery.maskedinput.min.js'));
     $objSmarty->assign('ckeditor',filemtime('plugins/ckeditor/ckeditor.js'));
     $objSmarty->assign('jquery2',filemtime('plugins/ckeditor/adapters/jquery.js'));
     $objSmarty->assign('moderVertical',filemtime('js/modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('mobileDetecVertical',filemtime('js/mobile-detect.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('mobileDetectMdVertical',filemtime('js/mobile-detect-modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('literalFullCalender',filemtime('plugins/fullcalendar-3.5.0/lib/jquery.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('excanvas',filemtime('js/excanvas.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('bootstrapVertical',filemtime('js/bootstrap.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('customVertical',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('touchPuncVertical',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('caroufVertical',filemtime('js/caroufredsel.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('pluginVertical',filemtime('js/plugins.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('frameworkVertical',filemtime('js/framwork_js.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('autoVertical',filemtime('js/jquery.autocomplete.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('breackPoinVertical',filemtime('plugins/breakpoints/breakpoints.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('dataTableVertical',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('prettyPhotVertical',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('contactMinVertical',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('tagsInputVertical',filemtime('plugins/tagsInput/jquery.tagsinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('bootStrapVertical',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('blockUiVertical',filemtime('plugins/blockUI/jquery.blockUI.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('pnotify_1',filemtime('plugins/pnotify/js/jquery.pnotify.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('themeVertical',filemtime('js/theme.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('customCustomVertical',filemtime('custom/custom.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('pickerDateVertical',filemtime('js/datepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('datePickerVertical',filemtime('js/datepicker-fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('wizardVertical',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('dataTablesVertical',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('principalDataTableVertical',filemtime('plugins/dataTables/dataTables.bootstrap.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('timePickerVertical',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('momentVertical',filemtime('js/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('dateRange',filemtime('js/daterangepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('coloPickerVertical',filemtime('plugins/colorpicker/colorpicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('loadImageVertical',filemtime('plugins/jquery-file-upload/js/load-image.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('iframeTransVertical',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('fileUploadVertical',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('fileploadPrcessVertical',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('fileUploadAudioVertical',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js?v={/literal}{$numero_version_alaxione}{literal}"'));
     $objSmarty->assign('fileUploadValidateVertical',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('jQueryMinVertical',filemtime('plugins/fullcalendar-3.5.0/lib/jquery-ui.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('momentMinVertical',filemtime('plugins/fullcalendar-3.5.0/lib/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('ckeditorVertical',filemtime('plugins/ckeditor/ckeditor.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('aVerticla',filemtime('plugins/ckeditor/adapters/jquery.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('maskedInputVerticla',filemtime('js/jquery.maskedinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('maskChampVerticla',filemtime('js/maskchamps.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('bootstrapClockVertical',filemtime('js/bootstrap-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('jClockVertical',filemtime('js/jquery-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('isotopVertical',filemtime('js/isotope.pkgd.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('inputVertical',filemtime('js/inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('inputMaskVertical',filemtime('js/jquery.inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('intlTelVertical',filemtime('js/intlTelInput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('pincipalVertical',filemtime('js/principal.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('mdpVertical',filemtime('js/mdp.js?v={/literal}{$numero_version_alaxione}{literal}'));
     $objSmarty->assign('fonctionVertical',filemtime('js/fonction_adv.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign('main', filemtime('plugins/fullcalendar-v5/main.min.js'));
    $objSmarty->assign('datePickerFr', filemtime('js/datepicker-fr.js'));
    $objSmarty->assign('listeE7', filemtime('js/liste_e7.js?{$stime}'));
    $objSmarty->assign('planningDispo', filemtime('js/js_planning_dispo.js?{$stime}'));
    $objSmarty->assign('contextMenu', filemtime('js/jquery.contextmenu.js'));
    $objSmarty->assign('treeview', filemtime('js/bootstrap-treeview.js'));
    $objSmarty->assign('codePostal', filemtime('js/rechercher_code_postal.js'));
    $objSmarty->assign('listeE5', filemtime('js/liste_e5.js'));
    $objSmarty->assign('listeDispo', filemtime('js/liste_dispo.js?v={$numero_version_alaxione}'));
    $objSmarty->assign('planningDispo2', filemtime('js/js_planning_dispo.js?v={$numero_version_alaxione}'));
    $objSmarty->assign('contextMenu2', filemtime('js/jquery.contextmenu.js?v={$numero_version_alaxione}'));
    $objSmarty->assign('tagsInput', filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('listeE1', filemtime('js/liste_e1.js'));
    $objSmarty->assign('listeDispo2', filemtime('js/liste_dispo.js'));
    $objSmarty->assign('fullCalendar', filemtime('plugins/fullcalendar-v5/locales/fr.js'));
    $objSmarty->assign('pluginContextMenu', filemtime('plugins/jquery-contextmenu/jquery.contextMenu.min.js'));
    $objSmarty->assign('pluginContextMenuPosition', filemtime('plugins/jquery-contextmenu/jquery.ui.position.js'));
    $objSmarty->assign('pikaday', filemtime('plugins/pikaday1.8.2/pikaday.min.js'));
    $objSmarty->assign('calendar', filemtime('js/calendar.js'));
    $objSmarty->assign('calendrierTest', filemtime('js/calendrier_test.js'));
    $objSmarty->assign('jqueryFlot', filemtime('plugins/flot/jquery.flot.min.js'));
    $objSmarty->assign('jqueryFlotResize', filemtime('plugins/flot/jquery.flot.resize.js'));
    $objSmarty->assign('jqueryFlotCategories', filemtime('plugins/flot/jquery.flot.categories.min.js'));
    $objSmarty->assign('jqueryFlotTime', filemtime('plugins/flot/jquery.flot.time.min.js'));
    $objSmarty->assign('jqueryFlotAnimator', filemtime('plugins/flot/jquery.flot.animator.min.js'));
    $objSmarty->assign('vectorMap', filemtime('plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'));
    $objSmarty->assign('vectorMapMill', filemtime('plugins/jvectormap/jquery-jvectormap-world-mill-en.js'));
    $objSmarty->assign('skycons', filemtime('plugins/skycons/skycons.js'));
    $objSmarty->assign('dashboard', filemtime('js/dasboard.js'));
    $objSmarty->assign('jqueryFlotPieMin', filemtime('plugins/flot/jquery.flot.pie.min.js'));
    $objSmarty->assign('mobileDetect', filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign('mobileDetectModernizr', filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign('jquery', filemtime('js/jquery.js'));
    $objSmarty->assign('bootstrap', filemtime('js/bootstrap.min.js'));
    $objSmarty->assign('jqueryCustom', filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('jqueryTouch', filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('caroufredsel', filemtime('js/caroufredsel.js'));
    $objSmarty->assign('plugin', filemtime('js/plugins.js'));
    $objSmarty->assign('breakpoints', filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('dataTables', filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('prettyPhoto', filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('mCustomScrollbar', filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('bootstrapSwitch', filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blockUi', filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnotify', filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('theme', filemtime('js/theme.js'));
    $objSmarty->assign('custom', filemtime('custom/custom.js'));
    $objSmarty->assign('jquery2', filemtime('../js/jquery.js'));
    $objSmarty->assign('jqueryCustom2', filemtime('./plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign('jqueryTouch2', filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign('bootsrap2', filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign('caroufredsel2', filemtime('../js/caroufredsel.js'));
    $objSmarty->assign('plugin2', filemtime('../js/plugins.js'));
    $objSmarty->assign('breakpoints2', filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign('dataTables2', filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign('prettyPhoto2', filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign('mCustomScrollbar2', filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('bootstrapSwitch2', filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign('blockUi2', filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign('pnotify2', filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign('theme2', filemtime('../js/theme.js'));
    $objSmarty->assign('custom2', filemtime('../custom/custom.js'));
    $objSmarty->assign('tagsInput2', filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign('clockPicker', filemtime('../js/jquery-clockpicker.min.js'));
    $objSmarty->assign('bootstrapWizard', filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('bootstrapWizard2', filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign('datepicker2', filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign('modernizr2', filemtime('../js/modernizr.js'));
    $objSmarty->assign('mobileDetect2', filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign('mobileDetectModernizr2', filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign('maskedInput', filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign('maskedInput2', filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign('ckeditor', filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign('ckeditor2', filemtime('plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign('ckeditorQuery', filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign('ckeditorQuery2', filemtime('plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign('timepicker', filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign('timepicker2', filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign('datepicker3', filemtime('../js/datepicker.js'));
    $objSmarty->assign('queryCustomScrollbar', filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign('mouseWheel', filemtime('js/jquery.mousewheel.min.js'));
    $objSmarty->assign('themeTime', filemtime('js/theme.js?{$stime}'));
    $objSmarty->assign('customTime', filemtime('custom/custom.js?{$stime}'));
    $objSmarty->assign('autocomplete', filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign('listeWidget', filemtime('js/liste_widget_prise_rdv_backoffice.js?{$stime}'));
    $objSmarty->assign('raphaelMin', filemtime('js/raphael-min.js'));
    $objSmarty->assign('flowChart', filemtime('js/flowchart.min.js'));
    $objSmarty->assign('queryFlowChart', filemtime('js/jquery.flowchart.min.js'));
    $objSmarty->assign('exCanva', filemtime('js/excanvas.js'));
    $objSmarty->assign('compteWidget', filemtime('js/compte_widget.js'));
    $objSmarty->assign('html5shiv', filemtime('js/html5shiv.js'));
    $objSmarty->assign('respondMin', filemtime('js/respond.min.js'));
    $objSmarty->assign('moment', filemtime('js/moment.min.js'));
    $objSmarty->assign('daterangepicker', filemtime('js/daterangepicker.js'));
    $objSmarty->assign('chunk', filemtime('ReactCalendar/static/js/2.d219a3c2.chunk.js'));
    $objSmarty->assign('chunk2', filemtime('ReactCalendar/static/js/main.490dd087.chunk.js'));
    $objSmarty->assign('fullCalendar', filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js'));
    $objSmarty->assign('framWork', filemtime('js/framwork_js.js'));
    $objSmarty->assign('bootDataTable', filemtime('plugins/dataTables/dataTables.bootstrap.js'));
    $objSmarty->assign('daterangepickerMoment', filemtime('plugins/daterangepicker/moment.min.js'));
    $objSmarty->assign('daterangepicker', filemtime('plugins/daterangepicker/daterangepicker.js'));
    $objSmarty->assign('colorpicker', filemtime('plugins/colorpicker/colorpicker.js'));
    $objSmarty->assign('fileUpload', filemtime('plugins/jquery-file-upload/js/load-image.min.js'));
    $objSmarty->assign('iFrame', filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js'));
    $objSmarty->assign('queryFileUpload', filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js'));
    $objSmarty->assign('fileUploadProcess', filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js'));
    $objSmarty->assign('fileUploadImage', filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js'));
    $objSmarty->assign('fileUploadAudio', filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js'));
    $objSmarty->assign('fileUploadValidate', filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js'));
    $objSmarty->assign('fullCalendarMain', filemtime('plugins/fullcalendar-2.3.1/lib/moment.min.js'));
    $objSmarty->assign('fullCalendarMin', filemtime('plugins/fullcalendar-2.3.1/fullcalendar.min.js'));
    $objSmarty->assign('fullCalendarLang', filemtime('plugins/fullcalendar-2.3.1/lang-all.js'));
    $objSmarty->assign('fullCalendarJquery', filemtime('plugins/fullcalendar-2.5.0/lib/jquery.min.js'));
    $objSmarty->assign('fullCalendarMoment', filemtime('plugins/fullcalendar-2.5.0/lib/moment.min.js'));
    $objSmarty->assign('fullCalendarFull', filemtime('plugins/fullcalendar-2.5.0/fullcalendar.min.js'));
    $objSmarty->assign('calendarLang', filemtime('plugins/fullcalendar-2.5.0/lang-all.js'));
    $objSmarty->assign('calendarScheduler', filemtime('plugins/fullcalendar-2.5.0/scheduler.js'));
    $objSmarty->assign('calendarRightClick', filemtime('js/fullcalendar-rightclick.js'));
    $objSmarty->assign('maskChamps', filemtime('js/maskchamps.js'));


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
    $objSmarty->assign ('datepicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('time',filemtime('js/liste_e7.js?{$stime}'));
    $objSmarty->assign ('planning',filemtime('js/js_planning_dispo.js?{$stime}'));
    $objSmarty->assign ('contextMenu',filemtime('js/jquery.contextmenu.js'));
    $objSmarty->assign ('treeview',filemtime('js/bootstrap-treeview.js'));
    $objSmarty->assign ('modernizr_1',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetectMin_1',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr_1',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('jQuery_1',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstapMin_1',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('pluginJqCustomMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('punchJqueryUiTouchPunchMin',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufRedSel_1',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugins_1',filemtime('js/plugins.js'));
    $objSmarty->assign ('pluginsBreackPoints_1',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('pluginsDataTableMin_1',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('pluginsPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('pluginsContactMain',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootstrapSwitchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('pluginsBlockUi',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pluginsPnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme_1',filemtime('js/theme.js'));
    $objSmarty->assign ('custumCustom',filemtime('custom/custom.js'));
    $objSmarty->assign ('mdp',filemtime('js/mdp.js'));
    $objSmarty->assign ('jquery',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrap',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jqueryUi',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryUiTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugin',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('mCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switch',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('mCustomScrollbarMin',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('mousewheel',filemtime('js/jquery.mousewheel.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js?{$stime}'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js?{$stime}'));
    $objSmarty->assign ('bootstrapWizard',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('maskedinput',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('widgetAnes',filemtime('js/widget_anesthesiste.js?{$stime}'));
    $objSmarty->assign ('liste_e3',filemtime('js/liste_e3.js?{$stime}'));
    $objSmarty->assign ('inputmask',filemtime('js/inputmask.js'));
    $objSmarty->assign ('inputmaskJquery',filemtime('js/jquery.inputmask.js'));
    $objSmarty->assign ('intlTelInput',filemtime('js/intlTelInput.min.js'));
    $objSmarty->assign ('jQuery_1',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrap_1',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('customMin_1',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('touchPunchMin_1',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufRedSel_1',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugins_1',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakPoint_1',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('DataTables_1',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto_1',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('contactMin_1',filemtime('jplugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput_1',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootstrapSwitchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('jQblockUi_1',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('contactMin_2',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('mouseWheelMin',filemtime('js/jquery.mousewheel.min.js'));
    $objSmarty->assign ('sTime_1',filemtime('js/theme.js?{$stime}'));
    $objSmarty->assign ('sTime_2',filemtime('custom/custom.js?{$stime}'));
    $objSmarty->assign ('bootstrapWizard',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('datePicker_1',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('modernizr_1',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetectMin_1',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mibileDectectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('masketInputMin',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('widgetProfilage',filemtime('js/widget_profilage.js?{$stime}'));
    $objSmarty->assign ('inputMask',filemtime('js/inputmask.js'));
    $objSmarty->assign ('inputMask_1',filemtime('js/jquery.inputmask.js'));
    $objSmarty->assign ('commun',filemtime('js/commun.js?{$stime}'));
    $objSmarty->assign ('boostrapMin',filemtime('css/bootstrap.min.css'));
    $objSmarty->assign ('awesomeMin',filemtime('css/font-awesome.min.css'));
    $objSmarty->assign ('entypo_4',filemtime('css/font-entypo.css'));
    $objSmarty->assign ('fonts_5',filemtime('css/fonts.css'));
    $objSmarty->assign ('customMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.css'));
    $objSmarty->assign ('prettyphoto_8',filemtime('plugins/prettyPhoto-plugin/css/prettyPhoto.css'));
    $objSmarty->assign ('isotope_2',filemtime('plugins/isotope/css/isotope.css'));
    $objSmarty->assign ('pnotify_3',filemtime('plugins/pnotify/css/jquery.pnotify.css'));
    $objSmarty->assign ('prettify_4',filemtime('plugins/google-code-prettify/prettify.css'));
    $objSmarty->assign ('customScrollbar_2',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'));
    $objSmarty->assign ('tagsinput_3',filemtime('plugins/tagsInput/jquery.tagsinput.css'));
    $objSmarty->assign ('boostrapSwitch_3',filemtime('plugins/bootstrap-switch/bootstrap-switch.css'));
    $objSmarty->assign ('daterangepicker_1',filemtime('plugins/daterangepicker/daterangepicker-bs3.css'));
    $objSmarty->assign ('jquery',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrap',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jqueryUiCustom',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryUiTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugin',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));

    $objSmarty->assign ('mCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switch',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('mCustomScrollbarMin',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('mousewheel',filemtime('js/jquery.mousewheel.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js?{$stime}'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js?{$stime}'));
    $objSmarty->assign ('bootstrapWizard',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('maskedinput',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('liste_e1',filemtime('js/liste_e1.js?{$stime}'));
    $objSmarty->assign ('liste_e2',filemtime('js/liste_e2.js?{$stime}'));
    $objSmarty->assign ('liste_e3',filemtime('js/liste_e3.js?{$stime}'));
    $objSmarty->assign ('liste_e4',filemtime('js/liste_e4.js?{$stime}'));
    $objSmarty->assign ('compteWidget',filemtime('js/compte_widget.js?{$stime}'));
    $objSmarty->assign ('sequenceOrtho',filemtime('js/sequence_orthoptiste.js?{$stime}'));
    $objSmarty->assign ('sequenceOrthoDepist',filemtime('js/sequence_orthoptiste_depistage.js?{$stime}'));
    $objSmarty->assign ('sequenceOrthoDepan',filemtime('js/sequence_orthoptiste_depannage.js?{$stime}'));
    $objSmarty->assign ('sequenceRno',filemtime('js/sequence_rno_bis.js?{$stime}'));
    $objSmarty->assign ('sequenceOrthoGlobal',filemtime('js/sequence_orthoptiste_globale.js?{$stime}'));
    $objSmarty->assign ('inputmask',filemtime('js/inputmask.js'));
    $objSmarty->assign ('inputmaskJquery',filemtime('js/jquery.inputmask.js'));
    $objSmarty->assign ('intlTelInput',filemtime('js/intlTelInput.min.js'));
    $objSmarty->assign ('modernizr_1',filemtime('js/modernizr.js'));
    $objSmarty->assign ('jQuerry',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrapMin',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jQuerUiCustom',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jQuerryUITouchPunchMin',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugins',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('jQuerryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('jQuerryPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('jQuerrymCustomScrollBarConcatMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('jQuerryTagsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootstrapSwitchMin',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('bootstrap_1',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('jQuerryBlockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('jQuerryPnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js'));
    $objSmarty->assign ('raphaelMin',filemtime('custom/custom.js'));
    $objSmarty->assign ('jQuerryBootstrapWizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetectMin',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('listeE1',filemtime('js/liste_e1.js'));
    $objSmarty->assign ('listeE2',filemtime('js/liste_e2.js'));
    $objSmarty->assign ('listeE3',filemtime('js/liste_e3.js'));
    $objSmarty->assign ('listeE4',filemtime('js/liste_e4.js'));
    $objSmarty->assign ('compteWidget',filemtime('js/compte_widget.js'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('datepicker1',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('datepicker1',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('datepicker3',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('Query_1',filemtime('js/jquery.js'));
    $objSmarty->assign ('boostrapMin',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('customMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('punchMin',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel_1',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugin_1',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakpoint_1',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('datatableMin',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('Photo_1',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('concatMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsinputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockui_1',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('concatMin_2',filemtime('js/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('mousewheelMin',filemtime('js/jquery.mousewheel.min.js'));
    $objSmarty->assign ('theme_1',filemtime('js/theme.js?{$stime}'));
    $objSmarty->assign ('custom_2',filemtime('custom/custom.js?{$stime}'));
    $objSmarty->assign ('wizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('datepicker_3',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('mordernizr_3',filemtime('js/modernizr.js'));
    $objSmarty->assign ('detectMin_1',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('detectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('maskedinputMin',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('autocompleteMin',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('backoffice_1',filemtime('js/liste_widget_prise_rdv_backoffice.js'));
    $objSmarty->assign ('queryMin_1',filemtime('js/jquery.js'));
    $objSmarty->assign ('boostrapMin_2',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('customMin_2',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('punchMin_2',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredselMin',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('pluginMin_2',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakpoint_2',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('datatableMin_2',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('customscrollbarMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsinputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockuiMin',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('themeMin',filemtime('js/theme.js'));
    $objSmarty->assign ('customMin_3',filemtime('custom/custom.js'));
    $objSmarty->assign ('wizardMin_3',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('datepickerMin_3',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('modernizrMin',filemtime('js/modernizr.js'));
    $objSmarty->assign ('detectMin',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('maskesdinputMin',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('compteWiddget',filemtime('js/compte_widget.js'));
    $objSmarty->assign ('autocompleteMin',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('inputmaskMin',filemtime('js/inputmask.js'));
    $objSmarty->assign ('inputmaskMin_2',filemtime('js/jquery.inputmask.js'));
    $objSmarty->assign ('momentMin',filemtime('js/moment.min.js'));
    $objSmarty->assign ('daterangepickerMin',filemtime('js/daterangepicker.js'));
    $objSmarty->assign ('jQuery_8',filemtime('../js/jquery.js'));
    $objSmarty->assign ('bootstrapMin_8',filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign ('jQcustomMin_8',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('punchMin_08',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufred_08',filemtime('../js/caroufredsel.js'));
    $objSmarty->assign ('plugins_08',filemtime('../js/plugins.js'));
    $objSmarty->assign ('pluginsBreakpointsBreakpoints_8',filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('jqueryDataTablesMin_8',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('pluginJqueryPrettyPhoto_8',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('ContctMin_08',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput_08',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootstrapSwitchMin_8',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI_08',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pNotify_01',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme_08',filemtime('../js/theme.js'));
    $objSmarty->assign ('custom_08',filemtime('../custom/custom.js'));
    $objSmarty->assign ('pickTime_08',filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign ('wizardMin_08',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('picker_8',filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign ('dataPicker_8',filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign ('clockPicker_8',filemtime('../js/jquery-clockpicker.min.js'));
    $objSmarty->assign ('modernzr_08',filemtime('../js/modernizr.js'));
    $objSmarty->assign ('mobileDetectMin_8',filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr_8',filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('jqueryMaskedinputMin_8',filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('pluginsCkeditorCkeditor_8',filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign ('ckeditorAdaptersJquery_8',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign ('jQuery_9',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrapMin_09',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('customMin_09',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('touchPunch_09',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufRed_009',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugins_09',filemtime('js/plugins.js'));
    $objSmarty->assign ('breackPoint_09',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables_09',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto_09',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('contactMin_09',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput_09',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootStrap_09',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUi_09',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify_09',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme_09',filemtime('js/theme.js'));
    $objSmarty->assign ('customCustom_09',filemtime('custom/custom.js'));
    $objSmarty->assign ('maskedIput_09',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('wizardMin_09',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('frPicked_09',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('modernizr_09',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetectMin_09',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectMdernizr_09',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('compteWidget_09',filemtime('js/compte_widget.js'));
    $objSmarty->assign ('autoCompleMin_09',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('customCarousel_1',filemtime('js/customCarousel.js'));
    $objSmarty->assign ('jquery_2',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrapMin',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jqueryCustumMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryUiTouchPunch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel_2',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugins_2',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakPoints_2',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('jqueryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('jqueryPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('mCustomScrollBar_2',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('jqueryTagsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootstrapSwitchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('jqueryBlockUi',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('jqueryPnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('themeJs',filemtime('js/theme.js'));
    $objSmarty->assign ('custumJs',filemtime('custom/custom.js'));
    $objSmarty->assign ('jqueryBootstrapWizard',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('dataPicker_2',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('modernizr_2',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetectMin',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('maskedInputMin',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('autoCompleteMin',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('jquery_1',filemtime('../js/jquery.js'));
    $objSmarty->assign ('boostrapMin',filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign ('customMin',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('punchMin',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredelMax',filemtime('../js/caroufredsel.js'));
    $objSmarty->assign ('pluginMin',filemtime('../js/plugins.js'));
    $objSmarty->assign ('breakpointMin',filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('datatableMin',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('PrettyPhoto',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('concatMin',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsMin',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switchMax',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUi_1',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotifyMin',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme_5',filemtime('../js/theme.js'));
    $objSmarty->assign ('custom_9',filemtime('../custom/custom.js'));
    $objSmarty->assign ('wizardMin',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('datepickerMin',filemtime('../js/datepicker.js'));
    $objSmarty->assign ('datepickerMin_2',filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign ('clocpickerMin',filemtime('../js/jquery-clockpicker.min.js'));
    $objSmarty->assign ('modernizr_8',filemtime('../js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign ('modernizrDetect',filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('maskedinputMin',filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('ckeditorMax',filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign ('ckeditorAdapter',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign ('jQueryPlanning',filemtime('../js/jquery.js'));
    $objSmarty->assign ('bootstrapMiPlanning',filemtime('../js/bootstrap.min.js'));
    $objSmarty->assign ('jQcustomMiPlanning',filemtime('../plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('punchMinPlanning',filemtime('../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredPlanning',filemtime('../js/caroufredsel.js'));
    $objSmarty->assign ('pluginsPlanning',filemtime('../js/plugins.js'));
    $objSmarty->assign ('pluginsBreakpointsBreakpoiPlanning',filemtime('../plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('jqueryDataTablesPlanning',filemtime('../plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('pluginJqueryPrettyPhPlanning',filemtime('../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('ContctMinPlanning',filemtime('../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInputPlanning',filemtime('../plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('bootstrapSwitchPlanning',filemtime('../plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUIPlanning',filemtime('../plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pNotifyPlanning',filemtime('../plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('themePlanning',filemtime('../js/theme.js'));
    $objSmarty->assign ('customPlanning',filemtime('../custom/custom.js'));
    $objSmarty->assign ('wizardMinPlanning',filemtime('../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'));
    $objSmarty->assign ('dataPickerPlanning',filemtime('../js/datepicker-fr.js'));
    $objSmarty->assign ('timePickerPlanning',filemtime('../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign ('pickerDatePlanning',filemtime('../js/datepicker.js'));
    $objSmarty->assign ('clockPickerPlanning',filemtime('../js/jquery-clockpicker.min.js'));
    $objSmarty->assign ('modernzrPlanning',filemtime('../js/modernizr.js'));
    $objSmarty->assign ('mobileDetectPlanning',filemtime('../js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernPlanning',filemtime('../js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('jqueryMaskedinputPlanning',filemtime('../js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('pluginsCkeditorCkPlanning',filemtime('../plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign ('ckeditorAdaptersPlanning',filemtime('../plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign ('jQryInputMaskPlanning',filemtime('../js/jquery.inputmask.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('fullCalendar',filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js   '));
    $objSmarty->assign ('bootstrap',filemtime('js/bootstrap.min.js'));

    $objSmarty->assign ('jqueryUi',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryUiTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('Plugin',filemtime('js/plugins.js'));
    $objSmarty->assign ('framwork',filemtime('js/framwork_js.js'));
    $objSmarty->assign ('autocomplete',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('mCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switch',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js'));
    $objSmarty->assign ('dataTables2',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('dataTables3',filemtime('plugins/dataTables/dataTables.bootstrap.js'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker-fr.js'));
    $objSmarty->assign ('timepicker',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'));
    $objSmarty->assign ('moment',filemtime('plugins/daterangepicker/moment.min.js'));
    $objSmarty->assign ('daterangepicker',filemtime('plugins/daterangepicker/daterangepicker.js'));
    $objSmarty->assign ('colorpicker',filemtime('plugins/colorpicker/colorpicker.js'));
    $objSmarty->assign ('loadImg',filemtime('plugins/jquery-file-upload/js/load-image.min.js'));
    $objSmarty->assign ('transport',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js'));
    $objSmarty->assign ('fileupload',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js'));
    $objSmarty->assign ('process',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js'));
    $objSmarty->assign ('image',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js'));
    $objSmarty->assign ('audio',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js'));
    $objSmarty->assign ('validate',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js'));
    $objSmarty->assign ('moment2',filemtime('plugins/fullcalendar-2.3.1/lib/moment.min.js'));
    $objSmarty->assign ('fullCalendar',filemtime('plugins/fullcalendar-2.3.1/fullcalendar.min.js'));
    $objSmarty->assign ('lang',filemtime('plugins/fullcalendar-2.3.1/lang-all.js'));
    $objSmarty->assign ('ckeditor',filemtime('plugins/ckeditor/ckeditor.js'));
    $objSmarty->assign ('adapters',filemtime('plugins/ckeditor/adapters/jquery.js'));
    $objSmarty->assign ('maskedinput',filemtime('js/jquery.maskedinput.min.js'));
    $objSmarty->assign ('maskchamps',filemtime('js/maskchamps.js'));
    $objSmarty->assign ('jQuerryMin',filemtime('plugins/fullcalendar-3.5.0/lib/jquery.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapMin',filemtime('js/bootstrap.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryCustomMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryUITouchPunchMin',filemtime('jplugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('plugins',filemtime('js/plugins.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('framwork_js',filemtime('js/framwork_js.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryAutoCompleteMin',filemtime('js/jquery.autocomplete.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerrymCustomScrollBarConcatMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryTagsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapSwitchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryBlockUI',filemtime('plugins/blockUI/jquery.blockUI.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryPnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('datepickerFr',filemtime('js/datepicker-fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('theme',filemtime('js/theme.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryBootstrapWizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('dataTablebootstrap',filemtime('plugins/dataTables/dataTables.bootstrap.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapTimePickerMin',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('momentMin',filemtime('js/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('daterangepicker',filemtime('js/daterangepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('colorpicker',filemtime('plugins/colorpicker/colorpicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('loadImagMin',filemtime('plugins/jquery-file-upload/js/load-image.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryIframeTransport',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUpload',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadProcess',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadImage',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadAudio',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadValidate',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryUiMin',filemtime('plugins/fullcalendar-3.5.0/lib/jquery-ui.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('momentMin2',filemtime('plugins/fullcalendar-3.5.0/lib/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('fullCalendarMin',filemtime('plugins/fullcalendar-3.5.0/fullcalendar.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('fr',filemtime('plugins/fullcalendar-3.5.0/locale/fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('schedulerMin',filemtime('plugins/fullcalendar-3.5.0/scheduler.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('ckeditor',filemtime('plugins/ckeditor/ckeditor.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jquery3',filemtime('plugins/ckeditor/adapters/jquery.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jqueryMaskedInputMin',filemtime('js/jquery.maskedinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('maskchamps',filemtime('js/maskchamps.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapClockPickerMin',filemtime('js/bootstrap-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryClockPickerMin',filemtime('js/jquery-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('isotopKgdMin',filemtime('js/isotope.pkgd.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('inputMask',filemtime('js/inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryInputMaskmain',filemtime('js/jquery.inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('intlTelInput',filemtime('js/intlTelInput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('principal',filemtime('js/principal.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('mdp',filemtime('js/mdp.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('fonctionAdv',filemtime('js/fonction_adv.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('mobileDetectMin',filemtime('js/mobile-detect.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryMin',filemtime('plugins/fullcalendar-3.5.0/lib/jquery.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapMin',filemtime('js/bootstrap.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryUICustomMin',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryUITouchPunchMin',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('plugins',filemtime('js/plugins.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('framwork_js',filemtime('js/framwork_js.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryAutoCompleteMin',filemtime('js/jquery.autocomplete.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryDataTablesMin',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryPrettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerrymCustomScrollBarConcatMin',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryTargsInputMin',filemtime('plugins/tagsInput/jquery.tagsinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapSwitchMin',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryBlockUI',filemtime('plugins/blockUI/jquery.blockUI.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('datepicker',filemtime('js/datepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('datepickerFr',filemtime('js/datepicker-fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('theme',filemtime('js/theme.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryBootstrapWizardMin',filemtime('plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryDataTablesMin2',filemtime('plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('dataTablebootstrap',filemtime('plugins/dataTables/dataTables.bootstrap.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapTimePickerMin',filemtime('plugins/bootstrap-timepicker/bootstrap-timepicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('momentMin',filemtime('js/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('daterangepicker',filemtime('js/daterangepicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('colorpicker',filemtime('plugins/colorpicker/colorpicker.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('loadImagMin',filemtime('plugins/jquery-file-upload/js/load-image.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryIframeTransport',filemtime('plugins/jquery-file-upload/js/jquery.iframe-transport.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUpload',filemtime('plugins/jquery-file-upload/js/jquery.fileupload.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadProcess',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-process.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadImage',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-image.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadAudio',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-audio.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryFileUploadValidate',filemtime('plugins/jquery-file-upload/js/jquery.fileupload-validate.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryUiMin',filemtime('plugins/fullcalendar-3.5.0/lib/jquery-ui.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('momentMin2',filemtime('plugins/fullcalendar-3.5.0/lib/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('fullCalendarMin',filemtime('plugins/fullcalendar-3.5.0/fullcalendar.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('fr',filemtime('plugins/fullcalendar-3.5.0/locale/fr.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('schedulerMin',filemtime('plugins/fullcalendar-3.5.0/scheduler.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('ckeditor',filemtime('plugins/ckeditor/ckeditor.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerry2',filemtime('plugins/ckeditor/adapters/jquery.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryMaskedInputMin',filemtime('js/jquery.maskedinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('maskchamps',filemtime('js/maskchamps.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('bootstrapClockPickerMin',filemtime('js/bootstrap-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryClockPickerMin',filemtime('js/jquery-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('isotopKgd',filemtime('js/isotope.pkgd.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('inputMask',filemtime('js/inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryInputMask',filemtime('js/jquery.inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('intlTelInputMin',filemtime('js/intlTelInput.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('principal',filemtime('js/principal.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('functionRdvExist',filemtime('js/function_rdv_exist.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('mdp',filemtime('js/mdp.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('functionAdv',filemtime('js/fonction_adv.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jQuerryPnotifyMin',filemtime('plugins/pnotify/js/jquery.pnotify.min.js?v={/literal}{$numero_version_alaxione}{literal}'));
    $objSmarty->assign ('jquery',filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('bootstrap',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jqueryCustom',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugin',filemtime('js/plugins.js'));
    $objSmarty->assign ('framwork',filemtime('js/framwork_js.js'));
    $objSmarty->assign ('autocomplete',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables',filemtime('plugins/dataTables/jquery.dataTables.min.<?php echo $dataTables ?>.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('mCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switch',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js'));
    $objSmarty->assign ('fullcalendar',filemtime('plugins/fullcalendar-2.3.1/lib/jquery.min.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('bootstrap',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jquery',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugin',filemtime('js/plugins.js'));
    $objSmarty->assign ('framwork',filemtime('js/framwork_js.js'));
    $objSmarty->assign ('autocomplete',filemtime('js/jquery.autocomplete.min.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('mCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switch',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js'));
    $objSmarty->assign ('modernizr',filemtime('js/modernizr.js'));
    $objSmarty->assign ('mobileDetect',filemtime('js/mobile-detect.min.js'));
    $objSmarty->assign ('mobileDetectModernizr',filemtime('js/mobile-detect-modernizr.js'));
    $objSmarty->assign ('jquery',filemtime('js/jquery.js'));
    $objSmarty->assign ('bootstrap',filemtime('js/bootstrap.min.js'));
    $objSmarty->assign ('jqueryCustom',filemtime('plugins/jquery-ui/jquery-ui.custom.min.js'));
    $objSmarty->assign ('jqueryTouch',filemtime('plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'));
    $objSmarty->assign ('caroufredsel',filemtime('js/caroufredsel.js'));
    $objSmarty->assign ('plugin',filemtime('js/plugins.js'));
    $objSmarty->assign ('breakpoints',filemtime('plugins/breakpoints/breakpoints.js'));
    $objSmarty->assign ('dataTables',filemtime('plugins/dataTables/jquery.dataTables.min.js'));
    $objSmarty->assign ('prettyPhoto',filemtime('plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'));
    $objSmarty->assign ('mCustomScrollbar',filemtime('plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'));
    $objSmarty->assign ('tagsInput',filemtime('plugins/tagsInput/jquery.tagsinput.min.js'));
    $objSmarty->assign ('switch',filemtime('plugins/bootstrap-switch/bootstrap-switch.min.js'));
    $objSmarty->assign ('blockUI',filemtime('plugins/blockUI/jquery.blockUI.js'));
    $objSmarty->assign ('pnotify',filemtime('plugins/pnotify/js/jquery.pnotify.min.js'));
    $objSmarty->assign ('theme',filemtime('js/theme.js'));
    $objSmarty->assign ('custom',filemtime('custom/custom.js'));





    





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
