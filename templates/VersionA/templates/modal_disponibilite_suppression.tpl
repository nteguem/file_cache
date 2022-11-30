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
    <link href="../css/bootstrap.min.{$boostrapL}.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.{$awesomeL}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../css/font-entypo.{$entypoL}.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.{$fontL}.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.{$customL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.{$prettyphotoL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.{$isoctopeL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.{$pnotifyL}.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.{$prettifyL}.css" rel="stylesheet" type="text/css">


    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$customcrollbarrL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.{$tagsinputL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.{$boostrapLL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.{$daterangepickerL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$timepickerL}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.{$colorpickerL}.css" rel="stylesheet" type="text/css">


    <!-- Theme CSS -->
    <link href="../css/theme.min.{$themeL}.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="../css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="../css/chrome.{$chromeL}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="../css/theme-responsive.min.{$responsiveL}.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="../custom/custom.{$customL}.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php $jQuery_6 filemtime(PATH_ASSETS.'../js/jquery.js') ?>
    <script type="text/javascript" src="../js/jquery.<?php echo $jQuery_6 ?>.js"></script>

    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->

    <?php $bootstrapMin_6 filemtime(PATH_ASSETS.'../js/bootstrap.min.js') ?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrapMin_6 ?>.js"></script>
    <?php $jQcustomMin_6 filemtime(PATH_ASSETS.'../plugins/jquery-ui/jquery-ui.custom.min.js') ?>
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jQcustomMin_6 ?>.js'></script>
    <?php $punchMin_06 filemtime(PATH_ASSETS.'../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMin_06 ?>.js"></script>

    <?php $caroufred_06 filemtime(PATH_ASSETS.'../js/caroufredsel.js') ?>
    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufred_06 ?>.js"></script>
    <?php $plugins_06 filemtime(PATH_ASSETS.'../js/plugins.js') ?>
    <script type="text/javascript" src="../js/plugins.<?php echo $plugins_06 ?>.js"></script>

    <?php $pluginsBreakpointsBreakpoints_6 filemtime(PATH_ASSETS.'../plugins/breakpoints/breakpoints.js') ?>
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $pluginsBreakpointsBreakpoints_6 ?>.js"></script>
    <?php $jqueryDataTablesMin_6 filemtime(PATH_ASSETS.'../plugins/dataTables/jquery.dataTables.min.js') ?>
    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesMin_6 ?>.js"></script>
    <?php $pluginJqueryPrettyPhoto_6 filemtime(PATH_ASSETS.'../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginJqueryPrettyPhoto_6 ?>.js"></script>

    <?php $ContctMin_06 filemtime(PATH_ASSETS.'../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $ContctMin_06 ?>.js"></script>
    <?php $tagsInput_06 filemtime(PATH_ASSETS.'../plugins/tagsInput/jquery.tagsinput.min.js') ?>
    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInput_06 ?>.js"></script>
    <?php $bootstrapSwitchMin_6 filemtime(PATH_ASSETS.'../plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin_6 ?>.js"></script>
    <?php $blockUI_06 filemtime(PATH_ASSETS.'../plugins/blockUI/jquery.blockUI.js') ?>
    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUI_06 ?>.js"></script>
    <?php $pNotify_06 filemtime(PATH_ASSETS.'../plugins/pnotify/js/jquery.pnotify.min.js') ?>
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pNotify_06 ?>.js"></script>

    <?php $theme_06 filemtime(PATH_ASSETS.'../js/theme.js') ?>
    <script type="text/javascript" src="../js/theme.<?php echo $theme_06 ?>.js"></script>
    <?php $custom_06 filemtime(PATH_ASSETS.'../custom/custom.js') ?>
    <script type="text/javascript" src="../custom/custom.<?php echo $custom_06 ?>.js"></script>


    <!-- Specific Page Scripts Put Here -->
    
    <?php $min_06 filemtime(PATH_ASSETS.'../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $min_07 ?>.js'></script>

    <?php $pickdate_06 filemtime(PATH_ASSETS.'../js/datepicker-fr.js') ?>
    <script type="text/javascript" src="../js/datepicker-fr.<?php $pickdate_06 ?>.js"></script>
    <!-- Head SCRIPTS -->
    <?php $modernzr_06 filemtime(PATH_ASSETS.'../js/modernizr.js') ?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernzr_06 ?>.js"></script>
    <?php $mobileDetectMin_06 filemtime(PATH_ASSETS.'../js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetectMin_06 ?>.js"></script>
    <?php $mobileDetectModernizr_6 filemtime(PATH_ASSETS.'../js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr_6 ?>.js"></script>
    <?php $jqueryMaskedinputMin_6 filemtime(PATH_ASSETS.'../js/jquery.maskedinput.min.js') ?>
    <script type="text/javascript" src="../js/jquery.maskedinput.min.<?php echo $jqueryMaskedinputMin_6 ?>.js"></script>

    <?php $pluginsCkeditorCkeditor_6 filemtime(PATH_ASSETS.'../plugins/ckeditor/ckeditor.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/ckeditor.<?php echo $pluginsCkeditorCkeditor_6 ?>.js'></script>
    <?php $ckeditorAdaptersJquery_6 filemtime(PATH_ASSETS.'../plugins/ckeditor/adapters/jquery.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/adapters/jquery.<?php echo $ckeditorAdaptersJquery_6 ?>.js'></script>

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

            .ui-datepicker {
                background: #5D9AD4;
            }

            .ui-datepicker a {
                color: #fff;
            }

            select {

                height: 39px;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {

                $("#datedebut").mask("99/99/9999");
                $("#datefin").mask("99/99/9999");


                $("#add-dispo-form").submit(function () {

                    if (!CheckDate($("#datedebut").val(), "Date de début"), 0) {
                        return false;
                    }

                    if (!CheckDate($("#datefin").val(), "Date de fin"), 0) {
                        return false;
                    }

                    if (!confirm('Voulez vous vraiment supprimer les disponibilités du ' + $("#datedebut").val() + ' au ' + $("#datefin").val() + ' inclus ?')) {
                        return false;
                    }

                });

            });


        </script>
    {/literal}


</head>

<body id="forms"
      class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix"
      data-active="forms " data-smooth-scrolling="1">
{if $bsucess}
{literal}
    <script type="text/javascript">
        parent.close_modal_principal_petit();
        parent.refresh_calendar();
    </script>
{/literal}
{/if}

<div id="myModal" style='display:block;'>
    <div class="modal-dialog" style="margin-top:0px;margin-bottom:0px;">
        <div>
            <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
                <form class="form-horizontal" id="add-dispo-form" name="add-dispo-form">
                    <div class="vd_content-section clearfix" style="padding:0px;">
                        <div class="row" style="margin-bottom:0px;">
                            <div class="col-md-full">
                                <div class="panel widget" style="margin-bottom:350px">
                                    <h2 align="center">Suppression des tranches sur une période</h2>
                                    <div class="panel-body">

                                        <input type="hidden" name="dir" id="dir" value="{$dir}"/>
                                        <input type="hidden" name="validation" id="validation" value="ok"/>
                                        <input type="hidden" name="id_user" id="id_user" value="{$id_user}"/>
                                        <input type="hidden" name="idc" id='idc' value=""/>

                                        {if $berror}
                                            <div class="alert alert-danger">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true"><i class="icon-cross"></i></button>
                                                <span class="vd_alert-icon"><i
                                                            class="fa fa-exclamation-circle vd_red"></i></span>
                                                {$sMessageError}
                                            </div>
                                        {/if}

                                        {if $bwarning}
                                            <div class="alert alert-warning">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true"><i class="icon-cross"></i></button>
                                                <span class="vd_alert-icon"><i
                                                            class="fa fa-exclamation-circle vd_red"></i></span>
                                                {$sMessageWarning}
                                            </div>
                                        {/if}


                                        <div class="form-group">
                                            <div class="col-sm-6 controls">
                                                <div id="divdatedebut">
                                                    <label>Date de début (inclus)</label>
                                                    <div class="input-group">
                                                        <input type="text" value="{$datedebut}" name="datedebut"
                                                               id="datedebut" required
                                                               class="required input-modal-date-left">
                                                        <span class="input-group-addon input-modal-date-right"
                                                              id="datepicker-icon-trigger" data-datepicker="#datedebut">
                              <i class="fa fa-calendar"></i>
                            </span>
                                                    </div>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#datedebut").datepicker({
                                                                    dateFormat: 'dd/mm/yy',
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    onSelect: function(selectedDate) {
                                                                        $("#datefin").val(selectedDate);
                                                                    }
                                                                });
                                                                $('[data-datepicker]').click(function (e) {
                                                                    var data = $(this).data('datepicker');
                                                                    $(data).focus();
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}
                                                </div>
                                            </div>
                                            <div class="col-sm-6 controls">
                                                <div id="divdatefin">
                                                    <label>Date de fin (inclus)</label>
                                                    <div class="input-group">
                                                        <input type="text" value="{$datefin}" name="datefin"
                                                               id="datefin" required
                                                               class="required input-modal-date-left">
                                                        <span class="input-group-addon input-modal-date-right"
                                                              id="datepicker-icon-trigger" data-datepicker="#datefin">
                              <i class="fa fa-calendar"></i>
                            </span>
                                                    </div>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#datefin").datepicker({
                                                                    dateFormat: 'dd/mm/yy',
                                                                    changeMonth: true,
                                                                    changeYear: true
                                                                });
                                                                $('[data-datepicker]').click(function (e) {
                                                                    var data = $(this).data('datepicker');
                                                                    $(data).focus();
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 controls" id="divperiode" align="center">
                                            <button id="btn_add" name="btn_add" type="submit"
                                                    class="btn vd_btn vd_bg-green">Valider
                                            </button>&nbsp;&nbsp;
                                            <button type="button" class="btn vd_btn vd_bg-grey"
                                                    onclick="parent.close_modal_principal_petit();">Annuler
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>