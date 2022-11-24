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
    <link href="plugins/dataTables/css/jquery.dataTables.css" rel="stylesheet" type="text/css">
    <link href="plugins/dataTables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css">

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
    <script type="text/javascript" src="js/jquery.{$jQuerry}.js"></script> 
    
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js'); ?>
    <script type="text/javascript" src="js/bootstrap.min.{$bootstrapMin}.js"></script> 

    <?php $jQuerUiCustom = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.{$jQuerUiCustom}.js'></script>

    <?php $jQuerryUITouchPunchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.{$jQuerryUITouchPunchMin}.js"></script>

    <?php $caroufredsel = filemtime(PATH_ASSETS.'js/caroufredsel.js'); ?>
    <script type="text/javascript" src="js/caroufredsel.{$caroufredsel}.js"></script> 

    <?php $plugins = filemtime(PATH_ASSETS.'js/plugins.js'); ?>
    <script type="text/javascript" src="js/plugins.{$plugins}.js"></script>

    <?php $breakpoints = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.{$breakpoints}.js"></script>

    <?php $jQuerryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.{$jQuerryDataTablesMin}.js"></script>

    <?php $jQuerryPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.{$jQuerryPrettyPhoto}.js"></script> 

    <?php $jQuerrymCustomScrollBarConcatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.{$jQuerrymCustomScrollBarConcatMin}.js"></script>

    <?php $jQuerryTagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js'); ?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.{$jQuerryTagsInputMin}.js"></script>

    <?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.{$bootstrapSwitchMin}.js"></script>

    <?php $jQuerryBlockUI = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js'); ?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.{$jQuerryBlockUI}.js"></script>

    <?php $jQuerryPnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js'); ?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.{$jQuerryPnotifyMin}.js"></script>


    <?php $theme = filemtime(PATH_ASSETS.'js/theme.js'); ?>
    <script type="text/javascript" src="js/theme.{$theme}.js"></script>

    <?php $raphaelMin = filemtime(PATH_ASSETS.'custom/custom.js'); ?>
    <script type="text/javascript" src="custom/custom.{$raphaelMin}.js"></script>
     
    <!-- Specific Page Scripts Put Here -->
    <?php $jQuerryBootstrapWizardMin = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.{$jQuerryBootstrapWizardMin}.js'></script>


    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS.'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.{$modernizr}.js"></script> 

    <?php $mobileDetectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.{$mobileDetectMin}.js"></script> 

    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.{$mobileDetectModernizr}.js"></script> 
    
    <?php $listeE1 = filemtime(PATH_ASSETS.'js/liste_e1.js'); ?>
    <script type="text/javascript" src="js/liste_e1.{$listeE1}.js"></script>

    <?php $listeE2 = filemtime(PATH_ASSETS.'js/liste_e2.js'); ?>    
    <script type="text/javascript" src="js/liste_e2.{$listeE2}.js"></script>

    <?php $listeE3 = filemtime(PATH_ASSETS.'js/liste_e3.js'); ?>
    <script type="text/javascript" src="js/liste_e3.{$listeE3}.js"></script>

    <?php $listeE4 = filemtime(PATH_ASSETS.'js/liste_e4.js'); ?>
    <script type="text/javascript" src="js/liste_e4.{$listeE4}.js"></script>

    <?php $compteWidget = filemtime(PATH_ASSETS.'js/compte_widget.js'); ?>
    <script type="text/javascript" src="js/compte_widget.{$compteWidget}.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->


    {literal}
    <script type="text/javascript">
      var $current = 1;

      $(document).ready(function() {
        "use strict";
        var vbtn_prec = document.getElementById('btn_prec');

        //vbtn_prec.style.display="none";

        $( "#btn_next" ).click(function() {
          
          if($current == 1){
            liste_rdv_disponible($('#selectpraticien').val(), $('#selectlieux').val(),$('#selecttyperdv').val(), $('#selectnbpersonne').val(), 1);
          }

          if($current == 2){
            var mselect_rdv = $('input[name=select_rdv]');
            
            enregistrement_rdv(mselect_rdv.filter(':checked').val(),$("#cookie").val());
          }

          if($current == 3){
            info_recap($('#cookie').val());
          }
          
          if($current == 4){
            
          }

          return false;
        });


        $('#wizard-2').bootstrapWizard({
          'tabClass': 'nav nav-pills nav-justified',
          'nextSelector': '.wizard .next',
          'previousSelector': '.wizard .prev',
          'onTabShow' :  function(tab, navigation, index){
            $('#wizard-2 .finish').hide();
            $('#wizard-2 .next').show();

            if ($('#wizard-2 .nav li:last-child').hasClass('active')){
              $('#wizard-2 .next').hide();
              $('#wizard-2 .finish').show();
            }
            var $total = navigation.find('li').length;
            $current = index+1;
            var $percent = ($current/$total) * 100;
            $('#wizard-2').find('.progress-bar').css({width:$percent+'%'});    


            if ($current == 3){
              $('#wizard-2 .next').addClass('disabled');
            }

            if ($('#iduserP').val() != ""){
               $('#wizard-2 .next').removeClass('disabled');

            }
          },
          'onTabClick': function(tab, navigation, index) {
            
            
              return false; 
              
          },
          'onNext': function(){
            scrollTo('#wizard-2',-100);
          },
          'onPrevious': function(){
            scrollTo('#wizard-2',-100);
          }   
        }); 

        $('#btn_next').addClass('disabled');

        $('#gototab1').click(function() {
          $('#wizard-2 a[href="#tab21"]').tab('show');
        });
      });

      
    </script>
     <!-- Specific Page Scripts END -->


    
    <style type="text/css">
      @media (min-width: 768px) {
        .modal-dialog {
          width:700px;
        }
      }
        
    </style>
{/literal}
</head>    

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">     
<input type="hidden" value="{$cookie}" id='cookie' />
<input type="hidden" value="{$idc}" id='idc' />
<input type="hidden" value="" id='iduserP' name='iduserP' />
<div class="vd_body">
  <div class="content">
    <div class="container">
      <div class="vd_content-wrapper">
        <div class="vd_container">
          <div class="vd_content clearfix">
            <div class="row">
              <div class="col-md-6" style="margin-bottom:20px">
                <button class="btn vd_btn vd_bg-blue btn-lg btn-block" data-toggle="modal" data-target="#myModal">
                  Prendre un Rendez-Vous<br/>
                  <small class="subtitle">Nous allons vous guider pour prendre un rendez-vous pas à pas</small> 
                </button>
              </div>
              <div class="col-md-6">
                <button class="btn vd_btn vd_bg-blue btn-lg btn-block" data-toggle="modal" data-target="#myModal2">
                  Vous avez déjà un compte ?<br/>
                  <small class="subtitle">Accédez à votre compte pour modifier ou supprimer un rendez-vous</small> 
                </button>
              </div>
            </div>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog" >
                <div class="modal-content">
                  <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel">Prendre un rendez-vous</h4>
                  </div>
                  <div class="modal-body"> 
                    <form class="form-horizontal">
                      <div class="vd_content-section clearfix">

                        <div class="row">
                          <div class="col-md-full">
                            <div class="panel widget">
                              <div class="panel-heading vd_bg-grey">
                                <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-magic"></i> </span> Suivez les étapes pour prendre un rendez-vous </h3>
                              </div>
                              <div class="panel-body">
                                <form class="form-horizontal" action="#" role="form">
                                  <div id="wizard-2" class="form-wizard">
                                    <ul>
                                      <li><a href="#tab21" data-toggle="tab">
                                        <div class="menu-icon"> 1 </div>
                                        Motif RDV </a></li>
                                      <li><a href="#tab22" data-toggle="tab">
                                        <div class="menu-icon"> 2 </div>
                                        Rendez-vous disponibles </a></li>
                                      <li><a href="#tab23" data-toggle="tab">
                                        <div class="menu-icon"> 3 </div>
                                        Vos informations </a></li>
                                      <li><a href="#tab24" data-toggle="tab">
                                        <div class="menu-icon"> 4 </div>
                                        Récapitulatif </a></li>
                                    </ul>
                                    <div class="progress progress-striped active">
                                      <div class="progress-bar progress-bar-info" > </div>
                                    </div>
                                    <div class="tab-content no-bd">
                                      <div class="tab-pane" id="tab21">
                                        <div id="divtyperdv" class="form-group">
                                          <div class="col-sm-2"></div>
                                          <div class="col-sm-8 controls">
                                            <div class="label-wrapper">
                                              <label class="control-label">Quel est le motif de votre consultation?</label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                              <select id="selecttyperdv"></select>
                                            </div>
                                          </div>
                                          <div class="col-sm-2"></div>
                                        </div>

                                        <div id="divlieux" class="form-group" style='display:none'>
                                          <div class="col-sm-2"></div>
                                          <div class="col-sm-8 controls">
                                            <div class="label-wrapper">
                                              <label class="control-label">Quel est le lieu du rendez-vous?</label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                              <select id="selectlieux"></select>
                                            </div>
                                          </div>
                                          <div class="col-sm-2"></div>
                                        </div>

                                        <div id="divpraticien" class="form-group" style='display:none'>
                                          <div class="col-sm-2"></div>
                                          <div class="col-sm-8 controls">
                                            <div class="label-wrapper">
                                              <label class="control-label">Avec quel praticien?</label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                              <select id="selectpraticien"></select>
                                            </div>
                                          </div>
                                          <div class="col-sm-2"></div>
                                        </div>

                                        <div id="divnbpersonne" class="form-group" style='display:none'>
                                          <div class="col-sm-2"></div>
                                          <div class="col-sm-8 controls">
                                            <div class="label-wrapper">
                                              <label class="control-label">Le RDV concerne combien de personne ?</label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                              <select id="selectnbpersonne"></select>
                                            </div>
                                          </div>
                                          <div class="col-sm-2"></div>
                                        </div>

                                      </div>
                                      <div class="tab-pane" id="tab22">
                                        
                                        <div class="row">
                                          <div class="col-md-12" style="padding:0;">
                                            <div class="panel widget">
                                              <div class="panel-heading vd_bg-green">
                                                <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span> Rendez-vous disponible </h3>
                                              </div>
                                              
                                              <div class="col-xs-12 panel-body table-responsive" id="divrdvdisposimple" style='padding:0;'>
                                                <table class='table dataTable' style='border-size:0px;'>
                                                  <tbody>
                                                    <tr>
                                                      <td style="vertical-align:middle" align='center'>
                                                        <div id='divbtnprev' style="padding:0;display: table-cell; vertical-align: middle;"><button id='btn_prev_rdv' type='button' class='btn vd_btn vd_bg-green'> <i class='fa fa-arrow-circle-left'></i> </button></div>
                                                      </td>
                                                      <td>
                                                        <div id="divrdvdispo" style="padding:0;"></div>
                                                      </td>
                                                      <td style="vertical-align:middle" align='center'>
                                                        <div id='divbtnnext' class='col-xs-1' style="padding:0;" align='right'><button id='btn_next_rdv' type='button' class='btn vd_btn vd_bg-green'> <i class='fa fa-arrow-circle-right'></i> </button></div>
                                                      </td>
                                                    </tr>
                                                  </tbody>
                                                </table>
                                               </div>  
                                              <div id="info_simple">
                                                <input type="hidden" value="1" id="numPro" />
                                                <div class="row mgbt-xs-0">
                                                  <div class="col-xs-12">
                                                    <div class="col-xs-4"></div>
                                                      <div  class="col-xs-4" align='center'>
                                                        <button id="btn_pers_rdv" type="button" class="btn vd_btn vd_bg-green"> <i class="fa fa-cog"></i> Plus de critères</button>
                                                      </div>
                                                    <div class="col-xs-4"></div>
                                                  </div>
                                                </div>
                                              </div>
                                              <div id="info_complexe" style="display:none;">
                                                <div class="form-group">
                                                  <label class="col-md-3 control-label" align="center">Choisir un jour</label>
                                                  <div class="col-md-3 controls">
                                                    <select id="jour_perso" name="jour_perso" >
                                                      <option value="7" selected>Indifférent</option>
                                                      <option value="1">Lundi</option>
                                                      <option value="2">Mardi</option>
                                                      <option value="3">Mercredi</option>
                                                      <option value="4">Jeudi</option>
                                                      <option value="5">Vendredi</option>
                                                      <option value="6">Samedi</option>
                                                    </select>
                                                  </div>

                                                  <label class="col-md-3 control-label" align="center">Créneau horaire</label>
                                                  <div class="col-md-3 controls" >
                                                    <select id="heure_debut_perso" name="heure_debut_perso">
                                                      <option value="06/08">06h / 08h</option>
                                                      <option value="08/10" selected>08h / 10h</option>
                                                      <option value="10/12">10h / 12h</option>
                                                      <option value="12/14">12h / 14h</option>
                                                      <option value="14/16">14h / 16h</option>
                                                      <option value="16/18">16h / 18h</option>
                                                      <option value="18/20">18h / 20h</option>
                                                      <option value="20/22">20h / 22h</option>
                                                    </select>                                                    
                                                  </div>
                                                
                                                  
                                                </div>
                                                <div class="form-group" align="center">  
                                                  
                                                  <div class="col-md-12 controls">
                                                    <label class="control-label">Quand?</label>
                                                    <div class="vd_radio radio-success" >
                                                      
                                                      <input type="radio" checked value="0" id="optionsRadios3" name="quand">
                                                      <label for="optionsRadios3"> Le plus tôt possible </label>
                                                    
                                                      <input type="radio" value="1" id="optionsRadios4" name="quand" >
                                                      <label for="optionsRadios4"> Dans 
                                                        <select id="nb_semaine" name="nb_semaine" class="width-30">
                                                          <option value="1" selected>1</option>
                                                          <option value="2">2</option>
                                                          <option value="3">3</option>
                                                          <option value="4">4</option>
                                                          <option value="5">5</option>
                                                          <option value="6">6</option>
                                                          <option value="7">7</option>
                                                          <option value="8">8</option>
                                                          <option value="9">9</option>
                                                          <option value="10">10</option>
                                                          <option value="11">11</option>
                                                          <option value="12">12</option>
                                                          <option value="13">13</option>
                                                          <option value="14">14</option>
                                                          <option value="15">15</option>
                                                        </select> semaine(s)</label>
                                                    
                                                      <input type="radio" value="2" id="optionsRadios5" name="quand" >
                                                      <label for="optionsRadios5"> Au mois de  
                                                        <select id="num_mois" name="num_mois" class="width-50">
                                                          <option value="1" selected>Janvier</option>
                                                          <option value="2">Février</option>
                                                          <option value="3">Mars</option>
                                                          <option value="4">Avril</option>
                                                          <option value="5">Mai</option>
                                                          <option value="6">Juin</option>
                                                          <option value="7">Juillet</option>
                                                          <option value="8">Août</option>
                                                          <option value="9">Septembre</option>
                                                          <option value="10">Octobre</option>
                                                          <option value="11">Novembre</option>
                                                          <option value="12">Décembre</option>
                                                        </select>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="col-md-12 controls" align='center'>
                                                   <button id="btn_recherche_rdv_perso" type="button" class="btn vd_btn vd_bg-green"> <i class="fa fa-search"></i> Rechercher</button>
                                                    <button id="btn_retour_simple" type="button" class="btn vd_btn vd_bg-grey"> <i class="fa fa-arrow-circle-left"></i> Annuler</button>
                                                </div>
                                                <div class="col-md-12">
                                                  <div class="row" id="rdvdispoperso"></div>
                                                </div>
                                                
                                              </div>
                                            </div>
                                            <!-- Panel Widget --> 
                                          </div>
                                          <!-- col-md-12 --> 
                                        </div>
                                        <!-- row -->
                                      </div>
                                      <div class="tab-pane" id="tab23">
                                        <div class="row" id="message_info_resa" style="margin-bottom:0px">
                                          <div class="alert alert-info">
                                              <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                              A partir de cette étape, votre rendez-vous est réservé, vous avez 15 min pour le confirmer.
                                          </div>
                                        </div>
                                        <div class="row" id="message_info_client" style="margin-bottom:0px;">
                                          <div class="alert alert-warning">
                                              <span class="vd_alert-icon"><i class="fa fa-exclamation-triangle vd_yellow"></i></span>
                                              Vous possédez déjà un compte, <a href='javascript:void(0);' name="visuIdent" id="visuIdent">cliquez ici.</a>
                                          </div>
                                        </div>
                                        <div class="row" id="message_info_inscription" style="margin-bottom:0px;display:none;">
                                          <div class="alert alert-warning">
                                              <span class="vd_alert-icon"><i class="fa fa-exclamation-triangle vd_yellow"></i></span>
                                              Vous ne possédez pas de compte, <a href='javascript:void(0);' name="visuRegis" id="visuRegis">cliquez ici.</a>
                                          </div>
                                        </div>
                                        <div class="row" id="return_message" style="margin-bottom:0px;"></div>
                                        <div class="row" id="div_ident_reg">
                                          <form action="#" role="form" id="register-form-3">
                                          </form>
                                          <div class="col-md-12" id="div_view_reg">
                                            <div class="panel-heading vd_bg-green">
                                              <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-pencil"></i> </span> Pas de compte ? Inscrivez-vous </h3>
                                            </div>
                                            <form action="#" role="form" id="register-form">
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <div class="vd_radio radio-success">

                                                      <input type="radio" name="civilite_reg" id="civilite_reg1" value="M" checked>
                                                      <label  for="civilite_reg1"> M. </label>
                                                      <input type="radio" name="civilite_reg" id="civilite_reg2" value="Mme">
                                                      <label  for="civilite_reg2"> Mme </label>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="text" placeholder="Votre nom" name="nom_reg" id="nom_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="text" placeholder="Votre prénom" name="prenom_reg" id="prenom_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="text" placeholder="Votre mobile" name="tel_reg" id="tel_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="email" placeholder="Votre email" name="email_reg" id="email_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="email" placeholder="Confirmez votre email" name="email2_reg" id="email2_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="password" placeholder="Un mot de passe" name="password_reg" id="password_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls">
                                                    <input type="password" placeholder="Confirmez le mot de passe" name="password2_reg" id="password2_reg" required class="required" />
                                                  </div>
                                                </div>
                                                <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Veuillez saisir le champ obligatoire </div>
                                                <div class="form-group">
                                                  <div class="col-sm-12 controls" align="center">
                                                    <button type="submit" name="inscriptionButton" id="inscriptionButton" class="btn vd_btn vd_bg-green"><span class="menu-icon"><i class="fa fa-fw fa-plus-circle"></i></span> Valider</button>
                                                  </div>
                                                </div>
                                            </form>
                                          </div>
                                          <div class="col-md-12" id="div_view_ident" style="display:none;">
                                            <div class="panel-heading vd_bg-green">
                                              <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-user"></i> </span> Vous avez un compte ? Identifiez-vous </h3>
                                            </div>
                                            <form action="#" role="form" id="register-form-2">
                                              <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                  <input type="email" placeholder="Votre email" name="email_log" id="email_log" required class="required" />
                                                </div>
                                              </div>
                                              <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                  <input type="password" placeholder="Votre mot de passe" name="password_log" id="password_log" required class="required" />
                                                </div>
                                              </div>
                                              <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Veuillez saisir le champ obligatoire </div>

                                              <div class="form-group">
                                                <div class="col-sm-12 controls" align="center">
                                                  <button type="submit" name="connexionButton" id="connexionButton" class="btn vd_btn vd_bg-green"><span class="menu-icon"><i class="fa fa-fw fa-check-circle"></i></span> S'identifier</button>
                                                </div>
                                              </div>
                                            </form>
                                          </div>
                                        </div>
                                        <div class="row"  id="div_participant" style="display:none;">
                                          <div class="panel-heading vd_bg-green">
                                            <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-users"></i> </span>Autres participants</h3>
                                          </div>
                                          <div id="participant_add">
                                              
                                          </div>
                                        </div>
                                      </div>
                                      
                                      <div class="tab-pane" id="tab24">
                                        <div id='recap_info'>
                                          <div class="alert alert-info">
                                            <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                            Pour confirmer votre rendez-vous, vous devez saisir le code de confirmation qui vous a été envoyé par SMS/Vocal.
                                        </div>
                                        </div>
                                        <div id='recap_info2'></div>
                                        <div class="row" id="div_code_confirmation">
                                          <form action="#" role="form" id="register-form-4">
                                            <div class="col-sm-2 controls"></div>
                                            <div class="col-sm-4 form-group">
                                              <div class=" controls">
                                                <input type="text" placeholder="Code de confirmation" name="code_confirm" id="code_confirm" required class="required" />
                                              </div>
                                            </div>
                                            <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Veuillez saisir le code de confirmation </div>

                                            <div class="col-sm-4 form-group">
                                              <div class="controls" align="center">
                                                <button type="submit" name="codeButton" id="codeButton" class="btn vd_btn vd_bg-green"><span class="menu-icon"><i class="fa fa-fw fa-check-circle"></i></span> Confirmer</button>
                                              </div>
                                            </div>
                                            <div class="col-sm-2 controls"></div>
                                          </form>
                                        </div>
                                      </div>
                                      <div class="form-actions-condensed wizard">
                                        <div class="row mgbt-xs-0" align='center'>
                                          <div class="col-sm-12"> 
                                            <a  id="btn_prec" class="btn vd_btn prev" href="javascript:void(0);"><span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span> Précédent</a> <a id="btn_next" class="btn vd_btn next" href="javascript:void(0);">Suivant <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></a>
                                            <button id="btn_terminer" style='display:none;' type="button" class="btn vd_btn vd_bg-green" data-dismiss="modal">Fermer</button>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </form>
                              </div>
                            </div>
                            <!-- Panel Widget --> 
                          </div>
                          <!-- col-md-12 --> 
                        </div>
                        <!-- row -->
             
                      </div>
                      <!-- .vd_content-section --> 
                      
                      
                    </form>
                  
                  </div>
                  <div class="modal-footer background-login">
                    <button id="btn_annule_tout" type="button" class="btn vd_btn vd_bg-grey" data-dismiss="modal">Fermer</button>
                  </div>
                </div>
                <!-- /.modal-content --> 
              </div>
              <!-- /.modal-dialog --> 
            </div>
            <!-- /.modal --> 


            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog" >
                <div class="modal-content">
                  <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel">Gerer votre compte</h4>
                  </div>
                  <div class="modal-body"> 
                    <div class="vd_content-section clearfix">
                      <div class="row">
                        <div class="col-md-full">
                          <div class="panel widget">
                            <div class="panel-body">
                              <div class="col-md-12" id="divconnexioncompte">
                                <div class="row" id="return_message_compte"></div>
                                <div class="panel-heading vd_bg-green">
                                  <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-user"></i> </span> Identifiez-vous<br/></h3>
                                </div>
                                <form action="#" role="form" id="register-form-3" class="form-horizontal">
                                  <div class="form-group">
                                    <div class="col-sm-12 controls">
                                      <input type="email" placeholder="Votre email" name="email_compte_log" id="email_compte_log" required class="required" />
                                    </div>
                                  </div>
                                  <div class="form-group">
                                    <div class="col-sm-12 controls">
                                      <input type="password" placeholder="Votre mot de passe" name="password_compte_log" id="password_compte_log" required class="required" />
                                    </div>
                                  </div>
                                  <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Veuillez saisir le champ obligatoire </div>

                                  <div class="form-group">
                                    <button type="submit" name="connexionButton" id="connexionButton" class="btn vd_btn vd_bg-green col-md-offset-5"><span class="menu-icon"><i class="fa fa-fw fa-check-circle"></i></span> S'identifier</button>
                                  </div>
                                </form>
                              </div>
                              <div class="col-md-12" id="divconnectercompte" style="display:none;">
                                <div class="tabs">
                                  <ul class="nav nav-tabs widget">
                                    <li class="active"> <a href="#info-tab" data-toggle="tab"> <span class="menu-icon"><i class="fa fa-user"></i></span> Mes informations <span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                                    <li> <a href="#rdv-tab" data-toggle="tab"> <span class="menu-icon"><i class="fa fa-calendar"></i></span> Mes rendez-vous <span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                                    <li> <a href="#histo-tab" data-toggle="tab"> <span class="menu-icon"><i class="fa fa-history"></i></span> Mon historique<span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                                  </ul>
                                  <div class="tab-content  mgbt-xs-20">
                                    <div class="tab-pane active" id="info-tab"> Informations </div>
                                    <div class="tab-pane" id="rdv-tab"> Rendez-vous </div>
                                    <div class="tab-pane" id="histo-tab">
                                      <br/>
                                      <h3>Liste de vos précédents rendez-vous :</h2>
                                      <div class='panel-body table-responsive'>
                                        <table class='table table-bordered dataTable'>
                                          <tbody>
                                            <tr class="odd"><td>Le Mardi 18 Avril 2013 avec le Dr Zaluski (Consultation)</td></tr>
                                            <tr class="even"><td>Le Lundi 20 Janvier 2014 avec le Dr Zaluski (Contrôle)</td></tr>
                                            <tr class="odd"><td>Le Lundi 18 Juin 2014 avec le Dr Zaluski (Consultation)</td></tr>
                                            <tr class="even"><td>Le Mercredi 18 Janvier 2015 avec le Dr Boves (Contrôle)</td></tr>
                                            <tr class="odd"><td>Le Mardi 3 Mars 2015 avec le Dr Boves (Consultation)</td></tr>
                                          </tbody>
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

          </div>
        </div>
      </div>
    </div>
  </div>
</div>






{literal}




<!-- Google Analytics: Change UA-XXXXX-X to be your site's ID. Go to http://www.google.com/analytics/ for more information. -->

<script>
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-XXXXX-X']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>

{/literal}

</body>
</html>