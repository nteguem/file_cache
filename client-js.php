<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html><!--<![endif]-->

<!-- Specific Page Data -->

<!-- End of Data -->

<head>
    <meta charset="utf-8" />
    <title></title>
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
    <?php $bootstrapMin_2 = filemtime(PATH_ASSETS.'css/bootstrap.min.css'); ?>
    <link href="css/bootstrap.min.<?php echo $bootstrapMin_2 ?>.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <?php $styleSheet = filemtime(PATH_ASSETS.'css/font-entypo.css" rel="stylesheet'); ?>
    <link href="css/font-entypo.<?php echo $styleSheet ?>.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <?php $styleSheet_3 = filemtime(PATH_ASSETS.'css/fonts.css"  rel="stylesheet'); ?>
    <link href="css/fonts.<?php echo $styleSheet_3 ?>.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <?php $customMin_3 = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.css'); ?>
    <link href="plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMin_3 ?>.css" rel="stylesheet" type="text/css">    
    <?php $prettyPhoto_3 = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/css/prettyPhoto.css'); ?>
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.<?php echo $prettyPhoto_3 ?>.css" rel="stylesheet" type="text/css">
    <?php $isotopeCss_3 = filemtime(PATH_ASSETS.'plugins/isotope/css/isotope.css'); ?>
    <link href="plugins/isotope/css/isotope.<?php echo $isotopeCss_3 ?>.css" rel="stylesheet" type="text/css">
    <?php $pnotifyCss_3 = filemtime(PATH_ASSETS.'plugins/pnotify/css/jquery.pnotify.css'); ?>
    <link href="plugins/pnotify/css/jquery.pnotify.<?php echo $pnotifyCss_3 ?>.css" media="screen" rel="stylesheet" type="text/css">    
	<?php $prettify = filemtime(PATH_ASSETS.'plugins/google-code-prettify/prettify.css'); ?>
    <link href="plugins/google-code-prettify/prettify.<?php echo $prettify ?>.css" rel="stylesheet" type="text/css"> 
    <?php $mCustomScrollbar_3 = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'); ?>
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.<?php echo $mCustomScrollbar_3 ?>.css" rel="stylesheet" type="text/css">
    <?php $tagsInput_3 = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.css'); ?>
    <link href="plugins/tagsInput/jquery.tagsinput.<?php echo $tagsInput_3 ?>.css" rel="stylesheet" type="text/css">
    <?php $Switch = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.css'); ?>
    <link href="plugins/bootstrap-switch/bootstrap-switch.<?php echo $Switch ?>.css" rel="stylesheet" type="text/css">    
    <?php $daterangePicker_3 = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker-bs3.css'); ?>
    <link href="plugins/daterangepicker/daterangepicker-bs3.<?php echo $daterangePicker_3 ?>.css" rel="stylesheet" type="text/css">    
    <?php $timePicker = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'); ?>
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timePicker ?>.css" rel="stylesheet" type="text/css">
    <?php $colorpicker_3 = filemtime(PATH_ASSETS.'plugins/colorpicker/css/colorpicker.css'); ?>
    <link href="plugins/colorpicker/css/colorpicker.<?php echo $colorpicker_3 ?>.css" rel="stylesheet" type="text/css">            

	<!-- Specific CSS -->
	    
    <!-- Theme CSS -->
    <?php $styleSheet_4 = filemtime(PATH_ASSETS.'css/theme.min.css" rel="stylesheet'); ?>
    <link href="css/theme.min.<?php echo $styleSheet_4 ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <?php $styleSheet_5 = filemtime(PATH_ASSETS.'css/chrome.css" rel="stylesheet" type="text/chrome'); ?>
    <link href="css/chrome.<?php echo $styleSheet_5 ?>.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    

    <!-- Responsive CSS -->
    <?php $styleSheet_6 = filemtime(PATH_ASSETS.'css/theme-responsive.min.css" rel="stylesheet" type="text/css'); ?>
    <link href="css/theme-responsive.min.<?php echo $styleSheet_6 ?>.css" rel="stylesheet" type="text/css"> 
    
    <!-- Custom CSS -->
    <?php $styleSheet_8 = filemtime(PATH_ASSETS.'custom/custom.css" rel="stylesheet'); ?>
    <link href="custom/custom.<?php echo $styleSheet_8 ?>.css" rel="stylesheet" type="text/css">

    <!-- Head SCRIPTS -->
    <?php $modernizr_1 = filemtime(PATH_ASSETS.'js/modernizr.js');?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr_1 ?>.js"></script> 
    <?php $mobileDtectMin_1 = filemtime(PATH_ASSETS.'js/mobile-detect.min.js');?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDtectMin_1 ?>.js"></script> 
    <?php $mobileDtectModernizr_1 = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js');?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDtectModernizr_1 ?>.js"></script> 
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
</head>    

<body id="login-page" class="middle-layout no-nav-left no-nav-right  nav-top-fixed background-login     responsive remove-navbar front-layout   clearfix" data-active="login-page "  data-smooth-scrolling="1">     
<div class="vd_body">
	<div class="content">
        <div class="vd_banner vd_bg-white clearfix pd-20" >
            <div class="container">
                <div class="vd_content clearfix">
                    <div class="row">
                        <div class="col-md-12" align="center">
                            <h3>Widget design 1</h3>
                            <code>
                                <?php echo htmlentities('<script type="text/javascript">
                                    var idc = "identifiant_structure";
                                    var alx_v = "1";
                                    </script>'); ?><br/>
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client.js"></script> '); ?><br/>
                                <?php echo htmlentities('<noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>'); ?>
                            </code>

                            <script type="text/javascript">
                                var idc = "identifiant_structure";
                                var alx_v = "1";
                            </script>
                            <script type="text/javascript" src="https://<?php echo $_SERVER["SERVER_NAME"]; ?>/js/client.js"></script>
                            <noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <div class="vd_banner vd_bg-white clearfix pd-20" >
            <div class="container">
                <div class="vd_content clearfix">
                    <div class="row">
                        <div class="col-md-12" align="center">
                            <h3>Widget design 2</h3>
                            <code>
                                <?php echo htmlentities('<script type="text/javascript">
                                    var idc = "identifiant_structure";
                                    var alx_v = "2";
                                    var alx_ort = "h";
                                    </script>'); ?><br/>
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client.js"></script> '); ?><br/>
                                <?php echo htmlentities('<noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>'); ?>
                            </code>

                            <script type="text/javascript">
                                var idc = "identifiant_structure";
                                var alx_v = "2";
                                var alx_ort = "h";
                            </script>
                            <script type="text/javascript" src="https://<?php echo $_SERVER["SERVER_NAME"]; ?>/js/client.js"></script>
                            <noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <div class="vd_banner vd_bg-white clearfix pd-20" >
            <div class="container">
                <div class="vd_content clearfix">
                    <div class="row">
                        <div class="col-md-12" align="center">
                            <h3>Widget design 2 vertical </h3>
                            <code>
                                <?php echo htmlentities('<script type="text/javascript">
                                    var idc = "identifiant_structure";
                                    var alx_v = "2";
                                    var alx_ort = "v";
                                    </script>'); ?><br/>
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client.js"></script> '); ?><br/>
                                <?php echo htmlentities('<noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>'); ?>
                            </code>

                            <script type="text/javascript">
                                var idc = "identifiant_structure";
                                var alx_v = "2";
                                var alx_ort = "v";
                            </script>
                            <script type="text/javascript" src="https://<?php echo $_SERVER["SERVER_NAME"]; ?>/js/client.js"></script>
                            <noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <div class="vd_banner vd_bg-white clearfix pd-20" >
            <div class="container">
                <div class="vd_content clearfix">
                    <div class="row">
                        <div class="col-md-12" align="center">
                            <h3>Widget design 2 avec filtre sur un praticien</h3>
                            <code>
                                <?php echo htmlentities('<script type="text/javascript">
                                    var idc = "identifiant_structure";
                                    var idp = "identifiant_praticien";
                                    var alx_v = "2";
                                    var alx_ort = "h";
                                    </script>'); ?><br/>   
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client.js"></script> '); ?><br/>
                                <?php echo htmlentities('<noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>'); ?>
                            </code>

                            <script type="text/javascript">
                                var idc = "identifiant_structure";
                                var idp = "identifiant_praticien";
                                var alx_v = "2";
                                var alx_ort = "h";
                            </script>
                            <script type="text/javascript" src="https://<?php echo $_SERVER["SERVER_NAME"]; ?>/js/client.js"></script>
                            <noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <div class="vd_banner vd_bg-white clearfix pd-20" >
            <div class="container">
                <div class="vd_content clearfix">
                    <div class="row">
                        <div class="col-md-12" align="center">
                            <h3>Widget design 3</h3>
                            <code>
                                <?php echo htmlentities('<script type="text/javascript">
                                    var idc = "identifiant_structure";
                                    var alx_v = "3";
                                    var alx_ort = "h";
                                    </script>'); ?><br/>
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client.js"></script> '); ?><br/>
                                <?php echo htmlentities('<noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>'); ?>
                            </code>

                            <script type="text/javascript">
                                var idc = "identifiant_structure";
                                var alx_v = "3";
                                var alx_ort = "h";
                            </script>
                            <script type="text/javascript" src="https://<?php echo $_SERVER["SERVER_NAME"]; ?>/js/client.js"></script>
                            <noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

        <div class="vd_banner vd_bg-white clearfix pd-20" >
            <div class="container">
                <div class="vd_content clearfix">
                    <div class="row">
                        <div class="col-md-12" align="center">
                            <h3>Widget design 3 vertical</h3>
                            <code>
                                <?php echo htmlentities('<script type="text/javascript">
                                    var idc = "identifiant_structure";
                                    var alx_v = "3";
                                    var alx_ort = "v";
                                    </script>'); ?><br/>
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client.js"></script> '); ?><br/>
                                <?php echo htmlentities('<noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>'); ?>
                            </code>

                            <script type="text/javascript">
                                var idc = "identifiant_structure";
                                var alx_v = "3";
                                var alx_ort = "v";
                            </script>
                            <script type="text/javascript" src="https://<?php echo $_SERVER["SERVER_NAME"]; ?>/js/client.js"></script>
                            <noscript>Le JavaScript est désactivé sur votre navigateur !</noscript>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>

    </div>
</div>

<!-- Javascript =============================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<?php $jquery_1 = filemtime(PATH_ASSETS.'js/jquery.js'); ?>
<script type="text/javascript" src="js/jquery.<?php echo $jquery_1 ?>.js"></script> 
<!--[if lt IE 9]>
  <script type="text/javascript" src="js/excanvas.js"></script>      
<![endif]-->
<?php $bootstapMin_1 = filemtime(PATH_ASSETS'js/bootstrap.min.js'); ?>
<script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstapMin_1 ?>.js"></script> 
<?php $jquery_2 = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jquery_2 ?>.js'></script>
<?php $jquery_3 = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jquery_3 ?>.js"></script>

<?php $caroufRedSel_1 = filemtime(PATH_ASSETS.'js/caroufredsel.js'); ?>
<script type="text/javascript" src="js/caroufredsel.<?php echo $caroufRedSel_1 ?>.js"></script> 
<?php $plugins_1 = filemtime(PATH_ASSETS.'js/plugins.js'); ?>
<script type="text/javascript" src="js/plugins.<?php echo $plugins_1 ?>.js"></script>

<?php $pluginsBreackPoints_1 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js'); ?>
<script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $pluginsBreackPoints_1 ?>.js"></script>
<?php $dataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $dataTablesMin ?>.js"></script>
<?php $prettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhoto ?>.js"></script> 

<?php $mCustomScrollbarConcatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbarConcatMin ?>.js"></script>
<?php $tagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js'); ?>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInputMin ?>.js"></script>
<?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>
<?php $blockUi = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js'); ?>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $blockUi ?>.js"></script>
<?php $pnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js'); ?>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo ?>.js"></script>

<?php $theme_1 = filemtime(PATH_ASSETS.'js/theme.js'); ?>
<script type="text/javascript" src="js/theme.<?php echo $theme_1 ?>.js"></script>
<?php $custom_1 = filemtime(PATH_ASSETS.'custom/custom.js'); ?>
<script type="text/javascript" src="custom/custom.<?php echo $custom_1 ?>.js"></script>
 
<!-- Specific Page Scripts Put Here -->


</body>
</html>

