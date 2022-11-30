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
    <link href="css/bootstrap.min.{$cssBoostrapMinCss}.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.{$cssFontAwesomeMinCss}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.{$cssFontEntypoCss}.css" rel="stylesheet" type="text/css">  

    <!-- Fonts CSS -->
    <link href="css/fonts.{cssFontCss}.css"  rel="stylesheet" type="text/css">
    <link href="css/datepicker.{$cssDatepickerCss}.css" rel="stylesheet" type="text/css">

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

    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$pluginsBoostrapTimepickerCss}.css" rel="stylesheet" type="text/css">
    <link href="css/jquery-clockpicker.min.{$cssJqueryClockpicker}.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="css/theme.{$cssThemeCss}.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.{$cssChromeCss}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->     


        
    <!-- Responsive CSS -->
          <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 

    
 
 
    <!-- for specific page in style css -->
  <link href="css/jquery-ui.structure.min.{$cssJqueryUiStructureCss}.css" rel="stylesheet" type="text/css">
  <link href="css/jquery-ui.theme.min.{$cssJqueryUiThemeCss}.css" rel="stylesheet" type="text/css">
  <link href="css/jquery-clockpicker.min.{$cssJqueryClockpickerminCss}.css" rel="stylesheet" type="text/css">
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
   <link href="custom/custom.{$cssCustomCss}.css" rel="stylesheet" type="text/css">


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
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel ?>.js"></script> 

    <?php $plugins = filemtime(PATH_ASSETS.'js/plugins.js'); ?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugins ?>.js"></script>


    <?php $breakpoints = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoints ?>.js"></script>

    <?php $jQuerryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jQuerryDataTablesMin ?>.js"></script>

    <?php $jQuerryPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $jQuerryPrettyPhoto ?>.js"></script> 
    
    <?php $jQuerrymCustomScrollBarConcatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $jQuerrymCustomScrollBarConcatMin ?>.js"></script>

    <?php $jQuerryTagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js'); ?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jQuerryTagsInputMin ?>.js"></script>

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
    <?php $bootstrapTimePickerMin = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $bootstrapTimePickerMin ?>.js'></script>

    <?php $jQuerryBootstrapWizardMin = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $jQuerryBootstrapWizardMin ?>.js'></script>


    <?php $datepicker = filemtime(PATH_ASSETS.'js/datepicker.js'); ?>
    <script type="text/javascript" src="js/datepicker.<?php echo $datepicker ?>.js"></script>

    <?php $datepickerFr = filemtime(PATH_ASSETS.'js/datepicker-fr.js'); ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepickerFr ?>.js"></script>

    <?php $jQuerryClockPickerMin = filemtime(PATH_ASSETS.'js/jquery-clockpicker.min.js'); ?>
    <script type="text/javascript" src="js/jquery-clockpicker.min.<?php echo $jQuerryClockPickerMin ?>.js"></script>


    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS.'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script> 


    <?php $mobileDetectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script> 

    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script> 

    <?php $jQuerryMaskedInputMin = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js'); ?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $jQuerryMaskedInputMin ?>.js"></script>

    <?php $ckeditor = filemtime(PATH_ASSETS.'plugins/ckeditor/ckeditor.js'); ?>
    <script type="text/javascript" src='plugins/ckeditor/ckeditor.<?php echo $ckeditor ?>.js'></script>

    <?php $jquery2 = filemtime(PATH_ASSETS.'plugins/ckeditor/adapters/jquery.js'); ?>
    <script type="text/javascript" src='plugins/ckeditor/adapters/jquery.<?php echo $jquery2 ?>.js'></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
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

      select {
          
          height: 39px;
        }
    </style>



<script type="text/javascript">
  $(document).ready(function() {
    var divdatedebut = document.getElementById('divdatedebut');
    var divdatefin = document.getElementById('divdatefin');
    var divsemaine = document.getElementById('divsemaine');

    $("#heuredebut").mask("99:99");
    $("#heurefin").mask("99:99");
    $("#datedebut").mask("99/99/9999");
    $("#datefin").mask("99/99/9999");

    $("#saction").on('change', function() {
      if($("#saction").val()==1 ||$("#saction").val()==""){
        divdatedebut.style.display = 'none';
        divdatefin.style.display = 'none';
        divsemaine.style.display = 'none';
      }else{
        divdatedebut.style.display = 'block';
        divdatefin.style.display = 'block';
        divsemaine.style.display = 'block';
      }
    });

    $("#add-dispo-form").submit( function() {

      if( $('#supp_valide').val()=="0"){
        return false;
      }

      if(!CheckHeure($("#heuredebut").val(),"Heure de début")){
        return false;
      }

      if(!CheckHeure($("#heurefin").val(),"Heure de fin")){
        return false;
      }

      if(!CheckDate($("#datedebut").val(),"Date de début"),0){
        return false;
      }
      
      if(!CheckDate($("#datefin").val(), "Date de fin"),0){
        return false;
      }

    });

  });

  function confirmation_supp(stext){
    if (confirm(stext)) {
      $('#supp_valide').val("1");
      $('#add-dispo-form').submit();
    } else {
      $('#supp_valide').val("0");
    }
  }


  $(function () {
    $("#idsalle").load('ajax/lst_salle_attente.php?bplanning=1&type=attente&idlieu=' + $("#idlieu").val()+'&idsalle={/literal}{$idsalle}{literal}');

      $.ajax({
          url: 'ajax/lst_salle_attente.php',
          data: 'bplanning=1&type=consult&idlieu=' + $("#idlieu").val()+'&idsalle={/literal}{$idbox}{literal}',
          dataType: 'html',
          success: function(data) {
              $('#idbox').html("<option value=''></option>"+data);
          }
      });

    $("#idlieu").change(function () {
      $("#idsalle").load('ajax/lst_salle_attente.php?bplanning=1&type=attente&idlieu=' + $("#idlieu").val());
    });

    $("#idlieu").change(function () {
        $.ajax({
            url: 'ajax/lst_salle_attente.php',
            data: 'bplanning=1&type=consult&idlieu=' + $("#idlieu").val(),
            dataType: 'html',
            success: function(data) {
                $('#idbox').html("<option value=''></option>"+data);
            }
        });
    });

  });

</script>
{/literal}
{if $bsucess}
  {literal}
    <script type="text/javascript">
      parent.close_modal_principal('', '', '1');
      parent.refresh_calendar();
    </script>
  {/literal}
{/if}

</head>    

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">
<div class="row">

<div id="myModal" style='display:block;' class="col-md-6">
  <div  style="margin-top:0px;margin-bottom:0px;" class="col-md-12">
    <div>
      <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
        {if $bActionmodif}
        <form class="form-horizontal" id="add-dispo-form" name="add-dispo-form">
            {/if}
          <div class="vd_content-section clearfix" style="padding:0px;">
            <div class="row" style="margin-bottom:0px;">
              <div class="col-md-full">
                <div class="panel widget">
                    <div class="panel-body">

                      <input type="hidden" name="dir" id="dir" value="{$dir}" />
                      <input type="hidden" name="idunique" id="idplanning_type" value="{$idplanning_type}" />
                      <input type="hidden" name="idtranche" id="idtranche" value="{$idtranche}" />
                      <input type="hidden" name="validation" id="validation" value="ok" />
                      <input type="hidden" name="id_user" id="id_user" value="{$id_user}" />
                      <input type="hidden" name="idc" id='idc' value="" />
                      <input type="hidden" name="supp_valide" id='supp_valide' value="1" />
                      {literal}
                      <script type="text/javascript">
                        $(document).ready(function() {
                          if($("#idtranche").val()!=""){
                            divdatedebut.style.display = 'none';
                            divdatefin.style.display = 'none';
                            divsemaine.style.display = 'none';
                          }
                        });
                      </script>
                      {/literal}
                      {if $berror}
                        <div class="alert alert-danger">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                          <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                          {$sMessageError}
                        </div>
                      {/if}

                       {if $bwarning}
                        <div class="alert alert-warning">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                          <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                          {$sMessageWarning}
                        </div>
                      {/if}


                      <div class="form-group" id="divlieux">
                        <div class="col-sm-12 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Lieu</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                            <select name="idlieu" id="idlieu" required class="required">
                              <option value=""></option>
                              {if !empty($aTableauLieu)}
                                {section name=sec1 loop=$aTableauLieu}
                                  <option value="{$aTableauLieu[sec1]['id_lieu_user']}" {if $idlieu eq $aTableauLieu[sec1]['id_lieu_user']}selected="selected"{/if}>{$aTableauLieu[sec1]['nom_lieux']}</option>
                                {/section}
                              {/if}
                            </select>
                          </div>
                        </div>
                      </div>

                      <div class="form-group" id="divsalleconsult">
                        <div class="col-sm-12 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Salle de consultation (Salle)</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                            <select name="idbox" id="idbox"></select>
                          </div>
                        </div>
                      </div>

                      <div class="form-group" id="divsalleattente">
                        <div class="col-sm-12 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Salle d'attente</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                            <select name="idsalle" id="idsalle" required class="required"></select>
                          </div>
                        </div>
                      </div>

                      <div class="form-group" id="divactivite">
                        <div class="col-sm-12 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Activité</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                            <select name="idactivite" id="idactivite" required class="required">
                              <option value=""></option>
                              {foreach from=$aTableauActivite item=objActivite}
                                                              <option value="{$objActivite.identifiant_activite}" {if $idactivite eq $objActivite.identifiant_activite}selected="selected"{/if}>{if $objActivite.abreviation_type_activite!=""}({$objActivite.abreviation_type_activite}) -{/if} {$objActivite.libelle_type_activite}</option>
                              {/foreach}
                            </select>
                          </div>
                        </div>
                      </div>

                      <div class="form-group" id="divopenttel">
                        <div class="col-sm-4 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Ouvert pour internet</label>
                          </div>
                          <div class="vd_radio radio-success">
                            <input type="radio" name="opentwidget" {if $opentwidget eq 'Y'}checked="checked"{/if}  value="Y" id="id_openttel_oui">
                            <label  for="id_openttel_oui">OUI</label>
                            <input type="radio" name="opentwidget" {if $opentwidget eq 'N'}checked="checked"{/if}  value="N" id="id_openttel_non">
                            <label  for="id_openttel_non">Non</label>

                          </div>
                        </div>

                        <div class="col-sm-4 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Ouvert pour le telephone</label>
                          </div>
                          <div class="vd_radio radio-success">
                            <input type="radio" name="opentel" {if $opentel eq 'Y'}checked="checked"{/if}  value="Y" id="id_opentel_oui">
                            <label  for="id_opentel_oui">OUI</label>
                            <input type="radio" name="opentel" {if $opentel eq 'N'}checked="checked"{/if} value="N" id="id_opentel_non">
                            <label  for="id_opentel_non">Non</label>

                          </div>
                        </div>

                        <div class="col-sm-4 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Ouvert pour interpro</label>
                          </div>
                          <div class="vd_radio radio-success">
                            <input type="radio" name="opentinterpro" {if $opentinterpro eq 'Y'}checked="checked"{/if} value="Y" id="id_opentinterpro_oui">
                            <label  for="id_opentinterpro_oui">OUI</label>
                            <input type="radio" name="opentinterpro" {if $opentinterpro eq 'N'}checked="checked"{/if} value="N" id="id_opentinterpro_non">
                            <label  for="id_opentinterpro_non">Non</label>

                          </div>
                        </div>
                      </div>

                      <div class="form-group" id="divtyperdv">
                        <div class="col-sm-12 controls">
                          <div class="input-group">
                            <label >Motif de rendez vous</label>
                            <div>
                              <div class="vd_checkbox checkbox-success">
                                <input
                                  type="checkbox"
                                  class=""
                                  name="id_checkAll_dispo"
                                  value=""
                                  id="id_checkAll_dispo"
                                >
                                <label for="id_checkAll_dispo"> Tous </label>
                                {foreach from=$aTableauTyperdv item=objTyperdv}
                                  <input class="class_checkAll_dispo" id="checkbox-{$objTyperdv.id}" type="checkbox"  name="typerdv[]" value="{$objTyperdv.id}" {if in_array($objTyperdv.id, $typerdv)}checked=checked{/if}>
                                  <label for="checkbox-{$objTyperdv.id}"> {$objTyperdv.abreviation} - {$objTyperdv.libelle} </label>
                                {/foreach}
                              </div>
                              {literal}
                              <script type="text/javascript">
                                $(function () {
                                  $("#id_checkAll_dispo").click(function () {
                                    if ($("#id_checkAll_dispo").is(':checked')) {
                                      $(".class_checkAll_dispo").each(function () {
                                        $(this).prop("checked", true);
                                      });

                                    } else {
                                      $(".class_checkAll_dispo").each(function () {
                                        $(this).prop("checked", false);
                                      });
                                    }
                                  });
                                });

                              </script>
                              {/literal}
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <div class="form-group" id="divheurejour">
                        <div class="col-sm-3 controls">
                          <div class="input-group">
                            <label >Heure de début</label>
                            <div class="input-group bootstrap-timepicker">
                              <input type="text" id="heuredebut" name="heuredebut" value="{$heuredebut}" class="required input-modal-date-left" required>
                              <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                            </div>
                          </div>
                          {literal}
                          <script type="text/javascript">
                            $(document).ready(function() {
                              $("#heuredebut").clockpicker({
                                placement: 'top',
                                autoclose: true
                              });
                            });
                          </script>
                          {/literal}

                        </div>
                        <div class="col-sm-3 controls">
                          <div class="input-group">
                            <label >Heure de fin</label>
                            <div class="input-group bootstrap-timepicker">
                              <input type="text" id="heurefin" name="heurefin" value="{$heurefin}" class="required input-modal-date-left" required>
                              <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i>
                            </div>
                          </div>
                          {literal}
                            <script type="text/javascript">
                              $(document).ready(function() {
                                $("#heurefin").clockpicker({
                                  placement: 'top',
                                  autoclose: true
                                });
                              });
                            </script>
                          {/literal}

                        </div>
                        <div id="divsemaine" class="col-sm-6 controls">
                          <div class="input-group">
                            <label >Jour de la semaine</label>
                            <div>

                              <div class="vd_checkbox checkbox-success">
                                <input id="checkbox-Lundi" type="checkbox" name="day[]" value="1" {if in_array('1', $day)}checked=checked{/if}>
                                <label for="checkbox-Lundi"> Lundi </label>

                                <input id="checkbox-Mardi" type="checkbox" name="day[]" value="2" {if in_array('2', $day)}checked=checked{/if}>
                                <label for="checkbox-Mardi"> Mardi </label>

                                <input id="checkbox-Mercredi" type="checkbox" name="day[]" value="3" {if in_array('3', $day)}checked=checked{/if}>
                                <label for="checkbox-Mercredi"> Mercredi </label>

                                <input id="checkbox-Jeudi" type="checkbox" name="day[]" value="4" {if in_array('4', $day)}checked=checked{/if}>
                                <label for="checkbox-Jeudi"> Jeudi </label>

                                <input id="checkbox-Vendredi" type="checkbox" name="day[]" value="5" {if in_array('5', $day)}checked=checked{/if}>
                                <label for="checkbox-Vendredi"> Vendredi </label>

                                <input id="checkbox-Samedi" type="checkbox" name="day[]" value="6" {if in_array('6', $day)}checked=checked{/if}>
                                <label for="checkbox-Samedi"> Samedi </label>

                                <input id="checkbox-Dimanche" type="checkbox" name="day[]" value="0" {if in_array('0', $day)}checked=checked{/if}>
                                <label for="checkbox-Dimanche"> Dimanche </label>

                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      
{*
                      <div class="form-group" id="divperiode">
                        <div class="col-sm-6 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Récurrence</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                            <select name="recurence" id="recurrence">
                              <option value="0"></option>
                              <option value="1">Semaine en cours</option>
                              <option value="2">Une semaine sur deux</option>
                            </select>
                          </div>
                        </div>
                      </div>
*}
                      <div class="col-sm-12 controls" id="divperiode" align="center">
                          {if $bActionmodif}
                        {if $idunique!=""}
                          <button id="btn_del" name="btn_del" value="1" type="submit" onclick="confirmation_supp('Voulez vous vraiment supprimer ? ATTENTION : cette action effacera les sur planning enregistrés');" class="btn vd_btn vd_bg-red">Supprimer</button>
                          <button id="btn_update" name="btn_update" value="1" type="submit" class="btn vd_btn vd_bg-green" >Modifier</button>
                         {*
                          <button id="btn_del" name="btn_update" value="1" type="button" onclick="location.replace('modal_disponibilite_partition.php?idunique={$idunique}&id_user={$id_user}&idtranche={$idtranche}')" class="btn vd_btn vd_bg-red">Partitionner</button>
                        *}
                        {else}
                          {if !$bblocaction}
                          <button id="btn_add" name="btn_add" type="submit" class="btn vd_btn vd_bg-green"  ">Valider</button>
                          {/if}
                        {/if}
                        {/if}

                        <button type="button" class="btn vd_btn vd_bg-grey"  onclick="parent.close_modal_principal('','');">Annuler</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
            </div>
          </div>
        {if $bActionmodif}
        </form>
      {/if}
      </div>
    </div>
  </div>



<div id="myModal" style='display:block;padding-top: 32px;' class="col-md-6">

  <table border="1" width="100%" class="table table-bordered">
    <tr>
      <caption style="padding-top: 10px;">
        Les  plannings enregistrés
      </caption>
    </tr>
    <thead>
    <tr>
      <th>

      </th>
      <th>
        Date debut
      </th>
      <th>
        Heure debut
      </th>
      <th>
        Heure fin
      </th>
      <th>
        Widget
      </th>
      <th>
        Téléphone
      </th>
      <th>
        Interpro
      </th>
      <th>
        Statut planning Actif
      </th>
    </tr>
    </thead>
    {foreach from=$aTableauplanning item=objTypesurplanning}
      <tr>
        <td>
          <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Action <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
              <li><a href="#" onclick="bconfirm =location.replace('?idunique={$idunique}&actiontranche=modification&idtranche={$idtranche}&idtranchesup={$objTypesurplanning.id_plannig_dispo}')">Modifier</a></li>
              <li><a href="#" onclick="bconfirm =confirm('Voulez vous desactiver cetter tranche');if(bconfirm)location.replace('?idunique={$idunique}&actiontranche=desa&idtranche={$idtranche}&idtranchesup={$objTypesurplanning.id_plannig_dispo}')">Desactiver</a></li>
              <li><a href="#" onclick="bconfirm =confirm('Voulez vous supprimer cetter tranche');if(bconfirm)location.replace('?idunique={$idunique}&actiontranche=supp&idtranche={$idtranche}&idtranchesup={$objTypesurplanning.id_plannig_dispo}')">Supprimer</a></li>
              <li><a href="#" onclick="bconfirm =confirm('Voulez vous desactiver toutes les tranches associées');if(bconfirm)location.replace('?idunique={$idunique}&actiontranche=desaall&idtranche={$idtranche}&idtranchesup={$objTypesurplanning.id_plannig_dispo}')">desactiver toutes les tranches associées</a></li>
              <li><a href="#" onclick="bconfirm =confirm('Voulez vous supprimer toutes les tranches associées');if(bconfirm)location.replace('?idunique={$idunique}&actiontranche=supaall&idtranche={$idtranche}&idtranchesup={$objTypesurplanning.id_plannig_dispo}')">Supprimer toutes les tranches associées</a></li>
            </ul>
          </div>
        </td>
        <td>
          {$objTypesurplanning.datedebut}
        </td>
        <td>
          {$objTypesurplanning.heureebut}
        </td>
        <td>
          {$objTypesurplanning.heurefin}
        </td>
        <td>
          {$objTypesurplanning.ouverture_widget_planning_dispo}
        </td>
        <td>
          {$objTypesurplanning.ouverture_telephone_planning_dispo}
        </td>
        <td>
          {$objTypesurplanning.ouverture_interpro_planning_dispo}
        </td>
        <td>
          {$objTypesurplanning.desactivation_planning_dispo}
        </td>
      </tr>
    {/foreach}
  </table>

</div>

</div>

</body>
</html>