<?php
function getInfoRdv($idrdv)
{
    $objClassGenerique = new class_alaxione('', '', '');

    $result = array();

    $rdvRequete = "SELECT date_format(prv.heureaff_prise_rendez_vous,'%H:%i') as heureaff,
        date_format(prv.heure_debut_prise_rendez_vous,'%H:%i') as heurereel,
        date_format(prv.heure_fin_prise_rendez_vous,'%H:%i') as heurerfin,
        prv.id_type_groupement_rdv as grp_princ,
        entite.site_logo_entite AS logo,
        CONCAT(entite.adresse_entite,', ',entite.code_postal_entite,' ',entite.ville_entite) as adresse,
        CONCAT(patient.identifiant_module_externe_user,'/',UPPER(tr.abreviation_type_rdv),' ',docteur.nom_user) as ref,
        entite.ville_entite as ville_entite,
        entite.tel_entite as num_tel,
        entite.urlsite_entite as site_web,
        entite.identifiant_entite as id_centre,
        patient.nom_user as nom_patient,
        patient.prenom_user as prenom_patient,
        patient.adresse_user as addr_patient,
        patient.code_postal_user as cp_patient,
        patient.ville_user as ville_patient,
        patient.identifiant_user as identifiantpatient,
        patient.identifiant_module_externe_user as identifiantexternepatient,
        prv.date_prise_rendez_vous as date_rdv,
        tr.libelle_type_rdv,
        tr.libelle_internet_type_rdv,
        civ_p.nom_cvilite as civ_patient,
        civ_p.abreviation_civilite as abrevciv_patient,
        civ_d.abreviation_civilite as abr_praticien,
        li.nom_lieux AS unitefonctionnelle,
        docteur.identifiant_user AS identifiant_praticien,
        docteur.nom_user AS nom_praticien,
        docteur.prenom_user AS prenom_praticien,
        pro.nom_profession,
        prv.identification_rdv,
        prv.idpatient_user,
        prv.idgrouperecurrent_prise_rendez_vous,
        prv.isprincipal_prise_rendez_vous,
        prv.id_prise_rendez_vous
        FROM alaxione_prise_rendez_vous as prv
        INNER JOIN alaxione_user as patient on 
            patient.id_user = prv.idpatient_user
        INNER JOIN alaxione_user as docteur ON
            docteur.id_user = prv.iddocteur_user
        INNER JOIN alaxione_prise_type_rdv as ptr ON
            ptr.id_prise_rendez_vous = prv.id_prise_rendez_vous
        INNER JOIN alaxione_type_rdv as tr ON
            tr.id_type_rdv = ptr.id_type_rdv
        INNER JOIN alaxione_entite as entite ON
            entite.id_entite = prv.identifiant_entite_rdv
        LEFT JOIN alaxione_civilite as civ_p ON
            civ_p.id_civilite = patient.id_civilite
        INNER JOIN alaxione_civilite as civ_d ON
            civ_d.id_civilite = docteur.id_civilite
        LEFT JOIN alaxione_lieux AS li ON
            li.id_lieux = prv.id_service
        INNER JOIN alaxione_profession AS pro ON
            pro.id_profession = docteur.id_profession
        WHERE prv.id_prise_rendez_vous = :idrdv";
    // Recupère le rdv et les informations requises à partir de l'idrdv
    $aVariableRequeteRdv = array();
    $aVariableRequeteRdv['idrdv'] = $idrdv;
    $aTableauRetour = $objClassGenerique->renvoi_info_requete_new($rdvRequete, $aVariableRequeteRdv);

    if (empty($aTableauRetour)) {
        return null;
    }
    $elemFirst = $aTableauRetour[0];
    $dateRdv = new DateTime($elemFirst["date_rdv"]);
    $prenom_praticien = $elemFirst["prenom_praticien"];
    $nom_praticien = $elemFirst["nom_praticien"];
    $abreviation_praticien = $elemFirst["abr_praticien"];
    $id_praticien = $elemFirst["identifiant_praticien"];
    $nom_profession = $elemFirst["nom_profession"];
    $heureRdv = DateTime::createFromFormat("H:i", $elemFirst["heurereel"]);

    // Si le rdv a des fils, recupère le praticien du rdv pere et l'heure la plus tôt
    if ($elemFirst["idgrouperecurrent_prise_rendez_vous"] != "") {
        $requeteFils = "SELECT fils.iddocteur_user, fils.id_prise_rendez_vous,
        fils.date_prise_rendez_vous as daterdv,
        fils.heureaff_prise_rendez_vous as heureAff,
        fils.heure_debut_prise_rendez_vous as heureDeb,
        fils.isprincipal_prise_rendez_vous as princ,
        docteur.prenom_user as prenom_praticien,
        docteur.nom_user AS nom_praticien,
        civ_doc.abreviation_civilite AS abr_praticien,
        docteur.identifiant_user as identifiant_praticien,
        pro.nom_profession
        FROM alaxione_prise_rendez_vous as fils
        INNER JOIN alaxione_user AS docteur
            ON docteur.id_user = fils.iddocteur_user
        INNER JOIN alaxione_profession as pro
            ON pro.id_profession = docteur.id_profession
        INNER JOIN alaxione_civilite as civ_doc
            ON civ_doc.id_civilite = docteur.id_civilite
        WHERE fils.idgrouperecurrent_prise_rendez_vous = :idgroupe";
        $paramReq = array();
        $paramReq["idgroupe"] = $elemFirst["idgrouperecurrent_prise_rendez_vous"];
        $rdvFils = $objClassGenerique->renvoi_info_requete_new($requeteFils, $paramReq);
        foreach ($rdvFils as $elem) {
            $heureElem = DateTime::createFromFormat("H:i:s", $elem["heureDeb"]);
            if ($heureElem < $heureRdv) {
                $heureRdv = $heureElem;
            }
            if ($elem["princ"] == "1") {
                $prenom_praticien = $elem["prenom_praticien"];
                $nom_praticien = $elem["nom_praticien"];
                $abreviation_praticien = $elem["abr_praticien"];
                $id_praticien = $elem["identifiant_praticien"];
                $nom_profession = $elem["nom_profession"];
            }
        }
    }

    $aTabParam_remplacant = array();
    $aTabParam_remplacant['identifiant_user'] = $id_praticien;
    $aTabParam_remplacant['date_rdv'] = $elemFirst['date_rdv'];
    $aTabParam_remplacant['bdebug'] = false;
    $aTabParam_remplacant['heure_debut_rdv'] = $elemFirst['heurereel'];

    $aTableauRemplacant = array();
    $aTableauRemplacant = $objClassGenerique->renvoi_remplacant($aTabParam_remplacant);

    // On recupère le remplacant si il y en a un
    $nomdocteur = "";
    $abreviation_civilite_remplacant = "";
    $photo_praticien_remplacant = "";
    $nom_praticien_remplacant = "";
    $nom_affiche_profession_remplacant = "";
    if (!empty($aTableauRemplacant)) {
        $abreviation_civilite_remplacant = $aTableauRemplacant[0]['abreviation_civilite'];
        $photo_praticien_remplacant = $aTableauRemplacant[0]['photo_user'];
        $nom_praticien_remplacant = $aTableauRemplacant[0]['nom_user'];
        $nom_affiche_profession_remplacant = $aTableauRemplacant[0]['nom_affiche_profession'];

        $nomdocteur = $abreviation_civilite_remplacant . " " . $nom_praticien_remplacant . " remplaçant de " . $abreviation_praticien . " " . $nom_praticien . " (" . $nom_profession . ")";
    } else {
        $nomdocteur = $abreviation_praticien . " " . $prenom_praticien . " " . $nom_praticien . " (" . $nom_profession . ")";
    }

    $dateFr = ucfirst(strftime("%A %d %B %Y", $dateRdv->getTimestamp()));

    //Info par rdv
    $result[] = $elemFirst;
    $result["dateFrRdv"] = $dateFr;
    $result["heureRdv"] = $heureRdv;
    $result["nomPraticien"] = $nomdocteur;
    $result["profession"] = $nom_profession;
    $result["idPraticien"] = $id_praticien;
    $result["unitefonctionnelle"] = $elemFirst["unitefonctionnelle"];
    $result["libelle_type_rdv"] = $elemFirst["libelle_type_rdv"];
    return $result;
}

/**
 * Created by PhpStorm.
 * User: Guy
 * Date: 10/01/2018
 * Time: 14:26
 */

ini_set('memory_limit', -1);
include_once('config/alaxioneconf.php');
include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/qrcode/qrlib.php';
require_once __DIR__ . '/Helper/StringHelper.php';

use Spipu\Html2Pdf\Exception\ExceptionFormatter;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Html2Pdf;

ini_set("display_errors", "OFF");

$sCookieAdv = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $sCookieAdv = $_COOKIE['cookie_alaxione'];
}

//récupération des infomations passée en post
$aVariable = array("idrdv", "action", "prov", "bdebug", "type");


for ($i = 0; $i < count($aVariable); $i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

if ($idrdv == "") {
    echo "No idrdv given !";
    exit();
}

$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv);

$rdvs = explode(',', $idrdv);

$infoRdvs = array();
$areAllValid = false;
foreach ($rdvs as $idrdv) {
    $infoRdv = getInfoRdv($idrdv);
    if ($infoRdv != null) {
        $infoRdv["idRdv"] = $idrdv;
        $infoRdvs[] = $infoRdv;
        $areAllValid = true;
    }
}
if (!$areAllValid) {
    echo "Aucuns des id de rendez-vous suivant ne sont valides !";
    echo json_encode($rdvs);
    exit();
}

$sContenuqrcode = "https://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];
$html2pdf = new Html2Pdf('P', 'A4', 'fr');
$html2pdf->setDefaultFont('Arial');
$i = 1;
$idcentre = $infoRdvs[0][0]['id_centre'];
$hasTemplate = $objClassGenerique->activ_variable_config($idcentre, "typeprintrcaprdv", "ok");
if ($hasTemplate) {
    foreach ($infoRdvs as $infoRdv) {
        $globalValues = $infoRdv[0];

        setlocale(LC_ALL, "fr_FR.utf8");
        $dateFr = ucfirst(strftime("%A %d %B %Y", mktime()));
        $date_rdv = $globalValues["ville_entite"] . " le " . $dateFr;
        $globalValues["dateNow"] = $date_rdv;
        $firstRdv = $infoRdv;
        $sNomref = $globalValues['ref'];
        $globalValues['ref'] = "Ref : " . $sNomref;
        $fileNameQr = $infoRdv["idRdv"] . "_" . md5($sContenuqrcode) . '.png';
        $qrPath = "./" . $fileNameQr;
        QRcode::png($sContenuqrcode, $qrPath, QR_ECLEVEL_L);
        $logo = "https://hpeuropeen.alaxione.fr/config/img/logohp.png";
        $imgQrcode = $qrPath;
        $adresse = $globalValues["adresse_entite"] . ", " . $globalValues["code_postal_entite"] . " " . $globalValues["ville_entite"];
        $num_tel = $globalValues["tel_entite"];
        $tel_rdv = "Tel : " . $globalValues["tel_entite"];
        $site_web = $globalValues["urlsite_entite"];

        $nom_patient = $globalValues['abreviation_civilite'] . ' ' . $globalValues['prenom_user'] . ' ' . $globalValues['nom_user'];

        $tempAdresse = StringHelper::splitWithSpaceAndInterval($globalValues['adresse_user']);
        $adresse_patient = $tempAdresse . '<br/>' . $globalValues['code_postal_user'] . ' ' . $globalValues['ville_user'];

        $type_rdv = "Confirmation de rendez-vous ";
        $ref = $globalValues['ref'];
        // Le contenu du template à remplir
        $sContent =
            "<p>
            [civilitepatient],<br><br>    
            Vous avez rendez-vous à l'Hôpital EUROPEEN le : 
        </p>
        <p style='text-align: center; margin-top: 20px; margin-bottom: 20px;'>
                <b>[dateheurerdv]</b>
        </p>
        <p>
            pour l'examen suivant: <b>[motif] [unitefonctionnelle]</b><br>
            Avec [nomdocteur]
        </p>

        <p>
            Veuillez vous munir des documents administratifs et médicaux nécessaires:
            <p style=' text-indent: 90px; margin-top: 5px; margin-bottom: 5px;'>-  un justificatif d'identité (CNI, passeport, carte de séjour ..).</p>
            <p  style=' text-indent: 90px; margin-top: 5px; margin-bottom: 5px;'>- votre carte de sécurité sociale (carte vitale).</p>
            <p  style=' text-indent: 90px; margin-top: 5px; margin-bottom: 5px;'>- résultats d'examens médicaux et radiologiques récents.</p>
            <p  style=' text-indent: 90px; margin-top: 5px; margin-bottom: 5px;'>- vos ordonnances de traitements habituels.</p>
            Prévoir le règlement du ticket modérateur (part mutuelle).
        </p>

        <p>
            Nous vous prions de croire, [civilitepatient], en l'expression de nos sentiments dévoués.
        </p>
        <br>
        <p>
            Le secrétariat des Consultations
        </p>               
        ";
        $sContent = str_replace("[dateheurerdv]", $firstRdv["dateFrRdv"] . " à " . $firstRdv["heureRdv"]->format("H:i"), $sContent);
        $sContent = str_replace("[civilitepatient]", trim($globalValues['nom_cvilite']) == "" ? "Monsieur/Madame" : $globalValues['nom_cvilite'], $sContent);
        $sContent = str_replace("[motif]", $firstRdv["libelle_type_rdv"], $sContent);
        $sContent = str_replace("[unitefonctionnelle]", "(" . $firstRdv['unitefonctionnelle'] . ")", $sContent);
        $sContent = str_replace("[nomdocteur]", $firstRdv['nomPraticien'], $sContent);
        $content = $sContent;

        try {
            ob_start();
            include 'api/api_patient/class/template/temp_hopital_europeen4.php';
            $content = ob_get_clean();


            $html2pdf->writeHTML($content);
            $html2pdf->PageOffset($i);
            $i++;
        } catch (Html2PdfException $e) {
            $html2pdf->clean();

            $formatter = new ExceptionFormatter($e);
            echo $formatter->getHtmlMessage();
            exit();
        }
    }
    $aTableauLog = array();
    $commentaireLog = 'Impression de la confirmation du RDV';

    $aTableauLog['ip'] = $_SERVER['REMOTE_ADDR'];
    $aTableauLog['user'] = $objClassGenerique->id_user;
    $aTableauLog['user_name'] = $objClassGenerique->fct_nom_user_connecte();
    $aTableauLog['date'] = date('Y-m-d H:i:s');
    $aTableauLog['script'] = $_SERVER['SCRIPT_NAME'];
    $aTableauLog['methode'] = 'DELETE';
    $aTableauLog['objet'] = 'rdv';
    $aTableauLog['ressource'] = $firstRdv['idRdv'];
    $aTableauLog['status'] = 'nop';
    $aTableauLog['os'] = $_SERVER['HTTP_USER_AGENT'];
    $aTableauLog['navigateur'] = $_SERVER['HTTP_USER_AGENT'];
    $aTableauLog['type'] = 'fonctionnel';
    $aTableauLog['serveur'] = $objClassGenerique->sNomServeurDBB;
    $aTableauLog['entite'] = $_COOKIE['AlaxioneAutreCentre'];
    $aTableauLog['commentaire'] = $commentaireLog;

    $objClassGenerique->push_trace_objet($aTableauLog);

    $html2pdf->output('ConfirmationRDV.pdf');
    exit();
}
?>

<!DOCTYPE html>
<!--[if IE 8]>          <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>          <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->

<!-- Specific Page Data -->
<!-- End of Data -->

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Alaxione</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, Vendroid" />
    <meta name="description" content="Data Tables - Responsive Admin HTML Template">
    <meta name="author" content="Venmond">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="img/ico/favicon.png">


    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="css/fonts.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">


    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">
    <!-- Specific CSS -->
    <link href="plugins/dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/dataTables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
    <link href="plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css">
    <link href="plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css" rel="stylesheet" type="text/css">
    <link href='plugins/fullcalendar-2.3.1/fullcalendar.css' rel='stylesheet' />
    <link href='plugins/fullcalendar-2.3.1/fullcalendar.print.css' rel='stylesheet' media='print' />
    <!-- Theme CSS -->
    <link href="css/theme.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css">




    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">



    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS . 'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script>
    <?php $mobileDetectMin = filemtime(PATH_ASSETS . 'js/mobile-detect.min'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script>
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS . 'js/mobile-detect-modernizr'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php $jquery = filemtime(PATH_ASSETS, 'plugins/fullcalendar-2.3.1/lib/jquery.min.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/lib/jquery.min.<?php echo $jquery ?>.js'></script>

    <!--[if lt IE 9]>
    <?php $excanvas = filemtime(PATH_ASSETS . 'js/excanvas.js'); ?>
    <script type="text/javascript" src="js/excanvas.<?php echo $excanvas ?>.js"></script>
    <![endif]-->
    <?php $bootstrap = filemtime(PATH_ASSETS . 'js/bootstrap.min.js'); ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrap ?>.js"></script>
    <?php $JquerryCustomMin = filemtime(PATH_ASSETS . 'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $JquerryCustomMin ?>.js'></script>
    <?php $jQuerryTouchPunchMin = filemtime(PATH_ASSETS . 'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jQuerryTouchPunchMin ?>.js"></script>
    <?php $caroufred = filemtime(PATH_ASSETS . 'js/caroufredsel.js'); ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufred ?>.js"></script>
    <?php $plugin = filemtime(PATH_ASSETS . 'js/plugins.js'); ?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugin ?>.js"></script>
    <?php $frameWorkJs = filemtime(PATH_ASSETS . 'js/framwork_js.js'); ?>
    <script type="text/javascript" src="js/framwork_js.<?php echo $frameWorkJs ?>.js"></script>

    <!-- Script pour l auto-completion -->
    <?php $jQuerryAutoCompleteMin = filemtime(PATH_ASSETS . 'js/jquery.autocomplete.min.js'); ?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $jQuerryAutoCompleteMin ?>.js"></script>
    <?php $breakPoint = filemtime(PATH_ASSETS . 'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakPoint ?>.js"></script>
    <?php $jQUerryDataTableMin = filemtime(PATH_ASSETS . 'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jQUerryDataTableMin ?>.js"></script>
    <?php $jQuerryPrettyPhoto = filemtime(PATH_ASSETS . 'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $jQuerryPrettyPhoto ?>.js"></script>
    <?php $jQuerryMCustomScrollBarConcatMin = filemtime(PATH_ASSETS . 'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $jQuerryMCustomScrollBarConcatMin ?>.js"></script>
    <?php $jQuerryTagsInput = filemtime(PATH_ASSETS . 'plugins/tagsInput/jquery.tagsinput.min.js'); ?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jQuerryTagsInput ?>.js"></script>
    <?php $bootstrapSwitchMin = filemtime(PATH_ASSETS . 'plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>
    <?php $jQuerryBlockUI = filemtime(PATH_ASSETS . 'plugins/blockUI/jquery.blockUI.js'); ?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $jQuerryBlockUI ?>.js"></script>
    <?php $jQuerryPnotifyMin = filemtime(PATH_ASSETS . 'plugins/pnotify/js/jquery.pnotify.min.js'); ?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $jQuerryPnotifyMin ?>.js"></script>


    <?php $theme = filemtime(PATH_ASSETS . 'js/theme.js'); ?>
    <script type="text/javascript" src="js/theme.<?php echo $theme ?>.js"></script>
    <?php $custom_ = filemtime(PATH_ASSETS . 'custom/custom.js'); ?>
    <script type="text/javascript" src="custom/custom.<?php echo $custom_ ?>.js"></script>

    <!-- Specific Page Scripts Put Here -->
    <?php $jQuerryDataTableMin1 = filemtime(PATH_ASSETS . 'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jQuerryDataTableMin1 ?>.js"></script>
    <?php $dataTablesBootstrap = filemtime(PATH_ASSETS . 'plugins/dataTables/dataTables.bootstrap.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/dataTables.bootstrap.<?php echo $dataTablesBootstrap ?>.js"></script>
    <?php $datepicker = filemtime(PATH_ASSETS . 'js/datepicker-fr.js'); ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepicker?>.js"></script>

    <?php $bootstrapTimePickerMin = filemtime(PATH_ASSETS . 'plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $bootstrapTimePickerMin ?>.js'></script>
    <?php $momentMin = filemtime(PATH_ASSETS . 'plugins/daterangepicker/moment.min.js'); ?>
    <script type="text/javascript" src='plugins/daterangepicker/moment.min.<?php echo $momentMin ?>.js'></script>
    <?php $dateRangePicker = filemtime(PATH_ASSETS . 'plugins/daterangepicker/daterangepicker.js'); ?>
    <script type="text/javascript" src='plugins/daterangepicker/daterangepicker.<?php echo $dateRangePicker ?>.js'></script>
    <?php $colorPicker = filemtime(PATH_ASSETS . 'plugins/colorpicker/colorpicker.js'); ?>
    <script type="text/javascript" src='plugins/colorpicker/colorpicker.<?php echo $colorPicker ?>.js'></script>


    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <?php $loadImageVertical = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/load-image.min.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/load-image.min.<?php echo $loadImageVertical ?>.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <?php $iframeTransVertical = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.iframe-transport.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.iframe-transport.<?php echo $iframeTransVertical ?>.js"></script>
    <!-- The basic File Upload plugin -->
    <?php $jQuerryFileUpload = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload.<?php echo $jQuerryFileUpload ?>.js"></script>
    <!-- The File Upload processing plugin -->
    <?php $jQuerryFileUploadProcess = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-process.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-process.<?php echo $jQuerryFileUploadProcess ?>.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <?php $jQuerryFileUploadImage = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-image.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-image.<?php echo $jQuerryFileUploadImage ?>.js"></script>
    <!-- The File Upload audio preview plugin -->
    <?php $jQuerryFileUploadAudio = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-audio.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-audio.<?php echo $jQuerryFileUploadAudio ?>.js"></script>
    <!-- The File Upload validation plugin -->
    <?php $jQuerryFileUploadValidate = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-validate.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-validate.<?php echo $jQuerryFileUploadValidate ?>.js"></script>



    <!-- Specific Page Scripts END -->
    <?php $momentMin1 = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/lib/moment.min.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/lib/moment.min.<?php echo $momentMin1 ?>.js'></script>
    <?php $fullCalendarMin = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/fullcalendar.min.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/fullcalendar.min.<?php echo $fullCalendarMin ?>.js'></script>
    <?php $langAll = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/lang-all.js') ?>
    <script src='plugins/fullcalendar-2.3.1/lang-all.<?php echo $langAll ?>.js'></script>
    <?php $ckeditor = filemtime(PATH_ASSETS . 'plugins/ckeditor/ckeditor.js'); ?>
    <script type="text/javascript" src='plugins/ckeditor/ckeditor.<?php echo $ckeditor ?>.js'></script>
    <?php $jQuerry1 = filemtime(PATH_ASSETS . 'plugins/ckeditor/adapters/jquery.js'); ?>
    <script type="text/javascript" src='plugins/ckeditor/adapters/jquery.<?php echo $jQuerry1 ?>.js'></script>
    <?php $maskedInputMin = filemtime(PATH_ASSETS . 'js/jquery.maskedinput.min.js'); ?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedInputMin ?>.js"></script>

    <?php $maskChamps = filemtime(PATH_ASSETS . 'js/maskchamps.js') ?>
    <script type="text/javascript" src="js/maskchamps.<?php echo $maskChamps ?>.js"></script>

    <style type="text/css">
        .autocomplete-suggestions {
            border: 1px solid #999;
            background: #FFF;
            overflow: auto;
        }

        .autocomplete-suggestion {
            padding: 2px 5px;
            white-space: nowrap;
            overflow: hidden;
        }

        .autocomplete-selected {
            background: #F0F0F0;
        }

        .autocomplete-suggestions strong {
            font-weight: normal;
            color: #3399FF;
        }

        .vd_menu-search .vd_menu-search-submit2 {
            position: absolute;
            top: 0;
            right: 0;
            background: #27A1C2;
            color: #FFF;
            padding: 2px 8px;
            -webkit-border-radius: 30px;
            -moz-border-radius: 30px;
            border-radius: 30px;
        }

        .vd_menu-search {
            width: 450px;
        }

        select {

            height: 39px;
        }


        .table-responsive {
            overflow-x: auto;
        }
    </style>



    <!-- End of Data -->
</head>

<body onload=" window.print()" id="tables" class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed      responsive    clearfix" data-active="tables " data-smooth-scrolling="1">
    <div style="margin: 0 auto;background-color: #FFFFFF;width: 800px;">
        <?php
        foreach ($infoRdvs as $infoRdv) {
            $globalValues = $infoRdv[0];

            echo $objClassGenerique->mail_recap_html_rdv(
                $globalValues['id_prise_rendez_vous'],
                $globalValues['idpatient_user'],
                "",
                "",
                true,
                "",
                "nomcal_praticien",
                "backoffice",
                $type
            );
            echo '<DIV STYLE="page-break-before:always"></DIV>';

            $aTableauLog = array();
            $commentaireLog = 'Impression de la confirmation du RDV';

            $aTableauLog['ip'] = $_SERVER['REMOTE_ADDR'];
            $aTableauLog['user'] = $objClassGenerique->id_user;
            $aTableauLog['user_name'] = $objClassGenerique->fct_nom_user_connecte();
            $aTableauLog['date'] = date('Y-m-d H:i:s');
            $aTableauLog['script'] = $_SERVER['SCRIPT_NAME'];
            $aTableauLog['methode'] = 'DELETE';
            $aTableauLog['objet'] = 'rdv';
            $aTableauLog['ressource'] = $globalValues['id_prise_rendez_vous'];
            $aTableauLog['status'] = 'nop';
            $aTableauLog['os'] = $_SERVER['HTTP_USER_AGENT'];
            $aTableauLog['navigateur'] = $_SERVER['HTTP_USER_AGENT'];
            $aTableauLog['type'] = 'fonctionnel';
            $aTableauLog['serveur'] = $objClassGenerique->sNomServeurDBB;
            $aTableauLog['entite'] = $_COOKIE['AlaxioneAutreCentre'];
            $aTableauLog['commentaire'] = $commentaireLog;
            $logError = $objClassGenerique->push_trace_objet($aTableauLog);
        }



        ?>
    </div>