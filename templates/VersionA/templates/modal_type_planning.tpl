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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../img/ico/favicon.png">


    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.css" rel="stylesheet" type="text/css">
    <link href="../css/datepicker.css" rel="stylesheet" type="text/css">

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
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery-clockpicker.min.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="../css/theme.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="../css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="../css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="../css/theme-responsive.min.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->
    <link href="../css/jquery-ui.structure.min.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery-ui.theme.min.css" rel="stylesheet" type="text/css">
    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="../custom/custom.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php $jQueryPlanning filemtime(PATH_ASSETS.'../js/jquery.js') ?>
    <script type="text/javascript" src="../js/jquery.<?php echo $jQueryPlanning ?>.js"></script>

    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->
    <?php $bootstrapMiPlanning filemtime(PATH_ASSETS.'../js/bootstrap.min.js') ?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrapMiPlanning ?>.js"></script>
    <?php $jQcustomMiPlanning filemtime(PATH_ASSETS.'../plugins/jquery-ui/jquery-ui.custom.min.js') ?>
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jQcustomMiPlanning ?>.js'></script>
    <?php $punchMinPlanning filemtime(PATH_ASSETS.'../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMinPlanning ?>.js"></script>

    <?php $caroufredPlanning filemtime(PATH_ASSETS.'../js/caroufredsel.js') ?>
    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufredPlanning ?>.js"></script>
    <?php $pluginsPlanning filemtime(PATH_ASSETS.'../js/plugins.js') ?>
    <script type="text/javascript" src="../js/plugins.<?php echo $pluginsPlanning ?>.js"></script>

    <?php $pluginsBreakpointsBreakpoiPlanning filemtime(PATH_ASSETS.'../plugins/breakpoints/breakpoints.js') ?>
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $pluginsBreakpointsBreakpoiPlanning ?>.js"></script>
    <?php $jqueryDataTablesPlanning filemtime(PATH_ASSETS.'../plugins/dataTables/jquery.dataTables.min.js') ?>
    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesPlanning ?>.js"></script>
    <?php $pluginJqueryPrettyPhPlanning filemtime(PATH_ASSETS.'../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginJqueryPrettyPhPlanning ?>.js"></script>

    <?php $ContctMinPlanning filemtime(PATH_ASSETS.'../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $ContctMinPlanning ?>.js"></script>
    <?php $tagsInputPlanning filemtime(PATH_ASSETS.'../plugins/tagsInput/jquery.tagsinput.min.js') ?>
    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInputPlanning ?>.js"></script>
    <?php $bootstrapSwitchPlanning filemtime(PATH_ASSETS.'../plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchPlanning ?>.js"></script>
    <?php $blockUIPlanning filemtime(PATH_ASSETS.'../plugins/blockUI/jquery.blockUI.js') ?>
    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUIPlanning ?>.js"></script>
    <?php $pNotifyPlanning filemtime(PATH_ASSETS.'../plugins/pnotify/js/jquery.pnotify.min.js') ?>
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pNotifyPlanning ?>.js"></script>
  

    <?php $themePlanning filemtime(PATH_ASSETS.'../js/theme.js') ?>
    <script type="text/javascript" src="../js/theme.<?php echo $themePlanning ?>.js"></script>
    <?php $customPlanning filemtime(PATH_ASSETS.'../custom/custom.js') ?>
    <script type="text/javascript" src="../custom/custom.<?php echo $customPlanning ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->
    <?php $wizardMinPlanning filemtime(PATH_ASSETS.'../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizardMinPlanning ?>.js'></script>

    <?php $dataPickerPlanning filemtime(PATH_ASSETS.'../js/datepicker-fr.js') ?>
    <script type="text/javascript" src="../js/datepicker-fr.<?php echo $dataPickerPlanning ?>.js"></script>

    <?php $timePickerPlanning filemtime(PATH_ASSETS.'../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timePickerPlanning ?>.js'></script>

    <?php $pickerDatePlanning filemtime(PATH_ASSETS.'../js/datepicker.js') ?>
    <script type="text/javascript" src="../js/datepicker.<?php echo $pickerDatePlanning ?>.js"></script>

    <?php $clockPickerPlanning filemtime(PATH_ASSETS.'../js/jquery-clockpicker.min.js') ?>
    <script type="text/javascript" src="../js/jquery-clockpicker.min.<?php echo $clockPickerPlanning ?>.js"></script>

    <!-- Head SCRIPTS -->
    <?php $modernzrPlanning filemtime(PATH_ASSETS.'../js/modernizr.js') ?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernzrPlanning ?>.js"></script>
    <?php $mobileDetectPlanning filemtime(PATH_ASSETS.'../js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetectPlanning ?>.js"></script>
    <?php $mobileDetectModernPlanning filemtime(PATH_ASSETS.'../js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectModernPlanning ?>.js"></script>
    <?php $jqueryMaskedinputPlanning filemtime(PATH_ASSETS.'../js/jquery.maskedinput.min.js') ?>
    <script type="text/javascript" src="../js/jquery.maskedinput.min.<?php echo $jqueryMaskedinputPlanning ?>.js"></script>

    <?php $pluginsCkeditorCkPlanning filemtime(PATH_ASSETS.'../plugins/ckeditor/ckeditor.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/ckeditor.<?php echo $pluginsCkeditorCkPlanning ?>.js'></script>
    <?php $ckeditorAdaptersPlanning filemtime(PATH_ASSETS.'../plugins/ckeditor/adapters/jquery.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/adapters/jquery.<?php echo $ckeditorAdaptersPlanning ?>.js'></script>

    <?php $jQryInputMaskPlanning filemtime(PATH_ASSETS.'../js/jquery.inputmask.js') ?>
    <script type="text/javascript" src="../js/jquery.inputmask.<?php echo $jQryInputMaskPlanning ?>.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/html5shiv.js"></script>
    <script type="text/javascript" src="../js/respond.min.js"></script>
    <![endif]-->

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

        select {

            height: 39px;
        }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            var divdatedebut = document.getElementById('divdatedebut');
            var divdatefin = document.getElementById('divdatefin');
            var divsemaine = document.getElementById('divsemaine');

            $("#heuredebut").mask("99:99");
            $("#heurefin").mask("99:99");


            $("#datedebut").mask("99/99/9999");
            $("#datefin").mask("99/99/9999");

            $("#saction").on('change', function () {
                if ($("#saction").val() == 1 || $("#saction").val() == "") {
                    divdatedebut.style.display = 'none';
                    divdatefin.style.display = 'none';
                    divsemaine.style.display = 'none';
                } else {
                    divdatedebut.style.display = 'block';
                    divdatefin.style.display = 'block';
                    divsemaine.style.display = 'block';
                }
            });

            $("#btn_add").click(function() {

                $("#val_appli_direct").val("");
                $("#btn_add").attr("disabled", true);
                $("#btn_add").html("<i class='fa fa-spinner fa-spin'></i> &nbsp;En cours de traitement...");
                $("#btn_appli_direct").attr("disabled", true);
                $("#btn_add_tranche").attr("disabled", true);
                $("#btn_raz").attr("disabled", true);

                $('#formEnregDispo').submit();
                return false;
            });

            $("#btn_appli_direct").click(function() {

                $("#val_appli_direct").val("ok");
                $("#btn_appli_direct").attr("disabled", true);
                $("#btn_appli_direct").html("<i class='fa fa-spinner fa-spin'></i> &nbsp;En cours de traitement...");
                $("#btn_add").attr("disabled", true);
                $("#btn_add_tranche").attr("disabled", true);
                $("#btn_raz").attr("disabled", true);

                $('#formEnregDispo').submit();
                return false;
            });

        });

        function confirmation_supp(stext) {
            if (confirm(stext)) {
                $('#supp_valide').val("1");
                $('#add-dispo-form').submit();
            } else {
                $('#supp_valide').val("0");
            }
        }

        var etatdiv = 0;
        function open_ladiv(etat) {

            if (etat == 0) {
                etat = 1;
                $("#myModal").hide();
                $("#myModalListe").removeClass("col-md-6");
            } else {
                etat = 0;
                $("#myModal").show();
                $("#myModalListe").addClass("col-md-6");
            }

            return etat;
        }

        function suppression_affichage_tranche(idheuredebut, idheurefin, iddiv, iddiv2) {

            document.getElementById(idheuredebut).value = '';
            document.getElementById(idheurefin).value = '';
            document.getElementById(iddiv).style.display = 'none';
            document.getElementById(iddiv2).style.display = 'none';
        }

        $(function () {
            $("#idsalle").load('../ajax/lst_salle_attente.php?bplanning=1&type=attente&idlieu=' + $("#idlieu").val() + '&idsalle={/literal}{$idsalle}{literal}');

            $.ajax({
                url: '../ajax/lst_salle_attente.php',
                data: 'bplanning=1&type=consult&idlieu=' + $("#idlieu").val() + '&idsalle={/literal}{$idbox}{literal}',
                dataType: 'html',
                success: function (data) {
                    $('#idbox').html("<option value=''></option>" + data);
                }
            });

            $("#idlieu").change(function () {
                $("#idsalle").load('../ajax/lst_salle_attente.php?bplanning=1&type=attente&idlieu=' + $("#idlieu").val());
            });

            $("#idlieu").change(function () {
                $.ajax({
                    url: '../ajax/lst_salle_attente.php',
                    data: 'bplanning=1&type=consult&idlieu=' + $("#idlieu").val(),
                    dataType: 'html',
                    success: function (data) {
                        $('#idbox').html("<option value=''></option>" + data);
                    }
                });
            });

        });

    </script>
    {/literal}
    {if $bsucess}
    {literal}
        <script type="text/javascript">
            //parent.close_modal_principal('', '', '1');
            parent.refresh_calendar();
        </script>
    {/literal}
    {/if}

</head>

<body id="forms"
      class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix"
      data-active="forms " data-smooth-scrolling="1">
<h2 align="center">Création de planning de type</h2>
{if isset($bMessageErreurForm) and $bMessageErreurForm}
    <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i
                    class="fa fa-exclamation-circle vd_red"></i></span>{if isset($sMessageErreurForm)}{$sMessageErreurForm}{/if}
    </div>
{/if}
{if isset($bMessageSuccesForm) and $bMessageSuccesForm}
    <div class="alert alert-success >
        <button type=" button
    " class="close" data-dismiss="alert" aria-hidden="true">
    <i class="icon-cross"></i>
    </button>
    <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
    {if isset($sMessageSuccesForm)}{$sMessageSuccesForm}{/if}
    </div>
{/if}

<div class="row" style="margin-right: 18px; margin-left: 18px;">
    <div class="tabs">
        <ul class="nav nav-tabs widget vd_bg-color">
            <li class="{$activeinfo}"><a href="#info-tab" data-toggle="tab"> <span class="menu-icon"><i
                                class="fa fa-user"></i></span>Informations<span class="menu-active"><i
                                class="fa fa-caret-up"></i></span> </a></li>
            {*<li class="{$activeliste}"><a href="#profil-tab" data-toggle="tab"> <span
                            class="menu-icon"><i class="fa fa-history"></i></span>Liste des Tranches mémorisées<span
                            class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>*}
        </ul>
        <div class="tab-content mgbt-xs-20">
            <div class="tab-pane {$activeinfo} col-sm-12" id="info-tab">
                <div id="myModal" style='display:block;' class="col-md-12">
                    <div class="col-md-12" style="margin-top:0px;margin-bottom:0px;">
                        <div>
                            <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
                                {if $bActionmodif}
                                <form id="formEnregDispo" name="formEnregDispo" class="form-horizontal" method="POST"
                                      action="" {*id="add-dispo-form" name="add-dispo-form"*}>
                                    {/if}
                                    <div class="vd_content-section clearfix" style="padding:0px;">
                                        <div class="row" style="margin-bottom:0px;">
                                            <div class="col-md-full">
                                                <div class="panel widget">
                                                    <div class="panel-body">

                                                        <input type="hidden" name="dir" id="dir" value="{$dir}"/>
                                                        <input type="hidden" name="idunique" id="idunique"  value="{$idunique}"/>
                                                        <input type="hidden" name="idplanning_type" id="id_planning_type"  value="{$idplanning_type}"/>
                                                        <input type="hidden" name="identifiant_user"
                                                               value="{$identifiant_user}"/>
                                                        <input type="hidden" name="idtranche" id="idtranche"
                                                               value="{$idtranche}"/>
                                                        <input type="hidden" name="validation" id="validation"
                                                               value="ok"/>
                                                        <input type="hidden" name="id_user" id="id_user"
                                                               value="{$id_user}"/>
                                                        <input type="hidden" name="idc" id='idc' value=""/>
                                                        <input type="hidden" name="supp_valide" id='supp_valide'
                                                               value="1"/>
                                                        <input type="hidden" name="val_appli_direct" id='val_appli_direct'
                                                               value=""/>
                                                        {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    if ($("#idtranche").val() != "") {
                                                                        divdatedebut.style.display = 'none';
                                                                        divdatefin.style.display = 'none';
                                                                        divsemaine.style.display = 'none';
                                                                    }
                                                                });
                                                            </script>
                                                        {/literal}
                                                        {if $berror}
                                                            <div class="alert alert-danger">
                                                                <button type="button" class="close" data-dismiss="alert"
                                                                        aria-hidden="true"><i class="icon-cross"></i>
                                                                </button>
                                                                <span class="vd_alert-icon"><i
                                                                            class="fa fa-exclamation-circle vd_red"></i></span>
                                                                {$sMessageError}
                                                            </div>
                                                        {/if}

                                                        {if $bwarning}
                                                            <div class="alert alert-warning">
                                                                <button type="button" class="close" data-dismiss="alert"
                                                                        aria-hidden="true"><i class="icon-cross"></i>
                                                                </button>
                                                                <span class="vd_alert-icon"><i
                                                                            class="fa fa-exclamation-circle vd_red"></i></span>
                                                                {$sMessageWarning}
                                                            </div>
                                                        {/if}

                                                        {if $idunique!=""}
                                                            <div class="form-group" id="divlieux">
                                                                <div class="col-sm-12 controls">
                                                                    <div class="label-wrapper-modal">
                                                                        <label class="control-label">Vous souhaitez
                                                                                                     effectuer
                                                                                                     l'action
                                                                                                     pour</label>
                                                                    </div>
                                                                    <div class="vd_input-wrapper-modal">
                                                                        <select name="saction" id="saction" required
                                                                                class="required"
                                                                                onchange="if(this.value==3)location.replace('modal_disponibilite_partition.php?idunique={$idunique}&id_user={$id_user}&idtranche={$idtranche}');">
                                                                            <option value="1">Seulement la tranche
                                                                                              sélectionnée
                                                                            </option>
                                                                            {*<option value="2">Toutes les tranches qui correspondent à ces critères</option>*}
                                                                            <option value="3">Partitionner la tranche
                                                                            </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        {/if}
                                                        <div class="form-group" id="divlieux">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Lieu</label>
                                                                </div>
                                                                <div class="vd_input-wrapper-modal">
                                                                    <select name="idlieu" id="idlieu" required
                                                                            class="required">
                                                                        <option value=""></option>
                                                                        {if !empty($aTableauLieu)}
                                                                            {section name=sec1 loop=$aTableauLieu}
                                                                                <option value="{$aTableauLieu[sec1]['id_lieux']}"
                                                                                        {if $idlieu eq $aTableauLieu[sec1]['id_lieux']}selected="selected"{/if}>{$aTableauLieu[sec1]['nom_lieux']}</option>
                                                                            {/section}
                                                                        {/if}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divsalleconsult">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Salle de consultation
                                                                                                 (Salle)</label>
                                                                </div>
                                                                <div class="vd_input-wrapper-modal">
                                                                    <select name="idbox" id="idbox"></select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divsalleattente">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Salle d'attente</label>
                                                                </div>
                                                                <div class="vd_input-wrapper-modal">
                                                                    <select name="idsalle" id="idsalle" required
                                                                            class="required"></select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divactivite">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Activité</label>
                                                                </div>
                                                                <div class="vd_input-wrapper-modal">
                                                                    <select name="idactivite" id="idactivite" required
                                                                            class="required">
                                                                        <option value=""></option>
                                                                        {foreach from=$aTableauActivite item=objActivite}
                                                                            <option value="{$objActivite.identifiant_activite}"
                                                                                    {if $idactivite eq $objActivite.identifiant_activite}selected="selected"{/if}>{if $objActivite.abreviation_type_activite!=""}({$objActivite.abreviation_type_activite}) -{/if} {$objActivite.libelle_type_activite}</option>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="form-group" id="divconsigne">
                                                            <div class="col-sm-12 controls">
                                                                <div class="input-group label-wrapper-modal">
                                                                    <label class="control-label">Consigne</label>
                                                                </div>
                                                                <div>
                                                        <textarea id="consigne" name="consigne" rows="2"
                                                                  data-rel="ckeditor"
                                                                  class="ckeditor">{$consigne}</textarea>
                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            CKEDITOR.replace(
                                                                                consigne,
                                                                                {
                                                                                    toolbar: [
                                                                                        {
                                                                                            name: 'clipboard',
                                                                                            items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Cut', 'Copy', 'PasteText', '-', 'Undo', 'Redo', '-', 'NumberedList', 'BulletedList']
                                                                                        },
                                                                                        {
                                                                                            name: 'styles',
                                                                                            items: ['FontSize']
                                                                                        },
                                                                                        {
                                                                                            name: 'colors',
                                                                                            items: ['TextColor', 'BGColor']
                                                                                        },
                                                                                        {
                                                                                            name: 'align',
                                                                                            items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
                                                                                        }

                                                                                    ]
                                                                                });
                                                                        </script>
                                                                    {/literal}
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divopenttel">
                                                            <div class="col-sm-4 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour le
                                                                                                 widget</label>
                                                                </div>
                                                                <div class="vd_radio radio-success">
                                                                    <input type="radio" name="opentwidget"
                                                                           {if $opentwidget eq 'Y'}checked="checked"{/if}
                                                                           value="Y"
                                                                           id="id_opentwidget_oui">
                                                                    <label for="id_opentwidget_oui">Oui</label>
                                                                    <input type="radio" name="opentwidget"
                                                                           {if $opentwidget eq 'N' || $opentwidget eq ''}checked="checked"{/if}
                                                                           value="N"
                                                                           id="id_opentwidget_non">
                                                                    <label for="id_opentwidget_non">Non</label>

                                                                </div>
                                                            </div>

                                                            <div class="col-sm-4 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour le
                                                                                                 telephone</label>
                                                                </div>
                                                                <div class="vd_radio radio-success">
                                                                    <input type="radio" name="opentel"
                                                                           {if $opentel eq 'Y'}checked="checked"{/if}
                                                                           value="Y"
                                                                           id="id_opentel_oui">
                                                                    <label for="id_opentel_oui">Oui</label>
                                                                    <input type="radio" name="opentel"
                                                                           {if $opentel eq 'N' || $opentel eq ''}checked="checked"{/if}
                                                                           value="N"
                                                                           id="id_opentel_non">
                                                                    <label for="id_opentel_non">Non</label>

                                                                </div>
                                                            </div>

                                                            <div class="col-sm-4 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour
                                                                                                 interpro</label>
                                                                </div>
                                                                <div class="vd_radio radio-success">
                                                                    <input type="radio" name="opentinterpro"
                                                                           {if $opentinterpro eq 'Y'}checked="checked"
                                                                           {/if}value="Y"
                                                                           id="id_opentinterpro_oui">
                                                                    <label for="id_opentinterpro_oui">Oui</label>
                                                                    <input type="radio" name="opentinterpro"
                                                                           {if $opentinterpro eq 'N' || $opentinterpro eq ''}checked="checked"
                                                                           {/if}value="N"
                                                                           id="id_opentinterpro_non">
                                                                    <label for="id_opentinterpro_non">Non</label>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divtyperdv">
                                                            <div class="col-sm-12 controls">
                                                                <div class="">
                                                                    <label>Motif de rendez vous</label>
                                                                    <div>
                                                                        <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                            <input
                                                                                    type="checkbox"
                                                                                    class=""
                                                                                    name="id_checkAll_dispo"
                                                                                    value=""
                                                                                    id="id_checkAll_dispo"
                                                                            >
                                                                            <label for="id_checkAll_dispo"> Tous </label>
                                                                        </div>
                                                                            {foreach from=$aTableauTyperdv item=objTyperdv}
                                                                        <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                            <input class="class_checkAll_dispo"
                                                                                   id="checkbox-{$objTyperdv.id}"
                                                                                   type="checkbox" name="typerdv[]"
                                                                                   value="{$objTyperdv.id}"
                                                                                   {if in_array($objTyperdv.id, $typerdv)}checked=checked{/if}>
                                                                            <label for="checkbox-{$objTyperdv.id}"> {$objTyperdv.abreviation} - {$objTyperdv.libelle} </label>
                                                                        </div>
                                                                            {/foreach}

                                                                        {literal}
                                                                            <script type="text/javascript">
                                                                                $(function () {
                                                                                    $("#id_checkAll_dispo").click(function () {
                                                                                        if ($("#id_checkAll_dispo").is(':checked')) {
                                                                                            $(".class_checkAll_dispo").each(function () {
                                                                                                $(this).prop("checked", true);
                                                                                            });

                                                                                        } else {
                                                                                            $(".class_checkAll_dispo").each(function () {
                                                                                                $(this).prop("checked", false);
                                                                                            });
                                                                                        }
                                                                                    });
                                                                                });

                                                                            </script>
                                                                        {/literal}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        {if $bActifchirugiens}
                                                        <div class="form-group" id="divtyperdv">
                                                            <div class="col-sm-12 controls">
                                                                <div>
                                                                    <label>Chirurgiens</label>
                                                                    <div>
                                                                        <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                            <input
                                                                                    type="checkbox"
                                                                                    class=""
                                                                                    name="id_checkAll_chirugien"
                                                                                    value=""
                                                                                    id="id_checkAll_chirugien"
                                                                            >
                                                                            <label for="id_checkAll_chirugien">Tous </label>
                                                                        </div>
                                                                        {foreach from=$aTableauListeChirurgien item=objChirurgien}
                                                                        <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                            <input class="class_checkAll_chirugien"
                                                                                   id="checkbox-{$objChirurgien.id_chirurgien}"
                                                                                   type="checkbox" name="tabchirugien[]"
                                                                                   value="{$objChirurgien.id_chirurgien}"
                                                                                   {if in_array($objChirurgien.id_chirurgien, $tabchirugien)}checked=checked{/if}>
                                                                            <label for="checkbox-{$objChirurgien.id_chirurgien}"> {$objChirurgien.civilite} {$objChirurgien.nom} ({$objChirurgien.profession})</label>
                                                                        </div>
                                                                            {/foreach}
                                                                        </div>
                                                                        {literal}
                                                                            <script type="text/javascript">
                                                                                $(function () {
                                                                                    $("#id_checkAll_chirugien").click(function () {
                                                                                        if ($("#id_checkAll_chirugien").is(':checked')) {
                                                                                            $(".class_checkAll_chirugien").each(function () {
                                                                                                $(this).prop("checked", true);
                                                                                            });

                                                                                        } else {
                                                                                            $(".class_checkAll_chirugien").each(function () {
                                                                                                $(this).prop("checked", false);
                                                                                            });
                                                                                        }
                                                                                    });
                                                                                });
                                                                            </script>
                                                                        {/literal}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {/if}


                                                        <div class="form-group" id="divheurejour">
                                                            <div class="col-sm-6">
                                                                <div class="col-sm-6 controls">
                                                                    <div class="input-group" id="divheuredebut0">
                                                                        <label>Heure de début </label>
                                                                        <div class="input-group bootstrap-timepicker">
                                                                            <input type="text" id="heuredebut0"
                                                                                   name="heuredebut0"
                                                                                   value="{$aTableautrancheHeure[0].heuredebut}"
                                                                                   class="input-modal-date-left" {$aTableautrancheHeure[0].style}>
                                                                            <span class="input-group-addon input-modal-date-right"
                                                                                  id="timepicker-default-span"><i
                                                                                        class="fa fa-clock-o"></i></span>
                                                                        </div>
                                                                    </div>

                                                                    {for $foo=1 to 15}
                                                                        <div class="input-group"
                                                                             style="display:{$aTableautrancheHeure[$foo].open}"
                                                                             id="divheuredebut{$foo}">
                                                                            <label>Heure de début</label>
                                                                            <div class="input-group bootstrap-timepicker heuredebut0">
                                                                                <input type="text" id="heuredebut_{$foo}"
                                                                                       name="heuredebut{$foo}"
                                                                                       value="{$aTableautrancheHeure[$foo].heuredebut}"
                                                                                       class="input-modal-date-left" {$aTableautrancheHeure[$foo].style}>
                                                                                <span class="input-group-addon input-modal-date-right"
                                                                                      id="timepicker-default-span"><i
                                                                                            class="fa fa-clock-o"></i></span>
                                                                            </div>
                                                                        </div>
                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $("#heuredebut{/literal}_{$foo}{literal}").clockpicker({
                                                                                    placement: 'top',
                                                                                    autoclose: true
                                                                                });
                                                                                $("#heuredebut{/literal}_{$foo}{literal}").mask("99:99");
                                                                            });
                                                                            var posdisplayheuredebut = 1;
                                                                            var posdisplayheurefin = 1;
                                                                            function open_tranche(compte) {


                                                                                sdivfin = "divheurefin" + compte;
                                                                                sdivdebut = "divheuredebut" + compte;
                                                                                document.getElementById(sdivfin).style.display = "block";
                                                                                document.getElementById(sdivdebut).style.display = "block";

                                                                                compte = compte + 1;
                                                                                //alert(compte);

                                                                                return compte;

                                                                            }
                                                                        </script>
                                                                    {/literal}

                                                                    {/for}

                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $("#heuredebut0").clockpicker({
                                                                                    placement: 'top',
                                                                                    autoclose: true
                                                                                });
                                                                                $("#heuredebut0").mask("99:99");
                                                                            });
                                                                            var posdisplayheuredebut = 1;
                                                                            var posdisplayheurefin = 1;
                                                                            function open_tranche(compte) {


                                                                                sdivfin = "divheurefin" + compte;
                                                                                sdivdebut = "divheuredebut" + compte;
                                                                                document.getElementById(sdivfin).style.display = "block";
                                                                                document.getElementById(sdivdebut).style.display = "block";

                                                                                compte = compte + 1;
                                                                                //alert(compte);

                                                                                return compte;

                                                                            }
                                                                        </script>
                                                                    {/literal}

                                                                </div>

                                                                <div class="col-sm-6 controls">
                                                                    <div class="input-group" id="divheurefin0">
                                                                        <label>Heure de fin

                                                                        </label>
                                                                        <div class="input-group bootstrap-timepicker">
                                                                            <input type="text" id="heurefin0"
                                                                                   name="heurefin0"
                                                                                   value="{$aTableautrancheHeure[0].heurefin}"
                                                                                   class="required input-modal-date-left" {$aTableautrancheHeure[0].style}>
                                                                            <span class="input-group-addon input-modal-date-right"
                                                                                  id="timepicker-default-span" ><i
                                                                                        class="fa fa-clock-o"></i></span><img
                                                                                    src="../css/delete_icon.gif"
                                                                                    onclick="suppression_affichage_tranche('heuredebut0','heurefin0','divheurefin0','divheuredebut0')"
                                                                                    style="margin-left:5px;cursor:pointer;">
                                                                        </div>

                                                                    </div>

                                                                    {for $foo=1 to 15}
                                                                        <div class="input-group"
                                                                             style="display:{$aTableautrancheHeure[$foo].open}"
                                                                             id="divheurefin{$foo}">
                                                                            <label>Heure de fin </label>
                                                                            <div class="input-group bootstrap-timepicker">
                                                                                <input type="text" id="heurefin_{$foo}"
                                                                                       name="heurefin{$foo}"
                                                                                       value="{$aTableautrancheHeure[$foo].heurefin}"
                                                                                       class=" input-modal-date-left" {$aTableautrancheHeure[$foo].style}>
                                                                                <span class="input-group-addon input-modal-date-right"
                                                                                      id="timepicker-default-span"><i
                                                                                            class="fa fa-clock-o"></i></span><img
                                                                                        src="../css/delete_icon.gif"
                                                                                        onclick="suppression_affichage_tranche('heuredebut_{$foo}','heurefin_{$foo}','divheurefin{$foo}','divheuredebut{$foo}')"
                                                                                        style="margin-left:5px;cursor:pointer;">
                                                                            </div>

                                                                        </div>
                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $("#heurefin{/literal}_{$foo}{literal}").clockpicker({
                                                                                    placement: 'top',
                                                                                    autoclose: true
                                                                                });
                                                                                $("#heurefin{/literal}_{$foo}{literal}").mask("99:99");
                                                                            });
                                                                            var posdisplayheuredebut = 1;
                                                                            var posdisplayheurefin = 1;
                                                                            function open_tranche(compte) {


                                                                                sdivfin = "divheurefin" + compte;
                                                                                sdivdebut = "divheuredebut" + compte;
                                                                                document.getElementById(sdivfin).style.display = "";
                                                                                document.getElementById(sdivdebut).style.display = "";

                                                                                compte = compte + 1;
                                                                                //alert(compte);

                                                                                return compte;

                                                                            }
                                                                        </script>
                                                                    {/literal}

                                                                    {/for}



                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $("#heurefin0").clockpicker({
                                                                                    placement: 'top',
                                                                                    autoclose: true
                                                                                });
                                                                                $("#heurefin0").mask("99:99");
                                                                            });
                                                                        </script>
                                                                    {/literal}

                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">

                                                                <div id="divsemaine" class="col-sm-12 controls">
                                                                    <div class="input-group">
                                                                        <label>Jour de la semaine</label>
                                                                        <div>

                                                                            <div class="vd_checkbox checkbox-success">
                                                                                <input id="checkbox-Lundi" type="checkbox"
                                                                                       name="day[]"
                                                                                       value="1"
                                                                                       {if in_array('1', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Lundi"> Lundi </label>

                                                                                <input id="checkbox-Mardi" type="checkbox"
                                                                                       name="day[]"
                                                                                       value="2"
                                                                                       {if in_array('2', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Mardi"> Mardi </label>

                                                                                <input id="checkbox-Mercredi"
                                                                                       type="checkbox"
                                                                                       name="day[]" value="3"
                                                                                       {if in_array('3', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Mercredi">
                                                                                    Mercredi </label>

                                                                                <input id="checkbox-Jeudi" type="checkbox"
                                                                                       name="day[]"
                                                                                       value="4"
                                                                                       {if in_array('4', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Jeudi"> Jeudi </label>

                                                                                <input id="checkbox-Vendredi"
                                                                                       type="checkbox"
                                                                                       name="day[]" value="5"
                                                                                       {if in_array('5', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Vendredi">
                                                                                    Vendredi </label>

                                                                                <input id="checkbox-Samedi" type="checkbox"
                                                                                       name="day[]"
                                                                                       value="6"
                                                                                       {if in_array('6', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Samedi">
                                                                                    Samedi </label>

                                                                                <input id="checkbox-Dimanche"
                                                                                       type="checkbox"
                                                                                       name="day[]" value="0"
                                                                                       {if in_array('0', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Dimanche">
                                                                                    Dimanche </label>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>


                                                        {if !$bblocaction}
                                                            <button id="btn_add" name="btn_add" type="submit"
                                                                    class="btn vd_btn vd_bg-green">Valider
                                                            </button>

                                                            <button id="btn_add_tranche" name="btn_add_tranche" type="button" class="btn vd_btn vd_bg-green"
                                                                    style="color:#FFFFFF !important; background-color: #2dab28 !important;"
                                                                    onclick="posdisplayheuredebut=open_tranche(posdisplayheuredebut);">
                                                                Ajouter une tranche
                                                            </button>
                                                        {/if}

                                                        <button id="btn_raz" name="btn_raz" type="button" class="btn vd_btn vd_bg-grey"
                                                                onclick="location.replace('modal_type_planning.php?idplanning_type={$idplanning_type}')">
                                                            RAZ
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        {if $bActionmodif}
                            </form>
                        {/if}
                    </div>
                </div>

            <div class="tab-pane {$activeliste} col-sm-12" id="profil-tab"
                 style="padding-right: 0px;padding-left: 0px;">
                <div id="myModalListe" style='display:block;padding-top: 32px;' class="col-md-12">

                    <table border="1" width="100%" class="table table-bordered">
                        <tr>
                            <caption style="padding-top: 10px; margin-bottom: 18px;">
                                <form class="form-horizontal" method="POST">
                                    <input type="hidden" name="identifiant_user" value="{$identifiant_user}"/>
                                    <input type="hidden" name="actiontranche" value=""/>
                                    <input type="hidden" name="id_user" id="id_user" value="{$id_user}"/>
                                    Les plannings enregistrés &nbsp;&nbsp;<select name="sDatefiltre"
                                                                                  style="width: inherit">
                                        <option value=""></option>
                                        {foreach from=$aTableauJourTravaille item=objjourtravailler}
                                            <option value="{$objjourtravailler.datetravail_planning_tmp}">{$objjourtravailler.ladate}</option>
                                        {/foreach}
                                    </select>&nbsp;&nbsp;<button class="btn vd_btn vd_bg-green" type="submit">
                                        Rechercher
                                    </button>
                                    <br>
                                </form>
                            </caption>
                        </tr>
                        <thead>
                        <tr>
                            <th>

                            </th>
                            <th>
                                Date debut
                            </th>
                            <th>
                                Date fin
                            </th>
                            <th>
                                Tranche horaire
                            </th>
                            <th>
                                Jour
                            </th>
                            <th>
                                Les motifs
                            </th>
                            <th>
                                Info suplementaire
                            </th>

                        </tr>
                        </thead>

                        {foreach from=$aTableauLitePlanningTmp item=objplanningtmp}
                            <tr>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Action <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            {if $objplanningtmp.status_planning_tmp!='traiter'}
                                                <li><a href="#"
                                                       onclick="bconfirm =confirm('Voulez vous enregistrer cette programmation dans votre planning');if(bconfirm)location.replace('modal_disponibilite.php?identifiant_user={$identifiant_user}&actiontranche=actionvalider&idplanningtemp={$objplanningtmp.identitifiant_planning_tmp}&sDatefiltre={$sDatefiltre}')">Appliquer</a>
                                                </li>
                                            {else}
                                                <li><a href="#">Import effectué</a></li>
                                            {/if}
                                            <li><a href="#"
                                                   onclick="bconfirm =location.replace('modal_disponibilite.php?identifiant_user={$identifiant_user}&actiontranche=actiondupliquer&idplanningtemp={$objplanningtmp.identitifiant_planning_tmp}')">Dupliquer</a>
                                            </li>
                                            <li><a href="#"
                                                   onclick="bconfirm =confirm('Voulez vous supprimer cette tranche');if(bconfirm)location.replace('modal_disponibilite.php?identifiant_user={$identifiant_user}&actiontranche=actionsupprimer&idplanningtemp={$objplanningtmp.identitifiant_planning_tmp}')">Supprimer</a>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td>
                                    {$objplanningtmp.datedebut}
                                </td>
                                <td>
                                    {$objplanningtmp.datefin}
                                </td>
                                <td>
                                    {$objplanningtmp.tranchehoraire}
                                </td>
                                <td>
                                    {$objplanningtmp.lesjour}
                                </td>
                                <td>
                                    {$objplanningtmp.lesmotifs}
                                </td>
                                <td>
                                    {$objplanningtmp.infosupp}
                                </td>
                            </tr>
                        {/foreach}

                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

