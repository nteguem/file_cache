<!DOCTYPE html>
<!--[if IE 8]>      <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>      <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->  <html><!--<![endif]-->

                              <!-- Specific Page Data -->
                              <!-- End of Data -->

<head>
    <meta charset="utf-8" />
    <title>Alaxione</title>
    <meta name="keywords" content="" />
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
    <link href="css/bootstrap.min.{$cssBootstrap}.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.{$cssFontAwesome}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.{$cssFontAwesomeIe7}.css"><![endif]-->
    <link href="css/font-entypo.{$cssFontEntypo}.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="css/fonts.{$cssFont}.css"  rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="plugins/jquery-ui/jquery-ui.custom.min.{$pluginsJqueryUiCustom}.css" rel="stylesheet" type="text/css">
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.{$pluginsPrettyPhoto}.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.{$pluginsIsotope}.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.{$pluginsPnotify}.css" media="screen" rel="stylesheet" type="text/css">
    <link href="plugins/google-code-prettify/prettify.{$pluginsgoogleCode}.css" rel="stylesheet" type="text/css">


    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$pluginsmCustomScrollbar}.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.{$pluginsTagsInput}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.{$pluginsBootstrapSwitch}.css" rel="stylesheet" type="text/css">
    <link href="plugins/daterangepicker/daterangepicker-bs3.{$pluginsDaterangePicker}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$pluginsBootstrapTimepicker}.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.{pluginsColorPicker}.css" rel="stylesheet" type="text/css">


    <!-- Theme CSS -->
    <link href="css/theme.min.{$cssThemeMin}.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.{$cssIeCss}.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.{$cssChrome2}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->



    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.{$cssThemeResponsive2}.css" rel="stylesheet" type="text/css">




    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="custom/custom.{$custom3}.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php
    $jsQuery = filemtime(PATH_ASSETS.'js/jquery.js');
    ?>

    <script type="text/javascript" src="js/jquery.<?php echo $jsQuery ?>.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/excanvas.js"></script>
    <![endif]-->

     <?php
    $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js');
    ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script>

<?php
    $pluginsJquery = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js');
    ?>

    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $pluginsJquery ?>.js'></script>

<?php
    $pluginsJqueryUiTouch = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');
    ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $pluginsJqueryUiTouch ?>.js"></script>

<?php
    $couroufredsel = filemtime(PATH_ASSETS.'js/caroufredsel.js');
    ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $couroufredsel ?>.js"></script>

<?php
    $jsPlugins = filemtime(PATH_ASSETS.'js/plugins.js');
    ?>
    <script type="text/javascript" src="js/plugins.<?php echo $jsPlugins ?>.js"></script>

<?php
    $pluginsBreakpoints = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js');
    ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $pluginsBreakpoints ?>.js"></script>

 <?php
    $pluginsDatables = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js');
    ?>   
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $pluginsDatables ?>.js"></script>

<?php
    $pluginsPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js');
    ?>  
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginsPrettyPhoto ?>.js"></script>

<?php
    $pluginsMyCustomScrollbar = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js');
    ?> 

    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $pluginsMyCustomScrollbar ?>.js"></script>

<?php
    $pluginsTagInput = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js');
    ?> 
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $pluginsTagInput ?>.js"></script>

<?php
    $pluginsBoostrap = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js');
    ?> 

    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $pluginsBoostrap ?>.js"></script>

<?php
    $pluginsBlockUi = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js');
    ?> 
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $pluginsBlockUi ?>.js"></script>

<?php
    $pluginsPNotify = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js');
    ?>  

    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pluginsPNotify ?>.js"></script>

<?php
    $theme = filemtime(PATH_ASSETS.'js/theme.js');
    ?>  
    
    <script type="text/javascript" src="js/theme.<?php echo $theme ?>.js"></script>

<?php
    $custom = filemtime(PATH_ASSETS.'custom/custom.js');
    ?> 
    <script type="text/javascript" src="custom/custom.<?php echo $custom ?>.js"></script>

    <!-- Specific Page Scripts Put Here -->
<?php
    $pluginsBootstrapWizard = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js');
    ?> 

    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $pluginsBootstrapWizard ?>.js'></script>

<?php
    $datePicker = filemtime(PATH_ASSETS.'js/datepicker-fr.js');
    ?>   

    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datePicker ?>.js"></script>
    <!-- Head SCRIPTS -->

<?php
    $modernizr = filemtime(PATH_ASSETS.'js/modernizr.js');
    ?>     
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script>

<?php
    $mobileDetect = filemtime(PATH_ASSETS.'js/mobile-detect.min.js');
    ?>  

    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script>

<?php
    $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js');
    ?> 

    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>

<?php
    $jquerryMaskedInput = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js');
    ?> 
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $jquerryMaskedInput ?>.js"></script>

<?php
    $compteWidget = filemtime(PATH_ASSETS.'js/compte_widget.js');
    ?> 
    <script type="text/javascript" src="js/compte_widget.<?php echo $compteWidget ?>.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]--> 



</head>

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">

<div class="col-xs-12 table-responsive"  style='padding:0;'>
    <div class="col-md-12" style='padding-right: 0px;padding-left: 0px;'>
        <div id="divrdvdispoattente" style="padding:0;display:none;">
            <div align='center'><br><br><h2>En attente de traitement...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
        </div>
        <div id="divrdvdispo"></div>
    </div>
</div>

<div class="content">
    <div class="container">
        <div class="vd_content clearfix">
            <div class="vd_content-section clearfix">
                <div class="row">
                    {foreach from=$aTabRecommandation item=objrecommandation}
                    <div class="col-sm-12">
                        <div class="panel widget" >
                            <div class="panel-heading vd_bg-red">
                                <h3 class="panel-title"> <span class="menu-icon"> <i class="icon-pie"></i> </span>  {$objrecommandation.titre_recommandation} </h3>

                            </div>
                            <div class="panel-body">
                                <p>
                                   {$objrecommandation.contenu_recommandation}
                                </p>
                            </div>
                        </div>
                    </div>
                    {/foreach}


            </div>
    </div>
</div>
</div>

</body>
</html>