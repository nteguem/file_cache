<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html><!--<![endif]-->

<head>
    <meta charset="utf-8"/>
    <title>Demande de consentement - {$nom_centre}</title>
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
    <link href="css/bootstrap.min.{$cssBoostrapMinCss}.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.{$cssFontAwesomeMinCss}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.{$cssFontEntypoCss}.css" rel="stylesheet" type="text/css"> 

    <!-- Fonts CSS -->
    <link href="css/fonts.{cssFontCss}.css"  rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
   <link href="plugins/jquery-ui/jquery-ui.custom.min.{$pluginsJqueryUiJquery}.css" rel="stylesheet" type="text/css">    
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.{$pluginsPrettyPhotoCss}.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.{$pluginsIsotopeCss}.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.{$plugingsPnotifyCss}.css" media="screen" rel="stylesheet" type="text/css">    
    <link href="plugins/google-code-prettify/prettify.{$pluginsGoogleCodeCss}.css" rel="stylesheet" type="text/css"> 

    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$pluginsMCustomScrollbarCss}.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.{$pluginsTagsInputCss}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.{$pluginsBoostrapSwitchCss}.css" rel="stylesheet" type="text/css">    
    <link href="plugins/daterangepicker/daterangepicker-bs3.{$pluginsDaterangepickerCss}.css" rel="stylesheet" type="text/css">    
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$pluginsBoostrapTimepickerCss}.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.{$pluginsColorpickerCss}.css" rel="stylesheet" type="text/css">            
  <!-- Theme CSS -->

    <link href="css/theme.min.{$cssThemeMinCss}.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.{$cssChromeCss}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.{$cssThemeResponsiveMinCss}.css" rel="stylesheet" type="text/css"> 
    <!-- Custom CSS -->
  <link href="custom/custom.{$cssCustomCss}.css" rel="stylesheet" type="text/css">
    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="js/modernizr.{$modernizr}.js"></script>
        <script type="text/javascript" src="js/mobile-detect.min.{$mobileDetect}.js"></script>
    <script type="text/javascript" src="js/mobile-detect-modernizr.{$mobileDetectModernizr}.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.{$html5shiv}.js"></script>
    <script type="text/javascript" src="js/respond.min.{$respondMin}.js"></script>
    <![endif]-->

    <script type="text/javascript">
        function modif_profilage(token, statut_profilage) {

            $("#divformulairemodifprofilage").hide();
            $("#div_attente_confirme_modif_profilage").show();
            $.ajax({
                cache: false,
                url: 'ajax/modification_profilage.php',
                type: 'GET',
                data: 'statut_profilage=' + statut_profilage + '&token=' + token,
                dataType: 'json',
                success: function (json) {
                    $.each(json, function (index, value) {
                        $("#div_attente_confirme_modif_profilage").hide();
                        if (value.success === true) {

                            $("#div_confirme_modif_profilage").html("<div class='alert alert-success' ><span class='vd_alert-icon'><i class='fa fa-check-circle vd_green'></i></span><strong>" + value.message + "</strong></div></div>").show();
                            $("#profilage_guid_user").val("");
                        } else {
                            $("#divformulairemodifprofilage").show();
                            $("#div_confirme_modif_profilage").html("<div class='alert alert-warning' ><span class='vd_alert-icon'><i class='fa fa-exclamation-circle vd_red'></i></span><strong>" + value.message + "</strong></div></div>").show();
                        }
                    });
                }
            });
        }
    </script>

</head>

<body id="pages"
      class="full-layout no-nav-left no-nav-right  nav-top-fixed background-login     responsive remove-navbar login-layout   clearfix"
      data-active="pages " data-smooth-scrolling="1">
<div class="vd_body">
    <div class="content">
        <div class="container">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="heading clearfix">
                    <h4  style="font-size: x-large;line-height:  initial;" class="text-center font-semibold vd_grey">Demande de consentement - {$nom_centre}</h4>
                </div>
                <div class="panel widget">
                    <div class="panel-body">
                        <form class="form-horizontal" id="login-form" action="" role="form" method="post">
                            <input type="hidden" id="profilage_guid_user" name="profilage_guid_user"
                                   value="{$profilage_guid_user}">
                            {if $sTxtEchec!=''}
                                <div class="alert alert-danger">
                                    <span class="vd_alert-icon"><i
                                                class="fa fa-exclamation-circle vd_red"></i></span><strong>{$sTxtEchec}</strong>
                                </div>
                            {else}
                                <div id="div_confirme_modif_profilage" style="display: none;" align="center"></div>
                                <div id="div_attente_confirme_modif_profilage" style="display: none;">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br></div>
                                </div>
                                <div id="divformulairemodifprofilage">
                                    <div>
                                        <p style="font-size: large;line-height:  initial;">
                                            Je soussigné(e), {$civilite_nom_prenom_patient}, autorise l'entitée "{$nom_centre}" et son
                                            service informatique à m’adresser des messages et autres notifications afin
                                            de me rappeler à l’avance à quel moment prendre mes prochains rendez-vous,
                                            et ce dans un souci unique d’une meilleure prise en charge de ma pathologie.
                                        </p>
                                        <p style="font-size: large;line-height:  initial;">
                                            Je suis informé(e) que mes données personnelles et médicales sont couvertes
                                            par le secret médical.

                                        </p>

                                    </div>
                                    <div class="form-group ">
                                        <div class="col-md-12">
                                            <div style="margin-top:10px;" align="center">
                                                <button type="button" name="btnaccpeteprofilage"
                                                        id="btnaccpeteprofilage" class="btn vd_btn vd_bg-blue"
                                                        style="font-size: large;padding: 15px 40px;margin-right: 15px;margin-top: 10px"
                                                        onclick="modif_profilage('{$token}', 'ACCEPT');">Je suis d’accord
                                                </button>
                                                <button type="button" name="btndeclineprofilage"
                                                        id="btndeclineprofilage" class="btn vd_btn vd_bg-red"
                                                        style="font-size: large;padding: 15px 40px;margin-left: 15px;margin-top: 10px"
                                                        onclick="modif_profilage('{$token}', 'REFUS');">Je ne suis pas d’accord
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}

                        </form>
                    </div>
                </div>

            </div>
            <div class="col-sm-3"></div>


        </div>
    </div>


</div>

<!-- .vd_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>
<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->

<!-- Javascript =============================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="js/jquery.{$jquery}.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/excanvas.{$exCanva}.js"></script>
<![endif]-->
<script type="text/javascript" src="js/bootstrap.min.{$bootstrap}.js"></script>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.{$jqueryCustom}.js'></script>
<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.{$jqueryTouch}.js"></script>
<script type="text/javascript" src="js/caroufredsel.{$caroufredsel}.js"></script>
<script type="text/javascript" src="js/plugins.{$plugin}.js"></script>
<script type="text/javascript" src="plugins/breakpoints/breakpoints.{$breakpoints}.js"></script>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.{$dataTables}.js"></script>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.{$prettyPhoto}.js"></script>
<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.{$mCustomScrollbar}.js"></script>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.{$tagsInput}.js"></script>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.{$bootstrapSwitch}.js"></script>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI.{$blockUi}.js"></script>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.{$pnotify}.js"></script>
<script type="text/javascript" src="js/theme.{$theme}.js"></script>
<script type="text/javascript" src="custom/custom.custom.{$custom}.js"></script>

</body>
</html>