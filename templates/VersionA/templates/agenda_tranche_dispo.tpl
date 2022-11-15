<link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.css">
<link href="plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">

   <?php
  $listeDispo = filemtime(PATH_ASSETS.'js/liste_dispo.js?v={$numero_version_alaxione}');
?>
<script type="text/javascript" src="js/liste_dispo.<?php echo $listeDispo ?>.js?v={$numero_version_alaxione}"></script>

   <?php
  $planningDispo1 = filemtime(PATH_ASSETS.'js/js_planning_dispo.js?v={$numero_version_alaxione}');
?>

<script type="text/javascript" src="js/js_planning_dispo.<?php echo $planningDispo1 ?>.js?v={$numero_version_alaxione}"></script>

   <?php
  $contextMenu1 = filemtime(PATH_ASSETS.'js/jquery.contextmenu.js?v={$numero_version_alaxione}');
?>

<script type="text/javascript" src="js/jquery.contextmenu.<?php echo $contextMenu1 ?>.js?v={$numero_version_alaxione}"></script>



   <?php
  $pluginsTagsInput = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js');
?>
<script type="text/javascript" src='plugins/tagsInput/jquery.tagsinput.min.<?php echo $pluginsTagsInput ?>.js'></script>

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
            display: flex;
            align-items: center;
            justify-content: center;
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

        #agenda_salle,
        #agenda_praticien {
            display: none;
        }

        #agenda_salle:first-child,
        #agenda_praticien:first-child {
            display: block;
        }
    </style>


    <!-- Calendar -->
    <script type="text/javascript">
        $(document).ready(function() {
            affiche_bouton_coller('copiecookie{/literal}{$id_user}{literal}');

            if (getCookieTranche() != null) {
                $('#btn_annule_copie_tranche').show();
            }

            // @6035 Disable du bouton de submit pour éviter les doublons en multi click
            $('#btnconfirmesauvegarde_new').click( function(){
                if ($('#sauvegarde_preference_libelle').val()=='') {
                    alert('Champ Libellé obligatoire')
                } else {
                    var moment = $('#calendar_1').fullCalendar('getDate');
                    $('#idatemoment').val(moment);
                    $('#btnconfirmesauvegarde_new').attr('disabled', true);
                    $('#form_sauvegarde_preference').submit();
                }
            });

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
                        var url = 'main.php?dir=gestiondiposv2&identifiant_user=' + $('#basculer_agenda').val();
                    {/literal}
                    {if $type_user == 'BOX'}
                        {literal}
                            url += "&typeuser=BOX";
                            {/literal}{/if}{literal}
                            window.location.replace(url);
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

                    });


                var oplus = {/literal}
                {if $isOplus} true 
                {else} false
                {/if}
                {literal};


                    function open_modal() {

                        //document.getElementById("myModalLabelinfordv").innerHTML="";
                        $('#myModalLabelhome').html("&nbsp;");
                        document.getElementById("iframerhome").src = "modal/modal_disponibilite.php?identifiant_user={/literal}{$identifiant_user}{literal}";
                        $('#myModalHome').css("overflow-y", "scroll");
                        $('#myModalHome').modal('show');
                        setTimeout(function() {
                            resizeIframe(document.getElementById('iframerhome'));
                        }, 1000);

                    }

                    function open_modal_force_rdv() {

                        //document.getElementById("myModalLabelinfordv").innerHTML="";
                        $('#myModalLabelhome').html("&nbsp;");
                        document.getElementById("iframerhome").src = "modal/modal_user_autorisation.php?identifiant_user={/literal}{$identifiant_user}{literal}";
                        $('#myModalHome').css("overflow-y", "scroll");
                        $('#myModalHome').modal('show');
                        setTimeout(function() {
                            resizeIframe(document.getElementById('iframerhome'));
                        }, 1000);

                    }

                    function open_modal_update(idunique, idtranche, iduniquepere, idtranchepere) {

                        document.getElementById("myModalLabelinfordv").innerHTML = "";


                        if (idtranchepere == null) {
                            if (oplus)
                                document.getElementById("iframerhome").src = "modal_disponibilite_partition.php?id_user={/literal}{$id_user}{literal}&idunique=" + idunique + "&idtranche=" + idtranche;
                            else
                            document.getElementById("iframerhome").src = "modal/modal_disponibilite_modification.php?id_user={/literal}{$id_user}{literal}&idunique=" + idunique + "&idtranche=" + idtranche;
                        } else
                            document.getElementById("iframerhome").src = "modal_disponibilite_partition.php?id_user={/literal}{$id_user}{literal}&idunique=" + iduniquepere + "&idtranche=" + idtranchepere + "&actiontranche=modification&idtranchesup=" + idtranche;

                            $('#myModalHome').css("overflow-y", "scroll");
                        $('#myModalHome').modal('show');
                        setTimeout(function() {
                            resizeIframe(document.getElementById('iframerhome'));
                        }, 1000);



                    }

                    function close_modal_principal() {
                        $('#myModalHome').modal('hide');
                    }

                    function close_modal_principal_petit() {
                        $('#myModalinfordv').modal('hide');
                    }

                    function open_modal_del(idunique, idtranche) {                        
                        $('#modalSuppressionDate').modal('show');
                    }

                    function open_modal_duplicate(idunique, idtranche) {
                        document.getElementById("myModalLabelinfordv").innerHTML = "";
                        document.getElementById("iframerdv").src = "modal_disponibilite_duplication.php?id_user={/literal}{$id_user}{literal}";
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

                    function del_tranche(id_tranche, type_tranche) {
                        if (confirm('Voulez-vous vraiment supprimer ?')) {
                            $.ajax({
                                cache: false,
                                url: 'ajax/del_tranche.php',
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
                                url: 'ajax/del_tranche_date.php',
                                data: 'id_user=' + $('#id_user').val() + '&datedebut=' + $('#datedebut').val() + '&datefin=' +
                                    $('#datefin').val(),
                                dataType: 'json',
                                success: function(json) {
                                    $.each(json, function(index, value) {
                                        if (value.success === 1) {
                                            $('#calendar_1').fullCalendar('refetchEvents');

                                            $('#modalSuppressionDate').modal('hide');
                                            $.pnotify({
                                                title: 'Suppression de la tranche',
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

                    function coller_tranche(id_tranche, leday, lhour, identifiant_user) {
                        //if (confirm('Etes-vous sûr de vouloir coller la tranche le '+leday+' à '+lhour+' ?')) {
                        $.ajax({
                            cache: false,
                            url: 'ajax/coller_tranche.php',
                            data: 'id_tranche=' + id_tranche + '&date_tranche=' + leday + '&heure_tranche=' + lhour +
                                '&identifiant_user=' + identifiant_user,
                            dataType: 'json',
                            success: function(json) {
                                $.each(json, function(index, value) {
                                    if (value.success === true) {
                                        $('#calendar_1').fullCalendar('refetchEvents');
                                        $.pnotify({
                                            title: 'La tranche a été collée !',
                                            text: value.message_html,
                                            type: 'success',
                                            addclass: "stack-bottomright",
                                            delay: 3000
                                        });
                                    } else {
                                        $.pnotify({
                                            title: value.message_html,
                                            text: ' ',
                                            //text: value.message_html,
                                            type: 'error',
                                            addclass: "stack-bottomright title_seul",
                                            delay: 3000
                                        });
                                    }
                                });
                            }
                        });
                        //}
                    }
                    //fonction copier du rdv
                    function copier_tranche(id_tranche, type) {

                        lecookie = id_tranche + '_' + type

                        setCookieTranche(lecookie);
                        $('#btn_annule_copie_tranche').show();
                        $.pnotify({
                            title: 'La tranche a été copiée !',
                            text: ' ',
                            type: 'success',
                            addclass: "stack-bottomright title_seul",
                            delay: 3000
                        });
                    }

                    function getCookieTranche() {
                        var nameEQ = "tranchecopier=";
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
                        if (value == null || value == "") {
                            $('#btn_annule_copie_tranche').hide();
                        }
                    }

                    window.setInterval(checkCookie, 100); // run every 100 ms

                    function setCookieTranche(sValue) {
                        var today = new Date(),
                            expires = new Date();
                        expires.setTime(today.getTime() + (10 * 60 * 1000));
                        document.cookie = "tranchecopier=" + sValue + ";expires=" + expires.toGMTString();
                    }

                    // Function qui permet d'annuler le bouton coller
                        function annule_copie_tranche(namecookie) {
                            $('#btn_annule_copie_tranche').hide();
                            var today = new Date(),
                                expires = new Date();
                            expires.setTime(today.getTime() - 1);
                            document.cookie = namecookie + "=;expires=" + expires.toGMTString();
                        }
                    </script>
                {/literal}

                <input id="dateclic" type="hidden" value="">
                <div class="vd_title-section clearfix">
                    <div class="vd_panel-header no-menu">
                        <h1>{$TitreCalandrier}</h1>
                        <small class="subtitle"></small>
                    </div>

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


                    {if !$isOplus}
                            <button type="button" class="btn vd_btn vd_bg-green" onclick="open_modal();">
                                <span class="menu-icon"><i class="fa fa-fw fa-plus-circle"></i></span> Ajouter une tranche
                            </button>
                    {/if}
                        <button type="button" class="btn vd_btn" style="color:#FFFFFF !important; background-color: #AB0000 !important;"
                            onclick="open_modal_del();">
                            <span class="menu-icon"><i class="fa fa-fw fa-trash-o"></i></span> Supprimer une tranche
                        </button>

                    {if !$isOplus}
                            <button type="button" class="btn vd_btn" style="color:#FFFFFF !important; background-color: #0daba2 !important;"
                                name="btnopensauvegardepreference" id="btnopensauvegardepreference" data-original-title="Tooltip on bottom"
                                onclick="reinit_modal_preference();$('#modalSauvegardePreference').modal('show');">
                                <span class="menu-icon"><i class="fa fa-fw fa-save"></i></span> Créer une maquette
                            </button>

                            <button type="button" class="btn vd_btn vd_bg-green"
                                onclick="location.href='main.php?dir=maqplanning&idpraticien={$identifiant_user}'">
                                <span class="menu-icon"><i class="fa fa-fw fa-download"></i></span> Voir les maquettes
                            </button>


                    {/if}
                    </div>

                    <div class="col-sm-3">
                        <div class="pull-right agendaSwitch">
                            Planning
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider round" id="switchAgenda"></span>
                            </label>
                        </div>

                        {literal}
                            <script type="text/javascript">
                                $(document).ready(function() {
                                    $('#switchAgenda').on('click', function() {
                                        let currentDate = $('#calendar_1').fullCalendar('getDate')
                                        location.replace('main.php' + '?toDate=' + currentDate.format("YYYY-MM-DD"));
                                    });
                                });
                            </script>
                        {/literal}

                        {foreach name="lstAgendaActif" from=$lstAgendaActif item=objAgenda}


                            {if $objAgenda['id_profession'] == ''}
                                    <label class="control-label" id="agenda_salle">Basculer sur un autre agenda de salle</label>


                            {else}
                                    <label class="control-label" id="agenda_praticien">Basculer sur un autre agenda de praticien</label>


                            {/if}


                        {/foreach}

                        <div class="controls">
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css"
                                rel="stylesheet" />
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                            <select name="lstAgendaActif" class="js-example-basic-multiple" id="basculer_agenda">


                            {foreach name="lstAgendaActif" from=$lstAgendaActif item=objAgenda}
                                            <option value="{$objAgenda['identifiant_user']}"

                                {if {$objAgenda['identifiant_user']}==$identifiant_user}selected 
                                {/if}>


                                {if isset($objAgenda['nom_affichage_calendar_user']) and $objAgenda['nom_affichage_calendar_user'] !='' and {$type_user}
                                                    != 'BOX'}{$objAgenda['nom_affichage_calendar_user'] }

                                {else}
                                                    {$objAgenda['nom_user']}

                                {/if}</option>
                                            </option>


                            {/foreach}
                            </select>

                        </div>
                    </div>


                    {literal}
                        <script type="text/javascript">
                            $(document).ready(function() {
                                $('.js-example-basic-multiple').select2();
                            });
                        </script>


                    {/literal}


                    <div class="col-sm-6">
                        <a id="btn_mini_calendar" style="margin-right: 10px;" class="mega-link" href="javascript:void(0);" title=""
                            onclick="affiche_mini_calendar();">
                            <span class="mega-icon">
                                <i class="fa fa-calendar" style="font-size:xx-large;"></i>
                            </span>
                        </a>
                        <div id="div_affiche_mini_calendar" style="position: absolute; z-index: 999;">
                            <div align='center' id="datemenupicker"></div>
                        </div>
                        <button type="button" class="btn vd_btn" style="color:#FFFFFF !important; background-color: #2dab28 !important;"
                            onclick="var moment = $('#calendar_1').fullCalendar('getDate');DefSemaineNum(moment.format(),'copiecookie{$id_user}');">
                            copier la semaine
                        </button>
                        <input type="button" class="btn vd_btn" id="idboutoncoller"
                            style="color:#FFFFFF !important; background-color: #2dab28 !important;display:none"
                            onclick="var moment = $('#calendar_1').fullCalendar('getDate');coller_semaine('copiecookie{$id_user}',moment.format(),'{$identifiant_user}');"
                            value="coller" />
                        <input type="button" class="btn vd_btn" id="idboutonvidercache"
                            style="color:#FFFFFF !important; background-color: red !important;display:none"
                            onclick="annule_opier('copiecookie{$id_user}')" value="Annule le copier" />

                    </div>

                    <div class="col-sm-6">
                        <input type="button" class="btn vd_btn" id="btr"
                            style="color:#FFFFFF !important; background-color: #0daba2 !important;display:block;float: right;margin-top: 10px;"
                            onclick="open_modal_force_rdv();" value="Autorisation RDV forcé" />
                    </div>

                    <div class="col-sm-12">
                        <input type="button" class="btn vd_btn" id="btn_annule_copie_tranche"
                            style="color:#FFFFFF !important; background-color: red !important;display:none"
                            onclick="annule_copie_tranche('tranchecopier')" value="Annuler la copie de la tranche" />
                    </div>
                </div>
                <div class="vd_content-section clearfix" id="tpl_maquette">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel widget light-widget panel-bd-top">
                                <div class="panel-body">
                                        <!-- Calendar -->
                                        <script type="text/javascript">
                                            $(document).ready(function() {
                                                
                                                const slotDuration = {$slotDuration|@json_encode nofilter};
                                                const startDate = {$startDate|@json_encode nofilter};
                                                const endDate = {$endDate|@json_encode nofilter};
                                                const showSunday = {$active_dimanche_user|@json_encode nofilter} === 'Y';
                                                $('#calendar_1').fullCalendar({
                                                        header: {
                                                            left: 'prev,next today',
                                                            center: 'title',
                                                            right: 'month,agendaWeek,agendaDay'
                                                        },
                                                        hiddenDays: showSunday ? [] : [0],//on n'affiche pas le dimanche
                                                        lang: 'fr', //langue francais
                                                        editable: false, //calendrier modifiable
                                                        weekNumbers: true, //on affiche le num de semaine
                                                        minTime: startDate !== '' ? startDate : "07:00:00", //le calendar demarre à 7h
                                                        maxTime: endDate !== '' ? endDate : "22:00:00", //le calendar fini à 20h
                                                        slotLabelFormat: 'H:mm',
                                                        slotLabelInterval: '00:' + (slotDuration ? slotDuration : '15'),
                                                        slotDuration: '00:' + (slotDuration ? slotDuration : '15') + ':00',
                                                        slotEventOverlap: false, //les event ne se chevoche pas
                                                        defaultView: 'agendaWeek', //afficher la semaine par defaut
                                                        allDaySlot: false,
                                                        timeFormat: 'HH:mm',
                                                        height: 'auto',
                                                        displayEventEnd: true,
                                                        events: {
                                                            url: 'ajax/myfedd_tranche.php',
                                                            type: 'GET',
                                                            async: true,
                                                            dataType: 'json',
                                                            data: function() {
                                                                return {
                                                                    id_user: {$id_user}
                                                                };
                                                            }
                                                        },
                                                        eventRender: persoEventAfterRender,
                                                        eventClick: function(calEvent, jsEvent, view) {
                                                            if(calEvent.type !== 'conge'){
                                                                open_modal_update(calEvent.idunique, calEvent.idtranche, calEvent.iduniquepere, calEvent.idtranchepere);{literal}
                                                            }
                                                        },
                                                        dayClick: function(date, jsEvent, view) {
                                                            if (getCookieTranche() != null) {
                                                                var leday = moment(date).format('DD/MM/YYYY');
                                                                var lhour = moment(date).format('HH:mm');

                                                                coller_tranche(getCookieTranche(), leday, lhour, "{/literal}{$identifiant_user}{literal}");

                                                            }

                                                        },
                                                        dayRender: function(date, cell) {
                                                            cell.on('dblclick', {date: date}, function (e) {
                                                                alert('double');
                                                            });
                                                        }

                                                });

                                                $('#calendar_1').fullCalendar('gotoDate', '{/literal}{$dateposition}{literal}');
                                            });

                                            function persoEventAfterRender(event, element, view) {
                                                if(view.type === "month"){
                                                    element.find(".fc-time").css("color", "#000");
                                                    element.find(".fc-title").html("<br/>"+event.title).css("color", "#000");
                                                }else{
                                                    element.find("div.fc-title").html("<span style='color:#000;'>" + event.title + "</span>");
                                                    element.find("div.fc-time").css("color", "#000");
                                                }
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
                                                    var menu1 = [

                                                        {
                                                            'Copier la tranche': {
                                                                onclick: function(menuItem, menu) {
                                                                    copier_tranche(event.idtranche, "t");
                                                                    $(".menu_custom_alaxione").hide();
                                                                    return true;
                                                                },
                                                                title: 'Copier la tranche'
                                                            }
                                                        },
                                                        {
                                                            'Copier la journée': {
                                                                onclick: function(menuItem, menu) {
                                                                    copier_tranche(event.idtranche, "j");
                                                                    $(".menu_custom_alaxione").hide();
                                                                    return true;
                                                                },
                                                                title: 'Copier la tranche'
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
                                                        },
                                                        {
                                                            'Suppression personnalisée': {
                                                                onclick: function(menuItem, menu) {
                                                                    open_modal_del();
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
                                    <div id="calendar_1" class="mgtp-10" style="padding:0 15px"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- [DEBUT] Modal sauvegarde preference -->
                <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalSauvegardePreference" tabindex="-1"
                    role="dialog" aria-labelledby="LabelmodalSauvegardePreference" aria-hidden="false" data-keyboard="false"
                    data-backdrop="static">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header vd_bg-blue vd_white">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                </button>
                                <h4 class="modal-title" id="LabelmodalSauvegardePreference">Créer une maquette</h4>
                            </div>
                            <div class="modal-body">
                                <div id="div_message_sauvegarde_preference" style="display: none;"></div>
                                <div id="div_attente_sauvegarde_preference" style="display: none;"></div>
                                <div id="div_formulaire_sauvegarde_preference">
                                    <div class="col-sm-12" style="padding-top:10px;">
                                        <form id="form_sauvegarde_preference" name="form_sauvegarde_preference">
                                            <input type="hidden" name="dir" value="maqplanning">
                                            <input type="hidden" name="idpraticien" value="{$identifiant_user}">
                                            <input type="hidden" name="datemoment" id="idatemoment" value="">
                                            <input type="hidden" name="validation" id="idvalidation" value="ok">

                                            <input type="hidden" name="sauvegarde_preference_idc" id="sauvegarde_preference_idc"
                                                value="{$idc}" />
                                            <input type="hidden" name="sauvegarde_preference_idp" id="sauvegarde_preference_idp"
                                                value="{$identifiant_user}" />

                                            <div class="form-group">
                                                <label class="control-label">Libellé</label>
                                                <div class="controls">
                                                    <input type="text" id="sauvegarde_preference_libelle"
                                                        name="sauvegarde_preference_libelle" placeholder="Libellé de la sauvegarde"
                                                        value="" class="required" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Description</label>
                                                <div class="controls">
                                                    <textarea id="sauvegarde_preference_description"
                                                        name="sauvegarde_preference_description"
                                                        placeholder="Description de la sauvegarde"></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                            </div>
                                            {literal}
                                                <script type="text/javascript">
                                                    // In your Javascript (external .js resource or <script> tag)
                                                    $(document).ready(function() {
                                                        $('.js-example-basic-single').select2({
                                                            dropdownParent: $('.myModalSelect2')
                                                        });
                                                    });
                                                </script>
                                            {/literal}

                                            <div id="div_horaire" class="form-group col-sm-12" style="display: none;">
                                                <div class="col-sm-4 controls">
                                                    <div class="input-group" id="divheuredebut0">
                                                        <label>Heure de début </label>
                                                        <div class="input-group clockpicker">
                                                            <input type="text" id="sauvegarde_preference_tranche_heuredebut"
                                                                name="sauvegarde_preference_tranche_heuredebut" value=""
                                                                class="input-modal-date-left">
                                                            <span class="input-group-addon input-modal-date-right"
                                                                id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $("#sauvegarde_preference_tranche_heuredebut").clockpicker({
                                                                        placement: 'top',
                                                                        autoclose: true
                                                                    });
                                                                    $("#sauvegarde_preference_tranche_heuredebut").mask("99:99");
                                                                </script>
                                                            {/literal}
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-4 controls">
                                                    <div class="input-group" id="divheurefin0">
                                                        <label>Heure de fin</label>
                                                        <div class="input-group clockpicker">
                                                            <input type="text" id="sauvegarde_preference_tranche_heurefin"
                                                                name="sauvegarde_preference_tranche_heurefin" value=""
                                                                class="required input-modal-date-left">
                                                            <span class="input-group-addon input-modal-date-right"
                                                                id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                                            {literal}
                                                                <script type="text/javascript">
                                                                    $(document).ready(function() {
                                                                        $("#sauvegarde_preference_tranche_heurefin").clockpicker({
                                                                            placement: 'top',
                                                                            autoclose: true
                                                                        });
                                                                        $("#sauvegarde_preference_tranche_heurefin").mask("99:99");
                                                                    });
                                                                </script>
                                                            {/literal}
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-sm-4 controls">
                                                    <label class="control-label">Quel jour ?</label>
                                                    <select id="sauvegarde_preference_tranche_jour">
                                                        <option value="1">Lundi</option>
                                                        <option value="2">Mardi</option>
                                                        <option value="3">Mercredi</option>
                                                        <option value="4">Jeudi</option>
                                                        <option value="5">Vendredi</option>
                                                        <option value="6">Samedi</option>
                                                        <option value="7">Dimanche</option>
                                                    </select>
                                                </div>

                                            </div>
                                            <div class="col-sm-12" style="margin-top:10px;" align="center">
                                                <button type="button" name="btnconfirmesauvegarde_new" id="btnconfirmesauvegarde_new" class="btn vd_btn vd_bg-green">Créer
                                                </button>
                                                &nbsp;&nbsp;
                                                <button type="button" name="btnannulesauvegarde" id="btnannulesauvegarde"
                                                    onclick="$('#modalSauvegardePreference').modal('hide');"
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
                <!-- [FIN] Modal sauvegarde preference-->

                <!-- [DEBUT] Modal liste preference -->
                <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalImportePreference" tabindex="-1"
                    role="dialog" aria-labelledby="LabelmodalImportePreference" aria-hidden="false" data-keyboard="false"
                    data-backdrop="static">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header vd_bg-blue vd_white">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                </button>
                                <h4 class="modal-title" id="LabelmodalImportePreference">Importer la programmation</h4>
                            </div>
                            <div class="modal-body">
                                <div id="div_message_importe_preference" style="display: none;"></div>
                                <div id="div_attente_importe_preference" style="display: none;"></div>
                                <div id="div_formulaire_importe_preference">
                                    <div class="col-sm-12" style="padding-top:10px;">

                                        <div class="form-group">
                                            <label class="control-label">Sélectionnez la sauvegarde à importer</label>
                                            <div class="controls col-sm-10" style="padding: 0;">
                                                <select id="liste_importe_preference" class="js-example-basic-single"
                                                    style="width:100%!important;"></select>
                                            </div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $('.js-example-basic-single').select2();
                                                    });
                                                </script>
                                            {/literal}

                                            <div class="col-sm-2" style="padding: 0; text-align: center;">
                                                <div class="menu-action rounded-btn">
                                                    <a href="#" onclick="open_update_preference();" data-original-title="Modifier"
                                                        data-toggle="tooltip" data-placement="top"
                                                        class="btn menu-icon vd_bd-yellow vd_yellow">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                    <a href="#"
                                                        onclick="bconf=confirm('Souhaitez-vous supprimer cette sauvegarde ?');if(bconf)del_preference($('#liste_importe_preference').val());"
                                                        data-original-title="Supprimer" data-toggle="tooltip" data-placement="top"
                                                        class="btn menu-icon vd_bd-red vd_red">
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div_tranche_jour_importe_preference" class="form-group col-sm-12"
                                            style="padding:0;display: none;">
                                            <input type="hidden" id="nb_tranche_jour_importe_preference"
                                                name="nb_tranche_jour_importe_preference" value="">
                                            <label class="control-label">Sur quelles(s) date et/ou semaine(s) importer la sauvegarde
                                                ?</label>
                                            <div>
                                                <div class="col-sm-6">
                                                    <div id="dateslect"></div>
                                                </div>
                                                <div class="col-sm-6" style="padding:0;">
                                                    <input type="text" class="tags" value="" id="date_selection"
                                                        style="display: none;" />
                                                </div>
                                                {literal}
                                                    <script type="text/javascript">
                                                        $(document).ready(function() {
                                                                    var tabDate;

                                                                    $('#date_selection').tagsInput({
                                                                        'height': '100%',
                                                                        'width': '100%',
                                                                        'interactive': false,
                                                                        'placeholderColor': '#666666'
                                                                    });
                                                                    // Highlight week on hover week number
                                                                    $(document).on("mouseenter", ".ui-datepicker-week-col",
                                                                        function(){$(this).siblings().find("a").addClass('ui-state-hover');} );
                                                                        $(document).on("mouseleave", ".ui-datepicker-week-col",
                                                                            function(){$(this).siblings().find("a").removeClass('ui-state-hover');} );

                                                                            // Select week on click on week number
                                                                            $(document).on("click", ".ui-datepicker-week-col",
                                                                                function() {
                                                                                    $first = $(this).siblings().find("a").first();
                                                                                    $last = $(this).siblings().find("a").last();
                                                                                    $first.click();
                                                                                    $parentFirst = $first.parent();
                                                                                    $parentLast = $last.parent();

                                                                                    var e = 0;
                                                                                    for (var i = parseInt($first.text()); i <= parseInt(
                                                                                            $last.text()); i++) {

                                                                                        var ladate = ('0' + i).slice(-2) + "/" + ('0' +
                                                                                                (Number($parentLast.data("month")) + 1))
                                                                                            .slice(-2) + "/" + $parentLast.data("year");

                                                                                        if (parseInt($(
                                                                                                '#nb_tranche_jour_importe_preference'
                                                                                            ).val()) !== 1 && e === 0) {
                                                                                            tabDate = $('#date_selection').val().slice(
                                                                                                ",");
                                                                                            if (tabDate.indexOf(ladate) > -1) {
                                                                                                //alert("existe déjà");
                                                                                            } else {
                                                                                                $('#date_selection').addTag(ladate);
                                                                                            }

                                                                                        }

                                                                                        if (e != 0) {

                                                                                            tabDate = $('#date_selection').val().slice(
                                                                                                ",");

                                                                                            if (tabDate.indexOf(ladate) > -1) {
                                                                                                //alert("existe déjà");
                                                                                            } else {
                                                                                                $('#date_selection').addTag(ladate);
                                                                                            }

                                                                                        }
                                                                                        e++;
                                                                                    }

                                                                                });
                                                                        });
                                                    </script>
                                                {/literal}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Quelle action souhaitez vous effectuer ?</label>
                                            <div class="controls">
                                                <select id="action_importe_preference" class="js-example-basic-single"
                                                    style="width:100%!important">
                                                    <option value="ecraser">Supprimer les tranches existantes</option>
                                                    <option value="fusionner">Fusionner avec les tranches existantes</option>
                                                </select>
                                            </div>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function() {
                                                    $('.js-example-basic-single').select2();
                                                });
                                            </script>
                                        {/literal}

                                        <div style="margin-top:10px;" align="center">
                                            <button type="button" name="btnconfirmeimporte" id="btnconfirmeimporte"
                                                class="btn vd_btn vd_bg-green" onclick="get_preference();">
                                                Importer
                                            </button>
                                            &nbsp;&nbsp;
                                            <button type="button" name="btnannuleimporte" id="btnannuleimporte"
                                                onclick="$('#modalImportePreference').modal('hide');" class="btn vd_btn vd_bg-grey">
                                                <span class="menu-icon"></span> Fermer
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- [FIN] Modal liste preference-->

                <!-- [DEBUT] Modal update preference -->
                <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalUpdatePreference" tabindex="-1"
                    role="dialog" aria-labelledby="LabelmodalUpdatePreference" aria-hidden="false">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header vd_bg-blue vd_white">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                </button>
                                <h4 class="modal-title" id="LabelmodalImportePreference">Modifier la programmation</h4>
                            </div>
                            <div class="modal-body">
                                <div id="div_message_update_preference" style="display: none;"></div>
                                <div id="div_attente_update_preference" style="display: none;"></div>
                                <div id="div_formulaire_update_preference">
                                    <div class="col-sm-12" style="padding-top:10px;">
                                        <div class="form-group">
                                            <label class="control-label">Libellé</label>
                                            <div class="controls">
                                                <input type="text" id="libelle_update_preference" name="libelle_update_preference"
                                                    placeholder="Libellé de la sauvegarde" value="" class="required" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Description</label>
                                            <div class="controls">
                                                <textarea id="description_update_preference" name="description_update_preference"
                                                    placeholder="Description de la sauvegarde"></textarea>
                                            </div>
                                        </div>

                                        <div style="margin-top:10px;" align="center">
                                            <button type="button" name="btnconfirmeupdatee" id="btnconfirmeupdatee"
                                                class="btn vd_btn vd_bg-green" onclick="update_preference();">
                                                Modifier
                                            </button>
                                            &nbsp;&nbsp;
                                            <button type="button" name="btnannuleUpdate" id="btnannuleUpdate"
                                                onclick="$('#modalUpdatePreference').modal('hide');" class="btn vd_btn vd_bg-grey">
                                                <span class="menu-icon"></span> Annuler
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- [FIN] Modal liste preference-->


                <!-- [DEBUT] Modal Suppression par date/période -->
                <div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalSuppressionDate" tabindex="-1"
                    role="dialog" aria-labelledby="LabelmodalSuppressionDate" aria-hidden="false">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header vd_bg-blue vd_white">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i>
                                </button>
                                <h4 class="modal-title" id="LabelmodalSuppressionDate">Supprimer des disponibilités sur une période</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" id="del-tranche-date" name="del-tranche-date">
                                    <div class="vd_content-section clearfix" style="padding:0px;">
                                        <div class="row" style="margin-bottom:0px;">
                                            <div class="col-sm-12">
                                                <div class="panel widget" style="margin-bottom:350px">
                                                    <h2 align="center">Suppression des disponibilités sur une période</h2>
                                                    <div class="panel-body" style="padding:15px!important">

                                                        <input type="hidden" name="validation" id="validation" value="ok" />
                                                        <input type="hidden" name="id_user" id="id_user" value="{$id_user}" />

                                                        <div class="form-group">
                                                            <div class="col-sm-6 controls">
                                                                <div id="divdatedebut">
                                                                    <label>Date de début (inclus)</label>
                                                                    <div class="input-group">
                                                                        <input type="text" value="{$datedebut}" name="datedebut"
                                                                            id="datedebut" required
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

                                                                            $("#datedebut").mask("99/99/9999");
                                                                        </script>
                                                                    {/literal}
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 controls">
                                                                <div id="divdatefin">
                                                                    <label>Date de fin (inclus)</label>
                                                                    <div class="input-group">
                                                                        <input type="text" value="{$datefin}" name="datefin"
                                                                            id="datefin" required
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


                                                                            $("#datefin").mask("99/99/9999");
                                                                        </script>
                                                                    {/literal}
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-12 controls" id="divperiode" align="center">
                                                            <button id="btn_add" name="btn_add" type="button"
                                                                class="btn vd_btn vd_bg-green" onclick="del_tranche_date();">Valider
                                                            </button>&nbsp;&nbsp;
                                                            <button type="button" class="btn vd_btn vd_bg-grey"
                                                                onclick="$('#modalSuppressionDate').modal('hide');">Annuler
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
                <!-- [FIN] Modal Suppression par date/période -->