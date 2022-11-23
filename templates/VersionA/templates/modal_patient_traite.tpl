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
    <meta HTTP-EQUIV="cache-control" CONTENT="NO-CACHE">
    <meta HTTP-EQUIV="pragma" CONTENT="NO-CACHE">

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


    <!-- Theme CSS -->
    <link href="css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
          <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 

    
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <?php $jQuerry = filemtime(PATH_ASSETS.'js/jquery.js'); ?>
    <script type="text/javascript" src="js/jquery.<?php echo $jQuerry ?>.js"></script> 
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->

    <?php $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js'); ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script> 

    <?php $jQuerryUICustomMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jQuerryUICustomMin ?>.js'></script>

    <?php $jQuerryUITouchPunchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jQuerryUITouchPunchMin ?>.js"></script>

    <?php $caroufredsel = filemtime(PATH_ASSETS.'js/caroufredsel.js'); ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $jQuerryUICustomMin ?>.js"></script> 


    <?php $plugins = filemtime(PATH_ASSETS.'js/plugins.js'); ?> 
    <script type="text/javascript" src="js/plugins.<?php echo $plugins ?>.js"></script>

    <?php $breakpoints = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoints ?>.js"></script>

    <?php $jQuerryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jQuerryDataTablesMin ?>.js"></script>

    <?php $jQuerryPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?> 
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $jQuerryPrettyPhoto ?>.js"></script> 

    <?php $jQuerryUICustomScrollBarConcatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?> 
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $jQuerryUICustomScrollBarConcatMin ?>.js"></script>

    <?php $jqueryTagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js'); ?> 
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jqueryTagsInputMin ?>.js"></script>

    <?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>

    <?php $jQuerryBlockUI = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js'); ?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $jQuerryBlockUI ?>.js"></script>


    <?php $jQuerryPnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js'); ?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $jQuerryPnotifyMin ?>.js"></script>


    <?php $theme = filemtime(PATH_ASSETS.'js/theme.js'); ?>
    <script type="text/javascript" src="js/theme.<?php echo $theme ?>.js"></script>

    <?php $custom = filemtime(PATH_ASSETS.'custom/custom.js'); ?>
    <script type="text/javascript" src="custom/custom.<?php echo $custom ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->

    <?php $jQuerryBootstrapWizardMin = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $jQuerryBootstrapWizardMin ?>.js'></script>


    <?php $datepickerFr = filemtime(PATH_ASSETS.'js/datepicker-fr.js'); ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepickerFr ?>.js"></script>


    <!-- Head SCRIPTS -->

    <?php $modernizr = filemtime(PATH_ASSETS.'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script> 

    <?php $mobileDetectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script> 

    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script> 

    <?php $jqueryMaskedInputMin = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js'); ?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $jqueryMaskedInputMin ?>.js"></script>

   <!-- Script pour l'auto-completion -->

    <?php $jqueryAutocompleteMin = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js'); ?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $jqueryAutocompleteMin ?>.js"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->

{literal}
<script type="text/javascript">
    function set_status_rdv(idrdv, idstatus){
        $.ajax({
            url: 'ajax/set_status_rdv.php',
            data: 'idrdv='+idrdv+'&idstatus='+idstatus,
            dataType: 'json',
            success: function(json) {}
        });
        return false;
    }

    $(document).ready(function() {
        set_status_rdv({/literal}{$idrdv}{literal}, 'patienttraite');
    });

</script>

    <style type="text/css">
      @media (min-width: 768px) {
        .modal-dialog {
          width:700px;
        }
      }

      .vd_bg-color {
        background-color: #5D9AD4 !important;
      }

      a {
        color: #5D9AD4;
      }

      a:hover {
        color: #5D9AD4;
      }

      .vd_radio.radio-success input[type=radio]:checked+label:before {
        border: 1px solid #5D9AD4;
      }

      .vd_radio.radio-success label:after {
        background-color: #5D9AD4;
        border: 1px solid #5D9AD4;
      }

      .ui-datepicker {
        background: #5D9AD4;
      }

      .ui-datepicker a {
        color: #fff;
      }

    </style>
     <style type="text/css">
        .autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
        .autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
        .autocomplete-selected { background: #F0F0F0; }
        .autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }

        select {
          
          height: 39px;
        }
    </style>


{/literal}


</head>    

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">
 

<div id="blocktotal">

  <div class="col-sm-12" style="padding-top:10px;">
    {if $berror}
      <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
        {$sMessageError}
      </div>
    {/if}

  {if $bsucess}
  {literal}
   <script type="text/javascript">
    parent.close_modal_principal('', '', '');
    </script>
    {/literal}
  {/if}

    <form action="" method="POST" class="form-horizontal">
        <input type="hidden" name="idrdv" value="{$idrdv}">
        <input type="hidden" name="validation" value="ok">
        <div class="form-group col-sm-12">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <label class="control-label">Transmettre un message au moment du paiement</label>
                <div class="controls">
                    <textarea id="message_transmis" name="message_transmis" cols="30" rows="3" autofocus>{$message_transmis}</textarea>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 controls" align="center">
                <button type="submit" name="updateButton" id="updateButton" class="btn vd_btn" style="background-color: #00D3C8;
                -webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px;
                -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;"><span class="menu-icon"></span> Envoyer</button>
            </div>
        </div>

    </form>

  </div>

</div>

</body>
</html>