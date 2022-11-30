<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html><!--<![endif]-->

<!-- Specific Page Data -->

<!-- End of Data -->

<head>
    <meta charset="utf-8" />
    <title>Modifier MDP {$leserveur}</title>
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

	<!-- Specific CSS -->
	    
     
    <!-- Theme CSS -->
    <link href="css/theme.min.{$cssThemeMinCss}.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.{$cssChromeCss}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
          <link href="css/theme-responsive.min.{$cssThemeResponsiveMinCss}.css" rel="stylesheet" type="text/css"> 

    
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
   <link href="custom/custom.{$cssCustomCss}.css" rel="stylesheet" type="text/css">


    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS . 'js/modernizr.js') ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script> 
    <?php $mobileDetect = filemtime(PATH_ASSETS . 'js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script> 
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS . 'js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script> 
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
</head>    

<body id="pages" class="full-layout no-nav-left no-nav-right  nav-top-fixed background-login     responsive remove-navbar login-layout   clearfix" data-active="pages "  data-smooth-scrolling="1">     
<div class="vd_body">
<!-- Header Start -->

<!-- Header Ends --> 
<div class="content">
  <div class="container"> 
    
    <!-- Middle Content Start -->
    
    <div class="vd_content-wrapper">
      <div class="vd_container">
        <div class="vd_content clearfix">
          <div class="vd_content-section clearfix">
            <div class="vd_login-page">
              <div class="heading clearfix">
                <div class="logo">
                  <h2 class="mgbt-xs-5"><img src="{$iLogo}" alt="{$sSite}"></h2>
                </div>
                <h4 class="text-center font-semibold vd_grey">{$sTxtConnectezVousAVotreCompte}</h4>
                
              </div>
              <div class="panel widget">
                <div class="panel-body">
                  <div class="login-icon entypo-icon"> <i class="icon-key"></i> </div>
                  <form class="form-horizontal" id="login-form" action="" role="form" method="post">
                    <input type="hidden" name="validation" value="ok">
                  <div class="alert alert-danger vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>{$sTxtEchec}</strong>{$sTxtVerifChampsObligatoire}</div>
                  <div class="alert alert-success vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span><strong>{$sTxtConnexionEnCours}</strong>. </div> 
                    {if $MessageConnexion!=''}
                    <div class="alert alert-danger ">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                      <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>{$sTxtEchec} </strong>
                      {$MessageConnexion}
                    </div>
                    {/if}                 
                    <div class="form-group  mgbt-xs-20">
                      <div class="col-md-12">
                        <input type="hidden" name="centre" id="id_centre" value="{$centre}">
                        <input type="hidden" name="zf1475" id="id_zf1475" value="{$zf1475}">
                       {if $bmodifmdp}
                        <div class="label-wrapper">
                          <label class="control-label sr-only" for="password">Entrez votre nouveau mot de passe</label>
                        </div>
                        <div class="vd_input-wrapper" id="password-input-wrapper" > 
                          <input type="password" placeholder="Entrez votre nouveau mot de passe" id="password" name="pwd" class="required" required>
                        </div>

                        <div class="label-wrapper">
                          <label class="control-label sr-only" for="password">Ressaisissez votre nouveau mot de passe</label>
                        </div>
                        <div class="vd_input-wrapper" id="password-input-wrapper" > 
                          <input type="password" placeholder="Ressaisissez votre nouveau mot de passe<" id="password" name="pwd2" class="required" required>
                        </div>
                      
                       {else}
                        <div class="label-wrapper sr-only">
                          <label class="control-label" for="email">Votre email de connexion</label>
                        </div>
                        <div class="vd_input-wrapper" id="email-input-wrapper"> <span class="menu-icon"> <i class="fa fa-envelope"></i> </span>
                          <input type="email" placeholder="Votre email de connexion" id="email" name="log" class="required" required>
                        </div>
                        {/if}
                      </div>  
                    </div>
                    <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i>{$sTxtChampsObligatoire}</div>
                    <div class="form-group">
                      <div class="col-md-12 text-center mgbt-xs-5">
                        <button class="btn vd_bg-green vd_white width-100" type="submit" id="login-submit">Envoyer le lien</button>
                      </div>
                      <div class="col-md-12">
                        <div class="row">
                          
                        </div>
                      </div>
                    </div>
                  </form>
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
  <footer class="footer-2"  id="footer">      
    <div class="vd_bottom ">
        <div class="container">
            <div class="row">
              <div class=" col-xs-12">
                <div class="copyright text-center">
                  	Copyright &copy;2015 Alaxione.fr
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
<?php $jquery = filemtime(PATH_ASSETS . 'js/jquery.js') ?>
<script type="text/javascript" src="js/jquery.<?php echo $jquery ?>.js"></script> 
<!--[if lt IE 9]>
  <script type="text/javascript" src="js/excanvas.js"></script>      
<![endif]-->
<?php $bootstrap = filemtime(PATH_ASSETS . 'js/bootstrap.min.js') ?>
<script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrap ?>.js"></script> 
<?php $jqueryCustom = filemtime(PATH_ASSETS . 'plugins/jquery-ui/jquery-ui.custom.min.js') ?>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryCustom ?>.js'></script>
<?php $jqueryTouch = filemtime(PATH_ASSETS . 'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryTouch ?>.js"></script>

<?php $caroufredsel = filemtime(PATH_ASSETS . 'js/caroufredsel.js') ?>
<script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel ?>.js"></script> 
<?php $plugin = filemtime(PATH_ASSETS . 'js/plugins.js') ?>
<script type="text/javascript" src="js/plugins.<?php echo $plugin ?>.js"></script>

<?php $breakpoints = filemtime(PATH_ASSETS . 'plugins/breakpoints/breakpoints.js') ?>
<script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoints ?>.js"></script>
<?php $dataTables = filemtime(PATH_ASSETS . 'plugins/dataTables/jquery.dataTables.min.js') ?>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $dataTables ?>.js"></script>
<?php $prettyPhoto = filemtime(PATH_ASSETS . 'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhoto ?>.js"></script> 

<?php $mCustomScrollbar = filemtime(PATH_ASSETS . 'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbar ?>.js"></script>
<?php $tagsInput = filemtime(PATH_ASSETS . 'plugins/tagsInput/jquery.tagsinput.min.js') ?>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInput ?>.js"></script>
<?php $switch = filemtime(PATH_ASSETS . 'plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $switch ?>.js"></script>
<?php $blockUI = filemtime(PATH_ASSETS . 'plugins/blockUI/jquery.blockUI.js') ?>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $blockUI ?>.js"></script>
<?php $pnotify = filemtime(PATH_ASSETS . 'plugins/pnotify/js/jquery.pnotify.min.js') ?>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotify ?>.js"></script>

<?php $theme = filemtime(PATH_ASSETS . 'js/theme.js') ?>
<script type="text/javascript" src="js/theme.<?php echo $theme ?>.js"></script>
<?php $custom = filemtime(PATH_ASSETS . 'custom/custom.js') ?>
<script type="text/javascript" src="custom/custom.<?php echo $custom ?>.js"></script>


</body>
</html>