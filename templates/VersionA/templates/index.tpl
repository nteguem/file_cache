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
    <title>ALAXIONE</title>
    <meta name="keywords" content=""/>
    <meta name="description" content="">
    <meta name="author" content="">

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
   <?php  $boostrapMin = filemtime(PATH_ASSETS.'css/bootstrap.min.css" rel="stylesheet');?>
    <link href="css/bootstrap.min.<?php echo $boostrapMin ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $awesomeMin = filemtime(PATH_ASSETS.'css/font-awesome.min.css');?>
    <link href="css/font-awesome.min.<?php echo $awesomeMin ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    
    <?php  $entypoMax = filemtime(PATH_ASSETS.'css/font-entypo.css');?>
    <link href="css/font-entypo.<?php echo $entypoMax ?>.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <?php  $fontMin = filemtime(PATH_ASSETS.'css/fonts.css');?>
    <link href="css/fonts.<?php echo $fontMin ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $icomoonMin = filemtime(PATH_ASSETS.'css/font-icomoon.css');?>
    <link href="css/font-icomoon.<?php echo $icomoonMin ?>.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <?php  $customMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.css');?>
    <link href="plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMin ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $PrettyPhoto_1 = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/css/prettyPhoto.css');?>
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.<?php echo $PrettyPhoto_1 ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $isotope_1 = filemtime(PATH_ASSETS.'plugins/isotope/css/isotope.css');?>
    <link href="plugins/isotope/css/isotope.<?php echo $isotope_1 ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $pnotify_2 = filemtime(PATH_ASSETS.'plugins/pnotify/css/jquery.pnotify.css');?>
    <link href="plugins/pnotify/css/jquery.pnotify.<?php echo $pnotify_2 ?>.css" media="screen" rel="stylesheet" type="text/css">
    
    <?php  $prettifyMin = filemtime(PATH_ASSETS.'plugins/google-code-prettify/prettify.css');?>
    <link href="plugins/google-code-prettify/prettify.<?php echo $prettifyMin ?>.css" rel="stylesheet" type="text/css">

    <?php  $Customscrollbar_1 = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.css');?>
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.<?php echo $Customscrollbar_1 ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $tagsinputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.css');?>
    <link href="plugins/tagsInput/jquery.tagsinput.<?php echo $tagsinputMin ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $boostrapSwitch_2 = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.css');?>
    <link href="plugins/bootstrap-switch/bootstrap-switch.<?php echo $boostrapSwitch_2 ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $daterangepicker_2 = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker-bs3.css');?>
    <link href="plugins/daterangepicker/daterangepicker-bs3.<?php echo $daterangepicker_2 ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $timepickerMin = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.css');?> 
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timepickerMin ?>.css" rel="stylesheet" type="text/css">
    
    <?php  $colorpicker_2 = filemtime(PATH_ASSETS.'plugins/colorpicker/css/colorpicker.css');?>
    <link href="plugins/colorpicker/css/colorpicker.<?php echo $colorpicker_2 ?>.css" rel="stylesheet" type="text/css">

    <!-- Specific CSS -->


    <!-- Theme CSS -->
    <?php  $themeMin = filemtime(PATH_ASSETS.'css/theme.min.css?build=1');?>
    <link href="css/theme.min.<?php echo $themeMin ?>.css?build=1" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="css/ie.css" rel="stylesheet"> <![endif]-->
    
    <?php  $chrome_1 = filemtime(PATH_ASSETS.'css/chrome.css');?>
    <link href="css/chrome.<?php echo $chrome_1 ?>.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
   
    <?php  $responsiveMin = filemtime(PATH_ASSETS.'css/theme-responsive.min.css');?>
    <link href="css/theme-responsive.min.<?php echo $responsiveMin ?>.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
   
    <?php  $custom_3 = filemtime(PATH_ASSETS.'custom/custom.css');?>
    <link href="custom/custom.<?php echo $custom_3 ?>.css" rel="stylesheet" type="text/css">

    <script type="text/javascript">
        function info_support() {
            $('#div_information_message').html("<span style='font-size: x-large;'>Num??ro de la hotline : 04 88 00 89 69<br/></br><a href=\"https://get.teamviewer.com/alaxione\" target=\"_blank\"> <div style=\"display: inline;\" class=\"menu-icon\"><i class=\"ico-teamviewer fa-info\"></i></div> <div style=\"display: inline;\" class=\"menu-text\">T??l??charger TeamViewer Alaxione</div> </a></span>");
            $('#modalInformationMessage').modal('show');
        }

    </script>


    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="js/modernizr.{$modernizr}.js"></script>

    <script type="text/javascript" src="js/mobile-detect.min.{$mobileDetect2}.js"></script>

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
            <div class="div-favori">
                <div class="div-text-favori">Ajouter ce site dans vos favoris <br />avant de vous connecter</div>
                <div class="div-img-favori"><img class="img-favori" src="/img/fleche_favori.png"></div>
            </div>
            <div class="vd_content-wrapper">
                <div class="vd_container">
                    <div class="vd_content clearfix">
                        <div class="vd_content-section clearfix">
                            <div class="vd_login-page">
                                <div class="heading clearfix">
                                    <div class="logo">
                                        <h2 class="mgbt-xs-5"><img src="{$iLogo}" alt="{$sSite}"></h2>
                                    </div>
                                    <br/>
                                    <br/>
                                    <h4 class="text-center font-semibold vd_grey">{$sTxtConnectezVousAVotreCompte}</h4>

                                </div>
                                <div class="panel widget">
                                    <div class="panel-body">
                                        <div class="login-icon entypo-icon"><i class="icon-key"></i></div>
                                        <form class="form-horizontal" id="login-form" action="" role="form"
                                              method="post">
                                            <input type="hidden" name="validation" value="ok">
                                            <div class="alert alert-danger vd_hidden">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true"><i class="icon-cross"></i></button>
                                                <span class="vd_alert-icon"><i
                                                            class="fa fa-exclamation-circle vd_red"></i></span><strong>{$sTxtEchec}</strong>{$sTxtVerifChampsObligatoire}
                                            </div>
                                            <div class="alert alert-success vd_hidden">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true"><i class="icon-cross"></i></button>
                                                <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span><strong>{$sTxtConnexionEnCours}</strong>.
                                            </div>
                                            {if $MessageConnexion!=''}
                                                <div class="alert alert-danger ">
                                                    <button type="button" class="close" data-dismiss="alert"
                                                            aria-hidden="true"><i class="icon-cross"></i></button>
                                                    <span class="vd_alert-icon"><i
                                                                class="fa fa-exclamation-circle vd_red"></i></span><strong>{$sTxtEchec} </strong>
                                                    {$MessageConnexion}
                                                </div>
                                            {/if}
                                            <div class="form-group  mgbt-xs-20">
                                                <div class="col-md-12">
                                                    <input type="hidden" name="centre" id="centre" value="{$centre}">
                                                    <input type="hidden" name="dir" id="dir" value="{$dir}">

                                                    <div class="label-wrapper sr-only">
                                                        <label class="control-label" for="email">{$sTxtEmail}</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="email-input-wrapper"><span
                                                                class="menu-icon"> <i
                                                                    class="fa fa-envelope"></i> </span>
                                                        <input type="email" placeholder="{$sTxtEmail}" id="email"
                                                               name="log" class="required" required>
                                                    </div>
                                                    <div class="label-wrapper">
                                                        <label class="control-label sr-only"
                                                               for="password">{$sTxtMDP}</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="password-input-wrapper">
                                                        <input type="password" placeholder="{$sTxtMDP}" id="password"
                                                               name="pwd" class="required" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="vd_login-error" class="alert alert-danger hidden"><i
                                                        class="fa fa-exclamation-circle fa-fw"></i>{$sTxtChampsObligatoire}
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-12 text-center mgbt-xs-5">
                                                    <button class="btn vd_bg-green vd_white width-100" type="submit"
                                                            id="login-submit">{$sTxtConnecter}</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
    <!-- .content -->

    <!-- Footer Start -->
    <footer class="footer-2" id="footer">
        <div class="vd_bottom ">
            <div class="container">
                <div class="row">
                    <div class=" col-xs-12">
                        <div class="copyright text-center" style="color: #78787A">
                            Copyright &copy;{$sAnneeCopyright} <a href="https://alaxione.fr"
                                                                  target="_blank">Alaxione.fr</a>
                        </div>
                        <div class="col-md-12 text-center mgbt-xs-5">
                            <a class="" href="#" onclick="info_support()" style="font-size: large;font-weight: bold;">S.O.S Alaxione</a>
                        </div>
                    </div>
                </div><!-- row -->
            </div><!-- container -->
        </div>
    </footer>
    <!-- Footer END -->

</div>

<!-- .vd_body END  -->


<!-- Javascript =============================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="js/jquery.{$jquery}.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/excanvas.{$exCanva}.js"></script>
<![endif]-->
<script type="text/javascript" src="js/bootstrap.min.{$bootsrap}.js"></script>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.{$jqueryCustom}.js'></script>

<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.{$jqueryTouch}.js"></script>

<script type="text/javascript" src="js/caroufredsel.{$caroufredsel}.js"></script>

<script type="text/javascript" src="js/plugins.{$plugin}.js"></script>

<script type="text/javascript" src="plugins/breakpoints/breakpoints.{breakpoints}.js"></script>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.{$dataTables}.js"></script>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.{$prettyPhoto}.js"></script>

<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.{$mCustomScrollbar}.js"></script>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.{$tagsInput}.js"></script>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.{$bootstrapSwitch}.js"></script>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI{$blockUi}.js"></script>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.{$pnotify}.js"></script>
<script type="text/javascript" src="js/theme.{$theme}.js"></script>
<script type="text/javascript" src="custom/custom{$custom}.js"></script>


</body>
</html>