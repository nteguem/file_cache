<!DOCTYPE html>
<!--[if IE 8]>      <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>      <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->

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
    <link href="css/fonts.css" rel="stylesheet" type="text/css">

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

    <?php  $Query_1 = filemtime(PATH_ASSETS.'js/jquery.js');?>
    <script type="text/javascript" src="js/jquery.<?php echo $Query_1 ?>.js"></script>
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php  $boostrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js');?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $boostrapMin ?>.js"></script>
    <?php  $customMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js');?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMin ?>.js'></script>
    <?php  $punchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMin ?>.js"></script>

    <?php  $caroufredsel_1 = filemtime(PATH_ASSETS.'js/caroufredsel.js');?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel_1 ?>.js"></script>

    <?php  $plugin_1 = filemtime(PATH_ASSETS.'js/plugins.js');?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugin_1 ?>.js"></script>
    <?php  $breakpoint_1 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js');?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoint_1 ?>.js"></script>
    <?php  $datatableMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js');?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $datatableMin ?>.js"></script>
    
    <?php  $Photo_1 = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js');?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $Photo_1 ?>.js"></script>

    <?php  $concatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js');?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $concatMin ?>.js"></script>
   
    <?php  $tagsinputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js');?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsinputMin ?>.js"></script>
    
    <?php  $switchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js');?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $switchMin ?>.js"></script>
    
    <?php  $blockui_1 = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js');?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $blockui_1 ?>.js"></script>
    
    <?php  $pnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js');?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotifyMin ?>.js"></script>
    
    <?php  $concatMin_2 = filemtime(PATH_ASSETS.'js/jquery.mCustomScrollbar.concat.min.js');?>
    <script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.<?php echo $concatMin_2 ?>.js"></script>
    
    <?php  $mousewheelMin = filemtime(PATH_ASSETS.'js/jquery.mousewheel.min.js');?>
    <script type="text/javascript" src="js/jquery.mousewheel.min.<?php echo $mousewheelMin ?>.js"></script>

    <?php  $theme_1 = filemtime(PATH_ASSETS.'js/theme.js?{$stime}');?>
    <script type="text/javascript" src="js/theme.<?php echo $theme_1 ?>.js?{$stime}"></script>
    
    <?php  $custom_2 = filemtime(PATH_ASSETS.'custom/custom.js?{$stime}');?>
    <script type="text/javascript" src="custom/custom.<?php echo $custom_2 ?>.js?{$stime}"></script>

    <!-- Specific Page Scripts Put Here -->

    <?php  $wizardMin = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js');?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizardMin ?>.js'></script>

    <?php  $datepicker_3 = filemtime(PATH_ASSETS.'js/datepicker-fr.js');?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepicker_3 ?>.js"></script>

    <!-- Head SCRIPTS -->
    
    <?php  $mordernizr_3 = filemtime(PATH_ASSETS.'js/modernizr.js');?>
    <script type="text/javascript" src="js/modernizr.<?php echo $mordernizr_3 ?>.js"></script>
   
    <?php  $detectMin_1 = filemtime(PATH_ASSETS.'js/mobile-detect.min.js');?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $detectMin_1 ?>.js"></script>
    
    <?php  $detectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js');?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $detectModernizr ?>.js"></script>
    
    <?php  $maskedinputMin = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js');?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedinputMin ?>.js"></script>

    <!-- Script pour l'auto-completion -->
    
    <?php  $autocompleteMin = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js');?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $autocompleteMin ?>.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->

    <?php  $backoffice_1 = filemtime(PATH_ASSETS.'js/liste_widget_prise_rdv_backoffice.js');?>
    <script type="text/javascript" src="js/liste_widget_prise_rdv_backoffice.<?php echo $backoffice_1 ?>.js"></script>

    {literal}

        <script type="text/javascript">
            $(document).ready(function() {

                $.mCustomScrollbar.defaults.scrollButtons.enable = false;

                $('#lst-widget').mCustomScrollbar({
                    theme: "widget-theme"
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

                if (!myInseeField.value.match(expression)) {
                    isValid = false;
                    myInseeField.style.backgroundColor = '#efcfcd';
                } else {
                    var partialInsee = myInseeField.value.toString().substring(0, 13);
                    var clef = 97 - (parseFloat(partialInsee) % 97);

                    if (clef != parseInt(myInseeField.value.toString().substring(13, 15), 10)) {
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
                            $('#selectassurance').append('<option value="' + value
                                .id_assurance_maladie + '">' + value
                                .libelle_assurance_maladie + '</option>');
                        });
                    }
                });


                $('#civilite').change(function() {
                    var divNJF = document.getElementById('divnomjeunefille_mod_up');

                    if (this.selectedIndex == -1)
                        return null;

                    if (this.options[this.selectedIndex].text == "Mme") {
                        divNJF.style.display = "";
                    } else {
                        divNJF.style.display = "none";
                    }
                });

                //$('#myModalLabelinfordv').val("");

                $("#code_postal_mod_up").mask("9*999");
                $("#idaff_telport").mask("99 99 99 99 99");
                $("#idaff_telfixe").mask("99 99 99 99 99");
                $("#num_secu_mod_up").mask("9 99 99 9* 999 999 99");
                $("#id_datenaissance").mask("99/99/9999");


                var return_message_rdv = document.getElementById('return_message_rdv');
                var return_message_rdv_perso = document.getElementById('return_message_rdv_perso');


                $("#formpatient").submit(function() {
                    enregistrement_patient();


                    return false;
                });


                $("#updateButtonPatient").click(function() {

                    $.ajax({
                        cache: false,
                        url: 'ajax/modif_patient.php',
                        data: 'id_patient=' + $('#id_patient').val() + '&nom_mod_up=' + $(
                                '#idaff_nom_userinterpro').val() + '&nom_fille_mod_up=' + $(
                                '#nom_fille_mod_up').val() +
                            '&prenom_mod_up=' + $('#idaff_prenon').val() + '&tel_mod_up=' + $(
                                '#idaff_telport').val() + '&tel_fixe_mod_up=' + $('#idaff_telfixe')
                            .val() +
                            '&email_mod_up=' + $('#idaff_email').val() + '&date_naissance_mod_up=' +
                            $('#id_datenaissance').val() + '&adresse_mod_up=' + $('#adresse_mod_up')
                            .val() +
                            '&code_postal_mod_up=' + $('#code_postal_mod_up').val() +
                            '&ville_mod_up=' + $('#ville_mod_up').val() + '&num_secu_mod_up=' + $(
                                '#num_secu_mod_up').val() +
                            '&selectassurance=' + $('#selectassurance').val() +
                            '&medecin_traitant_mod_up=' + $('#medecintrait').val() +
                            '&ville_medecin_mod_up=' + $('#ville_medecin_mod_up').val() +
                            '&profession_mod_up=' + $('#profession_mod_up').val() + '&remarque=' +
                            $('#remarque').val() + '&civilite_mod_up=' + $('#civilite').val(),
                        dataType: 'json',
                        success: function(json) {
                            $.each(json, function(index, value) {
                                if (value.success = true) {

                                    document.getElementById('civilite').disabled =
                                        'disabled';
                                    document.getElementById('idaff_prenon').disabled =
                                        'disabled';
                                    document.getElementById('idaff_nom_userinterpro')
                                        .disabled = 'disabled';
                                    document.getElementById('nom_fille_mod_up')
                                        .disabled = 'disabled';
                                    document.getElementById('idaff_telport').disabled =
                                        'disabled';
                                    document.getElementById('idaff_telfixe').disabled =
                                        'disabled';
                                    document.getElementById('idaff_email').disabled =
                                        'disabled';
                                    document.getElementById('id_datenaissance')
                                        .disabled = 'disabled';
                                    document.getElementById('adresse_mod_up').disabled =
                                        'disabled';
                                    document.getElementById('code_postal_mod_up')
                                        .disabled = 'disabled';
                                    document.getElementById('ville_mod_up').disabled =
                                        'disabled';
                                    document.getElementById('num_secu_mod_up')
                                        .disabled = 'disabled';
                                    document.getElementById('selectassurance')
                                        .disabled = 'disabled';
                                    document.getElementById('medecintrait').disabled =
                                        'disabled';
                                    document.getElementById('ville_medecin_mod_up')
                                        .disabled = 'disabled';
                                    document.getElementById('profession_mod_up')
                                        .disabled = 'disabled';

                                    div_button_base.style.display = "";
                                    div_button_update_patient.style.display = "none";
                                } else {
                                    alert(value.message);
                                }
                            });

                        }
                    });

                {/literal}
                {if $enmodif}
                    {literal}
                        info_patient();
                    {/literal}
                {/if}
                {literal}

                    return false;
                });

            });

            function info_patient() {
                document.getElementById('id_patient').value = suggestion.id;
                $('#civilite').val(suggestion.id_civilite);
                $('#civilite').change();

                $('#selectassurance').append('<option value="">Votre assurance</option>');
                $.ajax({
                    url: 'ajax/liste_assurance.php',
                    dataType: 'json',
                    success: function(json) {
                        $.each(json, function(index, value) {
                            $('#selectassurance').append('<option value="' + value
                                .id_assurance_maladie + '">' + value.libelle_assurance_maladie +
                                '</option>');
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

                if (document.getElementById('idaff_nom_userinterpro') != "") {
                    div_reinit.style.display = "";
                } else {
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

            function enregistrement_patient() {
                var divenregpatient = document.getElementById('divenregpatient');
                var divtempcheckpatient = document.getElementById('divtempcheckpatient');
                divenregpatient.style.display = 'none';
                divtempcheckpatient.style.display = 'block';

                var smodif = 0;


                $('#divtempcheckpatient').html(
                    "<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>"
                );

                if ($('#id_patient').val() != "") {
                    smodif = 1;
                } else {
                    smodif = 0;
                }

                $.ajax({
                        cache: false,
                        url: 'ajax/enregistrement_patient.php',
                        data: 'idinterpro=' + $('#idinterpro').val() + '&id_patient=' + $('#id_patient').val() +
                            '&idaff_nom=' + encodeURIComponent($('#idaff_nom_userinterpro').val()) +
                            '&nom_fille_mod_up=' + encodeURIComponent($('#nom_fille_mod_up').val()) + '&idaff_prenon=' +
                            encodeURIComponent($('#idaff_prenon').val()) + '&idaff_telport=' + encodeURIComponent($(
                                '#idaff_telport').val()) +
                            '&idaff_telfixe=' + encodeURIComponent($('#idaff_telfixe').val()) + '&idaff_email=' +
                            encodeURIComponent($('#idaff_email').val()) + '&id_datenaissance=' + encodeURIComponent($(
                                '#id_datenaissance').val()) +
                            '&adresse_mod_up=' + encodeURIComponent($('#adresse_mod_up').val()) +
                            '&code_postal_mod_up=' + encodeURIComponent($('#code_postal_mod_up').val()) +
                            '&ville_mod_up=' + encodeURIComponent($('#ville_mod_up').val()) +
                            '&num_secu_mod_up=' + encodeURIComponent($('#num_secu_mod_up').val()) +
                            '&selectassurance=' + encodeURIComponent($('#selectassurance').val()) + '&medecintrait=' +
                            encodeURIComponent($('#medecintrait').val()) +
                            '&ville_medecin_mod_up=' + encodeURIComponent($('#ville_medecin_mod_up').val()) +
                            '&profession_mod_up=' + encodeURIComponent($('#profession_mod_up').val()) + '&remarque=' +
                            encodeURIComponent($('#remarque').val()) +
                            '&civilite=' + $('#civilite').val(),
                        dataType: 'json',
                        async: false, // Mode synchrone
                        success: function(json) {
                            $.each(json, function(index, value) {

                                    divenregpatient.style.display = 'block';
                                    divtempcheckpatient.style.display = 'none';
                                    $("#divtempcheckpatient").html("");
                                    //alert(value.idunique);
                                    //$("#id_patient").val(value.idunique);
                                    parent.close_modal_principal('', '');
                                    if("{/literal}{$mode}{literal}" == "select"){

                                    var str = $('#idaff_prenon').val();
                                    var tab = str.split(" ");
                                    var $prenom = "";

                                    for (var i = 0; i < tab.length; i++) {
                                        $prenom += tab[i].substring(0, 1).toUpperCase() + tab[i].substring(1,
                                            tab[i].length).toLowerCase() + " ";
                                    }

                                    //alert($("#id_patient").val());
                                    parent.actualise_input($('#civilite option:selected').text() + " " + $(
                                            '#idaff_nom_userinterpro').val().toUpperCase() + " " + $prenom,
                                        value.idunique);
                                    if({$return}=="modif"){
                                    $('#modalFichePatient').modal('show');
                                    getInfoPatient(value.idunique);
                                }
                            }


                        });
                }
            });
            }

            function modif_patient() {
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

            function reinit_form() {
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
                            $('#selectassurance').append('<option value="' + value
                                .id_assurance_maladie + '">' + value.libelle_assurance_maladie +
                                '</option>');
                        });
                    }
                });
            }

        </script>
        <!-- Specific Page Scripts END -->



        <style type="text/css">
            ::-webkit-input-placeholder {
                color: #164561;
            }

            :-moz-placeholder {
                color: #164561;
            }

            ::-moz-placeholder {
                color: #164561;
            }

            :-ms-input-placeholder {
                color: #164561;
            }

            @media (min-width: 768px) {
                .modal-dialog {
                    width: 700px;
                }
            }

            .tabb_rond_couleur {
                background-color: #01D0CA !important;
            }

            .autocomplete-suggestions {
                border: 1px solid #999;
                background: #FFF;
                overflow: auto;
            }

            .autocomplete-suggestion {
                padding: 2px 5px;
                white-space: nowrap;
                overflow: hidden;
            }

            .autocomplete-selected {
                background: #F0F0F0;
            }

            .autocomplete-suggestions strong {
                font-weight: normal;
                color: #3399FF;
            }

            select {

                height: 39px;
            }
        </style>
    {/literal}
</head>

<body id="forms"
    class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix"
    data-active="forms " data-smooth-scrolling="1">

    <div id='myfiltre'
        style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10000;opacity:0.7;filter: alpha(opacity=70);'>
    </div>

    <div id="myModal" style='display:block;'>

        <div class="modal-dialog" style="margin-top:0px;margin-bottom:0px;">
            <div>
                <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
                    <div id='alert_message_avertissement'
                        style="z-index:2400;position:absolute;top:50%;left:0;right:0;margin: 0 auto;width:100%;display:none;">
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8 liste-widget-global">
                                <div class="col-sm-12" id='txt_alert_message_avertissement'></div>
                                <div class="col-sm-12" role="group" aria-label="" align="center">
                                    <button id="btn_message_alert_ok" name="btn_message_alert_ok" type="button"
                                        class="btn btn_confirm"
                                        style="background-color: #8E8E8E;color:#ffffff;">Ok</button>
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

                                            <div class="tab-content no-bd" style="padding-top: 0px;">


                                                <form action="#" role="form" id="register-form-3"></form>
                                                <form class="form-horizontal" action="#" role="form" id="formpatient"
                                                    name="formpatient" autocomplete="new-password">
                                                    <input type="hidden" name="idinterpro" value="{$interpro}"
                                                        id="idinterpro">
                                                    <input type="hidden" name="validation" value="ok">
                                                    <div class="col-sm-12 controls" id="divtempcheckpatient"
                                                        style="display:none;"></div>
                                                    <div class="col-sm-12 controls" id="divenregpatient">
                                                        <div class="form-group" style="margin-bottom: 5px;">
                                                            <div class="col-sm-12 controls" style="display:none;"
                                                                id="div_reinit">
                                                                <a href="#" onclick="modif_patient();"><i
                                                                        class="fa fa-pencil"></i> Modifier la fiche
                                                                    patient</a> - <a href='#'
                                                                    onclick="reinit_form();">Réinitialiser</a>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-sm-3 controls">
                                                                <div class="vd_input-wrapper-compte"
                                                                    style="margin:0px;font-weight:400">
                                                                    <select id="civilite" name="civilite" required
                                                                        class="required" style="border-color: red;">
                                                                        <option value="" disabled selected hidden>
                                                                            Civilité</option>
                                                                        {foreach from=$aTableauCivilite item=objCivilite}
                                                                            <option value="{$objCivilite.id_civilite}">
                                                                                {$objCivilite.abreviation_civilite}</option>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-4 controls">
                                                                <input type="text" placeholder="Nom"
                                                                    name="idaff_nom_userinterpro"
                                                                    id="idaff_nom_userinterpro" value="{$nom}" required
                                                                    style="border-color: red;"
                                                                    class="required input-majuscule input-widget" />
                                                                <input type="hidden" name="id_patient" id="id_patient">
                                                            </div>
                                                            <div class="col-sm-1 controls"
                                                                style="cursor: pointer;left: 5px;top: 10px;right: 10px;height: 26px;width:21px;background: url(img/switch.png) no-repeat;"
                                                                onclick='switchNomPrenom("#idaff_prenon","#idaff_nom_userinterpro")'>
                                                            </div>
                                                            <div class="col-sm-4 controls">
                                                                <input type="text" placeholder="Prénom" name="prenom"
                                                                    id="idaff_prenon" value="{$prenom}" required
                                                                    style="border-color: red;"
                                                                    class="required input-first-letter input-widget"
                                                                    autocomplete="new-password" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id='divnomjeunefille_mod_up'
                                                            style='display:none;'>
                                                            <div class="col-sm-12 controls">
                                                                <input type="text" placeholder="Nom de naissance"
                                                                    name="nom_fille_mod_up" value=""
                                                                    id="nom_fille_mod_up"
                                                                    class="input-majuscule input-widget" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-12 controls">
                                                                <input type="text" placeholder="Adresse"
                                                                    name="adresse_mod_up" value="" id="adresse_mod_up"
                                                                    class="input-widget" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-6 controls">
                                                                <input type="text" placeholder="Code postal"
                                                                    name="code_postal_mod_up" id="code_postal_mod_up"
                                                                    value="" class="input-widget" />
                                                            </div>
                                                            <div class="col-sm-6 controls">
                                                                <input type="text" placeholder="Ville"
                                                                    name="ville_mod_up" id="ville_mod_up" value=""
                                                                    class="input-majuscule input-widget" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-sm-6 controls">
                                                                <input type="text" placeholder="Téléphone mobile"
                                                                    name="telport" id="idaff_telport" value="{$tel}"
                                                                    class="input-widget" />
                                                            </div>
                                                            <div class="col-sm-6 controls">
                                                                <input type="text" placeholder="Téléphone fixe"
                                                                    name="telfixe" id="idaff_telfixe" value=""
                                                                    class="input-widget" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-sm-12 controls">
                                                                <input type="email" placeholder="Email" name="email"
                                                                    id="idaff_email" value="" class="input-widget" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-4 controls">
                                                                <div class="input-group">
                                                                    <input type="text" placeholder="Date de naissance"
                                                                        value="{$age}" name="datenaissance"
                                                                        id="id_datenaissance"
                                                                        class="input-widget-date-left">
                                                                    <span
                                                                        class="input-group-addon input-widget-date-right"
                                                                        id="datepicker-icon-trigger"
                                                                        data-datepicker="#id_datenaissance">
                                                                        <i class="fa fa-calendar"></i>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $(document).ready(function() {
                                                                        $("#id_datenaissance")
                                                                            .datepicker({
                                                                                dateFormat: 'dd/mm/yy',
                                                                                changeMonth: true,
                                                                                changeYear: true,
                                                                                yearRange: "-100:+0"
                                                                            });
                                                                        $('[data-datepicker]').click(function(e) {
                                                                            var data = $(this).data(
                                                                                'datepicker');
                                                                            $(data).focus();
                                                                        });
                                                                    });
                                                                </script>
                                                            {/literal}
                                                            <div class="col-sm-4 controls">
                                                                <input type="text" onkeyup="checkInsee(this);"
                                                                    placeholder="N° de sécurité sociale" value=""
                                                                    name="num_secu_mod_up" id="num_secu_mod_up"
                                                                    class="input-widget" />
                                                            </div>
                                                            <div class="col-sm-4 controls">
                                                                <div class="vd_input-wrapper-compte"
                                                                    style="margin:0px;font-weight:400">
                                                                    <select placeholder="Assurance maladie"
                                                                        id="selectassurance" name="selectassurance">

                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-6 controls">
                                                                <input type="text" placeholder="Médecin traitant"
                                                                    name="medecintrait" id="medecintrait" value=""
                                                                    class="input-widget" />
                                                            </div>
                                                            <div class="col-sm-6 controls">
                                                                <input type="text" placeholder="Ville du médecin"
                                                                    name="ville_medecin_mod_up"
                                                                    id="ville_medecin_mod_up" value=""
                                                                    class="input-widget" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-12 controls">
                                                                <input type="text" placeholder="Profession"
                                                                    name="profession_mod_up" value=""
                                                                    id="profession_mod_up" class="input-widget" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="col-sm-12 controls">
                                                                <textarea placeholder="Remarque" name="remarque"
                                                                    id="remarque" class="input-widget"></textarea>
                                                            </div>
                                                        </div>

                                                        {if $enmodif}
                                                            <div class="col-sm-12" align="center"
                                                                id="div_button_update_patient">
                                                                <div class="col-sm-12 controls" align="center">
                                                                    <button type="button" name="updateButtonPatient"
                                                                        id="updateButtonPatient"
                                                                        class="btn vd_btn vd_bg-blue"><span
                                                                            class="menu-icon"></span>Modifier</button>
                                                                </div>
                                                            </div>
                                                        {else}
                                                            <div class="col-sm-12" align="center" id="div_button_suivant">
                                                                <button id="btn_check_patient" name="btn_check_patient"
                                                                    type="submit"
                                                                    class="btn vd_btn vd_bg-color">Valider</button>
                                                            </div>
                                                        {/if}
                                                        <div class="col-sm-12" align="center" style="display: none;">
                                                            <button type="button" class="btn vd_btn vd_bg-color"
                                                                onclick="parent.close_modal_principal('','');parent.actualise_calendrier();">Fermer</button>
                                                        </div>
                                                    </div>
                                                </form>
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