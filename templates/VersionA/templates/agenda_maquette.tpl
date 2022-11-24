<link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.css">
<link href="plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="js/liste_dispo.{listeDispo}.js?v={$numero_version_alaxione}"></script>

<script type="text/javascript" src="js/js_planning_dispo.{planningDispo2}</script>

<script type="text/javascript" src="js/jquery.contextmenu.{contextMenu2}.js?v={$numero_version_alaxione}"></script>

<script type="text/javascript" src='plugins/tagsInput/jquery.tagsinput.min.{tagsInput}.js'></script>

{literal}


    <style type="text/css">
        .ui-datepicker .ui-datepicker-calendar {
            width: 90%;
        }

        td.ui-datepicker-week-col {
            text-align: center;
            font-weight: 800;
            color: #fff;
            cursor: pointer;
        }

        .ui-state-hover,
        .ui-widget-content .ui-state-hover,
        .ui-widget-header .ui-state-hover,
        .ui-state-focus,
        .ui-widget-content .ui-state-focus,
        .ui-widget-header .ui-state-focus {
            border: 1px solid #999999;
            background: #dadada;
            font-weight: normal;
            color: #212121;
        }

        .ui-state-hover a,
        .ui-state-hover a:hover,
        .ui-state-hover a:link,
        .ui-state-hover a:visited,
        .ui-state-focus a,
        .ui-state-focus a:hover,
        .ui-state-focus a:link,
        .ui-state-focus a:visited {
            background-color: #05B2D2;
            color: #212121;
            text-decoration: none;
        }

        .clockpicker-popover {
            z-index: 999999 !important;
        }

        .stripe-salle-attente {
            background: repeating-linear-gradient(45deg,
                    #606dbc,
                    #606dbc 15px,
                    #465298 15px,
                    #465298 30px);
        }

        .stripe-salle-attente_fils {
            background: repeating-linear-gradient(45deg,
                    #606dbc,
                    #606dbc 15px,
                    #465298 15px,
                    #465298 30px);
            border-color: #f85d2c !important;
        }

        .fils_simple {
            border-color: #f85d2c !important;
        }

        .conge {
            background: repeating-linear-gradient(135deg,
                    #8bf0fc,
                    #8bf0fc 30px,
                    #8be6d7 30px,
                    #8be6d7 60px);
            font-size: xx-large;
            font-weight: 900;
            text-transform: uppercase;
            text-align: center;
            padding-top: 60px !important;
            /* display: flex;
             align-items: center;
             justify-content: center;*/
        }

        #date_selection_tagsinput {
            height: 263px !important;
        }

        div.tagsinput span.tag {
            border: 1px solid #5D9AD4;
            -moz-border-radius: 2px;
            -webkit-border-radius: 2px;
            display: block;
            float: left;
            padding: 5px;
            text-decoration: none;
            background: #27a1c2;
            color: #000;
            margin-right: 5px;
            margin-bottom: 5px;
            font-family: helvetica;
            font-size: 13px;
        }

        div.tagsinput span.tag a {
            font-weight: bold;
            color: #000;
            text-decoration: none;
            font-size: 11px;
        }

        .textBlack {
            color: #000 !important;
        }

        /*Maquette*/
        #calendar_1>.fc-toolbar.fc-header-toolbar {
            display: none;
        }

        th.fc-day-header.fc-widget-header {
            text-indent: -9999px;
            line-height: 0;
        }

        th.fc-day-header.fc-widget-header::after {
            text-indent: 0px;
            display: block;
            line-height: initial;
            padding-top: 2px;
        }



        th.fc-axis.fc-widget-header::after {
            content: 'Sem';
        }

        th.fc-day-header.fc-widget-header.fc-mon::after {
            content: 'Lundi';
        }

        th.fc-day-header.fc-widget-header.fc-tue::after {
            content: 'Mardi';
        }

        th.fc-day-header.fc-widget-header.fc-wed::after {
            content: 'Mercredi';
        }

        th.fc-day-header.fc-widget-header.fc-thu::after {
            content: 'Jeudi';
        }

        th.fc-day-header.fc-widget-header.fc-fri::after {
            content: 'Vendredi';
        }

        th.fc-day-header.fc-widget-header.fc-sat::after {
            content: 'Samedi';
        }

        th.fc-day-header.fc-widget-header.fc-sun::after {
            content: 'Dimanche';
        }
    </style>

    <!-- Calendar -->
    <script type="text/javascript">
        $(document).ready(function() {


            $("#datedebut_config").mask("99/99/9999");
            $("#datefin_config").mask("99/99/9999");
            $('#btnannulesauvegarde3').on('click', function () { 
                if ($('#activationConfig').data('id') == 1) {
                    $('#activationConfigMaquette')[0].checked = true;
                } else {
                    $('#activationConfigMaquette')[0].checked = false;   
                }   
                $('#activationConfigMaquette').trigger('change');
            });
            $('#btn-close').on('click', function () { 
                if ($('#activationConfig').data('id') == 1) {
                    $('#activationConfigMaquette')[0].checked = true;
                } else {
                    $('#activationConfigMaquette')[0].checked = false;   
                }   
                $('#activationConfigMaquette').trigger('change');
            });
            affiche_bouton_coller('copiecookie{/literal}{$id_maquette}{literal}');
            annule_copie_tranche('tranchecopiermaquette');
            isLoading = false;
            if (getCookieTranche() != null) {
                $('#btn_annule_copie_tranche').show();
            }

            $("#calendar_1").on('click', '.fc-month-button', function() {
                $('#btnopensauvegardepreference').hide();
                $('#btnopenimportepreference').hide();

            }).on('click', '.fc-agendaDay-button', function() {
                $('#btnopensauvegardepreference').hide();
                $('#btnopenimportepreference').hide();

            }).on('click', '.fc-agendaWeek-button', function() {
                $('#btnopensauvegardepreference').show();
                $('#btnopenimportepreference').show();
            });

            $('#sauvegarde_preference_jour_horaire').on('change', function() {

                if ($('#sauvegarde_preference_jour_horaire').val() === 'jour') {
                    $('#div_jour_semaine').show('slow');
                    $('#div_horaire').hide('slow');
                } else {
                    $('#div_jour_semaine').hide('slow');
                    $('#div_horaire').show('slow');
                }

            });

            $('#liste_importe_preference').on('change', function() {
                var tabDate;
                var nb_jour_import = parseInt($("#liste_importe_preference").val().split('_')[1]);
                $('#date_selection').importTags('');
                if (nb_jour_import === 1) {
                    $('#div_tranche_jour_importe_preference').show('slow');
                    $("#dateslect").datepicker("destroy");
                    $("#dateslect").datepicker({
                        showWeek: true,
                        weekHeader: "Sem.",
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        {/literal}
                            {if $active_dimanche_user == 'N'}
                                {literal}
                                    beforeShowDay: function(date) {
                                        var day = date.getDay();
                                        return [(day != 0), ''];
                                    },
                                    {/literal}{/if}{literal}
                                    onSelect: function(selectedDate) {
                                        tabDate = $('#date_selection').val().slice(",");

                                        if (tabDate.indexOf(selectedDate) > -1) {
                                            //alert("existe déjà");
                                        } else {
                                            $('#date_selection').addTag(selectedDate);
                                        }
                                        //$('#date_selection').val(tabDate.sort());

                                    }
                                });
                                $("#dateslect").datepicker("refresh");
                            } else {
                                $('#div_tranche_jour_importe_preference').show('slow');
                                $("#dateslect").datepicker("destroy");
                                $("#dateslect").datepicker({
                                    showWeek: true,
                                    weekHeader: "Sem.",
                                    dateFormat: 'dd/mm/yy',
                                    changeMonth: true,
                                    changeYear: true,
                                    {/literal}
                                        {if $active_dimanche_user == 'N'}
                                            {literal}
                                                beforeShowDay: function(date) {
                                                    var day = date.getDay();
                                                    return [(day != 0), ''];
                                                },
                                                {/literal}{/if}{literal}
                                                onSelect: function(dateText) {}
                                            });
                                            $("#dateslect").datepicker("refresh");
                                        }

                                        if ($('#dateclic').val() != '') {
                                            $('#dateslect').datepicker("setDate", new Date($('#dateclic').val()));
                                        }


                                        $('#nb_tranche_jour_importe_preference').val(nb_jour_import);
                                    });

                                    $('#basculer_agenda').on('change', function() {
                                        window.location.replace('main.php?dir=maqplanning&idpraticien={/literal}{$idpraticien}{literal}&guid=' + $('#basculer_agenda').val());
                                    });

                                    $("#modalSauvegardePreference").draggable({
                                        handle: ".modal-header"
                                    });

                                    $("#modalImportePreference").draggable({
                                        handle: ".modal-header"
                                    });

                                    $("#modalUpdatePreference").draggable({
                                        handle: ".modal-header"
                                    });

                                    /*for (let item of x) {
            console.log(item);
            item.addClass("textBlack");
        }*/
                                });


                                var oplus = {/literal}
                                    {if $isOplus} true 
                                    {else} false
                                    {/if}
                                    {literal};


                                        function open_modal() {

                                            //document.getElementById("myModalLabelinfordv").innerHTML="";
                                            $('#myModalLabelhome').html("&nbsp;");
                                            document.getElementById("iframerhome").src = "modal/modal_disponibilite_maquette.php?guid={/literal}{$guid}{literal}";
                                            $('#myModalHome').css("overflow-y", "scroll");
                                            $('#myModalHome').modal('show');
                                            setTimeout(function() {
                                                resizeIframe(document.getElementById('iframerhome'));
                                            }, 1000);

                                        }

                                        function open_modal_update(idunique, idtranche, iduniquepere, idtranchepere) {
                                            document.getElementById("myModalLabelinfordv").innerHTML = "";

                                            document.getElementById("iframerhome").src = "modal/modal_disponibilite_maquette.php?guid={/literal}{$guid}{literal}&id_maquette={/literal}{$id_maquette}{literal}&idunique=" + iduniquepere + "&idtranche=" + idtranchepere + "&actiontranche=modification&idtranchesup=" + idtranche;

                                            $('#myModalHome').css("overflow-y", "scroll");
                                            $('#myModalHome').modal('show');
                                            setTimeout(function() {
                                                resizeIframe(document.getElementById('iframerhome'));
                                            }, 1000);

                                        }

                                        function start_config_maquette(guid, id_user) {
                                            datedebut = $('#datedebut_config').val();
                                            datefin = $('#datefin_config').val();
                                            typereccurence = $('#idtyperecurrence').val();
                                            nbsemeaine = $('#nbrecurrence').val();
                                            activation = $('#activationConfig').val();
                                            intervallerecurence = $('#idintervallesemaine').val();
                                            fenetre = $('#idfenetre').val();
                                            typeacion = $('#idtypeaction').val();
                                            activctrl = "1";

                                            if($('#activctrlrdv').prop('checked')){
                                                activctrl = "1";
                                            }else {
                                                activctrl=0;
                                            }
                                            if(activation == 0){
                                                $('#activationConfig').data('id',0)
                                            }
                                            else {
                                                $('#activationConfig').data('id',1)
                                            }
                                            $.ajax({
                                                cache: false,
                                                type: "POST",
                                                url: 'api/api_maquette/ctrl_config',
                                                data: 'guid=' + guid + '&datedebut=' + datedebut + '&datefin=' + datefin + '&typerecurrence=' +
                                                    typereccurence + '&nombrerecurrence=' + nbsemeaine + '&activation=' + activation + '&fenetre=' +
                                                    fenetre + '&id_user=' + id_user + '&intervalle=' + intervallerecurence + '&typeaction=' +
                                                    typeacion+'&activctrl='+activctrl,
                                                headers: {
                                                    "x-alx-idc": $('#idc').val(),
                                                    "authorization": $('#email_user').val() + " " + $('#token_user').val()
                                                },
                                                dataType: 'json',
                                                success: function(json) {
                                                    if (json.result == "nop") {
                                                        alert(json.message);
                                                    } else {
                                                        $('#modalConfigurationMaquette').modal('hide');
                                                        if (activation == 0) {
                                                            $('#idboutonstop').hide();
                                                            $('#idboutonstart').show();
                                                        }
                                                        if (activation == 1) {
                                                            $('#idboutonstop').show();
                                                            $('#idboutonstart').hide();
                                                        }
                                                        post_config(guid, datedebut, datefin, typereccurence, nbsemeaine, activation, fenetre,
                                                            id_user, intervallerecurence, typeacion,activctrl);
                                                        $.pnotify({
                                                            title: 'La maquette a été appliquée',
                                                            text: 'Votre demande a bien été prise en compte et est traitée en arrière plan ',
                                                            type: 'success',
                                                            addclass: "stack-bottomright",
                                                            delay: 10000
                                                        });

                                                        //$('#modalConfigurationMaquette').modal('hide');
                                                    }

                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });


                                        }



                                        function post_config(guid, datedebut, datefin, typereccurence, nbsemeaine, activation, fenetre, id_user,
                                            intervallerecurence, typeacion,activctrl) {
                                            $.ajax({
                                                cache: false,
                                                type: "POST",
                                                url: 'api/api_maquette/config',
                                                data: 'guid=' + guid + '&datedebut=' + datedebut + '&datefin=' + datefin + '&typerecurrence=' +
                                                    typereccurence + '&nombrerecurrence=' + nbsemeaine + '&activation=' + activation + '&fenetre=' +
                                                    fenetre + '&id_user=' + id_user + '&intervalle=' + intervallerecurence + '&typeaction=' +
                                                    typeacion+'&activctrl='+activctrl,
                                                dataType: 'json',
                                                headers: {
                                                    "x-alx-idc": $('#idc').val(),
                                                    "authorization": $('#email_user').val() + " " + $('#token_user').val()
                                                },
                                                success: function(json) {
                                                    var vide = "";

                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });
                                        }


                                        function start_maquette(guid) {

                                            $.ajax({
                                                cache: false,
                                                url: 'api/api_maquette/start',
                                                data: 'guid=' + guid,
                                                dataType: 'json',
                                                headers: {
                                                    "x-alx-idc": $('#idc').val(),
                                                    "authorization": $('#email_user').val() + " " + $('#token_user').val()
                                                },
                                                success: function(json) {
                                                    $.pnotify({
                                                        title: 'Confirmation de la mise en route de la reccurrence de la maquette',
                                                        text: 'Vous avez bien activé la recurrence de cette maquette ',
                                                        type: 'success',
                                                        addclass: "stack-bottomright",
                                                        delay: 10000
                                                    });

                                                    $('#modalLancerMaquette').modal('hide');
                                                    $('#idboutonstop').show();
                                                    $('#idboutonstart').hide();

                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });
                                        }

                                        function stop_maquette(guid) {
                                            $.ajax({
                                                cache: false,
                                                url: 'api/api_maquette/stop',
                                                data: 'guid=' + guid,
                                                dataType: 'json',
                                                headers: {
                                                    "x-alx-idc": $('#idc').val(),
                                                    "authorization": $('#email_user').val() + " " + $('#token_user').val()
                                                },
                                                success: function(json) {
                                                    $.pnotify({
                                                        title: 'Confirmation arrêt de la reccurrence',
                                                        text: 'Vous avez bien arrêté la recurrence de cette maquette ',
                                                        type: 'success',
                                                        addclass: "stack-bottomright",
                                                        delay: 10000
                                                    });

                                                    $('#modalStopMaquette').modal('hide');
                                                    $('#idboutonstop').hide();
                                                    $('#idboutonstart').show();

                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });
                                        }

                                        function init_maquette(guid) {
                                            $.ajax({
                                                cache: false,
                                                url: 'api/api_maquette/maquette',
                                                data: 'guid=' + guid,
                                                dataType: 'json',
                                                headers: {
                                                    "x-alx-idc": $('#idc').val(),
                                                    "authorization": $('#email_user').val() + " " + $('#token_user').val()
                                                },
                                                success: function(json) {

                                                    //alert(json.datedebut);
                                                    $('#modalConfigurationMaquette').modal('show');

                                                    if (json.datedebut != "00/00/0000" || json.datedebut != "NULL") {
                                                        $('#datedebut_config').val(json.datedebut);
                                                    }

                                                    if (json.datedfin != "00/00/0000" || json.datedebut != "NULL" || json.datedfin !=
                                                        "29/12/3075") {
                                                        $('#datefin_config').val(json.datedfin);
                                                    }

                                                    if (json.type_recurrence_sauvegarde_tranche == "perso") {
                                                        $('#idtyperecurrence option[value="perso"]').prop('selected', true);
                                                        $('#idconfigspecnumbre').show();
                                                        $('#nbrecurrence').val(json.xsemeaine_sauvegarde_tranche);
                                                    } else {
                                                        $('#idconfigspecnumbre').hide();
                                                    }

                                                    if (json.type_recurrence_sauvegarde_tranche == "continue") {
                                                        $('#idtyperecurrence option[value="continue"]').prop('selected', true);
                                                    }

                                                    if (json.type_recurrence_sauvegarde_tranche == "paire") {
                                                        $('#idtyperecurrence option[value="paire"]').prop('selected', true);
                                                    }


                                                    if (json.Type_action_sauvegarde_tranche == "ecraser") {
                                                        $('#idtypeaction option[value="ecraser"]').prop('selected', true);
                                                    }

                                                    if (json.Type_action_sauvegarde_tranche == "fusionner") {
                                                        $('#idtypeaction option[value="fusionner"]').prop('selected', true);
                                                    }



                                                    if (json.type_recurrence_sauvegarde_tranche == "impaire") {
                                                        $('#idtyperecurrence option[value="impaire"]').prop('selected', true);
                                                    }

                                                    if (json.starstop_sauvegarde_tranche == 1) {
                                                        $('[data-toggle="switch"]').bootstrapSwitch('animate', true);
                                                        $('#idconfigspecnumbre2').show();
                                                        if (json.intervalle_recurence_sauvegarde_tranche == 3 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="3-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 2 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "semaine") {
                                                            $('#idfenetre option[value="2-semaine"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 1 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="1-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 2 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="2-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 4 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="4-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 5 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="5-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 6 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="6-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 7 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="7-mois"]').prop('selected', true);
                                                        }
                                                        if (json.intervalle_recurence_sauvegarde_tranche == 8 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="8-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 9 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="9-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 10 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="10-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 11 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "mois") {
                                                            $('#idfenetre option[value="11-mois"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 1 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "ans") {
                                                            $('#idfenetre option[value="1-ans"]').prop('selected', true);
                                                        }

                                                        if (json.intervalle_recurence_sauvegarde_tranche == 2 &&
                                                            json.type_intervalle_recurrence_sauvegarde_tranche == "ans") {
                                                            $('#idfenetre option[value="2-ans"]').prop('selected', true);
                                                        }



                                                    } else {
                                                        $('#idconfigspecnumbre2').hide();
                                                    }



                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });
                                        }

                                        function close_modal_principal() {
                                            $('#myModalHome').modal('hide');
                                        }

                                        function close_modal_principal_petit() {
                                            $('#myModalinfordv').modal('hide');
                                        }

                                        function open_modal_del(idunique, idtranche) {
                                            /*document.getElementById("myModalLabelinfordv").innerHTML = "";
document.getElementById("iframerdv").src = "modal/modal_disponibilite_suppression.php?id_maquette={/literal}{$id_maquette}{literal}";
                                            $('#iframerdv').css("overflow-y", "scroll");
                                            $('#myModalinfordv').modal('show');*/
                                            $('#modalSuppressionDate').modal('show');
                                        }

                                        function open_modal_duplicate(idunique, idtranche) {
                                            document.getElementById("myModalLabelinfordv").innerHTML = "";
                                            document.getElementById("iframerdv").src = "modal/modal_disponibilite_duplication.php?id_maquette={/literal}{$id_maquette}{literal}";
                                            $('#iframerdv').css("overflow-y", "scroll");
                                            $('#myModalinfordv').modal('show');
                                        }

                                        function refresh_calendar() {
                                            $('#calendar_1').fullCalendar('refetchEvents');
                                        }

                                        function reinit_modal_preference() {
                                            $('#sauvegarde_preference_libelle').val("");
                                            $('#sauvegarde_preference_description').val("");
                                            $('#sauvegarde_preference_visible').val("N");

                                            $("#checkbox-Lundi").prop("checked", false);
                                            $("#checkbox-Mardi").prop("checked", false);
                                            $("#checkbox-Mercredi").prop("checked", false);
                                            $("#checkbox-Jeudi").prop("checked", false);
                                            $("#checkbox-Vendredi").prop("checked", false);
                                            $("#checkbox-Samedi").prop("checked", false);
                                            $("#checkbox-Dimanche").prop("checked", false);

                                            $('#sauvegarde_preference_tranche_heuredebut').val("");
                                            $('#sauvegarde_preference_tranche_heurefin').val("");
                                            $('#sauvegarde_preference_tranche_jour').val("1");


                                            $('#div_formulaire_sauvegarde_preference').show();
                                            $('#div_attente_sauvegarde_preference').hide();
                                            $('#div_message_sauvegarde_preference').hide().html("");
                                        }

                                        function open_update_preference() {
                                            $('#modalUpdatePreference').modal('show');
                                            var guid_preference = $("#liste_importe_preference").val().split('_')[0];

                                            $('#div_formulaire_update_preference').hide();
                                            $('#div_attente_update_preference').show();
                                            $('#div_attente_update_preference').html(
                                                "<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>"
                                                );

                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/get_info_preference.php',
                                                data: 'guid=' + guid_preference,
                                                dataType: 'json',
                                                success: function(json) {
                                                    $.each(json, function(index, value) {
                                                        $('#div_attente_update_preference').hide();
                                                        $('#div_formulaire_update_preference').show();
                                                        $('#libelle_update_preference').val(value.libelle);
                                                        $('#description_update_preference').val(value.description);
                                                    });
                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });
                                        }


                                        function update_preference() {
                                            var guid_preference = $("#liste_importe_preference").val().split('_')[0];
                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/update_preference.php',
                                                data: 'guid=' + guid_preference + '&libelle=' + $("#libelle_update_preference").val() +
                                                    '&description=' + $("#description_update_preference").val(),
                                                dataType: 'json',
                                                success: function(json) {
                                                    $.each(json, function(index, value) {
                                                        //$('#div_attente_importe_preference').hide();
                                                        $('#div_message_update_preference').show();
                                                        if (value.success === true) {
                                                            get_liste_preference();
                                                            //$('#div_message_update_preference').html("<div class='alert alert-success' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-check-circle vd_green'></i></span>" + value.message + "</div><div style='margin-top:10px;' align='center'><button type='button' name='btnfermerimport' id='btnfermerimport' onclick='$(\"#modalImportePreference\").modal(\"hide\");' class='btn vd_btn vd_bg-grey'><span class='menu-icon'></span> Fermer</button></div>");
                                                            $('#modalUpdatePreference').modal('hide');

                                                        } else {
                                                            $('#div_message_update_preference').html(
                                                                "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>" +
                                                                value.message + "</div>");
                                                        }
                                                    });
                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_update_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });
                                        }

                                        function get_liste_preference() {

                                            $('#div_formulaire_importe_preference').show();
                                            $('#div_attente_importe_preference').hide();
                                            $('#div_message_importe_preference').hide().html("");
                                            $('#action_importe_preference').val("ecraser");
                                            $('#tranche_jour_importe_preference').val("1");
                                            $('#date_selection').importTags('');

                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/get_liste_preference.php',
                                                data: 'idpraticien=' + $("#sauvegarde_preference_idp").val() + '&idc=' + $(
                                                    "#sauvegarde_preference_idc").val(),
                                                dataType: 'json',
                                                success: function(json) {
                                                    var tmp_option = "";
                                                    $.each(json, function(index, value) {
                                                        tmp_option += '<option value="' + value.guid + '_' + value.nb_jour_different +
                                                            '" title="' + value.description + '">' + value.libelle + '</option>';
                                                    });
                                                    $("#liste_importe_preference").html(tmp_option);
                                                    $('#liste_importe_preference').change();
                                                }
                                            });
                                        }

                                        function valide_preference() {
                                            $('#div_message_sauvegarde_preference').hide();

                                            if ($('#sauvegarde_preference_libelle').val() === "") {
                                                $('#div_message_sauvegarde_preference').show().html(
                                                    "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Veuillez saisir un libellé</div>"
                                                    );
                                            } else {
                                                if ($('#sauvegarde_preference_jour_horaire').val() === 'jour') {
                                                    if ($('#form_sauvegarde_preference input[type=checkbox]:checked').length > 0) {
                                                        set_preference();
                                                    } else {
                                                        $('#div_message_sauvegarde_preference').show().html(
                                                            "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Veuillez cocher au minimum un jour de la semaine</div>"
                                                            );
                                                    }
                                                } else {
                                                    if ($('#sauvegarde_preference_tranche_heuredebut').val() != '' && $(
                                                            '#sauvegarde_preference_tranche_heurefin').val() != '') {
                                                        set_preference();
                                                    } else {
                                                        $('#div_message_sauvegarde_preference').show().html(
                                                            "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Veuillez cocher au minimum un jour de la semaine</div>"
                                                            );
                                                    }
                                                }
                                            }
                                        }

                                        function get_preference() {
                                            var dateOk = '';
                                            var tabDate = [];
                                            var moment = $('#calendar_1').fullCalendar('getDate');
                                            var ladate = new Date();
                                            ladate = moment.toDate();


                                            tabDate = $('#date_selection').val();

                                            $('#div_formulaire_importe_preference').hide();
                                            $('#div_attente_importe_preference').show();
                                            $('#div_attente_importe_preference').html(
                                                "<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>"
                                                );

                                            var guid_import = $("#liste_importe_preference").val().split('_')[0];
                                            //alert(tabDate);
                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/get_preference.php',
                                                data: 'idpraticien=' + $("#sauvegarde_preference_idp").val() + '&guid=' + guid_import +
                                                    '&action=' + $("#action_importe_preference").val() + '&tabDate=' + tabDate + '&nbjour=' + $(
                                                        '#nb_tranche_jour_importe_preference').val(),
                                                dataType: 'json',
                                                success: function(json) {
                                                    $.each(json, function(index, value) {
                                                        $('#div_attente_importe_preference').hide();
                                                        $('#div_message_importe_preference').show();
                                                        if (value.success === true) {
                                                            $('#div_message_importe_preference').html(
                                                                "<div class='alert alert-success' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-check-circle vd_green'></i></span>" +
                                                                value.message +
                                                                "</div><div style='margin-top:10px;' align='center'><button type='button' name='btnfermerimport' id='btnfermerimport' onclick='$(\"#modalImportePreference\").modal(\"hide\");' class='btn vd_btn vd_bg-grey'><span class='menu-icon'></span> Fermer</button></div>"
                                                                );
                                                            $('#calendar_1').fullCalendar('refetchEvents');
                                                        } else {
                                                            $('#div_message_importe_preference').html(
                                                                "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>" +
                                                                value.message + "</div>");
                                                        }
                                                    });
                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                    //log_erreur("widget_anesthesiste", "liste_rdv_disponible", xhr, ajaxOptions, thrownError);
                                                }
                                            });
                                        }

                                        function del_preference() {
                                            var guid_preference = $("#liste_importe_preference").val().split('_')[0];
                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/del_preference.php',
                                                data: 'guid=' + guid_preference,
                                                dataType: 'json',
                                                success: function(json) {
                                                    $.each(json, function(index, value) {
                                                        $('#div_attente_importe_preference').hide();
                                                        $('#div_message_importe_preference').show();
                                                        if (value.success === true) {
                                                            $('#div_message_importe_preference').html(
                                                                "<div class='alert alert-success' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-check-circle vd_green'></i></span>" +
                                                                value.message +
                                                                "</div><div style='margin-top:10px;' align='center'><button type='button' name='btnfermerimport' id='btnfermerimport' onclick='$(\"#modalImportePreference\").modal(\"hide\");' class='btn vd_btn vd_bg-grey'><span class='menu-icon'></span> Fermer</button></div>"
                                                                );
                                                            get_liste_preference();
                                                        } else {
                                                            $('#div_message_importe_preference').html(
                                                                "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>" +
                                                                value.message + "</div>");
                                                        }
                                                    });
                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_importe_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });

                                        }

                                        function set_preference() {

                                            var dateOk = '';
                                            var dateFinRecup = '';
                                            var moment = $('#calendar_1').fullCalendar('getDate');
                                            var ladate = new Date();
                                            ladate = moment.toDate();
                                            var tabDate = [];

                                            var n = 0;

                                            if ($('#sauvegarde_preference_jour_horaire').val() === 'jour') {
                                                if ($('input[name=lundi]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 1));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                                if ($('input[name=mardi]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 2));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                                if ($('input[name=mercredi]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 3));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                                if ($('input[name=jeudi]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 4));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                                if ($('input[name=vendredi]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 5));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                                if ($('input[name=samedi]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 6));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                                if ($('input[name=dimanche]').is(':checked')) {
                                                    dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + 7));
                                                    tabDate[n] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) +
                                                        '/' + dateOk.getFullYear());
                                                    n++;
                                                }
                                            } else {
                                                var nbtranchejour = parseInt($('#sauvegarde_preference_tranche_jour').val());
                                                dateOk = new Date(ladate.setDate(ladate.getDate() - ladate.getDay() + nbtranchejour));
                                                tabDate[0] = (("0" + dateOk.getDate()).slice(-2) + '/' + ("0" + (dateOk.getMonth() + 1)).slice(-2) + '/' +
                                                    dateOk.getFullYear());

                                            }

                                            $('#div_formulaire_sauvegarde_preference').hide();
                                            $('#div_attente_sauvegarde_preference').show();
                                            $('#div_attente_sauvegarde_preference').html(
                                                "<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>"
                                                );

                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/set_preference.php',
                                                data: 'libelle=' + $('#sauvegarde_preference_libelle').val() + '&description=' + $(
                                                        "#sauvegarde_preference_description").val() + '&jourhoraire=' + $(
                                                        '#sauvegarde_preference_jour_horaire').val() +
                                                    '&visible=' + $("#sauvegarde_preference_visible").val() + '&heuredebut=' + $(
                                                        "#sauvegarde_preference_tranche_heuredebut").val() + '&heurefin=' + $(
                                                        "#sauvegarde_preference_tranche_heurefin").val() +
                                                    '&idpraticien=' + $("#sauvegarde_preference_idp").val() + '&idc=' + $(
                                                        "#sauvegarde_preference_idc").val() + '&tabdate=' + tabDate,
                                                dataType: 'json',
                                                success: function(json) {
                                                    $.each(json, function(index, value) {
                                                        $('#div_attente_sauvegarde_preference').hide();
                                                        $('#div_message_sauvegarde_preference').show();
                                                        if (value.success === true) {
                                                            $('#div_message_sauvegarde_preference').html(
                                                                "<div class='alert alert-success' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-check-circle vd_green'></i></span>" +
                                                                value.message +
                                                                "</div><div style='margin-top:10px;' align='center'><button type='button' name='btnfermersauvegarde' id='btnfermersauvegarde' onclick='$(\"#modalSauvegardePreference\").modal(\"hide\");' class='btn vd_btn vd_bg-grey'><span class='menu-icon'></span> Fermer</button></div>"
                                                                );
                                                        } else {
                                                            $('#div_message_sauvegarde_preference').html(
                                                                "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>" +
                                                                value.message + "</div>");
                                                        }

                                                    });
                                                },
                                                error: function(xhr, ajaxOptions, thrownError) {
                                                    $('#div_message_sauvegarde_preference').html(
                                                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                                                        );
                                                }
                                            });

                                            return false;

                                        }

                                        //fonction copier du rdv
                                        function copier_tranche(id_tranche,type) {
                                            setCookieTranche(id_tranche);
                                            $('#btn_annule_copie_tranche').show();
                                            if(type=="j") {
                                                $('#btn_annule_copie_tranche').val('Annuler la copie de la journée')
                                            }
                                            $.pnotify({
                                                title: 'Copier',
                                                text: 'Tranche copiée !',
                                                type: 'success',
                                                addclass: "stack-bottomright",
                                                delay: 3000
                                            });
                                        }

                                        var isLoading = false;

                                        function setLoading(isOn) {
                                            isLoading = isOn;
                                            if (isOn) {
                                                $('#modalloading').show();
                                            } else {
                                                $('#modalloading').hide();
                                            }
                                        }

                                        function coller_tranche(id_tranche, leday, lhour) {
                                            //if (confirm('Etes-vous sûr de vouloir coller la tranche le '+leday+' à '+lhour+' ?')) {
                                            if (isLoading) {
                                                return;
                                            }
                                            setLoading(true);

                                            $.ajax({
                                                cache: false,
                                                url: 'ajax/coller_tranche_maquette.php',
                                                data: 'id_tranche=' + id_tranche + '&date_tranche=' + leday + '&heure_tranche=' + lhour,
                                                dataType: 'json',
                                                success: function(json) {
                                                    $.each(json, function(index, value) {
                                                        setLoading(false);
                                                        if (value.success === true) {
                                                            $('#calendar_1').fullCalendar('refetchEvents');
                                                            $.pnotify({
                                                                title: 'Coller',
                                                                text: value.message_html,
                                                                type: 'success',
                                                                addclass: "stack-bottomright",
                                                                delay: 3000
                                                            });
                                                        } else {
                                                            $.pnotify({
                                                                title: 'Coller',
                                                                text: value.message_html,
                                                                type: 'error',
                                                                addclass: "stack-bottomright",
                                                                delay: 3000
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                            //}
                                        }

                                        function getCookieTranche() {
                                            var nameEQ = "tranchecopiermaquette=";
                                            var ca = document.cookie.split(';');
                                            for (var i = 0; i < ca.length; i++) {
                                                var c = ca[i];
                                                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                                                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
                                            }
                                            return null;
                                        }

                                        function checkCookie() {
                                            var value = getCookieTranche();
                                            if(value == null || value==""){
                                                $('#btn_annule_copie_tranche').hide();
                                            }
                                        }

                                        window.setInterval(checkCookie, 100); // run every 100 ms

                                        function setCookieTranche(sValue) {
                                            var today = new Date(),
                                                expires = new Date();
                                            expires.setTime(today.getTime() + (10 * 60 * 1000));
                                            document.cookie = "tranchecopiermaquette=" + sValue + ";expires=" + expires.toGMTString();
                                        }

                                        // Function qui permet d'annuler le bouton coller
                                            function annule_copie_tranche(namecookie) {
                                                $('#btn_annule_copie_tranche').hide();
                                                var today = new Date(),
                                                    expires = new Date();
                                                expires.setTime(today.getTime() - 1);
                                                document.cookie = namecookie + "=;expires=" + expires.toGMTString();
                                            }

                                            function del_tranche(id_tranche, type_tranche) {
                                                if (confirm('Voulez-vous vraiment supprimer ?')) {
                                                    $.ajax({
                                                        cache: false,
                                                        url: 'ajax/del_tranche_maquette.php',
                                                        data: 'id_tranche=' + id_tranche + '&type_tranche=' + type_tranche,
                                                        dataType: 'json',
                                                        success: function(json) {
                                                            $.each(json, function(index, value) {
                                                                if (value.success == 1) {
                                                                    $('#calendar_1').fullCalendar('refetchEvents');

                                                                    $('#modalFicheRendezVous').modal('hide');
                                                                    $.pnotify({
                                                                        title: 'Suppression',
                                                                        text: value.message_html,
                                                                        type: 'success',
                                                                        addclass: "stack-bottomright",
                                                                        delay: 3000
                                                                    });
                                                                } else {
                                                                    $.pnotify({
                                                                        title: 'Suppression',
                                                                        text: value.message_html,
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

                                            function del_tranche_date() {
                                                if (confirm('Voulez-vous vraiment supprimer la période ?')) {
                                                    $.ajax({
                                                        cache: false,
                                                        url: 'ajax/del_tranche_maquette.php',
                                                        data: 'id_maquette=' + $('#id_maquette').val() + '&datedebut=' + $('#datedebut').val() +
                                                            '&datefin=' + $('#datefin').val(),
                                                        dataType: 'json',
                                                        success: function(json) {
                                                            $.each(json, function(index, value) {
                                                                if (value.success === 1) {
                                                                    $('#calendar_1').fullCalendar('refetchEvents');

                                                                    $('#modalSuppressionDate').modal('hide');
                                                                    $.pnotify({
                                                                        title: 'Suppression',
                                                                        text: value.message_html,
                                                                        type: 'success',
                                                                        addclass: "stack-bottomright",
                                                                        delay: 3000
                                                                    });
                                                                } else {
                                                                    $.pnotify({
                                                                        title: 'Suppression',
                                                                        text: value.message_html,
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
                                        </script>
                                    {/literal}

                                    <input id="dateclic" type="hidden" value="">
                                    <div class="vd_title-section clearfix">
                                        <div class="vd_panel-header no-menu" style="margin-bottom:15px;">
                                            <h1 id="title_maquette" style="text-align:center">{$TitreCalandrier}</h1>
                                            <h4 style="text-align:center;margin-top: 10px;">{$description}</h4>
                                            <h4 style="text-align:center;margin-top: 10px;">{$sNomcreateur}</h4>
                                            <small class="subtitle"></small>
                                        </div>
                                        <input type="hidden" value="{$bmodiftranche}" id="idmodif">


                                        {if $bsucess}
                                            <div class="alert alert-success">
                                                <button type="button" class="close pop_up_succes" data-dismiss="alert" aria-hidden="true"><i
                                                        class="icon-cross"></i>
                                                </button>
                                                <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
                                                <h4 class="text_popup_bold" style="margin-bottom: 1px;">{$sMessageSucess}</h4>
                                            </div>

                                        {/if}


                                        {if $berror}
                                            <div class="alert alert-danger">
                                                <button type="button" class="close pop_up_danger" data-dismiss="alert" aria-hidden="true"><i
                                                        class="icon-cross"></i>
                                                </button>
                                                <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                                                <h4 class="text_popup_bold" style="margin-bottom: 1px;">{$sMessageError}</h4>

                                            </div>

                                        {/if}

                                        <div class="col-sm-9">

                                        {if $bcreationtranche}
                                                <button type="button" class="btn vd_btn vd_bg-green" onclick="open_modal();">
                                                    <span class="menu-icon"><i class="fa fa-fw fa-plus-circle"></i></span> Ajouter une tranche
                                                </button>


                                        {/if}

                                        {if $bconfig}
                                                <button type="button" data-original-title="Tooltip on right" class="btn vd_btn"
                                                    style="color:#FFFFFF !important; background-color: #0daba2 !important;"
                                                    data-original-title="modifer le nom de la maquette" onclick="$('#modalmodifnommaquette').modal('show');">
                                                    Modifier le libellé
                                                </button>

                                                <button type="button" class="btn vd_btn vd_bg-green"
                                                    style="color:#FFFFFF !important; background-color: #c94b46 !important;" onclick="init_maquette('{$guid}') ">
                                                    Appliquer
                                                </button>

                                                <button type="button" data-original-title="Tooltip on right" class="btn vd_btn"
                                                    style="color:#FFFFFF !important; background-color: #ac2925 !important;"
                                                    data-original-title="supprimer la maquette"
                                                    onclick="var bconfirm=confirm('Voulez vous supprimer cette maquette');if(bconfirm)location.replace('main.php?dir=maqplanning&validation=supp&idpraticien={$idpraticien}&guid={$guid}')">
                                                    Supprimer la Maquette
                                                </button>

                                                <input type="button" class="btn vd_btn" id="btn_annule_copie_tranche"
                                                    style="color:#FFFFFF !important; background-color: red !important;display:none"
                                                    onclick="annule_copie_tranche('tranchecopiermaquette')" value="Annuler la copie de la tranche" />


                                        {/if}


                                            <button type="button" class="btn vd_btn vd_bg-green"
                                                onclick="location.replace('main.php?dir=gestiondiposv2&identifiant_user={$idpraticien}')">
                                                Retour planning
                                            </button>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="controls">
                                                <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
                                                    rel="stylesheet" />
                                                <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                                                <select name="lstAgendaActif" class="js-example-basic-multiple" id="basculer_agenda">
                                                    <option>Sélectionner une maquette</option>

                                        {foreach name="lstAgendaActif" from=$lstAgendaActif item=objAgenda}
                                                        <option value="{$objAgenda['guid_maquette']}"

                                            {if {$objAgenda['guid_maquette']}==$guid}selected
                                            {/if}>
                                                            {$objAgenda['nom_maquette']}</option>
                                                        </option>

                                        {/foreach}
                                                </select>

                                            </div>
                                        </div>

                                        {literal}
                                            <script type="text/javascript">
                                                // In your Javascript (external .js resource or <script> tag)
                                                $(document).ready(function() {
                                                    $('.js-example-basic-multiple').select2();
                                                });
                                            </script>

                                        {/literal}


                                        {if $guid!=""}
                                            <div class="col-sm-12" style="margin-top: 10px;">
                                                <span style="    font-size: 15px;color: green;font-weight: bold;">{$sMessageNbrplanning}</span>
                                            </div>

                                        {/if}

                                        <div class="col-sm-12" style="margin-top: 10px;">
                                            <a id="btn_mini_calendar" style="margin-right: 10px;" class="mega-link" href="javascript:void(0);" title=""
                                                onclick="affiche_mini_calendar();">
                                                <span class="mega-icon">
                                                    <i class="fa fa-calendar" style="font-size:xx-large;"></i>
                                                </span>
                                            </a>
                                            <div id="div_affiche_mini_calendar" style="position: absolute; z-index: 999;">
                                                <div align='center' id="datemenupicker"></div>
                                            </div>

                                            <input type="button" class="btn vd_btn" id="idboutoncoller"
                                                style="color:#FFFFFF !important; background-color: #2dab28 !important;display:none"
                                                onclick="var moment = $('#calendar_1').fullCalendar('getDate');coller_semaine('copiecookie{$id_maquette}',moment.format(),'{$identifiant_user}');"
                                                value="coller" />

                                            <input type="button" class="btn vd_btn" id="idboutonvidercache"
                                                style="color:#FFFFFF !important; background-color: red !important;display:none"
                                                onclick="annule_opier('copiecookie{$id_maquette}')" value="Annule le copier" />

                                        </div>


                                    </div>
                                    <div class="vd_content-section clearfix">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="panel widget light-widget panel-bd-top">
                                                    <div class="panel-body">

                                        {literal}
                                                            <!-- Calendar -->
                                                            <script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    $('#calendar_1').fullCalendar({
                                                                            header: {
                                                                                left: 'prev,next today',
                                                                                center: 'title',

                                                                            },
                                                                            
                                        {/literal}
                                        {if $active_dimanche_user == 'N'}
                                            {literal}hiddenDays: [ 0 ],
                                            {/literal}
                                        {/if}
                                        {literal}      //on n'affiche pas le dimanche
                                                                            lang: 'fr', //langue francais
                                                                            editable: false, //calendrier modifiable
                                                                            weekNumbers: false, //on affiche le num de semaine
                                                                            scrollTime: "07:00:00", //le scroll débute à 7h
                                                                            minTime: "07:00:00", //le calendar demarre à 7h
                                                                            maxTime: "22:00:00", //le calendar fini à 20h
                                                                            slotLabelFormat: 'H:mm',
                                                                            slotLabelInterval: '00:' + {/literal}
                                                                                {if $affichage_agenda_slot_duration != ''}{$affichage_agenda_slot_duration}
                                                                                {else}15
                                                                                {/if}
                                                                                {literal},
                                                                                    slotDuration: '00:' + {/literal}
                                                                                        {if $affichage_agenda_slot_duration != ''}{$affichage_agenda_slot_duration}
                                                                                        {else}15
                                                                                        {/if}
                                                                                        {literal}+ ':00',
                                                                                            slotEventOverlap: false, //les event ne se chevoche pas
                                                                                            defaultView: 'agendaWeek', //afficher la semaine par defaut
                                                                                            allDaySlot: false,
                                                                                            events: {
                                                                                                url: 'ajax/myfedd_maquette.php',
                                                                                                type: 'GET',
                                                                                                async: true,
                                                                                                dataType: 'json',
                                                                                                data: function() {
                                                                                                    return {
                                                                                                        guid: '{/literal}{$guid}{literal}'
                                                                                                    };
                                                                                                }
                                                                                            },
                                                                                            eventRender: persoEventAfterRender,
                                                                                            eventClick: function(calEvent, jsEvent, view) {
                                                                                                {/literal}{literal}open_modal_update(calEvent.idunique, calEvent.idtranche, calEvent.iduniquepere, calEvent.idtranchepere);{/literal}{literal}
                                                                                            },
                                                                                            dayClick: function(date, jsEvent, view) {
                                                                                                if (getCookieTranche() != null) {
                                                                                                    var leday = moment(date).format('DD/MM/YYYY');
                                                                                                    var lhour = moment(date).format('HH:mm');
                                                                                                    coller_tranche(getCookieTranche(), leday, lhour);
                                                                                                } else {
                                                                                                    get_liste_preference();
                                                                                                    $('#dateclic').val(date);
                                                                                                    $('#modalImportePreference').modal('show');
                                                                                                }

                                                                                            },
                                                                                            dayRender: function(date, cell) {
                                                                                                cell.on('dblclick', {date: date}, function (e) {
                                                                                                alert('double');
                                                                                            });

                                                                                    }
                                                                                });

                                                                                $('#calendar_1').fullCalendar('gotoDate', '{/literal}{$dateposition}{literal}');
                                                                                setTimeout(function() {
                                                                                $('.fc-scroller').css('height', '1440px');
                                                                                }, 500);


                                                                                });

                                                                                function persoEventAfterRender(event, element, view) {

                                                                                    element.find("div.fc-title").html("<span style='color:#000;'>" + event.title + "</span>");
                                                                                    element.find("div.fc-time").css("color", "#000");
                                                                                    if (event.actifplanning == "N") {

                                                                                    }
                                                                                    if (event.traitencour == "ok") {
                                                                                        $('#div_message_en_cours').show();
                                                                                    } else {
                                                                                        $('#div_message_en_cours').hide();
                                                                                    }
                                                                                    if (event.className == "conge") {
                                                                                        element.find("div.fc-time").css("display", "none");
                                                                                        element.find("div.fc-bg").css("border", "0");
                                                                                        element.find("div.fc-title").html("<span style='color:#000;'>" + event.title +
                                                                                            "</span>");
                                                                                    }
                                                                                    if ((typeof event.idtranche !== 'undefined') && (event.idtranche != 0)) {
                                                                                        var menu1 = [{
                                                                                                'Copier la tranche': {
                                                                                                    onclick: function(menuItem, menu) {
                                                                                                        copier_tranche(event.idtranche+'_d','d');
                                                                                                        $(".menu_custom_alaxione").hide();
                                                                                                        return true;
                                                                                                    },
                                                                                                    title: 'Copier la tranche'
                                                                                                }
                                                                                            },
                                                                                            {
                                                                                            'Copier la journee': {
                                                                                                onclick: function(menuItem, menu) {
                                                                                                    copier_tranche(event.idtranche+'_j','j');
                                                                                                    $(".menu_custom_alaxione").hide();
                                                                                                    return true;
                                                                                                },
                                                                                                title: 'Copier la journee'
                                                                                            }
                                                                                        },
                                                                                            {
                                                                                                'Supprimer la tranche': {
                                                                                                    onclick: function(menuItem, menu) {
                                                                                                        del_tranche(event.idtranche, "1");
                                                                                                        $(".menu_custom_alaxione").hide();
                                                                                                        return true;
                                                                                                    },
                                                                                                    icon: 'css/delete_icon.gif',
                                                                                                    title: 'Supprimer la tranche'
                                                                                                }
                                                                                            },
                                                                                            {
                                                                                                'Supprimer la journée': {
                                                                                                    onclick: function(menuItem, menu) {
                                                                                                        del_tranche(event.idtranche, "2");
                                                                                                        $(".menu_custom_alaxione").hide();
                                                                                                        return true;
                                                                                                    },
                                                                                                    icon: 'css/delete_icon.gif',
                                                                                                    title: 'Supprimer la journée'
                                                                                                }
                                                                                            },
                                                                                            {
                                                                                                'Supprimer la semaine': {
                                                                                                    onclick: function(menuItem, menu) {
                                                                                                        del_tranche(event.idtranche, "3");
                                                                                                        $(".menu_custom_alaxione").hide();
                                                                                                        return true;
                                                                                                    },
                                                                                                    icon: 'css/delete_icon.gif',
                                                                                                    title: 'Supprimer la semaine'
                                                                                                }
                                                                                            }

                                                                                        ];

                                                                                        element.bind('mousedown', function(e) {
                                                                                            if (e.which == 3) {

                                                                                                $(".menu_custom_alaxione").hide();
                                                                                                element.contextMenu(menu1, {
                                                                                                    className: 'menu_custom_alaxione',
                                                                                                    theme: 'gloss',
                                                                                                    showSpeed: 200,
                                                                                                    hideSpeed: 200,
                                                                                                    showTransition: 'fadeIn',
                                                                                                    hideTransition: 'fadeOut',
                                                                                                    shadow: false,
                                                                                                    useIframe: false
                                                                                                });
                                                                                            }
                                                                                        });
                                                                                    }
                                                                                }
                                                                            </script>
                                                                        {/literal}
                                                                        <div id="calendar_1" class="mgtp-10"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <!-- [DEBUT] Modal dupliquer le maquette -->
                                                    <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalStopMaquette" tabindex="-1"
                                                        role="dialog" aria-labelledby="LabelmmodalStopMaquette" aria-hidden="false">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header vd_bg-blue vd_white">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                                                    </button>
                                                                    <h4 class="modal-title" id="LabelmodalStopMaquettetext">Arreter la récurrence de la maquette</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                                                                    <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                                                                    <div id="div_formulaire_sauvegarde_preference">
                                                                        <div class="col-sm-12" style="padding-top:10px;">
                                                                            <form method="" id="form1" name="form1">


                                                                                <input type="hidden" name="sauvegarde_preference_idc" id="sauvegarde_preference_idc1"
                                                                                    value="{$idc}" />
                                                                                <input type="hidden" name="guid" id="guid1" value="{$guid}" />

                                                                                <input type="hidden" name="idpraticien" id="idpraticien1" value="{$idpraticien}" />
                                                                                <input type="hidden" name="dir" value="maqplanning" />
                                                                                <input type="hidden" name="validation" value="stop" />

                                                                                <div class="form-group">
                                                                                    <label class="control-label">Attention cette action bloquera la création automatique de
                                                                                        la récurrence
                                                                                    </label>
                                                                                </div>

                                                                                <div class="col-sm-12" style="margin-top:10px;" align="center">
                                                                                    <button type="button" name="btnconfirmesauvegarde" onclick="stop_maquette('{$guid}')"
                                                                                        class="btn vd_btn vd_bg-green">Arreter
                                                                                    </button>
                                                                                    &nbsp;&nbsp;
                                                                                    <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde1"
                                                                                        onclick="$('#modalStopMaquette').modal('hide');" class="btn vd_btn vd_bg-grey"><span
                                                                                            class="menu-icon"></span> Fermer
                                                                                    </button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- [FIN] Modal dupliquer la maquette-->

                                                    <!-- [DEBUT] Modal dupliquer le maquette -->
                                                    <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalDupliqueMaquette" tabindex="-1"
                                                        role="dialog" aria-labelledby="LabelmodalDupliqueMaquette" aria-hidden="false">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header vd_bg-blue vd_white">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                                                    </button>
                                                                    <h4 class="modal-title" id="LabelmodalDupliqueMaquetteftext">Dupliquer la maquette</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                                                                    <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                                                                    <div id="div_formulaire_sauvegarde_preference">
                                                                        <div class="col-sm-12" style="padding-top:10px;">
                                                                            <form id="form2" name="form2">

                                                                                <input type="hidden" name="idpraticien" id="idpraticien3" value="{$idpraticien}" />
                                                                                <input type="hidden" name="dir" value="maqplanning" />
                                                                                <input type="hidden" name="validation" value="start" />

                                                                                <input type="hidden" name="sauvegarde_preference_idc" id="sauvegarde_preference_idc2"
                                                                                    value="{$idc}" />
                                                                                <input type="hidden" name="guid" id="guid2" value="{$guid}" />

                                                                                <div class="form-group">
                                                                                    <label class="control-label">Libelle de la nouvelle maquette
                                                                                    </label>
                                                                                    <div class="controls">
                                                                                        <div class="controls">
                                                                                            <input type="text" id="libelle_maquette" name="libelle_update_preference"
                                                                                                placeholder="Libellé de la sauvegarde" value="" class="required" required>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-12" style="margin-top:10px;" align="center">
                                                                                    <button type="button" name="btnconfirmesauvegarde" id="btnconfirmesauvegarde1"
                                                                                        onclick="valide_preference();" class="btn vd_btn vd_bg-green">Dupliquer
                                                                                    </button>
                                                                                    &nbsp;&nbsp;
                                                                                    <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde2"
                                                                                        onclick="$('#modalDupliqueMaquette').modal('hide');"
                                                                                        class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer
                                                                                    </button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- [FIN] Modal dupliquer la maquette-->

                                                    <!-- [DEBUT] Modal configuration reccurence maquette le maquette -->
                                                    <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalConfigurationMaquette" tabindex="-1"
                                                        role="dialog" aria-labelledby="LabelmodalConfigurationMaquette" aria-hidden="false" data-keyboard="false" data-backdrop="static">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header vd_bg-blue vd_white">
                                                                    <button type="button" class="close" id="btn-close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                                                    </button>
                                                                    <h4 class="modal-title" id="LabelmodalConfigurationMaquette">Configuration de la récurrence </h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                                                                    <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                                                                    <div id="div_formulaire_sauvegarde_preference">
                                                                        <div class="col-sm-12" style="padding-top:10px;">
                                                                            <form id="form3" name="form3">


                                                                                <input type="hidden" name="sauvegarde_preference_idc" id="sauvegarde_preference_idc3"
                                                                                    value="{$idc}" />
                                                                                <input type="hidden" name="guid" id="guid3" value="{$guid}" />
                                                                                <input type="hidden" name="idpraticien" id="idpraticien4" value="{$idpraticien}" />
                                                                                <input type="hidden" name="dir" value="maqplanning" />
                                                                                <input type="hidden" name="validation" value="config" />



                                                                                <div class="col-sm-6 controls">
                                                                                    <div id="divdatedebut">
                                                                                        <label>Date de début</label>
                                                                                        <div class="input-group">
                                                                                            <input type="text" value="" name="datedebut" id="datedebut_config" required
                                                                                                class="required input-modal-date-left">
                                                                                            <span class="input-group-addon input-modal-date-right"
                                                                                                id="datepicker-icon-trigger" data-datepicker="#datedebut_config">
                                                                                                <i class="fa fa-calendar"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        {literal}
                                                                                            <script type="text/javascript">
                                                                                                let daterdv = new Date(new Date().setFullYear(new Date().getFullYear() + 2))
                                                                                                $(document).ready(function() {
                                                                                                    $("#datedebut_config").datepicker({
                                                                                                        dateFormat: 'dd/mm/yy',
                                                                                                        changeMonth: true,
                                                                                                        showWeek: true,
                                                                                                        minDate: 0,
                                                                                                        maxDate: daterdv,
                                                                                                        changeYear: true,
                                                                                                        onSelect: function(selectedDate) {
                                                                                                            $("#datefin_config").val(selectedDate);
                                                                                                        }
                                                                                                    });
                                                                                                    $('[data-datepicker]').click(function(e) {
                                                                                                        var data = $(this).data('datepicker');
                                                                                                        $(data).focus();
                                                                                                    });
                                                                                                });
                                                                                            </script>
                                                                                        {/literal}
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-sm-6 controls">
                                                                                    <div id="divdatefin" {if $bactivestart}style="display:none;"{/if}>
                                                                                        <label>Date de fin</label>
                                                                                        <div class="input-group">
                                                                                            <input type="text" value="" name="datefin" id="datefin_config" required
                                                                                                class="required input-modal-date-left">
                                                                                            <span class="input-group-addon input-modal-date-right"
                                                                                                id="datepicker-icon-trigger" data-datepicker="#datefin_config">
                                                                                                <i class="fa fa-calendar"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        {literal}
                                                                                            <script type="text/javascript">
                                                                                                $(document).ready(function() {
                                                                                                    $("#datefin_config").datepicker({
                                                                                                        dateFormat: 'dd/mm/yy',
                                                                                                        changeMonth: true,
                                                                                                        showWeek: true,
                                                                                                        minDate: 0,
                                                                                                        maxDate: daterdv,
                                                                                                        changeYear: true
                                                                                                    });
                                                                                                    $('[data-datepicker]').click(function(e) {
                                                                                                        var data = $(this).data('datepicker');
                                                                                                        $(data).focus();
                                                                                                    });
                                                                                                });
                                                                                            </script>
                                                                                        {/literal}
                                                                                    </div>
                                                                                </div>



                                                                                <div class="col-sm-12" style="padding-left: 0px;padding-right: 0px;">
                                                                                    <div class="col-sm-3 controls" style="margin-top:15px">
                                                                                        <label class="control-label">La récurrence</label>
                                                                                        <div class="controls">
                                                                                            {literal}
                                                                                                <select id="idtyperecurrence" name="typerecurrence"
                                                                                                    onchange="if(this.value=='perso'){$('#idconfigspectype').show();$('#idconfigspecnumbre').show();}else{$('#idconfigspectype').hide();$('#idconfigspecnumbre').hide();}"
                                                                                                    style="width:100%!important;">
                                                                                                {/literal}
                                                                                                <option value=""></option>
                                                                                                <option value="continue">En continue</option>
                                                                                                <option value="paire">Seulement sur les semaines paires</option>
                                                                                                <option value="impaire">Seulement sur les semaines impaires</option>
                                                                                                <option value="perso">personnalisée</option>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="col-sm-3" style="padding-left: 0px;padding-right: 0px;">
                                                                                        <div class="col-sm-12 controls" style="margin-top:15px">
                                                                                            <label class="control-label">Type d'action</label>
                                        <div class="controls">
                                            {literal}
                                            <select id="idtypeaction" name="typeaction" style="width:100%!important;">
                                                {/literal}
                                                <option value="ecraser">Ecraser</option>
                                                <option value="fusionner">Fusionner</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-sm-6 controls" id="idconfigspecnumbre"
                                    style="display:none;margin-bottom: 15px;margin-top:15px">
                                    <div id="divdatefin">
                                        <label>Récurrence personnalisée</label>
                                        <div class="controls">

                                            Répéter tou(te)s les <input type="number" id="nbrecurrence" min="1"
                                                style="width:20%!important;" name="nombrerecurrence" value="">
                                            <select style="width:30%!important;" name="intervalle"
                                                id="idintervallesemaine">
                                                <option value="semaine">semaine</option>
                                                {*<option value="mois" {if isset($aTableauMaquette[0]['type_intervalle_sauvegarde_tranche']) and $aTableauMaquette[0]['type_intervalle_sauvegarde_tranche']=='mois'}selected="selected"{/if}>mois</option>*}
                                            </select>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-12" style="padding-left: 0px;padding-right: 0px;">
                                <div class="col-sm-6 controls" style="margin-top:15px;margin-bottom: 15px">
                                    <label>Récurrence</label>
                                    <div class="input-group">
                                        <div class="bootstrap-switch-container" id="idswitch">
                                            <span class="bootstrap-switch-handle-off"></span>
                                            <label class="bootstrap-switch-label"></label>
                                            <span class="bootstrap-switch-handle-on  "></span>

                                            <input type="hidden" id="activationConfig"
                                                value="{if $bactivestart}1{else}0{/if} ">
                                            <input type="checkbox" data-rel="switch" data-size="mini" name="activation"
                                                id="activationConfigMaquette" data-wrapper-class="yellow"
                                                {if $bactivestart}checked{/if}>{literal}
                                        </div>
                                        <script>
                                            $('#activationConfigMaquette').on('change.bootstrapSwitch', function(e) {
                                                if (e.target.checked) {
                                                    $('#idconfigspecnumbre2').css('display', '');
                                                    $('#divdatefin').css('display', 'none');
                                                    $('input[name=datefin]').val('');
                                                    $('#activationConfig').val(1);
                                                } else {
                                                    $('#idconfigspecnumbre2').css('display', 'none');
                                                    $('#divdatefin').css('display', '');
                                                    $('#activationConfig').val(0);
                                                    var date = $('#datedebut_config').val(); 
                                                     $('#datefin_config').val(date); 
                                                }
                                            });
                                        </script>
                                        {/literal}

                                    </div>
                                </div>

                                <div class="col-sm-6 controls" id="idconfigspecnumbre2"
                                    style="margin-top:15px;margin-bottom: 15px;display:none;">
                                    <div id="divdatefin">
                                        <label>Fenêtre automatique</label>
                                        <div class="controls">

                                            <select name="tempsintervalle" id="idfenetre">
                                                <option value="2-semaine"
                                                    {if $typevaleurperso=='2-semaine'}selected="selected" {/if}>15 jours
                                                </option>
                                                <option value="1-mois"
                                                    {if $typevaleurperso=='1-mois'}selected="selected" {/if}>1 mois
                                                </option>
                                                <option value="2-mois"
                                                    {if $typevaleurperso=='2-mois'}selected="selected" {/if}>2 mois
                                                </option>
                                                <option value="3-mois"
                                                    {if $typevaleurperso=='3-mois'}selected="selected" {/if}>3 mois
                                                </option>
                                                <option value="4-mois"
                                                    {if $typevaleurperso=='4-mois'}selected="selected" {/if}>4 mois
                                                </option>
                                                <option value="5-mois"
                                                    {if $typevaleurperso=='5-mois'}selected="selected" {/if}>5 mois
                                                </option>
                                                <option value="6-mois"
                                                    {if $typevaleurperso=='6-mois'}selected="selected" {/if}>6 mois
                                                </option>
                                                <option value="7-mois"
                                                    {if $typevaleurperso=='7-mois'}selected="selected" {/if}>7 mois
                                                </option>
                                                <option value="8-mois"
                                                    {if $typevaleurperso=='8-mois'}selected="selected" {/if}>8 mois
                                                </option>
                                                <option value="9-mois"
                                                    {if $typevaleurperso=='9-mois'}selected="selected" {/if}>9 mois
                                                </option>
                                                <option value="10-mois"
                                                    {if $typevaleurperso=='10-mois'}selected="selected" {/if}>10 mois
                                                </option>
                                                <option value="11-mois"
                                                    {if $typevaleurperso=='11-mois'}selected="selected" {/if}>11 mois
                                                </option>
                                                <option value="1-ans" {if $typevaleurperso=='1-ans'}selected="selected"
                                                    {/if}>1 ans</option>
                                                <option value="2-ans" {if $typevaleurperso=='2-ans'}selected="selected"
                                                    {/if}> 2 ans</option>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12" style="padding-left: 0px;padding-right: 0px;">

                              <!--############################################################--->
                                <div class="vd_checkbox checkbox-success clearfix" }="" style="display:flex;">
                                    <div class="btn-group mySearchChild 33" id="33" vee="33" att="597015" style="">
                                        <input class="class_checkAll33" type="checkbox" aria-label="case à cocher" name="activctrlrdv_name" value="1" id="activctrlrdv" style="float:left; margin-right:5px;" checked="">
                                        <label class="box597015 name-praticien" for="activctrlrdv" style="float: left;display:block;">
                                            <style>
                                                label.box597015::before{
                                                    border-color: ;
                                                }
                                            </style>
                                                <!--Nom du praticien -->
                                             <b  style="display:block;font-weight: 600;  font-family: 'Open Sans', 'arial'; font-size:12px;    white-space: nowrap;" title="Décochez si vous souhaitez qu'aucun contrôle ne soit effectué">
                                                 Contrôle des rendez-vous en conflit
                                             </b>
                                        </label>
                                        <!-- vd_mega-menu-content -->
                                    </div>
                                </div>
                              <!--##############################################-->


                            </div>

                            <div class="col-sm-12" style="margin-top:10px;" align="center">
                                <button type="button" name="btnconfirmesauvegarde" id="btnconfirmesauvegarde2"
                                    onclick="start_config_maquette('{$guid}','{$id_pra}')"
                                    class="btn vd_btn vd_bg-green">Valider
                                </button>
                                &nbsp;&nbsp;
                                <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde3"
                                    onclick="$('#modalConfigurationMaquette').modal('hide');"
                                    class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal dupliquer la maquette-->



<!-- [DEBUT] Modal configuration reccurence maquette le maquette -->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalLancerMaquette" tabindex="-1"
    role="dialog" aria-labelledby="LabelmodalmodalLancerMaquette" aria-hidden="false"   data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                </button>
                <h4 class="modal-title" id="LabelmodalLancerMaquettete">Activer la génération automatique des plannings
                </h4>
            </div>
            <div class="modal-body">
                <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                <div id="div_formulaire_sauvegarde_preference">
                    <div class="col-sm-12" style="padding-top:10px;">
                        <form id="form4" name="form4" method="GET">


                            <input type="hidden" name="sauvegarde_preference_idc" id="sauvegarde_preference_idc4"
                                value="{$idc}" />
                            <input type="hidden" name="guid" id="guid4" value="{$guid}" />
                            <input type="hidden" name="idpraticien" id="idpraticien5" value="{$idpraticien}" />
                            <input type="hidden" name="dir" value="maqplanning" />
                            <input type="hidden" name="validation" value="start" />

                            <div class="form-group">
                                <label class="control-label">Attention cette action activera la création automatique de
                                    la récurrence des plannings de cette maquette
                                </label>
                            </div>


                            <div class="col-sm-12" style="margin-top:10px;" align="center">
                                <button type="button" name="btnconfirmesauvegarde" id="btnconfirmesauvegarde4"
                                    onclick="start_maquette('{$guid}')" class="btn vd_btn vd_bg-green">Lancer
                                </button>
                                &nbsp;&nbsp;
                                <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde5"
                                    onclick="$('#modalLancerMaquette').modal('hide');"
                                    class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal dupliquer la maquette-->

<!-- [DEBUT] Modal applique vos modification -->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalApplimodif" tabindex="-1" role="dialog"
    aria-labelledby="LabelApplimodif" aria-hidden="false"  data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                </button>
                <h4 class="modal-title" id="LabelApplimodiftext">Appliquer vos modifications sur tous les plannings</h4>
            </div>
            <div class="modal-body">
                <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                <div id="div_formulaire_sauvegarde_preference">
                    <div class="col-sm-12" style="padding-top:10px;">
                        <form id="form_preference" name="form5" method="post">


                            <input type="hidden" name="sauvegarde_preference_idc"
                                id="sauvegarde_preference_id_preference" value="{$idc}" />
                            <input type="hidden" name="guid" id="guid5" value="{$guid}" />
                            <input type="hidden" name="dir" value="maqplanning" />
                            <input type="hidden" name="validation" value="modifplannig" />



                            <div class="form-group">
                                &nbsp;
                            </div>

                            <div class="col-sm-6 controls form-group">
                                <div id="divdatedebut">
                                    <label>Date de début</label>
                                    <div class="input-group">
                                        <input type="text" value="" name="datedebut" id="datedebut" required
                                            class="required input-modal-date-left">
                                        <span class="input-group-addon input-modal-date-right"
                                            id="datepicker-icon-trigger" data-datepicker="#datedebut">
                                            <i class="fa fa-calendar"></i>
                                        </span>
                                    </div>
                                    {literal}
                                    <script type="text/javascript">
                                        $(document).ready(function() {
                                            $("#datedebut").datepicker({
                                                dateFormat: 'dd/mm/yy',
                                                changeMonth: true,
                                                changeYear: true,
                                                onSelect: function(selectedDate) {
                                                    $("#datefin").val(selectedDate);
                                                }
                                            });
                                            $('[data-datepicker]').click(function(e) {
                                                var data = $(this).data('datepicker');
                                                $(data).focus();
                                            });
                                        });
                                    </script>
                                    {/literal}
                                </div>
                            </div>

                            <div class="col-sm-6 controls">
                                <div id="divdatefin">
                                    <label>Date de fin</label>
                                    <div class="input-group">
                                        <input type="text" value="" name="datefin" id="datefin" required
                                            class="required input-modal-date-left">
                                        <span class="input-group-addon input-modal-date-right"
                                            id="datepicker-icon-trigger" data-datepicker="#datefin">
                                            <i class="fa fa-calendar"></i>
                                        </span>
                                    </div>
                                    {literal}
                                    <script type="text/javascript">
                                        $(document).ready(function() {
                                            $("#datefin").datepicker({
                                                dateFormat: 'dd/mm/yy',
                                                changeMonth: true,
                                                changeYear: true
                                            });
                                            $('[data-datepicker]').click(function(e) {
                                                var data = $(this).data('datepicker');
                                                $(data).focus();
                                            });
                                        });
                                    </script>
                                    {/literal}
                                </div>
                            </div>

                            <div class="col-sm-12" style="margin-top:10px;" align="center">
                                <button type="button" name="btnconfirmesauvegarde" id="btnconfirmesauvegarde5"
                                    onclick="submit();" class="btn vd_btn vd_bg-green">Modifier
                                </button>
                                &nbsp;&nbsp;
                                <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde6"
                                    onclick="$('#modalApplimodif').modal('hide');" class="btn vd_btn vd_bg-grey"><span
                                        class="menu-icon"></span> Fermer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal appliquer vos modification preference-->


<!-- [DEBUT] Modal modification du nom maquette -->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalmodifnommaquette" tabindex="-1"
    role="dialog" aria-labelledby="LabelApplimodif" aria-hidden="false" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                </button>
                <h4 class="modal-title" id="LabelApplimodiftext">Modifier le libellé de la maquette</h4>
            </div>
            <div class="modal-body">
                <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                <div id="div_formulaire_sauvegarde_preference">
                    <div class="col-sm-12" style="padding-top:10px;">
                        <form id="form5" name="form5" method="post">


                            <input type="hidden" name="sauvegarde_preference_idc" id="sauvegarde_preference_idc5"
                                value="{$idc}" />
                            <input type="hidden" name="guid" id="guid_preference" value="{$guid}" />
                            <input type="hidden" name="idpraticien" id="idpraticien_prefrence" value="{$idpraticien}" />
                            <input type="hidden" name="dir" value="maqplanning" />
                            <input type="hidden" name="validation" value="modifnommaquette" />



                            <div class="form-group">
                                <label class="control-label">Libellé</label>
                                <div class="controls">
                                    <input type="text" id="sauvegarde_preference_libelle" name="inputlibelle"
                                        placeholder="Libellé de la sauvegarde" value="{$libelle}" class="required"
                                        required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Description</label>
                                <div class="controls">
                                    <textarea id="sauvegarde_preference_description" name="inputdescription"
                                        placeholder="Description de la sauvegarde">{$description}</textarea>
                                </div>
                            </div>



                            <div class="col-sm-12" style="margin-top:10px;" align="center">
                                <button type="button" name="btnconfirmesauvegarde" id="btnconfirmesauvegarde_modif"
                                    onclick="submit();" class="btn vd_btn vd_bg-green">Modifier
                                </button>
                                &nbsp;&nbsp;
                                <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde_modif"
                                    onclick="$('#modalmodifnommaquette').modal('hide');"
                                    class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal modification du nom maquette-->

<!-- [DEBUT] Modal loading -->
<div style="top:40%;" class="modal fade in" id="modalloading" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">

            </div>
            <div class="modal-body">
                <div align='center'>
                    <br>
                    <br>
                    <h2>Veuillez patienter...
                        <br>
                        <i class='fa fa-spinner fa-spin vd_blue'></i>
                                                                        </h2>
                                                                        <br>
                                                                        <br>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- [FIN] Modal loading -->