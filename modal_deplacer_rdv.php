<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');
require_once 'class/class_user.php';
require "config/alaxioneconf.php";

session_start();

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
$objClassGenerique->verificationConnexion(1, $sCookieAdv);
$objClassGenerique->redirection_centre($_COOKIE['AlaxioneAutreCentre']);


$host = $sServeurWebSocket;
if(isset($iWebsocketPort) && trim($iWebsocketPort) != '')
{
    $host .= ':'.$iWebsocketPort;
}

//récupération des infomations passée en post
$aVariable = [
    'id_patient',
    'validation',
    'planning',
    'dir',
    'deplace',
    'tpsconsultation',
    'idtyperdv',
    'bsucess2',
    'horaire',
    'ladaterech',
    'jour',
    'idrdv',
    'datesaisie',
    'jsEvent',
    'idcalendar',
    'sAction',
    'idlieu'
];


for ($i = 0; $i < count($aVariable); $i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = '';
    }
}


$bsucess = false;
$sMessageSucess = '';
$berror = false;
$sMessageError = '';
$bpasse = true;
$bwarning = false;
$sMessageWarning = '';

$objBackoffice = new class_backoffice();
$objUser = new class_user();

$brecherche = true;

//mise à jour du status durendez vous
if ($validation == 'modistatus') {
    $bresult = $objBackoffice->mise_a_jour_status($idrdv, $idstatus);
    if ($bresult['success'] == 1) {
        $bsucess = true;
        $sMessageSucess = 'Mise à jour du status du rendez vous réussie';
    } else {
        $berror = true;
        $sMessageError = 'Problème survenue pendant la mise à jour du status du Rendez vous';
    }
}
if ($validation == 'deplacer') {

    if ($deplace == '') {
        $berror = true;
        $sMessageError = 'Vous devez sélectionné un rendez-vous';
        $brecherche = true;
    } else {
        $u = 0;
        $validation = 'enreg';
        $planning = $deplace;
        $aTableaudecoupe = explode("-", $deplace);
        $bwarning = true;
        $sMessageWarning = 'Attention vous allez deplacer ce rendez vous à la date du ' . $objClassGenerique->renvoi_jour_mois_format_v2($aTableaudecoupe[2] . "/" . $aTableaudecoupe[1] . "/" . $aTableaudecoupe[0]) . " à " . $aTableaudecoupe[6];
        $brecherche = false;
    }
}
if ($validation == 'deplacesimple') {

    $aTableaudecoupeplanning = explode('-', $planning);
    $bresult = $objClassGenerique->cb_deplacement_rdv($idrdv, $planning, '', '', $objClassGenerique->id_user, '', $objClassGenerique->identifiant_entite, false,
        $tpsconsultation);

    if ($bresult['result'] == 1) {
        $sAction = 'deplace';
        $bsucess2 = true;
        $sMessageSucess = 'Votre rendez-vous à bien été déplacé';
        $idrdv = $bresult['id_rdv'];
        //mettre le provemance en deplacer
        $aVariableRquete_update = array();
        $aVariableRquete_update['idrdv'] = $idrdv;
        $sRquete_update = "UPDATE  alaxione_prise_rendez_vous SET provenance_saisi_prise_rendez_vous='deplacer'
		  where id_prise_rendez_vous=:idrdv";

        $objClassGenerique->executionRequete_new($sRquete_update, $aVariableRquete_update);

        $aTableauLog = [];

        $TabInfoRDV = $objBackoffice->get_info_rdv($idrdv);
        // envoi du mail en desyncrho
        $urlRdv=$objClassGenerique->linkapp."ajax/envoi_mail_recap_rdv.php";
        $data = array('iRdv' => $idrdv,
            'iPatient'=>$TabInfoRDV[0]['idpatient_user'],
            'sTypeRecap'=>'',
            'sModeleMailRdv'=>"");
        $headers = array('authorization' =>"", 'x-alx-idc' => "");
        $aRes = ServiceRdv::systemCurl($urlRdv, $data, $headers, true);

    } else {
        $berror = true;
        $sMessageError = $bresult['message_brut'];
        $commentaireLog = 'Erreur - Rendez-vous déplacé';

        $aTableauLog = [];
        $aTableauLog['ip'] = $_SERVER['REMOTE_ADDR'];
        $aTableauLog['user'] = $objClassGenerique->id_user;
        $aTableauLog['user_name'] = $objClassGenerique->fct_nom_user_connecte();
        $aTableauLog['date'] = date('Y-m-d H:i:s');
        $aTableauLog['script'] = $_SERVER['SCRIPT_NAME'];
        $aTableauLog['methode'] = 'UPDATE';
        $aTableauLog['objet'] = 'rdv';
        $aTableauLog['ressource'] = $idrdv;
        $aTableauLog['status'] = 'Error';
        $aTableauLog['os'] = $_SERVER['HTTP_USER_AGENT'];
        $aTableauLog['navigateur'] = $_SERVER['HTTP_USER_AGENT'];
        $aTableauLog['type'] = 'fonctionnel';
        $aTableauLog['serveur'] = $objClassGenerique->sNomServeurDBB;
        $aTableauLog['entite'] = $_COOKIE['AlaxioneAutreCentre'];
        $aTableauLog['commentaire'] = $commentaireLog;

        $objClassGenerique->push_trace_objet($aTableauLog);
    }
    wsDeplaceRdv($idrdv, $sLinkAlaxioneAPI);
}
if ($validation == 'deplaceconfirm') {

    $aTableaudecoupeplanning = explode('-', $planning);

    $bresult = $objClassGenerique->cb_deplacement_rdv($idrdv, $planning, '', 'ok', $objClassGenerique->id_user, '', $objClassGenerique->identifiant_entite,
        false, $tpsconsultation);

    if ($bresult['result'] == 1) {
        $sAction = 'deplace';
        $bsucess2 = true;
        $sMessageSucess = 'Votre rendez à bien été déplacé';
        $idrdv = $bresult['id_rdv'];
        $aVariableRquete_update['idrdv'] = $idrdv;
        $sRquete_update = "UPDATE  alaxione_prise_rendez_vous SET provenance_saisi_prise_rendez_vous='deplacer' ,
		  validdeplace_prise_rendez_vous='en attente' where id_prise_rendez_vous=:idrdv";

        $objClassGenerique->executionRequete_new($sRquete_update, $aVariableRquete_update);

        //envoi requete vers api_socket
        wsDeplaceRdv($idrdv, $sLinkAlaxioneAPI);

    } else {
        $berror = true;
        $sMessageError = $bresult['message_brut'];
        $commentaireLog = 'Erreur - Rendez-vous déplacé';

        $aTableauLog = [];
        $aTableauLog['ip'] = $_SERVER['REMOTE_ADDR'];
        $aTableauLog['user'] = $objClassGenerique->id_user;
        $aTableauLog['user_name'] = $objClassGenerique->fct_nom_user_connecte();
        $aTableauLog['date'] = date('Y-m-d H:i:s');
        $aTableauLog['script'] = $_SERVER['SCRIPT_NAME'];
        $aTableauLog['methode'] = 'UPDATE';
        $aTableauLog['objet'] = 'rdv';
        $aTableauLog['ressource'] = $idrdv;
        $aTableauLog['status'] = 'Error';
        $aTableauLog['os'] = $_SERVER['HTTP_USER_AGENT'];
        $aTableauLog['navigateur'] = $_SERVER['HTTP_USER_AGENT'];
        $aTableauLog['type'] = 'fonctionnel';
        $aTableauLog['serveur'] = $objClassGenerique->sNomServeurDBB;
        $aTableauLog['entite'] = $_COOKIE['AlaxioneAutreCentre'];
        $aTableauLog['commentaire'] = $commentaireLog;

        $objClassGenerique->push_trace_objet($aTableauLog);
    }
}
//suppresion de ce rendez vous
if ($validation == '') {
    $validation = 'deplacer';
}


$TabInfoRDV = $objBackoffice->get_info_rdv_deplacer($idrdv);

//***********************recupération de la liste des status
$sRequete_liste_status = "select nom_champ_vrac,identifiant_champ_vrac,valeur_champ_vrac from outil_champ_vrac where filtre_champ_vrac='liststatusrdv'";
$aTableauListeStatut = $objClassGenerique->renvoi_info_requete_new($sRequete_liste_status, []);


if ($idlieu == '') {
    $idlieu = $TabInfoRDV[0]['ancienidlieu'];
}

$praticien = $TabInfoRDV[0]['iddocteur_user'];
$rdv = $TabInfoRDV[0]['id_type_rdv'];
$iIntervalle = 0;

if($ladaterech != '' && !$objClassGenerique->verifie_compare_date($ladaterech, 'comparer', date('j/m/Y')))
{
    $ladaterech = '';
}

if ($ladaterech != '') {
    $datesaisie = $objClassGenerique->renvoi_date($ladaterech, 'eng');
} else {
    $datesaisie = date('Y-m-d', mktime(0, 0, 0, date('m'), date('j') + 1, date('Y')));
}

//*******************récupération des information sur l'utilisateur*****************
$sRequete_info = 'SELECT  identifiant_user, id_profession, calendar_anonyne_user
                  FROM alaxione_user
                  WHERE id_user=:praticien';
$aTableauInfoUser = $objClassGenerique->renvoi_info_requete_new($sRequete_info, ['praticien' => $praticien,]);

$bcouple = false;
if($objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, 'activnewalgo', 'ok')) {

    $sRequeteSelectInfoMotif = "SELECT actif_rdv_aide_type_rdv,
                            interalleinf_rdvacc_type_rdv,
                            interallesupp_rdvacc_type_rdv,
                            id_motif_rdv_aide_type_rdv,
                            nom_groupe_motif_rdv,
                            intervallesupp_box_groupe_motif,
                            intervalleinf_box_groupe_motif,
                            supplogique_box_motif_rdv
                            FROM alaxione_type_rdv 
                            LEFT JOIN al_lien_box_motif on al_lien_box_motif.id_motif_rdv = alaxione_type_rdv.id_type_rdv 
                            AND supplogique_lien_box_motif='N'
                            LEFT JOIN  alc_box_motif_rdv on alc_box_motif_rdv.id_box_motif_rdv = al_lien_box_motif.id_box_motif_rdv 
                            and alc_box_motif_rdv.id_profession=:id_profession and supplogique_box_motif_rdv='N'
                            where id_type_rdv=:id_type_rdv";
    $aTableauInfoMotifRdv = $objClassGenerique->renvoi_info_requete_new($sRequeteSelectInfoMotif, [
        'id_type_rdv' => $rdv,
        'id_profession' => $aTableauInfoUser[0]['id_profession'],
    ]);
    

    $aTableaupraticienAPI[] = $aTableauInfoUser[0]['identifiant_user'];
    $url_api = $objClassGenerique->linkapi . "api_algo/rdv";
    $aTabGET['id_motif'] = $rdv;
    $aTabGET['id_lieu'] = $idlieu;
    $aTabGET['nb_personne'] = 1;
    $aTabGET['backoffice'] = 1;
    $aTabGET['idjour'] = $jour;
    $aTabGET['bdebug'] = false;
    $aTabGET['aTabpraticien'] = $aTableaupraticienAPI;
    $aTabGET['nbr_affiche'] = 12;
    $aTabGET['creneauhoraire'] = $horaire;
    $aTabGET['idinterpro'] = $objClassGenerique->idinterpro;
    $aTabGET['datedebut'] = $datesaisie;
    $aTabGET['id_jour'] = $jour;
    $aTabGET['id_groupe'] = $objClassGenerique->id_groupe;

    if ($TabInfoRDV[0]['is_anonyme_prise_rendez_vous'] == '1' ){
        if ($aTableauInfoUser[0]['calendar_anonyne_user'] == '0'){
            $aTabGET['is_anonyme'] = 'Y';
        }
    }else{
        $aTabGET['is_anonyme'] = 'N';
    }

    if (isset($aTableauInfoMotifRdv[0])) {
        if ($aTableauInfoMotifRdv[0]['actif_rdv_aide_type_rdv'] == 'Y') {
            $sMessageErrorplus = 'ATTENTION CE MOTIF EST CONFIGURE EN MOTIF AIDE';
            $aTabGET['type_proposition'] = "aide";
            $aTabGET['id_motif_aide'] = $aTableauInfoMotifRdv[0]['id_motif_rdv_aide_type_rdv'];
            $aTabGET['delai_min_aide'] = $aTableauInfoMotifRdv[0]['interallesupp_rdvacc_type_rdv'];
            $aTabGET['delai_max_aide'] = $aTableauInfoMotifRdv[0]['interalleinf_rdvacc_type_rdv'];
            $bcouple = true;
        } else {
            if ($aTableauInfoMotifRdv[0]['supplogique_box_motif_rdv'] == 'N') {
                $sMessageErrorplus = 'ATTENTION CE MOTIF EST CONFIGURE EN MOTIF COUPLE AVEC UNE SALLE';
                $aTabGET['type_proposition'] = 'box';
                $aTabGET['id_motif_aide'] = $aTableauInfoMotifRdv[0]['id_motif_rdv_aide_type_rdv'];
                $aTabGET['delai_min_aide'] = $aTableauInfoMotifRdv[0]['intervallesupp_box_groupe_motif'];
                $aTabGET['delai_max_aide'] = $aTableauInfoMotifRdv[0]['intervalleinf_box_groupe_motif'];
                $bcouple = true;
            } else {
                $aTabGET['type_proposition'] = '';
                $aTabGET['id_motif_aide'] = '';
                $aTabGET['delai_min_aide'] = '';
                $aTabGET['delai_max_aide'] = '';
            }
        }
    } else {
        $aTabGET['type_proposition'] = '';
        $aTabGET['id_motif_aide'] = '';
        $aTabGET['delai_min_aide'] = '';
        $aTabGET['delai_max_aide'] = '';
    }

    $rest = new RestClient();
    $retour = $rest->setUrl($url_api)->get($aTabGET);

    $aTab = json_decode($retour['content'], true);

    $aTableauRDVdispo = $aTab['tablist'];
} else {

    $aTabParam = array();
    $aTabParam['idpraticien'] = $aTableauInfoUser[0]['identifiant_user'];
    $aTabParam['idlieu'] = $idlieu;
    $aTabParam['idtyperdv'] = $rdv;
    $aTabParam['date'] = $datesaisie;
    $aTabParam['creneauhoraire'] = $horaire;
    $aTabParam['nb_personne'] = 1;
    $aTabParam['num'] = '';
    $aTabParam['nb_semaine'] = '';
    $aTabParam['quand'] = '';
    $aTabParam['nbr_affiche'] = 12;
    $aTabParam['num_mois'] = '';
    $aTabParam['type'] = '';
    $aTabParam['id_jour'] = $jour;
    $aTabParam['bdebug'] = false;
    $aTabParam['idinterpro'] = $objClassGenerique->idinterpro;
    $aTabParam['ivisbilite'] = '';
    $aTabParam['ball'] = '';
    $aTabParam['bpasdecalge'] = '';
    $aTabParam['idproffession'] = '';
    $aTabParam['widget'] = false;
    $aTabParam['tabpraticien'] = '';
    $aTabParam['sFinRequete'] = ' group by planningprincipal.id_plannig_dispo order by rdvdispoprincipal.date_rdv_dispo,planningprincipal.heure_debut_plannig_dispo limit 0, 600';

    $aTableauRDVdispo = $objClassGenerique->algo_proposition_rdv($aTabParam);
}

//***************************************récupération des minutes******************
$tpsconsultation = $objClassGenerique->renvoi_temp_deux_heure($TabInfoRDV[0]['heuredebut'], $TabInfoRDV[0]['heurefin']);
$aTableauLieu = $objClassGenerique->renvoi_lieux($objClassGenerique->identifiant_entite);

$bGestionSelas = $objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, "gestionselas", "ok");
$bGestionSDA = isset($_SESSION['AlaxioneIdLieux']);
$aTabLieuxFiltre = array();

// Beaucoup de manoeuvres pour filtrer les lieux car on à souvent des formats différents et des règles différentes
// mais c'est ça ou refaire une requête SQL. A ce stade je ne sais pas ce qui est le mieux niveau perf.
if ($bGestionSelas && $bGestionSDA){
    $aCentresSDA = explode(",", $_SESSION['AlaxioneIdLieux']);
    $aCentreSELAS = $objClassGenerique->GetAuthorizedPlaces($objClassGenerique->id_user, true);
    if (empty($aCentreSELAS)){
        foreach( $aTableauLieu as $lieu){
            if (in_array($lieu['id'], $aCentresSDA)){
                $aTabLieuxFiltre[] = $lieu;
            }  
        }
    } else {
        foreach( $aTableauLieu as $lieu){
            if (in_array($lieu['id'], $aCentresSDA) && in_array($lieu['id'], $aCentreSELAS)){
                $aTabLieuxFiltre[] = $lieu;
            }  
        }
    }
}else if ($bGestionSelas){
    $aCentreSELAS = $objClassGenerique->GetAuthorizedPlaces($objClassGenerique->id_user, true);
    if (empty($aCentreSELAS)){
        $aTabLieuxFiltre = $aTableauLieu;
    } else {
        foreach( $aTableauLieu as $lieu){
            if (in_array($lieu['id'], $aCentreSELAS)){
                $aTabLieuxFiltre[] = $lieu;
            }  
        }
    }
}else if ($bGestionSDA){
    $aCentresSDA = explode(",", $_SESSION['AlaxioneIdLieux']);
    foreach( $aTableauLieu as $lieu){
        if (in_array($lieu['id'], $aCentresSDA)){
            $aTabLieuxFiltreSDA[] = $lieu;
        }  
    }
}else{
    $aTabLieuxFiltre = $aTableauLieu;
}

$objSmarty->assign('dir', $dir);
$objSmarty->assign('idlieu', $idlieu);
$objSmarty->assign('aTableauLieu', $aTabLieuxFiltre);
$objSmarty->assign('brecherche', $brecherche);
$objSmarty->assign('deplace', $deplace);
$objSmarty->assign('validation', $validation);
$objSmarty->assign('planning', $planning);
$objSmarty->assign('horaire', $horaire);
$objSmarty->assign('jour', $jour);
$objSmarty->assign('ladaterech', $ladaterech);
$objSmarty->assign('idrdv', $idrdv);
$objSmarty->assign('aTableauRDVdispo', $aTableauRDVdispo);
$objSmarty->assign('TabInfoRDV', $TabInfoRDV);
$objSmarty->assign('tpsconsultation', $tpsconsultation);
$objSmarty->assign('bpasse', $bpasse);
$objSmarty->assign('bsucess', $bsucess);
$objSmarty->assign('bsucess2', $bsucess2);
$objSmarty->assign('sMessageSucess', $sMessageSucess);
$objSmarty->assign('berror', $berror);
$objSmarty->assign('sMessageError', $sMessageError);
$objSmarty->assign('bwarning', $bwarning);
$objSmarty->assign('sMessageWarning', $sMessageWarning);
$objSmarty->assign('aTabStatus', $aTableauListeStatut);
$objSmarty->assign('iduserP', $id_patient);
$objSmarty->assign('jsEvent', $jsEvent);
$objSmarty->assign('sAction', $sAction);
$objSmarty->assign('idcalendar', $idcalendar);
$objSmarty->assign('bcouple', $bcouple);

$objSmarty->display('modal_deplacer_rdv.tpl');

function wsDeplaceRdv($idRdv, $host)
{
    $ch = curl_init();

    $url_api = $host.'api_socket/socket/';
    curl_setopt($ch, CURLOPT_URL, $url_api);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, 'id_rdv='.$idRdv);

    $response = curl_exec($ch);
    curl_close($ch);
    $aTabResult[0]['bafffiche'] = 0;
}
