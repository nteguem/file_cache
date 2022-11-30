<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html><!--<![endif]-->

    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>ALAXIONE</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="Alaxione">

        <!-- Set the viewport width to device width for mobile initial-scale=1.0-->
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta http-equiv="Cache" content="no-cache">

        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="img/ico/favicon.png">

        <!-- CSS -->
        <link href="css/bootstrap.min.{$cssBootstrap106}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/font-awesome.min.{$cssFontAwesome609}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <!--[if IE 7]><link href="css/font-awesome-ie7.min.{$cssFontAwesome967}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css"><![endif]-->
        <link href="css/font-entypo.{$fontEntypo011}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/font-icomoon.{$cssIcomoon126}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/fonts.{$cssFonts275}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/datepicker.{$cssDatapicker656}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/jquery-ui/jquery-ui.custom.min.{$pluginsJquery906}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.{$pluginsPrettyPhoto367}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/isotope/css/isotope.{$pluginsIsotope275}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/pnotify/css/jquery.pnotify.{$pluginsPnotify198}.css?v={$numero_version_alaxione}" media="screen" rel="stylesheet" type="text/css">
        <link href="plugins/google-code-prettify/prettify.{$pluginsPrettify197}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$pluginsMScroolbar984}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/tagsInput/jquery.tagsinput.{$pluginsTagsInput098}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/bootstrap-switch/bootstrap-switch.{$pluginsBootstrap364}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/daterangepicker/daterangepicker-bs3.{$pluginsDaterangePicker266}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$pluginsBootsatrap343}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/colorpicker/css/colorpicker.{$pluginsColor543}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/dataTables/css/jquery.dataTables.min.{$pluginsDataTables075}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/dataTables/css/dataTables.bootstrap.{$pluginsDataTables326}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/jquery-file-upload/css/jquery.fileupload.{$pluginsJquery076}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/jquery-file-upload/css/jquery.fileupload-ui.{$pluginsJqueryFile478}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.{$pluginsBootstrap894}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href='plugins/fullcalendar-3.5.0/fullcalendar.min.{$pluginsFullCalendar753}.css?v={$numero_version_alaxione}' rel='stylesheet' />
        <link href='plugins/fullcalendar-3.5.0/fullcalendar.print.min.{$pluginsFullCalendar093}.css?v={$numero_version_alaxione}' rel='stylesheet' media='print' />
        <link href='plugins/fullcalendar-3.5.0/scheduler.min.{$pluginsFullCalendar824}.css?v={$numero_version_alaxione}' rel='stylesheet' />
        <link href="css/theme.{$cssTheme845}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <!--[if IE]> <link href="css/ie.{$cssIe289}.css?v={$numero_version_alaxione}" rel="stylesheet" > <![endif]-->
        <link href="css/chrome.{$cssChrome935}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->
        <link href="css/theme-responsive.min.{$cssThemeResponsive275}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/jquery-ui.structure.min.{$cssJquery907}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/jquery-ui.theme.min.{$cssJqueryUi212}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/bootstrap-clockpicker.min.{$cssBootstrap989}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="css/jquery-clockpicker.min.{$cssJquery674}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/intlTelInput.{$cssIntelInput300}.css?v={$numero_version_alaxione}">
        <link href="custom/custom.{$custom255}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css">
        <link href="custom/custom.print.{$customPrint476}.css?v={$numero_version_alaxione}" rel="stylesheet" type="text/css"  media='print'>
        <link rel="stylesheet" href="css/header_responsive.{$cssHeader977}.css" type="text/css">

        {literal}
            <!-- JS -->

            <?php $modernizr = filemtime(PATH_ASSETS.'js/modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $mobileDetectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <!--[if lt IE 9]>
              <script type="text/javascript" src="js/html5shiv.js?v={/literal}{$numero_version_alaxione}{literal}"></script>
              <script type="text/javascript" src="js/respond.min.js?v={/literal}{$numero_version_alaxione}{literal}"></script>
            <![endif]-->

            <?php $jQuerryMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-3.5.0/lib/jquery.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/fullcalendar-3.5.0/lib/jquery.min.<?php echo $jQuerryMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>


            <!--[if lt IE 9]><script type="text/javascript" src="js/excanvas.js?v={/literal}{$numero_version_alaxione}{literal}"></script><![endif]-->

            <?php $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryUICustomMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jQuerryUICustomMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $jQuerryUITouchPunchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jQuerryUITouchPunchMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $caroufredsel = filemtime(PATH_ASSETS.'js/caroufredsel.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $plugins = filemtime(PATH_ASSETS.'js/plugins.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/plugins.<?php echo $plugins ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $framwork_js = filemtime(PATH_ASSETS.'js/framwork_js.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/framwork_js.<?php echo $framwork_js ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryAutoCompleteMin = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $jQuerryAutoCompleteMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $breakpoints = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoints ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jQuerryDataTablesMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $jQuerryPrettyPhoto ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerrymCustomScrollBarConcatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $jQuerrymCustomScrollBarConcatMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryTargsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jQuerryTargsInputMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryBlockUI = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $jQuerryBlockUI ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $datepicker = filemtime(PATH_ASSETS.'js/datepicker.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/datepicker.<?php echo $datepicker ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $datepickerFr = filemtime(PATH_ASSETS.'js/datepicker-fr.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepickerFr ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $theme = filemtime(PATH_ASSETS.'js/theme.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/theme.<?php echo $theme ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $custom = filemtime(PATH_ASSETS.'custom/custom.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="custom/custom.<?php echo $custom ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryBootstrapWizardMin = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $jQuerryBootstrapWizardMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $jQuerryDataTablesMin2 = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jQuerryDataTablesMin2 ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $dataTablebootstrap = filemtime(PATH_ASSETS.'plugins/dataTables/dataTables.bootstrap.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/dataTables/dataTables.bootstrap.<?php echo $dataTablebootstrap ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $bootstrapTimePickerMin = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $bootstrapTimePickerMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $momentMin = filemtime(PATH_ASSETS.'js/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='js/moment.min.<?php echo $momentMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $daterangepicker = filemtime(PATH_ASSETS.'js/daterangepicker.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='js/daterangepicker.<?php echo $daterangepicker ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $colorpicker = filemtime(PATH_ASSETS.'plugins/colorpicker/colorpicker.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/colorpicker/colorpicker.<?php echo $colorpicker ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $loadImagMin = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/load-image.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/load-image.min.<?php echo $loadImagMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryIframeTransport = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.iframe-transport.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.iframe-transport.<?php echo $jQuerryIframeTransport ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryFileUpload = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload.<?php echo $jQuerryFileUpload ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryFileUploadProcess = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-process.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-process.<?php echo $jQuerryFileUploadProcess ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryFileUploadImage = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-image.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-image.<?php echo $jQuerryFileUploadImage ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryFileUploadAudio = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-audio.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-audio.<?php echo $jQuerryFileUploadAudio ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryFileUploadValidate = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-validate.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-validate.<?php echo $jQuerryFileUploadValidate ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryUiMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-3.5.0/lib/jquery-ui.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/fullcalendar-3.5.0/lib/jquery-ui.min.<?php echo $jQuerryUiMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $momentMin2 = filemtime(PATH_ASSETS.'plugins/fullcalendar-3.5.0/lib/moment.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/fullcalendar-3.5.0/lib/moment.min.<?php echo $momentMin2 ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $fullCalendarMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-3.5.0/fullcalendar.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/fullcalendar-3.5.0/fullcalendar.min.<?php echo $fullCalendarMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $fr = filemtime(PATH_ASSETS.'plugins/fullcalendar-3.5.0/locale/fr.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/fullcalendar-3.5.0/locale/fr.<?php echo $fr ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $schedulerMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-3.5.0/scheduler.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/fullcalendar-3.5.0/scheduler.min.<?php echo $schedulerMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $ckeditor = filemtime(PATH_ASSETS.'plugins/ckeditor/ckeditor.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/ckeditor/ckeditor.<?php echo $ckeditor ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $jQuerry2 = filemtime(PATH_ASSETS.'plugins/ckeditor/adapters/jquery.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src='plugins/ckeditor/adapters/jquery.<?php echo $jQuerry2 ?>.js?v={/literal}{$numero_version_alaxione}{literal}'></script>

            <?php $jQuerryMaskedInputMin = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $jQuerryMaskedInputMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $maskchamps = filemtime(PATH_ASSETS.'js/maskchamps.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/maskchamps.<?php echo $maskchamps ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $bootstrapClockPickerMin = filemtime(PATH_ASSETS.'js/bootstrap-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/bootstrap-clockpicker.min.<?php echo $bootstrapClockPickerMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryClockPickerMin = filemtime(PATH_ASSETS.'js/jquery-clockpicker.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/jquery-clockpicker.min.<?php echo $jQuerryClockPickerMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $isotopKgd = filemtime(PATH_ASSETS.'js/isotope.pkgd.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/isotope.pkgd.min.<?php echo $isotopKgd ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $inputMask = filemtime(PATH_ASSETS.'js/inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/inputmask.<?php echo $inputMask ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $jQuerryInputMask = filemtime(PATH_ASSETS.'js/jquery.inputmask.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/jquery.inputmask.<?php echo $jQuerryInputMask ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $intlTelInputMin = filemtime(PATH_ASSETS.'js/intlTelInput.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/intlTelInput.min.<?php echo $intlTelInputMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $principal = filemtime(PATH_ASSETS.'js/principal.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/principal.<?php echo $principal ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $functionRdvExist = filemtime(PATH_ASSETS.'js/function_rdv_exist.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/function_rdv_exist.<?php echo $functionRdvExist ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $mdp = filemtime(PATH_ASSETS.'js/mdp.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/mdp.<?php echo $mdp ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>

            <?php $functionAdv = filemtime(PATH_ASSETS.'js/fonction_adv.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
            <script type="text/javascript" src="js/fonction_adv.<?php echo $functionAdv ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>


            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>




            <script type="text/javascript">
                const id_lieu = {/literal}{$id_lieux}{literal}

                // SSE agenda
                //var source = new EventSource('ajax/data.php?idc={/literal}{$idc}{literal}&idu={/literal}{$ident_user}{literal}&idfiltreagenda={/literal}{$idfiltreagenda}{literal}');
                //source.addEventListener("message", function(e) {
                function refreshWindows(data) {
                    var data = JSON.parse(data);
                    //console.log(data);
                    //alert(data.type+" "+data.status);
                    if (data.type == 'updateDateSSE') {
                        document.cookie = "AlaxioneDateSSE=" + data.nouvelledate + "; SameSite=None; Secureq";
                    }
                    //console.log("dataType " + data.type);
                    if ((data.type == 'rdv')) {//&& ($('#dir').val()=="rechdispo")

                        /*if ($('#tabactive').val() == data.idpraticien) {*/
                        if (data.id_action == 'absenceexcusee' || data.id_action == 'absencenonexcusee') {
                            data.nomdupatient = "<s>" + data.nomdupatient + "</s>";
                        }

                        if (data.status == "A") {
                            event = $('#calendar_' + data.idpraticien).fullCalendar('clientEvents', data.id);
                            if (event.length == 0) {
                                $('#calendar_' + data.idpraticien).fullCalendar('renderEvent', data);
                                $('#calendar_' + data.idpraticien).fullCalendar('rerenderEvents');
                            }

                        } else if (data.status == "M") {
                            event = $('#calendar_' + data.idpraticien).fullCalendar('clientEvents', data.id);

                            if (data.className == "stripe-salle-attente") {
                                if ($('#option_son_salle_attente').val() == "Y") {
                                    var snd = new Audio("son_mp3/son_ding_dong.mp3");
                                    snd.play();
                                }

                            }

                            if (event.length == 0) {
                                $('#calendar_' + data.idpraticien).fullCalendar('renderEvent', data);
                                $('#calendar_' + data.idpraticien).fullCalendar('rerenderEvents');
                            } else {
                                event = event[0];
                                event.title = data.title;
                                event.start = data.start;
                                event.end = data.end;
                                event.color = data.color;
                                event.couleurrdv = data.couleurrdv;
                                event.idrdv = data.idrdv;
                                event.nomdocteur = data.nomdocteur;
                                event.heureaffiche = data.heureaffiche;
                                event.dispo = data.dispo;
                                event.idrdvaff = data.idrdvaff;
                                event.idlieu = data.idlieu;
                                event.action = data.action;
                                event.idcalendar = data.idcalendar;
                                event.className = data.className;
                                event.tempsrdv = data.tempsrdv;
                                event.picto = data.picto;
                                event.commentairerdv = data.commentairerdv;
                                event.nomrdv = data.nomrdv;
                                event.identifiant_rdv = data.identifiant_rdv;

                                //$('#calendar_' + data.idpraticien).css('display', 'none');
                                $('#calendar_' + data.idpraticien).fullCalendar('updateEvent', event);
                                //$('#calendar_' + data.idpraticien).fullCalendar( 'rerenderEvents' );
                                //$('#calendar_' + data.idpraticien).fullCalendar( 'refetchEvents' );
                                getSalleAttente();
                                //$('#calendar_' + data.idpraticien).css('display', 'block');
                            }
                        } else if (data.status == "S") {
                            $('#calendar_' + data.idpraticien).fullCalendar('removeEvents', data.id);
                        }
                        $('#calendar_' + data.idpraticien).fullCalendar('rerenderEvents');
                        $('#calendar_' + data.idpraticien).fullCalendar('refetchEvents');
                        //tous les praticiens
                        /*}else if($('#tabactive').val() === "all"){
                         //console.log("Tous les praticiens");
                         
                         
                         if(data.id_action == 'absenceexcusee' || data.id_action == 'absencenonexcusee'){
                         data.nomdupatient =	"<s>"+data.nomdupatient+"</s>";
                         }
                         data.dispo = "";
                         if (data.status == "A") {
                         //console.log('refresh all 1');
                         event = $('#calendar_all').fullCalendar('clientEvents', data.id);
                         if(event.length == 0){
                         
                         //console.log(data);
                         $('#calendar_all').fullCalendar( 'renderEvent', data);
                         $('#calendar_all').fullCalendar('rerenderEvents');
                         }
                         
                         } else if (data.status == "M") {
                         //event = $('#calendar_all').fullCalendar('clientEvents', data.id);
                         if(event.length == 0) {
                         //console.log('refresh all 2');
                         $('#calendar_all').fullCalendar('renderEvent', data);
                         $('#calendar_all').fullCalendar('rerenderEvents');
                         }else {
                         //console.log('refresh all 3');
                         
                         event = event[0];
                         event.title = data.title;
                         event.start = data.start;
                         event.end = data.end;
                         event.color = data.color;
                         event.couleurrdv = data.couleurrdv;
                         event.idrdv = data.idrdv;
                         event.nomdocteur = data.nomdocteur;
                         event.heureaffiche = data.heureaffiche;
                         event.dispo = data.dispo;
                         event.idrdvaff = data.idrdvaff;
                         event.idlieu = data.idlieu;
                         event.action = data.action;
                         event.idcalendar = data.idcalendar;
                         event.className = data.className;
                         event.tempsrdv = data.tempsrdv;
                         event.picto = data.picto;
                         event.commentairerdv = data.commentairerdv;
                         event.nomrdv = data.nomrdv;
                         event.identifiant_rdv = data.identifiant_rdv;
                         
                         $('#calendar_all').fullCalendar('updateEvent', event);
                         
                         getSalleAttente();
                         }
                         } else if (data.status == "S") {
                         $('#calendar_all').fullCalendar('removeEvents', data.id);
                         }
                         }*/
                    } else if ((data.type == 'salleattente') && (($('#dir').val() == "rechdispo") || ($('#dir').val() == "framevideo"))) {
                        getSalleAttente();
                    } else if ((data.type == 'messagerie')) {

                        document.cookie = "AlaxioneDateSSEMessagerie=" + data.nouvelledate + "; SameSite=None; Secure";

                        getNbMessageInterne();
                        getMessageInterne();
                        //getNbRDVSynchroError();
                        getNbSmsRetour();

                        if ($('#dir').val() == "gestdiscuprat") {
                            if ($('#action').val() != 'form') {
                                location.reload();
                            }
                        }
                    }


                }
                ;



                setInterval(function () {
                    var myCookie = getCookie("cookie_alaxione");

                    if (myCookie == null) {
                        alert("Votre session a expiré, vous devez vous identifier à nouveau!");
                        document.location.href = "index.php?centre={/literal}{$id_entite}{literal}";
                    }
                }, 1000);

                $(document).ready(function () {
                    "use strict";

                    if ({/literal}{$valeur_cgu}{literal} == '0') {
                        $('#myModalcgumedecin').modal('show');
                    }
                    date_heure('date_heure');

            {/literal}{$Listefonctiononload}{literal}

                    $('#data-tables').dataTable({
                        searching: false,
                        displayLength: 100,
                        language: {
                            lengthMenu: "Afficher _MENU_  par page",
                            processing: "Traitement en cours...",
                            search: "Rechercher&nbsp;:",
                            info: "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                            infoPostFix: "",
                            loadingRecords: "Chargement en cours...",
                            zeroRecords: "Aucun rendez-vous &agrave; afficher",
                            emptyTable: "Aucune donnée disponible",
                            paginate: {
                                first: "Premier",
                                previous: "Pr&eacute;c&eacute;dent",
                                next: "Suivant",
                                last: "Dernier"
                            },
                            aria: {
                                sortAscending: ": activer pour trier la colonne par ordre croissant",
                                sortDescending: ": activer pour trier la colonne par ordre décroissant"
                            }
                        }
                    });

                    getNbMessageInterne();
                    getMessageInterne();
                    //getNbRDVSynchroError();
                    getNbSmsRetour();

                    var curdate = new Date();
                    curdate = curdate.getDate() + "/" + (curdate.getMonth() + 1) + "/" + curdate.getFullYear();

                    $('#datemenupicker').DatePicker({
                        flat: true,
                        date: curdate,
                        current: curdate,
                        format: 'd/m/Y',
                        calendars: 1,
                        mode: 'single',
                        starts: 1,
                        onChange: function (formated, dates) {
                            //alert(formated);
                            if ($('#iddateplanning').val() != formated || $('#iddateplanningrdv').val() != formated) {
                                $('#iddateplanning').val(formated);
                                $('#iddateplanningrdv').val(formated);
                                setTimeout(function () {
                                    if ($('#dir').val() == 'rechdispo') {
                                        rafraichir_calendrier('selectlieux', 'selectpraticien', 'selecttyperdv', '', 'iddateplanning', '0', '0');
                                        rafraichir_calendrier_all(formated);
                                    }
                                    if ($('#dir').val() == 'rechdispointerpro') {
                                        rafraichir_calendrier_interpro('iddateplanningrdv', '0');
                                    }

                                    if ($('#dir').val() == 'gestiondiposv2') {
                                        rafraichir_calendrier_disponibilite(formated);
                                    }

                                    if ($('#dir').val() == 'progremplacant') {
                                        rafraichir_calendrier_remplacant(formated);
                                    }

                                    if ($('#dir').val() == 'gestconge') {
                                        rafraichir_calendrier_conge(formated);
                                    }
                                    $('#div_affiche_mini_calendar').css("display", "none");
                                }, 0);
                            }
                        }
                    });
                    //$('#datemenupicker').DatePickerHide();
                    //fermeture de la modal
                    $('#myModalinfordv').on('hidden.bs.modal', function (e) {
                        unloadiframe();
                    });
                    $('#div_affiche_mini_calendar').css("display", "none");


                });


                $(document).mouseup(function (e)
                {
                    var container = $("#datemenupicker");
                    // if the target of the click isn't the container nor a descendant of the container
                    if (!container.is(e.target) && container.has(e.target).length === 0)
                    {
                        $('#div_affiche_mini_calendar').css("display", "none");
                    }
                });
                function affiche_mini_calendar() {
                    if ($('#div_affiche_mini_calendar').css("display") === "none") {
                        $('#div_affiche_mini_calendar').css("display", "inline-table");
                    } else {
                        $('#div_affiche_mini_calendar').css("display", "none");
                    }

                }

                function chargementIframehome(obj) {
                    //alert("test");
                    resizeIframe(obj);
                    document.getElementById('div_attente_chargement_home').style.display = "none";
                    $("#iframerhome").show();
                }

            </script>
            <script >
                $(document).ready(function () {
                    $("input[type='text']").each(function (index, element) {
                        $(this).attr("autocomplete", "new-password");
                        //$(this).val(" ");
                    });
                });


                $(function () {
                    var server = "";
                    if({/literal}{isset($iWebsocketPort)}{literal} && "{/literal}{$iWebsocketPort}{literal}" != ""){
                        server = "{/literal}{$sServeurWebSocket}{literal}:{/literal}{$iWebsocketPort}{literal}";
                    } else {
                        server = "{/literal}{$sServeurWebSocket}{literal}";
                    }
                    var socket = io(server + "/{/literal}{$idc}{literal}",{secure: false, rejectUnauthorized: false,transports:['websocket'], upgrade:false});
                    // quand on recoit un refresh on lance le refresh
                    socket.on('refresh', (data) => {
                        //console.log(data);//
                        refreshWindows(data.message.Valeur1);
                        //updateNbRDV();
                    });

                    // quand on recoit un message on l'affiche
                    socket.on('message', (data) => {
                        //console.log("message")
                        getNbMessageInterne();
                        getMessageInterne();
                        getNbSmsRetour();
                    });

                    // quand on recoit un message on l'affiche
                    socket.on('salleattente', (data) => {
                        //console.log('salleattente');
                        refreshWindows(data.message.Valeur1);
                    });

                    socket.on('planning', (data) => {
                        $('#calendar_1').fullCalendar('refetchEvents');
                    });

                });

            </script>


        {/literal}

        <style type="text/css">

            .popover {
                z-index: 215000000 !important;
            }

            .mauvais{
                color:#cc0000;
            }

            ::placeholder {
                color: #3E91D5;
            }

            .ui-datepicker {
                background: #5D9AD4;
                /* position: initial !important;*/
            }

        </style>

        <style>
            /* Tooltip container */
            .tooltip_alax {
                position: relative;
                display: inline-block;

            }

            /* Tooltip text */
            .tooltip_alax .tooltiptext_alax {
                visibility: hidden;
                width: 180px;
                background-color: #134058;
                color: #fff;
                text-align: LEFT;
                border-radius: 6px;
                padding: 5px 5px;

                /* Position the tooltip */
                position: absolute;
                z-index: 1;
                top: -5px;
                left: 105%;
            }

            /* Show the tooltip text when you mouse over the tooltip container */
            .tooltip_alax:hover .tooltiptext_alax {
                visibility: visible;

            }
            .tooltip_alax:hover .icon_info_alax{
                color: #134058;
            }
        </style>
        <!-- End of Data -->
    </head>

    <body id="tables" class="full-layout {if $idc != '2cdferz'}no-nav-left{/if} nav-right-hide nav-right-start-hide nav-top-fixed responsive clearfix" data-active="tables "  data-smooth-scrolling="1">
        <input type="hidden" value="{$ident_user}" name="ident_user" id="ident_user" />
        <input type="hidden" value="{$idinterpro}" name="idinterpro" id="idinterpro" />
        <input type="hidden" value="{$dir}" name="dir" id="dir" />
        <input type="hidden" value="{$idc}" name="idc" id='idc' />
        <input type="hidden" value="{$action}" name="action" id='action' />
        <input type="hidden" value="{$token_user}" name="token_user" id='token_user' />
        <input type="hidden" value="{$email_user}" name="email_user" id='email_user' />
        <input type="hidden" value="{$indicatif_structure}" name="indicatif_structure" id='indicatif_structure' />
        <input type="hidden" value="{$num_indicatif_structure}" name="num_indicatif_structure" id='num_indicatif_structure' />
        <input type="hidden" value="{$idc}" name="identifiant_entite" id="identifiant_entite">
        <input type="hidden" value="{$iAccess}" name="iAccess" id="iAccess">

        <div class="modal fade" id="myModalcgumedecin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" >
                <div class="modal-content" id="the_cgu">
                    <div class="modal-header vd_bg-blue vd_white">
                        <h4 class="modal-title" id="myModalLabelinfordv">Conditions Générales d'utilisation</h4>
                    </div>
                    <div class="modal-body" align="center">
                        {if $idcivilite==3}
                            <b>OBJET DU GUIDE D’UTILISATION</b><br/>
                            Ce Guide d’utilisation a pour objet de définir les modalités d’utilisation de la plateforme informatique mise en place par le {$lecentre}, aux fins de prise de rendez-vous en ligne par tout médecin, pour le compte de ses patients.
                            <br/><br/>
                            <b>OBJECTIFS DE LA PLATEFORME</b><br/>
                            La plateforme vise à permettre la prise de rendez-vous par tout médecin. Elle a été créée dans le seul intérêt des patients, afin de permettre une prise de rendez-vous dans des délais compatibles avec les nécessités que présente leur état de santé.
                            <br/>
                            Les utilisateurs de la plateforme ne peuvent donc en retirer aucun bénéfice ou intérêt personnel.
                            <br/>
                            L’utilisation de la plateforme est conditionnée au respect du libre choix du patient, principe fondamental de la législation sanitaire (article L. 1110-8 Code de la santé publique).
                            <br/><br/>

                            <b>ACCES ET UTILISATION DE LA PLATEFORME</b><br/>

                            Les utilisateurs peuvent accéder à la plateforme, après avoir procéder à une demande d’attribution d’identifiant de connexion conformément à la procédure figurant sur le site internet du {$lecentre}.
                            <br/>
                            L’attribution d’un identifiant de connexion n’emporte aucune obligation de recourir au {$lecentre}.
                            <br/>
                            L’identifiant permettant l’accès à la plateforme informatique de prise de rendez-vous délivrée par le {$lecentre} est personnel et incessible.
                            <br/><br/>

                            L’utilisateur authentifié accède à un planning prévisionnel du cabinet, laissant apparaître les jours et horaires libres.
                            <br/>
                            Le planning auquel accède l’utilisateur ne mentionne aucune information relative aux patients du {$lecentre}, ou aux motifs de consultations de ceux-ci.
                            <br/>
                            Après avoir librement choisi de recourir au {$lecentre}, le patient choisit un praticien disponible compte tenu de l’organisation du centre ou du praticien que sélectionne l’utilisateur pour son propre compte.
                            <br/>
                            Si l’utilisateur de la plateforme constate qu’aucun médecin du {$lecentre} ne peut recevoir son patient dans le délai qu’il estime nécessaire, il en informe son patient, qui pourra, s’il l’estime utile, solliciter par téléphone le secrétariat du centre ou du médecin.
                            <br/>
                            En cas d’urgence imminente, l’utilisateur de la plateforme renvoie le patient vers le service des urgences d’un établissement de santé.
                            <br/>
                            Avant de valider sa demande de rendez-vous, l’utilisateur renseigne les informations suivantes pour le compte de son patient :
                            <br/>
                            Nom, prénom, date de naissance, coordonnées du patient
                            <br/>
                            Motifs de la consultation
                            <br/>
                            Ces informations seront complétées, le cas échéant, par un courrier du médecin.
                            <br/>
                            Le patient sera invité à se rendre au rendez-vous avec son dossier médical et tous documents utiles.
                            <br/>
                            Après avoir validé sa demande de rendez-vous, le patient est susceptible de recevoir un message de confirmation du rendez-vous par sms et/ou par e-mail.
                            <br/><br/>

                            <b>RESPECT DES DROIT DES PATIENTS</b>
                            <br/>

                            <b>Information et droits concernant l’utilisation des données</b>
                            <br/>
                            Les patients sont informés que des données nominatives les concernant font l’objet d’un enregistrement, pour les besoins de leur suivi médical, afin d’établir un diagnostic, puis administrer des soins et traitements.
                            <br/>
                            L’utilisateur veille à l’information du patient, au besoin en lui fournissant le document d’information disponible sur la plateforme. (cf. annexe) 
                            <br/>
                            Les droits du patient sont assurés :
                            <br/>
                            Le droit d'opposition : Le patient peut faire valoir un droit d’opposition à la communication d’informations le concernant. Ce droit peut néanmoins être restreint dans certains cas, notamment lorsque les traitements informatiques sont opérés pour le compte de l'Etat ou des collectivités territoriales, et sous certaines conditions.
                            <br/>
                            Le droit d'accès direct par l'intéressé.
                            <br/>
                            Le droit de rectification : le titulaire du droit d'accès peut exiger que soient rectifiées, complétées, clarifiées, mises à jour ou effacées, les informations le concernant qui sont inexactes, incomplètes, équivoques, périmées, ou dont la collecte ou l'utilisation, la communication sont interdites.
                            <br/>
                            <b> Libre choix du patient
                                <br/>
                                L’utilisateur de la plateforme s’assure, avant la prise de rendez-vous auprès du {$lecentre}, du libre choix du patient de recourir à un médecin du {$lecentre} pour une consultation en urgence.
                                <br/>
                                Si le patient manifeste une quelconque opposition ou réticence, l’utilisateur devra proposer au patient de l’orienter vers d’autres médecins ophtalmologistes.
                                <br/><br/>
                                <b>Respect du secret médical et du droit à la vie privée</b>
                                <br/>
                                Les données recueillies par la plateforme seront strictement confidentielles, et ne pourront aucunement être divulguées au-delà du périmètre autorisé par la législation et la règlementation.
                                <br/>
                                Le secret médical est partagé par les professionnels de santé appelés à apporter des soins au patient.
                                <br/>
                                Le personnel administratif n’a pas, en principe, à connaître des informations relatives à la santé du patient, mais toute information dont il aurait connaissance demeure en tout état de cause soumise au secret professionnel.
                                <br/>
                                Le {$lecentre} s’engage à prendre toutes les précautions utiles pour protéger les données et leur confidentialité.
                                <br/><br/>
                                <b>RESPECT DE LA CHARTE</b>
                                <br/>
                                Le non-respect de cette Charte est susceptible d’entrainer l’exclusion de la plateforme informatique par {$lecentre}.
                                <br/>
                                Une utilisation de la plateforme non conforme à la présente Charte ne saurait engager la responsabilité de {$lecentre}.
                                <br/><br/>

                                <b>ANNEXE DOCUMENT D’INFORMATION</b>
                                <br/>

                                <b>Informatique et libertés</b>
                                <br/>
                                Le {$lecentre} dispose d’un système informatique destiné à faciliter la gestion des dossiers des patients, le suivi médical, à assurer la facturation des actes et la télétransmission des feuilles de soins aux caisses de sécurité sociale.
                                <br/>
                                Ce système informatique comprend notamment un site internet permettant la prise de rendez-vous en ligne.
                                <br/>
                                Sauf opposition justifiée de votre part, les informations recueillies feront l’objet d’un enregistrement informatique réservé à l’usage de votre professionnel de santé.
                                <br/>
                                Conformément à l’article L. 1111-7 du Code de la santé publique, vous avez libre accès à votre dossier médical.
                                <br/>
                                Votre médecin traitant se tient à votre disposition pour vous communiquer ces renseignements ainsi que toutes informations nécessaires sur votre état de santé.
                                 <br/>
                                Tout médecin désigné par vous peut également prendre connaissance de l’ensemble de votre dossier médical.
                                <br/>
                                Les informations vous concernant pourront faire l’objet de rectifications sur votre demande.
                            {else}
                                <b>OBJET DE LA CHARTE</b><br/>
                                <br/>

                                La présente Charte a pour objet de définir les conditions d’utilisation de la plateforme informatique mise en place par le {$lecentre}, aux fins de prise de rendez-vous en urgence et en ligne par tout professionnel de santé (hors médecins, pour lesquels un guide d’utilisation spécifique de la plateforme informatique est mis en place), pour le compte de ses patients.
                                <br/>
                                Les utilisateurs de la plateforme s’engagent à respecter la présente Charte.
                                <br/><br/>

                                <b>OBJECTIFS DE LA PLATEFORME</b><br/>


                                La plateforme vise à permettre la prise de rendez-vous en urgence par tout professionnel de santé relevant du périmètre ci-dessus visé, estimant que l’état de son patient nécessite une consultation dans de très brefs délais.
                                <br/>
                                Cette plateforme a été créée dans le seul intérêt des patients, afin de permettre une prise de rendez-vous dans des délais compatibles avec les nécessités que présente leur état de santé.
                                <br/>
                                Les utilisateurs de la plateforme ne pourront donc en retirer aucun bénéfice ou intérêt personnel.
                                <br/>
                                L’utilisation de la plateforme est conditionnée au respect du libre choix du patient, principe fondamental de la législation sanitaire (article L. 1110-8 Code de la santé publique).
                                <br/><br/>


                                <b>UTILISATEURS DE LA PLATEFORME</b>
                                <br/>

                                La plateforme informatique de prise de rendez-vous est exclusivement réservée aux professionnels de santé (hors médecins).
                                <br/>
                                Ces professionnels de santé dont l’activité présente un lien avec celle du {$lecentre} peuvent accéder à la plateforme, après avoir procédé à une demande d’attribution d’identifiant de connexion conformément à la procédure préconisée par le {$lecentre}.
                                <br/>
                                L’attribution d’un identifiant de connexion n’emporte aucune obligation de recourir au {$lecentre}.
                                <br/>
                                Il est formellement interdit à toute personne ne présentant pas la qualité de professionnel de santé d’utiliser cette modalité d’accès à la plateforme. Aux fins de vérification que cette condition est bien remplie, le {$lecentre} sollicitera, préalablement à l’attribution de l’identifiant de connexion, une justification en ce sens.
                                <br/><br/>


                                <b>ACCES ET UTILISATION DE LA PLATEFORME</b>
                                <br/>

                                L’identifiant permettant l’accès à la plateforme informatique de prise de rendez-vous délivrée par le {$lecentre} est personnel et incessible.  L’acceptation expresse de la présente Charte par l’utilisateur authentifié est obligatoire pour un premier accès à la plateforme.
                                <br/><br/>


                                <b>FONCTIONNEMENT DE LA PLATEFORME</b>
                                <br/>

                                Prise de rendez-vous
                                <br/>
                                L’utilisateur authentifié accède à un planning prévisionnel du cabinet, laissant apparaître les horaires libres et réservés aux consultations d’urgence.
                                <br/>
                                Le planning auquel accède l’utilisateur ne mentionne aucune information relative aux patients du ou des médecins du centre, aux rendez-vous du ou des médecins ou aux motifs de consultations de ceux-ci.
                                <br/>
                                Après avoir librement choisi de recourir au {$lecentre}, le patient choisit un praticien disponible compte tenu de l’organisation du centre et des contraintes liées à l’urgence, et un horaire de rendez-vous, que sélectionne l’utilisateur pour son propre compte.
                                <br/>
                                Si l’utilisateur de la plateforme constate qu’aucun médecin du {$lecentre} ne peut recevoir son patient dans le délai qu’il estime nécessaire, il en informe son patient, qui pourra, s’il l’estime utile, solliciter par téléphone le secrétariat du centre ou du médecin.
                                <br/>
                                En cas d’urgence imminente, l’utilisateur de la plateforme renvoie le patient vers le service des urgences d’un établissement de santé.
                                <br/><br/>



                                <b>Informations à renseigner</b>
                                <br/>
                                Avant de valider sa demande de rendez-vous, l’utilisateur renseigne les informations suivantes pour le compte de son patient :
                                <br/>
                                Nom, prénom, date de naissance, coordonnées du patient
                                <br/>
                                Il peut indiquer par ailleurs quels sont, selon l’utilisateur et dans la limite de ses compétences, les motifs du rendez-vous sollicité. Il est précisé que l’indication de ces motifs ne lie pas les médecins du {$lecentre}, qui réaliseront en tout état de cause, lors du rendez-vous, leur propre diagnostic au vu des symptômes présentés par le patient.
                                <br/>
                                Le patient sera invité à se rendre au rendez-vous avec son dossier médical et tous documents utiles. Cette information sera transmise à son patient par le professionnel de santé utilisateur.
                                <br/>

                                Confirmation du rendez-vous
                                <br/>
                                Après avoir validé sa demande de rendez-vous, le patient est susceptible de recevoir un message de confirmation du rendez-vous par sms et/ou par e-mail.
                                <br/>

                                Prise en charge du patient
                                <br/>
                                Dans le respect de sa liberté professionnelle, le médecin ophtalmologiste assure la consultation d’urgence correspondant aux indications transmises sur la plateforme du site internet du {$lecentre}.
                                <br/><br/>


                                <b>RESPECT DES DROIT DES PATIENTS</b>
                                <br/>

                                <b>Information et droits concernant l’utilisation des données</b>
                                <br/>
                                Les patients sont informés que des données nominatives les concernant font l’objet d’un enregistrement, pour les besoins de leur suivi médical, afin d’établir un diagnostic, puis administrer des soins et traitements.
                                <br/>
                                L’utilisateur veille à l’information du patient, au besoin en lui fournissant le document d’information disponible sur la plateforme. (cf. annexe) 
                                <br/>
                                Les droits du patient sont assurés :
                                <br/>
                                Le droit d'opposition : Le patient peut faire valoir un droit d’opposition à la communication d’informations le concernant. Ce droit peut néanmoins être restreint dans certains cas, notamment lorsque les traitements informatiques sont opérés pour le compte de l'Etat ou des collectivités territoriales, et sous certaines conditions.
                                <br/>
                                Le droit d'accès direct par l'intéressé.
                                <br/>
                                Le droit de rectification : le titulaire du droit d'accès peut exiger que soient rectifiées, complétées, clarifiées, mises à jour ou effacées, les informations le concernant qui sont inexactes, incomplètes, équivoques, périmées, ou dont la collecte ou l'utilisation, la communication sont interdites.
                                <br/>
                                Libre choix du patient
                                <br/>
                                L’utilisateur de la plateforme s’assure, avant la prise de rendez-vous auprès du {$lecentre}, du libre choix du patient de recourir à un médecin du {$lecentre} pour une consultation en urgence.
                                <br/>
                                Si le patient manifeste une quelconque opposition ou réticence, l’utilisateur devra proposer au patient de l’orienter vers d’autres médecins ophtalmologistes.
                                <br/><br/>

                                <b>Respect du secret médical et du droit à la vie privée</b>
                                <br/>
                                Les données recueillies par la plateforme seront strictement confidentielles, et ne pourront aucunement être divulguées au-delà du périmètre autorisé par la législation et la règlementation.
                                <br/>
                                Le secret médical est partagé par les professionnels de santé appelés à apporter des soins au patient.
                                <br/>
                                Le personnel administratif n’a pas, en principe, à connaître des informations relatives à la santé du patient, mais toute information dont il aurait connaissance demeure en tout état de cause soumise au secret professionnel.
                                <br/>
                                Le {$lecentre} s’engage à prendre toutes les précautions utiles pour protéger les données et leur confidentialité.
                                <br/><br/>

                                <b>RESPECT DE LA CHARTE</b>
                                <br/>
                                Le non-respect de cette Charte est susceptible d’entrainer l’exclusion de la plateforme informatique par {$lecentre}.
                                <br/>
                                Une utilisation de la plateforme non conforme à la présente Charte ne saurait engager la responsabilité de {$lecentre}.
                                <br/><br/>


                                <b>ANNEXE DOCUMENT D’INFORMATION</b>
                                <br/>


                                <b>Informatique et libertés</b>
                                <br/>
                                Le {$lecentre} dispose d’un système informatique destiné à faciliter la gestion des dossiers des patients, le suivi médical, à assurer la facturation des actes et la télétransmission des feuilles de soins aux caisses de sécurité sociale.
                                <br/>
                                Ce système informatique comprend notamment un site internet permettant la prise de rendez-vous en ligne.
                                <br/>
                                Sauf opposition justifiée de votre part, les informations recueillies feront l’objet d’un enregistrement informatique réservé à l’usage de votre professionnel de santé.
                                <br/>
                                Conformément à l’article L. 1111-7 du Code de la santé publique, vous avez libre accès à votre dossier médical.
                                <br/>
                                Votre professionnel de santé traitant se tient à votre disposition pour vous communiquer ces renseignements ainsi que toutes informations nécessaires sur votre état de santé.
                                <br/>
                                Tout médecin désigné par vous peut également prendre connaissance de l’ensemble de votre dossier médical.
                                <br/>
                                Les informations vous concernant pourront faire l’objet de rectifications sur votre demande.

                            {/if}
                            <div id="div_interpro_valider_cgu" class="row" style="margin:0px;margin-bottom:10px;margin-top:15px;padding:0px;">
                                <div class="btn-group" role="group" aria-label="" style="float:left;">
                                    <button id="btn_cgu_imprimer" name="btn_cgu_retour" type="button" class="btn btn_confirm" style="background-color: #01D0CA;" onclick="printDiv('the_cgu');">Imprimer <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></button>
                                </div>
                                <div id="btn_cgu_return" class="btn-group" role="group" aria-label="" style="float:right;"></div>
                                <div class="btn-group" role="group" aria-label="" style="float:right;">
                                    <button id="btn_cgu_retour" name="btn_cgu_retour" type="button" class="btn btn_confirm" style="background-color: #01D0CA;" onclick="accepte_cgu_interpro();"> J'ai lu et j'accepte les Conditions Générales d'Utilisation (CGU) <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalBasculeRDVTeleconsult" tabindex="-1" role="dialog" aria-labelledby="myModalLabelBasculeRDVTeleconsult" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <h4 class="modal-title" id="myModalLabelBasculeRDVTeleconsult">Basculer le RDV en Téléconsultation</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <input type="hidden" id="bascule_rdv_teleconsult_identifiantrdv" name="bascule_rdv_teleconsult_identifiantrdv">
                        <input type="hidden" id="bascule_rdv_teleconsult_status" name="bascule_rdv_teleconsult_status">
                        <div class="col-sm-6 controls">
                            <label class="control-label">Motif :</label>
                            <div class="controls">
                                <select id="bascule_rdv_teleconsult_motif" name="bascule_rdv_teleconsult_motif" disabled></select>
                            </div>
                        </div>

                        <div class="col-sm-6 controls" id="div_bascule_rdv_teleconsult_montant">
                            <div class="label-wrapper-modal" >
                                <label class="control-label">Montant de la téléconsultation :</label>
                            </div>
                            <div class="input-group">
                                <input type="text" id="bascule_rdv_teleconsult_montant" name="bascule_rdv_teleconsult_montant" >
                                <span class="input-group-addon">€</span>
                            </div>
                        </div>
                        <div id="div_btn" class="row" style="margin:0px;margin-bottom:10px;padding:0px;">
                            <div class="col-sm-12" style="text-align: center;margin-top:20px">
                                <button type="button" name="btn_valider_montant_teleconsult" id="btn_valider_montant_teleconsult" class="btn vd_btn vd_bg-green" onclick="valider_montant_teleconsult($('#bascule_rdv_teleconsult_identifiantrdv').val(), $('#bascule_rdv_teleconsult_status').val(), $('#bascule_rdv_teleconsult_montant').val());">Confirmer</button>
                                <button type="button" id="btn_annuler_montant_teleconsult" name="btn_annuler_montant_teleconsult" onclick="$('#myModalBasculeRDVTeleconsult').modal('hide');" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Annuler</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalinfordv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog" style="width: 805px">
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" onClick="unloadiframe()" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="myModalLabelinfordv">&nbsp;</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <div id="div_attente_chargement_modal" align='center' style=" position: absolute;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10002;opacity:0.7;filter: alpha(opacity=70);color:#fff;">
                            <br><br>
                            <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                            <br><br>
                        </div>
                        <iframe style="display:none" id="iframerdv" frameborder="0" width="100%" scrolling="yes" onload="chargementIframe(this)"></iframe>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="myModalHome" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 100%!important;" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content"  style="width: 100%!important">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button"  class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="myModalLabelhome">&nbsp;</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <div id="div_attente_chargement_home" align='center' style=" position: absolute;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10002;opacity:0.7;filter: alpha(opacity=70);color:#fff;">
                            <br><br>
                            <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                            <br><br>
                        </div>
                        <iframe style="display:none" id="iframerhome" frameborder="0" width="100%" scrolling="yes" onload="chargementIframehome(this)"></iframe>

                    </div>
                </div>
            </div>
        </div>

        <div class="vd_body">

            {include file="header.tpl"}

            <div class="content">
                <div class="container">
                    {if $idc == '2cdferz'}
                        <div class="vd_navbar vd_nav-width vd_navbar-tabs-profile vd_navbar-left no-print hidden-xs">
                            <div class="navbar-menu clearfix">

                                <div class="menu-title hide-nav-medium hide-nav-small" style="margin-top: 20px;" align='center' id="datemenupicker"></div>

                                <div class="vd_menu">
                                    <ul>
                                        {section name='sec1' loop=$aTableauMenu}
                                            {if $aTableauMenu[sec1][8]=='Y'}
                                                <li  {if $bActivtraduction=='Yes'}style="padding: 10px 10px 10px 10px;"{/if}>
                                                    <a href="{$aTableauMenu[sec1][1]}" {if $bActivtraduction=='Yes'}style="display:inline"{/if}>
                                                        <span class="menu-icon"><i class="{$aTableauMenu[sec1][7]}"></i></span> 
                                                        <span class="menu-text">{$aTableauMenu[sec1][2]}</span>
                                                        {$aTableauMenu[sec1][9]}
                                                    </a>

                                                    {if $bActivtraduction=='Yes'}
                                                        &nbsp;<a href="#" style="display:inline" onclick="renvoi_info_traduction('{$aTableauMenu[sec1][1]}', '{$aTableauMenu[sec1][1]}', '{$sLangueUser}', '{$aTableauMenu[sec1][2]|replace:'\'':'\\\''}', 'fli_menulist', 'fli_menulist');
                                                                $('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                        {/if}


                                                </li> 
                                            {else}

                                                <li {if $bActivtraduction=='Yes'}style="padding: 10px 10px 10px 10px;"{/if}>
                                                    <a href="javascript:void(0);" data-action="click-trigger"  {if $bActivtraduction=='Yes'}style="display:inline"{/if}>
                                                        <span class="menu-icon"><i class="{$aTableauMenu[sec1][7]}"></i></span> 
                                                        <span class="menu-text">{$aTableauMenu[sec1][2]}</span>
                                                        <span class="menu-badge"><span class="badge vd_bg-black-30"><i class="fa fa-angle-down"></i></span></span>
                                                    </a>
                                                    {if $bActivtraduction=='Yes'}
                                                        &nbsp;<a href="#" style="display:inline" onclick="renvoi_info_traduction('{$aTableauMenu[sec1][1]}', '{$aTableauMenu[sec1][1]}', '{$sLangueUser}', '{$aTableauMenu[sec1][2]|replace:'\'':'\\\''}', 'fli_menulist', 'fli_menulist');
                                                                $('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                        {/if}
                                                        {if !empty($aTableauMenu[sec1][4])}
                                                        <div class="child-menu"  data-action="click-target">
                                                            <ul>
                                                                {foreach from=$aTableauMenu[sec1][4] item=tabM name=sTabM}
                                                                    <li {if $bActivtraduction=='Yes'}style="padding: 10px 10px 10px 10px;"{/if}>
                                                                        <a href="{$tabM[1]}"  {if $bActivtraduction=='Yes'}style="display:inline"{/if}>
                                                                            <span class="menu-text">{$tabM[2]}</span>
                                                                        </a>
                                                                        {if $bActivtraduction=='Yes'}
                                                                            &nbsp;<a href="#"  style="display:inline" onclick="renvoi_info_traduction('{$tabM[1]}', '{$tabM[1]}', '{$sLangueUser}', '{$tabM[2]|replace:'\'':'\\\''}', 'fli_menulist', 'fli_menulist');
                                                                                    $('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                            {/if}
                                                                    </li>
                                                                {/foreach}
                                                            </ul>
                                                        </div>
                                                    {/if}
                                                </li>
                                            {/if}
                                        {/section}
                                    </ul>
                                    <!-- Head menu search form ends -->         
                                </div>
                            </div>
                            <div class="navbar-spacing clearfix"></div>
                            <div class="vd_menu vd_navbar-bottom-widget">
                                <ul>
                                    <li>
                                        <a href="deco.php">
                                            <span class="menu-icon"><i class="fa fa-sign-out"></i></span>          
                                            <span class="menu-text">Déconnexion</span>             
                                        </a>
                                    </li>
                                </ul>
                            </div>     
                        </div>
                    {/if}
                    <div class="vd_navbar vd_nav-width vd_navbar-tabs-profile vd_navbar-left no-print {if $bIsMobile}visible{else}hidden{/if}">
                        {include file="menu_mobile.tpl"}
                    </div>

                    <!-- début salle d'attente -->
                    <div id="divsalleattente" class="vd_navbar vd_nav-width vd_navbar-tabs-menu vd_bg-black-80 vd_navbar-right {if $bIsMobile}hidden{/if}" style="z-index:999;display:none;">
                        <div class="navbar-tabs-menu clearfix" style="height:auto;padding-bottom:15px;">
                            <div class="menu-container">               
                                <div class="navbar-search-wrapper">
                                    <div class="navbar-search vd_bg-black-30">
                                        <span class="append-icon"><i class="fa fa-filter"></i> Trier par:</span>
                                    </div>
                                    <div class="vd_input-wrapper-modal">
                                        <select name="trie_salle_attente" id="trie_salle_attente" style="height:32px;">
                                            <option value="1">Heure d'arrivée</option>
                                            <option value="2">Heure de passage</option>
                                        </select>
                                    </div>
                                </div>  
                            </div>
                        </div>
                        <div class="navbar-menu clearfix">
                            <div class="content-list content-image content-chat">
                                <ul class="list-wrapper no-bd-btm pd-lr-10" id="tab_salle_attente">

                                </ul>
                            </div>
                        </div>
                        <div class="navbar-spacing clearfix"></div>
                    </div>
                    <!-- fin salle d'attente -->

                    <!-- Middle Content Start -->
                    <div class="vd_content-wrapper" style="background-color:white;">
                        <div class="vd_container">
                            <div class="vd_content clearfix">

                                <!--ici include tpl -->
                                {if isset($pagedirection)}
                                    {if $pagedirection|is_array}
                                        {foreach from=$pagedirection item=tpl}
                                            {include file="$tpl"}
                                        {/foreach}
                                    {else}
                                        {include file="$pagedirection"}
                                    {/if}
                                {/if}

                                <!--fin include tpl-->
                                <!-- .vd_content-section --> 
                            </div>
                            <!-- .vd_content --> 
                        </div>
                        <!-- .vd_container --> 
                    </div>
                    <!-- .vd_content-wrapper --> 
                    <!-- Middle Content End --> 
                </div>
                <!-- .container --> 
            </div>
            <!-- .content -->

            <!-- Footer Start -->
            <footer class="footer-1 no-print"  id="footer">
                <div class="vd_bottom ">
                    <div class="container">
                        <div class="row">
                            <div class=" col-xs-12">
                                <div class="copyright">Copyright &copy;<script>document.write(new Date().getFullYear())</script> Alaxione.fr - Tous droits réservés</div>
                            </div>
                        </div><!-- row -->
                    </div><!-- container -->
                </div>
            </footer>
            <!-- Footer END -->
        </div>

        <!-- .vd_body END  -->
        <a id="back-top" href="#" data-action="backtop" class="vd_back-top visible no-print {if $bIsMobile}hidden{/if}"> <i class="fa  fa-angle-up"> </i> </a>


        <!--
        <a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->



        {include file="modal_fiche_patient.tpl"}


        <div id='myfiltre_prendre_rendez_vous' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:1050;opacity:0.7;filter: alpha(opacity=70);'></div>

        <div id='alert_message_avertissement' style="z-index:2400;position:fixed;top:50%;left:0;right:0;margin: 0 auto;width:100%;display:none;">
            <div class="col-sm-12">
                <div class="col-sm-2"></div>
                <div class="col-sm-8 liste-widget-global" >
                    <div class="col-sm-12" id='txt_alert_message_avertissement'></div>
                    <div class="col-sm-12" role="group" aria-label="" align="center">
                        <button id="btn_message_alert_ok" name="btn_message_alert_ok" onclick="fermer_message_alerte();" type="button" class="btn btn_confirm" style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
                    </div>
                </div>
                <div class="col-sm-2"></div>
            </div>
        </div>

        {include file="modal_choix_patient_rdv.tpl"}

        <!-- variable variable----------->
        <input type="hidden" id="idnomaffichepatient" value="test pour voir valeur">
        <input type="hidden" id="id_identifiant_patient" value="">



        <!-- [DEBUT] Modal Prendre un rendez-vous anesthesiste Nouveau-->
        <div style="overflow-x: hidden;overflow-y: auto;z-index:2100;" class="modal fade in" id="modalPrendreRendezVousAnesthesiste" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVousAnesthesiste" aria-hidden="false">
            <div class="modal-dialog" id="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalPrendreRendezVousAnesthesiste"> Prendre un rendez-vous</h4>
                    </div>
                    <div class="modal-body" >
                        <div id='myfiltre_prendre_rendez_vous_anesthesiste' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10000;opacity:0.7;filter: alpha(opacity=70);'></div>

                        <div id='alert_message_avertissement_anesthesiste' style="z-index:2400;position:fixed;top:50%;left:0;right:0;margin: 0 auto;width:50%;display:none;">
                            <div class="col-sm-12">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8 liste-widget-global" >
                                    <div class="col-sm-12" id='txt_alert_message_avertissement_anesthesiste'></div>
                                    <div class="col-sm-12" role="group" aria-label="" align="center">
                                        <button id="btn_message_alert_ok_anesthesiste" name="btn_message_alert_ok_anesthesiste" onclick="fermer_message_alerte();" type="button" class="btn btn_confirm" style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>

                        <div id="wizard_anesthesiste" class="form-wizard">
                            <div class="progress progress active">
                                <div class="progress-bar progress-bar-info" > </div>
                            </div>
                            <ul>
                                <li><a href="#tabPrendreRendezVous1_anesthesiste" data-toggle="tab">
                                        <div id="tabb1_anesthesiste" class="menu-icon">&nbsp;</div>
                                        RDV disponibles </a></li>
                                <li><a href="#tabPrendreRendezVous2_anesthesiste" data-toggle="tab">
                                        <div id="tabb2_anesthesiste" class="menu-icon">&nbsp;</div>
                                        Informations patient </a></li>
                            </ul>
                            <div class="tab-content no-bd" style="padding-top: 0px;">
                                <div class="tab-pane" id="tabPrendreRendezVous1_anesthesiste">
                                    <div id="attente_chargement_etape2_prendre_rendez_vous_anesthesiste"></div>
                                    <form class="form-horizontal" action="" role="form" id="form_etape2_prendre_rendez_vous_anesthesiste" name="form_etape2_prendre_rendez_vous_anesthesiste">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-8">
                                                    <input type="hidden" id="nb_q_anesthesiste" name="nb_q_anesthesiste" value="0">
                                                    <input type="hidden" id="idp_anesthesiste" name="idp_anesthesiste" value="">
                                                    <input type="hidden" id="iduniqueanesthesiste" name="iduniqueanesthesiste" value="">
                                                    <div  id="divdateintervention_anesthesiste" class="col-sm-12 form-group">
                                                        <div class="label-wrapper">
                                                            <label class="control-label">Quel est la date de l'intervention ?</label>
                                                        </div>
                                                        <div class="input-group">
                                                            <input type="text"
                                                                   placeholder=""
                                                                   value=""
                                                                   name="date_intervention_anesthesiste"
                                                                   id="date_intervention_anesthesiste"
                                                                   required
                                                                   class="required input-widget-date-left">
                                                            <span class="input-group-addon input-widget-date-right"
                                                                  id="datepicker-icon-trigger"
                                                                  data-datepicker="#date_intervention_anesthesiste">
                                                                <i class="fa fa-calendar"></i>
                                                            </span>
                                                        </div>
                                                        <div id="bookingBox1" style="position: absolute;z-index: 1;"></div>
                                                    </div>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#date_intervention_anesthesiste").datepicker({
                                                                    dateFormat: 'dd/mm/yy',
                                                                    orientation: 'auto',
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    yearRange: "-0:+5",
                                                                    beforeShow: function (textbox, instance) {
                                                                        $('#ui-datepicker-div').css({
                                                                            position: 'initial',
                                                                            top: -20,
                                                                            left: 5
                                                                        });
                                                                        $('#bookingBox1').append($('#ui-datepicker-div'));
                                                                        $('#ui-datepicker-div').hide();
                                                                    }
                                                                });
                                                                $("#date_intervention_anesthesiste").mask("99/99/9999");

                                                                $('[data-datepicker]').click(function (e) {
                                                                    var data = $(this).data('datepicker');
                                                                    $(data).focus();
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}
                                                    <div id="divspecialiteintervention_anesthesiste" class="col-sm-12 form-group" style="display: none;">
                                                        <div class="label-wrapper">
                                                            <label class="control-label">Quel est la spécialité de votre intervention ?</label>
                                                        </div>
                                                        <div class="vd_input-wrapper">
                                                            <select id="selectspecialite_anesthesiste"></select>
                                                        </div>
                                                    </div>
                                                    <div id="divpraticienintervention_anesthesiste" class="col-sm-12 form-group" style="display: none;">
                                                        <div class="label-wrapper">
                                                            <label class="control-label">Quel praticien réalisera votre intervention ?</label>
                                                        </div>
                                                        <div class="vd_input-wrapper">
                                                            <select id="selectpraticien_anesthesiste"></select>
                                                        </div>
                                                    </div>
                                                    <div id="divquestiongenerer_anesthesiste" class="col-sm-12 form-group">
                                                        <div id="divquestion_anesthesiste"></div>
                                                    </div>

                                                </div>
                                                <div id="divoption_prendre_rendez_vous_anesthesiste" class="col-sm-12 controls" style="margin: 0px; padding: 0px;display: none;">
                                                    <div class="form-group">
                                                        <div class="col-sm-4 controls" style="margin:0px;">
                                                            <div class="label-wrapper">
                                                                <label class="control-label">
                                                                    <b>Choisissez une date de début</b>
                                                                </label>
                                                            </div>
                                                            <div class="input-group">
                                                                <input type="text"
                                                                       placeholder=""
                                                                       value=""
                                                                       name="date_perso_anesthesiste"
                                                                       id="date_perso_anesthesiste"
                                                                       required
                                                                       class="required input-widget-date-left">
                                                                <span class="input-group-addon input-widget-date-right"
                                                                      id="datepicker-icon-trigger"
                                                                      data-datepicker="#date_perso_anesthesiste">
                                                                    <i class="fa fa-calendar"></i>
                                                                </span>
                                                            </div>
                                                            <div id="bookingBox" style="position: absolute;z-index: 1;"></div>
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $(document).ready(function () {
                                                                        $("#date_perso_anesthesiste").datepicker({
                                                                            dateFormat: 'dd/mm/yy',
                                                                            changeMonth: true,
                                                                            changeYear: true,
                                                                            yearRange: "-0:+5",
                                                                            beforeShow: function (textbox, instance) {
                                                                                $('#ui-datepicker-div').css({
                                                                                    position: 'initial',
                                                                                    top: -20,
                                                                                    left: 5
                                                                                });
                                                                                $('#bookingBox').append($('#ui-datepicker-div'));
                                                                                $('#ui-datepicker-div').hide();
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

                                                        <div class="col-sm-4 controls" style="margin:0px;">
                                                            <div class="label-wrapper">
                                                                <label class="control-label">
                                                                    <b>Choisissez un jour</b>
                                                                </label>
                                                            </div>
                                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                                <select name="jour_prendre_rendez_vous_anesthesiste" id="jour_prendre_rendez_vous_anesthesiste">
                                                                    <option value="">Indifférent</option>
                                                                    <option value="1">Lundi</option>
                                                                    <option value="2">Mardi</option>
                                                                    <option value="3">Mercredi</option>
                                                                    <option value="4">Jeudi</option>
                                                                    <option value="5">Vendredi</option>
                                                                    <option value="6">Samedi</option>
                                                                    <option value="0">Dimanche</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4 controls" style="margin:0px;">
                                                            <div class="label-wrapper">
                                                                <label class="control-label">
                                                                    <b>Choisissez un créneau horaire</b>
                                                                </label>
                                                            </div>
                                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                                <select name="horaire_prendre_rendez_vous_anesthesiste" id="horaire_prendre_rendez_vous_anesthesiste">
                                                                    <option value="">Indifférent</option>
                                                                    <option value="6-11">Matin</option>
                                                                    <option value="12-21">Après-Midi</option>
                                                                    <option value="6-7">06h/08h</option>
                                                                    <option value="8-9">08h/10h</option>
                                                                    <option value="10-11">10h/12h</option>
                                                                    <option value="12-13">12h/14h</option>
                                                                    <option value="14-15">14h/16h</option>
                                                                    <option value="16-17">16h/18h</option>
                                                                    <option value="18-19">18h/20h</option>
                                                                    <option value="20-21">20h/22h</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" align="center">
                                            <div class="vd_checkbox checkbox-success">
                                                <input
                                                    type="checkbox"
                                                    class=""
                                                    name="id_check_force_premier_rdv"
                                                    value="ok"
                                                    id="id_check_force_premier_rdv"
                                                    title="Cochez la case si vous souhaitez obtenir directement un RDV le plus proche, Attention : l'anesthésiste proposé ne sera pas présent le jour J"
                                                    alt="Cochez la case si vous souhaitez obtenir directement un RDV le plus proche, Attention : l'anesthésiste proposé ne sera pas présent le jour J"
                                                    >
                                                <label title="Cochez la case si vous souhaitez obtenir directement un RDV le plus proche, Attention : l'anesthésiste proposé ne sera pas présent le jour J"
                                                       style="text-align: left;" for="id_check_force_premier_rdv">Forcer le premier RDV disponible</label>
                                            </div>
                                            <button id="btn_recherche_rdv_prendre_rendez_vous_anesthesiste" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="recherche_rdv_prendre_rendez_vous_anesthesiste();">Rechercher</button>

                                        </div>

                                        <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous_anesthesiste" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                        <div class="col-sm-12" style='margin-top:10px; padding-right: 0px;padding-left: 0px;'>
                                            <div id="divrdvdispoattente_prendre_rendez_vous_anesthesiste" style="padding:0;display:none;">
                                                <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                                            </div>
                                            <div id="divrdvdispo_prendre_rendez_vous_anesthesiste" style="display:none;"></div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" id="tabPrendreRendezVous2_anesthesiste">
                                    <div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                        <div class="col-sm-8" style="padding-left: 0px;">
                                            <form class="form-horizontal" action="#" role="form" id="modal_etape1_prendre_rdv_anesthesiste" name="modal_etape1_prendre_rdv_anesthesiste" autocomplete="new-password"  >
                                                <input type="hidden" name="id_temp_rdv_anesthesiste_unique" value="" id="id_temp_rdv_anesthesiste_unique">
                                                <div class="col-sm-12 controls" id="divtempcheckpatient_anesthesiste" style="display:none;"></div>
                                                <div class="col-sm-12 controls" id="divenregpatient_anesthesiste">
                                                    <div class="form-group" {if $rdv_prive_actif!='Y'}style="display:none;"{/if}>
                                                        <div class="col-sm-6 controls">
                                                            <div class="label-wrapper-modal">
                                                                <label class="control-label">RDV privé :</label>
                                                            </div>
                                                            <div class="vd_radio radio-success">
                                                                <input type="radio" name="prive_prendre_rdv_anesthesiste" value="Y" id="id_prive_prendre_rdv_oui_anesthesiste">
                                                                <label for="id_prive_prendre_rdv_oui_anesthesiste">Oui</label>
                                                                <input type="radio" name="prive_prendre_rdv_anesthesiste" checked="checked" value="N" id="id_prive_prendre_rdv_non_anesthesiste">
                                                                <label for="id_prive_prendre_rdv_non_anesthesiste">Non</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                        <div class="col-sm-12 controls" style="display:none;" id="div_reinit_anesthesiste">
                                                            <a href="#" onclick="debloque_modification_patient_modal_prendre_rendez_vous_anesthesiste();"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinitialise_patient_prendre_rendez_vous_anesthesiste_unique();" >Réinitialiser</a>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-3 controls">
                                                            <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                                <select id="civilite_patient_prendre_rdv_anesthesiste" name="civilite_patient_prendre_rdv_anesthesiste" required class="required" style="border-color: red;">
                                                                    <option value="" disabled selected hidden>Civilité</option>
                                                                    {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                                        <option value="{$tabLC.id_civilite}">{$tabLC.abreviation_civilite}</option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-5 controls">
                                                            <input type="text" placeholder="Nom" name="nom_patient_prendre_rdv_anesthesiste" id="nom_patient_prendre_rdv_anesthesiste" value="" required style="border-color: red;" class="required input-majuscule input-widget" autocomplete="new-password" />
                                                            <input type="hidden" name="id_patient_prendre_rdv_anesthesiste" id="id_patient_prendre_rdv_anesthesiste">
                                                            {literal}
                                                                <!-- Script pour l'auto-completion -->
                                                                <script type="text/javascript" >
                                                                    $("#nom_patient_prendre_rdv_anesthesiste").autocomplete({
                                                                        source: 'ajax/recherche_fiche_patient_auto_complete.php',
                                                                        focus: function (event, ui) {
                                                                            event.preventDefault();
                                                                        },
                                                                        select: function (event, ui) {
                                                                            event.preventDefault();
                                                                            getInfoPatientModalPrendreRDV_anesthesiste(ui.item.value);
                                                                        },
                                                                        appendTo: "#modalPrendreRendezVousAnesthesiste"
                                                                    });
                                                                </script>
                                                            {/literal}
                                                        </div>
                                                        <div class="col-sm-4 controls">
                                                            <input type="text" placeholder="Prénom" name="prenom_patient_prendre_rdv_anesthesiste" id="prenom_patient_prendre_rdv_anesthesiste" value="" required style="border-color: red;" class="required input-first-letter input-widget" autocomplete="new-password" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id='divnomjeunefille_patient_prendre_rdv_anesthesiste' style='display:none;'>
                                                        <div class="col-sm-12 controls">
                                                            <input type="text" placeholder="Nom de naissance" name="nom_jeune_fille_patient_prendre_rdv_anesthesiste" id="nom_jeune_fille_patient_prendre_rdv_anesthesiste" value="" class="input-majuscule input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <input type="text" placeholder="Adresse" name="adresse_patient_prendre_rdv_anesthesiste" id="adresse_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Code postal" name="code_postal_patient_prendre_rdv_anesthesiste" id="code_postal_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Ville" name="ville_patient_prendre_rdv_anesthesiste" id="ville_patient_prendre_rdv_anesthesiste" value="" class="input-majuscule input-widget" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="hidden" name="tel_mobile_patient_prendre_rdv_anesthesiste_indicatif" id="tel_mobile_patient_prendre_rdv_anesthesiste_indicatif" value="{$num_indicatif_structure}">
                                                            <input type="text" placeholder="Téléphone mobile" name="tel_mobile_patient_prendre_rdv_anesthesiste" id="tel_mobile_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $(document).ready(function () {
                                                                        $("#tel_mobile_patient_prendre_rdv_anesthesiste").intlTelInput({
                                                                            preferredCountries: ["fr", "be", "ch"],
                                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                            utilsScript: "js/utils.js"
                                                                        });

                                                                        if ($("#tel_mobile_patient_prendre_rdv_anesthesiste_indicatif").val() === "41") {
                                                                            $("#tel_mobile_patient_prendre_rdv_anesthesiste").inputmask("999 999 99 99");
                                                                        } else if ($("#tel_mobile_patient_prendre_rdv_anesthesiste_indicatif").val() === "33") {
                                                                            $("#tel_mobile_patient_prendre_rdv_anesthesiste").inputmask("99 99 99 99 99");
                                                                        }

                                                                        $("#tel_mobile_patient_prendre_rdv_anesthesiste").on("keyup change", function () {
                                                                            var countryData = $("#tel_mobile_patient_prendre_rdv_anesthesiste").intlTelInput("getSelectedCountryData");
                                                                            $("#tel_mobile_patient_prendre_rdv_anesthesiste_indicatif").val(countryData.dialCode);
                                                                        });

                                                                        $("#tel_mobile_patient_prendre_rdv_anesthesiste").on("countrychange", function (e, countryData) {
                                                                            $("#tel_mobile_patient_prendre_rdv_anesthesiste_indicatif").val(countryData.dialCode);
                                                                            var idpays = countryData.iso2;
                                                                            if (idpays === "fr") {
                                                                                $("#tel_mobile_patient_prendre_rdv_anesthesiste").inputmask("99 99 99 99 99");
                                                                            } else if (idpays === "ch") {
                                                                                $("#tel_mobile_patient_prendre_rdv_anesthesiste").inputmask("999 999 99 99");
                                                                            }
                                                                        });
                                                                    });
                                                                </script>
                                                            {/literal}
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="hidden" name="tel_fixe_patient_prendre_rdv_anesthesiste_indicatif" id="tel_fixe_patient_prendre_rdv_anesthesiste_indicatif" value="{$num_indicatif_structure}">
                                                            <input type="text" placeholder="Téléphone fixe" name="tel_fixe_patient_prendre_rdv_anesthesiste" id="tel_fixe_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $(document).ready(function () {
                                                                        $("#tel_fixe_patient_prendre_rdv_anesthesiste").intlTelInput({
                                                                            preferredCountries: ["fr", "be", "ch"],
                                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                            utilsScript: "js/utils.js"
                                                                        });

                                                                        if ($("#tel_fixe_patient_prendre_rdv_anesthesiste_indicatif").val() === "41") {
                                                                            $("#tel_fixe_patient_prendre_rdv_anesthesiste").inputmask("999 999 99 99");
                                                                        } else if ($("#tel_fixe_patient_prendre_rdv_anesthesiste_indicatif").val() === "33") {
                                                                            $("#tel_fixe_patient_prendre_rdv_anesthesiste").inputmask("99 99 99 99 99");
                                                                        }

                                                                        $("#tel_fixe_patient_prendre_rdv_anesthesiste").on("keyup change", function () {
                                                                            var countryData = $("#tel_fixe_patient_prendre_rdv_anesthesiste").intlTelInput("getSelectedCountryData");
                                                                            $("#tel_fixe_patient_prendre_rdv_anesthesiste_indicatif").val(countryData.dialCode);
                                                                        });

                                                                        $("#tel_fixe_patient_prendre_rdv_anesthesiste").on("countrychange", function (e, countryData) {
                                                                            $("#tel_fixe_patient_prendre_rdv_anesthesiste_indicatif").val(countryData.dialCode);
                                                                            var idpays = countryData.iso2;
                                                                            if (idpays === "fr") {
                                                                                $("#tel_fixe_patient_prendre_rdv_anesthesiste").inputmask("99 99 99 99 99");
                                                                            } else if (idpays === "ch") {
                                                                                $("#tel_fixe_patient_prendre_rdv_anesthesiste").inputmask("999 999 99 99");
                                                                            }
                                                                        });
                                                                    });
                                                                </script>
                                                            {/literal}
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <input type="email" placeholder="Email" name="email_patient_prendre_rdv_anesthesiste" id="email_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-4 controls">
                                                            <div class="input-group">
                                                                <input type="text" placeholder="Date de naissance" name="date_naissance_patient_prendre_rdv_anesthesiste" id="date_naissance_patient_prendre_rdv_anesthesiste" value="" class="required input-widget-date-left" required style="border-color: red;">
                                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#id_datenaissance">
                                                                    <i class="fa fa-calendar"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    $("#date_naissance_patient_prendre_rdv_anesthesiste").datepicker(
                                                                            {
                                                                                container: '#myModalId',
                                                                                dateFormat: 'dd/mm/yy',
                                                                                changeMonth: true,
                                                                                changeYear: true,
                                                                                yearRange: "-100:+0"
                                                                            });
                                                                    $('[data-datepicker]').click(function (e) {
                                                                        var data = $(this).data('datepicker');
                                                                        $(data).focus();
                                                                    });
                                                                });
                                                            </script>
                                                        {/literal}
                                                        <div class="col-sm-4 controls">
                                                            <input type="text" onkeyup="checkInsee(this);" placeholder="N° de sécurité sociale" name="num_secu_patient_prendre_rdv_anesthesiste" id="num_secu_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-4 controls">
                                                            <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                                <select id="assurance_patient_prendre_rdv_anesthesiste" name="assurance_patient_prendre_rdv_anesthesiste">
                                                                    <option value="">Veuillez choisir une assurance</option>
                                                                    {foreach from=$TabAssurance item=objAssurance}
                                                                        <option value="{$objAssurance.id_assurance_maladie}">{$objAssurance.libelle_assurance_maladie}</option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Médecin traitant" name="medecin_traitant_patient_prendre_rdv_anesthesiste" id="medecin_traitant_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Ville du médecin" name="ville_medecin_patient_prendre_rdv_anesthesiste" id="ville_medecin_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <div class="input-group">
                                                                <select id="couleur_patient_prendre_rdv_anesthesiste">
                                                                    <option value="">Couleur du patient</option>
                                                                    <option value="008000" style="color:#FFFFFF; background-color: #008000">Vert</option>
                                                                    <option value="FF8D01" style="color:#FFFFFF; background-color: #FF8D01">Orange</option>
                                                                    <option value="FF0000" style="color:#FFFFFF; background-color: #FF0000">Rouge</option>
                                                                </select>
                                                                <span id="cadre_couleur_patient_prendre_rdv_anesthesiste" class="input-group-addon color-input"><i class="fa fa-square"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Profession" name="profession_patient_prendre_rdv_anesthesiste" id="profession_patient_prendre_rdv_anesthesiste" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <textarea placeholder="Commentaire" name="remarque_patient_prendre_rdv_anesthesiste" id="remarque_patient_prendre_rdv_anesthesiste" class="input-widget" ></textarea>
                                                        </div>
                                                    </div>


                                                    <div class="col-sm-12" align="center" id="div_button_update_patient_anesthesiste" style="display:none;">
                                                        <div class="col-sm-12 controls" align="center">
                                                            <button type="button" onclick="modification_patient_modal_prendre_rendez_vous_anesthesiste();" name="updateButtonPatient_prendre_rdv_anesthesiste" id="updateButtonPatient_prendre_rdv_anesthesiste" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier</button>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-12" align="center" id="div_button_suivant_anesthesiste">
                                                        <a  id="btn_prec1_anesthesiste" class="btn vd_btn prev" href="javascript:void(0);" onclick="retour_tabPrendreRendezVous_anesthesiste_unique();" style="background-color: #8E8E8E;margin: 0px 10px 0px 0px;"><span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span> Retour</a>
                                                        <button id="btn_check_patient_prendre_rdv_anesthesiste" name="btn_check_patient_prendre_rdv_anesthesiste" type="submit" class="btn vd_btn btn_widget_standard">Valider <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="col-sm-4" style="padding-right: 0px;padding-left: 0px;">
                                            <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                                <div id="attente_historique_patient_prendre_rendez_vous_anesthesiste" style="display: none;">
                                                    <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                                </div>
                                                <div id='pas_historique_patient_prendre_rendez_vous_anesthesiste' style="display: none;">
                                                    <div class="alert alert-info">
                                                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                                        Aucun historique disponible
                                                    </div>
                                                </div>
                                                <div id='historique_patient_prendre_rendez_vous_anesthesiste' style="display: none;">
                                                    <div id="menu_historique_patient_rendez_vous_anesthesiste" class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                                        <a href="javascript:void(0);" data-filter=".patienttraite_rendez_vous_anesthesiste">
                                                            <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:lime;height:45px;">
                                                                <b id="libelle_rdv_traite_rendez_vous_anesthesiste" title="Patient traité" style="vertical-align: -webkit-baseline-middle;">Tr.</b>
                                                            </div>
                                                        </a>
                                                        <a href="javascript:void(0);" data-filter=".rdvplanifie_rendez_vous_anesthesiste">
                                                            <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:#27a1c2;height:45px;">
                                                                <b id="libelle_rdv_planifie_rendez_vous_anesthesiste" title="Rendez-vous planifié" style="vertical-align: -webkit-baseline-middle;">Pl.</b>
                                                            </div>
                                                        </a>
                                                        <a href="javascript:void(0);" data-filter=".absenceexcusee_rendez_vous_anesthesiste">
                                                            <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:orange;height:45px;">
                                                                <b id="libelle_rdv_ab_excusee_rendez_vous_anesthesiste" title="Absence Excusée" style="vertical-align: -webkit-baseline-middle;">Abs. Ex.</b>
                                                            </div>
                                                        </a>
                                                        <a href="javascript:void(0);" data-filter=".absencenonexcusee_rendez_vous_anesthesiste">
                                                            <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:red;height:45px;">
                                                                <b id="libelle_rdv_ab_non_excusee_rendez_vous_anesthesiste" title="Absence Non Excusée" style="">Abs. Non Ex.</b>
                                                            </div>
                                                        </a>
                                                    </div>
                                                    <div class="col-sm-12" id="boucle_historique_prendre_rendez_vous_anesthesiste" style="padding-right: 0px; padding-left: 0px;max-height: 450px;overflow: auto;"></div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Prendre rendez-vous Anesthesiste Nouveau-->

        <!-- [DEBUT] Modal traduction -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="fli_modallg" tabindex="-1" role="dialog" aria-labelledby="Labelfli_modallg" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content" style="background-color:#FFFFFF">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalPrendreRendezVous">Traductions</h4>
                    </div>
                    <div class="modal-body">
                        <div id="div_info_fli" >
                            <div class="col-sm-12" style="padding-top:10px;">
                                <form action="" class="form-horizontal" role="form" method="POST" id="form_flilg" name="form_fli" >
                                    <input type="hidden" id="fli_identifiant" name="identifianlg">
                                    <input type="hidden" id="fli_basedonne" name="basedonne">
                                    <input type="hidden" id="fli_champbasedonne" name="champbasedonne">
                                    <input type="hidden" id="fli_link" name="idlinklg">
                                    <input type="hidden" id="fli_enreg" name="enreglangue" value="ok">

                                    <div class="form-group">
                                        <div class="col-sm-6 controls">
                                            <label class="control-label">Version FR</label>
                                            <div class="controls">
                                                <input type="text" id="fli_lgfr" name="lg_fr" size="30">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 controls">
                                            <label class="control-label">Version ENG</label>
                                            <div class="controls">
                                                <input type="text"  id="fli_lgeng"  name="lg_eng" size="30">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-6 controls">
                                            <label class="control-label">Version ALL</label>
                                            <div class="controls">
                                                <input type="text"  id="fli_lgall"  name="lg_all" size="30">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 controls">
                                            <label class="control-label">Version ESP</label>
                                            <div class="controls">
                                                <input type="text"  id="fli_lgesp"  name="lg_esp" size="30">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-6 controls">
                                            <label class="control-label">Activ traduction principal</label>
                                            <div class="controls">
                                                <select name="actifprinicpal" id="fli_actifprinicpal">
                                                    <option value="N">NON</option>
                                                    <option value="attentecptweb">En attente de création  d'un compte web</option>
                                                    <option value="Y">OUI</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 controls" id="fli_desctipiton">
                                            Traduction par defaut

                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-4 controls" align="center"></div>
                                        <div class="col-sm-4 controls" align="center">
                                            <button type="submit" id="btn_modifier_traduction" name="btn_modifier_traduction" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier </button>
                                        </div>

                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Fiche traduction -->

        <!-- [DEBUT] Modal confirm -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalComfirmeCouper" tabindex="-1" role="dialog" aria-labelledby="LabelmodalComfirmeCouper" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalComfirmeCouper"> Confirmation couper RDV</h4>
                    </div>
                    <div class="modal-body" >
                        <div>
                            <div class="col-sm-12" style="padding-top:10px;">
                                <input type="hidden" name="modal_couper_id_rdv_copie" id="modal_couper_id_rdv_copie" />
                                <input type="hidden" name="modal_couper_id_calendar" id="modal_couper_id_calendar" />
                                <input type="hidden" name="modal_couper_date_coller" id="modal_couper_date_coller" />
                                <input type="hidden" name="modal_couper_heure_coller" id="modal_couper_heure_coller" />

                                <div id="div_confirme_couper" class="alert alert-warning" align="center"></div>
                                <div id="div_attente_confirme_couper" style="display: none;">
                                    <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                </div>
                                <div style="margin-top:10px;" align="center">
                                    <button type="button" name="btnconfirmecouper" id="btnconfirmecouper" class="btn vd_btn vd_bg-green" onclick="set_couper_coller_rdv()">Confirmer</button>
                                    &nbsp;&nbsp;
                                    <button type="button" name="btnannulecouper" id="btnannulecouper" onclick="$('#modalComfirmeCouper').modal('hide');
                                            suppression_couper_rdv();" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal confirm-->

        <!-- [DEBUT] Modal confirm copier -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalComfirmeCopier" tabindex="-1" role="dialog" aria-labelledby="LabelmodalComfirmeCopier" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalComfirmeCopier"> Confirmation copier RDV</h4>
                    </div>
                    <div class="modal-body" >
                        <div>
                            <div class="col-sm-12" style="padding-top:10px;">
                                <input type="hidden" name="modal_copier_id_rdv_copie" id="modal_copier_id_rdv_copie" />
                                <input type="hidden" name="modal_copier_id_calendar" id="modal_copier_id_calendar" />
                                <input type="hidden" name="modal_copier_date_coller" id="modal_copier_date_coller" />
                                <input type="hidden" name="modal_copier_heure_coller" id="modal_copier_heure_coller" />

                                <div id="div_confirme_copier" class="alert alert-warning" align="center"></div>
                                <div id="div_attente_confirme_copier" style="display: none;">
                                    <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                </div>
                                <div style="margin-top:10px;" align="center">
                                    <button type="button" name="btnconfirmecopier" id="btnconfirmecopier" class="btn vd_btn vd_bg-green" onclick="set_copier_coller_rdv()">Confirmer</button>
                                    &nbsp;&nbsp;
                                    <button type="button" name="btnannulecopier" id="btnannulecopier" onclick="$('#modalComfirmeCopier').modal('hide');
                                            suppression_copier_rdv();" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal confirm-->

        <!-- [DEBUT] Modal Del RDV Récurrent -->
        <div style="overflow-x: hidden;overflow-y: auto;z-index: 2300;" class="modal fade in" id="modalDelRdvRecurrent" tabindex="-1" role="dialog" aria-labelledby="LabelmodalDelRdvRecurrent" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalDelRdvRecurrent"> Supprimer le rendez-vous périodique</h4>
                    </div>
                    <div class="modal-body" >
                        <div>
                            <input type="hidden" id="del_recurrent_idrdv" name="del_recurrent_idrdv" value="">
                            <input type="hidden" id="del_recurrent_idunique" name="del_recurrent_idunique" value="">
                            <input type="hidden" id="del_recurrent_daterdv" name="del_recurrent_daterdv" value="">
                            <div class="col-sm-12" style="padding-top:10px;">
                                <div id="div_confirme_del_rdv_recurrent" class="alert alert-warning" style="display: none;" align="center"></div>
                                <div id="div_select_del_rdv_recurrent">
                                    <div>Ce rendez-vous fait parti d'un groupe de rendez-vous périodique, que souhaitez-vous supprimer ?</div>
                                    <div class="vd_radio radio-success">
                                        <input type="radio" name="recurrent_del_type" checked="checked" value="1" id="del_rdv_recurrent_cet_event">
                                        <label for="del_rdv_recurrent_cet_event">Ce rendez-vous</label>
                                    </div>
                                    <div class="vd_radio radio-success">
                                        <input type="radio" name="recurrent_del_type" value="2" id="del_rdv_recurrent_cet_event_and_other">
                                        <label for="del_rdv_recurrent_cet_event_and_other">Ce rendez-vous et tous les suivants</label>
                                    </div>
                                    <div class="vd_radio radio-success">
                                        <input type="radio" name="recurrent_del_type" value="3" id="del_rdv_recurrent_all_event">
                                        <label for="del_rdv_recurrent_all_event">Tous les rendez-vous</label>
                                    </div>
                                </div>
                                <div id="div_attente_confirme_del_rdv_recurrent" style="display: none;">
                                    <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                </div>
                                <div style="margin-top:10px;" align="center">
                                    <button type="button" name="btnconfirmdelrdvrecurrent" id="btnconfirmdelrdvrecurrent" class="btn vd_btn vd_bg-blue" onclick="del_rdv_recurrent()">Confirmer</button>
                                    &nbsp;&nbsp;
                                    <button type="button" name="btnannuledelrdvrecurrent" id="btnannuledelrdvrecurrent" onclick="$('#modalDelRdvRecurrent').modal('hide');" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Del RDV Récurrent -->

        <!-- [DEBUT] Modal modifier MDP -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalModifMDP" tabindex="-1" role="dialog"  data-backdrop="static" data-keyboard="false" aria-labelledby="LabelmodalModifMDP" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalModifMDP"> Modifier le mot de passe</h4>
                    </div>
                    <div class="modal-body" >
                        <div>
                            <form action="#" class="form-horizontal" role="form" id="form_modif_mdp" name="form_modif_mdp" >
                                <input type="hidden" id="mdp_guid_user" name="mdp_guid_user" value="">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8" style="padding-top:10px;">
                                    <div id="div_confirme_modif_mdp" style="display: none;" align="center"></div>
                                    <div id="div_attente_confirme_modif_mdp" style="display: none;">
                                        <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                    </div>
                                    <div id="divformulairemodifmdp">
                                        <div class="form-group">
                                            <label for="passwd_1">Mot de passe<sup>*</sup></label>
                                            <input type="hidden" id="passwdNb" name="passwdNb" value="">
                                            <input onkeyup="passwordStrength(this.value);" class="required validate form-control" type="password" id="passwd_1" name="passwd_1" value="" autocomplete="new-password" required>
                                            <div style="clear:both;">
                                                <div id="passwdDescription"></div>
                                                <div id="passwdStrength" class="strength0"></div>
                                                <div><i>Minimum 6 caractères / 1 majuscule / 1 chiffre / 1 caractère spécial (!,@,#,$,%,^,(,),&,*,?,_,~,-)</i></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="passwd_2">Confirmer votre mot de passe<sup>*</sup></label>
                                            <input class="required validate form-control" type="password" id="passwd_2" name="passwd_2" value="" autocomplete="new-password" required>
                                            <div style="clear:both;">
                                                <div id="passwdIdentique">&nbsp;</div>
                                            </div>
                                        </div>
                                        <div style="margin-top:10px;" align="center">
                                            <button type="button" name="btnconfirmmodifmdp" id="btnconfirmmodifmdp" class="btn vd_btn vd_bg-blue" onclick="modif_mdp();" disabled>Confirmer</button>
                                            &nbsp;&nbsp;
                                            <button type="button" name="btnannulemodifmdp" id="btnannulemodifmdp" onclick="$('#modalModifMDP').modal('hide');" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                        </div>
                                    </div>
                                    <div id="divbtnfermermodifmdp" style="margin-top:10px; display: none;" align="center" >
                                        <button type="button" name="btnfermermodifmdp" id="btnfermermodifmdp" onclick="$('#modalModifMDP').modal('hide');" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Fermer</button>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal modifier MDP -->

        <!-- [DEBUT] Modal information message -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalInformationMessage" tabindex="-1" role="dialog" aria-labelledby="LabelmodalmodalInformationMessage" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalInformationMessage"> Obtenir de l'aide</h4>
                    </div>
                    <div class="modal-body" >
                        <div>
                            <div id="div_information_message" align="center"></div>
                            <div id="divbtnfermerinformationmessage" style="margin-top:10px;" align="center" >
                                <button type="button" name="btnfermerinformationmessage" id="btnfermerinformationmessage" onclick="$('#modalInformationMessage').modal('hide');" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Ok</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal modifier MDP -->

        <!-- [DEBUT] Modal Appel Urgence -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalAppelUrgence" tabindex="-1" role="dialog" aria-labelledby="LabelmodalAppelUrgence" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalAppelUrgence"> Appel d'urgence du patient</h4>
                    </div>
                    <div class="modal-body" >
                        <div id="attente_formulaire_appel_urgence"></div>
                        <div id="div_formulaire_appel_urgence">
                            <input type="hidden" id="identifiantrdv_appel_urgence" name="identifiantrdv_appel_urgence" value="">
                            <div class="form-group">
                                <div class="col-sm-12 controls">
                                    <label class="control-label">Règles d'appel d'urgence</label>
                                    <div class="controls">
                                        <select id="regle_appel_urgence" name="regle_appel_urgence" required></select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 controls">
                                <label class="control-label"><b>Période autorisé</b></label>
                                <div>
                                    <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;">
                                        <input type="radio" name="quand_appel_urgence" value="1" checked="checked" id="quand_appel_urgence_apres">
                                        <label for="quand_appel_urgence_apres" style="float: left;">Nombre de jours après le RDV</label>
                                        <div class="controls" style="margin-left:10px;float: left;">
                                            <input type="number" name="nb_quand_appel_urgence_apres" id="nb_quand_appel_urgence_apres" min="1" value="30">
                                        </div>
                                        <div class="controls" style="margin-left:10px;float: left;"> jour(s)</div>
                                    </div>
                                    <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px; margin-bottom: 15px;">
                                        <input type="radio" name="quand_appel_urgence" value="0" id="quand_appel_urgence_personnaliser" style="float: left;">
                                        <label for="quand_appel_urgence_personnaliser" style="float: left;">Personnaliser</label>
                                        <div class="col-sm-1 controls" style="text-align: center;">&nbsp;Du&nbsp;</div>
                                        <div class="col-sm-3 controls">
                                            <div id="divdatedebut">
                                                <div class="input-group">
                                                    <input type="text" value="" name="date_debut_appel_urgent" id="date_debut_appel_urgent" class="input-modal-date-left">
                                                    <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#date_debut_appel_urgent">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                </div>
                                                <div id="bookingBoxdatedebut_appel_urgent" style="position: absolute;z-index: 1;"></div>

                                                <script type="text/javascript">
                                                    $(document).ready(function () {
                                                        $("#date_debut_appel_urgent").datepicker({
                                                            dateFormat: 'dd/mm/yy',
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            yearRange: "-100:+0",
                                                            beforeShow: function (textbox, instance) {
                                                                $('#ui-datepicker-div').css({
                                                                    position: 'initial',
                                                                    top: -20,
                                                                    left: 5
                                                                });
                                                                $('#bookingBoxdatedebut_appel_urgent').append($('#ui-datepicker-div'));
                                                                $('#ui-datepicker-div').hide();
                                                            }
                                                        });
                                                        $('[data-datepicker]').click(function (e) {
                                                            var data = $(this).data('datepicker');
                                                            $(data).focus();
                                                        });
                                                    });
                                                </script>

                                            </div>
                                        </div>
                                        <div class="col-sm-1 controls" style="text-align: center;">&nbsp;Au&nbsp;</div>
                                        <div class="col-sm-3 controls">
                                            <div id="divdatefin">
                                                <div class="input-group">
                                                    <input type="text" value="" name="date_fin_appel_urgent" id="date_fin_appel_urgent" class="input-modal-date-left">
                                                    <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#date_fin_appel_urgent">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                </div>
                                                <div id="bookingBoxdatefin_appel_urgent" style="position: absolute;z-index: 1;"></div>

                                                <script type="text/javascript">
                                                    $(document).ready(function () {
                                                        $("#date_fin_appel_urgent").datepicker({
                                                            dateFormat: 'dd/mm/yy',
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            yearRange: "-100:+0",
                                                            beforeShow: function (textbox, instance) {
                                                                $('#ui-datepicker-div').css({
                                                                    position: 'initial',
                                                                    top: -20,
                                                                    left: 5
                                                                });
                                                                $('#bookingBoxdatefin_appel_urgent').append($('#ui-datepicker-div'));
                                                                $('#ui-datepicker-div').hide();
                                                            }
                                                        });
                                                        $('[data-datepicker]').click(function (e) {
                                                            var data = $(this).data('datepicker');
                                                            $(data).focus();
                                                        });
                                                    });
                                                </script>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>


                            {*<div class="form-group" style="margin-top: 10px;">
                            <div class="col-sm-12 controls" style="margin-top: 10px;">
                            <label>Actif</label>
                            <input id="actif_appel_urgent" name="actif_appel_urgent" class="mgr-10" type="checkbox" data-rel="switch" data-size="small" data-wrapper-class="blue" checked="">
                            </div>
                            </div>*}

                            <div style="margin-top:10px;" align="center">
                                <button type="button" name="btnconfirmAppelUrgence" id="btnconfirmAppelUrgence" class="btn vd_btn vd_bg-blue" onclick="set_appel_urgence();">Confirmer</button>
                                &nbsp;&nbsp;
                                <button type="button" name="btnannuleAppelUrgence" id="btnannuleAppelUrgence" onclick="$('#modalAppelUrgence').modal('hide');" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Appel Urgence -->

        {include file="modal_praticien_annule_rdv.tpl"}
        {include file="modal_praticien_initie_rdv.tpl"}


        {include file="modal_historique_rdv.tpl"}
        {include file="modal_fiche_rdv.tpl"}


        <!-- [DEBUT] Modal Prendre un rendez-vous Recurrent -->
        <div style="overflow-x: hidden;overflow-y: auto;z-index:2300;" class="modal fade in" id="modalPrendreRendezVousRecurrent" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVousRecurrent" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalPrendreRendezVousRecurrent"> Choisir un rendez-vous</h4>
                    </div>
                    <div class="modal-body" >
                        <div id='myfiltre_prendre_rendez_vous_recurrent' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10000;opacity:0.7;filter: alpha(opacity=70);'></div>

                        <div id='alert_message_avertissement_recurrent' style="z-index:2400;position:fixed;top:50%;left:0;right:0;margin: 0 auto;width:100%;display:none;">
                            <div class="col-sm-12">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8 liste-widget-global" >
                                    <div class="col-sm-12" id='txt_alert_message_avertissement_recurrent'></div>
                                    <div class="col-sm-12" role="group" aria-label="" align="center">
                                        <button id="btn_message_alert_ok_recurrent" name="btn_message_alert_ok_recurrent" onclick="fermer_message_alerte();" type="button" class="btn btn_confirm" style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>

                        <div id=div-rdv-recurrent">

                            <div id="attente_chargement_etape1_prendre_rendez_vous_recurrent"></div>
                            <form class="form-horizontal" action="" role="form" id="form_prendre_rendez_vous_recurrent" name="form_prendre_rendez_vous_recurrent">
                                <input type="hidden" value="planning" id="validation_rdv_recurrent" name='validation_rdv_recurrent' />
                                <input type="hidden" value="" id="selectcatprofession_prendre_rendez_vous_recurrent" name='selectcatprofession_prendre_rendez_vous_recurrent' />
                                <input type="hidden" value="" id="selectprofession_prendre_rendez_vous_recurrent" name='selectprofession_prendre_rendez_vous_recurrent' />
                                <input type="hidden" value="" id="consultation_prendre_rendez_vous_recurrent" name='consultation_prendre_rendez_vous_recurrent' />
                                <input type="hidden" value="" id="lieu_prendre_rendez_vous_recurrent" name='lieu_prendre_rendez_vous_recurrent' />
                                <input type="hidden" value="" id="praticien_prendre_rendez_vous_recurrent" name='praticien_prendre_rendez_vous_recurrent' />
                                <input type="hidden" value="" id="id_jour_recurrent" name='id_jour_recurrent' />
                                {*<div class="col-sm-12">
                                <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8">

                                <div id="divpraticien_prendre_rendez_vous_recurrent" class="col-sm-12 controls" style="display:none;">
                                <div class="label-wrapper">
                                <label class="control-label">
                                <b>Avec quel praticien ?</b>
                                </label>
                                </div>
                                <div class="vd_input-wrapper-modal">
                                <select name="praticien_prendre_rendez_vous_recurrent" id="praticien_prendre_rendez_vous_recurrent" ></select>
                                </div>
                                </div>

                                </div>
                                <div class="col-sm-2"></div>
                                </div>
                                </div>*}
                                <div id="divoption_prendre_rendez_vous_recurrent" class="col-sm-12 controls" style="margin:0px; padding:0px;">
                                    <div class="form-group">
                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez une date de début</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Choisissez une date de début" value="" name="datepicker_rdv_recurrent" id="datepicker_rdv_recurrent" class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker_rdv_recurrent">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdatepicker_rdv_recurrent" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker_rdv_recurrent").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepicker_rdv_recurrent').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                </script>
                                            {/literal}
                                        </div>

                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez un jour</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                <select name="jour_prendre_rendez_vous_recurrent" id="jour_prendre_rendez_vous_recurrent">
                                                    <option value="">Indifférent</option>
                                                    <option value="1">Lundi</option>
                                                    <option value="2">Mardi</option>
                                                    <option value="3">Mercredi</option>
                                                    <option value="4">Jeudi</option>
                                                    <option value="5">Vendredi</option>
                                                    <option value="6">Samedi</option>
                                                    <option value="0">Dimanche</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez un créneau horaire</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                <select name="horaire_prendre_rendez_vous_recurrent" id="horaire_prendre_rendez_vous_recurrent">
                                                    <option value="">Indifférent</option>
                                                    <option value="6-11">Matin</option>
                                                    <option value="12-21">Après-Midi</option>
                                                    <option value="6-7">06h/08h</option>
                                                    <option value="8-9">08h/10h</option>
                                                    <option value="10-11">10h/12h</option>
                                                    <option value="12-13">12h/14h</option>
                                                    <option value="14-15">14h/16h</option>
                                                    <option value="16-17">16h/18h</option>
                                                    <option value="18-19">18h/20h</option>
                                                    <option value="20-21">20h/22h</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <button id="btn_recherche_rdv_prendre_rendez_vous_recurrent" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="recherche_rdv_prendre_rendez_vous_recurrent();">Rechercher</button>
                                    <button id="btn_annuler_recherche_rdv_prendre_rendez_vous_recurrent" type="button" class="btn vd_btn vd_bg-grey" onclick="annuler_recherche_rdv_prendre_rendez_vous_recurrent();">Annuler</button>
                                </div>

                                <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous_recurrent" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                    <div id="divrdvdispoattente_prendre_rendez_vous_recurrent" style="padding:0;display:none;">
                                        <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                                    </div>
                                    <div id="divrdvdispo_prendre_rendez_vous_recurrent" style="display:none;"></div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <hr>
                                </div>
                                <div class="col-sm-12">
                                    <h3>Forcer sur une date et heure précise</h3>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <div class="form-group">
                                        <div class="col-sm-2 controls"></div>
                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez une date</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Choisissez une date" value="" name="datepicker_force_rdv_recurrent" id="datepicker_force_rdv_recurrent" class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker_force_rdv_recurrent">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdatepicker_force_rdv_recurrent" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker_force_rdv_recurrent").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepicker_force_rdv_recurrent').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                </script>
                                            {/literal}
                                        </div>

                                        <div class="col-sm-4">
                                            <label class="control-label">Heure</label>
                                            <div class="input-group bootstrap-timepicker">
                                                <input class="input-modal-date-left" type="text" id="heure_force_rdv_recurrent" name="heure_force_rdv_recurrent" value="">
                                                <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                            </div>

                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#heure_force_rdv_recurrent").clockpicker({
                                                        placement: 'bottom',
                                                        autoclose: true
                                                    });
                                                    $("#heure_force_rdv_recurrent").mask("99:99");
                                                });

                                            </script>

                                        </div>
                                        <div class="col-sm-2 controls"></div>
                                    </div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <button id="btn_valider_force_rdv_recurrent" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="enregistrement_forcer_rdv_recurrent();">Valider</button>
                                    <button id="btn_annuler_force_rdv_recurrent" type="button" class="btn vd_btn vd_bg-grey" onclick="annuler_recherche_rdv_prendre_rendez_vous_recurrent();">Annuler</button>
                                </div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Prendre un rendez-vous Recurrent-->
        {include file="modal_proposition_rdv.tpl"}

        <!-- [DEBUT] Modal Prendre un rendez-vous via l'algo -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalPrendreRendezVousAlgo" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVousAlgo" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalPrendreRendezVousAlgo"> Choisir un rendez-vous</h4>
                    </div>
                    <div class="modal-body" >
                        <div id='myfiltre_prendre_rendez_vous_algo' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10000;opacity:0.7;filter: alpha(opacity=70);'></div>

                        <div id='alert_message_avertissement_algo' style="z-index:2400;position:fixed;top:50%;left:0;right:0;margin: 0 auto;width:100%;display:none;">
                            <div class="col-sm-12">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8 liste-widget-global" >
                                    <div class="col-sm-12" id='txt_alert_message_avertissement_algo'></div>
                                    <div class="col-sm-12" role="group" aria-label="" align="center">
                                        <button id="btn_message_alert_ok_algo" name="btn_message_alert_ok_algo" onclick="fermer_message_alerte();" type="button" class="btn btn_confirm" style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>

                        <div id=div-rdv-recurrent">

                            <div id="attente_chargement_etape1_prendre_rendez_vous_algo"></div>
                            <form class="form-horizontal" action="" role="form" id="form_prendre_rendez_vous_algo" name="form_prendre_rendez_vous_algo">
                                <input type="hidden" value="planning" id="validation_rdv_algo" name='validation_rdv_algo' />
                                <input type="hidden" value="" id="selectcatprofession_prendre_rendez_vous_algo" name='selectcatprofession_prendre_rendez_vous_algo' />
                                <input type="hidden" value="" id="selectprofession_prendre_rendez_vous_algo" name='selectprofession_prendre_rendez_vous_algo' />
                                <input type="hidden" value="" id="consultation_prendre_rendez_vous_algo" name='consultation_prendre_rendez_vous_algo' />
                                <input type="hidden" value="" id="lieu_prendre_rendez_vous_algo" name='lieu_prendre_rendez_vous_algo' />
                                <input type="hidden" value="" id="praticien_prendre_rendez_vous_algo" name='praticien_prendre_rendez_vous_algo' />
                                <input type="hidden" value="" id="patient_prendre_rendez_vous_algo" name='patient_prendre_rendez_vous_algo' />

                                <div id="divoption_prendre_rendez_vous_algo" class="col-sm-12 controls" style="margin:0px; padding:0px;">
                                    <div class="form-group">
                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez une date de début</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Choisissez une date de début" value="" name="datepicker_rdv_algo" id="datepicker_rdv_algo" class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker_rdv_algo">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdatepicker_rdv_algo" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker_rdv_algo").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepicker_rdv_algo').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                </script>
                                            {/literal}
                                        </div>

                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez un jour</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                <select name="jour_prendre_rendez_vous_algo" id="jour_prendre_rendez_vous_algo">
                                                    <option value="">Indifférent</option>
                                                    <option value="1">Lundi</option>
                                                    <option value="2">Mardi</option>
                                                    <option value="3">Mercredi</option>
                                                    <option value="4">Jeudi</option>
                                                    <option value="5">Vendredi</option>
                                                    <option value="6">Samedi</option>
                                                    <option value="0">Dimanche</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez un créneau horaire</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                <select name="horaire_prendre_rendez_vous_algo" id="horaire_prendre_rendez_vous_algo">
                                                    <option value="">Indifférent</option>
                                                    <option value="6-11">Matin</option>
                                                    <option value="12-21">Après-Midi</option>
                                                    <option value="6-7">06h/08h</option>
                                                    <option value="8-9">08h/10h</option>
                                                    <option value="10-11">10h/12h</option>
                                                    <option value="12-13">12h/14h</option>
                                                    <option value="14-15">14h/16h</option>
                                                    <option value="16-17">16h/18h</option>
                                                    <option value="18-19">18h/20h</option>
                                                    <option value="20-21">20h/22h</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <button id="btn_recherche_rdv_prendre_rendez_vous_algo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="recherche_rdv_prendre_rendez_vous_algo();">Rechercher</button>
                                    <button id="btn_annuler_recherche_rdv_prendre_rendez_vous_algo" type="button" class="btn vd_btn vd_bg-grey" onclick="annuler_recherche_rdv_prendre_rendez_vous_algo();">Annuler</button>
                                </div>

                                <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous_algo" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                    <div id="divrdvdispoattente_prendre_rendez_vous_algo" style="padding:0;display:none;">
                                        <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                                    </div>
                                    <div id="divrdvdispo_prendre_rendez_vous_algo" style="display:none;"></div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <hr>
                                </div>
                                <div class="col-sm-12">
                                    <h3>Forcer sur une date et heure précise</h3>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <div class="form-group">
                                        <div class="col-sm-2 controls"></div>
                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez une date</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Choisissez une date" value="" name="datepicker_force_rdv_algo" id="datepicker_force_rdv_algo" class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker_force_rdv_algo">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdatepicker_force_rdv_algo" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker_force_rdv_algo").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepicker_force_rdv_algo').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                </script>
                                            {/literal}
                                        </div>

                                        <div class="col-sm-4">
                                            <label class="control-label">Heure</label>
                                            <div class="input-group bootstrap-timepicker">
                                                <input class="input-modal-date-left" type="text" id="heure_force_rdv_algo" name="heure_force_rdv_algo" value="">
                                                <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                            </div>

                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#heure_force_rdv_algo").clockpicker({
                                                        placement: 'bottom',
                                                        autoclose: true
                                                    });
                                                    $("#heure_force_rdv_algo").mask("99:99");
                                                });

                                            </script>

                                        </div>
                                        <div class="col-sm-2 controls"></div>
                                    </div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <button id="btn_valider_force_rdv_algo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="enregistrement_forcer_rdv_algo();">Valider</button>
                                    <button id="btn_annuler_force_rdv_algo" type="button" class="btn vd_btn vd_bg-grey" onclick="annuler_recherche_rdv_prendre_rendez_vous_algo();">Annuler</button>
                                </div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Prendre un rendez-vous via l'algo-->


        <!-- [DEBUT] Modal Demande RDV au patient envoi lien -->
        <div style="overflow-x: hidden;overflow-y: auto;z-index: 2100;" class="modal fade in" id="modalDemandeRDVPatient" tabindex="-1"
             role="dialog" aria-labelledby="LabelmodalDemandeRDVPatient" aria-hidden="false" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                        </button>
                        <h4 class="modal-title" id="LabelmodalDemandeRDVPatient">Initier un RDV pour le patient : <span
                                id="nompatient_demande_rdv"></span></h4>
                    </div>


                    <div id="div_body_envoi_demande_rdv_patient" class="modal-body">
                        <div id="div_message_envoi_demande_rdv_patient" class="col-md-12" style="text-align: center; display:none;"></div>
                        <div class="clearfix"></div>
                        <div>
                            <form class="form-horizontal" action="#" role="form" id="form_modal_demande_rdv_patient" name="form_modal_demande_rdv_patient" autocomplete="new-password">
                                <input type="hidden" value="" id='idpatient_demande_rdv' name='idpatient_demande_rdv'/>
                                <input type="hidden" value="1" id='firstinit_demande_rdv_patient' name='firstinit_demande_rdv_patient'/>
                                <input type="hidden" value="" id='precharge_cat_profession_demande_rdv_patient' name='precharge_cat_profession_demande_rdv_patient'/>
                                <input type="hidden" value="" id='precharge_profession_demande_rdv_patient' name='precharge_profession_demande_rdv_patient'/>
                                <input type="hidden" value="" id='precharge_motif_demande_rdv_patient' name='precharge_motif_demande_rdv_patient'/>
                                <input type="hidden" value="" id='precharge_lieu_demande_rdv_patient' name='precharge_lieu_demande_rdv_patient'/>
                                <input type="hidden" value="" id='precharge_praticien_demande_rdv_patient' name='precharge_praticien_demande_rdv_patient'/>
                                <div class="col-md-12" style="text-align: center">
                                    <div class="form-group">
                                        <div class="col-sm-6 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Début de validité du lien : </b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Date de début de validité"
                                                       name="date_debut_demande_rdv_patient" id="date_debut_demande_rdv_patient"
                                                       value="" class="required input-widget-date-left" required
                                                       style="border-color: red;">
                                                <span class="input-group-addon input-widget-date-right"
                                                      id="datepicker-icon-trigger"
                                                      data-datepicker="#id_date_debut_demande_rdv_patient">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdate_debut_demande_rdv_patient"
                                                 style="position: absolute;z-index: 1;"></div>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#date_debut_demande_rdv_patient").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        yearRange: "c-0:c+10",
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdate_debut_demande_rdv_patient').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });
                                                });
                                            </script>
                                        {/literal}
                                        <div class="col-sm-6 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Fin de validité du lien : </b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Date de fin de validité"
                                                       name="date_fin_demande_rdv_patient" id="date_fin_demande_rdv_patient"
                                                       value="" class="required input-widget-date-left" required
                                                       style="border-color: red;">
                                                <span class="input-group-addon input-widget-date-right"
                                                      id="datepicker-icon-trigger"
                                                      data-datepicker="#id_date_fin_demande_rdv_patient">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdate_fin_demande_rdv_patient"
                                                 style="position: absolute;z-index: 1;"></div>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#date_fin_demande_rdv_patient").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        yearRange: "c-0:c+10",
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdate_fin_demande_rdv_patient').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
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
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-sm-6 controls" style="display: none;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Type d'utilisation : </b>
                                                </label>
                                            </div>
                                            <div style="margin:0px;padding:0px;">
                                                <select name="type_demande_rdv_patient" id="type_demande_rdv_patient">
                                                    <option value="unique">Unique</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>A partir de combien de jour proposer un RDV ? </b>
                                                </label>
                                            </div>
                                            <div>
                                                <select name="dans_combien_demande_rdv_patient" id="dans_combien_demande_rdv_patient">
                                                    <option value="0" selected>
                                                        Aujourd'hui
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
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-sm-6 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Proposer un RDV à partir du : </b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Proposer un RDV à partir du :"
                                                       name="date_a_partir_demande_rdv_patient"
                                                       id="date_a_partir_demande_rdv_patient" value=""
                                                       class="required input-widget-date-left" required
                                                       style="border-color: red;">
                                                <span class="input-group-addon input-widget-date-right"
                                                      id="datepicker-icon-trigger"
                                                      data-datepicker="#id_date_a_partir_demande_rdv_patient">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdate_a_partir_demande_rdv_patient"
                                                 style="position: absolute;z-index: 1;"></div>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#date_a_partir_demande_rdv_patient").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        yearRange: "c-0:c+10",
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdate_a_partir_demande_rdv_patient').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });
                                                });
                                            </script>
                                        {/literal}
                                        <div class="col-sm-6 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Jusqu'au : </b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Jusqu'au :"
                                                       name="date_jusqu_a_demande_rdv_patient"
                                                       id="date_jusqu_a_demande_rdv_patient" value=""
                                                       class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right"
                                                      id="datepicker-icon-trigger"
                                                      data-datepicker="#id_date_jusqu_a_demande_rdv_patient">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdate_jusqu_a_demande_rdv_patient"
                                                 style="position: absolute;z-index: 1;"></div>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#date_jusqu_a_demande_rdv_patient").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        yearRange: "c-0:c+10",
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdate_jusqu_a_demande_rdv_patient').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
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
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <div id="divcatprofession_demande_rdv_patient" class="col-sm-12 controls" style='display:none;'>
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quel est le professionnel de santé ?</b>
                                                    </label>
                                                </div>
                                                <div >
                                                    <select name="selectcatprofession_demande_rdv_patient" id="selectcatprofession_demande_rdv_patient"></select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div id="divprofession_demande_rdv_patient" class="col-sm-12 controls" style='display:none;'>
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quelle est la spécialité ?</b>
                                                    </label>
                                                </div>
                                                <div >
                                                    <select name="selectprofession_demande_rdv_patient" id="selectprofession_demande_rdv_patient"></select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div id="divmotif_demande_rdv_patient" class="col-sm-12 controls" style="display:none;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Quel est le motif de la consultation ?</b>
                                                </label>
                                            </div>
                                            <div >
                                                <select name="consultation_demande_rdv_patient" id="consultation_demande_rdv_patient"></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-6">
                                            <div id="divlieu_demande_rdv_patient" class="col-sm-12 controls" style="display:none;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quel est le lieu du rendez-vous ?</b>
                                                    </label>
                                                </div>
                                                <div >
                                                    <select name="lieu_demande_rdv_patient" id="lieu_demande_rdv_patient"></select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div id="divpraticien_demande_rdv_patient" class="col-sm-12 controls" style="display:none;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Avec quel praticien ?</b>
                                                    </label>
                                                </div>
                                                <div >
                                                    <select name="praticien_demande_rdv_patient" id="praticien_demande_rdv_patient" ></select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group" id="div_teleconsult_demande_rdv_patient">
                                        <div class="col-sm-6 controls">
                                            <div class="label-wrapper-modal" style="float: left;">
                                                <label class="control-label">RDV en Téléconsultation :</label>
                                            </div>
                                            <div class="controls" >
                                                <select id="teleconsult_demande_rdv_patient" name="teleconsult_demande_rdv_patient">
                                                    <option value="Y">Oui</option>
                                                    <option value="N" selected>Non</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 controls" id="div_montant_teleconsult_demande_rdv_patient" style="display: none">
                                            <div class="label-wrapper-modal" >
                                                <label class="control-label">Montant de la téléconsultation :</label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" id="montant_teleconsult_demande_rdv_patient" name="montant_teleconsult_demande_rdv_patient" >
                                                <span class="input-group-addon">€</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">


                                    <div class="col-sm-12 controls" style="margin-top: 15px; margin-bottom: 15px;">
                                        <div class="col-sm-12">
                                            <label class="control-label" style="font-size: 16px;">Comment doit être prévenu le patient ?</label>
                                        </div>

                                        <div class="vd_checkbox checkbox-success col-sm-1" >
                                            <input type="checkbox" class="" name="id_check_mode_demande[]" value="mail" checked="checked" id="id_check_mode_demande_mail" title="" alt="">
                                            <label title="" style="text-align: left;" for="id_check_mode_demande_mail">Mail</label>

                                        </div>
                                        <div class="col-sm-6">
                                            <input type="email" name="check_mail_demande" id="check_mail_demande" placeholder="Email du patient">
                                        </div>
                                        <div class="col-sm-5"></div>
                                        <div class="col-sm-12" style="margin: 5px;"></div>
                                        <div class="vd_checkbox checkbox-success col-sm-1">
                                            <input type="checkbox" class="" name="id_check_mode_demande[]" value="sms" checked="checked" id="id_check_mode_demande_sms" title="" alt="">
                                            <label title="" style="text-align: left;" for="id_check_mode_demande_sms">SMS</label>

                                        </div>
                                        <div class="col-sm-6">
                                            <input type="hidden" name="check_sms_demande_indicatif" id="check_sms_demande_indicatif" value="{$num_indicatif_structure}" />
                                            <input type="text" placeholder="Téléphone mobile du patient" name="check_sms_demande" id="check_sms_demande" value=""  />
                                            {literal}
                                                <script type="text/javascript">
                                                    $(document).ready(function () {
                                                        $("#check_sms_demande").intlTelInput({
                                                            preferredCountries: ["fr", "be", "ch"],
                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                            utilsScript: "js/utils.js"
                                                        });
                                                        if ($("#check_sms_demande_indicatif").val() === "41") {
                                                            $("#check_sms_demande").inputmask("999 999 99 99");
                                                        } else if ($("#check_sms_demande_indicatif").val() === "33") {
                                                            $("#check_sms_demande").inputmask("99 99 99 99 99");
                                                        }

                                                        $("#check_sms_demande").on("keyup change", function () {
                                                            var countryData = $("#check_sms_demande").intlTelInput("getSelectedCountryData");
                                                            $("#check_sms_demande_indicatif").val(countryData.dialCode);
                                                        });

                                                        $("#check_sms_demande").on("countrychange", function (e, countryData) {
                                                            $("#check_sms_demande_indicatif").val(countryData.dialCode);
                                                            var idpays = countryData.iso2;
                                                            if (idpays === "fr") {
                                                                $("#check_sms_demande").inputmask("99 99 99 99 99");
                                                            } else if (idpays === "ch") {
                                                                $("#check_sms_demande").inputmask("999 999 99 99");
                                                            }
                                                        });
                                                    });
                                                </script>
                                            {/literal}
                                        </div>
                                        <div class="col-sm-5"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-md-12" style="text-align: center">
                                    <button type="submit" name="btn_valide_envoi_demande_rdv_patient"
                                            id="btn_valide_envoi_demande_rdv_patient" class="btn vd_btn vd_bg-color"><span
                                            class="menu-icon"></span> Valider et Envoyer
                                    </button>&nbsp;&nbsp;
                                    <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey">
                                        <span class="menu-icon"></span> Annuler
                                    </button>
                                </div>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                        <div id="div_btn_fermer_envoi_demande_rdv_patient" class="col-md-12"
                             style="text-align: center; display:none;">
                            <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey"><span
                                    class="menu-icon"></span> Fermer
                            </button>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Demande RDV au patient envoi lien  -->


        <!-- [DEBUT] Modal Plan de traitement patient -->
        <div style="overflow-x: hidden;overflow-y: auto;z-index:2100;" class="modal fade in" id="modalPlanTraitementPatient" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPlanTraitementPatient" aria-hidden="false" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalPlanTraitementPatient">Plan de traitement pour le patient : <span id="nompatient_plan_traitement"></span></h4>
                    </div>
                    <div class="modal-body" >
                        <input type="hidden" value="" id='cookie_plan_traitement' name='cookie_plan_traitement' />
                        <input type="hidden" value="" id='idpatient_plan_traitement' name='idpatient_plan_traitement' />
                        <input type="hidden" value="" id='idpere_plan_traitement' name='idpere_plan_traitement' />
                        <div id="wizard-plan-traitement" class="form-wizard">
                            <div class="progress progress active">
                                <div class="progress-bar progress-bar-info" > </div>
                            </div>
                            <ul>
                                <li><a href="#tabPlanTraitementPatient1" data-toggle="tab">
                                        <div id="tabptpbunique1" class="menu-icon">&nbsp;</div>
                                        Sélection des informations </a></li>
                                <li><a href="#tabPlanTraitementPatient2" data-toggle="tab">
                                        <div id="tabptpbunique2" class="menu-icon">&nbsp;</div>
                                        Plan de traitement </a></li>
                            </ul>
                            <div class="tab-content no-bd" style="padding-top: 0px;">
                                <div class="tab-pane" id="tabPlanTraitementPatient1">
                                    <div id="attente_chargement_etape1_plan_traitement" style='display:none;'></div>

                                    <div id="divprofil_sauvegarder_plan_traitement" class="col-sm-12 controls" style='display:none;'>
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Charger un profil d'un plan de traitement sauvegardé :</b>
                                            </label>
                                        </div>
                                        <div >
                                            <select name="selectprofil_sauvegarder_plan_traitement" id="selectprofil_sauvegarder_plan_traitement"></select>
                                        </div>
                                        <hr/>
                                    </div>


                                    <div  id="div_info_principale_plan_traitement">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <div class="col-sm-6">

                                                    <div id="divcatprofession_plan_traitement" class="col-sm-12 controls" style='display:none;'>
                                                        <div class="label-wrapper">
                                                            <label class="control-label">
                                                                <b>Quel est le professionnel de santé ?</b>
                                                            </label>
                                                        </div>
                                                        <div >
                                                            <select name="selectcatprofession_plan_traitement" id="selectcatprofession_plan_traitement"></select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div id="divprofession_plan_traitement" class="col-sm-12 controls" style='display:none;'>
                                                        <div class="label-wrapper">
                                                            <label class="control-label">
                                                                <b>Quelle est la spécialité ?</b>
                                                            </label>
                                                        </div>
                                                        <div >
                                                            <select name="selectprofession_plan_traitement" id="selectprofession_plan_traitement"></select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <div id="divmotif_plan_traitement" class="col-sm-12 controls" style="display:none;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Quel est le motif de la consultation ?</b>
                                                        </label>
                                                    </div>
                                                    <div >
                                                        <select name="consultation_plan_traitement" id="consultation_plan_traitement"></select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <div id="divlieu_plan_traitement" class="col-sm-12 controls" style="display:none;">
                                                        <div class="label-wrapper">
                                                            <label class="control-label">
                                                                <b>Quel est le lieu du rendez-vous ?</b>
                                                            </label>
                                                        </div>
                                                        <div >
                                                            <select name="lieu_plan_traitement" id="lieu_plan_traitement"></select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div id="divpraticien_plan_traitement" class="col-sm-12 controls" style="display:none;">
                                                        <div class="label-wrapper">
                                                            <label class="control-label">
                                                                <b>Avec quel praticien ?</b>
                                                            </label>
                                                        </div>
                                                        <div >
                                                            <select name="praticien_plan_traitement" id="praticien_plan_traitement" ></select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="divoption_plan_traitement" class="col-sm-12 controls" style="margin:0px; padding:0px;margin-top: 10px;display:none;">
                                            <div id="div_date_de_depart" class="col-sm-12 controls">
                                                <label class="control-label"><b>Choisissez la date de départ :</b></label>
                                                <div>
                                                    <div class="vd_radio radio-success" style="margin-top: 5px;">
                                                        <input type="radio" name="radiochoixdatedepart" value="nbsemaine" id="id_radio_nb_jour_plan_traitement" checked="checked" >
                                                        <label class="col-sm-3" for="id_radio_nb_jour_plan_traitement" style="float: left;">Un nb. de semaine</label>
                                                        <div class="col-sm-4 input-group">
                                                            <select name="nb_jour_plan_traitement" id="nb_jour_plan_traitement">
                                                                <option value="1" selected>1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="vd_radio radio-success" style="margin-top: 5px;">
                                                        <input type="radio" name="radiochoixdatedepart" value="unedate" id="id_radio_date_debut_plan_traitement" style="float: left;">
                                                        <label class="col-sm-3" for="id_radio_date_debut_plan_traitement" style="float: left;">Une date</label>
                                                        <div class="col-sm-4 input-group">
                                                            <input type="text" placeholder="" name="date_debut_plan_traitement" id="date_debut_plan_traitement" value="" class="input-widget-date-left">
                                                            <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#iddate_debut_plan_traitement"><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                        <div id="bookingBoxdate_debut_plan_traitement" style="position: absolute;z-index: 1;"></div>
                                                        {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    $("#date_debut_plan_traitement").datepicker({
                                                                        dateFormat: 'dd/mm/yy',
                                                                        changeMonth: true,
                                                                        changeYear: true,
                                                                        beforeShow: function (textbox, instance) {
                                                                            $('#ui-datepicker-div').css({
                                                                                position: 'initial',
                                                                                top: -20,
                                                                                left: 5
                                                                            });
                                                                            $('#bookingBoxdate_debut_plan_traitement').append($('#ui-datepicker-div'));
                                                                            $('#ui-datepicker-div').hide();
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
                                            </div>
                                            <div id="div_date_de_depart" class="col-sm-12 controls" style="display: none;">
                                                <div class="col-sm-6 controls" style="margin:0px;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Un jour</b>
                                                        </label>
                                                    </div>
                                                    <div  style="margin:0px;padding:0px;">
                                                        <select name="jour_plan_traitement" id="jour_plan_traitement">
                                                            <option value="">Indifférent</option>
                                                            <option value="1">Lundi</option>
                                                            <option value="2">Mardi</option>
                                                            <option value="3">Mercredi</option>
                                                            <option value="4">Jeudi</option>
                                                            <option value="5">Vendredi</option>
                                                            <option value="6">Samedi</option>
                                                            <option value="0">Dimanche</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 controls" style="margin:0px;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Un créneau horaire</b>
                                                        </label>
                                                    </div>
                                                    <div style="margin:0px;padding:0px;">
                                                        <select name="horaire_plan_traitement" id="horaire_plan_traitement">
                                                            <option value="">Indifférent</option>
                                                            <option value="6-11">Matin</option>
                                                            <option value="12-21">Après-Midi</option>
                                                            <option value="6-7">06h/08h</option>
                                                            <option value="8-9">08h/10h</option>
                                                            <option value="10-11">10h/12h</option>
                                                            <option value="12-13">12h/14h</option>
                                                            <option value="14-15">14h/16h</option>
                                                            <option value="16-17">16h/18h</option>
                                                            <option value="18-19">18h/20h</option>
                                                            <option value="20-21">20h/22h</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" id="div_recurrence_plan_traitement" style="margin:0px; padding:0px;margin-top: 10px;display:none;">
                                            <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                    <h3>Paramètres de récurrence</h3>

                                                    <div class="col-sm-12 controls">
                                                        <div class="form-group">
                                                            <div class="col-sm-6 controls">
                                                                <label class="control-label" style="float: left;"><b>Nombre d'occurence(s) </b></label>
                                                                <div class="controls" >
                                                                    <input type="number" name="recurrent_occurence_plan_traitement" id="recurrent_occurence_plan_traitement" min="2" value="2">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 controls">
                                                                <label class="control-label" style="float: left;"><b>espacé de </b></label>
                                                                <div style="display: inline-flex;">
                                                                    <input type="number" name="recurrent_nb_repete_plan_traitement" id="recurrent_nb_repete_plan_traitement" min="1" value="1">
                                                                    <select id="recurrent_select_repete_plan_traitement" >
                                                                        <option value="jour">Jour</option>
                                                                        <option value="semaine" selected >Semaine</option>
                                                                        <option value="mois">Mois</option>
                                                                        <option value="annee">Année</option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                                            <button id="btn_suivant_plan_traitement" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="generer_plan_traitement();">Suivant</button>&nbsp;
                                            <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                        </div>
                                    </div>
                                    <div id="div_charger_plan_traitement" style="display: none;">
                                        <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                                            <button id="btn_charger_plan_traitement" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="charger_plan_traitement();">Charger</button>&nbsp;
                                            <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane" id="tabPlanTraitementPatient2">

                                    <div id="div_liste_rdv_generer_plan_traitement" class="col-sm-12 controls" style="margin-bottom: 25px;text-align: center;padding-top: 20px;"></div>

                                    <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                                        <button id="btn_retour_plan_traitement" type="button" class="btn vd_btn vd_bg-grey vd_white" onclick="retour_etape1_plan_traitement();"><i class="fa fa-chevron-circle-left"></i>&nbsp;Retour</button>&nbsp;
                                        <button id="btn_valider_plan_traitement" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="$('#modalPlanTraitementSauvegarde').modal('show');"><i class="fa fa-check-circle"></i>&nbsp;Valider</button>&nbsp;
                                        <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                                    </div>



                                </div>
                            </div>
                            <div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Plan de traitement patient -->


        <!-- [DEBUT] Modal Plan de traitement patient RDV supplementaire-->
        <div style="overflow-x: hidden;overflow-y: auto;z-index:2200;" class="modal fade in" id="modalPlanTraitementPatientSupplementaire" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPlanTraitementPatientSupplementaire" aria-hidden="false" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">

                        <h4 class="modal-title" id="LabelmodalPlanTraitementPatientSupplementaire">Ajouter un RDV au plan de traitement</h4>
                    </div>
                    <div class="modal-body" >
                        <input type="hidden" value="" id='idpatient_plan_traitement_supplementaire' name='idpatient_plan_traitement_supplementaire' />
                        <input type="hidden" value="" id='idlejour' name='idlejour' />
                        <input type="hidden" value="" id='idlejoursimple' name='idlejoursimple' />
                        <input type="hidden" value="" id='iddivsurcharge' name='iddivsurcharge' />
                        <input type="hidden" value="" id='numoccurencepere' name='numoccurencepere' />
                        <input type="hidden" value="" id='tridpere' name='tridpere' />

                        <div id="attente_chargement_etape1_plan_traitement_supplementaire" style='display:none;'></div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div class="col-sm-6">

                                    <div id="divcatprofession_plan_traitement_supplementaire" class="col-sm-12 controls" style='display:none;'>
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quel est le professionnel de santé ?</b>
                                            </label>
                                        </div>
                                        <div >
                                            <select name="selectcatprofession_plan_traitement_supplementaire" id="selectcatprofession_plan_traitement_supplementaire"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="divprofession_plan_traitement_supplementaire" class="col-sm-12 controls" style='display:none;'>
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quelle est la spécialité ?</b>
                                            </label>
                                        </div>
                                        <div >
                                            <select name="selectprofession_plan_traitement_supplementaire" id="selectprofession_plan_traitement_supplementaire"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div id="divmotif_plan_traitement_supplementaire" class="col-sm-12 controls" style="display:none;">
                                    <div class="label-wrapper">
                                        <label class="control-label">
                                            <b>Quel est le motif de la consultation ?</b>
                                        </label>
                                    </div>
                                    <div >
                                        <select name="consultation_plan_traitement_supplementaire" id="consultation_plan_traitement_supplementaire"></select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <div id="divlieu_plan_traitement_supplementaire" class="col-sm-12 controls" style="display:none;">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quel est le lieu du rendez-vous ?</b>
                                            </label>
                                        </div>
                                        <div >
                                            <select name="lieu_plan_traitement_supplementaire" id="lieu_plan_traitement_supplementaire"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div id="divpraticien_plan_traitement_supplementaire" class="col-sm-12 controls" style="display:none;">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Avec quel praticien ?</b>
                                            </label>
                                        </div>
                                        <div >
                                            <select name="praticien_plan_traitement_supplementaire" id="praticien_plan_traitement_supplementaire" ></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-12 controls" id="div_recurrence_plan_traitement_supplementaire" style="margin:0px; padding:0px;margin-top: 10px;display:none;">
                            <div class="form-group">
                                <div class="col-sm-12 controls">
                                    <h3>En fonction du RDV suivant : <span id="intituler_rdv_choisi"></span></h3>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-6 controls">
                                    <label class="control-label" style="float: left;"><b>Souhaitez vous ajouter le RDV avant ou après ? </b></label>
                                    <select id="select_quand_ajouter_plan_traitement_supplementaire">
                                        <option value="avant" selected>Avant</option>
                                        <option value="apres">Après</option>
                                    </select>
                                </div>
                                <div class="col-sm-6 controls">
                                    <label class="control-label" style="float: left;"><b>Définir la temps de décalage : </b></label>
                                    <div style="display: inline-flex;">
                                        <input type="number" name="decalage_plan_traitement_supplementaire" id="decalage_plan_traitement_supplementaire" min="1" value="1">
                                        <select id="select_decalage_plan_traitement_supplementaire">
                                            <option value="minute">Minute(s)</option>
                                            <option value="heure" selected >Heure(s)</option>
                                            <option value="jour">Jour(s)</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                            <button id="btn_valider_plan_traitement_supplementaire" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="generer_plan_traitement_supplementaire();">Valider</button>&nbsp;
                            <button id="btn_annuler_plan_traitement_supplementaire" type="button"  class="btn vd_btn vd_bg-grey" onclick="retour_plan_traitement();"><span class="menu-icon"></span> Annuler</button>
                        </div>
                        <div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Plan de traitement patient RDV supplementaire -->


        <!-- [DEBUT] Modal Plan de traitement sauvegarde -->
        <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalPlanTraitementSauvegarde" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPlanTraitementSauvegarde" aria-hidden="false" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">

                        <h4 class="modal-title" id="LabelmodalPlanTraitementSauvegarde">Valider le plan de traitement</h4>
                    </div>
                    <div class="modal-body" >
                        {*<h3>Si vous souhaitez sauvegarder ce plan de traitement, veuillez saisir un libellé ci dessous :</h3>*}
                        <h3>Confirmez vous la validation de votre plan de traitement ?</h3>

                        <div id="attente_sauvegarde_plan_traitement" style='display:none;'></div>
                        <div id="info_sauvegarde_plan_traitement">
                            <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                                <label for="libelle_sauvegarde_plan_traitement">Libellé de sauvegarde :</label>
                                <input type="text" name="libelle_sauvegarde_plan_traitement" id="libelle_sauvegarde_plan_traitement" placeholder="Libellé">
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                                <button id="btn_valider_plan_traitement_supplementaire" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="valider_plan_traitement();">Valider</button>&nbsp;
                                <button id="btn_annuler_plan_traitement_supplementaire" type="button"  class="btn vd_btn vd_bg-grey" onclick="$('#modalPlanTraitementSauvegarde').modal('hide');"><span class="menu-icon"></span> Annuler</button>
                            </div>
                        </div>
                        <div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [FIN] Modal Plan de traitement sauvegarde -->


        <!-- [DEBUT] Modal modifier RDV plan de traitement-->
        <div style="overflow-x: hidden;overflow-y: auto;z-index:2200;" class="modal fade in" id="modalModifierRDVPlanTraitement" tabindex="-1" role="dialog" aria-labelledby="LabelmodalModifierRDVPlanTraitement" aria-hidden="false">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header vd_bg-blue vd_white">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                        <h4 class="modal-title" id="LabelmodalModifierRDVPlanTraitement"> Choisir un autre rendez-vous</h4>
                    </div>
                    <div class="modal-body" >
                        <div id='myfiltre_prendre_rendez_vous_recurrent' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10000;opacity:0.7;filter: alpha(opacity=70);'></div>

                        <div id='alert_message_avertissement_recurrent' style="z-index:2400;position:fixed;top:50%;left:0;right:0;margin: 0 auto;width:100%;display:none;">
                            <div class="col-sm-12">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8 liste-widget-global" >
                                    <div class="col-sm-12" id='txt_alert_message_avertissement_recurrent'></div>
                                    <div class="col-sm-12" role="group" aria-label="" align="center">
                                        <button id="btn_message_alert_ok_recurrent" name="btn_message_alert_ok_recurrent" onclick="fermer_message_alerte();" type="button" class="btn btn_confirm" style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>

                        <div id=div-rdv-recurrent">

                            <div id="attente_chargement_etape1_prendre_rendez_vous_recurrent"></div>
                            <form class="form-horizontal" action="" role="form" id="form_prendre_rendez_vous_modif_plan_traitement" name="form_prendre_rendez_vous_modif_plan_traitement">
                                <input type="hidden" value="planning" id="validation_rdv_modif_plan_traitement" name='validation_rdv_modif_plan_traitement' />
                                <input type="hidden" value="" id="selectcatprofession_prendre_rendez_vous_modif_plan_traitement" name='selectcatprofession_prendre_rendez_vous_modif_plan_traitement' />
                                <input type="hidden" value="" id="selectprofession_prendre_rendez_vous_modif_plan_traitement" name='selectprofession_prendre_rendez_vous_modif_plan_traitement' />
                                <input type="hidden" value="" id="consultation_prendre_rendez_vous_modif_plan_traitement" name='consultation_prendre_rendez_vous_modif_plan_traitement' />
                                <input type="hidden" value="" id="lieu_prendre_rendez_vous_modif_plan_traitement" name='lieu_prendre_rendez_vous_modif_plan_traitement' />
                                <input type="hidden" value="" id="praticien_prendre_rendez_vous_modif_plan_traitement" name='praticien_prendre_rendez_vous_modif_plan_traitement' />
                                <input type="hidden" value="" id="id_jour_modif_plan_traitement" name='id_jour_modif_plan_traitement' />
                                <input type="hidden" value="" id="id_div_modif_plan_traitement" name='id_div_modif_plan_traitement' />
                                <input type="hidden" value="" id="provenance_modif_plan_traitement" name='provenance_modif_plan_traitement' />
                                {*<div class="col-sm-12">
                                <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8">

                                <div id="divpraticien_prendre_rendez_vous_recurrent" class="col-sm-12 controls" style="display:none;">
                                <div class="label-wrapper">
                                <label class="control-label">
                                <b>Avec quel praticien ?</b>
                                </label>
                                </div>
                                <div class="vd_input-wrapper-modal">
                                <select name="praticien_prendre_rendez_vous_recurrent" id="praticien_prendre_rendez_vous_recurrent" ></select>
                                </div>
                                </div>

                                </div>
                                <div class="col-sm-2"></div>
                                </div>
                                </div>*}
                                <div id="divoption_prendre_rendez_vous_modif_plan_traitement" class="col-sm-12 controls" style="margin:0px; padding:0px;">
                                    <div class="form-group">
                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez une date de début</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Choisissez une date de début" value="" name="datepicker_rdv_modif_plan_traitement" id="datepicker_rdv_modif_plan_traitement" class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker_rdv_modif_plan_traitement">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                            </div>
                                            <div id="bookingBoxdatepicker_rdv_modif_plan_traitement" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker_rdv_modif_plan_traitement").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepicker_rdv_modif_plan_traitement').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                </script>
                                            {/literal}
                                        </div>

                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez un jour</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                <select name="jour_prendre_rendez_vous_modif_plan_traitement" id="jour_prendre_rendez_vous_modif_plan_traitement">
                                                    <option value="">Indifférent</option>
                                                    <option value="1">Lundi</option>
                                                    <option value="2">Mardi</option>
                                                    <option value="3">Mercredi</option>
                                                    <option value="4">Jeudi</option>
                                                    <option value="5">Vendredi</option>
                                                    <option value="6">Samedi</option>
                                                    <option value="0">Dimanche</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez un créneau horaire</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                <select name="horaire_prendre_rendez_vous_modif_plan_traitement" id="horaire_prendre_rendez_vous_modif_plan_traitement">
                                                    <option value="">Indifférent</option>
                                                    <option value="6-11">Matin</option>
                                                    <option value="12-21">Après-Midi</option>
                                                    <option value="6-7">06h/08h</option>
                                                    <option value="8-9">08h/10h</option>
                                                    <option value="10-11">10h/12h</option>
                                                    <option value="12-13">12h/14h</option>
                                                    <option value="14-15">14h/16h</option>
                                                    <option value="16-17">16h/18h</option>
                                                    <option value="18-19">18h/20h</option>
                                                    <option value="20-21">20h/22h</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <button id="btn_recherche_rdv_prendre_rendez_vous_modif_plan_traitement" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="recherche_rdv_prendre_rendez_vous_modif_plan_traitement();">Rechercher</button>
                                    <button id="btn_annuler_recherche_rdv_prendre_rendez_vous_modif_plan_traitement" type="button" class="btn vd_btn vd_bg-grey" onclick="annuler_recherche_rdv_prendre_rendez_vous_modif_plan_traitement();">Annuler</button>
                                </div>

                                <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous_modif_plan_traitement" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                    <div id="divrdvdispoattente_prendre_rendez_vous_modif_plan_traitement" style="padding:0;display:none;">
                                        <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                                    </div>
                                    <div id="divrdvdispo_prendre_rendez_vous_modif_plan_traitement" style="display:none;"></div>
                                </div>
                                <div class="col-sm-12" align="center">
                                    <hr>
                                </div>
                                {if !$bismoduleexterne}
                                    <div class="col-sm-12">
                                        <h3>Forcer sur une date et heure précise</h3>
                                    </div>
                                    <div class="col-sm-12" align="center">
                                        <div class="form-group">
                                            <div class="col-sm-2 controls"></div>
                                            <div class="col-sm-4 controls" style="margin:0px;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Choisissez une date</b>
                                                    </label>
                                                </div>
                                                <div class="input-group">
                                                    <input type="text" placeholder="Choisissez une date" value="" name="datepicker_force_rdv_plan_traitement" id="datepicker_force_rdv_plan_traitement" class="input-widget-date-left">
                                                    <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker_force_rdv_plan_traitement">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                </div>
                                                <div id="bookingBoxdatepicker_force_rdv_plan_traitement" style="position: absolute;z-index: 1;"></div>
                                                {literal}
                                                    <script type="text/javascript">
                                                        $("#datepicker_force_rdv_plan_traitement").datepicker({
                                                            dateFormat: 'dd/mm/yy',
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            beforeShow: function (textbox, instance) {
                                                                $('#ui-datepicker-div').css({
                                                                    position: 'initial',
                                                                    top: -20,
                                                                    left: 5
                                                                });
                                                                $('#bookingBoxdatepicker_force_rdv_plan_traitement').append($('#ui-datepicker-div'));
                                                                $('#ui-datepicker-div').hide();
                                                            }
                                                        });
                                                        $('[data-datepicker]').click(function (e) {
                                                            var data = $(this).data('datepicker');
                                                            $(data).focus();
                                                        });

                                                    </script>
                                                {/literal}
                                            </div>

                                            <div class="col-sm-4">
                                                <label class="control-label">Heure</label>
                                                <div class="input-group bootstrap-timepicker">
                                                    <input class="input-modal-date-left" type="text" id="heure_force_rdv_plan_traitement" name="heure_force_rdv_plan_traitement" value="">
                                                    <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                                </div>

                                                <script type="text/javascript">
                                                    $(document).ready(function () {
                                                        $("#heure_force_rdv_plan_traitement").clockpicker({
                                                            placement: 'bottom',
                                                            autoclose: true
                                                        });
                                                        $("#heure_force_rdv_plan_traitement").mask("99:99");
                                                    });

                                                </script>

                                            </div>
                                            <div class="col-sm-2 controls"></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12" align="center">
                                        <button id="btn_valider_force_rdv_modif_plan_traitement" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="enregistrement_forcer_rdv_modif_plan_traitement();">Valider</button>
                                        <button id="btn_annuler_force_rdv_modif_plan_traitement" type="button" class="btn vd_btn vd_bg-grey" onclick="annuler_recherche_rdv_prendre_rendez_vous_modif_plan_traitement();">Annuler</button>
                                    </div>
                                {/if}
                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>

        {include file="modal_rdv_exist.tpl"}
        {include file="modal_call_patient.tpl"}
        {include file="modal_call_centre.tpl"}
        {include file="variable_modal.tpl"}
        {include file="modal_prise_rdv_unique.tpl"}

        <input type="hidden" value="{$iAccess}" name="iAccess" id="iAccess">
        <input type="hidden" value="{$linkApiLog}" name="linkApiLog" id="linkApiLog">
        <input type="hidden" value="{$sNomServeurDBB}" name="sNomServeurDBB" id="sNomServeurDBB">
        {literal}
        <?php $jQuerryPnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js?v={/literal}{$numero_version_alaxione}{literal}'); ?>
        <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $jQuerryPnotifyMin ?>.js?v={/literal}{$numero_version_alaxione}{literal}"></script>
        {/literal}
    </body>
</html>