<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html><!--<![endif]-->

      <!-- Specific Page Data -->
      <!-- End of Data -->

<head>
    <meta charset="utf-8"/>
    <title>Alaxione</title>
    <meta name="keywords" content=""/>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta HTTP-EQUIV="cache-control" CONTENT="NO-CACHE">
    <meta HTTP-EQUIV="pragma" CONTENT="NO-CACHE">

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
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">


    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">


    <!-- Theme CSS -->
    <link href="../css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="../css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="../css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="../css/theme-responsive.min.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->

    <link href="../css/intlTelInput.css" rel="stylesheet" type="text/css">

    <!-- Custom CSS -->
    <link href="../custom/custom.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php $jQueryPatient filemtime(PATH_ASSETS.'../js/jquery.js') ?>
    <script type="text/javascript" src="../js/jquery.<?php echo $jQueryPatient ?>.js"></script>

    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->
    <?php $bootstrapMinPatient filemtime(PATH_ASSETS.'../js/bootstrap.min.js') ?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrapMinPatient ?>.js"></script>
    <?php $jQcustomMinPatient filemtime(PATH_ASSETS.'../plugins/jquery-ui/jquery-ui.custom.min.js') ?>
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jQcustomMinPatient ?>.js'></script>
    <?php $punchMinPatient filemtime(PATH_ASSETS.'../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMinPatient ?>.js"></script>

    <?php $caroufredPatient filemtime(PATH_ASSETS.'../js/caroufredsel.js') ?>
    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufredPatient ?>.js"></script>
    <?php $pluginsPatient filemtime(PATH_ASSETS.'../js/plugins.js') ?>
    <script type="text/javascript" src="../js/plugins.<?php echo $pluginsPatient ?>.js"></script>

    <?php $pluginsBreakpointsBreakPatiPatient filemtime(PATH_ASSETS.'../plugins/breakpoints/breakpoints.js') ?>
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $pluginsBreakpointsBreakPatiPatient ?>.js"></script>
    <?php $jqueryDataTablesPatient filemtime(PATH_ASSETS.'../plugins/dataTables/jquery.dataTables.min.js') ?>
    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesPatient ?>.js"></script>
    <?php $pluginJqueryPrettyPatient filemtime(PATH_ASSETS.'../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginJqueryPrettyPatient ?>.js"></script>

    <?php $ContctMinPatient filemtime(PATH_ASSETS.'../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $ContctMinPatient?>.js"></script>
    <?php $tagsInputPatient filemtime(PATH_ASSETS.'../plugins/tagsInput/jquery.tagsinput.min.js') ?>
    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInputPatient ?>.js"></script>
    <?php $bootstrapSwitchPatient filemtime(PATH_ASSETS.'../plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchPatient ?>.js"></script>
    <?php $blockUIPatient filemtime(PATH_ASSETS.'../plugins/blockUI/jquery.blockUI.js') ?>
    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUIPatient ?>.js"></script>
    <?php $pNotifyPatient filemtime(PATH_ASSETS.'../plugins/pnotify/js/jquery.pnotify.min.js') ?>
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pNotifyPatient ?>.js"></script>
  
    <?php $themePatient filemtime(PATH_ASSETS.'../js/theme.js') ?>
    <script type="text/javascript" src="../js/theme.<?php echo $themePatient ?>.js"></script>
    <?php $customPatient filemtime(PATH_ASSETS.'../custom/custom.js') ?>
    <script type="text/javascript" src="../custom/custom.<?php echo $customPatient ?>.js"></script>
    <!-- Specific Page Scripts Put Here -->

    <?php $wizardMinPatient filemtime(PATH_ASSETS.'../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizardMinPatient ?>.js'></script>

    <?php $dataPickerPatient filemtime(PATH_ASSETS.'../js/datepicker-fr.js') ?>
    <script type="text/javascript" src="../js/datepicker-fr.<?php echo $dataPickerPatient ?>.js"></script>

    <!-- Head SCRIPTS -->
    <?php $modernzrPatient filemtime(PATH_ASSETS.'../js/modernizr.js') ?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernzrPatient ?>.js"></script>
    <?php $mobileDetectPatient filemtime(PATH_ASSETS.'../js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetectPatient ?>.js"></script>
    <?php $mobileDetectModernPatient filemtime(PATH_ASSETS.'../js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectModernPatient ?>.js"></script>
    <?php $jqueryMaskedinputPatient filemtime(PATH_ASSETS.'../js/jquery.maskedinput.min.js') ?>
    <script type="text/javascript" src="../js/jquery.maskedinput.min.<?php echo $jqueryMaskedinputPatient ?>.js"></script>

    <?php $autoCompletePatient filemtime(PATH_ASSETS.'../js/jquery.autocomplete.min.js') ?>
    <script type="text/javascript" src='../js/jquery.autocomplete.min.<?php echo $autoCompletePatient ?>.js'></script>
    <?php $principalPatient filemtime(PATH_ASSETS.'../js/principal.js') ?>
    <script type="text/javascript" src='../js/principal.<?php echo $principalPatiPatient ?>.js'></script>

    <!-- Script pour l'auto-completion -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/html5shiv.js"></script>
    <script type="text/javascript" src="../js/respond.min.js"></script>
    <![endif]-->
    <?php $intlTelInputPatient filemtime(PATH_ASSETS.'../js/intlTelInput.min.js') ?>
    <script type="text/javascript" src='.../js/intlTelInput.min.<?php echo $intlTelInputPatient ?>.js'></script>
    <?php $maskChampPatient filemtime(PATH_ASSETS.'../js/maskchamps.js') ?>
    <script type="text/javascript" src='../js/maskchamps.<?php echo $maskChampPatient ?>.js'></script>
    <?php $inputmaskPatient filemtime(PATH_ASSETS.'../js/inputmask.js') ?>
    <script type="text/javascript" src='../js/inputmask.<?php echo $inputmaskPatient ?>.js'></script>
    <?php $jQueryInputMaskPatient filemtime(PATH_ASSETS.'../js/jquery.inputmask.js') ?>
    <script type="text/javascript" src='../js/jquery.inputmask.<?php echo $jQueryInputMaskPatient ?>.js'></script>

    {* Select 2 *}
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <?php $selectMinPatient filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js') ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.<?php echo $selectMinPatient ?>.js"></script>

    {literal}
        <script type="text/javascript">
            $(document).ready(function() {
                $('.js-example-basic-single').select2();
            });
        </script>
    {/literal}
    {* Fin Select2 *}

    {literal}


    <style type="text/css">
        @media (min-width: 768px) {
            .modal-dialog {
                width: 700px;
            }
        }

        .vd_bg-color {
            background-color: #5D9AD4 !important;
        }

        a {
            color: #5D9AD4;
        }

        a:hover {
            color: #5D9AD4;
        }

        .vd_radio.radio-success input[type=radio]:checked + label:before {
            border: 1px solid #5D9AD4;
        }

        .vd_radio.radio-success label:after {
            background-color: #5D9AD4;
            border: 1px solid #5D9AD4;
        }

        .ui-datepicker {
            background: #5D9AD4;
        }

        .ui-datepicker a {
            color: #fff;
        }

    </style>
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

        select {

            height: 39px;
        }
    </style>


    {/literal}


</head>

<body id="forms"
      class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix"
      data-active="forms " data-smooth-scrolling="1">


<div id="blocktotal">
    <h2 style="margin: 20px 20px!important;">{$stitre}</h2>{$sMessagepasStatutValide}
    <div class="col-sm-12" style="padding-top:10px;">
        {if $berror}
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i>
                </button>
                <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                {$sMessageError}
            </div>
        {/if}



        {if $bsucess}
        {literal}
            <script type="text/javascript">
                //alert('Enregistement réussi');
                parent.close_modal_principal('', '', '');
            </script>
        {/literal}
        {/if}
        {if $bProfilexiste}
        {if $aTabPRofilage[0]['identifiant_rdv_pris']==''}
            <form action="" method="POST" class="form-horizontal">
            <input type="hidden" name="identifiant_rdv" value="{$identifiant_rdv}">
            <input type="hidden" name="identifiant_entite" value="{$identifiant_entite}">
            <input type="hidden" name="identifiant_patient" value="{$identifiant_patient}">
            <input type="hidden" name="guid_profilage_rdv" value="{$aTabPRofilage[0]['guid_profilage_rdv']}">
            <input type="hidden" name="validation" value="supp">
        {/if}
            <div class="form-group col-sm-12"><h3 align="center" style="color: #90111A">Il existe déjà un profilage sur ce rdv</h3></div>
            <div class="form-group col-sm-12">
                <div class="row">
                    <div class="col-sm-3 ">
                        Motif du RDv<br>
                        <select class="js-example-basic-single">
                            <option>
                                <label class="control-label">{$aTabPRofilage[0]['libelle_type_rdv']}</label>
                            </option>
                        </select>
                    </div>
                    <div class="col-sm-3 ">
                        Lieu<br>
                        <label class="control-label">{$aTabPRofilage[0]['nom_lieux']}</label>
                    </div>
                    <div class="col-sm-3 ">
                        Avec le praticien<br>
                        <label class="control-label">{$aTabPRofilage[0]['abr_proffession']} {$aTabPRofilage[0]['nom_user']}</label>
                    </div>
                    <div class="col-sm-3 ">
                        A partir de<br>
                        <label class="control-label">{$aTabPRofilage[0]['ladate']}</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3 ">
                        URL<br>
                        <label class="control-label"><a href='{$aTabPRofilage[0]['urlcourt_profilage_rdv']}' target="_blank">{$aTabPRofilage[0]['urlcourt_profilage_rdv']}</a></label>
                    </div>

                    <div class="col-sm-3 ">
                        Statut<br>
                        <label class="control-label">{if $aTabPRofilage[0]['identifiant_rdv_pris']==''}En attente {else}Rdv pris{/if}</label>
                    </div>
                </div>
            </div>
            {if $aTabPRofilage[0]['identifiant_rdv_pris']==''}
            <div class="form-group">
                <div class="col-sm-12 controls" align="center">
                    <button type="button" name="updateButton" id="updateButton" onclick="bconf=confirm('Voulez vous supprimer ce profilage');if(bconf)submit();" class="btn vd_btn" style="background-color: #00D3C8;
                -webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px;
                -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                        <span class="menu-icon"></span> Supprimer
                    </button>
                </div>
            </div>

        </form>
        {/if}

        {else}
        <form name= "form_modal_profilage_patient" id="form_modal_profilage_patient" action="" method="POST" class="form-horizontal">
            <input type="hidden" name="identifiant_rdv" value="{$identifiant_rdv}">
            <input type="hidden" name="identifiant_entite" value="{$identifiant_entite}">
            <input type="hidden" name="identifiant_patient" value="{$identifiant_patient}">
            <input type="hidden" name="validation" value="ok">
            <div class="form-group col-sm-12">
                <div class="row">
                    <div class="col-sm-4">
                        <label class="control-label">Motif du RDV</label>
                        <select name="motif" onchange="renvoi_date_profilage(this.value,'{$ladaterdvprofile}')" class="js-example-basic-single" style="height: 39px!important;">
                            <option value=""></option>
                            {if !empty($aTableauMotifRDV)}
                                {section name=sec1 loop=$aTableauMotifRDV}
                                    <option value="{$aTableauMotifRDV[sec1]['id']}"
                                            {if $motif eq $aTableauMotifRDV[sec1]['id']}selected="selected"{/if}>{$aTableauMotifRDV[sec1]['libelle']}</option>
                                {/section}
                            {/if}
                        </select>
                    </div>

                    <div class="col-sm-4">
                        <label class="control-label">Lieu</label>

                        <select name="idlieu" class="js-example-basic-single">
                            <option value=""></option>

                            {foreach from=$aTableauLieu item=itemlieu}
                            <option value="{$itemlieu.id_lieux}"
                                    {if $idlieu eq $itemlieu.id_lieux}selected="selected"{/if}>{$itemlieu.nom_lieux}</option>
                            {/foreach}
                        </select>

                    </div>


                    <div class="col-sm-4">
                        <label class="control-label">Avec le praticien</label>

                        <select name="praticien" class="js-example-basic-single">
                            <option value=""></option>

                            {foreach from=$aTableauPraticien item=itempraticien}
                                <option value="{$itempraticien.identifiant_user}"
                                        {if $praticien eq $itempraticien.identifiant_user}selected="selected"{/if}>{$itempraticien.nom_user}</option>
                            {/foreach}

                        </select>

                    </div>
                </div>
            </div>
            <div class="form-group col-sm-12">
                <div class="row">
                    <div id="divdatedebut" class="col-sm-4">
                        <label>RDV à partir de</label>
                        <div >
                            <input type="date" value="" name="date_debut_profilage"
                                   id="date_debut_profilage" required
                                   class="required input-modal-date-left">
                        </div>
                    </div>

                    <div id="divdatefin" class="col-sm-4">
                        <label>RDV jusqu'à</label>
                        <div >
                            <input type="date" value="" name="date_fin_profilage"
                                   id="date_fin_profilage" required
                                   class="required input-modal-date-left">
                        </div>
                    </div>

                    <div id="divdaterappeldebut" class="col-sm-4">
                        <label>Rappel Patient</label>
                        <div >
                            <input type="date" value="" name="date_rappel_profilage"
                                   id="date_rappel_profilage" required
                                   class="required input-modal-date-left">
                        </div>
                    </div>

                </div>
            </div>

            <div class="form-group col-sm-12">
                <div class="row">
                    <div id="divactiverecurrent" class="col-sm-6">
                        <label>Récurrent</label>
                        <div >
                            <select name="recurrent_actif" class="js-example-basic-single">
                                <option value="N" selected>Non</option>
                                <option value="Y" >Oui</option>

                            </select>
                        </div>
                    </div>
                    <div id="divdelaisrecurrent" class="col-sm-6">
                        <label>Délais du récurrent</label>
                        <div >
                            <select id="delais_recurrent" class="js-example-basic-single" name="delais_recurrent">
                                <option value="0" selected>
                                    0 jour
                                </option>
                                <option value="1">
                                    1 Jour
                                </option>
                                <option value="2">
                                    2 Jours
                                </option>
                                <option value="3">
                                    3 Jours
                                </option>
                                <option value="4">
                                    4 Jours
                                </option>
                                <option value="5">
                                    5 Jours
                                </option>
                                <option value="6">
                                    6 Jours
                                </option>
                                <option value="7">
                                    7 Jours
                                </option>
                                <option value="8">
                                    8 Jours
                                </option>
                                <option value="9">
                                    9 Jours
                                </option>
                                <option value="10">
                                    10 Jours
                                </option>
                                <option value="11">
                                    11 Jours
                                </option>
                                <option value="12">
                                    12 Jours
                                </option>
                                <option value="13">
                                    13 Jours
                                </option>
                                <option value="14">
                                    14 Jours
                                </option>
                                <option value="15">
                                    15 Jours
                                </option>
                                <option value="16">
                                    16 Jours
                                </option>
                                <option value="17">
                                    17 Jours
                                </option>
                                <option value="18">
                                    18 Jours
                                </option>
                                <option value="19">
                                    19 Jours
                                </option>
                                <option value="20">
                                    20 Jours
                                </option>
                                <option value="21">
                                    21 Jours
                                </option>
                                <option value="22">
                                    22 Jours
                                </option>
                                <option value="23">
                                    23 Jours
                                </option>
                                <option value="24">
                                    24 Jours
                                </option>
                                <option value="25">
                                    25 Jours
                                </option>
                                <option value="26">
                                    26 Jours
                                </option>
                                <option value="27">
                                    27 Jours
                                </option>
                                <option value="28">
                                    28 Jours
                                </option>
                                <option value="29">
                                    29 Jours
                                </option>
                                <option value="30">
                                    30 Jours
                                </option>
                                <option value="35">
                                    35 Jours
                                </option>
                                <option value="40">
                                    40 Jours
                                </option>
                                <option value="45">
                                    45 Jours
                                </option>
                                <option value="50">
                                    50 Jours
                                </option>
                                <option value="55">
                                    55 Jours
                                </option>
                                <option value="60">
                                    60 Jours
                                </option>
                                <option value="65">
                                    65 Jours
                                </option>
                                <option value="70">
                                    70 Jours
                                </option>
                                <option value="75">
                                    75 Jours
                                </option>
                                <option value="80">
                                    80 Jours
                                </option>
                                <option value="85">
                                    85 Jours
                                </option>
                                <option value="90">
                                    90 Jours
                                </option>
                                <option value="95">
                                    95 Jours
                                </option>
                                <option value="100">
                                    100 Jours
                                </option>
                                <option value="110">
                                    110 Jours
                                </option>
                                <option value="120">
                                    120 Jours
                                </option>
                                <option value="130">
                                    130 Jours
                                </option>
                                <option value="140">
                                    140 Jours
                                </option>
                                <option value="150">
                                    150 Jours
                                </option>
                                <option value="160">
                                    160 Jours
                                </option>
                                <option value="170">
                                    170 Jours
                                </option>
                                <option value="180">
                                    6 mois
                                </option>
                                <option value="210">
                                    7 mois
                                </option>
                                <option value="240">
                                    8 mois
                                </option>
                                <option value="270">
                                    9 mois
                                </option>
                                <option value="300">
                                    10 mois
                                </option>
                                <option value="330">
                                    11 mois
                                </option>
                                <option value="365">
                                    1 An
                                </option>
                                <option value="456">
                                    1 An et 3 mois
                                </option>
                                <option value="547">
                                    1 An et 6 mois
                                </option>
                                <option value="638">
                                    1 An et 9 mois
                                </option>
                                <option value="730">
                                    2 Ans
                                </option>
                                <option value="1095">
                                    3 Ans
                                </option>
                                <option value="1460">
                                    4 Ans
                                </option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
            {if $afficherconsentement}
            <div id="divsignatureconsentement" class="form-group col-sm-12">
                <div class="row">
                    <div class="col-sm-6">
                        <label>Le patient a signé le consentement</label>
                        <div >
                            <select name="signature_consentement" id="signature_consentement">
                                <option value="N" selected>Non</option>
                                <option value="Y" >Oui</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-6"></div>

                </div>
            </div>
            {/if}
            <div class="clearfix"></div>
            <div id="div_message_check_mail_sms" class="col-md-12" style="text-align: center; display:none;"></div>
            <div class="clearfix"></div>
            <div class="col-sm-12">
                <label class="control-label" style="font-size: 16px;">Comment doit être prévenu le patient ?</label>
            </div>

            <div class="vd_checkbox checkbox-success col-sm-1" >
                <input type="checkbox" class="" name="id_check_mode_demande_profilage[]" value="mail" checked="checked" id="id_check_mode_demande_mail" title="" alt="">
                <label title="" style="text-align: left;" for="id_check_mode_demande_mail">Mail</label>

            </div>
            <div class="col-sm-6">
                <input type="email" name="check_mail_demande" id="check_mail_demande" placeholder="Email du patient" value="{$email_patient}">
            </div>
            <div class="col-sm-5"></div>
            <div class="col-sm-12" style="margin: 5px;"></div>
            <div class="vd_checkbox checkbox-success col-sm-1">
                <input type="checkbox" class="" name="id_check_mode_demande_profilage[]" value="sms" id="id_check_mode_demande_sms" title="" alt="">
                <label title="" style="text-align: left;" for="id_check_mode_demande_sms">SMS</label>

            </div>
            <div class="col-sm-6">
                <input type="hidden" name="check_sms_demande_indicatif" id="check_sms_demande_indicatif" value="{$indicatif_mobile_patient}" />
                <input type="text" placeholder="Téléphone mobile du patient" name="check_sms_demande" id="check_sms_demande" value="{$tel_mobile_patient}"  />
                {literal}
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#check_sms_demande").intlTelInput({
                            preferredCountries:["fr", "be", "ch"],
                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                            utilsScript: "../js/utils.js"
                        });
                        if($("#check_sms_demande_indicatif").val() === "41"){
                            $("#check_sms_demande").inputmask("999 999 99 99");
                        }else if($("#check_sms_demande_indicatif").val() === "33"){
                            $("#check_sms_demande").inputmask("99 99 99 99 99");
                        }

                        $("#check_sms_demande").on("keyup change", function() {
                            var countryData = $("#check_sms_demande").intlTelInput("getSelectedCountryData");
                            $("#check_sms_demande_indicatif").val(countryData.dialCode);
                        });

                        $("#check_sms_demande").on("countrychange", function(e, countryData) {
                            $("#check_sms_demande_indicatif").val(countryData.dialCode);
                            var idpays = countryData.iso2;
                            if(idpays === "fr"){
                                $("#check_sms_demande").inputmask("99 99 99 99 99");
                            }else if(idpays === "ch"){
                                $("#check_sms_demande").inputmask("999 999 99 99");
                            }
                        });
                    });
                </script>
                {/literal}
            </div>
            <div class="col-sm-5"></div>
        </div>
        <div class="form-group" >
            <div class="col-sm-12 controls" align="center" style="margin-top: 10px; margin-bottom: 10px">
                <button type="submit" name="updateButton" id="updateButton" class="btn vd_btn" style="background-color: #00D3C8;
                    -webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px;
                    -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                    <span class="menu-icon"></span> Envoyer
                </button>
            </div>
        </div>

        </form>
        {/if}

</div>

</div>

{literal}
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form_modal_profilage_patient").submit( function(event) {

                check_info_mail_sms(event);

            });

        });
        function check_info_mail_sms(event) {

            $('#div_message_check_mail_sms').hide().html('');
            var smessage = "";
            var bcontinue = true;
            var id_check_mode_demande = $('input[name="id_check_mode_demande_profilage[]"]:checked').map(function () {
                return this.value;
            }).get();

            id_check_mode_demande = id_check_mode_demande + "";

            if (id_check_mode_demande != "") {
                var type_envoi = id_check_mode_demande.split(',');
                if (type_envoi.length === 1) {
                    if (type_envoi[0] == "mail") {
                        // on vérifie qu'un mail est renseigné
                        if ($('#check_mail_demande').val() == "") {
                            smessage += "Veuillez saisir l'email du patient <br/>";
                            bcontinue = false;
                        }
                    }
                    if (type_envoi[0] == "sms") {
                        // on vérifie qu'un sms est renseigné
                        if ($('#check_sms_demande').val() == "") {
                            smessage += "Veuillez saisir le téléphone mobile du patient <br/>";
                            bcontinue = false;
                        }
                    }
                } else {
                    if ($('#check_mail_demande').val() == "") {
                        smessage += "Veuillez saisir l'email du patient <br/>";
                        bcontinue = false;
                    }
                    if ($('#check_sms_demande').val() == "") {
                        smessage += "Veuillez saisir le téléphone mobile du patient <br/>";
                        bcontinue = false;
                    }
                }

                if (!bcontinue) {
                    $('#div_message_check_mail_sms').show().html('<div class="alert alert-danger"><span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>' + smessage + '</div>');
                    event.preventDefault();
                    return false;
                }

            } else {
                smessage = "Veuillez cocher au minimum une case (Mail et/ou SMS)";
                $('#div_message_check_mail_sms').show().html('<div class="alert alert-danger"><span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>' + smessage + '</div>');
                event.preventDefault();
                return false;
            }

            return true;
        }

    </script>
{/literal}


</body>
</html>