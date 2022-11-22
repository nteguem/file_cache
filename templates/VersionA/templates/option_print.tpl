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
        <?php
  $jquery = filemtime(PATH_ASSETS.'js/jquery.js');
?>
    <script type="text/javascript" src="js/jquery.<?php echo $jquery ?>.js"></script> 


    <!--[if lt IE 9]>
            <?php
  $excanvas = filemtime(PATH_ASSETS.'js/excanvas.js');
?>

      <script type="text/javascript" src="js/excanvas.<?php echo $excanvas ?>.js"></script>      
    <![endif]-->

            <?php
  $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js');
?>

    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script> 

            <?php
  $pluginsJquerry = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js');
?>

    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $pluginsJquerry ?>.js'></script>

            <?php
  $pluginsJqueryUI = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');
?>

    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $pluginsJqueryUI ?>.js"></script>

            <?php
  $caroufredsel = filemtime(PATH_ASSETS.'js/caroufredsel.js');
?>

    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel ?>.js"></script> 

            <?php
  $jquery = filemtime(PATH_ASSETS.'js/jquery.js');
?>

    <script type="text/javascript" src="js/plugins.<?php echo $jquery ?>.js"></script>

            <?php
  $pluginBreak = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js');
?>


    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $pluginBreak ?>.js"></script>

            <?php
  $pluginsDatabase = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js');
?>

    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $pluginsDatabase ?>.js"></script>

            <?php
  $pluginsPretty = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js');
?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginsPretty ?>.js"></script> 

            <?php
  $pluginsMCustom = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js');
?>

    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $pluginsMCustom ?>.js"></script>

            <?php
  $pluginsTagInput = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js');
?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jpluginsTagInputquery ?>.js"></script>

            <?php
  $pluginsBootstrap = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js');
?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $pluginsBootstrap ?>.js"></script>

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
    <script type="text/javascript" src="custom/custom.<?php echo $jquery ?>.js"></script>


     
    <!-- Specific Page Scripts Put Here -->

            <?php
  $pluginsWizard = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js');
?>

    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $pluginsWizard ?>.js'></script>

            <?php
  $datepicker = filemtime(PATH_ASSETS.'js/datepicker-fr.js');
?>

    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepicker ?>.js"></script>

            <?php
  $modernizr = filemtime(PATH_ASSETS.'js/modernizr.js');
?>
    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script> 

            <?php
  $mobileDetect = filemtime(PATH_ASSETS.'js/mobile-detect.min.js');
?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script> 

            <?php
  $mobiledetectModernzr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js');
?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobiledetectModernzr  ?>.js"></script> 

            <?php
  $maskedInput = filemtime(PATH_ASSETS.'jquery.maskedinput.min.js');
?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedInput ?>.js"></script> 

            <?php
  $compteWidget = filemtime(PATH_ASSETS.'js/compte_widget.js');
?>
    
    <script type="text/javascript" src="js/compte_widget.<?php echo $compteWidget ?>.js"></script>  


   <!-- Script pour l'auto-completion -->
           <?php
  $autocomplete = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js');
?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $autocomplete ?>.js"></script>



    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
            <?php
  $html5shiv = filemtime(PATH_ASSETS.'js/html5shiv.js');
?>
      <script type="text/javascript" src="js/html5shiv.<?php echo $html5shiv ?>.js"></script>

              <?php
  $respondMin = filemtime(PATH_ASSETS.'js/respond.min.js');
?>
      <script type="text/javascript" src="js/respond.min.<?php echo $respondMin ?>.js"></script>     
    <![endif]-->

        <?php
  $moment = filemtime(PATH_ASSETS.'js/moment.min.js');
?>
    <script type="text/javascript" src='js/moment.min.<?php echo $moment ?>.js'></script>
            <?php
  $daterangepicker1 = filemtime(PATH_ASSETS.'js/daterangepicker.js');
?>
    <script type="text/javascript" src='js/daterangepicker.<?php echo $daterangepicker1 ?>.js'></script>

{literal}
<script type="text/javascript">

$(document).ready(function() {

});


function gif_attente(){
  document.getElementById('blocktotal').style.display='none';
  document.getElementById('divrdvdispoattente').style.display='block';
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

    <div class="col-xs-12 table-responsive"  style='padding:0;'>
        <div class="col-md-12" style='padding-right: 0px;padding-left: 0px;'>
            <div id="divrdvdispoattente" style="padding:0;display:none;">
                <div align='center'><br><br><h2>En attente de traitement...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
            </div>
        </div>
    </div>

    <div id="blocktotal">
        <div class="col-sm-12" style="padding-top:10px;">
        {if $bsucess2}
            {literal}
                <script type="text/javascript">
                    parent.close_modal_principal('', '', '');
                </script>
            {/literal}
        {/if}

        {if $bpasse}

            <form action="" method="GET" class="form-horizontal">

        <div class="form-group">
          <div class="col-sm-3 controls">
            <label class="control-label">Date du RDV</label>
            <div class="controls">
              <div class="input-group">
                <input type="text" name="ladate" id="id_daterdv" value="{$TabInfoRDV[0].ladte}">
                <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_daterdv"><i class="fa fa-calendar"></i></span>
              </div>
            </div>
            {literal}
            <script type="text/javascript">
              $(document).ready(function() {
                      $( "#id_daterdv" ).daterangepicker(
                          {
                              "locale": {
                                  "format": "DD/MM/YYYY",
                                  "separator": " - ",
                                  "applyLabel": "Valider",
                                  "cancelLabel": "Annuler",
                                  "fromLabel": "De",
                                  "toLabel": "à",
                                  "customRangeLabel": "Custom",
                                  "daysOfWeek": [
                                      "Di",
                                      "Lu",
                                      "Ma",
                                      "Me",
                                      "Je",
                                      "Ve",
                                      "Sa"
                                  ],
                                  "monthNames": [
                                      "Janvier",
                                      "Février",
                                      "Mars",
                                      "Avril",
                                      "Mai",
                                      "Juin",
                                      "Juillet",
                                      "Août",
                                      "Septembre",
                                      "Octobre",
                                      "Novembre",
                                      "Décembre"
                                  ],
                                  "firstDay": 1
                              },
                              format: "DD/MM/YYYY",
                              singleDatePicker: true,
                              showDropdowns: true
                          }
                  );
                  $( '[data-datepicker]' ).click(function(e){
                      var data=$(this).data('datepicker');
                      $(data).focus();
                  });
              });
            </script>
            {/literal}
          </div>          


              <div class="form-group">
                <div class="col-sm-12 controls" align="center">
                  <button type="submit" onclick="gif_attente();document.getElementById('idvalidation').value='deplacer'" name="updateButton" id="updateButton2" class="btn vd_btn vd_bg-yellow"><span class="menu-icon"></span>Valider</button>&nbsp;&nbsp;
                  <button type="button" name="updateButton" id="updateButton" onclick="parent.close_modal_principal('','')" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                </div>
              </div>

      </form>
  </div>

</div>
</body>
</html>