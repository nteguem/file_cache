<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html><!--<![endif]-->

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
    <?php $bootstrapIndexMdp = filemtime(PATH_ASSETS.'css/bootstrap.min.css') ?>
    <link href="css/bootstrap.min.<?php echo $bootstrapMinCss ?>.css" rel="stylesheet" type="text/css">

    <?php $awesomeMinCss = filemtime(PATH_ASSETS.'css/font-awesome.min.css') ?>
    <link href="css/font-awesome.min.<?php echo $awesomeIndexMdp ?>.css" rel="stylesheet" type="text/css">

    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <?php $fontEntypoMdp = filemtime(PATH_ASSETS.'css/font-entypo.css') ?>
    <link href="css/font-entypo.<?php $fontEntypoMdp ?>.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <?php $fontMinMdp = filemtime(PATH_ASSETS.'css/fonts.css') ?>
    <link href="css/fonts.<?php echo $fontMinMdp ?>.css"  rel="stylesheet" type="text/css">
    <!-- Plugin CSS -->
    <?php $customMdp = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.css') ?>
    <link href="plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMdp ?>.css" rel="stylesheet" type="text/css">
    <?php $prettyPhotoMdp = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/css/prettyPhoto.css') ?>
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.<?php echo $prettyPhotoMdp ?>.css" rel="stylesheet" type="text/css">
    <?php $isotodp = filemtime(PATH_ASSETS.'plugins/isotope/css/isotope.css') ?>
    <link href="plugins/isotope/css/isotope.<?php echo $isotodp ?>.css" rel="stylesheet" type="text/css">
    <?php $pnotifyCss = filemtime(PATH_ASSETS.'plugins/pnotify/css/jquery.pnotify.css') ?>
    <link href="plugins/pnotify/css/jquery.pnotify.<?php echo $pnotidp ?>.css" media="screen" rel="stylesheet" type="text/css">    
    <?php $prettyPretdp = filemtime(PATH_ASSETS.'plugins/google-code-prettify/prettify.css') ?>
    <link href="plugins/google-code-prettify/prettify.<?php $prettyPrettyCss ?>.css" rel="stylesheet" type="text/css"> 

    <?php $mCustomScrollbarMpd = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.css') ?>
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.<?php echo $mCustomScrollbarMpd ?>.css" rel="stylesheet" type="text/css">
    <?php $tagsInputMpd = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.css') ?>
    <link href="plugins/tagsInput/jquery.tagsinput.<?php echo $tagsInputMpd ?>.css" rel="stylesheet" type="text/css">
    <?php $bootstrapSwiMpd = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.css') ?>
    <link href="plugins/bootstrap-switch/bootstrap-switch.<?php echo $bootstrapSwiMpd ?>.css" rel="stylesheet" type="text/css">    
    <?php $dateAngePickerMpd = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker-bs3.css') ?>
    <link href="plugins/daterangepicker/daterangepicker-bs3.<?php echo $dateAngePickerMpd ?>.css" rel="stylesheet" type="text/css">    
    <?php $timpickerMpd = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.css') ?>
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timpickerMpd ?>.css" rel="stylesheet" type="text/css">
    <?php $colorPickerMpd = filemtime(PATH_ASSETS.'plugins/colorpicker/css/colorpicker.css') ?>
    <link href="plugins/colorpicker/css/colorpicker.<?php echo $colorPickerMpd ?>.css" rel="stylesheet" type="text/css">            
    
    <!-- Theme CSS -->
    <?php $themeMinMpd = filemtime(PATH_ASSETS.'css/theme.min.css') ?>
    <link href="css/theme.min.<?php echo $themeMinMpd ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="css/ie.css" rel="stylesheet"> <![endif]-->
    <?php $chromeMpd = filemtime(PATH_ASSETS.'css/chrome.css') ?>
    <link href="css/chrome.<?php echo $chromeMpd ?>.css" rel="stylesheet" type="text/chrome">
     <!-- chrome only css -->
    <!-- Responsive CSS -->
    <?php $responsiveMpd = filemtime(PATH_ASSETS.'css/theme-responsive.min.css') ?>
    <link href="css/theme-responsive.min.<?php echo $responsiveMpd ?>.css" rel="stylesheet" type="text/css"> 
    <!-- Custom CSS -->
    <?php $customCustomMpd = filemtime(PATH_ASSETS.'custom/custom.css') ?>
    <link href="custom/custom.<?php echo $customCustomMpd ?>.css" rel="stylesheet" type="text/css">
    <!-- Head SCRIPTS -->
    <?php $modernizr_1 = filemtime(PATH_ASSETS.'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr_1 ?>.js"></script>
    <?php $mobileDetectMin_1 = filemtime(PATH_ASSETS.'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin_1 ?>.js"></script>
    <?php $mobileDetectModernizr_1 = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr_1 ?>.js"></script>
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
    <div class="content">
        <div class="container">
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
                                    <h4 class="text-center font-semibold vd_grey">Modifiez votre mot de passe</h4>
                                </div>
                                <div class="panel widget">
                                    <div class="panel-body">
                                        <div class="login-icon entypo-icon"><i class="icon-key"></i></div>
                                        <form class="form-horizontal" id="login-form" action="" role="form" method="post">
                                            <input type="hidden" id="mdp_guid_user" name="mdp_guid_user" value="{$mdp_guid_user}">
                                            {if $sTxtEchec!=''}
                                                <div class="alert alert-danger">
                                                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>{$sTxtEchec}</strong>
                                                </div>
                                            {else}
                                            <div id="div_confirme_modif_mdp" style="display: none;" align="center"></div>
                                            <div id="div_attente_confirme_modif_mdp" style="display: none;">
                                                <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                            </div>
                                            <div id="divformulairemodifmdp">
                                                <div class="form-group ">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="passwd_1">Nouveau mot de passe<sup>*</sup></label>
                                                            <input type="hidden" id="passwdNb" name="passwdNb" value="">
                                                            <input onkeyup="passwordStrength(this.value);" class="required validate form-control" type="password" id="passwd_1" name="passwd_1" value="" autocomplete="new-password" required>
                                                            <div style="clear:both;">
                                                                <div id="passwdDescription"></div>
                                                                <div id="passwdStrength" class="strength0"></div>
                                                                <div><i>Minimum 6 caractères / 1 majuscule / 1 chiffre / 1 caractère spécial</i></div>
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
                                                            <button type="button" name="btnconfirmmodifmdp" id="btnconfirmmodifmdp" class="btn vd_btn vd_bg-blue" onclick="modif_mdp('{$token}');" disabled>Confirmer</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            {/if}

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Start -->
    <footer class="footer-2" id="footer">
        <div class="vd_bottom ">
            <div class="container">
                <div class="row">
                    <div class=" col-xs-12">
                        <div class="copyright text-center" style="color: #78787A">
                            Copyright &copy;2015 <a href="http://alaxione.fr" target="_blank">Alaxione.fr</a>
                        </div>
                    </div>
                </div><!-- row -->
            </div><!-- container -->
        </div>
    </footer>
    <!-- Footer END -->

</div>

<!-- .vd_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>
<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->

<!-- Javascript =============================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<?php $jQuery_1 = filemtime(PATH_ASSETS.'js/jquery.js') ?>
<script type="text/javascript" src="js/jquery.<?php $jQuery_1 ?>.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/excanvas.js"></script>
<![endif]-->
<?php $bootstapMin_1 = filemtime(PATH_ASSETS.'js/bootstrap.min.js') ?>
<script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstapMin_1 ?>.js"></script>
<?php $pluginJqCustomMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js') ?>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $pluginJqCustomMin ?>.js'></script>
<?php $punchJqueryUiTouchPunchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchJqueryUiTouchPunchMin ?>.js"></script>
<?php $caroufRedSel_1 = filemtime(PATH_ASSETS.'js/caroufredsel.js') ?>
<script type="text/javascript" src="js/caroufredsel.<?php echo $caroufRedSel_1 ?>.js"></script>
<?php $plugins_1 = filemtime(PATH_ASSETS.'js/plugins.js') ?>
<script type="text/javascript" src="js/plugins.<?php echo $plugins_1 ?>.js"></script>
<?php $pluginsBreackPoints_1 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js') ?>
<script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $pluginsBreackPoints_1 ?>.js"></script>
<?php $pluginsDataTableMin_1 = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js') ?>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $pluginsDataTableMin_1 ?>.js"></script>
<?php $pluginsPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginsPrettyPhoto ?>.js"></script>
<?php $pluginsContactMain = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $pluginsContactMain ?>.js"></script>
<?php $tagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js') ?>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInputMin ?>.js"></script>
<?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>
<?php $pluginsBlockUi $ = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js') ?>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $pluginsBlockUi ?>.js"></script>
<?php $pluginsPnotify = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js') ?>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pluginsPnotify ?>.js"></script>
<?php $theme_1 = filemtime(PATH_ASSETS.'js/theme.js') ?>
<script type="text/javascript" src="js/theme.<?php echo $theme_1 ?>.js"></script>
<?php $custumCustom = filemtime(PATH_ASSETS.'custom/custom.js') ?>
<script type="text/javascript" src="custom/custom.<?php echo $custumCustom ?>.js"></script>
<?php $mdp = filemtime(PATH_ASSETS.'js/mdp.js') ?>
<script type="text/javascript" src="js/mdp.<?php echo $mdp ?>.js"></script>

</body>
</html>