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
    <?php $jquery_2 = filemtime(PATH_ASSETS.'js/jquery.js'); ?>
    <script type="text/javascript" src="js/jquery.<?php echo $jquery_2 ?>.js"></script> 
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js'); ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script> 
    <?php $jqueryCustumMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryCustumMin ?>.js'></script>
    <?php $jqueryUiTouchPunch = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryUiTouchPunch ?>.js"></script>

    <?php $caroufredsel_2 = filemtime(PATH_ASSETS.'js/caroufredsel.js'); ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel_2 ?>.js"></script> 
    <?php $plugins_2 = filemtime(PATH_ASSETS.'js/plugins.js'); ?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugins_2 ?>.js"></script>

    <?php $breakPoints_2 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakPoints_2 ?>.js"></script>
    <?php $jqueryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesMin ?>.js"></script>
    <?php $jqueryPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $jqueryPrettyPhoto ?>.js"></script> 

    <?php $mCustomScrollBar_2 = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollBar_2 ?>.js"></script>
    <?php $jqueryTagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js'); ?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jqueryTagsInputMin ?>.js"></script>
    <?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>
    <?php $jqueryBlockUi = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js'); ?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $jqueryBlockUi ?>.js"></script>
    <?php $jqueryPnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js'); ?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $jqueryPnotifyMin ?>.js"></script>

    <?php $themeJs = filemtime(PATH_ASSETS.'js/theme.js'); ?>
    <script type="text/javascript" src="js/theme.<?php echo $themeJs ?>.js"></script>
    <?php $custumJs = filemtime(PATH_ASSETS.'custom/custom.js'); ?>
    <script type="text/javascript" src="custom/custom.<?php echo $custumJs ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->

    <?php $jqueryBootstrapWizard = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $jqueryBootstrapWizard ?>.js'></script>

    <?php $dataPicker_2 = filemtime(PATH_ASSETS.'js/datepicker-fr.js'); ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $dataPicker_2 ?>.js"></script>
    <!-- Head SCRIPTS -->
    <?php $modernizr_2 = filemtime(PATH_ASSETS.'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr_2 ?>.js"></script> 
    <?php $mobileDetectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script> 
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script> 
    <?php $maskedInputMin = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js'); ?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedInputMin ?>.js"></script>

   <!-- Script pour l'auto-completion -->
    <?php $autoCompleteMin = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js'); ?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $autoCompleteMin ?>.js"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->

{literal}
<script type="text/javascript">

$(document).ready(function() {
  $("#telport").mask("99 99 99 99 99");
  $("#telfixe").mask("99 99 99 99 99");
});

function set_status_rdv(idrdv, idstatus){

  $.ajax({
    url: 'ajax/set_status_rdv.php',
    data: 'idrdv='+idrdv+'&idstatus='+idstatus,
    dataType: 'json',
    success: function(json) {}
  });
  return false;
}

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
      {if $sMessageTransmis}
          <div class="alert alert-info">
              <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_blue"></i></span>
              <h3>{$sMessageTransmis}</h3>
          </div>
      {/if}
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
      <div class="form-group">
        <div class="col-sm-12">
            <div class="col-sm-6">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                <?php $select2Min = filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js'); ?>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.<?php echo $select2Min ?>.js"></script>

                <label class="control-label">Mode de règlement</label>
                <div class="controls">
                    <select class="js-example-basic-single" name="mode_reglement" required >
                        {foreach from=$atabReglement item=objReglement}
                            <option value="{$objReglement.value}" {if $mode_reglement eq $objReglement.value}selected="selected"{/if}>{$objReglement.nom}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
                {literal}
                    <script type="text/javascript">        
                        $(document).ready(function() {
                            $('.js-example-basic-single').select2();
                        });

                    </script>
                {/literal}

            <div class="col-sm-6">
                <label class="control-label">Montant de la consultation</label>
                <div class="controls">
                    <div class="input-group">
                        <input type="text" name="montant_paiement" id="montant_paiement" value="{$montant_paiement}" required />
                        <span class="input-group-addon"> €</span>
                    </div>

                </div>
            </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-12 controls" align="center">
          <button type="submit" name="updateButton" id="updateButton" class="btn vd_btn" style="background-color: #00D3C8;
          -webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px;
          -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
          -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;"><span class="menu-icon"></span> Valider</button>
        </div>
      </div>

    </form>

  </div>

</div>

</body>
</html>