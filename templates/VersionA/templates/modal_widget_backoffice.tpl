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

  <!-- Specific CSS -->

    <link href="plugins/dataTables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
          <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 

    
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    <link type="text/css" href="css/jquery.mCustomScrollbar.min.css" rel="stylesheet" media="all" />

    <!-- Custom CSS -->
    <link href="custom/custom_widget.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster -->
    <?php $jquery = filemtime(PATH_ASSETS . 'js/jquery.js') ?> 
    <script type="text/javascript" src="js/jquery.<?php echo $jquery ?>.js"></script> 
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php $bootstrap = filemtime(PATH_ASSETS . 'js/bootstrap.min.js') ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrap ?>.js"></script>
    <?php $jqueryUi = filemtime(PATH_ASSETS . 'plugins/jquery-ui/jquery-ui.custom.min.js') ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryUi ?>.js'></script>
    <?php $jqueryUiTouch = filemtime(PATH_ASSETS . 'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryUiTouch ?>.js"></script>

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
    <?php $mCustomScrollbarMin = filemtime(PATH_ASSETS . 'js/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbarMin ?>.js"></script>
    <?php $mousewheel = filemtime(PATH_ASSETS . 'js/jquery.mousewheel.min.js') ?>
    <script type="text/javascript" src="js/jquery.mousewheel.min.<?php echo $mousewheel ?>.js"></script>

    <?php $theme = filemtime(PATH_ASSETS . 'js/theme.js?{$stime}') ?>
    <script type="text/javascript" src="js/theme.<?php echo $theme ?>.js?{$stime}"></script>
    <?php $custom = filemtime(PATH_ASSETS . 'custom/custom.js?{$stime}') ?>
    <script type="text/javascript" src="custom/custom.<?php echo $custom ?>.js?{$stime}"></script>
     
    <!-- Specific Page Scripts Put Here -->
    <?php $wizard = filemtime(PATH_ASSETS . 'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js') ?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizard ?>.js'></script>

    <?php $datepicker = filemtime(PATH_ASSETS . 'js/datepicker-fr.js') ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepicker ?>.js"></script>

    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS . 'js/modernizr.js') ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script>
    <?php $mobileDetect = filemtime(PATH_ASSETS . 'js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script>
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS . 'js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>
    <?php $maskedinput = filemtime(PATH_ASSETS . 'js/jquery.maskedinput.min.js') ?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedinput ?>.js"></script> 
   
   <!-- Script pour l'auto-completion -->
   <?php $autocomplete = filemtime(PATH_ASSETS . 'js/jquery.autocomplete.min.js') ?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $autocomplete ?>.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->

    <?php $listeRdv = filemtime(PATH_ASSETS . 'js/liste_widget_prise_rdv_backoffice.js?{$stime}') ?>
    <script type="text/javascript" src="js/liste_widget_prise_rdv_backoffice.<?php echo $listeRdv ?>.js?{$stime}"></script>

    {literal}

    <script type="text/javascript">

      $(document).ready(function() {

        $.mCustomScrollbar.defaults.scrollButtons.enable=false;

        $('#lst-widget').mCustomScrollbar({
          theme:"widget-theme"
        });

      });

      function capitalizeFirstLetter(obj, string) {
        var vobj = document.getElementById(obj);
        //alert(string);
        string = string.toLowerCase();
        string = string.charAt(0).toUpperCase() + string.slice(1);

        vobj.value = string;
      }

      function checkInsee(myInseeField) {
        var isValid = true;
        var expression = new RegExp('^[12]\\d{14}$');
        myInseeField.style.backgroundColor = 'white';
          
        if (!myInseeField.value.match(expression))
        {
          isValid = false;
          myInseeField.style.backgroundColor = '#efcfcd';
        } else {
          var partialInsee = myInseeField.value.toString().substring(0, 13);
          var clef = 97 - (parseFloat(partialInsee) % 97);

          if(clef != parseInt(myInseeField.value.toString().substring(13, 15), 10))
          {
              isValid = false;
              myInseeField.style.backgroundColor = '#efcfcd';
          }
        }
        return isValid;
      }

      var $current = 1;
      
      $(document).ready(function() {
        var div_button_base = document.getElementById('div_button_suivant');
        var div_button_update_patient = document.getElementById('div_button_update_patient');

        "use strict";

      $('#selectassurance').empty();
      $('#selectassurance').append('<option value="">Votre assurance</option>');
      $.ajax({
        url: 'ajax/liste_assurance.php',
        dataType: 'json',
        success: function(json) {
          $.each(json, function(index, value) {
            $('#selectassurance').append('<option value="'+ value.id_assurance_maladie +'">'+ value.libelle_assurance_maladie +'</option>');
          });
        }
      });

      $('#civilite').change(function(){ 
        var divNJF = document.getElementById('divnomjeunefille_mod_up');

        if (this.selectedIndex == -1)
          return null;

        if(this.options[this.selectedIndex].text=="Mme"){
          divNJF.style.display = "";
        }else{
          divNJF.style.display = "none";
        }
      });

        $("#code_postal_mod_up").mask("9*999");
        $("#idaff_telport").mask("99 99 99 99 99");
        $("#idaff_telfixe").mask("99 99 99 99 99");
        $("#num_secu_mod_up").mask("9 99 99 9* 999 999 99");
        $("#id_datenaissance").mask("99/99/9999");

        var vbtn_prec = document.getElementById('btn_prec');
        var return_message_rdv = document.getElementById('return_message_rdv');
        var return_message_rdv_perso = document.getElementById('return_message_rdv_perso');

        $( "#btn_next" ).click(function() {
          
          if($current == 1){
            $('#btn_next').addClass('disabled');
          }

          if($current == 2){

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

            if($current == 1){

            }

            if ($current == 2){
              $('#tabb1').addClass('tabb_rond_couleur');
              var j = 0;
              var tmp_idmotif="";

              var divcatprofession = document.getElementById('divcatprofession');
              var divprofession = document.getElementById('divprofession');
              var divtyperdv = document.getElementById('iddivmotif');

              $('#selectcatprofession').empty();
              $.ajax({
                cache: false,
                url: 'ajax/liste_categorie.php',
                data: 'idc='+$('#identifiant_entite').val()+'&idp=&provenance=',
                dataType: 'json',
                success: function(json) {
                  if(json.length < 2 ){
                    $.each(json, function(index, value) {
                      $('#selectcatprofession').append('<option value="'+ value.id +'">'+ value.libelle +'</option>');
                    });

                  }else{
                    divcatprofession.style.display = "block";
                    $('#selectcatprofession').append('<option value="">Choisissez le professionnel de santé</option>');
                    $.each(json, function(index, value) {
                      $('#selectcatprofession').append('<option value="'+ value.id +'">'+ value.libelle +'</option>');
                    });

                  }

                  $('#selectcatprofession').change();
                }
              });

/*
              $('#idconsultation').empty();
              $.ajax({
                cache: false,
                url: 'ajax/liste_rdv_backoffice.php',
                data: 'interpro='+$('#idinterpro').val(),
                dataType: 'json',
                success: function(json) {
                  $('#idconsultation').append('<option value="">Choisissez le motif du rendez vous</option>');
                  $.each(json, function(index, value) {
                    $('#idconsultation').append('<option value="'+ value.id +'">'+ value.libelle +'</option>');
                    tmp_idmotif = value.id;
                    j++;
                  });
                  if (j > 1) {
                  } else {
                    $('#idconsultation').val(tmp_idmotif);
                  }
                  $('#idconsultation').change();
                }
              });
*/



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

//        $('#btn_next').addClass('disabled');
      
        $("#formpatient").submit( function() {
            enregistrement_patient();
            return false;
        });


        $( "#updateButtonPatient" ).click(function() {

          $.ajax({
            cache: false,
            url: 'ajax/modif_patient.php',
            data: 'identifiant_entite={/literal}{$identifiant_entite}{literal}&id_patient='+$('#id_patient').val()+'&nom_mod_up='+$('#idaff_nom_userinterpro').val()+'&nom_fille_mod_up='+$('#nom_fille_mod_up').val()
            +'&prenom_mod_up='+$('#idaff_prenon').val()+'&tel_mod_up='+$('#idaff_telport').val()+'&tel_fixe_mod_up='+$('#idaff_telfixe').val()
            +'&email_mod_up='+$('#idaff_email').val()+'&date_naissance_mod_up='+$('#id_datenaissance').val()+'&adresse_mod_up='+$('#adresse_mod_up').val()
            +'&code_postal_mod_up='+$('#code_postal_mod_up').val()+'&ville_mod_up='+$('#ville_mod_up').val()+'&num_secu_mod_up='+$('#num_secu_mod_up').val()
            +'&selectassurance='+$('#selectassurance').val()+'&medecin_traitant_mod_up='+$('#medecintrait').val()+'&ville_medecin_mod_up='+$('#ville_medecin_mod_up').val()
            +'&profession_mod_up='+$('#profession_mod_up').val()+'&remarque='+$('#remarque').val()+'&civilite_mod_up='+$('#civilite').val(),
            dataType: 'json',
            success: function(json) {
              $.each(json, function(index, value) {
                if(value.success = true){

                  document.getElementById('civilite').disabled = 'disabled';
                  document.getElementById('idaff_prenon').disabled = 'disabled';
                  document.getElementById('idaff_nom_userinterpro').disabled = 'disabled';
                  document.getElementById('nom_fille_mod_up').disabled = 'disabled';
                  document.getElementById('idaff_telport').disabled = 'disabled';
                  document.getElementById('idaff_telfixe').disabled = 'disabled';
                  document.getElementById('idaff_email').disabled = 'disabled';
                  document.getElementById('id_datenaissance').disabled = 'disabled';
                  document.getElementById('adresse_mod_up').disabled = 'disabled';
                  document.getElementById('code_postal_mod_up').disabled = 'disabled';
                  document.getElementById('ville_mod_up').disabled = 'disabled';
                  document.getElementById('num_secu_mod_up').disabled = 'disabled';
                  document.getElementById('selectassurance').disabled = 'disabled';
                  document.getElementById('medecintrait').disabled = 'disabled';
                  document.getElementById('ville_medecin_mod_up').disabled = 'disabled';
                  document.getElementById('profession_mod_up').disabled = 'disabled';

                  div_button_base.style.display = "";
                  div_button_update_patient.style.display = "none";
                }else{
                  alert(value.message);
                }
              });

            }
          });

          return false;
        });

      });

    function recherche_rdv(){
      
      var divrdvdispo = document.getElementById('divrdvdispo_interpro');
      divrdvdispo.style.display = 'block';

      $('#divrdvdispo_interpro').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>");

      

      $.ajax({
        cache: false,
        url: 'ajax/recherche_rdv_dispo_interpro.php',
        data: 'identifiant_entite={/literal}{$identifiant_entite}{literal}&idinterpro='+$('#idinterpro').val()+'&idpraticien='+$('#idpraticien').val()+'&idconsultation='+$('#idconsultation').val()
        +'&idlieu='+$('#idlieu').val()+'&id_daterdvdispo='+$('#datepicker-interpro').val()+'&jour='+$('#jour').val()+'&horaire='+$('#horaire').val()
        +'&id_patient='+$('#id_patient').val()+'&idprofession='+$('#selectprofession').val(),
        dataType: 'json',
        success: function(json) {
          $.each(json, function(index, value) {
            
            //divpropositionrdv.style.display = 'block';
            $("#divrdvdispo_interpro").html(value.message_html);
            $('#lst-widget-rdv-interpro').mCustomScrollbar({
              theme:"widget-theme"
            });
          });
        }
      });


    }

    function enregistrement_patient(){
      var divenregpatient = document.getElementById('divenregpatient');
      var divtempcheckpatient = document.getElementById('divtempcheckpatient');
      divenregpatient.style.display = 'none';
      divtempcheckpatient.style.display = 'block';

      var smodif = 0;
      

      $('#divtempcheckpatient').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>");
      
      if($('#id_patient').val()!=""){
        smodif = 1;
      }else{
        smodif = 0;
      }

      $.ajax({
        cache: false,
        url: 'ajax/enregistrement_patient.php',
        data: 'identifiant_entite={/literal}{$identifiant_entite}{literal}&idinterpro='+$('#idinterpro').val()+'&id_patient='+$('#id_patient').val()+'&idaff_nom='+encodeURIComponent($('#idaff_nom_userinterpro').val())
        +'&nom_fille_mod_up='+encodeURIComponent($('#nom_fille_mod_up').val())+'&idaff_prenon='+encodeURIComponent($('#idaff_prenon').val())+'&idaff_telport='+encodeURIComponent($('#idaff_telport').val())
        +'&idaff_telfixe='+encodeURIComponent($('#idaff_telfixe').val())+'&idaff_email='+encodeURIComponent($('#idaff_email').val())+'&id_datenaissance='+encodeURIComponent($('#id_datenaissance').val())
        +'&adresse_mod_up='+encodeURIComponent($('#adresse_mod_up').val())+'&code_postal_mod_up='+encodeURIComponent($('#code_postal_mod_up').val())+'&ville_mod_up='+encodeURIComponent($('#ville_mod_up').val())
        +'&num_secu_mod_up='+encodeURIComponent($('#num_secu_mod_up').val())+'&selectassurance='+encodeURIComponent($('#selectassurance').val())+'&medecintrait='+encodeURIComponent($('#medecintrait').val())
        +'&ville_medecin_mod_up='+encodeURIComponent($('#ville_medecin_mod_up').val())+'&profession_mod_up='+encodeURIComponent($('#profession_mod_up').val())+'&remarque='+encodeURIComponent($('#remarque').val())
        +'&civilite='+$('#civilite').val(),
        dataType: 'json',
        async: false, // Mode synchrone
        success: function(json) {
          $.each(json, function(index, value) {
            
            divenregpatient.style.display = 'block';
            divtempcheckpatient.style.display = 'none';
            $("#divtempcheckpatient").html("");
            //alert(value.idpatient);
            $("#id_patient").val(value.idpatient);

            $('#wizard-2 a[href="#tab22"]').tab('show');
          });
        }
      });
    }

      function modif_patient(){
        var div_button_base = document.getElementById('div_button_suivant');
        var div_button_update_patient = document.getElementById('div_button_update_patient');

        document.getElementById('civilite').removeAttribute("disabled");
        document.getElementById('idaff_nom_userinterpro').removeAttribute("disabled");
        document.getElementById('nom_fille_mod_up').removeAttribute("disabled");
        document.getElementById('idaff_prenon').removeAttribute("disabled");
        document.getElementById('idaff_telport').removeAttribute("disabled");
        document.getElementById('idaff_telfixe').removeAttribute("disabled");
        document.getElementById('idaff_email').removeAttribute("disabled");
        document.getElementById('id_datenaissance').removeAttribute("disabled");
        document.getElementById('adresse_mod_up').removeAttribute("disabled");
        document.getElementById('code_postal_mod_up').removeAttribute("disabled");
        document.getElementById('ville_mod_up').removeAttribute("disabled");
        document.getElementById('num_secu_mod_up').removeAttribute("disabled");
        document.getElementById('selectassurance').removeAttribute("disabled");
        document.getElementById('medecintrait').removeAttribute("disabled");
        document.getElementById('ville_medecin_mod_up').removeAttribute("disabled");
        document.getElementById('profession_mod_up').removeAttribute("disabled");

        div_button_base.style.display = "none";
        div_button_update_patient.style.display = "";

      }

  function reinit_form(){
    var div_button_base = document.getElementById('div_button_suivant');
    var div_button_update_patient = document.getElementById('div_button_update_patient');

    document.getElementById('id_patient').value = '';

    document.getElementById('idaff_nom_userinterpro').value = '';
    document.getElementById('nom_fille_mod_up').value = '';
    document.getElementById('idaff_prenon').value = '';
    document.getElementById('idaff_telport').value = '';
    document.getElementById('idaff_telfixe').value = '';
    document.getElementById('idaff_email').value = '';
    document.getElementById('id_datenaissance').value = '';
    document.getElementById('adresse_mod_up').value = '';
    document.getElementById('code_postal_mod_up').value = '';
    document.getElementById('ville_mod_up').value = '';
    document.getElementById('num_secu_mod_up').value = '';
    document.getElementById('selectassurance').value = '';
    document.getElementById('medecintrait').value = '';
    document.getElementById('ville_medecin_mod_up').value = '';
    document.getElementById('profession_mod_up').value = '';
    document.getElementById('remarque').value = '';
    
    
    document.getElementById('civilite').removeAttribute("disabled");
    document.getElementById('idaff_nom_userinterpro').removeAttribute("disabled");
    document.getElementById('nom_fille_mod_up').removeAttribute("disabled");
    document.getElementById('idaff_prenon').removeAttribute("disabled");
    document.getElementById('idaff_telport').removeAttribute("disabled");
    document.getElementById('idaff_telfixe').removeAttribute("disabled");
    document.getElementById('idaff_email').removeAttribute("disabled");
    document.getElementById('id_datenaissance').removeAttribute("disabled");
    document.getElementById('adresse_mod_up').removeAttribute("disabled");
    document.getElementById('code_postal_mod_up').removeAttribute("disabled");
    document.getElementById('ville_mod_up').removeAttribute("disabled");
    document.getElementById('num_secu_mod_up').removeAttribute("disabled");
    document.getElementById('selectassurance').removeAttribute("disabled");
    document.getElementById('medecintrait').removeAttribute("disabled");
    document.getElementById('ville_medecin_mod_up').removeAttribute("disabled");
    document.getElementById('profession_mod_up').removeAttribute("disabled");
    //document.getElementById('remarque').removeAttribute("disabled");

    var div_reinit = document.getElementById('div_reinit');
    div_reinit.style.display = "none";

    div_button_base.style.display = "";
    div_button_update_patient.style.display = "none";

    $('#selectassurance').empty();
    $('#selectassurance').append('<option value="">Votre assurance</option>');
    $.ajax({
      url: 'ajax/liste_assurance.php',
      dataType: 'json',
      success: function(json) {
        $.each(json, function(index, value) {
          $('#selectassurance').append('<option value="'+ value.id_assurance_maladie +'">'+ value.libelle_assurance_maladie +'</option>');
        });
      }
    });
  }

  function retour_tab(){
    $('#wizard-2 a[href="#tab21"]').tab('show');
  }

    </script>
     <!-- Specific Page Scripts END -->


    
    <style type="text/css">

      ::-webkit-input-placeholder { color: #164561; }
      :-moz-placeholder { color: #164561; }
      ::-moz-placeholder { color: #164561; }
      :-ms-input-placeholder { color: #164561; }

      @media (min-width: 768px) {
        .modal-dialog {
          width:700px;
        }
      }
        
      .tabb_rond_couleur{
        background-color: #01D0CA !important;
      }

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

<div id='myfiltre' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10000;opacity:0.7;filter: alpha(opacity=70);'></div>

<div id="myModal" style='display:block;'>

  <div class="modal-dialog" style="margin-top:0px;margin-bottom:0px;">
    <div>
      <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
        <div id='alert_message_avertissement' style="z-index:2400;position:absolute;top:50%;left:0;right:0;margin: 0 auto;width:100%;display:none;">
          <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-8 liste-widget-global" >
              <div class="col-sm-12" id='txt_alert_message_avertissement'></div>
              <div class="col-sm-12" role="group" aria-label="" align="center">
                <button id="btn_message_alert_ok" name="btn_message_alert_ok" type="button" class="btn btn_confirm" style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
              </div>
            </div>
            <div class="col-sm-2"></div>
          </div>
        </div>
        <form class="form-horizontal">
          <div class="vd_content-section clearfix" style="padding:0px;">
            <div class="row" style="margin-bottom:0px;">
              <div class="col-md-full">
                <div class="panel widget">
                  {*<div class="panel-heading" align='center'>
                    <h3 class="panel-title title1" >Suivez les étapes pour prendre un rendez-vous </h3>
                  </div>*}
                  <div class="panel-body">


                      <div id="wizard-2" class="form-wizard">
                        <div class="progress progress active">
                          <div class="progress-bar progress-bar-info" > </div>
                        </div>
                        <ul>
                          <li><a href="#tab21" data-toggle="tab">
                            <div id="tabb1" class="menu-icon">&nbsp;</div>
                            Informations patient </a></li>
                          <li><a href="#tab22" data-toggle="tab">
                            <div id="tabb2" class="menu-icon">&nbsp;</div>
                            RDV disponibles </a></li>
                        </ul>
                        <div class="tab-content no-bd" style="padding-top: 0px;">
                          <div class="tab-pane" id="tab21">

                            <form action="#" role="form" id="register-form-3"></form>
                            <form class="form-horizontal" action="#" role="form" id="formpatient" name="formpatient" autocomplete="new-password"  >
                              <input type="hidden" name="identifiant_entite" value="{$identifiant_entite}" id="identifiant_entite">
                              <input type="hidden" name="idinterpro" value="{$interpro}" id="idinterpro">
                              <input type="hidden" name="validation" value="ok">
                              <div class="col-sm-12 controls" id="divtempcheckpatient" style="display:none;"></div>
                              <div class="col-sm-12 controls" id="divenregpatient">
                                <div class="form-group" style="margin-bottom: 5px;">
                                  <div class="col-sm-12 controls" style="display:none;" id="div_reinit">
                                    <a href="#" onclick="modif_patient();"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinit_form();" >Réinitialiser</a>
                                  </div>
                                </div>

                                <div class="form-group">
                                  <div class="col-sm-3 controls">
                                    <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                      <select id="civilite" name="civilite" required class="required" style="border-color: red;">
                                        <option value="" disabled selected hidden>Civilité</option>
                                        {foreach from=$aTableauCivilite item=objCivilite}
                                          <option value="{$objCivilite.id_civilite}">{$objCivilite.abreviation_civilite}</option>
                                        {/foreach}
                                      </select>
                                    </div>
                                  </div>
                                  <div class="col-sm-5 controls">
                                    <input type="text" placeholder="Nom" name="idaff_nom_userinterpro" id="idaff_nom_userinterpro" value="" required style="border-color: red;" class="required input-majuscule input-widget" autocomplete="new-password" />
                                    <input type="hidden" name="id_patient" id="id_patient">
                                    {literal}
                                      <!-- Script pour l'auto-completion -->
                                      <script type="text/javascript" >
                                        $('#idaff_nom_userinterpro').autocomplete({
                                            serviceUrl:'ajax/patient_auto_complete.php?identifiant_entite={/literal}{$identifiant_entite}{literal}',
                                            onSelect: function (suggestion){
                                              document.getElementById('id_patient').value = suggestion.id;
                                              $('#civilite').val(suggestion.id_civilite);
                                              $('#civilite').change();

                                              $('#selectassurance').append('<option value="">Votre assurance</option>');
                                              $.ajax({
                                                url: 'ajax/liste_assurance.php',
                                                dataType: 'json',
                                                success: function(json) {
                                                  $.each(json, function(index, value) {
                                                    $('#selectassurance').append('<option value="'+ value.id_assurance_maladie +'">'+ value.libelle_assurance_maladie +'</option>');
                                                  });
                                                  selectassurance.value = suggestion.id_assurance_user;
                                                }
                                              });

                                              document.getElementById('idaff_nom_userinterpro').value = suggestion.nom;
                                              document.getElementById('nom_fille_mod_up').value = suggestion.nom_jeune_fille_user;
                                              document.getElementById('idaff_prenon').value = suggestion.prenom;
                                              document.getElementById('idaff_telport').value = suggestion.telmobile;
                                              document.getElementById('idaff_telfixe').value = suggestion.telfixe;
                                              document.getElementById('idaff_email').value = suggestion.email;
                                              document.getElementById('id_datenaissance').value = suggestion.datenaissance;

                                              document.getElementById('adresse_mod_up').value = suggestion.adresse_user;
                                              document.getElementById('code_postal_mod_up').value = suggestion.code_postal_user;
                                              document.getElementById('ville_mod_up').value = suggestion.ville_user;
                                              document.getElementById('num_secu_mod_up').value = suggestion.num_securite_sociale_user;
                                              document.getElementById('selectassurance').value = suggestion.libelle_assurance_maladie;
                                              document.getElementById('medecintrait').value = suggestion.medecin_traitant_user;
                                              document.getElementById('ville_medecin_mod_up').value = suggestion.ville_medecin;
                                              document.getElementById('profession_mod_up').value = suggestion.profession_user;
                                              //document.getElementById('remarque').value = suggestion.remarque_user;


                                              var div_reinit = document.getElementById('div_reinit');

                                              if(document.getElementById('idaff_nom_userinterpro')!=""){
                                                div_reinit.style.display = "";
                                              }else{
                                                div_reinit.style.display = "none";
                                              }
                                              
                                              document.getElementById('civilite').disabled = 'disabled';
                                              document.getElementById('idaff_prenon').disabled = 'disabled';
                                              document.getElementById('idaff_nom_userinterpro').disabled = 'disabled';
                                              document.getElementById('nom_fille_mod_up').disabled = 'disabled';
                                              document.getElementById('idaff_telport').disabled = 'disabled';
                                              document.getElementById('idaff_telfixe').disabled = 'disabled';
                                              document.getElementById('idaff_email').disabled = 'disabled';
                                              document.getElementById('id_datenaissance').disabled = 'disabled';
                                              document.getElementById('adresse_mod_up').disabled = 'disabled';
                                              document.getElementById('code_postal_mod_up').disabled = 'disabled';
                                              document.getElementById('ville_mod_up').disabled = 'disabled';
                                              document.getElementById('num_secu_mod_up').disabled = 'disabled';
                                              document.getElementById('selectassurance').disabled = 'disabled';
                                              document.getElementById('medecintrait').disabled = 'disabled';
                                              document.getElementById('ville_medecin_mod_up').disabled = 'disabled';
                                              document.getElementById('profession_mod_up').disabled = 'disabled';
                                              //document.getElementById('remarque').disabled = 'disabled';
                                              
                                              $("#code_postal_mod_up").mask("9*999");
                                              $("#idaff_telport").mask("99 99 99 99 99");
                                              $("#idaff_telfixe").mask("99 99 99 99 99");
                                              $("#num_secu_mod_up").mask("9 99 99 9* 999 999 99");
                                              $("#id_datenaissance").mask("99/99/9999");


                                            }
                                        });
                                        document.getElementsByName("idaff_nom_userinterpro")[0].autocomplete="new-password";
                                      </script>
                                    {/literal}
                                  </div>
                                  <div class="col-sm-4 controls">
                                    <input type="text" placeholder="Prénom" name="prenom" id="idaff_prenon" value="" required style="border-color: red;" class="required input-first-letter input-widget" autocomplete="new-password" />
                                  </div>
                                </div>
                                <div class="form-group" id='divnomjeunefille_mod_up' style='display:none;'>
                                  <div class="col-sm-12 controls">
                                    <input type="text" placeholder="Nom de naissance" name="nom_fille_mod_up" value="" id="nom_fille_mod_up" class="input-majuscule input-widget" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-12 controls">
                                    <input type="text" placeholder="Adresse" name="adresse_mod_up" value="" id="adresse_mod_up" class="input-widget" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-6 controls">
                                    <input type="text" placeholder="Code postal" name="code_postal_mod_up" id="code_postal_mod_up" value="" class="input-widget" />
                                  </div>
                                  <div class="col-sm-6 controls">
                                    <input type="text" placeholder="Ville" name="ville_mod_up" id="ville_mod_up" value="" class="input-majuscule input-widget" />
                                  </div>
                                </div>

                                <div class="form-group">
                                  <div class="col-sm-6 controls">
                                    <input type="text" placeholder="Téléphone mobile" name="telport" id="idaff_telport" value="" class="input-widget" />
                                  </div>
                                  <div class="col-sm-6 controls">
                                    <input type="text" placeholder="Téléphone fixe" name="telfixe" id="idaff_telfixe" value="" class="input-widget" />
                                  </div>
                                </div>

                                 <div class="form-group">
                                  <div class="col-sm-12 controls">
                                    <input type="email" placeholder="Email" name="email" id="idaff_email" value="" class="input-widget" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-4 controls">
                                    <div class="input-group">
                                      <input type="text" placeholder="Date de naissance" value="" name="datenaissance" id="id_datenaissance" class="input-widget-date-left">
                                      <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#id_datenaissance">
                                        <i class="fa fa-calendar"></i>
                                      </span>
                                    </div>
                                  </div>
                                  {literal}
                                  <script type="text/javascript">
                                    $(document).ready(function() {
                                      $( "#id_datenaissance" ).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,changeYear: true,yearRange: "-100:+0"});
                                      $( '[data-datepicker]' ).click(function(e){ 
                                        var data=$(this).data('datepicker');
                                        $(data).focus();
                                      });
                                    });
                                  </script>
                                  {/literal}
                                  <div class="col-sm-4 controls">
                                    <input type="text" onkeyup="checkInsee(this);" placeholder="N° de sécurité sociale" value="" name="num_secu_mod_up" id="num_secu_mod_up" class="input-widget" />
                                  </div>
                                  <div class="col-sm-4 controls">
                                    <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                      <select placeholder="Assurance maladie" id="selectassurance" name="selectassurance">
                                        
                                      </select>
                                    </div>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-6 controls">
                                    <input type="text" placeholder="Médecin traitant" name="medecintrait" id="medecintrait" value="" class="input-widget" />
                                  </div>
                                  <div class="col-sm-6 controls">
                                    <input type="text" placeholder="Ville du médecin" name="ville_medecin_mod_up" id="ville_medecin_mod_up" value="" class="input-widget" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-12 controls">
                                    <input type="text" placeholder="Profession" name="profession_mod_up" value="" id="profession_mod_up" class="input-widget" />
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="col-sm-12 controls">
                                    <textarea placeholder="Remarque" name="remarque" id="remarque" class="input-widget" ></textarea>
                                  </div>
                                </div>

                                <div class="col-sm-12" align="center" id="div_button_update_patient" style="display:none;">
                                  <div class="col-sm-12 controls" align="center">
                                    <button type="button" name="updateButtonPatient" id="updateButtonPatient" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier</button>
                                  </div>
                                </div>

                                <div class="col-sm-12" align="center" id="div_button_suivant">
                                  <button id="btn_check_patient" name="btn_check_patient" type="submit" class="btn vd_btn btn_widget_standard">Suivant <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></button>
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="tab-pane" id="tab22">

                            <form class="form-horizontal" action="" role="form" id="formlisterdv" name="formlisterdv">                           
                              <input type="hidden" value="planning" name='validation' />
                              <input type="hidden" value="{$identifiant_entite}" id='idc' name="identifiant_entite"/>
                              <input type="hidden" value="3" id='all' />
                              
                              <div class="col-sm-12">
                                <div class="form-group">
                                  <div class="col-sm-2"></div>
                                  <div class="col-sm-8">

                                    <div id="divcatprofession" class="col-sm-12 controls" style='display:none;'>
                                      <div class="label-wrapper">
                                        <label class="control-label">
                                          <b>Quel est le professionnel de santé ?</b>
                                        </label>
                                      </div>
                                      <div class="vd_input-wrapper">
                                        <select id="selectcatprofession"></select>
                                      </div>
                                    </div>

                                    <div id="divprofession" class="col-sm-12 controls" style='display:none;'>
                                      <div class="label-wrapper">
                                        <label class="control-label">
                                          <b>Quelle est la spécialité ?</b>
                                        </label>
                                      </div>
                                      <div class="vd_input-wrapper">
                                        <select id="selectprofession"></select>
                                      </div>
                                    </div>

                                    <div id="iddivmotif" class="col-sm-12 controls" style="display:none;">
                                      <div class="label-wrapper">
                                        <label class="control-label">
                                          <b>Quel est le motif de la consultation ?</b>
                                        </label>
                                      </div>
                                      <div class="vd_input-wrapper">
                                        <select name="idrdv" id="idconsultation"></select>
                                      </div>
                                    </div>
                                    
                                    <div id="iddivlieu" class="col-sm-12 controls" style="display:none;">
                                      <div class="label-wrapper">
                                        <label class="control-label">
                                          <b>Quel est le lieu du rendez-vous ?</b>
                                        </label>
                                      </div>
                                      <div class="vd_input-wrapper">
                                        <select name="idlieu" id="idlieu"></select>
                                      </div>
                                    </div>

                                    <div id="iddivpraticien" class="col-sm-12 controls" style="display:none;">
                                      <div class="label-wrapper">
                                        <label class="control-label">
                                          <b>Avec quel praticien ?</b>
                                        </label>
                                      </div>
                                      <div class="vd_input-wrapper">
                                        <select name="praticien" id="idpraticien" ></select>
                                      </div>
                                    </div>


                                  </div>
                                  <div class="col-sm-2"></div>
                                </div>
                              </div>  
                              <div id="iddivoption" class="col-sm-12 controls" style="margin:0px; padding:0px;display:none;">
                                <div class="form-group">
                                  <div class="col-sm-4 controls" style="margin:0px;">
                                    <div class="label-wrapper">
                                      <label class="control-label">
                                        <b>Choisissez une date de début</b>
                                      </label>
                                    </div>
                                    <div class="input-group">
                                      <input type="text" placeholder="Choisissez une date de début" name="ladaterech" value="" name="datepicker-interpro" id="datepicker-interpro" class="input-widget-date-left">
                                      <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker-interpro">
                                        <i class="fa fa-calendar"></i>
                                      </span>
                                    </div>
                                    {literal}
                                    <script type="text/javascript">
                                      $("#datepicker-interpro").datepicker({
                                        dateFormat: 'dd/mm/yy',
                                        changeMonth: true,
                                        changeYear: true
                                      });
                                      $( '[data-datepicker]' ).click(function(e){ 
                                        var data=$(this).data('datepicker');
                                        $(data).focus();
                                      });

                                    </script>
                                    {/literal}
                                  </div>

                                  <div class="col-sm-4 controls" style="margin:0px;">
                                    <div class="label-wrapper">
                                      <label class="control-label">
                                        <b>Choisissez un jour</b>
                                      </label>
                                    </div>
                                    <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                      <select name="jour" id="jour">
                                        <option value="">Indifférent</option>
                                        <option value="1">Lundi</option>
                                        <option value="2">Mardi</option>
                                        <option value="3">Mercredi</option>
                                        <option value="4">Jeudi</option>
                                        <option value="5">Vendredi</option>
                                        <option value="6">Samedi</option>
                                        <option value="0">Dimanche</option>
                                      </select>
                                    </div>
                                  </div>

                                  <div class="col-sm-4 controls" style="margin:0px;">
                                    <div class="label-wrapper">
                                      <label class="control-label">
                                        <b>Choisissez un créneau horaire</b>
                                      </label>
                                    </div>
                                    <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                      <select name="horaire" id="horaire">
                                        <option value="">Indifférent</option>
                                        <option value="6-7">06h/08h</option>
                                        <option value="8-9">08h/10h</option>
                                        <option value="10-11">10h/12h</option>
                                        <option value="12-13">12h/14h</option>
                                        <option value="14-15">14h/16h</option>
                                        <option value="16-17">16h/18h</option>
                                        <option value="18-19">18h/20h</option>
                                        <option value="20-21">20h/22h</option>
                                      </select>
                                    </div>
                                  </div>                  
                                </div>
                              </div>
                              <div class="col-sm-12" align="center">
                                <a  id="btn_prec1" class="btn vd_btn prev" href="javascript:void(0);" onclick="document.getElementById('horaire').value='';document.getElementById('jour').value='';document.getElementById('datepicker-interpro').value='';retour_tab();" style="background-color: #8E8E8E;margin: 0px 10px 0px 0px;"><span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span> Retour</a>
                                <button id="btn_interpro_recherche" type="button"  class="btn vd_btn vd_bg-blue vd_white" onclick="recherche_rdv();">Rechercher</button>
                              </div>

                              <div class="col-sm-12" id="return_message_rdv_interpro" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                              <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                <div id="divrdvdispoattente_interpro" style="padding:0;display:none;">
                                  <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                                </div>
                                <div id="divrdvdispo_interpro" style="display:none;"></div>
                              </div>
                            </form>
                          </div>
                          {*
                          <div style="clear:both"></div>
                          <div class="form-actions-condensed wizard">
                            <div class="row mgbt-xs-0 footer-widget" align='center'>
                              <div class="col-sm-12"> 
                                <a  id="btn_prec" class="btn vd_btn prev" href="javascript:void(0);" style="background-color: #8E8E8E;margin: 0px 10px 0px 0px;"><span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span> Retour</a> <a id="btn_next" class="btn vd_btn next" href="javascript:void(0);">Continuer <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></a>
                                <button id="btn_terminer" style='display:none;' type="button" class="btn vd_btn vd_bg-color" data-dismiss="modal">Fermer</button>
                              </div>                             
                            </div>
                          </div>
                          *}
                        </div>
                      </div>
                      <div id="div_recap_info_interpro" style="display:none;">

                        <div class="alert alert-success">
                          <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
                          Le rendez-vous de votre patient a bien été confirmé, 
                          il recevra par SMS et/ou par mail le récapitulatif.
                        </div>
                        <div id="html_recap_info_interpro" class="col-sm-12 liste-widget-global" style="margin-bottom:15px;">
                          <div class='row col-sm-12' style="padding:0px; margin:0px;">
                            <div class='row col-sm-4 vcenter' id='div_recap_photo'></div><!--
                            --><div class='row col-sm-8 vcenter' id='div_recap_info' style="margin-left:5px"></div>
                          </div>

                          <div class='row col-sm-12' id='div_info_importante'></div>

                          <div class='row col-sm-12' id='div_recap_map'></div>

                          <div class='row col-sm-12' id='div_recap_mdr'></div>

                          <div class='row col-sm-12' id='div_recap_compl'></div>
                        </div>            
                        <div class="col-sm-12" align="center">
                          <button type="button" class="btn vd_btn vd_bg-color" onclick="parent.close_modal_principal('','','');">Fermer</button>
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
</div>

</body>
</html>