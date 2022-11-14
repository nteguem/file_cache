<?php
/**
 * Created by PhpStorm.
 * User: Yannick
 * Date: 30/04/2019
 * Time: 14:58
 */


require 'class/class_alaxione.php';
$sCookieAdv = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $sCookieAdv = $_COOKIE['cookie_alaxione'];
}
$objAlaxione = new class_alaxione('', '', '');
$bDroit = $objAlaxione->verificationConnexion(1, $sCookieAdv);
$objcentral = new class_alaxione_central();

//récupération des infomations passée en post ou get
$aVariable = array("identifiant_entite", "date_debut_demande_rdv_patient", "date_fin_demande_rdv_patient", "type_demande_rdv_patient", "date_a_partir_demande_rdv_patient", "selectcatprofession_demande_rdv_patient",
    "selectprofession_demande_rdv_patient", "consultation_demande_rdv_patient", "lieu_demande_rdv_patient", "praticien_demande_rdv_patient", "idpatient_demande_rdv", "id_check_mode_demande",
    "check_mail_demande", "check_sms_demande_indicatif", "check_sms_demande","guid");

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

$sRequete_infoprofilage ="SELECT 
id_type,
id_lieux,
identifiant_praticien,
identifiant_entite,
identifiant_patient,
urlcourt_profilage_rdv,
code_alaxione_profilage_rdv
FROM alaxione_profilage_rdv
WHERE guid_profilage_rdv='".$guid."'";

$aTableauInfoProfil = $objAlaxione->renvoi_info_requete($sRequete_infoprofilage);

if (!empty($aTableauInfoProfil)) {
    $consultation_demande_rdv_patient = $aTableauInfoProfil[0]['id_type'];
    $lieu_demande_rdv_patient = $aTableauInfoProfil[0]['id_lieux'];
    $praticien_demande_rdv_patient = $aTableauInfoProfil[0]['identifiant_praticien'];
    $identifiant_entite = $aTableauInfoProfil[0]['identifiant_entite'];
    $idpatient_demande_rdv = $aTableauInfoProfil[0]['identifiant_patient'];
    $urlcourt = $aTableauInfoProfil[0]['urlcourt_profilage_rdv'];
    $code = $aTableauInfoProfil[0]['code_alaxione_profilage_rdv'];
}

/*
 * Récupérer les information sur les centres
 */
$guidentite="";
$sRequete_info_centre ="SELECT guid_entite FROM alaxione_entite where  identifiant_entite='".$identifiant_entite."'";
$aTableauInfoCentre =$objAlaxione->renvoi_info_requete($sRequete_info_centre);

if (!empty($aTableauInfoCentre)) {
    $guidentite =$aTableauInfoCentre[0]['guid_entite'];
}

$aTableauInfoPatient = $objAlaxione->cb_renvoi_info_user($idpatient_demande_rdv, "identifiant_user");


$aTabmodif=array();
$i=0;
$aTabmodif[$i]['id']="[nom]";
$aTabmodif[$i]['valeur']=$aTableauInfoPatient[0]['abreviation_civilite']." ".$aTableauInfoPatient[0]['nom_user'];
$i++;
$aTabmodif[$i]['id']="[link]";
$aTabmodif[$i]['valeur']=$urlcourt;
$i++;
$aTabmodif[$i]['id']="[code]";
$aTabmodif[$i]['valeur']=$code;


$sMessgesms=$objAlaxione->renvoi_message_format("smscodeprioritaire", $aTabmodif);



    $aTableauInfoLieux = $objAlaxione->information_lieu($lieu_demande_rdv_patient);

    //recupération info motif rdv
    $sRequete_info_RDV="SELECT  preconisation_type_rdv,
    libelle_type_rdv
    FROM alaxione_type_rdv
    WHERE id_type_rdv='".$consultation_demande_rdv_patient."'";

    $aTableauInfoRDV = $objAlaxione->renvoi_info_requete($sRequete_info_RDV);

    $nomdocteur = $aTableauInfoLieux['nom_lieux'];
    $abr="le";
    $sNomfocntion="";
    $imagephotopraticien = $objAlaxione->linkapp."/img_front_end/".$aTableauInfoLieux['site_logo_entite'];




    $sMailpatient = $aTableauInfoPatient[0]['email_user'];
    $sTelportable = $aTableauInfoPatient[0]['tel_mobile_user'];
    $sRemboursement = $aTableauInfoLieux['tarif_remboursement_lieux'];

if (trim($praticien_demande_rdv_patient)!="") {
    $aTableauInfoPraticien = $objAlaxione->cb_renvoi_info_user($praticien_demande_rdv_patient, "identifiant_user");


    if (!empty($aTableauInfoPraticien)) {
        $nomdocteur = $aTableauInfoPraticien[0]['nom_user'];
        $abr=$aTableauInfoPraticien[0]['abr_proffession'];
        $sNomfonction=$aTableauInfoPraticien[0]['nom_profession'];
        $imagephotopraticien = $objAlaxione->linkapp."uploads/".$aTableauInfoPraticien[0]['photo_user'];

        if (trim($aTableauInfoPraticien[0]['tarif_remboursement_user'])!="") {
            $sRemboursement = $aTableauInfoPraticien['tarif_remboursement_user'];
        }
    }
}


    $listestringli="<ul><li>".$aTableauInfoPatient[0]['abreviation_civilite']." ".$aTableauInfoPatient[0]['nom_user']." ".$aTableauInfoPatient[0]['prenom_user']."</li></ul>";
    $aTabValeur = array();
    $i = 0;
    $aTabValeur[] = array( 'id' => '<link_visible_site>', 'valeur' => $objAlaxione->linkapp."recap_demande_rdv.php?guid=" . $guid );
    $aTabValeur[] = array( 'id' => '<link>', 'valeur' => $urlcourt);
    $aTabValeur[] = array( 'id' => '<linkapp>', 'valeur' => $objAlaxione->linkapp );
    $aTabValeur[] = array( 'id' => '<photo>', 'valeur' => $imagephotopraticien );
    $aTabValeur[] = array( 'id' => '<photo_praticien>', 'valeur' => $imagephotopraticien );
    $aTabValeur[] = array( 'id' => '<docteur>', 'valeur' => $urlcourt);
    $aTabValeur[] = array( 'id' => '<numerocentre>', 'valeur' => $aTableauInfoLieux['tel_lieux']);
    $aTabValeur[] = array( 'id' => '<mailcentre>', 'valeur' => $aTableauInfoLieux['email_mail_lieux'] );
    $aTabValeur[] = array( 'id' => '<info_importante>', 'valeur' => $urlcourt);
    $aTabValeur[] = array( 'id' => '<tarif_consultation>', 'valeur' => $urlcourt);
    $aTabValeur[] = array( 'id' => '<infolegale_lieux>', 'valeur' => $aTableauInfoLieux['infolegale_lieux']);
    $aTabValeur[] = array( 'id' => '<linknomcompte>', 'valeur' => $aTableauInfoLieux['url_ouverture_widget_entite']);
    $aTabValeur[] = array( 'id' => '<abr_proffession>', 'valeur' => $abr);
    $aTabValeur[] = array( 'id' => '<nom_profession>', 'valeur' => $sNomfocntion);
    $aTabValeur[] = array( 'id' => '<nom_praticien>', 'valeur' => $nomdocteur);
    $aTabValeur[] = array( 'id' => '<preconisation_type_rdv>','valeur' =>  $aTableauInfoRDV[0]['preconisation_type_rdv'] );
    $aTabValeur[] = array( 'id' => '<motif>', 'valeur' =>$aTableauInfoRDV[0]['libelle_type_rdv'] );
    $aTabValeur[] = array( 'id' => '<sChaineTypepaiementV2>', 'valeur' => $aTableauInfoLieux['sChaineTypepaiementV2']);
    $aTabValeur[] = array( 'id' => '<adresse_lieux>', 'valeur' => $aTableauInfoLieux['adresse_lieux']);
    $aTabValeur[] = array( 'id' => '<code_postal_lieux>', 'valeur' => $aTableauInfoLieux['code_postal_lieux']);
    $aTabValeur[] = array( 'id' => '<ville_lieux>', 'valeur' => $aTableauInfoLieux['ville_lieux']);
    $aTabValeur[] = array( 'id' => '<tel_lieux>', 'valeur' => $aTableauInfoLieux['tel_lieux']);
    $aTabValeur[] = array( 'id' => '<infos_pratiques_lieux>', 'valeur' => $aTableauInfoLieux['infos_pratiques_lieux']);
    $aTabValeur[] = array( 'id' => '<tarif_remboursement>', 'valeur' => $sRemboursement);
    $aTabValeur[] = array( 'id' => '<listestringli>', 'valeur' => $listestringli);
    $aTabValeur[] = array( 'id' => '<nom_lieux>', 'valeur' => $aTableauInfoLieux['nom_lieux']);
    $aTabValeur[] = array( 'id' => '<nom_patient>', 'valeur' => $aTableauInfoPatient[0]['abreviation_civilite']." ".$aTableauInfoPatient[0]['nom_user']." ".$aTableauInfoPatient[0]['prenom_user']);
    $i++;
    $aTabValeuruser = array();
    $i = 0;

    //$sMail = $objAlaxione->renvoi_message_format("mailcodeprioritaire", $aTabValeur);
    $sMail = $objAlaxione->renvoi_message_format("emailinitierdemanderdv", $aTabValeur);
    $sSujet = $objAlaxione->renvoi_message_format("mailcodeprioritaire", $aTabValeuruser, "plus_champ_vrac");


    echo $sMail;
