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
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="css/fonts.css" rel="stylesheet" type="text/css">
    <link href="css/font-icomoon.css" rel="stylesheet" type="text/css">

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


    <!-- Theme CSS -->
    <link href="css/theme.min.css?build=1" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">

    <script type="text/javascript">
        function info_support() {
            $('#div_information_message').html("<span style='font-size: x-large;'>Numéro de la hotline : 04 88 00 89 69<br/></br><a href=\"https://get.teamviewer.com/alaxione\" target=\"_blank\"> <div style=\"display: inline;\" class=\"menu-icon\"><i class=\"ico-teamviewer fa-info\"></i></div> <div style=\"display: inline;\" class=\"menu-text\">Télécharger TeamViewer Alaxione</div> </a></span>");
            $('#modalInformationMessage').modal('show');
        }

    </script>


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


</body>
</html>