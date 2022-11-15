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
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <link href="css/fonts.css"  rel="stylesheet" type="text/css">
               
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
    <link href="css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    

    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 
    
    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">

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
                                   <?php $client = filemtime('https://'.$_SERVER["SERVER_NAME"].'/js/client.js');
?>
                                <?php echo htmlentities('<script type="text/javascript" src="https://'.$_SERVER["SERVER_NAME"].'/js/client'.$client.'.js"></script> '); ?><br/>
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
 
<!-- Specific Page Scripts Put Here -->


</body>
</html>

