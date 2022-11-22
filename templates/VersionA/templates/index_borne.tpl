<!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>
<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html><!--<![endif]-->

      <!-- Specific Page Data -->
      <!-- End of Data -->

<head>
    <meta charset="utf-8"/>
    <title>Alaxione</title>
    <meta name="keywords" content=""/>
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
    <?php $bootstrapIndexBorn = filemtime(PATH_ASSETS.'css/bootstrap.min.css') ?>
    <link href="css/bootstrap.min.<?php echo $bootstrapIndexBorn ?>.css" rel="stylesheet" type="text/css">

    <?php $awesomeIndexBorn = filemtime(PATH_ASSETS.'css/font-awesome.min.css') ?>
    <link href="css/font-awesome.min.<?php echo $awesomeIndexBorn ?>.css" rel="stylesheet" type="text/css">
    
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <?php $fontEntypoIndexBorn = filemtime(PATH_ASSETS.'css/font-entypo.css') ?>
    <link href="css/font-entypo.<?php $fontEntypoIndexBorn ?>.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <?php $fontIndexBorn = filemtime(PATH_ASSETS.'css/fonts.css') ?>
    <link href="css/fonts.<?php echo $fontIndexBorn ?>.css"  rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <?php $customMinIndexBorn = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.css') ?>
    <link href="plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMinIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <?php $prettyPhotoMinIndexBorn = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/css/prettyPhoto.css') ?>
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.<?php echo $prettyPhotoMinIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <?php $isotopeIndexBorn = filemtime(PATH_ASSETS.'plugins/isotope/css/isotope.css') ?>
    <link href="plugins/isotope/css/isotope.<?php echo $isotopeIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <?php $pnotifyIndexBorn = filemtime(PATH_ASSETS.'plugins/pnotify/css/jquery.pnotify.css') ?>
    <link href="plugins/pnotify/css/jquery.pnotify.<?php echo $pnotifyIndexBorn ?>.css" media="screen" rel="stylesheet" type="text/css">    
    <?php $prettyPrettyIndexBorn = filemtime(PATH_ASSETS.'plugins/google-code-prettify/prettify.css') ?>
    <link href="plugins/google-code-prettify/prettify.<?php $prettyPrettyIndexBorn ?>.css" rel="stylesheet" type="text/css"> 

    <?php $mCustomScrollIndexBorn = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.css') ?>
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.<?php echo $mCustomScrollIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <?php $tagsInIndexBorn = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.css') ?>
    <link href="plugins/tagsInput/jquery.tagsinput.<?php echo $tagsInIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <?php $bootstrapIndexBorn = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.css') ?>
    <link href="plugins/bootstrap-switch/bootstrap-switch.<?php echo $bootstrapIndexBorn ?>.css" rel="stylesheet" type="text/css">    
    <?php $dateAngePicIndexBorn = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker-bs3.css') ?>
    <link href="plugins/daterangepicker/daterangepicker-bs3.<?php echo $dateAngePicIndexBorn ?>.css" rel="stylesheet" type="text/css">    
    <?php $timpicIndexBorn = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.css') ?>
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timpicIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <?php $colorPicIndexBorn = filemtime(PATH_ASSETS.'plugins/colorpicker/css/colorpicker.css') ?>
    <link href="plugins/colorpicker/css/colorpicker.<?php echo $colorPicIndexBorn ?>.css" rel="stylesheet" type="text/css">   


    <!-- Specific CSS -->
    <?php $bootstrapDataIndexBorn = filemtime(PATH_ASSETS.'plugins/dataTables/css/dataTables.bootstrap.css') ?>
    <link href="plugins/dataTables/css/dataTables.bootstrap.<?php echo $bootstrapDataIndexBorn ?>.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <?php $themeIndexBorn = filemtime(PATH_ASSETS.'css/theme.min.css') ?>
    <link href="css/theme.min.<?php echo $themeIndexBorn ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="css/ie.css" rel="stylesheet"> <![endif]-->
    <?php $chromeIndexBorn = filemtime(PATH_ASSETS.'css/chrome.css') ?>
    <link href="css/chrome.<?php echo $chromeIndexBorn ?>.css" rel="stylesheet" type="text/chrome"IndexBorn >
    <!-- chrome only css -->


    <!-- Responsive CSS -->
    <?php $responsiveIndexBorn = filemtime(PATH_ASSETS.'css/theme-responsive.min.css') ?>
    <link href="css/theme-responsive.min.<?php echo $responsiveIndexBorn ?>.css" rel="stylesheet" type="text/css"> 


    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->
    <?php $mCustomIndexBorn = filemtime(PATH_ASSETS.'css/jquery.mCustomScrollbar.min.css') ?>
    <link type="text/css" href="css/jquery.mCustomScrollbar.min.<?php echo $mCustomIndexBorn ?>.css" rel="stylesheet" media="all"/>

    <!-- Custom CSS -->
    <?php $widgetIndexBorn = filemtime(PATH_ASSETS.'custom/custom_widget.css') ?>
    <link href="custom/custom_widget.<?php echo $widgetIndexBorn ?>.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/excanvas.js"></script>
    <![endif]-->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.js'></script>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

    <script type="text/javascript" src="js/caroufredsel.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>

    <script type="text/javascript" src="plugins/breakpoints/breakpoints.js"></script>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script>

    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.js"></script>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.js"></script>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.js"></script>
    <script type="text/javascript" src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>

    <script type="text/javascript" src="js/theme.js?1454423157"></script>
    <script type="text/javascript" src="custom/custom.js?1454423157"></script>

    <!-- Specific Page Scripts Put Here -->

    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js'></script>


    <script type="text/javascript" src="js/datepicker-fr.js"></script>

    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/mobile-detect.min.js"></script>
    <script type="text/javascript" src="js/mobile-detect-modernizr.js"></script>
    <script type="text/javascript" src="js/jquery.maskedinput.min.js"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->


    {literal}
        <script type="text/javascript">

            function affiche_popup_message(titre, message, text_bouton) {
                $('#myModalLabelNoInfo').html(titre);
                $('#txtmyModalNoInfo').html(message);
                $('#boutonmyModalNoInfo').html(text_bouton);

                $('#myModalNoInfo').modal('show');
            }

            function valider_presence_patient(idrdv){

                var div_attente_confirm = document.getElementById('div_attente_confirm');
                var lst_patient = document.getElementById('lst_patient');
                var div_retour_valide_patient = document.getElementById('div_retour_valide_patient');

                div_attente_confirm.style.display = 'block';
                lst_patient.style.display = 'none';

                $('#div_attente_confirm').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");

                $.ajax({
                    cache: false,
                    url: 'ajax/valider_presence_patient.php',
                    data: 'idp=' + idrdv,
                    dataType: 'json', // on veut un retour JSON
                    success: function (json) {
                        div_attente_confirm.style.display = 'none';
                        $('#div_attente_confirm').html("");
                        div_retour_valide_patient.style.display = 'block';
                        $.each(json, function (index, value) {
                            if(value.status == "1"){
                                $('#message_retour_valide').html('<img src="'+value.imagePlan+'" style="max-height:250px;" border="0" ><h3 class="panel-title title1" style="font-size: xx-large;">'+value.messageHtml+'</h3>');
                            }else{
                                $('#message_retour_valide').html('<h3 class="panel-title title1" style="font-size: xx-large;">'+value.messageHtml+'</h3>');
                            }

                        });
                        retourAccueil();
                    }
                });

                return false;
            }

            var refreshIntervalId;

            function retourAccueil() {
                refreshIntervalId = setInterval(fc_retour_accueil, 15000);
            }

            function fc_retour_accueil(){
                clearInterval(refreshIntervalId);
                var div_float_retour_accueil = document.getElementById('div_float_retour_accueil');
                var borne_div_accueil = document.getElementById('borne_div_accueil');
                var borne_div_presence = document.getElementById('borne_div_presence');
                var lst_patient = document.getElementById('lst_patient');
                var div_retour_valide_patient = document.getElementById('div_retour_valide_patient');

                borne_div_accueil.style.display = 'block';
                div_float_retour_accueil.style.display = 'none';
                borne_div_presence.style.display = 'none';
                lst_patient.style.display = 'none';
                div_retour_valide_patient.style.display = 'none';

                $('#lst_patient').html("");
                $('#nom_ident_borne').val("");

            }


            function closeiframe(){
                document.getElementById('mywidget').style.display='none';
                document.getElementById('mywidgetcompte').style.display='none';
                document.getElementById('myfiltre').style.display='none';
            }


            $(document).ready(function () {

                window.addEventListener('message',function(event) {
                    //if(event.origin !== url_host) return;
                    if(event.data=="closeiframe"){
                        closeiframe();
                    }
                },false);

                $("#btn_1").click(function () {
                    var div_float_retour_accueil = document.getElementById('div_float_retour_accueil');
                    var borne_div_presence = document.getElementById('borne_div_presence');
                    var borne_div_accueil = document.getElementById('borne_div_accueil');
                    var lst_patient = document.getElementById('lst_patient');

                    borne_div_presence.style.display = 'block';
                    div_float_retour_accueil.style.display = 'block';
                    borne_div_accueil.style.display = 'none';
                    lst_patient.style.display = 'none';
                    $('#lst_patient').html("");
                    $('#message_retour_valide').html("");
                    $('#nom_ident_borne').val("");

                    //affiche_popup_message("Tsss", "Tu pensais vraiment que tout était pret ?!?", "Hahaha");
                    return false;
                });

                $("#btn_2").click(function () {
                    //affiche_popup_message("Tsss", "Et en plus tu insiste ?!?", "Hahaha");
                    return false;
                });

                $("#btn_retour_accueil").click(function () {
                    fc_retour_accueil();
                    return false;
                });

                $("#retour_accueil_final").click(function () {
                    fc_retour_accueil();
                    return false;
                });

                //$("#btn_recherche_patient").click(function () {
                $("#form-identification-borne").submit(function () {
                    var div_attente_confirm = document.getElementById('div_attente_confirm');
                    var borne_div_presence = document.getElementById('borne_div_presence');
                    var lst_patient = document.getElementById('lst_patient');

                    div_attente_confirm.style.display = 'block';
                    borne_div_presence.style.display = 'none';

                    $('#div_attente_confirm').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");
                    $.ajax({
                        cache: false,
                        url: 'ajax/liste_patient_journee.php',
                        data: 'rech=' + $('#nom_ident_borne').val() + '&entite=' + $('#idc').val(),
                        dataType: 'json', // on veut un retour JSON
                        success: function (json) {
                            div_attente_confirm.style.display = 'none';
                            $('#div_attente_confirm').html("");

                            //if (json.length != 0) {

                                var aTabResult = "";
                                aTabResult = "<div id='lst_patient_trouve' class='content-list content-image'>";
                                aTabResult = aTabResult.concat("<ul class='list-wrapper no-bd-btm'>");

                                $.each(json, function (index, value) {

                                    if(value.status == 1){
                                        lst_patient.style.display = 'block';
                                        aTabResult = aTabResult.concat('<li class="liste-patient-trouve"><a href="#" onclick="valider_presence_patient(\''+value.identification_rdv+'\');">');
                                        aTabResult = aTabResult.concat('<div class="menu-icon" style="float:right; line-height:100px; margin-right:40px; height:100px;font-size: -webkit-xxx-large;"><i class="fa fa-fw fa-chevron-circle-right"></i></div>');
                                        aTabResult = aTabResult.concat('<div class="menu-text" style="font-size: xx-large;line-height: 50px;" align="center">'+value.nom_patient+' '+value.prenom_patient);
                                        aTabResult = aTabResult.concat('<div class="menu-info" style="text-transform:none; font-size: x-large">Rendez-vous prévu à '+value.heure_rdv+'<span class="menu-date"> avec le Dr '+value.nom_docteur+'</span></div>');
                                        aTabResult = aTabResult.concat('</div></a></li>');
                                    }else{
                                        borne_div_presence.style.display = 'block';
                                        //affiche_popup_message("Inconnu", "Nous n'avons pas retrouvé votre compte ! Veuillez vérifier la saisie de votre nom, merci", "Ok");
                                        affiche_popup_message("Information", value.message, "Ok");
                                    }

                                });

                                aTabResult = aTabResult.concat("</ul></div>");
                                $('#lst_patient').html(aTabResult);

                            //} else {

                            //}

                        }
                    });
                    return false;
                });

            });

        </script>
        <!-- Specific Page Scripts END -->
        <style type="text/css">

            html, body {
                height: 100%;
            }

            .cont {
                height: 100%;
            }

            .logoRow {
                height: 100%;
            }

            .logoCol {
                height: 100%;
            }

            .logoCont {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                height: 50%;
                width: 90%;
            }

            .btn_design, .btn_design:hover {
                background-color: #83DAF5;
                color: #ffffff;
                -moz-box-shadow: 2px 2px 2px silver;
                -webkit-box-shadow: 2px 2px 2px silver;
                -o-box-shadow: 2px 2px 2px silver;
                box-shadow: 2px 2px 2px silver;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                border-radius: 5px;
            }

            .btn-besoin-aide {
                -moz-box-shadow: 2px 2px 2px 0px silver;
                -webkit-box-shadow: 2px 2px 2px 0px silver;
                -o-box-shadow: 2px 2px 2px 0px silver;
                box-shadow: 2px 2px 2px 0px silver;

                -webkit-border-bottom-right-radius: 5px;
                -webkit-border-bottom-left-radius: 5px;
                -moz-border-radius-bottomright: 5px;
                -moz-border-radius-bottomleft: 5px;
                border-bottom-right-radius: 5px;
                border-bottom-left-radius: 5px;
            }

            .liste-patient-trouve {
                background-color: #CEF0FC;
                -moz-box-shadow: 2px 2px 2px silver;
                -webkit-box-shadow: 2px 2px 2px silver;
                -o-box-shadow: 2px 2px 2px silver;
                box-shadow: 2px 2px 2px silver;
                -moz-border-radius: 10px;
                -webkit-border-radius: 10px;
                border-radius: 10px;
                padding: 10px;
            }
        </style>
    {/literal}
</head>

<body id="forms"
      class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix"
      data-active="forms" data-smooth-scrolling="1">
<input type="hidden" id="idc" name="idc" value="{$idc}">

<div id='myfiltre' style='display: none;position: fixed;top: 0%;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:99999990;opacity:0.7;filter: alpha(opacity=70);' onclick="document.getElementById('mywidget').style.display='none';document.getElementById('mywidgetcompte').style.display='none';document.getElementById('myfiltre').style.display='none';"></div>
<div id='mywidget' class='cmywidget' style='width: 800px;height:90%;display: none;position:fixed;top: 50%;left: 50%;padding: 0;margin: 0px auto;border: 0px;background-color: white;z-index:99999991; -webkit-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);'><iframe src='./index_public.php?idc={$idc}&idp={$idp}' width='100%' height='100%' frameborder='0' ></iframe></div>
<div id='mywidgetcompte' class='cmywidgetcompte' style='height:90%;display: none;position:fixed;top: 50%;left: 50%;padding: 0;margin: 0px auto;border: 0px;z-index:99999991; -webkit-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);'><iframe src='./index_public_compte.php?idc={$idc}&idp={$idp}' width='100%' height='100%' frameborder='0' ></iframe></div>

<div id="div_float_retour_accueil" style="display:none;z-index:1000;position:absolute;top:-3px;left:50px;">
    <button id="btn_retour_accueil" type="button" class="btn vd_btn btn-besoin-aide" style="font-size:xx-large;background-color: #83DAF5;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px;">
        <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span>Retour à l'accueil
    </button>
</div>

<div class="container-fluid cont">
    <div class="row logoRow">
        <div class="col-md-12 logoCol">
            <div class="logoCont center-block">

                <div id="borne_div_accueil">
                    <div class="row" style="padding:10px;">
                        <div class="col-sm-12" align="center">
                            <h3 class="panel-title title1" style="font-size: xx-large;font-weight:900;">{$smessageaccueil}</h3><br/>

                            {if $is_slogo!=""}
                                <img src="{$slogo}" border="0"/>
                            {/if}

                        </div>
                    </div>
                    <div class="row" style="padding:20px;">
                    </div>
                    <div class="row" style="padding:10px;">
                        <div class="col-sm-12" align="center">
                            <div class="col-sm-6" align="center" style="height:100%;">
                                <a id="btn_1" class="btn vd_btn btn_design" style="width:80%; height:200px;" href="javascript:void(0);">
                                    <h3 style="font-size:xx-large;padding-top:50px;font-size:xx-large;color:#fff !important;color:#fff !important;">Je signale<br/>ma présence <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></h3>
                                </a>
                            </div>
                            <div class="col-sm-6" align="center" style="height:100%;">
                                <a id="btn_2" class="btn vd_btn btn_design" style="width:80%; height:200px;" href="javascript:void(0);"  onclick="document.getElementById('mywidget').style.display = 'block';document.getElementById('myfiltre').style.display='block'">
                                    <h3 style="font-size:xx-large;padding-top:50px;font-size:xx-large;color:#fff !important;color:#fff !important;">Prendre<br/>un Rendez-vous <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></h3>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="div_attente_confirm" style="display: none;"></div>
                <div id="borne_div_presence" style="display:none;">
                    <div class="row" style="padding:10px;">
                        <div class="panel-heading" align="center">
                            <h3 class="panel-title title1" style="font-size: xx-large;"> Veuillez saisir votre nom </h3>
                        </div>
                        <div class="col-sm-12" align="center">
                            <form action="#" role="form" id="form-identification-borne" autocomplete="new-password">
                                <div class="form-group">
                                    <div class="col-sm-12 controls">
                                        <input type="text" placeholder="Votre nom" name="nom_ident_borne" id="nom_ident_borne" autocomplete="new-password" required class="required input-widget" style="height: 60px;line-height: 60px;font-size: xx-large;"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12 controls" align="center">
                                        <div style="height: 30px;"></div>
                                        <button id="btn_recherche_patient2" type="submit" class="btn vd_btn btn_design" style="width:30%; height:100px;">
                                            <h3 style=" line-height:80px;color:#fff !important;font-size: xx-large;"> Valider <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></h3>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="lst_patient" style="display: none;"></div>
                <div id="div_retour_valide_patient" style="display: none;">
                    <div class="row" style="padding:10px;">
                        <div class="col-sm-12" align="center">
                            <div id="message_final"><h3 class="panel-title title1" style="font-size: xx-large;">{$smessagefinal}</h3></div>
                            <div id="message_retour_valide"></div>
                            <div class="row" style="padding:20px;">
                            </div>
                            <button id="retour_accueil_final" type="button" class="btn vd_btn btn_design" style="width:30%; height:100px;">
                                <h3 style=" line-height:80px;color:#fff !important;font-size: xx-large;"><span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span> Accueil </h3>
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="myModalNoInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                </button>
                <h4 class="modal-title" id="myModalLabelNoInfo">Désolé...</h4>
            </div>
            <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                <div class="panel-body" style="padding: 0px 0px 15px 0px;">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <h3 id="txtmyModalNoInfo">Aucune information trouvée!</h3>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <button id="boutonmyModalNoInfo" type="button" class="btn vd_btn vd_bg-blue vd_white"
                                        onclick="$('#myModalNoInfo').modal('hide');">Ok
                                </button>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>