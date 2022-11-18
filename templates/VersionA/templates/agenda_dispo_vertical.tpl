<!-- agenda v4-->
<link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-treeview.css">

<?php $datepickerFr = filemtime(PATH_ASSETS.'js/datepicker-fr.js'); ?>
<script type="text/javascript" src="js/datepicker-fr.<?php echo $datepickerFr ?>.js"></script>

<?php $liste_e7 = filemtime(PATH_ASSETS.'js/liste_e7.js'); ?>
<script type="text/javascript" src="js/liste_e7.<?php echo $liste_e7 ?>.js?{$stime}"></script>

<?php $jsPLanningDispo = filemtime(PATH_ASSETS.'js/js_planning_dispo.js'); ?>
<script type="text/javascript" src="js/js_planning_dispo.<?php echo $jsPLanningDispo ?>.js?{$stime}"></script>

<?php $jQuerryContextMenu = filemtime(PATH_ASSETS.'js/jquery.contextmenu.js'); ?>
<script type="text/javascript" src="js/jquery.contextmenu.<?php echo $jQuerryContextMenu ?>.js"></script>

<?php $bootstrapTreeView = filemtime(PATH_ASSETS.'js/bootstrap-treeview.js'); ?>
<script type="text/javascript" src="js/bootstrap-treeview.<?php echo $bootstrapTreeView ?>.js"></script>

<?php $rechercherCodePostal = filemtime(PATH_ASSETS.'js/rechercher_code_postal.js'); ?>
<script type="text/javascript" src="js/rechercher_code_postal.<?php echo $rechercherCodePostal ?>.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.7.3/themes/base/jquery-ui.css">

{literal}
<script type="text/javascript">
    $(document).ready(function () {
        $('#arrow_switch_names').on('click', function(){
            var nom = $("#nom_patient_prendre_rdv_calendar").val();
            var prenom = $("#prenom_patient_prendre_rdv_calendar").val();
            $("#nom_patient_prendre_rdv_calendar").val(prenom);
            $("#prenom_patient_prendre_rdv_calendar").val(nom);
        });
        $('#arrow_switch_phones').on('click', function(){
            var mobile = $("#tel_mobile_patient_prendre_rdv_calendar").val();
            var fixe = $("#tel_fixe_patient_prendre_rdv_calendar").val();
            $("#tel_mobile_patient_prendre_rdv_calendar").val(fixe);
            $("#tel_fixe_patient_prendre_rdv_calendar").val(mobile);

            var mobileNumber = $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
            var fixeNumber = $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
            $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput("setCountry",mobileNumber.iso2);
            $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput("setCountry",fixeNumber.iso2);
        });
        $('.js-example-basic-single').select2();
        {/literal}

        {if !isset($aTabRetourDroits.Rendez_vous.copier_coller_rdv)}
        {literal}
        $.pnotify({
            title: 'Erreur configuration',
            text: 'Attention erreur de configuration des droits sur l\'utilisateur ',
            type: 'error',
            addclass: "stack-bottomright",
            delay: 10000
        });
        {/literal}
        {/if}

    });
</script>


{literal}

<style type="text/css">

    .border-none:before {
        border-style: none;
    }

    .btn_widget_standard:active{
        color:#fff;
    }
    .btn_widget_standard:visited{
        color:#fff;
    }
    .btn_widget_standard:focus{
        color:#fff;
    }
    .ui-datepicker {
        background: #5D9AD4;
        position: initial !important;
    }

    .fc-event .fc-bg {
        background: none !important;
        opacity: 1 !important;
        filter: alpha(opacity=100) !important;
    }

    .stylegreen{
        background-color: #00ff00;
    }

    .fc-ltr .fc-time-grid .fc-event-container {
        margin: 0 10% 0 2px;
    }

    .fc-event-time {
        display: inline;
        font-size: 12px;
        color: gray;
        cursor: pointer;
    }


    .fc-event{
        cursor: pointer;
    }

    .fc-event-container a{
        border:0px;
        margin-top: 1px;
        margin-right: 1px;
    }


    .nav-tabs.nav-justified>li>a{
        background-color: #eee;
        border-color: #969696;
        color:#555;
    }


    .nav-tabs.nav-justified>.active>a, .nav-tabs.nav-justified>.active>a:hover, .nav-tabs.nav-justified>.active>a:focus{
        background-color: #27A1C2 !important;
        border-top-color: #27A1C2 !important;
        border-left-color: #27A1C2 !important;
        border-right-color: #27A1C2 !important;
        border-bottom-color: #27A1C2 !important;
    }

    .nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
        color:#fff !important;
    }


    .coin_arrondi{
        border: solid 1px #81817C;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
        border-radius:5px;

        padding: 5px;
    }

    .coin_arrondi_time{
        border: solid 1px #980006;
        -moz-border-radius:50px;
        -webkit-border-radius:50px;
        border-radius:50px;

        padding: 5px;
    }

    .timeline {
        position: absolute !important;
        border-top: 2px solid red;
        width: 100%;
        margin: 0;
        padding: 0;
        z-index: 999 !important;
    }

    .stripe-salle-attente {
        background: repeating-linear-gradient(
                45deg,
                #aebaff,
                #aabdff 15px,
                #90b4ff 15px,
                #99b5ff 30px
        );
    }

    .conge {
        background: repeating-linear-gradient(
                135deg,
                #8bf0fc,
                #8bf0fc 30px,
                #8be6d7 30px,
                #8be6d7 60px
        );
        font-size: xx-large;
        font-weight: 900;
        text-transform: uppercase;
        text-align: center;
    }

    a.conge .fc-content {
        border: 0 !important;
    }

    .niveau_bas{
        background-color: #FDFFD7;
    }

    .niveau_normal{
        background-color: #ffffff;
    }

    .niveau_haut{
        background-color: #D7E7FF;
    }

    .niveau_urgent{
        background-color: #FFD7D7;
    }

    .list-group-item {
        padding: 5px 5px !important;
    }

    select:disabled {
        background: #ebebe4;
    }

    .element-item {
        position: static;
    }

    .fc-scroller {
        height: auto !important;
    }
    .fc-toolbar.fc-header-toolbar{
        top:126px!important;
    }
    span.select2.select2-container.select2-container--default{
        width: 100%!important;
    }

    {/literal}{if $bIsMobile}{literal}


    .fc-toolbar{
        display: none;
    }

    div.datepicker table {
        background: #121212 !important;
        border-collapse: collapse;
        width: 100%;
    }
    div.datepicker table td {
        padding: 8px !important;
        color: #000 !important;

    }

    .vd_content-section{
        margin: 0px !important;
        padding: 0px !important;
    }

    .vd_head-section, .vd_content-section, .vd_title-section {
        padding: 0px !important;
    }

    .panel .panel-body {
        padding: 0px !important;
    }

    .datepickerBorderT{
        display: none;
    }
    .datepickerBorderB{
        display: none;
    }
    .datepickerBorderL{
        display: none;
    }
    .datepickerBorderR{
        display: none;
    }
    .datepickerBorderTL{
        display: none;
    }
    .datepickerBorderTR{
        display: none;
    }
    .datepickerBorderBL{
        display: none;
    }
    .datepickerBorderBR{
        display: none;
    }
    .fc-scroller {
        overflow-y: hidden !important;
    }

    .ui-pnotify.stack-bottomright, .ui-pnotify.stack-bottomleft{
        top:auto !important;
    }
    .fc-time-grid.fc-unselectable {
        width: 101%!important;
    }

    /*************************************************************************************************************************************************************************** -- FIN CSS -- ****************************************************************************************/

    {/literal}{/if}{literal}

    @media (max-width: 1200px){
        .modal-dialog{
            width:1000px!important;
        }

        form#form_filtre_agendaVertical{
            width:17%!important;
        }
        #icone_menu_praticien{
            background-color:white;
        }
        .fc-toolbar.fc-header-toolbar{
            top:117px!important;
        }
    }

    @media (max-width:1600px){
        form#form_filtre_agendaVertical{
            height:66%!important;
        }
        .card {
            width: 253px!important;
        }
    }

    @media (min-width:1600px){
        .card{
            width:317px;
        }
    }

</style>


    <script type="text/javascript">
        var refreshIntervalId = "";
        var headerHeightagenda = "";
        $(document).ready(function () {
            $("input[type='text']").each(function (index, element) {
                $(this).attr("autocomplete", "new-password");
            });
        });
    </script>

{/literal}
<div id="tooltipeventbg" class="tooltipevent coin_arrondi_time no-print {if $bIsMobile}hidden{/if}" style="display:none;margin:10px;width:auto;height:auto;color:#000;font-weight:900;background:#fff422;position:absolute;z-index:10001;"></div>

<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalCalendarMobile" tabindex="-1" role="dialog" aria-labelledby="LabelmodalCalendarMobile" aria-hidden="false">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-body" style="height: 300px;">
                <div class="col-md-12" id="datemenupickermobile"></div>
            </div>
            <div class="modal-footer" style="background-color: #cccccc;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>


<div id="btn_rdv_prec_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;left: 15px; bottom: 25px;">
    <a class="mega-link" href="javascript:void(0);" onclick="btn_calendar_mobile_day_prev()" style="
       background-color: #9f9ba0;
       color: #ffffff !important;
       height: 70px;
       padding: 10px 16px;
       font-size: 24px;
       line-height: 1.33;
       border-radius: 35px 0px 0px 35px;
       -moz-border-radius: 35px 0px 0px 35px;
       -webkit-border-radius: 35px 0px 0px 35px;
       border: 1px solid #292929;">
        <span class="mega-icon">
            <i class="fa fa-chevron-left"></i>
        </span>
    </a>
</div>
<div id="btn_rdv_calendar_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;left: 65px; bottom: 25px;">
    <a class="mega-link" href="javascript:void(0);" onclick="$('#modalCalendarMobile').modal('show');" style="
       background-color: #9f9ba0;
       color: #ffffff !important;
       height: 70px;
       padding: 10px 16px;
       font-size: 24px;
       line-height: 1.33;
       border: 1px solid #292929;">
        <span class="mega-icon">
            <i class="fa fa-calendar"></i>
        </span>
    </a>
</div>
<div id="btn_rdv_next_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;left: 120px; bottom: 25px;">
    <a class="mega-link" href="javascript:void(0);" onclick="btn_calendar_mobile_day_next()" style="
       background-color: #9f9ba0;
       color: #ffffff !important;
       height: 70px;
       padding: 10px 16px;
       font-size: 24px;
       line-height: 1.33;
       border-radius: 0px 35px 35px 0px;
       -moz-border-radius: 0px 35px 35px 0px;
       -webkit-border-radius: 0px 35px 35px 0px;
       border: 1px solid #292929;">
        <span class="mega-icon">
            <i class="fa fa-chevron-right"></i>
        </span>
    </a>
</div>


<div id="add_rdv_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;right: 15px; bottom: 25px;">
    <a class="mega-link" href="javascript:void(0);" onclick="modal_prendre_rendez_vous();" style="
       background-color: #AB0000;
       color: #ffffff !important;
       width: 70px;
       height: 70px;
       padding: 10px 16px;
       font-size: 24px;
       line-height: 1.33;
       -webkit-border-radius: 35px;
       -moz-border-radius: 35px;
       border-radius: 35px;">
        <span class="mega-icon">
            <i class="fa fa-plus"></i>
        </span>
    </a>
</div>

<div id="messagerie_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="display: none !important;position: fixed; z-index: 999;right: 75px; bottom: 25px;">
    <a class="mega-link" href="main.php?dir=gestdiscuprat" style="
       background-color: #27a1c2;
       color: #ffffff !important;
       width: 70px;
       height: 70px;
       padding: 10px 16px;
       font-size: 24px;
       line-height: 1.33;
       -webkit-border-radius: 35px;
       -moz-border-radius: 35px;
       border-radius: 35px;">
        <span class="mega-icon">
            <i class="fa fa-envelope"></i>
            <span class="badge vd_bg-red" id="nb_message_menu_mobile" style="z-index: 9999;position: fixed;display: none;"></span>
        </span>

    </a>
</div>

<div id="dialog-confirm" title="Reinitialiser la sélection" style="display:none;">
    <p>Souhaitez-vous réinitialiser la sélection ?</p>
</div>

{if $bsucess}
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
        {$sMessageSucess}
    </div>
{/if}

{if $berror}
    <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
        {$sMessageError}
    </div>
{/if}


<div id="div_affiche_mini_calendar" style="position: fixed; top: 70px; left: 400px; z-index: 999;">
    <div align='center' id="datemenupicker"></div>
</div>

<div class="vd_content-section clearfix">
    <input type="hidden" name="motifpraticien" id="motifpraticien" value="">
    <input type="hidden" name="passepraticien" id="idpassepraticien">
    <input type="hidden" name="passelieu" id="idpasselieu">
    <input type="hidden" name="passerdv" id="idpasserdv">
    <input type="hidden" name="passevalidation" id="idpassevalidation">
    <input type="hidden" name="tabactive" id="tabactive" value="">
    <input type="hidden" name="moderecherche" id="moderecherche">
    <input type="hidden" name="chktime" id="chktime" value="0">
    <input type="hidden" name="widthagenda" id="widthagenda" value="">
    <input type="hidden" name="id_praticien_copypaste" id="id_praticien_copypaste" value="{$id_praticien_copypaste}">
    <input type="hidden" name="id_rdv_copypaste" id="id_rdv_copypaste" value="{$id_rdv_copypaste}">
    <input type="hidden" name="lstfiltreMenuVertical" id="lstfiltreMenuVertical" value="">


    {* ************************************************************************************************************************************** *}
    {* ************************************************************************************************************************************** *}
    {* body *}
    <div class="row">
        {* paramBouton + menu + content *}
        <div class="col-sm-12">
            <div class="panel widget light-widget">
                <div class="panel-body">

                    {* Div global *}
                    <div class="calendarVertical row" id="tpl_agenda_vertical">

                        {* Menu praticien *}
                        <div class="praticienVertical col-sm-2 no-print">
                            <div style="position:fixed;background-color: white;left: 0px;z-index: 998;padding-top: 110px;top: 0px;" class="col-sm-2">
                                {* formulaire de recherche *}
                                <form id="form-inline" class="search">
                                    <input id="myInputSearch" class="form-control mr-sm-2" type="text" placeholder="Recherche" aria-label="Search" style="margin-right:5px" onkeyup="TimeOutFonctionSearch()" >
                                    <button id="btn_recherche_par_motif" alt="Permet de rechercher par motif" title="Recherche par motif" onclick="SearchByMotif();" type="button" class="btn vd_btn btn-besoin-aide" style="float: right;line-height: 2;margin-left: 3px;cursor: pointer;text-transform: uppercase;font-weight: 700;background-color: #5D9AD4;color: white;display: flex;justify-content: space-around;box-sizing: border-box;padding: 2px 15px;border-radius: 3px;"><span class="fa fa-search" style="    line-height: 2;" ></span></button>
                                    
                                </form>
                                
                                <div class="menu-trigger mega-icon btnCollapse" data-action="click-trigger" style="float: left;line-height: 2;margin-left: 3px;cursor: pointer;text-transform: uppercase;font-weight: 700;background-color: #5D9AD4;color: white;/* display: flex; */justify-content: space-around;box-sizing: border-box; margin-bottom: 15px; padding: 4px 15px;border-radius: 3px;" alt="Menu">
                                    <i class="fa fa-bars" style="margin-right: 3px;" ></i>
                                </div>

                                <div data-action="click-target" class="vd_mega-menu-content  width-sm-3" style="z-index: 999">
                                    <div class="child-menu">
                                        <div class="content-list content-menu">
                                            <ul class="list-wrapper pd-lr-10">
                                                <li><a href="#"  alt="Permet d'enregistrer l'affichage courant pour les prochaines visites" title="Enregistrer la vue" onclick="EnregistrerVue();">Enregistrer la sélection</a>
                                                <li><a href="#"  alt="Permet de voir toute l'arborescence" title="Permet de voir toute l'arborescence" onclick="VoirVue();">Tout afficher</a>
                                                <li><a href="#"  alt="Permet de rénitialiser la vue" title="Réinitialiser la vue" onclick="ResetVue();" >Réinitialisation</a>
                                                <li><a href="#"  alt="Permet de recharger la vue" title="Recharger la vue" onclick="ReloadVue();" >Actualiser</a>
                                                <li><a href="#"  alt="Permet d'étendre toutes les professions" title="Etendre" onclick="Etendre();" >Déployer</a>
                                                <li><a href="#"  alt="Permet de replier par profession" title="Replier" onclick="fermerCollapse();" >Réduire</a>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <button id="btn_prendre_rdv_unique" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_uniqueNew(true);" type="button" class="btn vd_btn btn-besoin-aide" style="float: right;line-height: 2;margin-left: 3px;cursor: pointer;text-transform: uppercase;font-weight: 700;background-color: #5D9AD4;color: white;display: flex;justify-content: space-around;box-sizing: border-box;margin-bottom: 15px;padding: 2px 15px;border-radius: 3px;"><span class="fa fa-plus" style="    line-height: 2;" ></span></button>

                            </div>


                            {* ********************************************************************************************************* *}
                            {* ********************************************************************************************************* *}
                            <div class="accordion " id="accordionCalendar" style="margin-top: 120px;z-index: 997">

                                <form class="form-vertical" role="form" id="form_filtre_agendaVertical" style="position: fixed; margin-top: 60px;overflow: hidden auto!important;height: 76%;z-index:997;margin-left: 0px;border-left-width: 50px;width:18%;left:10px" name="formSaisieCheckbox" method="POST" >
                                    <input type="hidden" name="validation" value="activeFiltre">
                                    <input type="hidden" name="reset" id="resetVue" value="">
                                    <input type="hidden" name="lstfiltreMenuVertical" id="lstfiltreMenuVertical[]" value="">
                                    <input type="hidden" name="menu_copier_coller_rdv" id="menu_copier_coller_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.copier_coller_rdv)}{$aTabRetourDroits.Rendez_vous.copier_coller_rdv}{else}0{/if}">
                                    <input type="hidden" name="bdroitcreerendezvouscalendar" id="bdroitcreerendezvouscalendar" value="{if isset($aTabRetourDroits.Rendez_vous.bdroitcreerendezvouscalendar)}{$aTabRetourDroits.Rendez_vous.bdroitcreerendezvouscalendar}{else}0{/if}">
                                    <input type="hidden" name="menu_couper_coller_rdv" id="menu_couper_coller_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.couper_coller_rdv)}{$aTabRetourDroits.Rendez_vous.couper_coller_rdv}{else}0{/if}">
                                    <input type="hidden" name="menu_rdv_planifie" id="menu_rdv_planifie" value="{if isset($aTabRetourDroits.Rendez_vous.rdv_planifie)}{$aTabRetourDroits.Rendez_vous.rdv_planifie}{else}0{/if}">
                                    <input type="hidden" name="menu_patient_salle_attente" id="menu_patient_salle_attente" value="{if isset($aTabRetourDroits.Rendez_vous.patient_salle_attente)}{$aTabRetourDroits.Rendez_vous.patient_salle_attente}{else}0{/if}">
                                    <input type="hidden" name="menu_patient_en_cours_examen" id="menu_patient_en_cours_examen" value="{if isset($aTabRetourDroits.Rendez_vous.patient_en_cours_examen)}{$aTabRetourDroits.Rendez_vous.patient_en_cours_examen}{else}0{/if}">
                                    <input type="hidden" name="menu_patient_traite" id="menu_patient_traite" value="{if isset($aTabRetourDroits.Rendez_vous.patient_traite)}{$aTabRetourDroits.Rendez_vous.patient_traite}{else}0{/if}">
                                    {if isset($bosteo)}
                                        <input type="hidden" name="menu_bosteo" id="menu_bosteo" value="{$bosteo}">
                                    {else}
                                        <input type="hidden" name="menu_bosteo" id="menu_bosteo" value="">
                                    {/if}
                                    <input type="hidden" name="menu_dossier_ostheopathe" id="menu_dossier_ostheopathe" value="{if isset($aTabRetourDroits.Rendez_vous.dossier_ostheopathe)}{$aTabRetourDroits.Rendez_vous.dossier_ostheopathe}{else}0{/if}">
                                    <input type="hidden" name="menu_profilage_rdv" id="menu_profilage_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.profilage_rdv)}{$aTabRetourDroits.Rendez_vous.profilage_rdv}{else}0{/if}">
                                    <input type="hidden" name="menu_encaissement" id="menu_encaissement" value="{if isset($aTabRetourDroits.Rendez_vous.encaissement)}{$aTabRetourDroits.Rendez_vous.encaissement}{else}0{/if}">
                                    <input type="hidden" name="menu_deplace_rdv" id="menu_deplace_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.deplace_rdv)}{$aTabRetourDroits.Rendez_vous.deplace_rdv}{else}0{/if}">
                                    <input type="hidden" name="menu_supprimer_rdv" id="menu_supprimer_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.supprimer_rdv)}{$aTabRetourDroits.Rendez_vous.supprimer_rdv}{else}0{/if}">
                                    <input type="hidden" name="menu_praticien_annule_rdv" id="menu_praticien_annule_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.praticien_annule_rdv)}{$aTabRetourDroits.Rendez_vous.praticien_annule_rdv}{else}0{/if}">
                                    <input type="hidden" name="menu_communiquer_avec_patient" id="menu_communiquer_avec_patient" value="{if isset($aTabRetourDroits.Rendez_vous.communiquer_avec_patient)}{$aTabRetourDroits.Rendez_vous.communiquer_avec_patient}{else}0{/if}">
                                    <input type="hidden" name="menu_absence_excusee" id="menu_absence_excusee" value="{if isset($aTabRetourDroits.Rendez_vous.absence_excusee)}{$aTabRetourDroits.Rendez_vous.absence_excusee}{else}0{/if}">
                                    <input type="hidden" name="menu_absence_non_excusee" id="menu_absence_non_excusee" value="{if isset($aTabRetourDroits.Rendez_vous.absence_non_excusee)}{$aTabRetourDroits.Rendez_vous.absence_non_excusee}{else}0{/if}">
                                    <input type="hidden" name="menu_imprimer_rdv" id="menu_imprimer_rdv" value="{if isset($aTabRetourDroits.Rendez_vous.imprimer_rdv)}{$aTabRetourDroits.Rendez_vous.imprimer_rdv}{else}0{/if}">
                                    <input type="hidden" name="menu_appel_urgence" id="menu_appel_urgence" value="{if isset($aTabRetourDroits.Rendez_vous.appel_urgence)}{$aTabRetourDroits.Rendez_vous.appel_urgence}{else}0{/if}">
                                    <input type="hidden" name="menu_gestion_teleconsultation" id="menu_gestion_teleconsultation" value="{if isset($aTabRetourDroits.Rendez_vous.gestion_teleconsultation)}{$aTabRetourDroits.Rendez_vous.gestion_teleconsultation}{else}0{/if}">
                                    <div class="card">
                                        {* Récupérer les catégories de praticien *}
                                        {assign var=counter value=100000}
                                        {foreach from=$aTabRetourPraticienProfession item=objetProfession}
                                            <div class="card-header mySearch {$objetProfession.id}" id="headingOne{$objetProfession.id}" vee="{$objetProfession.id}" lenom="{$objetProfession.libelle}" style="display:inline-flex;width:100%;">
                                                <input name="id_checkAll{$objetProfession.id}" value="" id="id_checkAll{$objetProfession.id}" type="checkbox" aria-label="case à cocher" style="float:left;" {if $objetProfession.checked=='1'}checked{/if}>
                                                <ul id="btn_link{$objetProfession.id}" class="btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne{$objetProfession.id}"
                                                    aria-expanded="false" aria-controls="collapseOne{$objetProfession.id}" style="text-transform:uppercase; font-weight:500; margin-bottom:0;font-size: 15px; width: unset;padding-left: 0px;white-space: nowrap;padding-left: 0px;float:left;max-width: 80%;">

                                                    <li style="list-style:none;float: left;margin-left: 2px;color: #5D9AD4;">
                                                        {$objetProfession.libelle}<br/></li>
                                                </ul>

                                                <div style="display: flex; margin-left: 5px;position: sticky;right: 0px;background-color: white;width: 45px;">
                                                    <button id="prochain_rdv_dispo_profession{$objetProfession.id}" class="fleche_verte_profession" alt="Aller au prochain Rendez-vous disponible" title="Aller au prochain Rendez-vous disponible" onclick="modal_prochain_rendez_vous_unique('', '{$objetProfession.id}')"
                                                            type="button" class="btn vd_btn btn-besoin-aide" style="background-color: Transparent;width: 19px;height: 25px;font-size: 25px;line-height: 0;color:forestgreen;font-size: 15px; padding: 0px;padding-bottom:5px"
                                                            onMouseOver="this.style.color = '#e6e6e6'" onMouseOut="this.style.color = 'forestgreen'">
                                                        <i class="btn_prise_rdv_praticien{$objetProfession.id}"><span class="fa fa-arrow-right" ></span></i>

                                                    </button>
                                                    <style>
                                                        #prochain_rdv_dispo_{$objetProfession.id}:focus {
                                                            outline-color: transparent;
                                                        }

                                                    </style>
                                                    <button id="btn_prendre_rdv_profession_{$objetProfession.id}" alt="Prendre un rendez-vous" title="Prendre un rendez-vous"
                                                            onclick="modal_prendre_rendez_vous_unique('', '{$objetProfession.id}', '{$objetProfession.link}', '{$objetProfession.identifiantArbre}', true);"
                                                            type="button" class="btn vd_btn btn-besoin-aide" style="background-color: Transparent;width: 19px;height: 25px;font-size: 25px;line-height: 0;color:#555;font-size: 15px; padding: 0px;padding-bottom:5px"
                                                            onMouseOver="this.style.color = '#e6e6e6'" onMouseOut="this.style.color = '#555'">
                                                        <i class="btn_prise_rdv_praticien{$objetProfession.id}"><span class="fa fa-plus" ></i>

                                                    </button>
                                                    <style>
                                                        #btn_prendre_rdv_profession_{$objetProfession.id}:focus {
                                                            outline-color: transparent;
                                                        }

                                                    </style>
                                                </div>

                                            </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(function () {
                                                    $("#id_checkAll{/literal}{$objetProfession.id}{literal}").click(function () {
                                                        if ($("#id_checkAll{/literal}{$objetProfession.id}{literal}").is(':checked')) {
                                                            $(".class_checkAll{/literal}{$objetProfession.id}{literal}").each(function () {
                                                                if ($(".box" + $(this).val()).css("display") != 'none') {
                                                                    $(this).prop("checked", true);
                                                                }

                                                            });
                                                        } else {
                                                            $(".class_checkAll{/literal}{$objetProfession.id}{literal}").each(function () {
                                                                if ($(".box" + $(this).val()).css("display") != 'none') {
                                                                    $(this).prop("checked", false);
                                                                }

                                                            });
                                                        }
                                                    });
                                                });
                                            </script>
                                        {/literal}
                                            <div id="collapseOne{$objetProfession.id}" class="in" aria-labelledby="headingOne" data-parent="#accordionCalendar" style="margin-right:55px;" >
                                                <div class="card-body" style="margin-left: 5%;">
                                                    <ul id="ulcalendar" class="nav no-print" style="display:grid">
                                                        {foreach from=$objetProfession.listePraticien item=objetPraticien name=sTabPraticien}
                                                            <div class="vd_checkbox checkbox-success clearfix" } style="display:flex;"  >
                                                                <div class="btn-group mySearchChild {$objetProfession.id}" id="{$objetProfession.id}" vee="{$objetProfession.id}"  att="{$objetPraticien.id_user}" style="">
                                                                    <input class="class_checkAll{$objetProfession.id}" type="checkbox" aria-label="case à cocher" name="lstfiltreMenuVertical[]" value="{$objetPraticien.id_user}" id="checkbox-{$objetPraticien.id_user}" style="float:left; margin-right:5px;"  {if $objetPraticien.checked=='praticienChecked'}checked{/if}>
                                                                    <label class="box{$objetPraticien.id_user} name-praticien" for="checkbox-{$objetPraticien.id_user}" style="float: left;display:block;">
                                                                        {if {$objetPraticien.couleur_user} != '#ffffff'}
                                                                            <style>
                                                                                label.box{$objetPraticien.id_user}::before{
                                                                                    border-color: {$objetPraticien.couleur_user};
                                                                                }
                                                                            </style>
                                                                        {/if}

                                                                        {if $objetPraticien.nom_affichage_calendar_user!=''}{assign var="altPraticien" value="{$objetPraticien.nom_affichage_calendar_user}"}
                                                                        {else}{assign var="altPraticien" value="{$objetPraticien.abreviation_civilite} {$objetPraticien.nom_user} {$objetPraticien.prenom_user}"}{/if}
                                                                        <li id="li{$objetPraticien.id_user}" onclick="loadCalendarPraticien('{$objetPraticien.id_user}', '{$objetPraticien.abreviation_civilite}', '{$objetPraticien.nom_user}', '{$objetPraticien.prenom_user}', '{$datedebutaff}', '{$objetPraticien.identifiant_user}', '{$objetPraticien.active_dimanche_user}', '{$objetPraticien.affichage_agenda_heure_debut}', '{$objetPraticien.affichage_agenda_heure_fin}', '{$sDefaultAgenda}', '{$objetPraticien.affichage_agenda_slot_duration}', '{$sTaillecellule}', '{$affichemotifrdv}', '{$afficheiconecomrdv}', '{$bIsMobile}', '{$idc}', '{$iAccess}', '{$ibmodule}', '{$afficheheurerdv}', '{$objetProfession.id}');"
                                                                            class="dropdown-toggle totale" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            <!--Nom du praticien -->
                                                                            <a sidtab="{$objetPraticien.id_user}" data-toggle="tab" id="tabtest{$objetPraticien.id_user}">
                                                                                <b class="enumerationPraticien{$objetPraticien.id_user}"
                                                                                   style="display:block;font-weight: 600;  font-family: 'Open Sans', 'arial'; font-size:12px;    white-space: nowrap;"
                                                                                    title="{$altPraticien}">
                                                                                    {$altPraticien}&nbsp;
                                                                                </b>
                                                                            </a>
                                                                        </li>
                                                                    </label>
                                                                    <!-- vd_mega-menu-content -->
                                                                    {assign var=counter value=$counter-1}
                                                                    <div id="icone_menu_praticien" class="editRDV{$objetPraticien.id_user}" {if $objetPraticien.checked=='praticienChecked'}style="display:block;margin-left: 5px;position:sticky;width:60px;right:0px;z-index: {$counter};"{else}style="display:none; margin-left: 5px;position:sticky;right:0px;background-color: white;width:60px;z-index: {$counter};"{/if}>
                                                                        <div class="menu-trigger mega-icon" data-action="click-trigger" style="float: left;line-height: 2;margin-left: 3px;cursor: pointer"> <i class="fa fa-cog"></i> </div>
                                                                        <div data-action="click-target" class="vd_mega-menu-content border-none width-xs-2 left-xs left-sm" {if $altPraticien|count_characters:true < 12} style="top:22px;right:auto;" {else}style="top:22px" {/if}>
                                                                            <div class="child-menu">
                                                                                <div class="content-list content-menu">
                                                                                    <ul class="list-wrapper pd-lr-10">

                                                                                        {if $aTabRetourDroits.roue_crantee.boc_gestion_user =="1"}
                                                                                            <li><a href="main.php?dir=boc_gestion_user&action=form&id_user={$objetPraticien.id_user}"   {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarFichepraticien}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;<a href="#" style="display:inline" onclick="renvoi_info_traduction('fichepraticiemenuagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarFichepraticien|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');
                                                                                                        $('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.gestlieuplus =="1"}
                                                                                            <li><a href="main.php?dir=gestlieuplus&id_user={$objetPraticien.id_user}"  {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarLieux}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#" style="display:inline" onclick="renvoi_info_traduction('lieuxagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarLieux|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.gestrecomprat =="1"}
                                                                                            <li><a href="main.php?dir=gestrecomprat&identifiant_user={$objetPraticien.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarConsigne}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('consigneagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarConsigne|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.gestiondiposv2 =="1"}
                                                                                            <li><a href="main.php?dir={$dirPlanning}&identifiant_user={$objetPraticien.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarDispographique}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('dispoagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarDispographique|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $bactionplanning or  $objetPraticien.identifiant_user==$identifiantuser} {/if}

                                                                                        {if $aTabRetourDroits.roue_crantee.configtypepersord =="1"}
                                                                                            <li><a href="main.php?dir=configtypepersord&id_user={$objetPraticien.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarTpsRdv}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('tpsrdvoagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarTpsRdv|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.tranchefertranche =="1"}
                                                                                            <li><a href="main.php?dir=tranchefertranche&id_user={$objetPraticien.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarfermewidget}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('fermerwidgetagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarfermewidget|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.gestrdvinterpro =="1"}
                                                                                            <li><a href="main.php?dir=gestrdvinterpro&id_user={$objetPraticien.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarAccesintepro}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('accesinterproagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarAccesintepro|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.progremplacant =="1"}
                                                                                            <li><a href="main.php?dir=progremplacant&identifiant_user={$objetPraticien.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarGestionRemplacant}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('gestionremplacantagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarGestionRemplacant|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.gestconge =="1"}
                                                                                            <li><a href="main.php?dir=gestconge&identifiant_user={$objetPraticien.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarCongeferie}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('gestioncongeagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarCongeferie|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}
                                                                                        {if $aTabRetourDroits.roue_crantee.gestioncodemotif =="1"}
                                                                                            <li><a href="main.php?dir=gestioncodemotif&identifiant_user={$objetPraticien.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarCongeCode}</a>
                                                                                                {if $bActivtraduction=='Y'}
                                                                                                    &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('gestioncodeagenda', 'fli_menuagneda', '{$sLangueUser}', '{$MenuCalendarCongeCode|replace:'\'':'\\\''}', 'MenuAgenda', 'MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                                                                {/if}
                                                                                            </li>
                                                                                        {/if}

                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        </span>
                                                                        <button id="prochain_rdv_dispo_{$objetPraticien.id_user}" alt="Aller au prochain Rendez-vous disponible" title="Aller au prochain Rendez-vous disponible" onclick="modal_prochain_rendez_vous_unique('{$objetPraticien.identifiant_user}', '{$objetProfession.id}');"
                                                                                type="button" class="btn vd_btn btn-besoin-aide" style="background-color: Transparent;width: 19px;height: 25px;font-size: 25px;line-height: 0;color:forestgreen;font-size: 15px; padding: 0px 0px 2px 2px;"
                                                                                onMouseOver="this.style.color = '#e6e6e6'" onMouseOut="this.style.color = 'forestgreen'">
                                                                            <i class="btn_prise_rdv_praticien{$objetPraticien.id_user}"><span class="fa fa-arrow-right" ></span></i>

                                                                        </button>
                                                                        <button id="btn_prendre_rdv_unique_{$objetPraticien.id_user}" alt="Prendre un rendez-vous" title="Prendre un rendez-vous"
                                                                                onclick="modal_prendre_rendez_vous_unique('{$objetPraticien.identifiant_user}', '', '{$objetProfession.link}', '{$objetProfession.identifiantArbre}', true);"
                                                                                type="button" class="btn vd_btn btn-besoin-aide" style="background-color: Transparent;width: 25px;height: 25px;padding-left: 3px;line-height: 0;color:#555;font-size: 15px; padding: 0px;margin-left:-6px" onMouseOver="this.style.color = '#e6e6e6'" onMouseOut="this.style.color = '#555'">
                                                                            <i class="btn_prise_rdv_praticien{$objetPraticien.id_user}"><span class="fa fa-plus" ></i>

                                                                        </button>
                                                                        <style>
                                                                            #btn_prendre_rdv_unique_{$objetPraticien.id_user}:focus {
                                                                                outline-color: transparent;
                                                                            }
                                                                        </style>


                                                                    </div>
                                                                    <div>
                                                                        <span id="nb_consigne_{$objetPraticien.id_user}" class="badge vd_bg-red" style="position:absolute;margin-top:-8px;margin-left:15px;display:none;"></span>
                                                                        <span data-action="click-trigger" id="id_consigne_{$objetPraticien.id_user}" class="menu-icon" style="display:none;cursor:pointer;" title="Consigne du medecin"><i class="fa fa-edit"></i></span>
                                                                        <div id="div-top-menu-consigne_{$objetPraticien.id_user}" class="vd_mega-menu-content right-xs left-sm" data-action="click-target" style="z-index:99999;">
                                                                            <div class="child-menu">
                                                                                <div class="title">
                                                                                    Liste des consignes
                                                                                </div>
                                                                                <div class="content-list content-image">
                                                                                    <div data-rel="scroll" class="mCustomScrollbar _mCS_2" style="overflow: hidden;line-height:15px; letter-spacing: normal;">
                                                                                        <div class="mCustomScrollBox mCS-light" id="mCSB_2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">
                                                                                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                                                                                <ul id="lst_consignes_{$objetPraticien.id_user}" class="list-wrapper  pd-lr-10">
                                                                                                </ul>
                                                                                            </div>
                                                                                            <div class="mCSB_scrollTools" style="position: absolute; opacity: 0; display: none;">
                                                                                                <div class="mCSB_draggerContainer">
                                                                                                    <div class="mCSB_dragger" style="position: absolute; height: 209px; top: 0px;" oncontextmenu="return false;">
                                                                                                        <div class="mCSB_dragger_bar" style="position: relative; line-height: 209px;"></div>
                                                                                                    </div>
                                                                                                    <div class="mCSB_draggerRail"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div> <!-- child-menu -->
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>


                                                        {/foreach}
                                                    </ul>
                                                </div>
                                            </div>
                                        {/foreach}




                                        {literal}
                                            <script>
                                                function loadMyModalFiltreMedecin() {
                                                    aff_divattente('divfiltrepraticien', 'divattentefiltrepraticien');
                                                    $('#myModalfiltremedecin').modal('show');
                                                }

                                                function Etendre() {
                                                    var Node = document.getElementsByClassName('mySearch');
                                                    for (i = 0; i < Node.length; i++) {
                                                        var style = getComputedStyle(Node[i]);
                                                        if (style.display == 'inline-flex') {
                                                            id = $(Node[i]).attr('vee');
                                                            $("#collapseOne" + id).collapse('show');
                                                        }
                                                    }
                                                }

                                                $("#myInputSearch").on('keydown', function (e) {
                                                    if (e.key === 'Enter' || e.keyCode === 13) {
                                                        return false;
                                                    }
                                                });



                                                function EnregistrerVue() {

                                                    var checked = false
                                                    $('input[class^="class_checkAll"]').each(function () {
                                                        if ($(this).is(':checked')) {
                                                            checked = true;
                                                        }

                                                    });
                                                    if (checked == true) {
                                                        $('#form_filtre_agendaVertical').submit();
                                                    } else {
                                                        alert("Veuillez sélectionner au moins un praticien");
                                                    }

                                                }

                                                function ResetVue() {
                                                    $("#resetVue").val('reset');
                                                    $('#form_filtre_agendaVertical').submit();
                                                }

                                                function SearchByMotif() {
                                                    var praticiens = [];
                                                    var searchValue = $('#myInputSearch').val();
                                                    if (searchValue.length < 2) {
                                                        alert('Veuillez saisir au moins 3 caractères dans la barre de recherche.')
                                                    } else {
                                                        var email_user = $('#email_user').val();
                                                        var guid_user = $('#token_user').val();

                                                        $('div[id^="vd_checkboxTous"]').css("display", "none");
                                                        $('div[id^="headingOne"]').css("display", "none");
                                                        $('div[id^="collapseOne"]').removeClass("in");
                                                        $('div[id^="btn_link"]').addClass("collapsed");
                                                        $('div[id^="collapseOne"]').collapse('hide');
                                                        $('label[class^="box"]').css("display", "none");
                                                        $('b[class^="enumerationPraticien"]').css("display", "none");
                                                        $('div[class^="editRDV"]').css("display", "none");
                                                        $.ajax({
                                                            url: 'api2/motif',
                                                            data: 'fields=id_motif_rdv,libelle_motif_rdv,disponibilite&sFilter={"column":"libelle_motif_rdv","compare_operator":"LIKE","value":"' + searchValue + '"}',
                                                            dataType: 'json',
                                                            async: true,
                                                            cache: false,
                                                            headers: {
                                                                "x-alx-idc": $('#idc').val(),
                                                                "authorization": email_user + " " + guid_user,
                                                            },
                                                            success: function (json) {

                                                                $.each(json.tabinfo, function (index, value) {
                                                                    if (value.praticien.length !== 0) {
                                                                        //console.log(value.praticien)
                                                                        $.each(value.praticien, function (index, value) {
                                                                            if (praticiens.indexOf(value.id_user) == -1) {
                                                                                praticiens.push(value.id_user);
                                                                            }
                                                                        });
                                                                    }
                                                                });
                                                                var Node = document.getElementsByClassName('mySearch');
                                                                for (i = 0; i < Node.length; i++) {
                                                                    id = $(Node[i]).attr('vee');
                                                                    var NodeForPraticien = document.getElementById("collapseOne" + id);
                                                                    var childNode = NodeForPraticien.getElementsByClassName('mySearchChild');
                                                                    var nbPraticien = 0;
                                                                    for (j = 0; j < childNode.length; j++) {
                                                                        idPraticien = $(childNode[j]).attr('att');
                                                                        var aNode = childNode[j].getElementsByClassName('enumerationPraticien' + idPraticien);
                                                                        if (praticiens.indexOf(idPraticien) != -1) {
                                                                            nbPraticien += 1;
                                                                            $("#btn_link" + id).removeClass("collapsed");
                                                                            $(".box" + idPraticien).css("display", "block");
                                                                            $("#collapseOne" + id).collapse('show');
                                                                            $(".enumerationPraticien" + idPraticien).css("display", "block");
                                                                            $(".editRDV" + idPraticien).css("display", "block");
                                                                            $(Node[i]).css("display", "block");

                                                                            $("#headingOne" + id).css("display", "inline-flex");
                                                                            $("#collapseOne" + id).addClass("in");
                                                                            $('div[id^="collapseOne"]').css("height", "unset");
                                                                        }

                                                                    }
                                                                    if (nbPraticien > 1) {
                                                                        $("#vd_checkboxTous" + id).css("display", "block");
                                                                    }
                                                                }
                                                            }
                                                        });
                                                    }

                                                }

                                                function ReloadVue() {
                                                    $('#form_filtre_agendaVertical').submit();
                                                }

                                                function VoirVue() {
                                                    $('div[id^="vd_checkboxTous"]').css("display", "block");
                                                    $('div[id^="headingOne"]').css("display", "inline-flex");
                                                    $('div[id^="btn_link"]').removeClass("collapsed");
                                                    $('div[id^="collapseOne"]').collapse('show');
                                                    $('label[class^="box"]').css("display", "block");
                                                    $('b[class^="enumerationPraticien"]').css("display", "block");
                                                    $('div[class^="editRDV"]').css("display", "block");
                                                }

                                                function fermerCollapse() {
                                                    $('div[id^="collapseOne"]').collapse('hide');
                                                }

                                                var t = false;

                                                function TimeOutFonctionSearch() {
                                                    clearTimeout(t); //remet le compteur à 0
                                                    t = setTimeout(function () { //lance le chrono pour 500ms
                                                        fonctionSearch();
                                                    }, 250);
                                                }



                                                // fonction sur l'onglet de la recherche.
                                                function fonctionSearch() {

                                                    // ce qui est tapé dans la recherche
                                                    var filter = $("#myInputSearch").val().toLowerCase();
                                                    var Node = document.getElementsByClassName('mySearch');

                                                    // on boucle sur les praticiens
                                                    $('div[id^="vd_checkboxTous"]').css("display", "none");
                                                    $('div[id^="headingOne"]').css("display", "none");
                                                    $('div[id^="collapseOne"]').removeClass("in");
                                                    $('div[id^="btn_link"]').addClass("collapsed");
                                                    $('div[id^="collapseOne"]').collapse('hide');
                                                    $('span[id^="nb_consigne"]').css("display", "none");
                                                    $('span[id^="id_consigne"]').css("display", "none");
                                                    $('label[class^="box"]').css("display", "none");
                                                    $('b[class^="enumerationPraticien"]').css("display", "none");
                                                    $('div[class^="editRDV"]').css("display", "none");
                                                    if (filter.length > 2) {
                                                        for (i = 0; i < Node.length; i++) {
                                                            //console.log(Node.textContent);
                                                            if (Node[i].textContent.toLowerCase().indexOf(filter) > -1) {
                                                                $(Node[i]).css("display", "block");
                                                                id = $(Node[i]).attr('vee');
                                                                $("#headingOne" + id).css("display", "inline-flex");
                                                                $("#collapseOne" + id).addClass("in");
                                                                $("#collapseOne" + id).collapse('show');
                                                                $("#vd_checkboxTous" + id).css("display", "block");
                                                                var NodeForPraticien = document.getElementById("collapseOne" + id);
                                                                $("#btn_link" + id).removeClass("collapsed");
                                                                $('div[id^="collapseOne"]').css("height", "unset");
                                                                var childNode = NodeForPraticien.getElementsByClassName('mySearchChild');
                                                                for (j = 0; j < childNode.length; j++) {
                                                                    idPraticien = $(childNode[j]).attr('att');
                                                                    $(".box" + idPraticien).css("display", "block");
                                                                    $(".enumerationPraticien" + idPraticien).css("display", "block");
                                                                    $(".editRDV" + idPraticien).css("display", "block");
                                                                }
                                                            } else {
                                                                id = $(Node[i]).attr('vee');
                                                                var NodeForPraticien = document.getElementById("collapseOne" + id);
                                                                var childNode = NodeForPraticien.getElementsByClassName('mySearchChild');
                                                                var nbPraticien = 0;
                                                                for (j = 0; j < childNode.length; j++) {
                                                                    idPraticien = $(childNode[j]).attr('att');
                                                                    var aNode = childNode[j].getElementsByClassName('enumerationPraticien' + idPraticien);
                                                                    if (aNode[0].textContent.toLowerCase().indexOf(filter) > -1) {
                                                                        nbPraticien += 1;
                                                                        $("#btn_link" + id).removeClass("collapsed");
                                                                        $(".box" + idPraticien).css("display", "block");
                                                                        $("#collapseOne" + id).collapse('show');
                                                                        $(".enumerationPraticien" + idPraticien).css("display", "block");
                                                                        $(".editRDV" + idPraticien).css("display", "block");
                                                                        $(Node[i]).css("display", "block");

                                                                        $("#headingOne" + id).css("display", "inline-flex");
                                                                        $("#collapseOne" + id).addClass("in");
                                                                        $('div[id^="collapseOne"]').css("height", "unset");
                                                                    }

                                                                }
                                                                if (nbPraticien > 1) {
                                                                    $("#vd_checkboxTous" + id).css("display", "block");
                                                                }
                                                            }
                                                        }
                                                    }else if (filter.length ==0){
                                                        ReloadVue();
                                                    }
                                                }
                                            </script>
                                        {/literal}
                                    </div>
                                </form>
                            </div>
                        </div>





                        <div class="planningCalendar col-sm-10">


                            <div class="btn_param no-print" style="top: 63px; position: fixed; z-index: 801; background-color: rgb(255, 255, 255); padding-top: 20px;width:80%">

                                <div class="clearfix row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-3 controls {if $bIsMobile}hidden{/if}">
                                            <a id="btn_mini_calendar" class="mega-link" href="javascript:void(0);" title="" onclick="affiche_mini_calendar();">
                                            <span class="mega-icon">
                                                <i class="fa fa-calendar" style="font-size:xx-large;"></i>
                                            </span>
                                            </a>

                                            <div class="btn-group" style="display: inline-block;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                                                <button id="btn_copier_rdv" title="Copier en cours ..." onclick="suppression_copier_rdv();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;          -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none;position: absolute;width: 300px;top: 29px;left: 150px;">Copier en cours ... cliquez pour annuler</button>
                                            </div>
                                            <div class="btn-group" style="display: inline-block;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                                                <button id="btn_couper_rdv" title="Couper en cours ..." onclick="suppression_couper_rdv();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;         -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none;position: absolute;width: 300px;top: 29px;left: 150px;">Couper en cours ... cliquez pour annuler</button>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 col-sm-9 controls {if $bIsMobile}hidden{/if}">
                                            {if $iAccess == '10' || $sGroupe == 'secrelimite'}
                                                <div align="left">
                                                    <h2 class="nameCalendarPraticien"></h2>

                                                </div>
                                            {/if}
                                        </div>

                                        <div class="col-sm-2 controls ">
                                            <div align="center" class="{if $bIsMobile}hidden{/if}">
                                                <button id="btn_interpro_rdv" alt="Ne plus afficher" title="Ne plus afficher" onclick="retourProchainRDV();$('#btn_interpro_rdv').css('display', 'none');$('#moderecherche').val('');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #D9736B; float:right;display:none;padding-right: 10px;padding-left: 10px;padding-top: 3px;padding-bottom: 3px;">Ne plus afficher</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="div_param_agenda" class="vd_content-section clearfix row" style="display:none;">
                                <form class="form-horizontal" action="main.php?dir=rechdispo" role="form" id="form_filtre_agenda" method="POST">
                                    <input type="hidden" name="lstfiltreAgendaVisible" id="lstfiltreAgendaVisible" value="">
                                    <input type="hidden" name="bsetfiltreCategorie" id="bsetfiltreCategorie" value="ok">
                                    <input type="hidden" name="bsetapplique" id="bsetapplique" value="praticien">
                                    <input type="hidden" name="identifiant_entite" value="{$idc}">
                                    {* Agenda visible *}
                                    <div class="col-sm-12">
                                        <h4>Agenda visible :</h4>
                                        <ul class="nav nav-tabs" id="myTab" role="tablist" >
                                            {foreach from=$aTabRetourPraticienProfession item=objetProfession}
                                                <li class="nav-item">
                                                    <a class="nav-link" id="tab_profession{$objetProfession.id}" data-toggle="tab" href="#fltab{$objetProfession.id}" role="tab"  aria-controls="fltab{$objetProfession.id}"  style="color:#27a1c2 !important;padding: 10px!important;margin-right: 0!important;">
                                                        {$objetProfession.libelle}</a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                        <div class="tab-content" id="myTabContent" style="background-color:#fff; margin-bottom:10px">$

                                            {foreach from=$aTabRetourPraticienProfession item=objetProfession}
                                                <div class="tab-pane fade" id="fltab{$objetProfession.id}" role="tabpanel" aria-labelledby="tab_profession{$objetProfession.id}">

                                                    <div class="vd_checkbox checkbox-success">
                                                        <input type="checkbox"  class="" name="id_checkAll_dispo{$objetProfession.id}" value="" id="id_checkAll_dispo{$objetProfession.id}">
                                                        <label for="id_checkAll_dispo{$objetProfession.id}">Tous </label>
                                                    </div>

                                                    {foreach from=$objetProfession.listePraticien item=objetPraticien name=sTabPraticien}
                                                        <div class="vd_checkbox checkbox-success clearfix">
                                                            <input class="class_checkAll_dispo{$objetProfession.id}" name="lstfiltreAgendaVisible[]" type="checkbox"
                                                                   value="{$objetPraticien.identifiant_user}" id="checkbox-{$objetPraticien.identifiant_user}"
                                                            >
                                                            <label for="checkbox-{$objetPraticien.identifiant_user}">
                                                                {$objetPraticien.abreviation_civilite} {$objetPraticien.nom_user} {$objetPraticien.prenom_user}
                                                            </label>

                                                        </div>



                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(function () {
                                                                $("#id_checkAll_dispo{/literal}{$objetProfession.id}{literal}").click(function () {
                                                                    if ($("#id_checkAll_dispo{/literal}{$objetProfession.id}{literal}").is(':checked')) {
                                                                        $(".class_checkAll_dispo{/literal}{$objetProfession.id}{literal}").each(function () {
                                                                            $(this).prop("checked", true);
                                                                        });
                                                                    } else {
                                                                        $(".class_checkAll_dispo{/literal}{$objetProfession.id}{literal}").each(function () {
                                                                            $(this).prop("checked", false);
                                                                        });
                                                                    }
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}


                                                    {/foreach}
                                                </div>
                                            {/foreach}

                                        </div>
                                    </div>

                                    {* Bouton valider & annuler *}
                                    <div class="col-sm-12">
                                        {* <div class="col-sm-4"></div> *}
                                        {* <div class="col-sm-4" align="center"> *}
                                        {* <div class="col-sm-12"> *}
                                        <div style="display:flex;">
                                            <button id="btn_valider_param_agenda" alt="Valider" title="Valider" type="submit" class="btn vd_btn" style="background-color: #00D3C8;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Valider</button>
                                            &nbsp;&nbsp;<button id="btn_annule_param_agenda" alt="Annuler" title="Annuler" type="button" class="btn vd_btn" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Annuler</button>
                                        </div>
                                        <div class="col-sm-4"></div>
                                    </div>
                                </form>
                            </div>


                            <div class="tab-content  mgbt-xs-20">
                                <div class="tab-pane active no-print" id="tab0" style="height: 1500px;width: 100%;background: white;position: relative;padding-top: 300px;text-align: center;color: lightgrey;font-size: 20px;">Veuillez sélectionner un praticien</div>
                                <div id="divTabPraticien"></div>

                                {literal}
                                <script type="text/javascript">
                                    function changeVue($mode) {
                                        {/literal}
                                        {foreach from=$tabPraticien item=tabP2 name=sTabPraticien2}
                                        {literal}
                                        $('#calendar_{/literal}{$tabP2.id_user}{literal}').fullCalendar('changeView', $mode);

                                        {/literal}{/foreach}{literal}
                                    }
                                    {/literal}{if $bIsMobile}{literal}
                                    changeVue('agendaDay');
                                    {/literal}{/if}{literal}

                                </script>
                                {/literal}


                                <!-- Calendar ALL -->

                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <!-- col-sm-12-->
        </div>
        <!-- row -->
    </div>
    <!-- .vd_content-section -->


    <div class="modal fade" id="myModalNoInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 10000;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
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
                                    <button id="boutonmyModalNoInfo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="$('#myModalNoInfo').modal('hide');">Ok</button>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModalLockRdv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 10000;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLockRdvInfo">Désolé...</h4>
                </div>
                <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                    <div class="panel-body" style="padding: 0px 0px 15px 0px;">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8" align="center">
                                    <h3 id="txtmyModalLockRdv">Aucune information trouvée!</h3>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8" align="center">
                                    <button id="bouton1mmyModalLockRdv" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="$('#myModalNoInfo').modal('hide');">Ok</button>
                                    <button id="bouton2mmyModalLockRdv" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="$('#myModalNoInfo').modal('hide');$('#modalEnregistrerRendezVous').modal('hide');">Ok</button>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="myModalfiltremedecin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabelfiltre" style="width:80%">Sélectionner vos critères d'affichage</h4>
                </div>
                <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                    <div id="divattentefiltrepraticien" style="display:none;"><div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div></div>
                    <div id="divfiltrepraticien" class="panel-body" style="padding: 0px 0px 15px 0px;">
                        <form class="form-horizontal" action="" role="form" id="formList1" method="GET" >
                            <input type="hidden" value="planning" name='validation' />
                            <input type="hidden" value="3" id='all' />

                            <div class="col-sm-12">
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-8">
                                        <div class="col-sm-12 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Date de début</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Sélectionnez une date de début" value="" name="datepicker-widget" id="datepicker-widget" >
                                                <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#datepicker-widget">
                                                <i class="fa fa-calendar"></i>
                                            </span>
                                            </div>
                                            <div id="bookingBoxdatepicker-widget" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker-widget").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        onSelect: function (date) {
                                                            document.getElementById('iddateplanning').value = date;
                                                        },
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepicker-widget').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                </script>
                                            {/literal}
                                            <input type="hidden" id="iddateplanning" name="datedebutrech">
                                        </div>
                                        <div class="col-sm-12 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Motif de rendez vous</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper" id="modalSelectTypeRDV">
                                                <select  name="rdv" id="selecttyperdv" style="width:100%!important;">
                                                    <option value="">Indifférent</option>
                                                    {foreach from=$aTableaurdv item=objRDV}
                                                        <option value="{$objRDV.id_type_rdv}">{$objRDV.libelle_type_rdv}</option>
                                                    {/foreach}
                                                </select>
                                                {literal}
                                                    <script>
                                                        $(document).ready(function () {
                                                            $('#selecttyperdv').select2({
                                                                dropdownParent: $('#modalSelectTypeRDV')
                                                            });
                                                        });
                                                    </script>
                                                {/literal}
                                            </div>
                                        </div>

                                        <div class="col-md-12 controls">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Le lieu</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper" id="modalSelectLieu">
                                                <select name="idlieu" id="selectlieux" style="width:100%!important;">
                                                    <option value="">Indifférent</option>
                                                    {foreach from=$aTableauLieux item=objLieu}
                                                        <option value="{$objLieu.id_lieux}">{$objLieu.nom_lieux}</option>
                                                    {/foreach}
                                                </select>
                                                {literal}
                                                    <script>
                                                        $(document).ready(function () {
                                                            $('#selectlieux').select2({
                                                                dropdownParent: $('#modalSelectLieu')
                                                            });
                                                        });
                                                    </script>
                                                {/literal}
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-2"></div>
                                </div>
                            </div>
                            <div class="col-sm-12" align="center">
                                <button type="button" id="btn_modal_filtre_praticien" name="btn_modal_filtre_praticien" class="btn vd_btn vd_bg-blue vd_white">Afficher</button>&nbsp;&nbsp;
                                <a href="#" onclick="$('#myModalfiltremedecin').modal('hide');">Annuler</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="myModalfiltrrdv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabelfiltre">Critères du prochain RDV disponible</h4>
                </div>
                <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                    <div id="divattentefiltrerdv" style="display:none;"><div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2>
                            Dans certains cas la recherche des prochains rendez-vous disponibles peut prendre du temps.<br><br></div></div>
                    <div class="alert alert-danger" id="divErreurfiltrerdv" >
                        <span class="vd_alert-icon" style="float: left;margin-right: 20px;margin-top: 2px;font-size: 20px;"><i class="fa fa-exclamation-circle vd_red"></i></span>
                        <div id="MessageErreurFilterRDV">
                            test
                        </div>

                    </div>
                    <div id="divfiltrerdv" class="panel-body" style="padding: 0px 0px 15px 0px;">
                        <form class="form-horizontal" action="" role="form" id="formList" method="GET" >
                            <input type="hidden" value="ok" name='validation' />
                            <input type="hidden" name="dir" value="{$dir}">
                            <input type="hidden" value="{$idc}" id='idc' />
                            <input type="hidden" value="1" id='all' />

                            <div class="col-sm-12" >
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-8">
                                        <div class="col-sm-12 controls" style="visibility: hidden;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Date de début</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Sélectionnez une date de début" value="" name="datepickerrdv-widget" id="datepickerrdv-widget" >
                                                <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#datepickerrdv-widget">
                                                <i class="fa fa-calendar"></i>
                                            </span>
                                            </div>
                                            <div id="bookingBoxdatepickerrdv-widget" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepickerrdv-widget").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        onSelect: function (date) {
                                                            document.getElementById('iddateplanningrdv').value = date;
                                                        },
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdatepickerrdv-widget').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });
                                                </script>
                                            {/literal}
                                            <input type="hidden" id="iddateplanningrdv" name="datedebutrech">
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Quel est le professionnel de santé ?</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                                <select name="rdv" id="selectcatprofession"></select>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Quelle est la spécialité ?</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                                <select name="rdv" id="selectprofession"></select>
                                            </div>
                                        </div>

                                        <div class="col-sm-12" id="selectpraticien2Div">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Quelle est le praticien ?</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                                <select name="rdv" id="selectpraticien2"></select>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Quel est le motif de la consultation ?</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                                <select name="rdv" id="selecttyperdv2"></select>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Quel est le lieu du rendez-vous ?</b>
                                                </label>
                                            </div>
                                            <div class="vd_input-wrapper">
                                                <select name="idlieu" id="selectlieux2"></select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-2"></div>
                                </div>
                            </div>
                            <div class="col-sm-12" align="center">
                                <button type="button"  class="btn vd_btn vd_bg-blue vd_white" name="btn_modal_search_filtre_rdv" id="btn_modal_search_filtre_rdv" >Rechercher</button>&nbsp;&nbsp;
                                <a href="#" onclick="$('#myModalfiltrrdv').modal('hide');">Annuler</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- [DEBUT] Modal enregistrer un rendez-vous  -->
    <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalEnregistrerRendezVous" tabindex="-1" role="dialog" aria-labelledby="LabelmodalEnregistrerRendezVous" aria-hidden="false" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog" >
            <div class="modal-content">
                <div class="modal-header vd_bg-blue vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="LabelmodalEnregistrerRendezVous">Prendre un rendez-vous</h4>
                </div>
                <div class="modal-body">
                    <div id="message_retour_info_enregistrer_rendez_vous" style="margin-top:15px; display: none;"></div>

                    <div id="attente_info_enregistrer_rendez_vous" style="display: none;">
                        <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                    </div>

                    <div id="div_info_enregistrer_rendez_vous" >
                        <div class="col-sm-12" style="padding-top:10px;">

                            <div id="divMessageRemplacant"  class="alert alert-warning" style="display: none;">
                                <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                                <span id="sMessageRemplacant" name="sMessageRemplacant"></span>
                            </div>

                            <div id="divMessageAide"  class="alert alert-warning" style="display: block;">
                                <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                                <span id="sMessageRdvAide" name="sMessageRdvAide"></span>
                            </div>

                            <form class="form-horizontal" action="#" role="form" id="modal_enregistrer_rdv" name="modal_enregistrer_rdv" autocomplete="new-password" >
                                <input type="hidden" name="id_tmp_del" id="id_tmp_del" value="">
                                <div class="form-group" {if $rdv_prive_actif!='Y'}style="display:none;"{/if}>
                                    <div class="col-sm-6 controls">
                                        <div class="label-wrapper-modal">
                                            <label class="control-label">RDV privé :</label>
                                        </div>
                                        <div class="vd_radio radio-success">
                                            <input type="radio" name="prive_prendre_rdv_calendar" value="Y" id="id_prive_prendre_rdv_calendar_oui">
                                            <input type="radio" name="rdv_aide"  id="id_rdv_aide">
                                            <input type="radio" name="planning"  id="id_planning">
                                            <label for="id_prive_prendre_rdv_calendar_oui">Oui</label>
                                            <input type="radio" name="prive_prendre_rdv_calendar" checked="checked" value="N" id="id_prive_prendre_rdv_calendar_non">
                                            <label for="id_prive_prendre_rdv_calendar_non">Non</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group" >
                                    {* Choisir un praticien *}
                                    <div class="col-sm-4 controls" id="modalSelectPraticien">
                                        <select id="id_praticien_prendre_rdv_calendar" name="id_praticien_prendre_rdv_calendar" required {if $bblocageall} disabled{/if} style='width:100%!important'>
                                            <option value="">Choisir un praticien</option>

                                            {foreach from=$tabPraticienPermanent item=objPraticien}
                                                <option value="{$objPraticien.identifiant_user}" >{$objPraticien.abreviation_civilite} {$objPraticien.nom_user} {$objPraticien.prenom_user} ({$objPraticien.nom_profession})</option>
                                            {/foreach}
                                        </select>
                                    </div>

                                    {* Choisir un lieu de RDV *}
                                    <div class="col-sm-4 controls" id="modalSelectLieuRdv">
                                        <select id='id_lieu_prendre_rdv_calendar' name="id_lieu_prendre_rdv_calendar" required {if $bblocageall} disabled{/if} style='width:100%!important'>
                                        </select>

                                        {literal}
                                            <script>
                                                $(document).ready(function () {
                                                    $('#id_lieu_prendre_rdv_calendar').select2({
                                                        dropdownParent: $('#modalSelectLieuRdv')
                                                    });
                                                });
                                            </script>
                                        {/literal}
                                    </div>
                                    {if $bactivservice}
                                        {* Choisir un service/ lieux/ UF de RDV *}
                                        <div class="col-sm-4 controls" id="modalSelectService">
                                            {if $activservicerequire}
                                                <select id='id_service_lieu' name="id_service_lieu" required {if $bblocageall} disabled{/if} style='width:100%!important'>
                                                </select>
                                            {else}
                                                <select id='id_service_lieu' name="id_service_lieu" {if $bblocageall} disabled{/if} style='width:100%!important'>
                                                </select>
                                            {/if}

                                            {literal}
                                                <script>
                                                    $(document).ready(function () {
                                                        $("#id_lieu_prendre_rdv_calendar").change(function () {

                                                            $.ajax({
                                                                url: '../ajax/liste_uniter_fonctionnelle_praticien.php',
                                                                data: {
                                                                    'id_lieu': $(this).val(),
                                                                    'id_praticien_long': $('#id_globalidpraticienlong').val(),
                                                                },
                                                                dataType: 'html',
                                                                success: function (data) {
                                                                    $('#id_service_lieu').html("<option value=''>Choisir l'unité fonctionnelle</option>" + data);
                                                                },
                                                                error: function () {
                                                                    $('#id_service_lieu').html("<option value=''>Aucune unité fonctionnelle</option>");
                                                                }
                                                            });
                                                        });

                                                        $('#id_service_lieu').select2({
                                                            dropdownParent: $('#modalSelectService')
                                                        });
                                                    });
                                                </script>
                                            {/literal}
                                        </div>
                                    {else}
                                        <input type="hidden" id='id_service_lieu' name="id_service_lieu" value="0">

                                    {/if}


                                </div>

                                <div class="form-group" >
                                    {* Choisir un motif de RDV *}
                                    <div class="col-sm-4 controls" id="modalSelectMotif">
                                        <select id="type_rdv_calendar" name="type_rdv_calendar" required onchange="select_tmp(this.value)" {if $bblocageall} disabled{/if} style='width:100%!important'>
                                        </select>
                                    </div>

                                    {literal}
                                        <script>
                                            $(document).ready(function () {
                                                $('#type_rdv_calendar').select2({
                                                    dropdownParent: $('#modalSelectMotif')
                                                });
                                            });
                                        </script>
                                    {/literal}

                                    <div class="col-sm-4 controls">
                                        {if !$bblocageall}
                                            {if !$bblocagetyperdv}
                                                <button type="button" name="btn_plus_rdv_modal_calendar_principal" id="btn_plus_rdv_modal_calendar_principal" class="btn vd_btn vd_bg-green" onclick="if (plus_motif_rdv)
                                  ajout_tout_rdv();plus_motif_rdv = false;"><span class="menu-icon"></span>Plus de motif de RDV</button>&nbsp;&nbsp;
                                            {/if}
                                        {/if}
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-2 controls">
                                        <label class="control-label">Date</label>
                                        <div class="input-group">
                                            <input type="text" id="date_prendre_rdv_calendar" name="date_prendre_rdv_calendar" value="" {if $bblocageall}readonly="readonly"{/if}>
                                            <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#date_prendre_rdv_calendar"><i class="fa fa-calendar"></i></span>
                                        </div>
                                        <div id="bookingBoxdate_prendre_rdv_calendar" style="position: absolute;z-index: 2;"></div>
                                        {if !$bblocageall}
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#date_prendre_rdv_calendar").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        yearRange: "-0:+10",
                                                        beforeShow: function (textbox, instance) {
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top: -20,
                                                                left: 5
                                                            });
                                                            $('#bookingBoxdate_prendre_rdv_calendar').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
                                                    });
                                                    $('[data-datepicker]').click(function (e) {
                                                        var data = $(this).data('datepicker');
                                                        $(data).focus();
                                                    });
                                                });
                                            </script>
                                        {/literal}
                                        {/if}
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label">Heure patient</label>
                                        <div class="input-group bootstrap-timepicker" id="groupe_heure_patient_prendre_rdv_calendar">
                                            <input class="input-modal-date-left" type="text" id="heure_patient_prendre_rdv_calendar" name="heure_patient_prendre_rdv_calendar" value="" {if $bblocageall}readonly="readonly"{/if}>
                                            <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function () {
                                                    $("#groupe_heure_patient_prendre_rdv_calendar").clockpicker({
                                                        placement: 'bottom',
                                                        autoclose: true
                                                    });
                                                    $("#groupe_heure_patient_prendre_rdv_calendar").mask("99:99");
                                                });

                                            </script>
                                        {/literal}
                                    </div>
                                    <div class="col-sm-2 controls">
                                        <label class="control-label">Heure réelle</label>
                                        <div class="input-group bootstrap-timepicker" id="groupe_heure_reelle_prendre_rdv_calendar">
                                            <input class="input-modal-date-left" type="text" id="heure_reelle_prendre_rdv_calendar" name="heure_reelle_prendre_rdv_calendar" value="" {if $bblocageall}readonly="readonly"{/if}>
                                            <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                            {literal}
                                                <script type="text/javascript">
                                                    $(document).ready(function () {
                                                        $("#groupe_heure_reelle_prendre_rdv_calendar").clockpicker({
                                                            placement: 'bottom',
                                                            autoclose: true
                                                        });
                                                        $("#groupe_heure_reelle_prendre_rdv_calendar").mask("99:99");
                                                    });

                                                </script>
                                            {/literal}
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="control-label">Durée&nbsp; (en min.)</label>
                                        <div class="controls">
                                            <input name="temps_consultation_calendar" id="temps_consultation_calendar" type="number" value="" min="0" max="720" {if $boplus or $bblocageall}readonly="readonly"{/if}>

                                        </div>
                                    </div>

                                    {if !$bismoduleexterne}
                                        <div class="col-sm-3">
                                            <div class="label-wrapper-modal">
                                                <label class="control-label" style="color:black;">Définir un RDV récurrent :</label>
                                            </div>
                                            <div class="controls">
                                                <select id="recurrent_prendre_rdv_calendar">
                                                    <option value="N" selected>Non</option>
                                                    <option value="Y">Oui</option>
                                                </select>
                                            </div>
                                        </div>
                                    {/if}


                                </div>
                                <div class="form-group" id="div_teleconsult_prendre_rdv_calendar">
                                    <div class="col-sm-6 controls">
                                        <div class="label-wrapper-modal" style="float: left;">
                                            <label class="control-label">RDV en Téléconsultation :</label>
                                        </div>
                                        <div class="controls" id="modalSelectTeleconsultation">
                                            <select id="teleconsult_prendre_rdv_calendar" name="teleconsult_prendre_rdv_calendar" style='width:100%!important'>
                                                <option value="Y">Oui</option>
                                                <option value="N" selected>Non</option>
                                            </select>
                                            {literal}
                                                <script>
                                                    $(document).ready(function () {
                                                        $('#teleconsult_prendre_rdv_calendar').select2({
                                                            dropdownParent: $('#modalSelectTeleconsultation')
                                                        });
                                                    });
                                                </script>
                                            {/literal}
                                        </div>
                                    </div>

                                    <div class="col-sm-6 controls" id="div_montant_teleconsult_prendre_rdv_calendar" style="display: none">
                                        <div class="label-wrapper-modal" >
                                            <label class="control-label">Montant de la téléconsultation :</label>
                                        </div>
                                        <div class="input-group">
                                            <input type="text" id="montant_teleconsult_prendre_rdv_calendar" name="montant_teleconsult_prendre_rdv_calendar" >
                                            <span class="input-group-addon">€</span>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div id="div_info_patient_historique_complet">
                                    <div class="form-group" style="margin-bottom: 5px;">
                                        <div class="col-sm-12 controls" >
                                            <div class="col-sm-8" style="padding-left: 0px;">
                                                <div class="col-sm-6">
                                                    <h3><a href="javascript:void(0);" onclick="reduire_div_information_patient();"><i class="fa fa-chevron-circle-down"></i>&nbsp;</a> Informations du patient </h3>
                                                </div>
                                                <div class="col-sm-6 controls" style="display:none;" id="div_reinit_calendar">
                                                    <a href="#" onclick="debloque_modification_patient_modal_prendre_rendez_vous_calendar();
                                  return false;"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinitialise_modal_prendre_rendez_vous_calendar_switch_patient();
                                          return false;" ><i class="fa fa-refresh"></i> Changer de patient</a>
                                                    {* <a href="#" onclick="debloque_modification_patient_modal_prendre_rendez_vous_calendar();return false;"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinitialise_modal_prendre_rendez_vous_calendar();return false;" ><i class="fa fa-refresh"> Réinitialiser</a> *}
                                                </div>

                                            </div>
                                            <div class="col-sm-4" style="padding-right: 0px;" id="div_title_historique">
                                                <h3>Historique des RDV</h3>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12 controls" id="divtempcheckpatient_calendar" style="display:none;"></div>
                                        <div class="col-sm-12 controls" id="divenregpatient_calendar">


                                            <div class="form-group" style="margin-bottom: 5px;">
                                            </div>
                                            <div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;" id="div_info_patient_historique">
                                                <div class="col-sm-8" style="padding-left: 0px;">
                                                    <div class="form-group groupAlignFlex">
                                                        <div class="col-sm-4 controls">
                                                            {* <div class="col-sm-3 controls"> *}
                                                            <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                                <select id="civilite_patient_prendre_rdv_calendar" name="civilite_patient_prendre_rdv_calendar" required class="required" style="border-color: red;">
                                                                    <option value="" disabled selected hidden>Civilité</option>
                                                                    {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                                        <option value="{$tabLC.id_civilite}">{$tabLC.abreviation_civilite}</option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 controls">
                                                            <input type="text" placeholder="Nom" name="nom_patient_prendre_rdv_calendar"  autocomplete="new-password" id="nom_patient_prendre_rdv_calendar" value="" required style="border-color: red;" class="required input-majuscule input-widget" autocomplete="new-password" />

                                                            {literal}
                                                                <!-- Script pour l'auto-completion -->
                                                                <script type="text/javascript" >
                                                                    $("#nom_patient_prendre_rdv_calendar").autocomplete({
                                                                        source: 'ajax/recherche_fiche_patient_auto_complete.php?nouveaupatient=ok',
                                                                        focus: function (event, ui) {
                                                                            event.preventDefault();
                                                                        },
                                                                        select: function (event, ui) {
                                                                            event.preventDefault();
                                                                            getInfoPatientModalPrendreRDVCalendar(ui.item.value);
                                                                        },
                                                                        appendTo: "#modalEnregistrerRendezVous"
                                                                    });
                                                                </script>
                                                            {/literal}
                                                        </div>
                                                        
                                                        <div class="controls arrowSwitchButton" id="arrow_switch_names">
                                                            <img src="img/switch.png"/>
                                                        </div>

                                                        <div class="col-sm-4 controls">
                                                            <input type="text" placeholder="Prénom" name="prenom_patient_prendre_rdv_calendar"  autocomplete="new-password" id="prenom_patient_prendre_rdv_calendar" value="" required style="border-color: red;" class="required input-first-letter input-widget" autocomplete="new-password" />
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls" id='divnomjeunefille_patient_prendre_rdv_calendar'>
                                                            <input type="text" placeholder="Nom de naissance " name="nom_jeune_fille_patient_prendre_rdv_calendar" autocomplete="new-password" id="nom_jeune_fille_patient_prendre_rdv_calendar" value="" class="input-majuscule input-widget" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls" id="myModalAdresse">
                                                            <input type="text" placeholder="Adresse" name="adresse_patient_prendre_rdv_calendar" autocomplete="new-password" id="adresse_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Code postal" name="code_postal_patient_prendre_rdv_calendar" autocomplete="new-password" id="code_postal_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-6 controls" id="myModalVille">
                                                            <select placeholder="Ville " id="ville_patient_prendre_rdv_calendar" name="ville_patient_prendre_rdv_calendar" autocomplete="new-password"  class="input-majuscule input-widget"></select>
                                                            {* <input type="text" placeholder="Ville" name="ville_patient_prendre_rdv_calendar" autocomplete="new-password" id="ville_patient_prendre_rdv_calendar" value="" class="input-majuscule input-widget" /> *}
                                                        </div>
                                                        {literal}
                                                            <script type="text/javascript">
                                                                // In your Javascript (external .js resource or <script> tag)
                                                                $(document).ready(function() {
                                                                    $('#ville_patient_prendre_rdv_calendar').select2({
                                                                        placeholder: 'Ville',
                                                                        dropdownParent: $('#myModalVille')
                                                                    });
                                                                });

                                                            </script>
                                                        {/literal}
                                                    </div>

                                                    <div class="form-group groupAlignFlex">
                                                        <div class="col-sm-6 controls">
                                                            <input type="hidden" name="tel_mobile_patient_prendre_rdv_calendar_indicatif" id="tel_mobile_patient_prendre_rdv_calendar_indicatif" value="">
                                                            <input type="text" placeholder="Téléphone mobile" name="tel_mobile_patient_prendre_rdv_calendar" autocomplete="new-password" id="tel_mobile_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                            {literal}
                                                            <script type="text/javascript">

                                                                $(document).ready(function () {
                                                                    $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput({
                                                                        preferredCountries: ["fr", "be", "ch"],
                                                                        initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                        utilsScript: "js/utils.js"
                                                                    });
                                                                    $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                                                    var countryDataInit = $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").intlTelInput("getSelectedCountryData");
                                                                    $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").val(countryDataInit.dialCode);

                                                                    $("#tel_mobile_patient_prendre_rdv_calendar").on("keyup change", function () {
                                                                        var countryData = $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                                                        $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").val(countryData.dialCode);
                                                                    });

                                                                    $("#tel_mobile_patient_prendre_rdv_calendar").on("countrychange", function (e, countryData) {
                                                                        var idpays = countryData.iso2;
                                                                        if (idpays === "fr") {
                                                                            $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                                                        } else if (idpays === "ch") {
                                                                            $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("999 999 99 99");
                                                                        }
                                                                    });
                                                                });
                                                            </script>
                                                            {/literal}
                                                        </div>
                                                        <div class="controls arrowSwitchButton" id="arrow_switch_phones">
                                                            <img src="img/switch.png"/>
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="hidden" name="tel_fixe_patient_prendre_rdv_calendar_indicatif" id="tel_fixe_patient_prendre_rdv_calendar_indicatif" value="">
                                                            <input type="text" placeholder="Téléphone fixe" name="tel_fixe_patient_prendre_rdv_calendar" autocomplete="new-password" id="tel_fixe_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                            {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput({
                                                                        preferredCountries: ["fr", "be", "ch"],
                                                                        initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                        utilsScript: "js/utils.js"
                                                                    });
                                                                    $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                                                    var countryDataInit = $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                                                    $("#tel_fixe_patient_prendre_rdv_calendar_indicatif").val(countryDataInit.dialCode);

                                                                    $("#tel_fixe_patient_prendre_rdv_calendar").on("keyup change", function () {
                                                                        var countryData = $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                                                        $("#tel_fixe_patient_prendre_rdv_calendar_indicatif").val(countryData.dialCode);
                                                                    });

                                                                    $("#tel_fixe_patient_prendre_rdv_calendar").on("countrychange", function (e, countryData) {
                                                                        var idpays = countryData.iso2;
                                                                        if (idpays === "fr") {
                                                                            $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                                                        } else if (idpays === "ch") {
                                                                            $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("999 999 99 99");
                                                                        }
                                                                    });
                                                                });
                                                            </script>
                                                            {/literal}
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <input type="email" placeholder="Email" name="email_patient_prendre_rdv_calendar" autocomplete="new-password" id="email_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-4 controls">
                                                            <div class="input-group">
                                                                <input type="text" placeholder="Date de naissance" name="date_naissance_patient_prendre_rdv_calendar" autocomplete="new-password" id="date_naissance_patient_prendre_rdv_calendar" value="" class="required input-widget-date-left" required style="border-color: red;">
                                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#date_naissance_patient_prendre_rdv_calendar">
                                                                <i class="fa fa-calendar"></i>
                                                            </span>
                                                            </div>
                                                            <div id="bookingBoxdate_naissance_patient_prendre_rdv_calendar" style="position: absolute;z-index: 1;"></div>
                                                        </div>
                                                        {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {
                                                                    $("#date_naissance_patient_prendre_rdv_calendar").datepicker({
                                                                        dateFormat: 'dd/mm/yy',
                                                                        changeMonth: true,
                                                                        changeYear: true,
                                                                        yearRange: "-100:+0",
                                                                        beforeShow: function (textbox, instance) {
                                                                            $('#ui-datepicker-div').css({
                                                                                position: 'initial',
                                                                                top: -20,
                                                                                left: 5
                                                                            });
                                                                            $('#bookingBoxdate_naissance_patient_prendre_rdv_calendar').append($('#ui-datepicker-div'));
                                                                            $('#ui-datepicker-div').hide();
                                                                        }
                                                                    });
                                                                    $('[data-datepicker]').click(function (e) {
                                                                        var data = $(this).data('datepicker');
                                                                        $(data).focus();
                                                                    });
                                                                });
                                                            </script>
                                                        {/literal}
                                                        <div class="col-sm-4 controls">
                                                            <input type="text" onkeyup="checkInsee(this);" placeholder="N° de sécurité sociale" autocomplete="new-password" name="num_secu_patient_prendre_rdv_calendar" id="num_secu_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-4 controls">
                                                            <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                                <select placeholder="Assurance maladie" id="assurance_patient_prendre_rdv_calendar" name="assurance_patient_prendre_rdv_calendar">
                                                                    <option value="">Assurance</option>
                                                                    {foreach from=$TabAssurance item=objAssurance}
                                                                        <option value="{$objAssurance.id_assurance_maladie}">{$objAssurance.libelle_assurance_maladie}</option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Médecin traitant" name="medecin_traitant_patient_prendre_rdv_calendar" autocomplete="new-password" id="medecin_traitant_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Ville du médecin" name="ville_medecin_patient_prendre_rdv_calendar" autocomplete="new-password" id="ville_medecin_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <div class="input-group">
                                                                <select id="couleur_patient_prendre_rdv_calendar">
                                                                    <option value="">Couleur du patient</option>
                                                                    <option value="008000" style="color:#FFFFFF; background-color: #008000">Vert</option>
                                                                    <option value="FF8D01" style="color:#FFFFFF; background-color: #FF8D01">Orange</option>
                                                                    <option value="FF0000" style="color:#FFFFFF; background-color: #FF0000">Rouge</option>
                                                                </select>
                                                                <span id="cadre_couleur_patient_prendre_rdv_calendar" class="input-group-addon color-input"><i class="fa fa-square"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Profession" name="profession_patient_prendre_rdv_calendar" id="profession_patient_prendre_rdv_calendar" value="" class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <textarea placeholder="Remarque" name="remarque_patient_prendre_rdv_calendar" id="remarque_patient_prendre_rdv_calendar" class="input-widget" ></textarea>
                                                        </div>
                                                    </div>


                                                    {* {if !$bismoduleexterne}
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <div class="label-wrapper-modal" style="float: left;">
                                                                <label class="control-label">Définir un RDV récurrent :</label>
                                                            </div>
                                                            <div class="controls" style="margin-left:10px;float: left;">
                                                                <select id="recurrent_prendre_rdv_calendar">
                                                                    <option value="N" selected>Non</option>
                                                                    <option value="Y">Oui</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                {/if} *}
                                                </div>
                                                <div class="col-sm-4" style="padding-right: 0px;padding-left: 0px;">
                                                    <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                                        <div id="attente_historique_patient_prendre_rdv_calendar" style="display: none;">
                                                            <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                                        </div>
                                                        <div id='pas_historique_patient_prendre_rdv_calendar' style="display: none;">
                                                            <div class="alert alert-info">
                                                                <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                                                Aucun historique disponible
                                                            </div>
                                                        </div>
                                                        <div id='historique_patient_prendre_rdv_calendar' style="display: none;">
                                                            <div id="menu_historique_patient" class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                                                <a href="javascript:void(0);" data-filter=".patienttraite">
                                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:lime;height:45px;">
                                                                        <b id="libelle_rdv_traite" title="Patient traité" style="vertical-align: -webkit-baseline-middle;">Tr.</b>
                                                                    </div>
                                                                </a>
                                                                <a href="javascript:void(0);" data-filter=".rdvplanifie">
                                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:#27a1c2;height:45px;">
                                                                        <b id="libelle_rdv_planifie" title="Rendez-vous planifié" style="vertical-align: -webkit-baseline-middle;">Pl.</b>
                                                                    </div>
                                                                </a>
                                                                <a href="javascript:void(0);" data-filter=".absenceexcusee">
                                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:orange;height:45px;">
                                                                        <b id="libelle_rdv_ab_excusee" title="Absence Excusée" style="vertical-align: -webkit-baseline-middle;">Abs. Ex.</b>
                                                                    </div>
                                                                </a>
                                                                <a href="javascript:void(0);" data-filter=".absencenonexcusee">
                                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:red;height:45px;">
                                                                        <b id="libelle_rdv_ab_non_excusee" title="Absence Non Excusée" style="">Abs. Non Ex.</b>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="col-sm-12" id="boucle_historique_prendre_rdv_calendar" style="padding-right: 0px; padding-left: 0px;max-height: 450px;overflow: auto;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" id="div_recurrence_perso" style="display: none;">
                                            <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                    <h1>Récurrence personnalisée</h1>

                                                    <div id="div_repete_toutes_les" class="col-sm-12 controls">
                                                        <label class="control-label" style="float: left;"><b>Répéter tou(te)s les </b></label>
                                                        <div class="controls" style="margin-left:10px;float: left;">
                                                            <input type="number" name="recurrent_nb_repete_prendre_rdv_calendar" id="recurrent_nb_repete_prendre_rdv_calendar" min="1" value="1">
                                                        </div>
                                                        <div class="controls" style="margin-left:10px;float: left;">
                                                            <select id="recurrent_select_repete_prendre_rdv_calendar">
                                                                <option value="jour">Jour</option>
                                                                <option value="semaine" selected >Semaine</option>
                                                                <option value="mois">Mois</option>
                                                                <option value="annee">Année</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div id="div_repete_le" class="col-sm-12 controls">
                                                        <label class="control-label"><b>Répéter le</b></label>
                                                        <div>
                                                            <div class="vd_radio radio-success">
                                                                <input id="checkbox-Lundi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="1">
                                                                <label for="checkbox-Lundi"> Lundi </label>

                                                                <input id="checkbox-Mardi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="2">
                                                                <label for="checkbox-Mardi"> Mardi </label>

                                                                <input id="checkbox-Mercredi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="3">
                                                                <label for="checkbox-Mercredi"> Mercredi </label>

                                                                <input id="checkbox-Jeudi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="4">
                                                                <label for="checkbox-Jeudi"> Jeudi </label>

                                                                <input id="checkbox-Vendredi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="5">
                                                                <label for="checkbox-Vendredi"> Vendredi </label>

                                                                <input id="checkbox-Samedi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="6">
                                                                <label for="checkbox-Samedi"> Samedi </label>

                                                                <input id="checkbox-Dimanche" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="7">
                                                                <label for="checkbox-Dimanche"> Dimanche </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="div_repete_se_termine" class="col-sm-12 controls">
                                                        <label class="control-label"><b>Se termine</b></label>
                                                        <div>
                                                            {*<div class="vd_radio radio-success">
                                                        <input type="radio" name="recurrent_termine_prendre_rdv_calendar" checked="checked" value="jamais" id="id_recurrent_termine_prendre_rdv_calendar_jamais">
                                                        <label for="id_recurrent_termine_prendre_rdv_calendar_jamais">Jamais</label>
                                                        </div>*}
                                                            <div class="vd_radio radio-success" style="margin-top: 5px;">
                                                                <input type="radio" name="recurrent_termine_prendre_rdv_calendar" value="le" id="id_recurrent_termine_prendre_rdv_calendar_le" style="float: left;">
                                                                <label for="id_recurrent_termine_prendre_rdv_calendar_le" style="float: left;">Le</label>
                                                                <div class="col-sm-4 input-group">
                                                                    <input type="text" placeholder="" name="reccurent_date_fin_patient_prendre_rdv_calendar" id="reccurent_date_fin_patient_prendre_rdv_calendar" value="" class="input-widget-date-left">
                                                                    <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#reccurent_date_fin_patient_prendre_rdv_calendar"><i class="fa fa-calendar"></i></span>
                                                                </div>
                                                                <div id="bookingBoxreccurent_date_fin_patient_prendre_rdv_calendar" style="position: absolute;z-index: 1;"></div>
                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        $(document).ready(function () {
                                                                            $("#reccurent_date_fin_patient_prendre_rdv_calendar").datepicker({
                                                                                dateFormat: 'dd/mm/yy',
                                                                                changeMonth: true,
                                                                                changeYear: true,
                                                                                beforeShow: function (textbox, instance) {
                                                                                    $('#ui-datepicker-div').css({
                                                                                        position: 'initial',
                                                                                        top: -20,
                                                                                        left: 5
                                                                                    });
                                                                                    $('#bookingBoxreccurent_date_fin_patient_prendre_rdv_calendar').append($('#ui-datepicker-div'));
                                                                                    $('#ui-datepicker-div').hide();
                                                                                }
                                                                            });
                                                                            $('[data-datepicker]').click(function (e) {
                                                                                var data = $(this).data('datepicker');
                                                                                $(data).focus();
                                                                            });
                                                                        });
                                                                    </script>
                                                                {/literal}
                                                            </div>
                                                            <div class="vd_radio radio-success" style="margin-top: 5px;">
                                                                <input type="radio" name="recurrent_termine_prendre_rdv_calendar" checked="checked" value="apres" id="id_recurrent_termine_prendre_rdv_calendar_apres">
                                                                <label for="id_recurrent_termine_prendre_rdv_calendar_apres" style="float: left;">Après</label>
                                                                <div class="controls" style="margin-left:10px;float: left;">
                                                                    <input type="number" name="recurrent_occurence_prendre_rdv_calendar" id="recurrent_occurence_prendre_rdv_calendar" min="2" value="2">
                                                                </div>
                                                                <div class="controls" style="margin-left:10px;float: left;"> occurence(s)</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 controls" style="margin-top: 10px;">
                                                        <div class="label-wrapper-modal" style="float: left;">
                                                            <label class="control-label">Forcer les rdv :</label>
                                                        </div>
                                                        <div class="controls" style="margin-left:10px;float: left;">
                                                            <select id="recurrent_forcer_rdv_calendar">
                                                                <option value="N" selected>Non</option>
                                                                <option value="Y">Oui</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div id="div_btn_generer_rdv_recurrent" class="col-sm-12 controls" style="text-align: center;">
                                                        <button id="btn_generer_rdv_recurrent" name="btn_generer_rdv_recurrent" type="button" class="btn vd_btn btn_widget_standard">Générer les rdv récurrents <span class="menu-icon"><i class="fa fa-fw fa-refresh"></i></span></button>
                                                    </div>
                                                    <div id="div_liste_rdv_generer" class="col-sm-12 controls" style="margin-bottom: 25px;text-align: center;padding-top: 20px;">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12" align="center" id="div_button_update_patient_calendar" style="display:none;">
                                            <hr style="border-top: 1px solid #b9b3b3;">
                                            <div class="col-sm-12 controls" align="center">
                                                <button type="button" onclick="modification_patient_modal_prendre_rendez_vous_calendar();" name="updateButtonPatient_prendre_rdv_calendar" id="updateButtonPatient_prendre_rdv_calendar" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier</button>
                                                <button type="button" id="btn_annuler_patient_enregistrer_rendez_vous" name="btn_annuler_patient_enregistrer_rendez_vous" onclick="getInfoPatientModalPrendreRDVCalendar($('#id_patient_prendre_rdv_calendar').val());" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Annuler</button>
                                            </div>
                                        </div>

                                        <div class="col-sm-12" align="center" id="div_button_suivant_calendar">
                                            <hr style="border-top: 1px solid #b9b3b3;">
                                            <button type="submit" id="btn_check_patient_prendre_rdv_calendar" name="btn_check_patient_prendre_rdv_calendar" class="btn vd_btn btn_widget_standard"><span class="menu-icon">Valider<i class="fa fa-fw fa-chevron-circle-right"></i></span></button>&nbsp;&nbsp;
                                            <button id="btn_check_patient_prendre_rdv_print_calendar" name="btn_check_patient_prendre_rdv_print_calendar" type="submit" class="btn vd_btn btn_widget_standard">Valider et Imprimer <span class="menu-icon"><i class="fa fa-fw fa-print"></i></span></button>&nbsp;&nbsp;
                                            <button type="button" id="btn_fermer_enregistrer_rendez_vous" name="btn_fermer_enregistrer_rendez_vous" onclick="$('#modalEnregistrerRendezVous').modal('hide');" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Annuler</button>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>






        {literal}
        <script type="text/javascript">

            var tableau_data = new Array();
            var tableau_autre = new Array();
            var plus_motif_rdv = true;

            var button_valid_and_print_calendar = "";





            function launch_getSalleAttente() {
                setInterval(function () {
                    getSalleAttente();
                }, 60000);
            }

            function setTimeline(mycalendar, view) {
                var curTime = new Date();

                if (curTime.getHours() == 0 && curTime.getMinutes() <= 5) // Because I am calling this function every 5 minutes
                {// the day has changed
                    var todayElem = $(".fc-today");
                    todayElem.removeClass("fc-today");
                    todayElem.removeClass("fc-state-highlight");

                    todayElem.next().addClass("fc-today");
                    todayElem.next().addClass("fc-state-highlight");
                }

                var parentDiv = $('.fc-slats:visible').parent();
                var timeline = parentDiv.children(".timeline");
                if (timeline.length == 0) { //if timeline isn't there, add it
                    timeline = $("<hr>").addClass("timeline");
                    parentDiv.prepend(timeline);
                }

                //var curCalView = $(mycalendar).fullCalendar('getView');
                var curCalView = view;

                if (curCalView.intervalStart < curTime && curCalView.intervalEnd > curTime) {
                    timeline.show();
                } else {
                    timeline.hide();
                    return;
                }

                var calMinTimeInMinutes = strTimeToMinutes(curCalView.opt("minTime"));
                var calMaxTimeInMinutes = strTimeToMinutes(curCalView.opt("maxTime"));
                var curSeconds = ((((curTime.getHours() * 60) + curTime.getMinutes()) - calMinTimeInMinutes) * 60) + curTime.getSeconds();
                var percentOfDay = curSeconds / ((calMaxTimeInMinutes - calMinTimeInMinutes) * 60);
                //alert(curCalView.intervalStart);
                //alert(calMinTimeInMinutes);
                var topLoc = Math.floor(parentDiv.height() * percentOfDay);
                var timeCol = $('.fc-time:visible');
                var infoCol = $('.fc-widget-content:visible');
                timeline.css("top", topLoc + "px");
                timeline.css("left", (timeCol.outerWidth(true)) + "px");
                //alert($('.fc-time-grid').outerWidth());
                //alert(infoCol.outerWidth());
                timeline.css("width", (infoCol.outerWidth() - (timeCol.outerWidth(true))) + "px");


                if (curCalView.name == "agendaWeek") { //week view, don't want the timeline to go the whole way across
                    var dayCol = $(".fc-today:visible");

                    if (dayCol.position() != null)
                    {
                        var left = dayCol.position().left + 1;
                        var width = dayCol.width() + 1;
                        timeline.css("left", left + "px");
                        timeline.css("width", width + "px");
                    }
                }
            }

            function strTimeToMinutes(str_time) {
                var arr_time = str_time.split(":");
                var hour = parseInt(arr_time[0]);
                var minutes = parseInt(arr_time[1]);
                return((hour * 60) + minutes);
            }

            function aff_divattente(divattente, divacacher) {
                document.getElementById(divacacher).style.display = "none";
                document.getElementById(divattente).style.display = "block";
                return true;
            }


            function pad(n) {
                return (n < 10) ? '0' + n : n;
            }

            function fiche_rdv(idrdv) {
                get_fiche_rendez_vous(idrdv);
                $('#modalFicheRendezVous').modal('show');
                $('#info_rdv_modal_link').click();
            }

            function enreg_planning(nompatient, idrdv, daterdv, heurerdv, idrdv, daterdvfin, heurefin, nomdocteur, iddocteur, idlieu, idtyperdv, jsEvent, idcalendar, identifiant_praticien, idaide, idplanning, nomaide, id_lieu_service) {

                var jour = daterdv.substring(0, 2);
                var mois = daterdv.substring(3, 5) - 1;
                var moisreel = mois + 1;

                var annee = daterdv.substring(6, 10);

                var heures = heurerdv.substring(0, 2);
                var minutes = heurerdv.substring(3, 5);

                //document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nomdocteur;
                //document.getElementById("idladate").value=daterdv;
                //document.getElementById("idheure").value=heurerdv;
                var sidrdv = String(idrdv);
                var dispo = sidrdv.split("-");
                if (dispo.length > 0) {
                    sidrdv = dispo[0];
                    var sid_rdv_temp_del = dispo[1];
                }
                if (sidrdv == 'Nan') {
                    $.ajax({
                        cache: false,
                        url: 'ajax/lock_rdv.php',
                        data: 'idpraticien=' + iddocteur + '&date=' + annee + moisreel + jour + '&heure=' + heures + minutes,
                        dataType: 'json',
                        success: function (json) {
                            $.each(json, function (index, value) {

                                if (value.sucess == 'nop') {
                                    affiche_popup_messageRDV('Information', value.message, 'Oui', 'Non');
                                }
                                //document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV avec le docteur "+nomdocteur+" le "+daterdv;
                                //document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+iddocteur+"&ladate="+daterdv+"&heuredebut="+heurerdv+"&heurefin="+heurefin+"&idlieu="+idlieu+'&idtyperdv='+idtyperdv+"&idcalendar="+idcalendar+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                                //$('#myModalinfordv').modal('show');

                                $('#id_tmp_del').val(sid_rdv_temp_del);
                                get_new_rendez_vous(identifiant_praticien, daterdv, heurerdv, idlieu, idtyperdv, idaide, idplanning, nomaide, id_lieu_service);
                                $('#modalEnregistrerRendezVous').modal('show');
                                $('#nom_patient_prendre_rdv_calendar').focus();
                            });
                        }
                    });

                    //
                } else {
                    get_fiche_rendez_vous(idrdv);
                    $('#modalFicheRendezVous').modal('show');
                    $('#info_rdv_modal_link').click();
                    $('#info_rdv_modal_link').click();
                }
            }

            //PAS SUR D'EN AVOIR ENCORE BESOIN
            function ctrl_dispo_planning(idpraticien,date,heuredebut,lecookie){

                valeurcookie= readookie(lecookie);
                idplanning=0;
                var tabcolle = valeurcookie.split('|');
                $.ajax({
                    cache: false,
                    url: 'ajax/controle_dispo_planning.php',
                    data: 'idpraticien=' + idpraticien + '&daterdv=' + date+ '&heurerdv=' + heuredebut+ '&idrdv=' + tabcolle[0],
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {
                            //idplanning =  value.idplanning;

                            $("#id_planningcopiercouper").val(value.idplanning);
                        });
                    }
                });

                return $("#id_planningcopiercouper").val();
            }

            function enreg_planning_seul(idpraticien, idlieu, idrdv, date, heuredebut, heurefin, actimoduleexterne, idcalendar, identifiant_praticien, idaide, idplanning, nomaide) {

                var dateJour = new Date();
                var numberJour = dateJour.getTime();

                var jour = date.substring(0, 2);
                var mois = date.substring(3, 5) - 1;
                var annee = date.substring(6, 10);

                var heures = heuredebut.substring(0, 2);
                var minutes = heuredebut.substring(3, 5);

                var dateClick = new Date(annee, mois, jour, heures, minutes, "00", "00");
                var dateClick2 = new Date(annee, mois, jour, heures, minutes, "00", "00");
                dateClick.setMinutes(dateClick.getMinutes() + {/literal}{$sTaillecellule}{literal} - 1);
                var numberdateClick = dateClick.getTime();
                var numberdateClick2 = dateClick2.getTime();




                if ($("#bdroitcreerendezvouscalendar").val() === "1") {

                    var moisreel = mois + 1;
                    $.ajax({
                        cache: false,
                        url: 'ajax/lock_rdv.php',
                        data: 'idpraticien=' + idpraticien + '&date=' + annee + moisreel + jour + '&heure=' + heures + minutes,
                        dataType: 'json',
                        success: function (json) {
                            $.each(json, function (index, value) {
                                if (value.sucess == 'nop') {
                                    affiche_popup_message('Information', value.message, 'Oui');
                                }


                                valeurcookiecopier = readookie("rdvcopier");
                                valeurcookiecouper = readookie("rdvcouper");

                                //console.log(valeurcookiecopier+'----'+valeurcookiecouper);

                                if (valeurcookiecouper != null && valeurcookiecouper != "") {
                                    if (numberdateClick2 < numberJour) {
                                        affiche_popup_message('Information', 'Vous ne pouvez pas déplacer un rendez-vous dans le passé.', 'Ok');
                                    }else{
                                        valeurcookie= readookie("rdvcouper");
                                        idplanning=0;
                                        var tabcolle = valeurcookie.split('|');
                                        $.ajax({
                                            cache: false,
                                            url: 'ajax/controle_dispo_planning.php',
                                            data: 'idpraticien=' + idpraticien + '&daterdv=' + date+ '&heurerdv=' + heuredebut+ '&idrdv=' + tabcolle[0],
                                            dataType: 'json',
                                            success: function (json) {
                                                $.each(json, function (index, value) {
                                                    //idplanning =  value.idplanning;
                                                    //console.log('id_rdv '+tabcolle[0])
                                                    //console.log("passe ctrl "+value.idplanning);
                                                    $("#id_planningcopiercouper").val(value.idplanning);
                                                    //idplanning = ctrl_dispo_planning(idpraticien,date,heuredebut,'rdvcouper');
                                                    //console.log("planning : "+idplanning);
                                                    //idplanning =  $("#id_planningcopiercouper").val();

                                                    if(value.idplanning==0){
                                                        sMessageAlert="<br><span style='color:red;font-size:28px'>ATTENTION</span><br><span style='color:red;font-size:22px'> Il n'existe aucune disponibilité pour ce motif sur la période choisie<br>" +
                                                            "<hr style='border-top-color: #e8bdbd;'></span>";
                                                    }else{
                                                        if (value.sMessage != ""){
                                                            sMessageAlert="<br><span style='color:red;font-size:28px'>ATTENTION</span><br><span style='color:red;font-size:22px'> "+value.sMessage+"<br>" +
                                                                "<hr style='border-top-color: #e8bdbd;'></span>";
                                                        }else{
                                                            sMessageAlert="";
                                                        }

                                                    }

                                                    tab = valeurcookiecouper.split('|');
                                                    messagetitle ="Informations sur le rendez-vous "+ tab[1]+" le "+tab[2] + " à " + tab[3] + " avec le docteur " + tab[4];
                                                    $("#LabelmodalComfirmeCouper").html(messagetitle);

                                                    // Message = "Souhaitez-vous déplacer ce rendez-vous " + tab[1] + " le " + tab[2] + " à " + tab[3] + " avec le docteur " + tab[4] + "<br> Le "
                                                    //    + date + " à " + heuredebut + " sur ce calendrier "+sMessageAlert;

                                                    Message = sMessageAlert+"<span style='color:black;font-size:20px'>Souhaitez-vous déplacer ce rendez-vous au "+date + " à " + heuredebut + " sur ce calendrier </span>";
                                                    $("#modal_couper_id_rdv_copie").val(tab[0]);
                                                    $("#modal_couper_date_coller").val(date);
                                                    $("#modal_couper_heure_coller").val(heuredebut);
                                                    $("#modal_couper_id_calendar").val(idpraticien);

                                                    $('#div_confirme_couper').html(Message);
                                                    $('#modalComfirmeCouper').modal('show');

                                                });
                                            }
                                        });

                                    }



                                } else if (valeurcookiecopier != null && valeurcookiecopier != "") {

                                    if (numberdateClick < numberJour) {
                                        affiche_popup_message('Information', 'ATTENTION ! Vous êtes sur le point de créer un rendez-vous dans le passé', 'Ok');
                                    }
                                    sMessageAlert ="";
                                    //idplanning = ctrl_dispo_planning(idpraticien,date,heuredebut,'rdvcopier');
                                    valeurcookie= readookie('rdvcopier');
                                    idplanning=0;
                                    var tabcolle = valeurcookie.split('|');
                                    $.ajax({
                                        cache: false,
                                        url: 'ajax/controle_dispo_planning.php',
                                        data: 'idpraticien=' + idpraticien + '&daterdv=' + date+ '&heurerdv=' + heuredebut+ '&idrdv=' + tabcolle[0],
                                        dataType: 'json',
                                        success: function (json) {
                                            $.each(json, function (index, value) {
                                                //idplanning =  value.idplanning;
                                                //console.log('id_rdv '+tabcolle[0])
                                                //console.log("passe ctrl "+value.idplanning);
                                                $("#id_planningcopiercouper").val(value.idplanning);

                                                tab = valeurcookiecopier.split('|');
                                                //idplanning =  $("#id_planningcopiercouper").val();
                                                //console.log("copier "+value.idplanning);

                                                if(value.idplanning==0 || value.idplanning==""){
                                                    sMessageAlert="<br><span style='color:red;font-size:28px'>ATTENTION</span><br><span style='color:red;font-size:22px'> Il n'existe aucune disponibilité pour ce motif sur la période choisie<br>" +
                                                        "<hr style='border-top-color: #e8bdbd;'></span>";
                                                }else{
                                                    if (value.sMessage != ""){
                                                        sMessageAlert="<br><span style='color:red;font-size:28px'>ATTENTION</span><br><span style='color:red;font-size:22px'> "+value.sMessage+"<br>" +
                                                            "<hr style='border-top-color: #e8bdbd;'></span>";
                                                    }else{
                                                        sMessageAlert="";
                                                    }
                                                }

                                                messagetitle ="Informations sur le rendez-vous "+ tab[1]+" le "+tab[2] + " à " + tab[3] + " avec le docteur " + tab[4]+"";
                                                $("#LabelmodalComfirmeCopier").html(messagetitle);

                                                /* Message = "Copier le RDV de " + tab[1] + " le " + tab[2] + " à " + tab[3] + " avec le docteur " + tab[4] + "<br> Le "
                                                    + date + " à " + heuredebut + " sur ce calendrier";
                                                    */
                                                Message = sMessageAlert+"<span style='color:black;font-size:20px'>Souhaitez-vous copier ce rendez-vous au "+date + " à " + heuredebut + " sur ce calendrier </span>";

                                                $("#modal_copier_id_rdv_copie").val(tab[0]);
                                                $("#modal_copier_date_coller").val(date);
                                                $("#modal_copier_heure_coller").val(heuredebut);
                                                $("#modal_copier_id_calendar").val(idpraticien);

                                                $('#div_confirme_copier').html(Message);
                                                $('#modalComfirmeCopier').modal('show');



                                            });
                                        }
                                    });



                                } else {
                                    if (numberdateClick < numberJour) {
                                        affiche_popup_message('Information', 'ATTENTION ! Vous êtes sur le point de créer un rendez-vous dans le passé', 'Ok');
                                    }
                                    if (typeof identifiant_praticien === 'undefined') {
                                        identifiant_praticien = value.guid_praticien;
                                    }

                                    get_new_rendez_vous(identifiant_praticien, date, heuredebut, idlieu, "", idaide, idplanning, nomaide);

                                    // Sert à mettre par défaut le drapeau et le style de numéro de téléphone du centre lors du formulaire "Informations du patient" //
                                    var aTitreIndicatifTelephone = '{/literal}{$aTitreIndicatifTelephone}{literal}';
                                    $('.selected-flag').removeAttr('title').attr('title', aTitreIndicatifTelephone);
                                    var class_name = $('.selected-flag').children().attr('class').split(' ')[1]
                                    $('.selected-flag').children().removeClass(class_name);
                                    var aIndicatifTelephone = '{/literal}{$aIndicatifTelephone}{literal}';
                                    $('.selected-flag').children().addClass(aIndicatifTelephone);
                                    $('.country').removeClass('highlight active');

                                    $('#modalEnregistrerRendezVous').modal('show');
                                    $("#modalEnregistrerRendezVous").on('shown.bs.modal', function () {
                                        $('#nom_patient_prendre_rdv_calendar').focus();
                                    });
                                    $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                    $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").val('fr');
                                    $("#id_praticien_prendre_rdv_calendar").prop('disabled', true);
                                }
                            });
                        }
                    });

                } else {
                    //alert('Synchronisation avec un module externe activée');
                    affiche_popup_message('Information', ' ATTENTION : Votre paramétrage n\'autorise pas la prise de rendez-vous depuis le calendrier, merci d\'utiliser la fonction "Prendre un rendez-vous"', 'Ok');
                }
            }

            var propositiionfirst="";

            function getDateTime() {
                var now = new Date();
                var year = now.getFullYear();
                var month = now.getMonth() + 1;
                var day = now.getDate();
                var hour = now.getHours();
                var minute = now.getMinutes();
                var second = now.getSeconds();
                if (month.toString().length == 1) {
                    var month = '0' + month;
                }
                if (day.toString().length == 1) {
                    var day = '0' + day;
                }
                if (hour.toString().length == 1) {
                    var hour = '0' + hour;
                }
                if (minute.toString().length == 1) {
                    var minute = '0' + minute;
                }
                if (second.toString().length == 1) {
                    var second = '0' + second;
                }
                var dateTime = day + '/' + month + '/' + year + ' ' + hour + ':' + minute + ':' + second;
                return dateTime;
            }

            function sgetDate(format) {
                var now = new Date();
                var year = now.getFullYear();
                var month = now.getMonth() + 1;
                var day = now.getDate();
                if (month.toString().length == 1) {
                    var month = '0' + month;
                }
                if (day.toString().length == 1) {
                    var day = '0' + day;
                }

                var dateTime;
                if (format == "YYYY-MM-DD") {
                    dateTime = year + '-' + month + '-' + day;
                } else {
                    dateTime = day + '/' + month + '/' + year;
                }

                return dateTime;
            }



            function rafraichir_calendrierNew(idlieu, idpratcien, idrdv, validation, datedebut, firstrdvdispo, reinit, idprofession = 0, force_praticien = false) {
                var iHeure = 0;
                var sidpasselieu = document.getElementById(idlieu).value;
                var sidrdv = document.getElementById(idrdv).value;
                var sdatedebut = document.getElementById(datedebut).value;
                var sdateTemp = document.getElementById(datedebut).value;

                if (force_praticien == true){
                    var praticien = idpratcien;
                    var profession = idprofession;
                }else{
                    var praticien = document.getElementById(idpratcien).value;
                    var profession = document.getElementById(idprofession).value;
                }

                var sdatedebut2;
                var found = false;

                if (reinit == 1) {
                    sidpasselieu = "";
                    sidrdv = "";
                    sdatedebut = "";
                    sdateTemp = "";
                }

                document.getElementById("idpasselieu").value = sidpasselieu;
                document.getElementById("idpasserdv").value = sidrdv;
                document.getElementById("idpassevalidation").value = validation;

                const aPraticien = [];

                if (praticien != 0) {
                    aPraticien.push(praticien);
                } else {
                    var options = document.getElementById(idpratcien).options;
                    for (var i = 0; i < options.length; i++) {
                        if (options[i].value != 0) {
                            aPraticien.push(options[i].value);
                        }

                    }
                }

                if (sdatedebut == "") {
                    sdatedebut = sgetDate();
                    sdatedebut2 = sgetDate("YYYY-MM-DD");
                } else {
                    sdatedebut2 = sdatedebut.substring(6, 10) + "-" + sdatedebut.substring(3, 5) + "-" + sdatedebut.substring(0, 2);
                }
                var MyPraticien = "";
                var MyDate = "";
                if (firstrdvdispo == 1) {
                    $.ajax({
                        url: 'ajax/myfeddfirtsNew.php',
                        data: 'idlieu=' + sidpasselieu + '&identifiant_entite={/literal}{$idc}{literal}&praticien=' + aPraticien + '&validation=' + validation + '&rdv=' + sidrdv + '&date_debut=' + sdatedebut2,
                        dataType: 'json',
                        async: false,
                        success: function (json) {
                            if (Object.keys(json).length != 0) {
                                found = true;
                                $.each(json, function (index, value) {
                                    var sdateTemp1 = moment(value.start).format('DD/MM/YYYY');
                                    var sdateTemp2 = moment(value.start).format('YYYY-MM-DD');
                                    var sdateTemp3 = moment(value.start);
                                    iHeure = parseInt(parseInt(value.heureaffiche.substring(0, 2) + value.heureaffiche.substring(3, 6)))
                                    $('#iddateplanning').val(sdateTemp1);
                                    MyPraticien = value.idpraticien;
                                    MyDate = sdateTemp2;
                                    $('#id_propositionfirst').val(sdateTemp2);
                                    $('#datedebutaff_' + MyPraticien).val(MyDate);
                                    if (MyDate != "" && force_praticien != true) {
                                        localStorage.setItem("datedebutAffiche", MyDate);
                                    }

                                });
                            }

                        }
                    });
                } else {
                    $('#datedebutaff_' + praticien).val(sdatedebut2);
                    $('#calendar_' + praticien).fullCalendar('gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));
                }

                if (found == false) {
                    $('#MessageErreurFilterRDV').text("Aucune disponibilité trouvée.")
                    $('#divErreurfiltrerdv').show();
                    $('#divattentefiltrerdv').hide();
                } else {
                    if ($("#btn_link" + profession).hasClass("collapsed")) {
                        var node = document.getElementById('headingOne' + profession)
                        $(Node).css("display", "block");
                        $("#headingOne" + profession).css("display", "inline-flex");
                        //$("#collapseOne"+ profession).addClass("in");
                        $("#collapseOne" + profession).collapse('show');
                        $("#vd_checkboxTous" + profession).css("display", "block");
                        var NodeForPraticien = document.getElementById("collapseOne" + profession);
                        $("#collapseOne" + profession).css("height", "unset");
                        $("#btn_link" + profession).removeClass("collapsed");
                        var childNode = NodeForPraticien.getElementsByClassName('mySearchChild');
                        for (j = 0; j < childNode.length; j++) {
                            idPraticien2 = $(childNode[j]).attr('att');
                            $(".box" + idPraticien2).css("display", "block");
                            $(".enumerationPraticien" + idPraticien2).css("display", "block");
                            $(".editRDV" + idPraticien2).css("display", "block");
                        }
                    }



                    $('#myModalfiltrrdv').modal('hide');
                    $('#btn_interpro_rdv').css('display', 'block');
                    if (force_praticien != true){
                        $('#tabtest' + MyPraticien).click();
                        localStorage.removeItem("datedebutAffiche");
                    }

                    if (MyDate == "") {
                        $('#calendar_' + MyPraticien).fullCalendar('refetchEvents');
                    }

                    if (iHeure < 800) {
                        window.scroll(0, 0);
                    } else {
                        window.scroll(0, (iHeure - 800) * 2.4);
                    }
                }

            }

            function rafraichir_calendrier(idlieu, idpratcien, idrdv, validation, datedebut, firstrdvdispo, reinit) {
                var sidpasselieu = document.getElementById(idlieu).value;
                var sidrdv = document.getElementById(idrdv).value;
                var sdatedebut = document.getElementById(datedebut).value;
                var sdateTemp = document.getElementById(datedebut).value;
                var sdatedebut2;

                if (reinit == 1) {
                    sidpasselieu = "";
                    sidrdv = "";
                    sdatedebut = "";
                    sdateTemp = "";
                }

                document.getElementById("idpasselieu").value = sidpasselieu;
                document.getElementById("idpasserdv").value = sidrdv;
                document.getElementById("idpassevalidation").value = validation;

                {/literal}



                {foreach from=$tabPraticien item=objetPraticien name=sTabPraticien}{literal}

                if (sdatedebut == "") {
                    sdatedebut = sgetDate();
                    sdatedebut2 = sgetDate("YYYY-MM-DD");
                } else {
                    sdatedebut2 = sdatedebut.substring(6, 10) + "-" + sdatedebut.substring(3, 5) + "-" + sdatedebut.substring(0, 2);
                }

                if (firstrdvdispo == 1) {
                    $.ajax({
                        url: 'ajax/myfeddfirts.php',
                        data: 'idlieu=' + sidpasselieu + '&identifiant_entite={/literal}{$idc}{literal}&praticien=' +{/literal}{$objetPraticien.id_user}{literal} + '&validation=' + validation + '&rdv=' + sidrdv + '&date_debut=' + sdatedebut2,
                        dataType: 'json',
                        async: false,
                        success: function (json) {
                            if (Object.keys(json).length != 0) {
                                $.each(json, function (index, value) {
                                    var sdateTemp1 = moment(value.start).format('DD/MM/YYYY');
                                    var sdateTemp2 = moment(value.start).format('YYYY-MM-DD');

                                    $('#datedebutaff_{/literal}{$objetPraticien.id_user}{literal}').val(sdateTemp2);
                                    $('#calendar_{/literal}{$objetPraticien.id_user}{literal}').fullCalendar('gotoDate', moment(sdateTemp1, 'YYYY-MM-DD'));

                                });
                            } else {
                                if ($('#tabactive').val() == {/literal}{$objetPraticien.id_user}{literal}) {
                                    affiche_popup_message("Désolé...", "Aucune disponibilité trouvée!", "Ok");
                                }

                            }

                        }
                    });
                } else {
                    $('#datedebutaff_{/literal}{$objetPraticien.id_user}{literal}').val(sdatedebut2);
                    //console.log('#calendar_{/literal}{$objetPraticien.id_user}{literal}');
                    //console.log(moment(sdatedebut, 'DD/MM/YYYY'));
                    $('#calendar_{/literal}{$objetPraticien.id_user}{literal}').fullCalendar('gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));
                }

                //if(document.getElementById('first_'+{/literal}{$objetPraticien.id_user}{literal}).value =="0"){
                // console.log('refetchEvents');
                $('#calendar_' +{/literal}{$objetPraticien.id_user}{literal}).fullCalendar('refetchEvents');
                //}
                {/literal}{/foreach}{literal}
            }

            function retourProchainRDV() {
                document.getElementById("idpasselieu").value = "";
                document.getElementById("idpasserdv").value = "";
                document.getElementById("idpassevalidation").value = "";
                document.getElementById("id_propositionfirst").value = "";
                const calendars = $("[id^='calendar_'")
                for(let x = 0; x < calendars.length; x++){
                    const calendar = $(calendars[x]);
                    calendar.fullCalendar('refetchEvents')
                }
            }

            function supprimer_rdv(idrdv, idcalendar) {

                $.ajax({
                    url: 'ajax/del_rdv.php',
                    data: 'idrdv=' + idrdv,
                    dataType: 'json',
                    async: false,
                    success: function (json) {
                        $.each(json, function (index, value) {
                            if (value.success) {
                                $('#calendar_' + idcalendar).fullCalendar('removeEvents', idrdv);
                            } else {
                                alert(value.message_html);
                            }
                        });
                    }
                });
            }

            function modal_prendre_rendez_vous() {
                reinitialise_modal_prendre_rendez_vous();
                $('#modalPrendreRendezVous').modal('show');
            }

            function modal_prendre_rendez_vous_unique(idp, idprofession, link, nom, bDeletePatient = false, locationId) {

                $('#LabelmodalPrendreRendezVouUniques').html('Prendre un rendez-vous');
                $('#idnomaffichepatient').val('');
                if (bDeletePatient){
                    $('#id_identifiant_patient').val('');
                }

                $('#div_name_praticien').html('<h2></h2>');
                $('#idp_unique').val(idp);
                if (idp == '') {
                    $('#idp_unique_all').val('vide');
                } else {
                    $('#idp_unique_all').val('plein');
                    sCabinetPraticien();
                }
                $('#id_propush').val(idprofession);

                $('#id_globalclickpriserdv').val('bt_plus');






                if (link == "normal") {
                    reinitialise_modal_prendre_rendez_vous_unique();
                    //$('#wizard-rdv-unique a[href="#tabPrendreRendezVousUnique1"]').tab('show');
                    $('#modalPrendreRendezVousUnique').modal('show');
                    //sCabinetPraticien();
                } else if (link == "anesthesiste") {
                    reinitialise_modal_prendre_rendez_vous_anesthesiste_unique();
                    $('#modalPrendreRendezVousAnesthesiste').modal('show');
                } else if (link == "arbrerdv") {
                    $('#myModalLabelhome').html("&nbsp;");
                    document.getElementById("iframerhome").src = "ReactRDV/?idc={/literal}{$idc}{literal}&typewidget=question&idquestion=" + nom;
                    $('#myModalHome').css("overflow-y", "scroll");
                    $('#myModalHome').modal('show');
                    setTimeout(function () {
                        resizeIframe(document.getElementById('iframerhome'));
                    }, 1000);

                    //$('#modalPrendreRendezVousArbreDecisionnel').modal('show');
                } else {
                    alert("Méthode de prise de rendez-vous non prise en charge !");
                }

            }

            function recherche_rdv_prendre_rendez_vous_unique() {
                $('#idp_unique').val("");
                $('#id_propush').val("");


                if (link == "normal") {
                    reinitialise_modal_prendre_rendez_vous_unique();
                    //$('#wizard-rdv-unique a[href="#tabPrendreRendezVousUnique1"]').tab('show');
                    $('#modalPrendreRendezVousUnique').modal('show');
                } else if (link == "anesthesiste") {
                    reinitialise_modal_prendre_rendez_vous_anesthesiste_unique();
                    $('#modalPrendreRendezVousAnesthesiste').modal('show');
                } else if (link == "arbrerdv") {
                    $('#myModalLabelhome').html("&nbsp;");
                    document.getElementById("iframerhome").src = "ReactRDV/?idc={/literal}{$idc}{literal}&typewidget=question&idquestion=" + nom;
                    $('#myModalHome').css("overflow-y", "scroll");
                    $('#myModalHome').modal('show');
                    setTimeout(function () {
                        resizeIframe(document.getElementById('iframerhome'));
                    }, 1000);

                    //$('#modalPrendreRendezVousArbreDecisionnel').modal('show');
                } else {
                    alert("Méthode de prise de rendez-vous non prise en charge !");
                }
            }

            function modal_prendre_rendez_vous_uniqueNew(bDeletePatient = false) {

                $('#idp_uniqueGlobal').val("");
                $('#id_propushGlobal').val("");
                $('#linkGlobal').val("");
                $('#nomGlobal').val("");
                $('#idp_unique').val("");
                if (bDeletePatient){
                    $('#id_identifiant_patient').val('');
                }
                //console.log('cat-idprofession : '+ idprofession);

                //console.log('cat-value :'+ $('#id_propush').val(idprofession));
                reinitialise_modal_prendre_rendez_vous_uniqueGlobal();
                //$('#wizard-rdv-unique a[href="#tabPrendreRendezVousUnique1"]').tab('show');
                $('#modalPrendreRendezVousUniqueGlobal').modal('show');
                $('#modalPrendreRendezVousUniqueGlobal').css('display', 'block');
                $('#tabPrendreRendezVousUnique1Global').css('display', 'block');
                $('#form_etape1_prendre_rendez_vous_uniqueGlobal').show();
                $('#modalPrendreRendezVousUniqueGlobal').css("z-index","2200");
            }

            function modal_prochain_rendez_vous_unique(idp, idprofession) {
                $('#idp_unique').val(idp);
                $('#id_propush').val(idprofession);
                //console.log('cat-idprofession : '+ idprofession);

                //console.log('cat-value :'+ $('#id_propush').val(idprofession));

                reinitialise_modal_prochain_rendez_vous_unique();
                $('#id_globalclickpriserdv').val('bt_calendar');
                //$('#wizard-rdv-unique a[href="#tabPrendreRendezVousUnique1"]').tab('show');
                $('#selectprofession').prop('disabled', true);

                $('#myModalfiltrrdv').modal('show');

            }


            function modal_prendre_rendez_vous_anesthesiste() {
                reinitialise_modal_prendre_rendez_vous_anesthesiste_unique();
                $('#modalPrendreRendezVousAnesthesiste').modal('show');
            }


            $(document).ready(function () {

                affiche_bouton_rdv_en_cour("rdvcouper");
                affiche_bouton_rdv_en_cour("rdvcopier");

                {/literal}{foreach from=$tabPraticien item=tabConsigne name=sTabConsigne}{literal}
                $('#id_consigne_{/literal}{$tabConsigne.id_user}{literal}').bind('click', function () {

                    // if this is close
                    if (!$('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').hasClass('open')) {

                        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').addClass('open');
                        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').slideDown('fast', function () {});
                        // if this is open
                    } else {
                        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').removeClass('open');
                        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').slideUp('fast', function () {});
                    }

                });
                {/literal}{/foreach}{literal}

                //document.getElementById('first_1').value = "0";
                $(document).on('shown.bs.tab', '#ulcalendar a[data-toggle="tab"]', function (e) {
                    var str = String(e.target);
                    var res = str.split('#');
                    if (str != "") {
                        var id_calendar = res[1].substring(3);

                        $('#tabactive').val(id_calendar);
                        window.localStorage.clear();
                        if (document.getElementById('first_' + id_calendar).value == "1" && $('#iddateplanning').val() == "") {
                            $('#calendar_' + id_calendar).fullCalendar('today');
                            document.getElementById('first_' + id_calendar).value = "0";
                        } else {
                            if ($('#iddateplanning').val() != "") {
                                $('#calendar_' + id_calendar).fullCalendar('gotoDate', moment($('#iddateplanning').val(), 'DD/MM/YYYY'));
                            }
                            //$('#calendar_'+id_calendar).fullCalendar('refetchEvents');

                        }

                        if ($('#iddateplanning').val() == "") {
                            //modif effectué a la demande de guy le 27/09/2019 pour le centre Union
                            //$('#calendar_'+id_calendar).fullCalendar('gotoDate', moment($('#datedebutaff_'+id_calendar).val(), 'YYYY-MM-DD'));
                        }
                        getSalleAttente();
                        getConsigne($("#identifiant_praticien_" + id_calendar).val(), id_calendar);
                    }
                    /* $('#calendar_'+id_calendar).fullCalendar('refetchEvents');

                           clearInterval(refreshIntervalId);
                           refreshIntervalId="";
                           var view = $('#calendar_'+id_calendar).fullCalendar('getView');
                           setTimeline('#calendar_'+id_calendar, view);
                           clearInterval(refreshIntervalId);
                           refreshIntervalId="";
                           refreshIntervalId = setInterval(function(){
                           setTimeline('#calendar_'+id_calendar, view);
                           }, 1000);

                           getConsigne($("#identifiant_praticien_"+id_calendar).val(), id_calendar);
                           $('#widthagenda').val($('#calendar_'+id_calendar).width());*/

                });

                $('#tab_profession').click(function () {
                    $('#bsetapplique').val("profession");
                });

                $('#tab_praticien').click(function () {
                    $('#bsetapplique').val("praticien");
                });

                $('#btn_modal_search_filtre_rdv').click(function () {

                    $('#moderecherche').val("ok");
                    $('#divErreurfiltrerdv').hide();
                    $('#divfiltrerdv').hide();
                    $('#divattentefiltrerdv').show();
                    setTimeout(function () {
                        rafraichir_calendrierNew('selectlieux2', 'selectpraticien2', 'selecttyperdv2', 'ok', 'datepickerrdv-widget', '1', '0', 'selectprofession');
                    }, 0);

                    return false;
                });

                $('#btn_modal_filtre_praticien').click(function () {
                    $('#divfiltrepraticien').hide();
                    $('#divattentefiltrepraticien').show();
                    setTimeout(function () {
                        rafraichir_calendrier('selectlieux', 'selectpraticien', 'selecttyperdv', '', 'iddateplanning', '0', '0');
                    }, 0);
                    $('#myModalfiltremedecin').modal('hide');
                    return false;
                });

                $('#trie_salle_attente').on('change', function () {
                    getSalleAttente();
                });

                //getSalleAttente();
                //launch_getSalleAttente();


                $('#btn_param_calendar').click(function () {


                    if (document.getElementById('div_param_agenda').style.display == "none") {
                        $('#div_param_agenda').slideDown('slow', function () {});

                        $(".checkpraticien").prop("checked", false);
                        $(".checkprofession").prop("checked", false);

                        /*$('#dialog-confirm').show();
                               $( "#dialog-confirm" ).dialog({
                               resizable: false,
                               height:200,
                               width:'auto',
                               modal: true,
                               buttons: {
                               "Oui": function() {
                               $(".checkpraticien").prop("checked", false);
                               $(".checkprofession").prop("checked", false);
                               $( this ).dialog( "close" );

                               },
                               "Non": function() {
                               $( this ).dialog( "close" );
                               }
                               }
                               });*/

                    } else {
                        $('#div_param_agenda').slideUp('slow', function () {});
                        //$('#dialog-confirm').hide();
                    }

                    return false;
                });

                $('#btn_annule_param_agenda').click(function () {
                    $('#div_param_agenda').slideUp('slow', function () {});
                    return false;
                });



                $('input[type=radio][name=recurrent_termine_prendre_rdv_calendar]').change(function () {
                    if (this.value === 'jamais') {
                        $('#reccurent_date_fin_patient_prendre_rdv_calendar').prop('disabled', true);
                        $('#recurrent_occurence_prendre_rdv_calendar').prop('disabled', true);
                    } else if (this.value === 'le') {
                        $('#reccurent_date_fin_patient_prendre_rdv_calendar').prop('disabled', false);
                        $('#recurrent_occurence_prendre_rdv_calendar').prop('disabled', true);
                    } else if (this.value === 'apres') {
                        $('#reccurent_date_fin_patient_prendre_rdv_calendar').prop('disabled', true);
                        $('#recurrent_occurence_prendre_rdv_calendar').prop('disabled', false);
                    }
                });

                //header agenda
                var headerHeight = $("#header").height();
                var formInlineHeight = $("#form-inline").height();
                var ulcalendarHeight = $("#ulcalendar").height();
                var btnparamHeight = $(".btn_param").height();
                var fctoolbarHeight = $(".fc-toolbar").height();

                var tempheaderHeight = 0;
                var ulcalendarTop = 0;
                var fctoolbarTop = 0;
                var fcheadTop = 0;
                var decalageTop = 0;

                var tmpWidhtAgenda = "";

                //$('.fc-head').removeAttr('style');
                //$('.fc-toolbar').removeAttr('style');
                $('#form-inline').removeAttr('style');
                $('#ulcalendar').removeAttr('style');
                //$('.btn_param').removeAttr('style');
                $('.fc-unthemed').removeAttr('style');

                $(window).on("scroll", function () {
                    //if ($(window).scrollTop() > headerHeightagenda + 0) {

                    scroll_calendar_page();

                });

                function scroll_calendar_page() {

                    $('#divsalleattente').css({
                        top: headerHeight + 'px',
                        position: 'fixed',
                        zIndex: '1000',
                    });

                    {/literal}{if $activeenteteflottante=='Y'}{literal}

                    if ($(window).scrollTop() > 0) {

                        $('.card').removeAttr('style');

                        if ($('#widthagenda').val() == "") {
                            tmpWidhtAgenda = $(".fc-view-container").width();
                        } else {
                            tmpWidhtAgenda = $('#widthagenda').val();
                        }
                        {/literal}{if !$bIsMobile}{literal}

                        ulcalendarTop = headerHeight + btnparamHeight + 40;

                        $('.card').css({
                            top: ulcalendarTop + 'px',
                            zIndex: '998'
                        });


                        ulcalendarTop = headerHeight + btnparamHeight + 90;

                        $('#ulcalendar').css({
                            top: ulcalendarTop + 'px',
                            zIndex: '998',
                            "background-color": '#ffffff'
                        });

                        formInlineTop = btnparamHeight + 60;

                        $('#form-inline').css({
                            top: formInlineTop + 'px',
                            zIndex: '998',
                            "background-color": '#ffffff',
                        });

                        fctoolbarTop = headerHeight + btnparamHeight + 40;

                        $('.fc-toolbar').css({
                            top: '126px',
                            position: 'fixed',
                            zIndex: '800',
                            width: tmpWidhtAgenda+1,
                            "background-color": '#ffffff',
                            "padding-top": '10px',
                            "padding-bottom": '12px',
                            "margin-bottom": '13px'//,
                        });

                        fcheadTop = headerHeight + btnparamHeight + fctoolbarHeight + 40;

                        $('.fc-agendaWeek-view .fc-head').css({
                            top: '176px',
                            position: 'fixed',
                            zIndex: '999',
                            width: parseInt(tmpWidhtAgenda)+1,
                            "background-color": '#ffffff',
                            "margin-top": '22px'//,
                        });

                        $('.fc-agendaTroisJours-view .fc-head').css({
                            top: '176px',
                            position: 'fixed',
                            zIndex: '999',
                            width: parseInt(tmpWidhtAgenda)+1,
                            "background-color": '#ffffff',
                            "margin-top": '22px'//,
                        });

                        $('.fc-agendaDay-view .fc-head').css({
                            top: '176px',
                            position: 'fixed',
                            zIndex: '999',
                            width: parseInt(tmpWidhtAgenda)+1,
                            "background-color": '#ffffff',
                            "margin-top": '22px'//,
                        });

                        decalageTop = fcheadTop + 25;

                        {/literal}{else}{literal}
                        $('.fc-head').css({
                            top: '20px',
                            position: 'fixed',
                            zIndex: '999',
                            width: parseInt(tmpWidhtAgenda) + 1,
                            "background-color": '#ffffff'
                        });
                        {/literal}{/if}{literal}

                    } else if ($(window).scrollTop() <= 300) {
                        $('#form-inline').removeAttr('style');
                        $('.card').removeAttr('style');
                    }

                    {/literal}{else}{literal}

                    if ($(window).scrollTop() > 0) {
                        if ($('#widthagenda').val() === "") {
                            tmpWidhtAgenda = $(".fc-view-container").width();
                        } else {
                            tmpWidhtAgenda = $('#widthagenda').val();
                        }
                        {/literal}{if $bIsMobile}{literal}

                        $('.fc-head').css({
                            top: '20px',
                            position: 'fixed',
                            zIndex: '999',
                            width: parseInt(tmpWidhtAgenda) + 1,
                            "background-color": '#ffffff'
                        });
                        {/literal}{/if}{literal}

                    } else if ($(window).scrollTop() <= 300) {
                        $('#form-inline').removeAttr('style');
                        $('.card').removeAttr('style');
                    }

                    {/literal}{/if}{literal}

                }

                $("#btn_check_patient_prendre_rdv_calendar").click(function () {
                    if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==false){
                        affiche_popup_message('Information', "Date de naissance incorrecte", 'Ok');
                        return false;
                    }
                    button_valid_and_print_calendar = $(this).attr('name');
                    $('#id_globaltypeprint').val($(this).attr('name'));
                });

                $("#btn_check_patient_prendre_rdv_print_calendar").click(function () {
                    if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==false){
                        affiche_popup_message('Information', "Date de naissance incorrecte", 'Ok');
                        return false;
                    }
                    button_valid_and_print_calendar = $(this).attr('name');
                    $('#id_globaltypeprint').val($(this).attr('name'));
                });

                $('#modal_enregistrer_rdv').submit(function (event ) {
                    var bcontinu = true;

                    if ($('#teleconsult_prendre_rdv_calendar').val() == 'Y') {
                        //|| $('#tel_mobile_patient_prendre_rdv_calendar').val() != ""
                        if ($('#email_patient_prendre_rdv_calendar').val() != "") {
                            bcontinu = true;
                        } else {
                            //alert("Pour une téléconsultation, vous devez renseigner l'email du patient");
                            affiche_popup_message('Information', "Pour une téléconsultation, vous devez renseigner l'email du patient", 'Ok');
                            bcontinu = false;
                            return false;
                        }

                        if ($('#montant_teleconsult_prendre_rdv_calendar').val() != "") {
                            bcontinu = true;
                        } else {
                            //alert("Pour une téléconsultation, vous devez renseigner l'email du patient");
                            affiche_popup_message('Information', "Pour une téléconsultation, vous devez renseigner un montant de téléconsultation", 'Ok');
                            bcontinu = false;
                            return false;
                        }
                    }

                    //vérification si un rdv de ce type n'existe pas déjà

                    $.ajax({
                        cache: false,
                        url: 'ajax/check_rdv_existe.php',
                        data: 'id_centre=' + $('#idc').val() + '&id_patient=' + $('#id_patient_prendre_rdv_calendar').val() +
                            "&date_debut=" + $('#date_prendre_rdv_calendar').val() + "&heure_debut=" + $('#heure_reelle_prendre_rdv_calendar').val() +
                            "&duree="+ $('#temps_consultation_calendar').val()+'&idpraticien='+$('#id_praticien_prendre_rdv_calendar').val()+'&idmotif='+$('#type_rdv_calendar').val() ,
                        dataType: 'json',
                        async: false,
                        success: function (json) {
                            $.each(json, function (index, value) {

                                if(value.success){

                                    if(!value.date_heure){

                                        $('#txtCheckTitleToday').html("Important : Ce patient a déjà un ou plusieurs rendez-vous dans cette spécialité");

                                    }else {

                                        $('#txtCheckTitleToday').html("Attention : Ce patient est déjà en rendez-vous au même moment !!");

                                    }

                                    var Mytable = '<table class="table table-striped table-hover no-head-border"><thead class="vd_bg-color vd_white">' +
                                                   '<th class="th_tab"><span class="separator_vertical">|</span> Date</th>' +
                                        '<th class="th_tab"><span class="separator_vertical">|</span> Heure </th>' +
                                        '<th class="th_tab"><span class="separator_vertical">|</span> Motif </th>' +
                                        '<th class="th_tab"><span class="separator_vertical">|</span> praticien</th></thead>';

                                    $.each(value.listerdv, function (index, valurdv) {

                                        if(valurdv.bjourheure==1){
                                            Mytable += "<tr><td class='menu-action rounded-btn' style='background-color: red;color:white'>" + valurdv.ladate + "</td><td style='background-color: red;color:white'>" + valurdv.lheure + "</td><td style='background-color: red;color:white'>" + valurdv.libelle_type_rdv + "</td><td style='background-color: red;color:white'> avec " + valurdv.abreviation_civilite + " " + valurdv.nom_docteur + " ( "+valurdv.nom_profession+" ) </td></tr>";
                                        }else {
                                            Mytable += "<tr><td class='menu-action rounded-btn'>" + valurdv.ladate + "</td><td>" + valurdv.lheure + "</td><td>" + valurdv.libelle_type_rdv + "</td><td> avec " + valurdv.abreviation_civilite + " " + valurdv.nom_docteur + " ( "+valurdv.nom_profession+" )</td></tr>";
                                        }
                                    });

                                    Mytable +="</table>";

                                   // var txt = "le <b>" + value.date_prise_rendez_vous + "</b> à <b>" + value.heure_debut_prise_rendez_vous + "</b> pour <b>" +
                                    // value.libelle_type_rdv + "</b> avec " + value.abreviation_civilite + " " + value.nom_docteur;
                                    if(!value.date_heure) {
                                        $('#boutonmyModalValid').css("background-color", "green");
                                        $('#boutonmyModalSupp').css("background-color", "red");
                                    }else{
                                        $('#boutonmyModalValid').css("background-color", "red");
                                        $('#boutonmyModalSupp').css("background-color", "green");
                                    }
                                    $('#txtCheckRDVToday').html(Mytable);
                                    //affiche de la popin
                                    $('#checkRdvExisteToday').modal('show');
                                    event.preventDefault();
                                    return true;

                                }else{

                                    $('#checkRdvExisteToday').modal('hide');

                                    if (bcontinu) {
                                        enregistrement_rdv_calendar();
                                    }

                                    return false;
                                }
                            });
                        }
                    });



                    return false;
                });




                $("#btn_generer_rdv_recurrent").click(function () {

                    if ($('#id_praticien_prendre_rdv_calendar').val() != '' && $('#id_lieu_prendre_rdv_calendar').val() != ''
                        && $('#type_rdv_calendar').val() != '' && ($('#id_patient_prendre_rdv_calendar').val() != ''
                            || ($('#civilite_patient_prendre_rdv_calendar').val() != null && $('#nom_patient_prendre_rdv_calendar').val() != ''
                                && $('#prenom_patient_prendre_rdv_calendar').val() != ''))
                        && isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==true) {


                        //$('#div_info_patient_historique_complet').hide('slow');
                        $('#div_title_historique').hide();
                        $('#div_liste_rdv_generer').show('slow');
                        $('#div_liste_rdv_generer').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");

                        var data = $('#date_prendre_rdv_calendar').val();
                        var arr = data.split('/');
                        var data2 = $('#heure_reelle_prendre_rdv_calendar').val();
                        var arr2 = data2.split(':');

                        var data3 = $('#heure_patient_prendre_rdv_calendar').val();
                        var arr3 = data3.split(':');

                        var id_praticien_rdv_timestamp = $('#id_praticien_prendre_rdv_calendar').val() + '-' + arr[2] + '-' + arr[1] + '-' + arr[0] + '-' + arr2[0] + '-' + arr2[1] + '-' + $('#id_lieu_prendre_rdv_calendar').val() + '-1-' + $('#type_rdv_calendar').val();
                        var selected_recurrent_repeter_le = $('input[name=recurrent_repeter_le_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();
                        var selected_recurrent_termine = $('input[name=recurrent_termine_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();

                        var tabInfo = id_praticien_rdv_timestamp.split('-');

                        var month = new Array(12);
                        month[0] = "Janvier";
                        month[1] = "Février";
                        month[2] = "Mars";
                        month[3] = "Avril";
                        month[4] = "Mai";
                        month[5] = "Juin";
                        month[6] = "Juillet";
                        month[7] = "Août";
                        month[8] = "Septembre";
                        month[9] = "Octobre";
                        month[10] = "Novembre";
                        month[11] = "Décembre";

                        var sjour = new Array(7);
                        sjour[0] = "Dimanche";
                        sjour[1] = "Lundi";
                        sjour[2] = "Mardi";
                        sjour[3] = "Mercredi";
                        sjour[4] = "Jeudi";
                        sjour[5] = "Vendredi";
                        sjour[6] = "Samedi";

                        var formattedDate = new Date(tabInfo[1] + "-" + tabInfo[2] + "-" + tabInfo[3]);
                        var d = formattedDate.getDay();
                        var m = formattedDate.getMonth();

                        //var jourliteralrdvinitial = sjour[d] +" "+ tabInfo[3]+" "+month[m]+" "+tabInfo[1] +" à "+ tabInfo[4]+":"+tabInfo[5];
                        var jourliteralrdvinitial = sjour[d] + " " + tabInfo[3] + " " + month[m] + " " + tabInfo[1] + " à " + arr3[0] + ":" + arr3[1];


                        $.ajax({
                            url: 'ajax/generer_liste_rdv_reccurent.php',
                            data: 'select_rdv=' + id_praticien_rdv_timestamp
                                + '&recurrent_nb_repete=' + $('#recurrent_nb_repete_prendre_rdv_calendar').val()
                                + '&recurrent_select_repete=' + $('#recurrent_select_repete_prendre_rdv_calendar').val()
                                + '&recurrent_repeter_le=' + selected_recurrent_repeter_le
                                + '&recurrent_termine=' + selected_recurrent_termine
                                + '&reccurent_date_fin=' + $('#reccurent_date_fin_patient_prendre_rdv_calendar').val()
                                + '&recurrent_occurence=' + $('#recurrent_occurence_prendre_rdv_calendar').val()
                                + '&recurrent_forcer_rdv=' + $('#recurrent_forcer_rdv_calendar').val(),
                            dataType: 'json',
                            success: function (json) {
                                $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', false);
                                $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', false);
                                $.each(json, function (index, value) {
                                    var tableau_rdv_recurrent = "<table style='padding:10px;' width='100%' border='1'>";

                                    tableau_rdv_recurrent += "<tr><td></td><td><b>Le jour du RDV</b></td><td><b>Les propositions</b></td><td><b>Actions</b></td></tr>";
                                    tableau_rdv_recurrent += "<tr><td id='tdnum-1' style='padding:5px;'><span style='font-size: small;' class='badge vd_bg-red'>1</span></td><td style='padding: 20px;'>" + jourliteralrdvinitial + "</td><td></td><td></td></tr>";

                                    var i = 2;
                                    $.each(value.tabRDVRecurrent, function (index, value) {

                                        tableau_rdv_recurrent += "<tr id='tr-" + value.lejour + "' ><td id='tdnum-" + i + "' style='padding:5px;'><span style='font-size: small;' class='badge vd_bg-red'>" + i + "</span></td><td><span id='jourchoisi-" + value.lejour + "'>" + value.jourliteral + "</span></td><td id='btndatechoisi-" + value.lejour + "'><div class='btn-group-vertical'>";
                                        i++;
                                        tableau_rdv_recurrent += "<input type='hidden' class='date-rdv-recurrent' id='tabrdvrecurrenthidden-" + value.lejour + "' value=''>";

                                        if (value.liste.length > 0) {
                                            $.each(value.liste, function (index, value) {
                                                if (value.statut === "conge") {
                                                    tableau_rdv_recurrent += value.descconge;
                                                } else {
                                                    tableau_rdv_recurrent += "<button class='" + value.ladate + " btn ";
                                                    if (value.checked === 1) {
                                                        tableau_rdv_recurrent += " btn_widget_standard ";
                                                    }
                                                    tableau_rdv_recurrent += "' type='button' onclick='changedaterdvrecurrent(\"" + value.ladate + "\", this, \"" + value.decoupe + "\", \"" + value.lejour + "\", \"" + value.dateaff + "\", \"" + value.heureaff_patient + "\", \"" + value.jourliteral + "\");'>" + value.lejour + " " + value.dateaff + " à " + value.heureaff_patient + " <br/>(Heure réelle : " + value.heure_debut + ")</button>";
                                                }
                                            });
                                        } else {
                                            tableau_rdv_recurrent += "Pas de proposition automatique pour ce jour";
                                        }
                                        tableau_rdv_recurrent += "</div></td><td>";
                                        tableau_rdv_recurrent += "<button class='btn btn_widget_standard' type='button' style='width: 95%;margin-top:10px;margin-bottom:10px;' onclick='modifier_ligne_date_reccurent(\"" + value.lejour + "\");'>Choisir une autre date/horaire</button>";
                                        //tableau_rdv_recurrent += "<br/><button class='btn btn_widget_standard' type='button' style='width: 95%;background-color: #d9534f;margin-top:10px;margin-bottom:10px;' onclick='supprimer_ligne_date_reccurent(\"tr-"+value.lejour+"\");'>Supprimer cette date/horaire</button>";
                                        tableau_rdv_recurrent += "</td></tr>";
                                    });
                                    tableau_rdv_recurrent += "</table>";
                                    $('#div_liste_rdv_generer').html(tableau_rdv_recurrent);

                                    var hiddendate = "";
                                    var initdatereccurent = "";
                                    $.each(value.tabRDVRecurrent, function (index, value2) {
                                        if (value2.liste.length > 0) {
                                            $.each(value2.liste, function (index, value) {
                                                if (value.checked === 1) {
                                                    hiddendate = value.ladate;
                                                    initdatereccurent = value.decoupe;
                                                    $('#jourchoisi-' + value.ladate).html(value2.jourliteral + " à " + value.heureaff_patient);
                                                }
                                                $('#tabrdvrecurrenthidden-' + hiddendate).val(initdatereccurent);
                                            });
                                        }
                                    });
                                });
                            }
                        });
                    } else {
                        if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==false){
                            affiche_popup_message('Information', "Date de naissance incorrecte", 'Ok');
                        }
                        if ($('#type_rdv_calendar').val() === '') {
                            affiche_popup_message('Information', "Veuillez choisir un motif de RDV", 'Ok');
                        }

                        if ($('#id_patient_prendre_rdv_calendar').val() === '' && ($('#civilite_patient_prendre_rdv_calendar').val() === null || $('#nom_patient_prendre_rdv_calendar').val() === '' || $('#prenom_patient_prendre_rdv_calendar').val() === '' || $('#nom_patient_prendre_rdv_unique').prop('disabled') === false)) {
                            affiche_popup_message('Information', "Veuillez sélectionner, valider ou saisir les champs obligatoires de la fiche patient", 'Ok');
                        }

                        if ($('#id_praticien_prendre_rdv_calendar').val() === '') {
                            affiche_popup_message('Information', "Veuillez sélectionner un praticien", 'Ok');
                        }

                        if ($('#id_lieu_prendre_rdv_calendar').val() === '') {
                            affiche_popup_message('Information', "Veuillez sélectionner un lieu", 'Ok');
                        }

                    }

                    return false;

                });

                $('#type_rdv_calendar').on('change', function () {

                    if ($('#type_rdv_calendar').val() != "") {
                        $.ajax({
                            url: 'ajax/get_montant_motif_teleconsultation.php',
                            data: 'idtyperdv=' + $('#type_rdv_calendar').val() + '&identifiant_docteur=' + $('#id_praticien_prendre_rdv_calendar').val(),
                            dataType: 'json',
                            success: function (json) {
                                if ($('#montant_teleconsult_prendre_rdv_calendar').val() == "" || $('#montant_teleconsult_prendre_rdv_calendar').val() != json.montant) {
                                    $('#montant_teleconsult_prendre_rdv_calendar').val(json.montant);
                                }
                                if (json.type_motif == "Telconsult") {
                                    $('#teleconsult_prendre_rdv_calendar').val("Y");
                                    $('#div_montant_teleconsult_prendre_rdv_calendar').show();
                                    $('#teleconsult_prendre_rdv_calendar').trigger('change');
                                } else {
                                    $('#teleconsult_prendre_rdv_calendar').val("N");
                                    $('#div_montant_teleconsult_prendre_rdv_calendar').hide();
                                    $('#teleconsult_prendre_rdv_calendar').trigger('change');
                                }
                            }
                        });
                    }
                });



                $('#teleconsult_prendre_rdv_calendar').on('change', function () {
                    //affiche_popup_message('Information', "Veuillez sélectionner un lieu", 'Ok');
                    if ($('#teleconsult_prendre_rdv_calendar').val() == 'Y') {
                        $('#div_montant_teleconsult_prendre_rdv_calendar').show();
                        if ($('#type_rdv_calendar').val() != "") {
                            $.ajax({
                                url: 'ajax/get_montant_motif_teleconsultation.php',
                                data: 'idtyperdv=' + $('#type_rdv_calendar').val() + '&identifiant_docteur=' + $('#id_praticien_prendre_rdv_calendar').val(),
                                dataType: 'json',
                                success: function (json) {
                                    if ($('#montant_teleconsult_prendre_rdv_calendar').val() == "" || $('#montant_teleconsult_prendre_rdv_calendar').val() != json.montant) {
                                        $('#montant_teleconsult_prendre_rdv_calendar').val(json.montant);
                                    }
                                }
                            });
                        }
                    } else {
                        $('#div_montant_teleconsult_prendre_rdv_calendar').hide();
                    }


                });

                $('#recurrent_prendre_rdv_calendar').on('change', function () {
                    if ($('#recurrent_prendre_rdv_calendar').val() === "Y") {

                        if ($('#id_praticien_prendre_rdv_calendar').val() != '' && $('#id_lieu_prendre_rdv_calendar').val() != ''
                            && $('#type_rdv_calendar').val() != '' && ($('#id_patient_prendre_rdv_calendar').val() != ''
                                || ($('#civilite_patient_prendre_rdv_calendar').val() != null && $('#nom_patient_prendre_rdv_calendar').val() != ''
                                    && $('#prenom_patient_prendre_rdv_calendar').val() != '' && $('#date_naissance_patient_prendre_rdv_calendar').val() != ''))
                            && isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==true) {

                            $('#div_title_historique').hide();
                            $('#div_recurrence_perso').show('slow');
                            $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', true);
                        } else {
                            $('#recurrent_prendre_rdv_calendar').val('N');
                            if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==false){
                                affiche_popup_message('Information', "Date de naissance incorrecte", 'Ok');
                            }
                            if ($('#type_rdv_calendar').val() === '') {
                                affiche_popup_message('Information', "Veuillez choisir un motif de RDV", 'Ok');
                            }


                            if ($('#id_patient_prendre_rdv_calendar').val() === '' && ($('#civilite_patient_prendre_rdv_calendar').val() === null || $('#nom_patient_prendre_rdv_calendar').val() === '' || $('#prenom_patient_prendre_rdv_calendar').val() === '' || $('#date_naissance_patient_prendre_rdv_calendar').val() === '' || $('#nom_patient_prendre_rdv_unique').prop('disabled') === false)) {
                                affiche_popup_message('Information', "Veuillez sélectionner, valider ou saisir les champs obligatoires de la fiche patient", 'Ok');
                            }

                            if ($('#id_praticien_prendre_rdv_calendar').val() === '') {
                                affiche_popup_message('Information', "Veuillez sélectionner un praticien", 'Ok');
                            }

                            if ($('#id_lieu_prendre_rdv_calendar').val() === '') {
                                affiche_popup_message('Information', "Veuillez sélectionner un lieu", 'Ok');
                            }
                        }
                    } else {
                        $('#div_recurrence_perso').hide('slow');
                        $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', false);
                        $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', false);
                        $('#div_liste_rdv_generer').html("").hide();
                    }

                });

                $('#recurrent_select_repete_prendre_rdv_calendar').on('change', function () {

                    if ($('#recurrent_select_repete_prendre_rdv_calendar').val() === 'semaine') {
                        $('#div_repete_le').show('slow');
                    } else {
                        $('#div_repete_le').hide('slow');
                    }

                });

                $('#menu_historique_patient a').click(function () {
                    var cat_id = $(this).attr('data-filter');
                    $('#boucle_historique_prendre_rdv_calendar').isotope({filter: cat_id});
                });

                $('#couleur_patient_prendre_rdv_calendar').on('change', function () {
                    $('#cadre_couleur_patient_prendre_rdv_calendar').attr('style', 'color:#' + $('#couleur_patient_prendre_rdv_calendar').val());
                });

                var curdatemobile = new Date();
                curdatemobile = curdatemobile.getDate() + "/" + (curdatemobile.getMonth() + 1) + "/" + curdatemobile.getFullYear();

                $('#datemenupickermobile').DatePicker({
                    flat: true,
                    date: curdatemobile,
                    current: curdatemobile,
                    format: 'd/m/Y',
                    calendars: 1,
                    mode: 'single',
                    starts: 1,
                    onChange: function (formated, dates) {
                        //alert(formated);
                        if ($('#iddateplanning').val() != formated || $('#iddateplanningrdv').val() != formated) {
                            $('#iddateplanning').val(formated);
                            $('#iddateplanningrdv').val(formated);
                            setTimeout(function () {
                                if ($('#dir').val() == 'rechdispo') {
                                    rafraichir_calendrier('selectlieux', 'selectpraticien', 'selecttyperdv', '', 'iddateplanning', '0', '0');
                                    rafraichir_calendrier_all(formated);
                                }

                            }, 0);
                        }
                        $('#modalCalendarMobile').modal('hide');
                    }
                });

                if ($('#id_praticien_copypaste').val() != "" && $('#id_rdv_copypaste').val() != "") {
                    active_tab_praticien($('#id_praticien_copypaste').val());
                    $.ajax({
                        cache: false,
                        url: 'ajax/get_info_rendez_vous.php',
                        data: 'id_fiche_rendez_vous=' + $('#id_rdv_copypaste').val() + '&identifiant_entite=' + $('#idc').val() + '&identifiant_user=' + $('#ident_user').val(),
                        dataType: 'json',
                        success: function (json) {
                            $.each(json, function (index, value) {
                                couper_rdv($('#id_rdv_copypaste').val() + '|' + value.civilite_patient + ' ' + value.nom_patient + ' ' + value.prenom_patient + '|' + value.ladte + '|' + value.heuredebut + '|' + value.nomdocteurseul, 'copierdv');
                                $('#id_praticien_copypaste').val("");
                                $('#id_rdv_copypaste').val("");
                            });
                        }
                    });
                }

            });

            // *********************************************************************************************************************************************************************************** -- FUNCTION -- **********************************************************************************//

            function reinitialise_modal_prendre_rendez_vous_calendar() {
                $('#id_patient_prendre_rdv_calendar').val("");
                $('#id_patient_prendre_rdv_unique').val("");
                $('#civilite_patient_prendre_rdv_calendar').val("");
                $('#nom_patient_prendre_rdv_calendar').val("");
                $('#prenom_patient_prendre_rdv_calendar').val("");
                $('#nom_jeune_fille_patient_prendre_rdv_calendar').val("");
                $('#adresse_patient_prendre_rdv_calendar').val("");
                $('#code_postal_patient_prendre_rdv_calendar').val("");
                $('#ville_patient_prendre_rdv_calendar option').remove();
                $('#tel_mobile_patient_prendre_rdv_calendar').val("");
                $('#tel_fixe_patient_prendre_rdv_calendar').val("");
                $('#email_patient_prendre_rdv_calendar').val("");
                $('#date_naissance_patient_prendre_rdv_calendar').val("");
                $('#num_secu_patient_prendre_rdv_calendar').val("");
                $('#medecin_traitant_patient_prendre_rdv_calendar').val("");
                $('#ville_medecin_patient_prendre_rdv_calendar').val("");
                $('#profession_patient_prendre_rdv_calendar').val("");
                $('#remarque_patient_prendre_rdv_calendar').val("");
                $('#assurance_patient_prendre_rdv_calendar').val("");
                $('#couleur_patient_prendre_rdv_calendar').val("").change();
                $('#cadre_couleur_patient_prendre_rdv_calendar').prop("title", "");
                $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>');
                $('#id_service_lieu').html("");

                $("#code_postal_patient_prendre_rdv_calendar").inputmask("9*999");
                $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                $("#num_secu_patient_prendre_rdv_calendar").inputmask("9 99 99 9* 999 999 99");
                $("#date_naissance_patient_prendre_rdv_calendar").inputmask("99/99/9999");

                $('#civilite_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#nom_patient_prendre_rdv_calendar').prop('disabled', false).focus();
                $('#prenom_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#nom_jeune_fille_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#adresse_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#ville_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#email_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#profession_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#assurance_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#couleur_patient_prendre_rdv_calendar').prop('disabled', false);
                $("#id_lieu_prendre_rdv_calendar").attr('disabled', false);
                $("#id_service_lieu").attr('disabled', false);

                //recurrence
                $('#recurrent_prendre_rdv_calendar').val("N");
                $('#recurrent_nb_repete_prendre_rdv_calendar').val("1");
                $('#recurrent_select_repete_prendre_rdv_calendar').val("semaine");
                $('#reccurent_date_fin_patient_prendre_rdv_calendar').val("").prop('disabled', true);
                //$('#recurrent_occurence_prendre_rdv_calendar').val("2").prop('disabled', true);
                $('#recurrent_occurence_prendre_rdv_calendar').val("2");

                $("input[name=recurrent_repeter_le_prendre_rdv_calendar][value='1']").prop('checked', true);
                $("input[name=recurrent_termine_prendre_rdv_calendar][value='apres']").prop('checked', true);


                $('#div_recurrence_perso').hide();
                $('#div_liste_rdv_generer').html("").hide();

                $('#div_reinit_calendar').hide();

                //historique patient
                $('#attente_historique_patient_prendre_rdv_calendar').hide();
                $('#pas_historique_patient_prendre_rdv_calendar').show();
                $('#historique_patient_prendre_rdv_calendar').hide();
                $('#boucle_historique_prendre_rdv_calendar').html("");

                $('#div_button_suivant_calendar').show();
                $('#div_button_update_patient_calendar').hide();
            }

            function reinitialise_modal_prendre_rendez_vous_calendar_switch_patient() {
                $('#id_patient_prendre_rdv_calendar').val("");
                $('#civilite_patient_prendre_rdv_calendar').val("");
                $('#nom_patient_prendre_rdv_calendar').val("");
                $('#prenom_patient_prendre_rdv_calendar').val("");
                $('#nom_jeune_fille_patient_prendre_rdv_calendar').val("");
                $('#adresse_patient_prendre_rdv_calendar').val("");
                $('#code_postal_patient_prendre_rdv_calendar').val("");
                $('#ville_patient_prendre_rdv_calendar').val("");
                $('#tel_mobile_patient_prendre_rdv_calendar').val("");
                $('#tel_fixe_patient_prendre_rdv_calendar').val("");
                $('#email_patient_prendre_rdv_calendar').val("");
                $('#date_naissance_patient_prendre_rdv_calendar').val("");
                $('#num_secu_patient_prendre_rdv_calendar').val("");
                $('#medecin_traitant_patient_prendre_rdv_calendar').val("");
                $('#ville_medecin_patient_prendre_rdv_calendar').val("");
                $('#profession_patient_prendre_rdv_calendar').val("");
                $('#remarque_patient_prendre_rdv_calendar').val("");
                $('#assurance_patient_prendre_rdv_calendar').val("");
                $('#couleur_patient_prendre_rdv_calendar').val("").change();
                $('#cadre_couleur_patient_prendre_rdv_calendar').prop("title", "");
                $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>');

                $("#code_postal_patient_prendre_rdv_calendar").inputmask("9*999");
                $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                $("#num_secu_patient_prendre_rdv_calendar").inputmask("9 99 99 9* 999 999 99");
                $("#date_naissance_patient_prendre_rdv_calendar").inputmask("99/99/9999");

                $('#civilite_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#nom_patient_prendre_rdv_calendar').prop('disabled', false).focus();
                $('#prenom_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#nom_jeune_fille_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#adresse_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#ville_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#email_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#profession_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#assurance_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#couleur_patient_prendre_rdv_calendar').prop('disabled', false);

                //recurrence
                $('#recurrent_prendre_rdv_calendar').val("N");
                $('#recurrent_nb_repete_prendre_rdv_calendar').val("1");
                $('#recurrent_select_repete_prendre_rdv_calendar').val("semaine");
                $('#reccurent_date_fin_patient_prendre_rdv_calendar').val("").prop('disabled', true);
                //$('#recurrent_occurence_prendre_rdv_calendar').val("2").prop('disabled', true);
                $('#recurrent_occurence_prendre_rdv_calendar').val("2");

                $("input[name=recurrent_repeter_le_prendre_rdv_calendar][value='1']").prop('checked', true);
                $("input[name=recurrent_termine_prendre_rdv_calendar][value='apres']").prop('checked', true);

                $('#div_recurrence_perso').hide();
                $('#div_liste_rdv_generer').html("").hide();

                $('#div_reinit_calendar').hide();

                //historique patient
                $('#attente_historique_patient_prendre_rdv_calendar').hide();
                $('#pas_historique_patient_prendre_rdv_calendar').show();
                $('#historique_patient_prendre_rdv_calendar').hide();
                $('#boucle_historique_prendre_rdv_calendar').html("");

                $('#div_button_suivant_calendar').show();
                $('#div_button_update_patient_calendar').hide();
            }

            function getInfoPatientModalPrendreRDVCalendar(idpatient) {

                $.ajax({
                    cache: false,
                    url: 'ajax/get_info_patient.php',
                    data: 'idpatient=' + idpatient,
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {

                            $('#civilite_patient_prendre_rdv_calendar option[value="' + value.id_civilite + '"]').prop('selected', true);
                            $('#id_patient_prendre_rdv_calendar').val(idpatient);
                            $('#nom_patient_prendre_rdv_calendar').val(value.nom);
                            $('#nom_jeune_fille_patient_prendre_rdv_calendar').val(value.nom_fille);
                            $('#prenom_patient_prendre_rdv_calendar').val(value.prenom);
                            $('#adresse_patient_prendre_rdv_calendar').val(value.adresse);
                            $('#code_postal_patient_prendre_rdv_calendar').val(value.codepostal);
                            $('#ville_patient_prendre_rdv_calendar').val(value.ville);
                            $('#tel_mobile_patient_prendre_rdv_calendar').val(value.telmobile);
                            $('#tel_fixe_patient_prendre_rdv_calendar').val(value.telfixe);
                            $('#email_patient_prendre_rdv_calendar').val(value.email);
                            $('#date_naissance_patient_prendre_rdv_calendar').val(value.datenaissance);
                            $('#num_secu_patient_prendre_rdv_calendar').val(value.numsecu);
                            $('#medecin_traitant_patient_prendre_rdv_calendar').val(value.medecintraitant);
                            $('#ville_medecin_patient_prendre_rdv_calendar').val(value.villemedecin);
                            $('#profession_patient_prendre_rdv_calendar').val(value.profession);
                            $('#couleur_patient_prendre_rdv_calendar').val(value.couleur).change();
                            $('#ville_patient_prendre_rdv_unique').empty();
                            $('#tel_mobile_patient_prendre_rdv_calendar').intlTelInput('setCountry',value.indicatif_national_abreviation);
                            $('#tel_fixe_patient_prendre_rdv_calendar').intlTelInput('setCountry',value.indicatif_national_fixe_abreviation);

                            $('#ville_patient_prendre_rdv_calendar').append('<option value="' + value.ville + '">' + value.ville + '</option>');


                            if (value.remarque != "") {
                                $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>&nbsp;<i style="color: #000 !important;" class="fa fa-comments-o"></i>');
                                $('#cadre_couleur_patient_prendre_rdv_calendar').prop('title', value.remarque);
                            } else {
                                $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>');
                            }

                            $('#assurance_patient_prendre_rdv_calendar option[value="' + value.id_assurance_maladie + '"]').prop('selected', true);

                            //Masque de saisie pour la Fiche Patient
                            $("#code_postal_patient_prendre_rdv_calendar").inputmask("9*999");
                            $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                            $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                            $("#num_secu_patient_prendre_rdv_calendar").inputmask("9 99 99 9* 999 999 99");
                            $("#date_naissance_patient_prendre_rdv_calendar").inputmask("99/99/9999");


                            if ($('#nom_patient_prendre_rdv_calendar').val() != "") {
                                $('#div_reinit_calendar').show();
                            } else {
                                $('#div_reinit_calendar').hide();
                            }

                            $('#civilite_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#nom_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#prenom_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#nom_jeune_fille_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#adresse_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#ville_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#email_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#profession_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#assurance_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#couleur_patient_prendre_rdv_calendar').prop('disabled', true);
                            $('#tel_mobile_patient_prendre_rdv_calendar_indicatif').prop('disabled', true);
                            $('#tel_fixe_patient_prendre_rdv_calendar_indicatif').prop('disabled', true);

                            $('#div_button_update_patient_calendar').hide();
                            $('#div_button_suivant_calendar').show();

                            getHistoriquePatient();
                        });
                    }
                });

                return false;
            }

            function get_new_rendez_vous(idpraticienrdv, daterdv, heurereellerdv, idlieurdv, idmotif, idaide, idplanning, nomaide, id_lieu_service) {


                reinitialise_modal_prendre_rendez_vous_calendar();

                $('#div_info_enregistrer_rendez_vous').show();
                $('#attente_info_enregistrer_rendez_vous').hide();

                $('#div_info_patient_historique_complet').show('slow');
                $('#div_title_historique').show();

                $('#teleconsult_prendre_rdv_calendar').val("N");
                $('#montant_teleconsult_prendre_rdv_calendar').val("");
                $('#div_montant_teleconsult_prendre_rdv_calendar').hide();

                $("#id_prive_prendre_rdv_calendar_non").prop("checked", true);

                $('#id_praticien_prendre_rdv_calendar').val(idpraticienrdv);
                $('#id_praticien_prendre_rdv_calendar').select2({
                    dropdownParent: $('#modalSelectPraticien')
                });
                $('#date_prendre_rdv_calendar').val(daterdv);
                $('#heure_patient_prendre_rdv_calendar').val(heurereellerdv);
                $('#heure_reelle_prendre_rdv_calendar').val(heurereellerdv);

                $('#id_lieu_prendre_rdv_calendar').val(idlieurdv)

                $('#temps_consultation_calendar').val('');
                $('#id_patient_prendre_rdv_unique').val('');

                $('#divMessageRemplacant').hide();
                $('#sMessageRemplacant').html("");
                $('#message_retour_info_enregistrer_rendez_vous').hide().html("");

                $('#btn_plus_rdv_modal_calendar').prop('disabled', false);

                tableau_data = new Array();
                tableau_agesutre = new Array();
                tableau_id = new Array();
                plus_motif_rdv = true;
                $("#type_rdv_calendar").empty();
                $("#id_lieu_prendre_rdv_calendar").empty();

                var tabInfo = daterdv.split('/');
                var formattedDate = new Date(tabInfo[2] + "-" + tabInfo[1] + "-" + tabInfo[0]);
                var lejour = formattedDate.getDay();
                var sjour = new Array(7);
                sjour[0] = "7";
                sjour[1] = "1";
                sjour[2] = "2";
                sjour[3] = "3";
                sjour[4] = "4";
                sjour[5] = "5";
                sjour[6] = "6";

                $("input[name=recurrent_repeter_le_prendre_rdv_calendar][value=" + sjour[lejour] + "]").prop('checked', true);

                $.ajax({
                    cache: false,
                    url: 'ajax/check_status_teleconsultation_praticien_rdv.php',
                    data: 'identifiant_user=' + idpraticienrdv,
                    dataType: 'json',
                    success: function (json) {
                        if (json.result === 'ok') {
                            $('#div_teleconsult_prendre_rdv_calendar').show();
                        } else {
                            $('#div_teleconsult_prendre_rdv_calendar').hide();
                        }
                    }
                });

                $.ajax({
                    cache: false,
                    url: 'ajax/get_initialise_rendez_vous_calendar.php',
                    data: 'idc=' + $('#idc').val() + '&iddocteur=' + idpraticienrdv + '&daterdv=' + daterdv + '&heuredebut=' + heurereellerdv + '&idlieu=' + idlieurdv + '&idaide=' + idaide + '&idplanning=' + idplanning + '&nomaide=' + nomaide + '&id_lieu_service=' + id_lieu_service,
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {
                            $('#id_globalidpraticienlong').val(idpraticienrdv);


                            let lieuSelect = $('#id_lieu_prendre_rdv_calendar');
                            if (value['listelieux'] !== undefined) {
                                let listeLieux = value['listelieux'];
                                let nbLieu = listeLieux.length;

                                if (nbLieu === 1) {
                                    lieuSelect.append('<option value="' + listeLieux[0].id_lieux + '" selected>' + listeLieux[0].nom_lieux + '</option>');
                                } else {
                                    lieuSelect.append('<option value="" selected>Choisir un lieu de RDV</option>');
                                    $.each(listeLieux, function (index, lieu) {
                                        lieuSelect.append('<option value="' + lieu.id_lieux + '">' + lieu.nom_lieux + '</option>');
                                    });
                                }
                            }

                            if (value['listeservice'] !== undefined) {
                                let listeServices = value['listeservice'];
                                let nbService = listeServices.length;
                                let serviceSelect = $('#id_service_lieu');

                                if (nbService === 1) {
                                    serviceSelect.append('<option value="' + listeServices[0].id_lieux + '" selected>' + listeServices[0].nom_lieux + '</option>');
                                } else {
                                    serviceSelect.append('<option value="" selected>Choisir un service</option>');
                                    $.each(listeServices, function (index, service) {
                                        serviceSelect.append('<option value="' + service.id_lieux + '">' + service.nom_lieux + '</option>');
                                    });
                                }
                            }

                            if (value['tabMotifRDV'] !== undefined) {
                                let listeMotif = value['tabMotifRDV'];
                                let nbMotif = listeMotif.length;
                                let motifSelect = $('#type_rdv_calendar');
                                if (nbMotif === 1) {
                                    motifSelect.append('<option value="' + listeMotif[0].id_type_rdv + '" selected >' + listeMotif[0].libelle_type_rdv + '</option>');
                                } else {
                                    motifSelect.append('<option value="" selected>Choisir un motif</option>');
                                    $.each(listeMotif, function (index, motif) {
                                        motifSelect.append('<option value="' + motif.id_type_rdv + '">' + motif.libelle_type_rdv + '</option>');
                                    });
                                }
                            }

                            count = 0;
                            $.each(value['tabMotifAutreRDV'], function (index, value) {
                                tableau_data.push(value.tmprdv);
                                tableau_autre.push(value.libelle_type_rdv);
                                tableau_id.push(value.id_type_rdv);
                                count = count + 1;
                            });

                            if (value.id_planning === "") {
                                $("#id_lieu_prendre_rdv_calendar").trigger('change');
                            } else {
                                $("#id_lieu_prendre_rdv_calendar").attr('disabled', true);
                                $("#id_service_lieu").attr('disabled', true);
                            }

                            $('#id_globalplanning').val(value.id_planning);
                            if (idmotif != "" && idmotif != "0") {
                                $('#type_rdv_calendar').val(idmotif);
                                $('#type_rdv_calendar').change();
                            }

                            if (idlieurdv != "" && idlieurdv != "0") {
                                $('#id_lieu_prendre_rdv_calendar').val(idlieurdv);
                            } else {
                                $('#id_lieu_prendre_rdv_calendar').val(value['idlieu']);
                            }

                            if(idlieurdv!="" && idlieurdv!="0"){
                                $('#id_lieu_prendre_rdv_calendar').val(idlieurdv);
                            }else{
                                $('#id_lieu_prendre_rdv_calendar').val(value['idlieu']);
                            }
                            if (value['idService'] != ""){
                                $('#id_service_lieu').val(value['idService']);
                            }

                            if (value['bRemplacant']) {
                                $('#divMessageRemplacant').show();
                                $Message = "Rdv couplé avec " +
                                    $('#sMessageRemplacant').html(value['messageRemplacant']);

                            }

                            if (value['bcouple']) {
                                $('#divMessageAide').show();
                                $('#sMessageRdvAide').html(value['messageCouple']);
                                $('#id_rdv_aide').val(idaide);
                            } else {
                                $('#divMessageAide').hide();
                                $('#id_rdv_aide').val('');
                            }

                            $('#nom_patient_prendre_rdv_calendar').focus();
                        });
                    }
                });
            }


            function debloque_modification_patient_modal_prendre_rendez_vous_calendar() {

                $('#civilite_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#nom_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#prenom_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#nom_jeune_fille_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#adresse_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#ville_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#email_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#profession_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#assurance_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#couleur_patient_prendre_rdv_calendar').prop('disabled', false);

                $('#div_button_suivant_calendar').hide();
                $('#div_button_update_patient_calendar').show();

            }

            function modification_patient_modal_prendre_rendez_vous_calendar() {
                if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar').val())==false){
                    affiche_popup_message('Information', "Date de naissance incorrecte", 'Ok');
                    return false;
                }else{
                    $.ajax({
                        cache: false,
                        url: 'ajax/modif_patient.php',
                        data: 'identifiant_entite=' + $('#idc').val() + '&id_patient=' + $('#id_patient_prendre_rdv_calendar').val() + '&nom_mod_up=' + $('#nom_patient_prendre_rdv_calendar').val() + '&nom_fille_mod_up=' + $('#nom_jeune_fille_patient_prendre_rdv_calendar').val()
                            + '&prenom_mod_up=' + $('#prenom_patient_prendre_rdv_calendar').val() + '&tel_mod_up=' + $('#tel_mobile_patient_prendre_rdv_calendar').val() + '&tel_fixe_mod_up=' + $('#tel_fixe_patient_prendre_rdv_calendar').val()
                            + '&email_mod_up=' + $('#email_patient_prendre_rdv_calendar').val() + '&date_naissance_mod_up=' + $('#date_naissance_patient_prendre_rdv_calendar').val() + '&adresse_mod_up=' + $('#adresse_patient_prendre_rdv_calendar').val()
                            + '&code_postal_mod_up=' + $('#code_postal_patient_prendre_rdv_calendar').val() + '&ville_mod_up=' + $('#ville_patient_prendre_rdv_calendar').val() + '&num_secu_mod_up=' + $('#num_secu_patient_prendre_rdv_calendar').val()
                            + '&selectassurance=' + $('#assurance_patient_prendre_rdv_calendar').val() + '&medecin_traitant_mod_up=' + $('#medecin_traitant_patient_prendre_rdv_calendar').val() + '&ville_medecin_mod_up=' + $('#ville_medecin_patient_prendre_rdv_calendar').val()
                            + '&profession_mod_up=' + $('#profession_patient_prendre_rdv_calendar').val() + '&couleur=' + $('#couleur_patient_prendre_rdv_calendar').val() + '&remarque=' + $('#remarque_patient_prendre_rdv_calendar').val() + '&civilite_mod_up=' + $('#civilite_patient_prendre_rdv_calendar').val() +'&indicatif_mobile='+$('#tel_mobile_patient_prendre_rdv_calendar_indicatif').val()+'&indicatif_fixe='+$('#tel_fixe_patient_prendre_rdv_calendar_indicatif').val() ,
                        dataType: 'json',
                        success: function (json) {
                            $.each(json, function (index, value) {
                                if (value.success = true) {

                                    $('#civilite_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#nom_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#prenom_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#nom_jeune_fille_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#adresse_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#ville_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#email_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#profession_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#assurance_patient_prendre_rdv_calendar').prop('disabled', true);
                                    $('#couleur_patient_prendre_rdv_calendar').prop('disabled', true);

                                    $('#div_button_suivant_calendar').show();
                                    $('#div_button_update_patient_calendar').hide();

                                    $.pnotify({
                                        title: 'Modification de la fiche patient',
                                        text: '',
                                        type: 'success',
                                        addclass: "stack-bottomright",
                                        delay: 3000
                                    });
                                } else {
                                    $.pnotify({
                                        title: 'Modification de la fiche patient',
                                        text: value.message,
                                        type: 'error',
                                        addclass: "stack-bottomright",
                                        delay: 3000
                                    });
                                }

                            });

                        }
                    });

                }

            }

            function select_tmp(lavaleur) {

                $.ajax({
                    cache: false,
                    url: 'ajax/calcul_temps_rendez_vous_calendar.php',
                    data: 'iddocteur=' + $('#id_praticien_prendre_rdv_calendar').val() + '&idtyperdv=' + lavaleur + '&idlieu=' + $('#id_lieu_prendre_rdv_calendar').val(),
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {
                            $('#temps_consultation_calendar').val(value['tmprdv']);
                        });
                    }
                });

                $.ajax({
                    cache: false,
                    url: 'ajax/calcul_heure_patient_rendez_vous_calendar.php',
                    data: 'iddocteur=' + $('#id_praticien_prendre_rdv_calendar').val() + '&idtyperdv=' + lavaleur + '&heuredebut=' + $('#heure_reelle_prendre_rdv_calendar').val() + '&idlieu=' + $('#id_lieu_prendre_rdv_calendar').val(),
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {

                            $('#heure_patient_prendre_rdv_calendar').val(value['heurepatient']);

                        });
                    }
                });
            }

            function ajout_tout_rdv() {

                itaille = tableau_autre.length;
                $('#type_rdv_calendar').empty();
                $('#type_rdv_calendar').append('<option value="">Choisir un motif de RDV</option>');
                for (i = 0; i < itaille; i++) {
                    $('#type_rdv_calendar').append('<option value="' + tableau_id[i] + '">' + tableau_autre[i] + '</option>');
                }
                $("#btn_plus_rdv_modal_calendar").prop('disabled', true);
            }


            function getHistoriquePatient() {
                var idpatient = $('#id_patient_prendre_rdv_calendar').val();
                var identifiantentite = $('#idc').val();

                $('#attente_historique_patient_prendre_rdv_calendar').show();
                $('#pas_historique_patient_prendre_rdv_calendar').hide();
                $('#historique_patient_prendre_rdv_calendar').hide();
                //$('#boucle_historique_prendre_rdv_calendar').html("");

                $('#boucle_historique_prendre_rdv_calendar').isotope();
                $('#boucle_historique_prendre_rdv_calendar').isotope('destroy');

                $.ajax({
                    cache: false,
                    url: 'ajax/get_historique_patient.php',
                    data: 'idpatient=' + idpatient + '&identifiantentite=' + identifiantentite,
                    dataType: 'json',
                    success: function (json) {
                        $('#attente_historique_patient_prendre_rdv_calendar').hide();

                        if (json.length == 0) {
                            $('#pas_historique_patient_prendre_rdv_calendar').show();

                        } else {
                            var tabStatut = new Array();
                            $.ajax({
                                cache: false,
                                url: 'ajax/get_statut_patient.php',
                                data: '',
                                dataType: 'json',
                                async: false,
                                success: function (json) {
                                    $.each(json, function (index, value) {
                                        var taTemp = new Array();
                                        taTemp.push(value.id_status);
                                        taTemp.push(value.libelle_status);
                                        tabStatut.push(taTemp);
                                    });
                                }
                            });
                            var nb_p = 0;
                            var nb_t = 0;
                            var nb_abe = 0;
                            var nb_abne = 0;
                            $.each(json, function (index, value) {


                                $('#historique_patient_prendre_rdv_calendar').show();
                                var background = "";
                                if (value.status_rdv == "rdvplanifie") {
                                    background = "color:#27a1c2;";
                                    nb_p++;
                                } else if (value.status_rdv == "patienttraite") {
                                    background = "color:lime;";
                                    nb_t++;
                                } else if (value.status_rdv == "absenceexcusee") {
                                    background = "color:orange;";
                                    nb_abe++;
                                } else if (value.status_rdv == "absencenonexcusee" || value.status_rdv == "annulationparsms" || value.status_rdv == "annulationparvocal") {
                                    background = "color:red;";
                                    nb_abne++;
                                }
                                var str_abr_praticien = value.abreviation_praticien;
                                var str_abr_motif = value.abreviation_rdv;

                                if (value.status_rdv != "") {
                                    var boucle_historique = '<div class="element-item col-sm-12 ' + value.status_rdv + '" data-category="' + value.status_rdv + '" style="border:1px solid #CCCCCC;padding-top: 1px;padding-bottom: 1px;padding-right: 0px;padding-left: 0px; ' + background + '">' +
                                        value.abre_civilite_docteur +' ' + str_abr_praticien.toUpperCase() + ' - ' + value.date_rdv + ' à ' + value.heure_rdv + ' - ' + str_abr_motif.toUpperCase() + '<br/>' +
                                        '<span style="color:#000;">' + value.remarque_rdv + '</span>' +
                                        '</div>';
                                }

                                $('#boucle_historique_prendre_rdv_calendar').append(boucle_historique);

                            });

                            var txt_p = " Pl.";
                            if (nb_p > 1) {
                                txt_p = " Pl.";
                            }
                            var txt_t = " Tr.";
                            if (nb_t > 1) {
                                txt_t = " Tr.";
                            }
                            var txt_abe = " Abs. Ex.";
                            if (nb_abe > 1) {
                                txt_abe = " Abs. Ex.";
                            }
                            var txt_abne = " Abs. Non Ex.";
                            if (nb_abne > 1) {
                                txt_abne = " Abs. Non Ex.";
                            }
                            $('#libelle_rdv_planifie').html(nb_p + txt_p);
                            $('#libelle_rdv_traite').html(nb_t + txt_t);
                            $('#libelle_rdv_ab_excusee').html(nb_abe + txt_abe);
                            $('#libelle_rdv_ab_non_excusee').html(nb_abne + txt_abne);

                            $('#boucle_historique_prendre_rdv_calendar').isotope({
                                itemSelector: '.element-item',
                                filter: '.patienttraite'
                            });

                        }
                    }
                });

                return false;
            }


            function btn_calendar_mobile_day_prev() {
                var tabactive = $('#tabactive').val();
                $('#calendar_' + tabactive).fullCalendar('prev');
            }

            function btn_calendar_mobile_day_next() {
                var tabactive = $('#tabactive').val();
                $('#calendar_' + tabactive).fullCalendar('next');
            }

            function extractContent(html) {
                return (new DOMParser).parseFromString(html, "text/html").documentElement.textContent;
            }


            function supp_bouton_vert(idrdv) {
                var tabactive = $('#tabactive').val();
                $('#calendar_' + tabactive).fullCalendar('removeEvents', idrdv);
            }

            function changedaterdvrecurrent(ladate, lebouton, ladecoupe, joursemaine, dateaff, heureaff, jourliteral) {
                $('.' + ladate).removeClass('btn_widget_standard');
                $(lebouton).addClass('btn_widget_standard');
                $('#tabrdvrecurrenthidden-' + ladate).val(ladecoupe);
                $('#jourchoisi-' + ladate).html(jourliteral + " à " + heureaff);

            }

            function modifier_ligne_date_reccurent(id_jour_table) {

                $('#modalPrendreRendezVousRecurrent').modal('show');
                $('#praticien_prendre_rendez_vous_recurrent').val($('#id_praticien_prendre_rdv_calendar').val());
                $('#lieu_prendre_rendez_vous_recurrent').val($('#id_lieu_prendre_rdv_calendar').val());
                $('#consultation_prendre_rendez_vous_recurrent').val($('#type_rdv_calendar').val());
                $('#id_jour_recurrent').val(id_jour_table);

                var tabInfo = id_jour_table.split('-');
                $('#datepicker_rdv_recurrent').val(tabInfo[2] + "/" + tabInfo[1] + "/" + tabInfo[0]);
                $('#jour_prendre_rendez_vous_recurrent').val("");
                $('#horaire_prendre_rendez_vous_recurrent').val("");

                $('#datepicker_force_rdv_recurrent').val(tabInfo[2] + "/" + tabInfo[1] + "/" + tabInfo[0]);
                $('#heure_force_rdv_recurrent').val("");

                recherche_rdv_prendre_rendez_vous_recurrent();
            }


            function supprimer_ligne_date_reccurent(ligneasupp) {
                $("#" + ligneasupp).hide('slow', function () {
                    $("#" + ligneasupp).remove();
                });
            }

            function reduire_div_information_patient() {
                if ($('#div_info_patient_historique_complet').is(":hidden")) {
                    $('#div_info_patient_historique_complet').show('slow');
                    $('#div_title_historique').show();
                } else {
                    $('#div_info_patient_historique_complet').hide('slow');
                    $('#div_title_historique').hide();
                }

            }
            {/literal}

        </script>
