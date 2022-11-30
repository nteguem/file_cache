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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <?php $select2 = filemtime(PATH_ASSETS . 'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js') ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.<?php $select2 ?>.js"></script>

    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="../css/bootstrap.min.{$CssBootstrap879}.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.{$CssFontAwesome518}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" href="../css/font-awesome-ie7.min.{$CssFontAwesomeIe7453}.css"><![endif]-->
    <link href="../css/font-entypo.{$CssFontEntypoCss308}.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.{$CssFontCss154}.css" rel="stylesheet" type="text/css">
    <link href="../css/datepicker.{$CssDatapicker385}.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.{$PluginsJqueryUi171}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.{$PluginsPrettyPhoto729}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.{$PluginsIsotope645}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.{$PluginsPno}.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.{$PluginsGoogleCode982}.css" rel="stylesheet" type="text/css">


    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$PluginsMcustomScrullbar170}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.{$PluginsTagsInput540}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.{$PluginBootstrap792}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.{$PluginDaterangeOicker067}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$PluginsBootsrap362}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.{$PluginsPluginsColor433}.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$PluginsTimePicker472}.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery-clockpicker.min.{$CssJqueryClockpicker510}.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="../css/theme.{$CssTheme026}.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="../css/ie.{$CssIe299}.css" rel="stylesheet"> <![endif]-->
    <link href="../css/chrome.{$CssChrome773}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.{$CssThemeResponsiveMin279}.css" rel="stylesheet" type="text/css">


    <!-- for specific page in style css -->
    <link href="../css/jquery-ui.structure.min.{$CssJqueryUiStructureMin792}.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery-ui.theme.min.{$CssJqueryUiTheme853}.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery-clockpicker.min.{$CssJqueryClockpicker844}.css" rel="stylesheet" type="text/css">
    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="../custom/custom.{$Custom856}.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php $jquery = filemtime(PATH_ASSETS . '../js/jquery.js') ?>
    <script type="text/javascript" src="../js/jquery.<?php echo $jquery ?>.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->
    <?php $bootstrap = filemtime(PATH_ASSETS . '../js/bootstrap.min.js') ?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrap ?>.js"></script>
    <?php $jqueryUi = filemtime(PATH_ASSETS . '../plugins/jquery-ui/jquery-ui.custom.min.js') ?>
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryUi ?>.js'></script>
    <?php $jqueryUiTouch = filemtime(PATH_ASSETS . '../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryUiTouch ?>.js"></script>

    <?php $caroufredsel = filemtime(PATH_ASSETS . '../js/caroufredsel.js') ?>
    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufredsel ?>.js"></script>
    <?php $plugin = filemtime(PATH_ASSETS . '../js/plugins.js') ?>
    <script type="text/javascript" src="../js/plugins.<?php echo $plugin ?>.js"></script>

    <?php $breakpoints = filemtime(PATH_ASSETS . '../plugins/breakpoints/breakpoints.js') ?>
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $breakpoints ?>.js"></script>
    <?php $dataTables = filemtime(PATH_ASSETS . '../plugins/dataTables/jquery.dataTables.min.js') ?>
    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $dataTables ?>.js"></script>
    <?php $prettyPhoto = filemtime(PATH_ASSETS . '../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script>

    <?php $mCustomScrollbar = filemtime(PATH_ASSETS . '../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbar ?>.js"></script>
    <?php $tagsInput = filemtime(PATH_ASSETS . '../plugins/tagsInput/jquery.tagsinput.min.js') ?>
    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInput ?>.js"></script>
    <?php $switch = filemtime(PATH_ASSETS . '../plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $switch ?>.js"></script>
    <?php $blockUI = filemtime(PATH_ASSETS . '../plugins/blockUI/jquery.blockUI.js') ?>
    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $blockUI ?>.js"></script>
    <?php $pnotify = filemtime(PATH_ASSETS . '../plugins/pnotify/js/jquery.pnotify.min.js') ?>
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotify ?>.js"></script>
    <?php $theme = filemtime(PATH_ASSETS . '../js/theme.js') ?>
    <script type="text/javascript" src="../js/theme.<?php echo $theme ?>.js"></script>
    <?php $custom = filemtime(PATH_ASSETS . '../custom/custom.js') ?>
    <script type="text/javascript" src="../custom/custom.js"></script>

    <!-- Specific Page Scripts Put Here -->
    <?php $timepicker = filemtime(PATH_ASSETS . '../plugins/bootstrap-timepicker/bootstrap-timepicker.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timepicker ?>.js'></script>
    <?php $wizard = filemtime(PATH_ASSETS . '../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js') ?>
    <script type="text/javascript" src='../plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizard ?>.js'></script>
    <?php $datepicker = filemtime(PATH_ASSETS . '../js/datepicker.js') ?>
    <script type="text/javascript" src="../js/datepicker.<?php echo $datepicker ?>.js"></script>
    <?php $datepickerFr = filemtime(PATH_ASSETS . '../js/datepicker-fr.js') ?>
    <script type="text/javascript" src="../js/datepicker-fr.<?php echo $datepickerFr ?>.js"></script>
    <?php $clockpicker = filemtime(PATH_ASSETS . '../js/jquery-clockpicker.min.js') ?>
    <script type="text/javascript" src="../js/jquery-clockpicker.min.<?php echo $clockpicker ?>.js"></script>

    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS . '../js/modernizr.js') ?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernizr ?>.js"></script>
    <?php $mobileDetect = filemtime(PATH_ASSETS . '../js/mobile-detect.min.js') ?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script>
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS . '../js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>
    <?php $maskedinput = filemtime(PATH_ASSETS . '../js/jquery.maskedinput.min.js') ?>
    <script type="text/javascript" src="../js/jquery.maskedinput.min.<?php echo $maskedinput ?>.js"></script>

    <?php $ckeditor = filemtime(PATH_ASSETS . '../plugins/ckeditor/ckeditor.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/ckeditor.<?php echo $ckeditor ?>.js'></script>
    <?php $jquery = filemtime(PATH_ASSETS . '../plugins/ckeditor/adapters/jquery.js') ?>
    <script type="text/javascript" src='../plugins/ckeditor/adapters/jquery.<?php echo $jquery ?>.js'></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../js/html5shiv.js"></script>
    <script type="text/javascript" src="../js/respond.min.js"></script>
    <![endif]-->

    {literal}

    <style type="text/css">
        @media (min-width: 768px) {
            .modal-dialog {
                width: 700px;
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

        .vd_radio.radio-success input[type=radio]:checked + label:before {
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
        $(document).ready(function () {

            $("#heuredebut").mask("99:99");
            $("#heurefin").mask("99:99");

            {/literal}
            {if $bActionmodif == false}
            {literal}
            var divsemaine = document.getElementById('divsemaine');

            $("#saction").on('change', function () {
                if ($("#saction").val() == 1 || $("#saction").val() == "") {
                    divsemaine.style.display = 'none';
                } else {
                    divsemaine.style.display = 'block';
                }
            });
            {/literal}
            {/if}
            {literal}

        });

        function confirmation_supp(stext) {
            if (confirm(stext)) {
                $('#supp_valide').val("1");
                $('#add-dispo-form').submit();
            } else {
                $('#supp_valide').val("0");
            }
        }

        var etatdiv = 0;

        function open_ladiv(etat) {

            if (etat == 0) {
                etat = 1;
                $("#myModal").hide();
                $("#myModalListe").removeClass("col-md-6");
            } else {
                etat = 0;
                $("#myModal").show();
                $("#myModalListe").addClass("col-md-6");
            }

            return etat;
        }

        function suppression_affichage_tranche(idheuredebut, idheurefin, iddiv, iddiv2) {

            document.getElementById(idheuredebut).value = '';
            document.getElementById(idheurefin).value = '';
            document.getElementById(iddiv).style.display = 'none';
            document.getElementById(iddiv2).style.display = 'none';
        }

        $("#btn_add2").click(function () {

            $("#btn_add2").attr("disabled", true);
            $("#btn_add2").html("<i class='fa fa-spinner fa-spin'></i> &nbsp;En cours de traitement...");


            $('#formEnregDispo').submit();
            return false;
        });

        $(function () {
            $("#idsalle").load('../ajax/lst_salle_attente.php?option=load&bplanning=2&type=attente&idlieu=' + $("#idlieu").val() + '&idsalle={/literal}{$idsalle}{literal}');

            $.ajax({
                url: '../ajax/lst_salle_attente.php',
                data: 'bplanning=2&type=consult&idlieu=' + $("#idlieu").val() + '&idsalle={/literal}{$idbox}{literal}',
                dataType: 'html',
                success: function (data) {
                    $('#idbox').html("<option value=''></option>" + data);
                }
            });

            $("#idlieu").change(function () {
                $("#idsalle").load('../ajax/lst_salle_attente.php?option=load&bplanning=2&type=attente&idlieu=' + $("#idlieu").val());
            });

            $("#idlieu").change(function () {
                $.ajax({
                    url: '../ajax/lst_salle_attente.php',
                    data: 'bplanning=2&type=consult&idlieu=' + $("#idlieu").val(),
                    dataType: 'html',
                    success: function (data) {
                        $('#idbox').html("<option value='' ></option>" + data);
                    }
                });

                $.ajax({
                    url: '../ajax/lst_service.php',
                    data: 'idlieu=' + $("#idlieu").val(),
                    dataType: 'html',
                    success: function (data) {
                        if (data != "") {
                            $('#divservice').css("display", "block");
                        } else {
                            $('#divservice').css("display", "none");
                        }
                        $('#idservice').html("<option value=''></option>" + data);
                    }
                });

                $.ajax({
                    url: '../ajax/liste_uniter_fonctionnelle_praticien.php',
                    data: {
                        'id_lieu': $(this).val(),
                        'id_praticien': $('#id_praticien').val(),
                    },
                    dataType: 'html',
                    success: function (data) {
                        $('#idservice').html("<option value=''></option>" + data);
                    },
                    error: function () {
                        $('#idservice').html("<option value=''></option>");
                    }
                });
            });
            if ($('#idservice').val() === "") {
                $("#idlieu").trigger('change');
            }
        });

    </script>
    {/literal}
    {if $bsucess}
    {literal}
        <script type="text/javascript">
            //parent.close_modal_principal('', '', '1');
            parent.refresh_calendar();
        </script>
    {/literal}
    {/if}

    {if $btn_supp=='supp'}
    {literal}
        <script type="text/javascript">
            parent.refresh_calendar();
            parent.close_modal_principal('', '', '1');
        </script>
    {/literal}
    {/if}

    {if $validation=='modif'}
    {literal}
        <script type="text/javascript">
            parent.refresh_calendar();
            {/literal}{if isset($bMessageErreurForm) and $bMessageErreurForm}{literal}
            {/literal}{else}{literal}
            parent.close_modal_principal('', '', '1');
            {/literal}{/if}{literal}
        </script>
    {/literal}
    {/if}

    {literal}
    <script>
        function getHistoMaquette() {

            $('#attente_histo_planning').show();
            $('#pas_histo_planning').hide();
            $('#histo_planning').hide();
            $('#boucle_histo_planning').html("");

            $.ajax({
                type: 'GET',
                url : '../ajax/log_maquette.php?idmaquette={/literal}{$idtranche}{literal}',
                data : 'objet=maquette&type=fonctionnel'+'&idmaquette={/literal}{$idtranche}{literal}'+'&serveur={/literal}{$sNomServeurDBB}{literal}',
                contentType :"application/json",
                dateType: 'json',

                success:function(json){
                    $('#boucle_histo_planning').html("");
                    $('#attente_histo_planning').hide();
                    if(json.result == 'ok'){
                        if(json.tabinfo.length == 0){
                            $('#pas_histo_planning').show();
                        }else{
                            $.each(json.tabinfo, function(index, value){
                                $('#histo_planning').show();
                                if(value.action != ""){

                                    var nomuseraction="";
                                    if (typeof value.nom_user !== 'undefined') {
                                        nomuseraction=value.nom_user;
                                    }

                                    if (typeof value.user_name !== 'undefined') {
                                        if(value.user_name !='')
                                            nomuseraction=value.user_name;
                                    }

                                    var boucle_histo_planning = ' <tr>' +
                                        '<td class="menu-action rounded-btn">' +
                                        '<td class="center"> '+ value.date + '</td>' +
                                        '<td class="center">' + nomuseraction + '</td>' +
                                        '<td class="center">' + value.commentaire  + '</td>';

                                    boucle_histo_planning += '</tr>';
                                    $('#boucle_histo_planning').append(boucle_histo_planning);
                                }
                            })
                        }
                    }
                }
            });
            return false;

        }


    </script>
    {/literal}

    {literal}
        <script type="text/javascript">
            $(document).ready(function () {
                $('.js-example-basic-multiple').select2();
            });
        </script>
    {/literal}


</head>

<body id="forms"
      class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix"
      data-active="forms " data-smooth-scrolling="1">
<input type="hidden" value="{$urlapilog}" name="urlapilog" id="urlapilog">

<h3 align="center">{$sTitreModal}</h3>

{if isset($bMessageErreurForm) and $bMessageErreurForm}
    <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i
                    class="fa fa-exclamation-circle vd_red"></i></span>{if isset($sMessageErreurForm)}{$sMessageErreurForm}{/if}
    </div>
{/if}

{if isset($bMessageSuccesForm) and $bMessageSuccesForm}
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i
                    class="fa fa-check-circle vd_green"></i></span>{if isset($sMessageSuccesForm)}{$sMessageSuccesForm}{/if}
    </div>
{/if}

<div class="row" style="margin-right: 18px; margin-left: 18px;">
    <div class="tabs">
        {if $niveau eq Y}  {/if}
        <ul class="nav nav-tabs widget vd_bg-color">
            <li class="{$activeinfo}"><a href="#info-tab" data-toggle="tab"> <span class="menu-icon"><i
                                class="fa fa-user"></i></span>Informations<span class="menu-active"><i
                                class="fa fa-caret-up"></i></span> </a></li>

            {if $bactivedeclechement and $idunique!=""}
                <li class="{$activedeclenche}"><a href="#declenchement-tab" data-toggle="tab"> <span
                                class="menu-icon"><i class="fa fa-history"></i></span>Temps de déclenchement<span
                                class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
            {/if}
            {if $bvuhistoplanning}
                <li class=" " >
                    <a href="#histo-tab" data-toggle="tab" onclick="getHistoMaquette();">
                            <span class="menu-icon">
                                <i class="fa fa-history"></i>
                            </span>
                        Historique
                        <span class="menu-active">
                                <i class="fa fa-caret-up"></i>
                            </span>
                    </a>
                </li>
            {/if}
        </ul>


        <div class="tab-content mgbt-xs-20">
            <div class="tab-pane {$activeinfo} col-sm-12" id="info-tab">
                <div id="myModal" style='display:block;' class="col-md-12">
                    <div class="col-md-12" style="margin-top:0px;margin-bottom:0px;">
                        <div>
                            <div class="modal-body" style="margin-top:0px;padding-top:0px; padding-bottom:0px;">
                                <form id="formEnregDispo" name="formEnregDispo" class="form-horizontal" method="POST" action="" id="formaction">
                                    <div class="vd_content-section clearfix" style="padding:0px;">
                                        <div class="row" style="margin-bottom:0px;">
                                            <div class="col-md-full">
                                                <div class="panel widget">
                                                    <div class="panel-body">

                                                        <input type="hidden" name="dir" id="dir" value="{$dir}"/>
                                                        <input type="hidden" name="id_praticien" id="id_praticien" value="{$idPraticien}"/>
                                                        <input type="hidden" name="idunique" id="idunique"
                                                               value="{$idunique}"/>
                                                        <input type="hidden" name="identifiant_user"
                                                               value="{$identifiant_user}"/>
                                                        <input type="hidden" name="idtranche" id="idtranche"
                                                               value="{$idtranche}"/>
                                                        <input type="hidden" name="validation" id="validation"
                                                               value="{$typeaction}"/>
                                                        <input type="hidden" name="guid" id="guid" value="{$guid}"/>
                                                        <input type="hidden" name="id_user" id="id_user"
                                                               value="{$id_user}"/>
                                                        <input type="hidden" name="idc" id='idc' value=""/>
                                                        {if $bActionmodif == false}
                                                        {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    if ($("#idtranche").val() != "") {
                                                                        divsemaine.style.display = 'none';
                                                                    }
                                                                });
                                                            </script>
                                                        {/literal}
                                                        {/if}

                                                        {if $berror}
                                                            <div class="alert alert-danger">
                                                                <button type="button" class="close" data-dismiss="alert"
                                                                        aria-hidden="true"><i class="icon-cross"></i>
                                                                </button>
                                                                <span class="vd_alert-icon"><i
                                                                            class="fa fa-exclamation-circle vd_red"></i></span>
                                                                {$sMessageError}
                                                            </div>
                                                        {/if}

                                                        {if $bwarning}
                                                            <div class="alert alert-warning">
                                                                <button type="button" class="close" data-dismiss="alert"
                                                                        aria-hidden="true"><i class="icon-cross"></i>
                                                                </button>
                                                                <span class="vd_alert-icon"><i
                                                                            class="fa fa-exclamation-circle vd_red"></i></span>
                                                                {$sMessageWarning}
                                                            </div>
                                                        {/if}

                                                        <div class="row">
                                                            <div class="form-group col-sm-4" id="divlieux">
                                                                <div class="col-sm-12 controls">
                                                                    <div class="label-wrapper-modal">
                                                                        <label class="control-label">Lieu</label>
                                                                    </div>
                                                                    <div class="">
                                                                        <select name="idlieu" id="idlieu" tabindex="1"
                                                                                class="js-example-basic-multiple"
                                                                                required class="required">
                                                                            <option value=""></option>
                                                                            {assign var='aTableauLieuCount' value=count($aTableauLieu)}
                                                                            {if $aTableauLieuCount == 1}
                                                                                <option value="{$aTableauLieu[0]['id_lieux']}" selected>{$aTableauLieu[0]['nom_lieux']}</option>
                                                                            {elseif $aTableauLieuCount > 1}
                                                                                {section name=sec1 loop=$aTableauLieu}
                                                                                    <option value="{$aTableauLieu[sec1]['id_lieux']}"
                                                                                            {if $idlieu eq $aTableauLieu[sec1]['id_lieux']}selected="selected"{/if}>{$aTableauLieu[sec1]['nom_lieux']}</option>
                                                                                {/section}
                                                                            {/if}
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            {if $bactivservice}
                                                                <div class="form-group  col-sm-5" id="divservicenop">
                                                                    <div class="col-sm-12 controls">
                                                                        <div class="label-wrapper-modal">
                                                                            <label class="control-label">Service</label>
                                                                        </div>
                                                                        <div class="">
                                                                            <select name="idservice" tabindex="2"
                                                                                    id="idservice"
                                                                                    class="js-example-basic-multiple">
                                                                                <option value=""></option>
                                                                                {if !empty($aTableauUniteFonctionnelle)}
                                                                                    {section name=sec1 loop=$aTableauUniteFonctionnelle}
                                                                                        <option value="{$aTableauUniteFonctionnelle[sec1]['id_lieux']}"
                                                                                                {if $idservice eq $aTableauUniteFonctionnelle[sec1]['id_lieux']}selected="selected"{/if}>{$aTableauUniteFonctionnelle[sec1]['nom_lieux']}</option>
                                                                                    {/section}
                                                                                {/if}
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            {else}
                                                                <input type="hidden" name="idservice" id="idservice"
                                                                       value="0">
                                                            {/if}


                                                            <div class="form-group col-sm-4" id="divsalleconsult">
                                                                <div class="col-sm-12 controls">
                                                                    <div class="label-wrapper-modal">
                                                                        <label class="control-label">Tranche
                                                                            forcée</label>
                                                                    </div>
                                                                    <div class="vd_radio radio-success" tabindex="3">
                                                                        <input type="radio" name="trancheforce"
                                                                               {if $trancheforce eq '1'}checked="checked"{/if}
                                                                               value="1"
                                                                               id="id_trancheforce_oui">
                                                                        <label for="id_trancheforce_oui">Oui</label>
                                                                        <input type="radio" name="trancheforce"
                                                                               {if $trancheforce eq '0' || $trancheforce eq ''}checked="checked"{/if}
                                                                               value="0"
                                                                               id="id_trancheforce_non">
                                                                        <label for="id_trancheforce_non">Non</label>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            {if $bactifoptiondocto}
                                                                <div class="col-sm-3 controls">
                                                                    <div class="label-wrapper-modal">
                                                                        <label class="control-label">Vacation anonyme</label>
                                                                    </div>
                                                                    <div class="vd_radio radio-success" tabindex="11" >
                                                                        <input type="radio" name="vacationanonyme"
                                                                               {if $vacationanonyme eq 'Y' }checked="checked"
                                                                               {/if}value="Y"
                                                                               id="id_vacationanonyme_oui">
                                                                        <label for="id_vacationanonyme_oui">Oui</label>
                                                                        <input type="radio" name="vacationanonyme"
                                                                               {if $vacationanonyme eq 'N'  || $vacationanonyme eq ''}checked="checked"
                                                                               {/if}value="N"
                                                                               id="id_vacationanonyme_non">
                                                                        <label for="id_vacationanonyme_non">Non</label>

                                                                    </div>
                                                                </div>
                                                            {/if}



                                                        </div>

                                                        <div class="form-group col-sm-4" id="divsalleattente">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Salle d'attente</label>
                                                                </div>
                                                                <div>
                                                                    <select name="idsalle"
                                                                            class="js-example-basic-multiple"
                                                                            id="idsalle" tabindex="4"
                                                                            class="required"></select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group col-sm-4" id="divactivite">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Activité</label>
                                                                </div>
                                                                <div class="">
                                                                    <select name="idactivite" tabindex="5"
                                                                            id="idactivite" required
                                                                            class="js-example-basic-multiple"
                                                                            class="required">
                                                                        <option value=""></option>
                                                                        {foreach from=$aTableauActivite item=objActivite}
                                                                            <option value="{$objActivite.identifiant_activite}"
                                                                                    {if $idactivite eq $objActivite.identifiant_activite}selected="selected"{/if}>{if $objActivite.abreviation_type_activite!=""}({$objActivite.abreviation_type_activite}) -{/if} {$objActivite.libelle_type_activite}</option>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="form-group col-sm-4" id="divactivite">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Délai Déclenchement
                                                                        Planning</label>
                                                                </div>
                                                                <div class="">
                                                                    <select name="nombreactive" id="idnombreactive"
                                                                            class="js-example-basic-multiple"
                                                                            tabindex="6">
                                                                        {foreach from=$aTmpListdecalagejour item=objjour}
                                                                            <option value="{$objjour.id}"
                                                                                    {if $nombreactive eq $objjour.id}selected="selected"{/if}>{$objjour.label}</option>
                                                                        {/foreach}
                                                                    </select>

                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divopenttel">
                                                            <div class="col-sm-3 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour
                                                                        internet</label>
                                                                </div>
                                                                <div class="vd_radio radio-success" tabindex="7">
                                                                    <input type="radio" name="opentwidget"
                                                                           {if $opentwidget eq 'Y'}checked="checked"{/if}
                                                                           value="Y"
                                                                           id="id_openttel_oui">
                                                                    <label for="id_openttel_oui">OUI</label>
                                                                    <input type="radio" name="opentwidget"
                                                                           {if $opentwidget eq 'N'}checked="checked"{/if}
                                                                           value="N"
                                                                           id="id_openttel_non">
                                                                    <label for="id_openttel_non">Non</label>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-3 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour le
                                                                        telephone</label>
                                                                </div>
                                                                <div class="vd_radio radio-success" tabindex="8">
                                                                    <input type="radio" name="opentel"
                                                                           {if $opentel eq 'Y'}checked="checked"{/if}
                                                                           value="Y"
                                                                           id="id_opentel_oui">
                                                                    <label for="id_opentel_oui">OUI</label>
                                                                    <input type="radio" name="opentel"
                                                                           {if $opentel eq 'N'}checked="checked"{/if}
                                                                           value="N"
                                                                           id="id_opentel_non">
                                                                    <label for="id_opentel_non">Non</label>

                                                                </div>
                                                            </div>

                                                            <div class="col-sm-3 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour
                                                                        interpro</label>
                                                                </div>
                                                                <div class="vd_radio radio-success" tabindex="9">
                                                                    <input type="radio" name="opentinterpro"
                                                                           {if $opentinterpro eq 'Y'}checked="checked"
                                                                           {/if}value="Y"
                                                                           id="id_opentinterpro_oui">
                                                                    <label for="id_opentinterpro_oui">OUI</label>
                                                                    <input type="radio" name="opentinterpro"
                                                                           {if $opentinterpro eq 'N'}checked="checked"
                                                                           {/if}value="N"
                                                                           id="id_opentinterpro_non">
                                                                    <label for="id_opentinterpro_non">Non</label>
                                                                </div>
                                                            </div>


                                                            <div class="col-sm-3 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Ouvert pour
                                                                        backoffice</label>
                                                                </div>
                                                                <div class="vd_radio radio-success" tabindex="10">
                                                                    <input type="radio" name="opentbackoffice"
                                                                           {if $opentbackoffice eq 'Y' || $opentbackoffice eq ''}checked="checked"
                                                                           {/if}value="Y"
                                                                           id="id_opentbackoffice_oui">
                                                                    <label for="id_opentbackoffice_oui">Oui</label>
                                                                    <input type="radio" name="opentbackoffice"
                                                                           {if $opentbackoffice eq 'N' }checked="checked"
                                                                           {/if}value="N"
                                                                           id="id_opentbackoffice_non">
                                                                    <label for="id_opentbackoffice_non">Non</label>
                                                                </div>
                                                            </div>


                                                            {if $bteleconsul}
                                                                <div class="col-sm-3 controls">
                                                                    <div class="label-wrapper-modal">
                                                                        <label class="control-label">Ouvert pour
                                                                            téléconsultation</label>
                                                                    </div>
                                                                    <div class="vd_radio radio-success" tabindex="11">
                                                                        <input type="radio" name="opentteleconsultation"
                                                                               {if $opentteleconsultation eq 'Y' || $opentteleconsultation eq ''}checked="checked"
                                                                               {/if}value="Y"
                                                                               id="id_opentteleconsultation_oui">
                                                                        <label for="id_opentteleconsultation_oui">Oui</label>
                                                                        <input type="radio" name="opentteleconsultation"
                                                                               {if $opentteleconsultation eq 'N' }checked="checked"
                                                                               {/if}value="N"
                                                                               id="id_opentteleconsultation_non">
                                                                        <label for="id_opentteleconsultation_non">Non</label>

                                                                    </div>
                                                                </div>
                                                            {/if}
                                                        </div>
                                                        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
                                                              rel="stylesheet"/>
                                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

                                                        <div class="form-group" id="divtyperdv">
                                                            <div class="col-sm-12 controls">
                                                                <div class="">
                                                                    <label>Motif de rendez vous</label>
                                                                    <div>
                                                                        <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                            <input
                                                                                    type="checkbox"
                                                                                    class=""
                                                                                    name="id_checkAll_dispo"
                                                                                    value=""
                                                                                    id="id_checkAll_dispo"
                                                                            >
                                                                            <label for="id_checkAll_dispo">
                                                                                Tous </label>
                                                                        </div>
                                                                        <div class="vd_checkbox checkbox-success">
                                                                            <div class="col-sm-12 input-group">
                                                                                <select tabindex="12" name="typerdv[]"
                                                                                        class="js-example-basic-multiple"
                                                                                        multiple="multiple"
                                                                                        style="width: 100%;">
                                                                                    {foreach from=$aTableauTyperdv item=objTyperdv}
                                                                                        <option type="checkbox"
                                                                                                class="class_checkAll_dispo"
                                                                                                id="checkbox-{$objTyperdv.id}"
                                                                                                value="{$objTyperdv.id}"
                                                                                                {if in_array($objTyperdv.id, $typerdv)} selected="selected"{/if}>
                                                                                            {$objTyperdv.abreviation}
                                                                                            - {$objTyperdv.libelle}
                                                                                        </option>
                                                                                    {/foreach}
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        {literal}
                                                                            <script type="text/javascript">
                                                                                $(function () {
                                                                                    $("#id_checkAll_dispo").click(function () {
                                                                                        var selectValues = [];
                                                                                        if ($("#id_checkAll_dispo").is(':checked')) {
                                                                                            $('select[name="typerdv[]"] option').each(function () {
                                                                                                selectValues.push($(this).val());
                                                                                            });

                                                                                        }
                                                                                        $('select[name="typerdv[]"]').val(selectValues).trigger('change');
                                                                                    });
                                                                                });
                                                                            </script>
                                                                        {/literal}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        {if $bActifchirugiens}
                                                        <div class="form-group" id="divactivite">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal">
                                                                    <label class="control-label">Filtrer les chirurgiens
                                                                        sur la profession</label>
                                                                </div>
                                                                <div class="vd_input-wrapper-modal">
                                                                    <select tabindex="13" name="filtrechirurgiens"
                                                                            id="idfiltrechirurgiens" required
                                                                            class="required"
                                                                            onchange="cache_div_chirurgien(this.value)">
                                                                        <option value="tous">Tous</option>
                                                                        {foreach from=$aTableauproffesion item=obproffession}
                                                                            <option value="{$obproffession.id}"
                                                                            >{$obproffession.libelle}</option>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group" id="divchirugien">
                                                            <div class="col-sm-12 controls">
                                                                <div>
                                                                    <label>Chirurgiens</label>
                                                                    <div>
                                                                        <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                            <input
                                                                                    type="checkbox"
                                                                                    class=""
                                                                                    name="id_checkAll_chirugien"
                                                                                    value=""
                                                                                    id="id_checkAll_chirugien"
                                                                            >
                                                                            <label for="id_checkAll_chirugien">Tous </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-12 input-group">
                                                                        <select tabindex="14" name="tabchirugien[]"
                                                                                class="js-example-basic-multiple"
                                                                                multiple="multiple"
                                                                                style="width: 100%;">
                                                                            {foreach from=$aTableauListeChirurgien item=objChirurgien}
                                                                                <div class="col-sm-4 vd_checkbox checkbox-success classfiltre_{$objChirurgien.id_profession}">
                                                                                    <option class="class_checkAll_chirugien   checkinput_{$objChirurgien.id_profession}"
                                                                                            id="checkbox-{$objChirurgien.id_chirurgien}"
                                                                                            type="checkbox"
                                                                                            value="{$objChirurgien.id_chirurgien}"
                                                                                            {if in_array($objChirurgien.id_chirurgien, $tabchirugien)}selected="selected"{/if}>
                                                                                        <label for="checkbox-{$objChirurgien.id_chirurgien}"> {$objChirurgien.civilite} {$objChirurgien.nom}
                                                                                            ({$objChirurgien.profession}
                                                                                            )</label>
                                                                                    </option>
                                                                                </div>
                                                                            {/foreach}
                                                                        </select>
                                                                    </div>
                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(function () {
                                                                                $("#id_checkAll_chirugien").click(function () {
                                                                                    var selectValues = [];
                                                                                    if ($("#id_checkAll_chirugien").is(':checked')) {
                                                                                        $('select[name="tabchirugien[]"] option').each(function () {
                                                                                            selectValues.push($(this).val());
                                                                                        });

                                                                                    }
                                                                                    $('select[name="tabchirugien[]"]').val(selectValues).trigger('change');
                                                                                });
                                                                            });

                                                                            // In your Javascript (external .js resource or <script> tag)
                                                                            $(document).ready(function () {
                                                                                $('.js-example-basic-multiple').select2();
                                                                            });

                                                                        </script>
                                                                    {/literal}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    {/if}


                                                    {if $brdvaide}{/if}
                                                    <div class="form-group" id="divrdvaide">
                                                        <div class="col-sm-12 controls">
                                                            <div>
                                                                <label>Agenda aidé</label>
                                                                <div>
                                                                    <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                        <input
                                                                                type="checkbox"
                                                                                class=""
                                                                                name="id_checkAll_rdvaide"
                                                                                value=""
                                                                                id="id_checkAll_rdvaide"
                                                                        >
                                                                        <label for="id_checkAll_rdvaide">Tous </label>
                                                                    </div>
                                                                    <div class="col-sm-12 input-group">
                                                                        <select tabindex="15" name="tabchrdvaide[]"
                                                                                class="js-example-basic-multiple"
                                                                                multiple="multiple"
                                                                                style="width: 100%;">
                                                                            {foreach from=$aTableauRdvAide item=objRdvaide}
                                                                                <div class="col-sm-4 vd_checkbox checkbox-success classfiltre_all">
                                                                                    <option class="class_checkAll_rdvaide   checkinput_all"
                                                                                            id="checkbox-{$objRdvaide.identifiant_user}"
                                                                                            type="checkbox"
                                                                                            value="{$objRdvaide.identifiant_user}"
                                                                                            {if in_array($objRdvaide.identifiant_user, $tabchrdvaide)}selected="selected"{/if}>
                                                                                        <label for="checkbox-{$objRdvaide.identifiant_user}"> {$objRdvaide.nom_user}
                                                                                            ({$objRdvaide.nom_profession}
                                                                                            )
                                                                                        </label>
                                                                                    </option>
                                                                                </div>
                                                                            {/foreach}
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        $(function () {
                                                                            $("#id_checkAll_rdvaide").click(function () {
                                                                                var selectValues = [];
                                                                                if ($("#id_checkAll_rdvaide").is(':checked')) {
                                                                                    $('select[name="tabchrdvaide[]"] option').each(function () {
                                                                                        selectValues.push($(this).val());
                                                                                    });
                                                                                }
                                                                                $('select[name="tabchrdvaide[]"]').val(selectValues).trigger('change');
                                                                            });
                                                                        });

                                                                        // In your Javascript (external .js resource or <script> tag)
                                                                        $(document).ready(function () {
                                                                            $('.js-example-basic-multiple').select2();
                                                                        });

                                                                    </script>
                                                                {/literal}
                                                            </div>
                                                        </div>
                                                    </div>


                                                    {if $bbox}{/if}
                                                    <div class="form-group" id="divbox">
                                                        <div class="col-sm-12 controls">
                                                            <div>
                                                                <label>Salle </label>
                                                                <div>
                                                                    <div class="col-sm-4 vd_checkbox checkbox-success">
                                                                        <input
                                                                                type="checkbox"
                                                                                class=""
                                                                                name="id_checkAll_box"
                                                                                value=""
                                                                                id="id_checkAll_box"
                                                                        >
                                                                        <label for="id_checkAll_box">Tous </label>
                                                                    </div>
                                                                    <div class="col-sm-12 input-group">
                                                                        <select tabindex="16" name="tabchbox[]"
                                                                                class="js-example-basic-multiple"
                                                                                multiple="multiple"
                                                                                style="width: 100%;">
                                                                            {foreach from=$aTableauResourceMateriel item=objMateriel}
                                                                                <div class="col-sm-4 vd_checkbox checkbox-success classfiltre_all">
                                                                                    <option class="class_checkAll_box   checkinput_all"
                                                                                            id="checkbox-{$objMateriel.identifiant_user}"
                                                                                            type="checkbox"
                                                                                            value="{$objMateriel.identifiant_user}"
                                                                                            {if in_array($objMateriel.identifiant_user, $tabchbox)}selected="selected"{/if}>
                                                                                        <label for="checkbox-{$objMateriel.identifiant_user}"> {$objMateriel.nom_user}
                                                                                        </label>
                                                                                    </option>
                                                                                </div>
                                                                            {/foreach}
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        $(function () {
                                                                            $("#id_checkAll_box").click(function () {
                                                                                var selectValues = [];
                                                                                if ($("#id_checkAll_box").is(':checked')) {
                                                                                    $('select[name="tabchbox[]"] option').each(function () {
                                                                                        selectValues.push($(this).val());
                                                                                    });

                                                                                }
                                                                                $('select[name="tabchbox[]"]').val(selectValues).trigger('change');
                                                                            });
                                                                        });

                                                                        // In your Javascript (external .js resource or <script> tag)
                                                                        $(document).ready(function () {
                                                                            $('.js-example-basic-multiple').select2();
                                                                        });

                                                                    </script>
                                                                {/literal}
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group" id="divbox">
                                                        <div class="col-sm-12 controls">
                                                            <div>
                                                                <label>Filtre groupe </label>
                                                                <div class="col-sm-12 input-group">
                                                                    <select tabindex="17" name="tabgroupe[]"
                                                                            class="js-example-basic-multiple"
                                                                            multiple="multiple" style="width: 100%;">
                                                                        {foreach from=$aTableauGroupe item=objgroupe}
                                                                            <div class="col-sm-4 vd_checkbox checkbox-success classfiltre_all">
                                                                                <option class="class_checkAll_groupe   checkinput_all"
                                                                                        id="checkbox-{$objgroupe.id_groupe}"
                                                                                        type="checkbox"
                                                                                        value="{$objgroupe.id_groupe}"
                                                                                        {if in_array($objgroupe.id_groupe, $tabgroupe)}selected=selected{/if}>
                                                                                    <label for="checkbox-{$objgroupe.id_groupe}"> {$objgroupe.nom_groupe}
                                                                                    </label>
                                                                                </option>
                                                                            </div>
                                                                        {/foreach}
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $(function () {
                                                                        $("#class_checkAll_groupe").click(function () {
                                                                            var selectValues = [];
                                                                            if ($("#class_checkAll_groupe").is(':checked')) {
                                                                                $('select[name="tabgroupe[]"] option').each(function () {
                                                                                    selectValues.push($(this).val());
                                                                                });

                                                                            }
                                                                            $('select[name="tabgroupe[]"]').val(selectValues).trigger('change');
                                                                        });
                                                                    });

                                                                    // In your Javascript (external .js resource or <script> tag)
                                                                    $(document).ready(function () {
                                                                        $('.js-example-basic-multiple').select2();
                                                                    });

                                                                </script>
                                                            {/literal}
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="divheurejour">
                                                        <div class="col-sm-6">
                                                            <div class="col-sm-6 controls">
                                                                <div class="input-group" id="divheuredebut0">
                                                                    <label>Heure de début </label>
                                                                    <div class="input-group bootstrap-timepicker" id="groupe_heuredebut0">
                                                                        <input type="text" id="heuredebut_0" tabindex="23"
                                                                            name="heuredebut0"
                                                                            value="{$aTableautrancheHeure[0].heuredebut}"
                                                                            class="input-modal-date-left" {$aTableautrancheHeure[0].style}>
                                                                        <span class="input-group-addon input-modal-date-right"
                                                                            id="timepicker-default-span"><i
                                                                                    class="fa fa-clock-o"></i></span>
                                                                    </div>
                                                                </div>

                                                                {for $foo=1 to 15}
                                                                    <div class="input-group"
                                                                        style="display:{$aTableautrancheHeure[$foo].open}"
                                                                        id="divheuredebut{$foo}">
                                                                        <label>Heure de début</label>
                                                                        <div class="input-group bootstrap-timepicker heuredebut0">
                                                                            <input type="text" id="heuredebut_{$foo}"
                                                                                name="heuredebut{$foo}"
                                                                                value="{$aTableautrancheHeure[$foo].heuredebut}"
                                                                                class="input-modal-date-left" {$aTableautrancheHeure[$foo].style}>
                                                                            <span class="input-group-addon input-modal-date-right"
                                                                                id="timepicker-default-span"><i
                                                                                        class="fa fa-clock-o"></i></span>
                                                                        </div>
                                                                    </div>
                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $("#heuredebut{/literal}_{$foo}{literal}").clockpicker({
                                                                                    placement: 'top',
                                                                                    autoclose: true
                                                                                });
                                                                                $("#heuredebut{/literal}_{$foo}{literal}").mask("99:99");
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

                                                                {/for}

                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        $(document).ready(function () {
                                                                            $("#heuredebut_0").clockpicker({
                                                                                placement: 'top',
                                                                                autoclose: true
                                                                            });
                                                                            $("#heuredebut_0").mask("99:99");
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

                                                            </div>

                                                            <div class="col-sm-6 controls">
                                                                <div class="input-group" id="divheurefin0">
                                                                    <label>Heure de fin

                                                                    </label>
                                                                    <div class="input-group bootstrap-timepicker" id="groupe_heurefin0">
                                                                        <input type="text" id="heurefin_0" tabindex="24"
                                                                            name="heurefin0"
                                                                            value="{$aTableautrancheHeure[0].heurefin}"
                                                                            class="required input-modal-date-left" {$aTableautrancheHeure[0].style}>
                                                                        <span class="input-group-addon input-modal-date-right"
                                                                            id="timepicker-default-span"><i
                                                                                    class="fa fa-clock-o"></i></span>

                                                                    </div>
                                                                </div>

                                                                {for $foo=1 to 15}
                                                                    <div class="input-group"
                                                                        style="display:{$aTableautrancheHeure[$foo].open}"
                                                                        id="divheurefin{$foo}">
                                                                        <label>Heure de fin </label>
                                                                        <div class="input-group bootstrap-timepicker">
                                                                            <input type="text" id="heurefin_{$foo}"
                                                                                name="heurefin{$foo}"
                                                                                value="{$aTableautrancheHeure[$foo].heurefin}"
                                                                                class=" input-modal-date-left" {$aTableautrancheHeure[$foo].style}>
                                                                            <span class="input-group-addon input-modal-date-right"
                                                                                id="timepicker-default-span"><i
                                                                                        class="fa fa-clock-o"></i></span><img
                                                                                    src="../css/delete_icon.gif"
                                                                                    onclick="suppression_affichage_tranche('heuredebut_{$foo}','heurefin_{$foo}','divheurefin{$foo}','divheuredebut{$foo}')"
                                                                                    style="margin-left:5px;cursor:pointer;">
                                                                        </div>

                                                                    </div>
                                                                    {literal}
                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $("#heurefin{/literal}_{$foo}{literal}").clockpicker({
                                                                                    placement: 'top',
                                                                                    autoclose: true
                                                                                });
                                                                                $("#heurefin{/literal}_{$foo}{literal}").mask("99:99");
                                                                            });
                                                                            var posdisplayheuredebut = 1;
                                                                            var posdisplayheurefin = 1;

                                                                            function open_tranche(compte) {


                                                                                sdivfin = "divheurefin" + compte;
                                                                                sdivdebut = "divheuredebut" + compte;
                                                                                document.getElementById(sdivfin).style.display = "";
                                                                                document.getElementById(sdivdebut).style.display = "";

                                                                                compte = compte + 1;

                                                                                return compte;

                                                                            }
                                                                        </script>
                                                                    {/literal}
                                                                {/for}

                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        $(document).ready(function () {
                                                                            $("#heurefin_0").clockpicker({
                                                                                placement: 'top',
                                                                                autoclose: true
                                                                            });
                                                                            $("#heurefin_0").mask("99:99");
                                                                        });
                                                                    </script>
                                                                {/literal}

                                                            </div>

                                                            <div class="col-sm-6 controls" style="margin-top: 10px">
                                                                <button id="btn_add_tranche" name="btn_add_tranche"
                                                                        type="button" class="btn vd_btn vd_bg-green"
                                                                        style="color:#FFFFFF !important; background-color: #2dab28 !important;" tabindex="29"
                                                                        onclick="posdisplayheuredebut=open_tranche(posdisplayheuredebut);">
                                                                    Ajouter une tranche
                                                                </button>
                                                            </div>

                                                            {if $idunique=="" && $bActionmodif == false}
                                                                <div id="divsemaine" class="col-sm-6 controls">
                                                                    <div class="input-group">
                                                                        <label>Jour de la semaine</label>
                                                                        <div>

                                                                            <div class="vd_checkbox checkbox-success"
                                                                                tabindex="22">
                                                                                <input id="checkbox-Lundi" type="checkbox"
                                                                                    name="day[]"
                                                                                    value="1"
                                                                                    {if in_array('1', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Lundi"> Lundi </label>

                                                                                <input id="checkbox-Mardi" type="checkbox"
                                                                                    name="day[]"
                                                                                    value="2"
                                                                                    {if in_array('2', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Mardi"> Mardi </label>

                                                                                <input id="checkbox-Mercredi" type="checkbox"
                                                                                    name="day[]" value="3"
                                                                                    {if in_array('3', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Mercredi">
                                                                                    Mercredi </label>

                                                                                <input id="checkbox-Jeudi" type="checkbox"
                                                                                    name="day[]"
                                                                                    value="4"
                                                                                    {if in_array('4', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Jeudi"> Jeudi </label>

                                                                                <input id="checkbox-Vendredi" type="checkbox"
                                                                                    name="day[]" value="5"
                                                                                    {if in_array('5', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Vendredi">
                                                                                    Vendredi </label>

                                                                                <input id="checkbox-Samedi" type="checkbox"
                                                                                    name="day[]"
                                                                                    value="6"
                                                                                    {if in_array('6', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Samedi"> Samedi </label>

                                                                                <input id="checkbox-Dimanche" type="checkbox"
                                                                                    name="day[]" value="0"
                                                                                    {if in_array('0', $day)}checked=checked{/if}>
                                                                                <label for="checkbox-Dimanche">
                                                                                    Dimanche </label>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            {/if}
                                                        </div>
                                                    </div>


                                                    <div class="form-group" id="divconsigne">
                                                        <div class="col-sm-12 controls">
                                                            <div class="input-group label-wrapper-modal">
                                                                <label class="control-label">Consigne</label>
                                                            </div>
                                                            <div>
                                                                <textarea tabindex="23" id="consigne"
                                                                            name="consigne" rows="2"
                                                                            data-rel="ckeditor"
                                                                            class="ckeditor">
                                                                    {$consigne}
                                                                </textarea>
                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        CKEDITOR.replace(
                                                                            consigne,
                                                                            {
                                                                                toolbar: [
                                                                                    {
                                                                                        name: 'clipboard',
                                                                                        items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Cut', 'Copy', 'PasteText', '-', 'Undo', 'Redo', '-', 'NumberedList', 'BulletedList']
                                                                                    },
                                                                                    {
                                                                                        name: 'styles',
                                                                                        items: ['FontSize']
                                                                                    },
                                                                                    {
                                                                                        name: 'colors',
                                                                                        items: ['TextColor', 'BGColor']
                                                                                    },
                                                                                    {
                                                                                        name: 'align',
                                                                                        items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
                                                                                    }

                                                                                ]
                                                                            });
                                                                    </script>
                                                                {/literal}
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group" id="divconsigne">
                                                        <div class="col-sm-12 controls">
                                                            <br>
                                                            <input type="hidden" value="" name="btn_supp" id="id_supp_btn">

                                                            <button id="btn_add2" value="modif" name="btn_add" type="submit"
                                                                    class="btn vd_btn vd_bg-green">Valider
                                                            </button>

                                                            <button type="button"
                                                                    onclick="bconf=confirm('Voulez vous vraiment supprimer cette maquette');{literal}if(bconf){$('#id_supp_btn').val('supp');$('#formaction').submit()}{/literal}"
                                                                    class="btn vd_btn vd_bg-green"
                                                                    style="color:#FFFFFF !important; background-color: red !important;"
                                                                    onclick="">Supprimer
                                                            </button>
                                                            <button type="button" class="btn vd_btn vd_bg-grey"
                                                                    onclick="parent.close_modal_principal();">Fermer
                                                            </button>
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
        </div>
    </div>

    {if $bActionmodif}
        <div class="tab-pane col-sm-12 {$activedeclenche}" id="declenchement-tab">
            <div id="myModaldeclenche" style='display:block;padding-top: 32px;' class="col-md-12">
                {if $messagesuppdeclenchement!=''}
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i
                                    class="icon-cross"></i></button>
                        <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>{$messagesuppdeclenchement}
                    </div>
                {/if}

                <div class="col-sm-12 panel-body" style="text-align: center;">
                    <form class="form-horizontal" method="POST" action="">
                        <input type="hidden" name="idtranche" value="{$idtranche}"/>
                        <input type="hidden" name="validation" value="ajoutdeclencheur"/>
                        <input type="hidden" name="actiontranche" value=""/>
                        <div class="col-sm-4 controls">
                            <div>
                                <div class="input-group">
                                    <label>Choix partenaire</label>
                                    <select name="idpartenaire">
                                        <option value=""></option>
                                        {foreach from=$aTableauPartenaire item=objpart}
                                            <option value="{$objpart.id_partenaire }"
                                            >{$objpart.nom_partenaire}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 controls">
                            <div>

                                <div class="input-group">
                                    <label>Temps declenchement en jour</label>
                                    <div class="">
                                        <select name="tpsdeclenchement" class="js-example-basic-multiple">

                                            {foreach from=$aTmpListdecalagejour item=objjour}
                                                <option value="{$objjour.id}"
                                                        {if $nombreactive eq $objjour.id}selected="selected"{/if}>{$objjour.label}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-4 controls">
                            <div>
                                <div class="input-group">
                                    <label>Pourcentage déclenchement</label>
                                    <div class="">
                                        <select name="pourcentage" class="js-example-basic-multiple">
                                            {foreach from=$aTableauPourcentage item=objjour}
                                                <option value="{$objjour.id}"
                                                        {if $nombreactive eq $objjour.id}selected="selected"{/if}>{$objjour.nom}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <button class="btn vd_btn vd_bg-green" type="submit" style="margin-top:15px;">
                                Ajouter un déclenchement
                            </button>
                        </div>
                    </form>
                </div>


                <div id='declenchement_planning_liste' style="">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel widget">
                                <div class="panel-body-list  table-responsive">
                                    <table class="table table-striped table-hover no-head-border">
                                        <thead class="vd_bg-color vd_white">
                                        <tr>
                                            <th>Action</th>
                                            <th>Partenaire</th>
                                            <th>Temps de déclenchement<br>( jusqu'à )</th>
                                            <th>Pourcentage de déclenchement</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        {foreach from=$aTableauListeDeclenchement item=objdeclen}
                                            <tr>
                                                <td>
                                                    <div class="btn-group">
                                                        <button type="button"
                                                                class="btn btn-default dropdown-toggle"
                                                                data-toggle="dropdown" aria-haspopup="false"
                                                                aria-expanded="false">
                                                            Action <span class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                            <li>
                                                                <a href="modal_disponibilite_maquette.php?guid={$guid}&id_maquette={$id_maquette}&idunique={$idtranche}&idtranche={$idtranche}&validation=supdeclencheur&iddecl={$objdeclen.id_tranche_declenchement}">Supprimer</a>
                                                            </li>
                                                    </div>
                                                </td>
                                                <td> {$objdeclen.nom_partenaire}</td>
                                                <td> {$objdeclen.tps_tranche_declenchement} jour(s)</td>
                                                <td> {$objdeclen.pourcentage_declenchement} %</td>

                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}


    {if $niveau eq Y and   $bvuhistoplanning}
        <div class="tab-pane {$activeliste} col-sm-12" id="histo-tab">
            <div id="myModalListe" style='display:block;padding-top: 32px;' class="col-md-12">
                <div id="attente_histo_planning">
                    <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                </div>
                <div id='pas_histo_planning' style="display: none;">
                    <div class="alert alert-info">
                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                        Aucun historique disponible
                    </div>
                </div>

                <div id='histo_planning' style="display: none;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel widget">
                                <div class="panel-body-list  table-responsive">
                                    <table class="table table-striped table-hover no-head-border">

                                        <thead class="vd_bg-color vd_white">
                                        <tr>
                                            <th></th>
                                            <th>Date/Heure</th>
                                            <th>Utilisateur</th>
                                            <th>Commentaire</th>
                                        </tr>
                                        </thead>
                                        <tbody id="boucle_histo_planning"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}


</div>
</div>
</div>


</body>
</html>
