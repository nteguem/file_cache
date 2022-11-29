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
    <link href="../css/bootstrap.min.{$cssBootstrapMin892}.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.{$cssFontAwesomeMin342}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.{$cssFontAwesomei732}.css"><![endif]-->
    <link href="../css/font-entypo.{$cssFontEntypo}.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.{$cssFont7}.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.{$pluginsJquery765}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.{$pluginsPrettyPhoto876}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.{$pluginsIsotope90}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.{$pluginspnotify45}.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.{$pluginsGoogleCodePrettify}.css" rel="stylesheet" type="text/css">
   
         
    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$pluginsMcustomScrollbar23}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.{$pluginsTagsInput5}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.{$pluginsBootstrapSwitch12}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.{$pluginsDaterange34}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$pluginsBoottsrap67}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.{$pluginscolorpicker90}.css" rel="stylesheet" type="text/css">


    <!-- Theme CSS -->
    <link href="../css/theme.min.{$cssTheme54}.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="../css/ie.{$cssIe0}.css" rel="stylesheet" > <![endif]-->
    <link href="../css/chrome.{$cssChrome23}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


        
    <!-- Responsive CSS -->
          <link href="../css/theme-responsive.min.{$cssThemeResponsive9}.css" rel="stylesheet" type="text/css">

    
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="../custom/custom.{$custom53}.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <?php $jQuery_1 filemtime(PATH_ASSETS.'../js/jquery.js') ?>

    <script type="text/javascript" src="../js/jquery.<?php echo $jQuery_1 ?>.js"></script>
    <!--[if lt IE 9]>
      <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->
    <?php $bootstrapMin_1 filemtime(PATH_ASSETS.'../js/bootstrap.min.js') ?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrapMin_1 ?>.js"></script>
    <?php $jQcustomMin_1 filemtime(PATH_ASSETS.'../plugins/jquery-ui/jquery-ui.custom.min.js') ?>
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jQcustomMin_1 ?>.js'></script>
    <?php $punchMin_01 filemtime(PATH_ASSETS.'../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMin_01 ?>.js"></script>

    <?php $caroufred_01 filemtime(PATH_ASSETS.'../js/caroufredsel.js') ?>
    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufred_01 ?>.js"></script>
    <?php $plugins_01 filemtime(PATH_ASSETS.'../js/plugins.js') ?>
    <script type="text/javascript" src="../js/plugins.<?php echo $plugins_01 ?>.js"></script>

    <?php $pluginsBreakpointsBreakpoints filemtime(PATH_ASSETS.'../plugins/breakpoints/breakpoints.js') ?>
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $pluginsBreakpointsBreakpoints ?>.js"></script>
    <?php $jqueryDataTablesMin filemtime(PATH_ASSETS.'../plugins/dataTables/jquery.dataTables.min.js') ?>
    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesMin ?>.js"></script>
    <?php $pluginJqueryPrettyPhoto filemtime(PATH_ASSETS.'../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginJqueryPrettyPhoto ?>.js"></script>
  <link href="../css/jquery-clockpicker.min.{$cssJqueryClocpicker12}.css" rel="stylesheet" type="text/css">

    <?php $ContctMin_01 filemtime(PATH_ASSETS.'../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $ContctMin_01 ?>.js"></script>
    <?php $tagsInput_01 filemtime(PATH_ASSETS.'../plugins/tagsInput/jquery.tagsinput.min.js') ?>
    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInput_01 ?>.js"></script>
    <?php $bootstrapSwitchMin filemtime(PATH_ASSETS.'../plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>
    <?php $blockUI_01 filemtime(PATH_ASSETS.'../plugins/blockUI/jquery.blockUI.js') ?>
    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUI_01 ?>.js"></script>
    <?php $pNotify_01 filemtime(PATH_ASSETS.'../plugins/pnotify/js/jquery.pnotify.min.js') ?>
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pNotify_01 ?>.js"></script>
  <?php $clockPicker filemtime(PATH_ASSETS.'../js/jquery-clockpicker.min.js') ?>
  <script type="text/javascript" src="../js/jquery-clockpicker.min.<?php echo $clockPicker ?>.js"></script>

    <?php $theme_01 filemtime(PATH_ASSETS.'../js/theme.js') ?>
    <script type="text/javascript" src="../js/theme.<?php echo $theme_01 ?>.js"></script>
    <?php $custom_01 filemtime(PATH_ASSETS.'../custom/custom.js') ?>
    <script type="text/javascript" src="../custom/custom.<?php echo $custom_01 ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->

    <?php $wizardMin_01 filemtime(PATH_ASSETS.'../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizardMin_01 ?>.js'></script>

    <?php $dataPickerFr filemtime(PATH_ASSETS.'../js/datepicker-fr.js') ?>
    <script type="text/javascript" src="../js/datepicker-fr.<?php echo $dataPickerFr ?>.js"></script>
    <!-- Head SCRIPTS -->
    <?php $modernzr_01 filemtime(PATH_ASSETS.'../js/modernizr.js') ?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernzr_01 ?>.js"></script>
    <?php $mobileDetectMin filemtime(PATH_ASSETS.'../js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script>
    <?php $mobileDetectModernizr filemtime(PATH_ASSETS.'../js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>
    <?php $jqueryMaskedinputMin filemtime(PATH_ASSETS.'../js/jquery.maskedinput.min.js') ?>
    <script type="text/javascript" src="../js/jquery.maskedinput.min.<?php echo $jqueryMaskedinputMin ?>.js"></script>

    <?php $pluginsCkeditorCkeditor filemtime(PATH_ASSETS.'../plugins/ckeditor/ckeditor.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/ckeditor.<?php echo $pluginsCkeditorCkeditor ?>.js'></script>
    <?php $ckeditorAdaptersJquery filemtime(PATH_ASSETS.'../plugins/ckeditor/adapters/jquery.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/adapters/jquery.<?php echo $ckeditorAdaptersJquery ?>.js'></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="../js/html5shiv.js"></script>
      <script type="text/javascript" src="../js/respond.min.js"></script>
    <![endif]-->

{literal}


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

      select {
          
          height: 39px;
        }
    </style>



<script type="text/javascript">
  $(document).ready(function() {

    $("#datedebut").mask("99/99/9999");
    $("#datefin").mask("99/99/9999");
    if ('{/literal}{$beensupp}{literal}' === 'true'){
      $('#ongletprofil').click()
    }
    $("#add-dispo-form").submit( function() {
      $('#btn_add').attr("disabled",true);
      if(!CheckDate($("#datedebut").val(),"Date de début"),0){
        return false;
      }
      
      if(!CheckDate($("#datefin").val(), "Date de fin"),0){
        return false;
      }

      if(!confirm('{/literal}{$sMessageAlert}{literal} '+$("#datedebut").val()+' au '+$("#datefin").val()+' inclus ?')){
        $('#btn_add').attr("disabled",false);
        return false;
      }

    });

  });




</script>
{/literal}



</head>    

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">
{if $bsucess}
{literal}
  <script type="text/javascript">
      parent.refresh_calendar();
  </script>
{/literal}
{/if}

<div id="myModal" style='display:block;'>
  <div class="modal-dialog" style="margin-top:0px;margin-bottom:0px;">
    <div>
      <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
        {* ONGLETS *}
        <div class="vd_content-section clearfix" style="padding:0;">
            <div class="row" style="margin-bottom:0;">
                <div class="col-md-full">
                    <div class="panel widget" style="margin-bottom:150px">
                        <h2 id="title_name_praticien" align="center">Organisation des absences pour le praticien {$nom_praticien} </h2>
                        {if isset($bMessageErreur) and $bMessageErreur}
                            <div class="alert alert-danger">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                                <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                                {if isset($sMessageErreur)}{$sMessageErreur}{/if}
                            </div>
                        {/if}
                        {if isset($bMessageSucces) and $bMessageSucces}
                          <div class="alert alert-success">
                              <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                              <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
                              {if isset($sMessageSucces)}{$sMessageSucces}{/if}
                          </div>
                        {/if}

                        <div class="panel-body">
                          <div class="row" style="margin-right: 18px; margin-left: 18px;">
                            <div class="tabs">
                              <ul class="nav nav-tabs widget vd_bg-color">
                                  <li class="{$activeinfo}">
                                    <a href="#info-tab" data-toggle="tab"> 
                                      <span class="menu-icon"><i class="fa fa-user"></i></span>
                                        Informations
                                      <span class="menu-active"><i class="fa fa-caret-up"></i></span> 
                                    </a>
                                  </li>
                                  <li class="{$activeliste}">
                                    <a href="#profil-tab" id="ongletprofil" data-toggle="tab">
                                      <span class="menu-icon"><i class="fa fa-history"></i></span>
                                        Liste des absences
                                      <span class="menu-active"><i class="fa fa-caret-up"></i></span> 
                                    </a>
                                  </li>
                              </ul>
                              <div class="tab-content mgbt-xs-20">

                                {* DEBUT ONGLET INFORMATION *}
                                <div class="tab-pane {$activeinfo}" id="info-tab">
                                  <div class="col-sm-12" style="margin-top:0px;margin-bottom:0px;">
                                    <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">

                                      <form class="form-horizontal" id="add-dispo-form" name="add-dispo-form">
                                        <div class="vd_content-section clearfix" style="padding:0px;">
                                          <div class="row" style="margin-bottom:0px;">
                                            <div class="col-md-full">
                                              <div class="panel widget">
                                                <div class="panel-body">
                                                  <h2>{$sTitre}</h2><br>

                                                  <input type="hidden" name="validation" id="validation" value="ok" />
                                                  <input type="hidden" name="identifiant_user"value="{$identifiant_user}" />
                                                  <input type="hidden" name="idc" id='idc' value="" />
                                                  {if $berror}
                                                    <div class="alert alert-danger">
                                                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                                                      <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                                                      {$sMessageError}
                                                    </div>
                                                  {/if}

                                                  {if $bsucess}
                                                    <div class="alert alert-success">
                                                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                                                      <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
                                                      {$sMessageSucces}
                                                    </div>
                                                  {/if}

                                                  {if !$bactionsupp}
                                                    <div class="form-group">
                                                      <div class="col-sm-12 controls">
                                                        <div  id="divdatedebut">
                                                          <label >Libellé absence</label>
                                                          <div class="input-group">
                                                            <input type="text" value="{$libelleconge}" name="libelleconge" id="libelleconge" size="60" required class="required ">
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  {/if}
                                                  <div class="form-group">
                                                    <div class="col-sm-6 controls">
                                                      <div  id="divdatedebut">
                                                        <label >Date de début (inclus)</label>
                                                        <div class="input-group">
                                                          <input type="text" value="{$datedebut}" name="datedebut" id="datedebut" required class="required input-modal-date-left">
                                                          <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#datedebut">
                                                            <i class="fa fa-calendar"></i>
                                                          </span>
                                                        </div>
                                                        {literal}
                                                          <script type="text/javascript">
                                                            $(document).ready(function() {
                                                              $( "#datedebut" ).datepicker({
                                                                  dateFormat: 'dd/mm/yy',
                                                                  changeMonth: true,
                                                                  changeYear: true,
                                                                  onSelect: function(selectedDate) {
                                                                      $("#datefin").val(selectedDate);
                                                                  }
                                                              });
                                                              $( '[data-datepicker]' ).click(function(e){
                                                                var data=$(this).data('datepicker');
                                                                $(data).focus();
                                                              });
                                                            });
                                                          </script>
                                                        {/literal}
                                                      </div>
                                                    </div>
                                                    <div class="col-sm-6 controls">
                                                      <div id="divdatefin">
                                                        <label >Date de fin (inclus)</label>
                                                        <div class="input-group">
                                                          <input type="text" value="{$datefin}" name="datefin" id="datefin" required class="required input-modal-date-left">
                                                          <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#datefin">
                                                            <i class="fa fa-calendar"></i>
                                                          </span>
                                                        </div>
                                                        {literal}
                                                          <script type="text/javascript">
                                                            $(document).ready(function() {
                                                              $( "#datefin" ).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,changeYear: true});
                                                              $( '[data-datepicker]' ).click(function(e){
                                                                var data=$(this).data('datepicker');
                                                                $(data).focus();
                                                              });
                                                            });
                                                          </script>
                                                        {/literal}
                                                      </div>
                                                    </div>

                                                    <div class="col-sm-6 controls">
                                                      <div class="input-group" id="divheuredebut0">
                                                        <label>Heure de début </label>
                                                        <div class="input-group bootstrap-timepicker">
                                                          <input type="text" id="heuredebut0"
                                                                name="heuredebut"
                                                                value="{$heuredebut}"
                                                                class="input-modal-date-left" >
                                                          <span class="input-group-addon input-modal-date-right"
                                                                id="timepicker-default-span">
                                                                <i class="fa fa-clock-o"></i>
                                                          </span>
                                                        </div>
                                                      </div>
                                                    </div>

                                                    {literal}
                                                      <script type="text/javascript">
                                                          $(document).ready(function () {
                                                              $("#heuredebut0").clockpicker({
                                                                  placement: 'top',
                                                                  autoclose: true
                                                              });
                                                              $("#heuredebut0").mask("99:99");
                                                          });
                                                          var posdisplayheuredebut = 1;
                                                          var posdisplayheurefin = 1;

                                                          function open_tranche(compte) {
                                                              sdivfin = "divheurefin" + compte;
                                                              sdivdebut = "divheuredebut" + compte;
                                                              document.getElementById(sdivfin).style.display = "block";
                                                              document.getElementById(sdivdebut).style.display = "block";

                                                              compte = compte + 1;
                                                              //alert(compte);
                                                              return compte;
                                                          }
                                                      </script>
                                                    {/literal}
                                                    <div class="col-sm-6 controls">
                                                      <div class="input-group" id="divheuredebut0">
                                                        <label>Heure de fin </label>
                                                        <div class="input-group bootstrap-timepicker">
                                                          <input type="text" id="heurefin0"
                                                                name="heurefin"
                                                                value="{$heurefin}"
                                                                class="input-modal-date-left" >
                                                          <span class="input-group-addon input-modal-date-right"
                                                                id="timepicker-default-span">
                                                                <i class="fa fa-clock-o"></i>
                                                          </span>
                                                        </div>
                                                      </div>
                                                    </div>

                                                    {literal}
                                                      <script type="text/javascript">
                                                          $(document).ready(function () {
                                                              $("#heurefin0").clockpicker({
                                                                  placement: 'top',
                                                                  autoclose: true
                                                              });
                                                              $("#heurefin0").mask("99:99");
                                                          });
                                                          var posdisplayheuredebut = 1;
                                                          var posdisplayheurefin = 1;

                                                          function open_tranche(compte) {


                                                              sdivfin = "divheurefin" + compte;
                                                              sdivdebut = "divheuredebut" + compte;
                                                              document.getElementById(sdivfin).style.display = "block";
                                                              document.getElementById(sdivdebut).style.display = "block";

                                                              compte = compte + 1;
                                                              //alert(compte);

                                                              return compte;

                                                          }
                                                      </script>
                                                    {/literal}

                                                    {if $bactionsupp}
                                                      <div class="col-sm-6 controls">
                                                        <div id="divdatefin">
                                                          <label >Appliquer également aux jours feriés</label>
                                                          <div class="input-group">
                                                            <input type="radio"  name="actifjf" value="Y">&nbsp; OUI
                                                            <input type="radio"  name="actifjf" value="N">&nbsp; NON

                                                            </span>
                                                          </div>
                                                            {literal}
                                                              <script type="text/javascript">
                                                                  $(document).ready(function() {
                                                                      $( "#datefin" ).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,changeYear: true});
                                                                      $( '[data-datepicker]' ).click(function(e){
                                                                          var data=$(this).data('datepicker');
                                                                          $(data).focus();
                                                                      });
                                                                  });
                                                              </script>
                                                            {/literal}
                                                        </div>
                                                      </div>
                                                    {/if}
                                                    <div class="col-sm-6 controls">
                                                      <div class="input-group">
                                                        <label>Jour de la semaine</label>
                                                        <div>
                                                          <div class="vd_checkbox checkbox-success">
                                                            <input id="checkbox-Lundi" type="checkbox" name="day[]"
                                                                  value="1"
                                                                  {if in_array('1', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Lundi"> Lundi </label>

                                                            <input id="checkbox-Mardi" type="checkbox" name="day[]"
                                                                  value="2"
                                                                  {if in_array('2', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Mardi"> Mardi </label>

                                                            <input id="checkbox-Mercredi" type="checkbox"
                                                                  name="day[]" value="3"
                                                                  {if in_array('3', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Mercredi"> Mercredi </label>

                                                            <input id="checkbox-Jeudi" type="checkbox" name="day[]"
                                                                  value="4"
                                                                  {if in_array('4', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Jeudi"> Jeudi </label>

                                                            <input id="checkbox-Vendredi" type="checkbox"
                                                                  name="day[]" value="5"
                                                                  {if in_array('5', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Vendredi"> Vendredi </label>

                                                            <input id="checkbox-Samedi" type="checkbox" name="day[]"
                                                                  value="6"
                                                                  {if in_array('6', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Samedi"> Samedi </label>

                                                            <input id="checkbox-Dimanche" type="checkbox"
                                                                  name="day[]" value="0"
                                                                  {if in_array('0', $day)}checked=checked{/if}>
                                                            <label for="checkbox-Dimanche"> Dimanche </label>

                                                          </div>
                                                        </div>
                                                      </div>
                                                    </div>

                                                    <div class="col-sm-6 controls">
                                                      <div class="input-group">
                                                        <label>Description</label>
                                                        <div>
                                                          <textarea tabindex="28" id="consigne" name="contenu" rows="5"  cols="90"></textarea>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  
                                                  <div class="col-sm-12 controls" id="divperiode" align="center">
                                                    {if $bactionsupp}<button id="btn_add" name="btn_add" type="submit" class="btn vd_btn vd_bg-red">Supprimer</button> 
                                                      {else}<button id="btn_add" name="btn_add" type="submit" class="btn vd_btn vd_bg-green">Valider</button>
                                                    {/if}&nbsp;&nbsp;
                                                    <button type="button" class="btn vd_btn vd_bg-grey"  onclick="parent.close_modal_principal('','');">Annuler</button>
                                                  </div>

                                                </div>
                                              </div>
                                            </div> 
                                          </div>
                                        </div>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                              </div>
                                {* FIN ONGLET INFORMATION *}

                                {* AJOUT ONGLET LISTE DES TRANCHES *}
                                <div class="tab-pane {$activeliste}" id="profil-tab">
                                  <div class="col-sm-12">
                                      {* Recherche de congés *}
                                      <div class="col-sm-12 panel-body" style="text-align: center;">
                                          <form class="form-horizontal" method="POST" id="add-search-conge" action="">
                                          {* <form class="form-horizontal" method="POST" id="add-search-conge" action="modal_conge_praticien.php#profil-tab"> *}
                                              <input type="hidden" name="identifiant_user" value="{$identifiant_user}"/>
                                               <input type="hidden" name="validation" id="validation" value="rech" />
                                              <input type="hidden" name="actiontranche" value=""/>
                                                  <div class="col-sm-4 controls">
                                                      <div  id="search_divdatedebut">
                                                        <label >Date de début (inclus)</label>
                                                        <div class="input-group">
                                                          <input type="text" value="{$search_datedebut}" name="search_datedebut" id="search_datedebut" class="input-modal-date-left">
                                                          <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#search_datedebut">
                                                            <i class="fa fa-calendar"></i>
                                                          </span>
                                                        </div>
                                                        {literal}
                                                          <script type="text/javascript">
                                                            $(document).ready(function() {
                                                              $( "#search_datedebut" ).datepicker({
                                                                  dateFormat: 'dd/mm/yy',
                                                                  changeMonth: true,
                                                                  changeYear: true,
                                                                  onSelect: function(selectedDate) {
                                                                      $("#search_datedebut").val(selectedDate);
                                                                  }
                                                              });
                                                              $( '[data-datepicker]' ).click(function(e){
                                                                var data=$(this).data('datepicker');
                                                                $(data).focus();
                                                              });
                                                            });
                                                          </script>
                                                        {/literal}
                                                      </div>
                                                    </div>
                                                    <div class="col-sm-4 controls">
                                                      <div id="search_divdatefin">
                                                        <label >Date de fin (inclus)</label>
                                                        <div class="input-group">
                                                          <input type="text" value="{$search_datefin}" name="search_datefin" id="search_datefin" class="input-modal-date-left">
                                                          <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#search_datefin">
                                                            <i class="fa fa-calendar"></i>
                                                          </span>
                                                        </div>
                                                        {literal}
                                                          <script type="text/javascript">
                                                            $(document).ready(function() {
                                                              $( "#search_datefin" ).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,changeYear: true, 
                                                                onSelect: function(selectedDate) {
                                                                      $("#search_datefin").val(selectedDate);
                                                                  }});
                                                              $( '[data-datepicker]' ).click(function(e){
                                                                var data=$(this).data('datepicker');
                                                                $(data).focus();
                                                              });
                                                            });
                                                          </script>
                                                        {/literal}
                                                      </div>
                                                    </div>

                                              <div class="col-sm-4 controls">
                                                  <div id="search_divdatefin">
                                                      <label >Afficher les jours fériés</label>
                                                      <div class="input-group">
                                                          <input type="radio" name="afficheconge" value="ok">&nbsp;oui &nbsp;&nbsp;   <input type="radio"  name="afficheconge" value="nop">&nbsp;non

                                                      </div>

                                                  </div>
                                              </div>

                                              <div class="col-sm-12">
                                                    {* <select name="sDatefiltre" style="width: inherit">
                                                        <option value=""></option> *}
                                                        {* {foreach from=$aTableauJourConge item=objjourconge}
                                                            <option value="{$objjourconge.date_conge_praticien}">{$objjourconge.ladate}</option>
                                                        {/foreach} *}
                                                    {* </select>&nbsp;&nbsp; *}
                                              <button class="btn vd_btn vd_bg-green" type="submit" style="margin-top:15px;">
                                                Rechercher                                                
                                              </button>
                                              </div>
                                          </form>
                                      </div>
                                      {* Tableau récapitulatif *}
                                      <table border="1" width="100%" class="table table-bordered">
                                          <thead>
                                              <tr>
                                                  <th></th>
                                                  <th>Libellé</th>
                                                  <th>Date du début</th>
                                                  <th>Heure du début</th>
                                                  <th>Heure de fin</th>
                                                  <th style="width: 30%;">Description</th>
                                                  <th style="width: 30%;">Utilisateur</th>
                                              </tr>
                                          </thead>

                                          {* Remplissage du tableau *}
                                          {foreach from=$aTableauConge item=objconge}
                                              <tr>
                                                  <td>

                                                      {* BOUTON ACTION *}
                                                      <div class="btn-group">
                                                          <button type="button" class="btn btn-default dropdown-toggle"
                                                                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                              Action <span class="caret"></span>
                                                          </button>
                                                          <ul class="dropdown-menu">
                                                              {* <li><a href="#"
                                                                      onclick="bconfirm =location.replace('modal_conges_praticien.php?identifiant_user={$identifiant_user}&actiontranche=actiondupliquer&idconge={$objconge.id_conge_praticien}')">Dupliquer</a>
                                                              </li> *}
                                                              <li><a href="#"
                                                                          {literal} onclick="bconfirm =confirm('Voulez vous supprimer cette absence ?');if(bconfirm){location.replace('{/literal}{$cheminpage}?identifiant_user={$identifiant_user}&actiontranche=supp&idconge={$objconge.id_conge_praticien}&beensupp=true');{literal}$('#ongletprofil').click(){/literal}}">Supprimer</a>
                                                              </li>
                                                          </ul>
                                                      </div>
                                                  </td>
                                                  <td>{$objconge.libelle}</td>
                                                  <td>{$objconge.ladate}</td>
                                                  <td>{$objconge.heure_debut}</td>
                                                  <td>{$objconge.heure_fin}</td>
                                                  <td>{$objconge.description}</td>
                                                  <td>{$objconge.nom_user} {$objconge.prenom_user}</td>
                                              </tr>
                                          {/foreach}

                                      </table>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
        {* FIN AJOUT ONGLET !!!! *}


</body>
</html>