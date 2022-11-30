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
    <link href="css/bootstrap.min.{$bootIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.{$awIndexChange}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.{$IentndexChange}.css" rel="stylesheet" type="text/css">
    <!-- Fonts CSS -->
    <link href="css/fonts.{$ftIndexChange}.css" rel="stylesheet" type="text/css">
    <!-- Plugin CSS -->
    <link href="plugins/jquery-ui/jquery-ui.custom.min.{$cmIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.{$prIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.{$iciIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.{$pnIndexChange}.css" media="screen" rel="stylesheet" type="text/css">
    <link href="plugins/google-code-prettify/prettify.{$pretIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$mcIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.{$tagsIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.{$swIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/daterangepicker/daterangepicker-bs3.{$bs3IndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$mntIndexChange}.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.{$clorIndexChange}.css" rel="stylesheet" type="text/css">
    <!-- Theme CSS -->
    <link href="css/theme.min.{$thIndexChange}.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="css/chrome.{$chrIndexChange}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->
    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.{$repsIndexChange}.css" rel="stylesheet" type="text/css">
    <!-- Custom CSS -->
    <link href="custom/custom.{$ccIndexChange}.css" rel="stylesheet" type="text/css">
    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/mobile-detect.min.js"></script>
    <script type="text/javascript" src="js/mobile-detect-modernizr.js"></script>
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
<script type="text/javascript" src="js/jquery.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.js'></script>
<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="js/caroufredsel.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script type="text/javascript" src="plugins/breakpoints/breakpoints.js"></script>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.js"></script>
<script type="text/javascript" src="js/theme.js"></script>
<script type="text/javascript" src="custom/custom.js"></script>
<script type="text/javascript" src="js/mdp.js"></script>

</body>
</html>