<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html><!--<![endif]-->


<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Alaxione</title>
    <meta name="keywords" content=""/>
    <meta name="description" content="">
    <meta name="author" content="">

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
    <link href="../css/bootstrap.min.{$boostrapMinU}.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.{$awesomeMinU}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../css/font-entypo.{$entypoU}.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.{$fontU}.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.{$customUmin}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.{$prettyphotoU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.{$isotopeU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.{$pnotiffyU}.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.{$prettifyU}.css" rel="stylesheet" type="text/css">


    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$customscrollbarU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.{$tagsinputU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.{$boostrapSwitchU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.{$daterangepickerU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$timepickerboostrapU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.{$colorpickerU}.css" rel="stylesheet" type="text/css">
    <!-- Specific CSS -->
    <link href="../plugins/dataTables/css/jquery.dataTables.min.{$datatableMinU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/dataTables/css/dataTables.bootstrap.{$dataTablesU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/jquery-file-upload/css/jquery.fileupload.{$fileuploadU}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/jquery-file-upload/css/jquery.fileupload-ui.{$fileuploadU2}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.{$wysihtml5_U}.css" rel="stylesheet" type="text/css">
    <link href='../plugins/fullcalendar-2.3.1/fullcalendar.{$fullcalendarU}.css' rel='stylesheet'/>
    <link href='../plugins/fullcalendar-2.3.1/fullcalendar.print.{$fullcalendarprintU}.css' rel='stylesheet' media='print'/>
    <!-- Theme CSS -->
    <link href="../css/theme.{$themeU}.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="../css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="../css/chrome.{$chromeU}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="../css/theme-responsive.min.{$responsiveMinU}.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="../custom/custom.{$customU}.css" rel="stylesheet" type="text/css">
    {literal}
        <?php $jquery = filemtime(PATH_ASSETS . '../plugins/fullcalendar-2.3.1/lib/jquery.min.js') ?>
        <script src='../plugins/fullcalendar-2.3.1/lib/jquery.min.<?php echo $jquery ?>.js'></script>
        <!-- Head SCRIPTS -->
        <?php $modernizr = filemtime(PATH_ASSETS . '../js/modernizr.js') ?>
        <script type="text/javascript" src="../js/modernizr.<?php echo $modernizr ?>.js"></script>
        <?php $mobileDetect = filemtime(PATH_ASSETS . '../js/mobile-detect.min.js') ?>
        <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script>
        <?php $mobileDetectModernizr = filemtime(PATH_ASSETS . '../js/mobile-detect-modernizr.js') ?>
        <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="../js/html5shiv.js"></script>
        <script type="text/javascript" src="../js/respond.min.js"></script>
        <![endif]-->


        <!-- Javascript =============================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <!--[if lt IE 9]>
        <script type="text/javascript" src="../js/excanvas.js"></script>
        <![endif]-->
        <?php $bootstrap = filemtime(PATH_ASSETS . '../js/bootstrap.min.js') ?>
        <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrap ?>.js"></script>
        <?php $jqueryCustom = filemtime(PATH_ASSETS . '../plugins/jquery-ui/jquery-ui.custom.min.js') ?>
        <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryCustom ?>.js'></script>
        <?php $jqueryTouch = filemtime(PATH_ASSETS . '../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
        <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryTouch ?>.js"></script>
        <?php $caroufredsel = filemtime(PATH_ASSETS . '../js/caroufredsel.js') ?>
        <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufredsel ?>.js"></script>
        <?php $plugin = filemtime(PATH_ASSETS . '../js/plugins.js') ?>
        <script type="text/javascript" src="../js/plugins.<?php echo $plugin ?>.js"></script>
        <?php $framwork = filemtime(PATH_ASSETS . '../js/framwork_js.js') ?>
        <script type="text/javascript" src="../js/framwork_js.<?php echo $framwork ?>.js"></script>
        <!-- Script pour l'auto-completion -->
        <?php $autocomplete = filemtime(PATH_ASSETS . './js/jquery.autocomplete.min.js') ?>
        <script type="text/javascript" src="../js/jquery.autocomplete.min.<?php echo $autocomplete ?>.js"></script>
        <?php $breakpoints = filemtime(PATH_ASSETS . '../plugins/breakpoints/breakpoints.js') ?>
        <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $breakpoints ?>.js"></script>
        <?php $dataTables = filemtime(PATH_ASSETS . '../plugins/dataTables/jquery.dataTables.min.js') ?>
        <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $dataTables ?>.js"></script>
        <?php $prettyPhoto = filemtime(PATH_ASSETS . '../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
        <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhoto ?>.js"></script>
        <?php $mCustomScrollbar = filemtime(PATH_ASSETS . '../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
        <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbar ?>.js"></script>
        <?php $tagsInput = filemtime(PATH_ASSETS . '../plugins/tagsInput/jquery.tagsinput.min.js') ?>
        <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsinput ?>.js"></script>
        <?php $switch = filemtime(PATH_ASSETS . '../plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
        <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $switch ?>.js"></script>
        <?php $blockUI = filemtime(PATH_ASSETS . '../plugins/blockUI/jquery.blockUI.js') ?>
        <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUI ?>.js"></script>
        <?php $pnotify = filemtime(PATH_ASSETS . '../plugins/pnotify/js/jquery.pnotify.min.js') ?>
        <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotify ?>.js"></script>
        <?php $theme = filemtime(PATH_ASSETS . '../js/theme.js') ?>
        <script type="text/javascript" src="../js/theme.<?php echo $theme ?>.js"></script>
        <?php $custom = filemtime(PATH_ASSETS . '../custom/custom.js') ?>
        <script type="text/javascript" src="../custom/custom.<?php echo $custom ?>.js"></script>

    {/literal}
</head>

<body id="pages"
      class="full-layout no-nav-left no-nav-right  nav-top-fixed background-login     responsive remove-navbar login-layout   clearfix"
      data-active="pages " data-smooth-scrolling="1">
<div class="vd_body">
    <!-- Header Start -->

    <!-- Header Ends -->
    <div class="content">
        <div class="container">

            <!-- Middle Content Start -->

            <div class="vd_content-wrapper">
                <div class="vd_container">
                    <div class="vd_content clearfix">
                        <div class="vd_content-section clearfix" style="text-align: center">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4">
                                {if $successMessage!= ""}
                                    <div class="alert alert-success"><span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
                                        {$successMessage}
                                    </div>

                                    <a href="../main.php"><button type="button" class="btn vd_bg-green vd_white width-50">Retourner sur l'agenda</button></a>
                                {/if}

                                {if $errorMessage!= ""}
                                    <div class="alert alert-danger"><span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                                        {$errorMessage}
                                    </div>

                                {/if}
                            </div>
                            <div class="col-sm-4"></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>