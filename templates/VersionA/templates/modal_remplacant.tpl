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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../img/ico/favicon.png">
    
    
    <!-- CSS -->
       
    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="css/fonts.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">
   
         
    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery-clockpicker.min.css" rel="stylesheet" type="text/css">


    <!-- Theme CSS -->
    <link href="../css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="../css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


        
    <!-- Responsive CSS -->
          <link href="../css/theme-responsive.min.css" rel="stylesheet" type="text/css">

    
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="../custom/custom.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <?php  $jquery_1 = filemtime(PATH_ASSETS.'../js/jquery.js');?>
    <script type="text/javascript" src="../js/jquery.<?php echo $jquery_1 ?>.js"></script>
    <!--[if lt IE 9]>
      <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->
    <?php  $boostrapMin = filemtime(PATH_ASSETS.'../js/bootstrap.min.js');?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $boostrapMin ?>.js"></script>
    
    <?php  $customMin = filemtime(PATH_ASSETS.'../plugins/jquery-ui/jquery-ui.custom.min.js');?>
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMin ?>.js'></script>
    
    <?php  $punchMin = filemtime(PATH_ASSETS.'../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');?>
    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMin ?>.js"></script>

    <?php  $caroufredelMax = filemtime(PATH_ASSETS.'../js/caroufredsel.js');?>
    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufredelMax ?>.js"></script>
    
    <?php  $pluginMin = filemtime(PATH_ASSETS.'../js/plugins.js');?>
    <script type="text/javascript" src="../js/plugins.<?php echo $pluginMin ?>.js"></script>

    <?php  $breakpointMin = filemtime(PATH_ASSETS.'../plugins/breakpoints/breakpoints.js');?>
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $breakpointMin ?>.js"></script>
    
    <?php  $datatableMin = filemtime(PATH_ASSETS.'../plugins/dataTables/jquery.dataTables.min.js');?>
    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $datatableMin ?>.js"></script>
    
    <?php  $PrettyPhoto = filemtime(PATH_ASSETS.'../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js');?>
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $PrettyPhoto ?>.js"></script>

    <?php  $concatMin = filemtime(PATH_ASSETS.'../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js');?>
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $concatMin ?>.js"></script>
    
    <?php  $tagsMin = filemtime(PATH_ASSETS.'../plugins/tagsInput/jquery.tagsinput.min.js');?>
    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsMin ?>.js"></script>
    
    <?php  $switchMax = filemtime(PATH_ASSETS.'../plugins/bootstrap-switch/bootstrap-switch.min.js');?>
    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $switchMax ?>.js"></script>
    
    <?php  $blockUi_1 = filemtime(PATH_ASSETS.'../plugins/blockUI/jquery.blockUI.js');?>
    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUi_1 ?>.js"></script>
    
    <?php  $pnotifyMin = filemtime(PATH_ASSETS.'../plugins/pnotify/js/jquery.pnotify.min.js');?>
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotifyMin ?>.js"></script>

    <?php  $theme_5 = filemtime(PATH_ASSETS.'../js/theme.js');?>
    <script type="text/javascript" src="../js/theme.<?php echo $theme_5 ?>.js"></script>
    
    <?php  $custom_9 = filemtime(PATH_ASSETS.'../custom/custom.js');?>
    <script type="text/javascript" src="../custom/custom.<?php echo $custom_9 ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->
    
    <?php  $wizardMin = filemtime(PATH_ASSETS.'../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js');?>
    <script type="text/javascript" src='../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizardMin ?>.js'></script>

    <?php  $datepickerMin = filemtime(PATH_ASSETS.'../js/datepicker.js');?>
    <script type="text/javascript" src="../js/datepicker.<?php echo $datepickerMin ?>.js"></script>
    
    <?php  $datepickerMin_2 = filemtime(PATH_ASSETS.'../js/datepicker-fr.js');?>
    <script type="text/javascript" src="../js/datepicker-fr.<?php echo $datepickerMin_2 ?>.js"></script>
    
    <?php  $clocpickerMin = filemtime(PATH_ASSETS.'../js/jquery-clockpicker.min.js');?>
    <script type="text/javascript" src="../js/jquery-clockpicker.min.<?php echo $clocpickerMin ?>.js"></script>
    <!-- Head SCRIPTS -->
    
    <?php  $modernizr_8 = filemtime(PATH_ASSETS.'../js/modernizr.js');?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernizr_8 ?>.js"></script>
    
    <?php  $mobileDetect = filemtime(PATH_ASSETS.'../js/mobile-detect.min.js');?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script>
    
    <?php  $modernizrDetect = filemtime(PATH_ASSETS.'../js/mobile-detect-modernizr.js');?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $modernizrDetect ?>.js"></script>
    
    <?php  $maskedinputMin = filemtime(PATH_ASSETS.'../js/jquery.maskedinput.min.js');?>
    <script type="text/javascript" src="../js/jquery.maskedinput.min.<?php echo $maskedinputMin ?>.js"></script>

    <?php  $ckeditorMax = filemtime(PATH_ASSETS.'../plugins/ckeditor/ckeditor.js');?>
    <script type="text/javascript" src='../plugins/ckeditor/ckeditor.<?php echo $ckeditorMax ?>.js'></script>
    
    <?php  $ckeditorAdapter = filemtime(PATH_ASSETS.'../plugins/ckeditor/adapters/jquery.js');?>
    <script type="text/javascript" src='../plugins/ckeditor/adapters/jquery.<?php echo $ckeditorAdapter ?>.js'></script>

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
        position: initial !important;
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
    } else {
      $('#supp_valide').val("0");
    }
  }


</script>
{/literal}
{if $bsucess}
  {literal}
    <script type="text/javascript">
        parent.refresh_calendar();
      parent.close_modal_principal('', '', '1');
    </script>

  {/literal}
{/if}

</head>    

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">     

<div id="myModal" style='display:block;'>
  <div class="modal-dialog" style="margin-top:0px;margin-bottom:0px;">
    <div>
      <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;"> 
        <form class="form-horizontal" id="add-dispo-form" name="add-dispo-form">
          <div class="vd_content-section clearfix" style="padding:0px;">
            <div class="row" style="margin-bottom:0px;">
              <div class="col-md-full">
                <div class="panel widget">
                    <div class="panel-body">

                      <input type="hidden" name="idunique" id="idunique" value="{$idunique}" />
                      <input type="hidden" name="idplage" id="idplage" value="{$idplage}" />
                      <input type="hidden" name="validation" id="validation" value="ok" />
                      <input type="hidden" name="identifiant_user" id="identifiant_user" value="{$identifiant_user}" />
                      <input type="hidden" name="supp_valide" id='supp_valide' value="1" />
                      {literal}
                      <script type="text/javascript">
                        $(document).ready(function() {
                          if($("#idplage").val()!=""){
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

                      {if $idunique!=""}
                      <div class="form-group" id="divlieux">
                        <div class="col-sm-12 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Vous souhaitez effectuer l'action pour</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                            <select name="saction" id="saction" required class="required">
                              <option value=""></option>
                              <option value="1" selected>Seulement la tranche sélectionnée</option>
                              <option value="2">Toutes les tranches qui correspondent à ces critères</option>
                            </select>
                          </div>
                        </div>
                      </div>

                      {/if}
                      <div class="form-group" id="divlieux">
                        <div class="col-sm-12 controls">
                          <div class="label-wrapper-modal">
                            <label class="control-label">Remplaçant</label>
                          </div>
                          <div class="vd_input-wrapper-modal">
                              <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                              <?php  $select2Min = filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js');?>
                              <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.<?php echo $select2Min ?>.js"></script>

                            <select class="js-example-basic-multiple" name="idremplacant" id="idremplacant" required class="required">
                              <option value=""></option>
                              {if !empty($aTableauRemplacant)}
                                {section name=sec1 loop=$aTableauRemplacant}
                                  <option value="{$aTableauRemplacant[sec1]['identifiant_user']}" {if $idremplacant eq $aTableauRemplacant[sec1]['identifiant_user']}selected="selected"{/if}>{$aTableauRemplacant[sec1]['abreviation_civilite']} {$aTableauRemplacant[sec1]['nom_user']} {$aTableauRemplacant[sec1]['prenom_user']}</option>
                                {/section}
                              {/if}
                            </select>
                            {* {literal}
                                <script type="text/javascript">        
                                    $(document).ready(function() {
                                        $('.js-example-basic-multiple').select2();
                                    });

                                </script>
                            {/literal}
 *}
                          </div>
                        </div>
                      </div>

                      
                      <div class="form-group" id="divheurejour">
                        <div class="col-sm-3 controls">
                          <div class="input-group">
                            <label >Heure de début</label>
                            <div class="input-group bootstrap-timepicker" id="groupe_heuredebut">
                                <input type="text" id="heuredebut" name="heuredebut" value="{$heuredebut}" class="required input-modal-date-left" required>
                                <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                            </div>
                          </div>
                          {literal}
                          <script type="text/javascript">
                            $(document).ready(function() {
                              $("#groupe_heuredebut").clockpicker({
                                placement: 'bottom',
                                autoclose: true
                              });
                            });
                          </script>
                          {/literal}      
                          <div  id="divdatedebut">
                            <label >Date de début</label>
                            <div class="input-group">
                              <input type="text" value="{$datedebut}" name="datedebut" id="datedebut" required class="required input-modal-date-left">
                              <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#datedebut">
                                <i class="fa fa-calendar"></i>
                              </span>
                            </div>
                            <div id="bookingBoxdatedebut" style="position: absolute;z-index: 1;"></div>
                            {literal}
                              <script type="text/javascript">
                                $(document).ready(function() {
                                  $( "#datedebut" ).datepicker({
                                      dateFormat: 'dd/mm/yy',
                                      changeMonth: true,
                                      changeYear: true,
                                      onSelect: function(selectedDate) {
                                          $("#datefin").val(selectedDate);
                                      },
                                      beforeShow:function(textbox, instance){
                                          $('#ui-datepicker-div').css({
                                              position: 'initial',
                                              top:-20,
                                              left:5
                                          });
                                          $('#bookingBoxdatedebut').append($('#ui-datepicker-div'));
                                          $('#ui-datepicker-div').hide();
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
                        <div class="col-sm-3 controls">
                          <div class="input-group">
                            <label >Heure de fin</label>
                            <div class="input-group bootstrap-timepicker" id="group_heurefin">
                                <input type="text" id="heurefin" name="heurefin" value="{$heurefin}" class="required input-modal-date-left" required>
                                <span class="input-group-addon input-modal-date-right" id="timepicker-default-span">
                                  <i class="fa fa-clock-o"></i>
                                </span>
                            </div>
                          </div>
                          {literal}
                            <script type="text/javascript">
                              $(document).ready(function() {
                                $("#group_heurefin").clockpicker({
                                  placement: 'bottom',
                                  autoclose: true
                                });
                              });
                            </script>
                          {/literal}
                          <div id="divdatefin">
                            <label >Date de fin</label>
                            <div class="input-group">
                              <input type="text" value="{$datefin}" name="datefin" id="datefin" required class="required input-modal-date-left">
                              <span class="input-group-addon input-modal-date-right" id="datepicker-icon-trigger" data-datepicker="#datefin">
                                <i class="fa fa-calendar"></i>
                              </span>
                            </div>
                            <div id="bookingBoxdatefin" style="position: absolute;z-index: 1;"></div>
                            {literal}
                              <script type="text/javascript">
                                $(document).ready(function() {
                                  $( "#datefin" ).datepicker({
                                      dateFormat: 'dd/mm/yy',
                                      changeMonth: true,
                                      changeYear: true,
                                      beforeShow:function(textbox, instance){
                                          $('#ui-datepicker-div').css({
                                              position: 'initial',
                                              top:-20,
                                              left:5
                                          });
                                          $('#bookingBoxdatefin').append($('#ui-datepicker-div'));
                                          $('#ui-datepicker-div').hide();
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

                      <div class="col-sm-12 controls" id="divperiode" align="center">
                        {if $idunique!=""}
                          <button id="btn_del" name="btn_del" value="1" type="submit" onclick="confirmation_supp('Voulez vous vraiment supprimer ?');" class="btn vd_btn vd_bg-red">Supprimer</button>
                          <button id="btn_update" name="btn_update" value="1" type="submit" class="btn vd_btn vd_bg-green">Modifier</button>
                        {else}
                          <button id="btn_add" name="btn_add" type="submit" class="btn vd_btn vd_bg-green">Valider</button>
                        {/if}
                        
                        <button type="button" class="btn vd_btn vd_bg-grey"  onclick="parent.close_modal_principal('','');">Annuler</button>
                      </div>
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
<div style="height: 250px"></div>
</body>
</html>