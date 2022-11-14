<?php

include_once('config/alaxioneconf.php');
include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . "/qrcode/qrlib.php";


use Spipu\Html2Pdf\Exception\ExceptionFormatter;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Html2Pdf;

setlocale(LC_ALL, 'fr_FR.utf8');

$sCookieAdv = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $sCookieAdv = $_COOKIE['cookie_alaxione'];
}

if (!isset($_GET['idrdv'])) {
    return http_response_code(400);
}

$rdvs = explode(",", $_GET['idrdv']);

$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv);

// id rdv change a chaque fois alors tanpis
$sql = "SELECT identification_rdv,adresse_lieux,code_postal_lieux,ville_lieux,identifiant_entite_rdv,site_logo_entite,tel_lieux,site_active_lieux,linkpage_lieux  FROM alaxione_prise_rendez_vous 
INNER JOIN  alaxione_lieux on  alaxione_lieux.id_lieux = alaxione_prise_rendez_vous.id_lieux 
INNER JOIN alaxione_entite on alaxione_entite.identifiant_entite = alaxione_lieux.identifiant_entite
WHERE id_prise_rendez_vous = :idrdv";
$identification_rdvs = [];
foreach ($rdvs as $idrdv) {
    $res = $objClassGenerique->execute($sql, ['idrdv' => $idrdv]);
    $identification_rdvs[] = $res[0]['identification_rdv'];
    $aTableauInfoLieux = $res[0];
}

$infos_rdvs = [];
foreach ($identification_rdvs as $identification_rdv) {
    $res = $objClassGenerique->renvoi_info_rdv($identification_rdv, 'identification_rdv');
    $infos_rdvs[] = $res[0];
}

if (count($rdvs) >1 ){
    $sTexte = "les rendez-vous mentionnés ci-dessous SONT ANNULES.";
}else{
    $sTexte = "le rendez-vous mentionné ci-dessous EST ANNULE.";
}

$sContenuqrcode = $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];

$fileNameQr = $idrdv . "_" . md5($sContenuqrcode) . '.png';
$qrPath = "./qrcode/" . $fileNameQr;
QRcode::png($sContenuqrcode,$qrPath,QR_ECLEVEL_L);
$imgQrcode = $qrPath;

// Variables pour la template

if($aTableauInfoLieux['identifiant_entite_rdv']=="4hbgtxddgddukdit") {
    $adresse = "6 RUE DESIREE CLARY, 13003 MARSEILLE";
    $num_tel = "Tel : +33 4 13 42 70 00";
    $tel_rdv = "Tél. Gestion RDV : 04 13 427 427";
    $logo = "https://hpeuropeen.alaxione.fr/config/img/logohp.png";
    $site_web = "www.hopital-europeen.fr";
}else{
    $adresse =$aTableauInfoLieux['adresse_lieux'].", ".$aTableauInfoLieux['code_postal_lieux']." ".$aTableauInfoLieux['ville_lieux'];
    $num_tel = "Tel : ".$aTableauInfoLieux['tel_lieux'];
    if(trim($aTableauInfoLieux['site_logo_entite'])!="") {
        if(file_exists("./img_front_end/" . $aTableauInfoLieux['site_logo_entite']))
            $logo = $objClassGenerique->linkapp . "img_front_end/" . $aTableauInfoLieux['site_logo_entite'];
        else
            $logo="";
    }else{
        $logo="";
    }
    $site_web = $aTableauInfoLieux['linkpage_lieux'];
}
$nom_patient = $infos_rdvs[0]['nompatient'] . " " . $infos_rdvs[0]['prenompatient'];
if (strlen($infos_rdvs[0]['adressepatient']) > 50){
    $atempAdresse = explode(" ", $infos_rdvs[0]['adressepatient']);
    $tempAdresse = "";
    $bSautdeligne = false;
    foreach($atempAdresse as $valeur) {
        if (strlen($tempAdresse) > 40 && $bSautdeligne == false){
            $bSautdeligne = true;
            $tempAdresse .= "<br/>". $valeur." ";
        }else{
            $tempAdresse .= $valeur." ";
        }
    }
}else{
    $tempAdresse = $infos_rdvs[0]['adressepatient'];
}
$adresse_patient = $tempAdresse . "<br/>" . $infos_rdvs[0]['codepostalpatient']. " " . $infos_rdvs[0]['villepatient'];
$type_rdv = "";
$ref = "REF : " . $infos_rdvs[0]['identifiantexternepatient'] . "/" . strtoupper($infos_rdvs[0]['abreviation_type_rdv']) . " " . $infos_rdvs[0]['nomdocteur'];
if($aTableauInfoLieux['identifiant_entite_rdv']=="4hbgtxddgddukdit") {
    $date_rdv = "Marseille le " . $objClassGenerique->renvoi_jour_mois_format_v2(date('d/m/Y'));
}else{
    $date_rdv = $aTableauInfoLieux['ville_lieux']." le " . $objClassGenerique->renvoi_jour_mois_format_v2(date('d/m/Y'));
}
$aDate = explode("/", $infos_rdvs[0]['daterdv']);
$dateee = ucfirst(strftime("%A %d %B %Y", strtotime($aDate[2]."-".$aDate[1]."-".$aDate[0])));
$topText = "<br>
            <p>[civilitepatient],</p>

            <p>Nous sommes au regret de vous informer que votre rendez-vous  du <b>".$dateee . " à " . $infos_rdvs[0]['heureaff']."</b><br/> avec ".$infos_rdvs[0]['docteurabrcivilite']." ".$infos_rdvs[0]['nomdocteur']." est <b>ANNULÉ</b>.</p>";
$topText = str_replace('[civilitepatient]', $infos_rdvs[0]['patientcivilitenom'], $topText);



$rdvs = "";

if($aTableauInfoLieux['identifiant_entite_rdv']=="4hbgtxddgddukdit") {
    $bottomText = "<p>Veuillez contacter le 04 13 427 427 pour prendre un nouveau rendez-vous.</p>
                <p>Veuillez agréer, [civilitepatient], l'expression de notre considération distinguée.</p>
               <p>Le service des rendez-vous.</p>";
}else{
    $bottomText = "
                <p>Veuillez agréer, [civilitepatient], l'expression de notre considération distinguée.</p>
               <p>Le service des rendez-vous.</p>";
}
$bottomText = str_replace('[civilitepatient]', $infos_rdvs[0]['patientcivilitenom'], $bottomText);
$html2pdf = new Html2Pdf('P', 'A4', 'fr');

try {
    ob_start();
    include 'api/api_patient/class/template/template_annulation_rdv.php';
    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'fr');
    $html2pdf->setDefaultFont('Arial');
    $html2pdf->writeHTML($content);
    $html2pdf->output('AnnulationRDV.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}
