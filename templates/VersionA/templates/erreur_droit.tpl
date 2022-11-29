<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html><!--<![endif]-->

      <!-- Specific Page Data -->

      <!-- End of Data -->
{literal}
<head>
    <meta charset="utf-8"/>
    <title>Acces refusé</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, Vendroid"/>
    <meta name="description" content="404 Error Pages - Responsive Admin HTML Template">
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
    <?php $bootstrapErreurDroit = filemtime(PATH_ASSETS.'css/bootstrap.min.css') ?>
    <link href="css/bootstrap.min.<?php echo $bootstrapErreurDroit ?>.css" rel="stylesheet" type="text/css">

    <?php $awesomeMinErreur = filemtime(PATH_ASSETS.'css/font-awesome.min.css') ?>
    <link href="css/font-awesome.min.<?php echo $awesomeMinErreur ?>.css" rel="stylesheet" type="text/css">

    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <?php $fontEntypoMinErreur = filemtime(PATH_ASSETS.'css/font-entypo.css') ?>
    <link href="css/font-entypo.<?php $fontEntypoMinErreur?>.css" rel="stylesheet" type="text/css"> 

    <!-- Fonts CSS -->
    <?php $customErreur = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.css') ?>
    <link href="plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customErreur ?>.css" rel="stylesheet" type="text/css">

    <?php $prettyPhotoErreur = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/css/prettyPhoto.css') ?>
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.<?php echo $prettyPhotoErreur ?>.css" rel="stylesheet" type="text/css">

    <?php $isotErreur = filemtime(PATH_ASSETS.'plugins/isotope/css/isotope.css') ?>
    <link href="plugins/isotope/css/isotope.<?php echo $isotErreur ?>.css" rel="stylesheet" type="text/css">
    <?php $pnotErreur = filemtime(PATH_ASSETS.'plugins/pnotify/css/jquery.pnotify.css') ?>
    <link href="plugins/pnotify/css/jquery.pnotify.<?php echo $pnotErreur ?>.css" media="screen" rel="stylesheet" type="text/css">    
    <?php $prettyPreErreur = filemtime(PATH_ASSETS.'plugins/google-code-prettify/prettify.css') ?>
    <link href="plugins/google-code-prettify/prettify.<?php $prettyPreErreur ?>.css" rel="stylesheet" type="text/css"> 


    <!-- Plugin CSS -->
    <?php $mCustomScrollbarErreur = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.css') ?>
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.<?php echo $mCustomScrollbarErreur ?>.css" rel="stylesheet" type="text/css">
    <?php $tagsInputErreur = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.css') ?>
    <link href="plugins/tagsInput/jquery.tagsinput.<?php echo $tagsInputErreur ?>.css" rel="stylesheet" type="text/css">
    <?php $bootstrapSwiErreur = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.css') ?>
    <link href="plugins/bootstrap-switch/bootstrap-switch.<?php echo $bootstrapSwiErreur ?>.css" rel="stylesheet" type="text/css">    
    <?php $dateAngePickerErreur = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker-bs3.css') ?>
    <link href="plugins/daterangepicker/daterangepicker-bs3.<?php echo $dateAngePickerErreur ?>.css" rel="stylesheet" type="text/css">    
    <?php $timpickerErreur = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.css') ?>
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timpickerErreur ?>.css" rel="stylesheet" type="text/css">
    <?php $colorPickerErreur = filemtime(PATH_ASSETS.'plugins/colorpicker/css/colorpicker.css') ?>
    <link href="plugins/colorpicker/css/colorpicker.<?php echo $colorPickerErreur ?>.css" rel="stylesheet" type="text/css">           


    <!-- Specific CSS -->
    <?php $themeMinErreur = filemtime(PATH_ASSETS.'css/theme.min.css') ?>
    <link href="css/theme.min.<?php echo $themeMinErreur ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="css/ie.css" rel="stylesheet"> <![endif]-->
    <?php $chromeErreur = filemtime(PATH_ASSETS.'css/chrome.css') ?>
    <link href="css/chrome.<?php echo $chromeErreur ?>.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    

    <!-- Responsive CSS -->
    <?php $responsiveErreur = filemtime(PATH_ASSETS.'css/theme-responsive.min.css') ?>
    <link href="css/theme-responsive.min.<?php echo $responsiveErreur ?>.css" rel="stylesheet" type="text/css"> 


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <?php $customCustomErreur = filemtime(PATH_ASSETS.'custom/custom.css') ?>
    <link href="custom/custom.<?php echo $customCustomErreur ?>.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="js/modernizr.{$modernizr}.js"></script>

    <script type="text/javascript" src="js/mobile-detect.min.{$mobileDetect}.js"></script>
    
    <script type="text/javascript" src="js/mobile-detect-modernizr.{$mobileDetectModernizr}.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->

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
                <div class="">
                    <div class="vd_content clearfix">
                        <div class="vd_content-section clearfix">
                            <div class="vd_register-page">
                                <div class="panel widget">
                                    <div class="panel-body">
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <h1 class="font-semibold text-center" style="font-size:32px">ACC&Egrave;S REFUS&Eacute;</h1>
                                        <br/>
                                        <br/>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <h4 class="text-center mgbt-xs-20">Vous ne disposez pas des droits nécessaires pour cette fonctionnalité</h4>
                                            </div>
                                        </div>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                        <br/>
                                    </div>
                                </div>
                                <!-- Panel Widget -->
                            </div>
                            <!-- vd_login-page -->

                        </div>
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
    <footer class="footer-2" id="footer">
        <div class="vd_bottom ">
            <div class="container">
                <div class="row">
                    <div class=" col-xs-12">
                        <div class="copyright text-center">

                        </div>
                    </div>
                </div><!-- row -->
            </div><!-- container -->
        </div>
    </footer>
    <!-- Footer END -->

</div>


{/literal}
</body>
</html>