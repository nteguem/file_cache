<style>
    body {
        font-family: Arial, "Open Sans", sans-serif;
    }

    .font-size {
        font-size: 15px;
        height: 21px;
    }

    .panel.widget {
        overflow: auto;
    }

    hr {
        color: #777777;
    }

    #recherche_1 {
        margin-bottom: 15px;
    }

    .panel.widget {
        overflow: auto;
        margin-top: 42px;
    }

    .panel-body {
        display: none;
    }

    .control-label {
        margin-left: 10px;
    }

    .input {
        border-radius: 7px;
        border: 1px solid #707070;
    }

    #interval {
        height: 21px;
        margin-left: 14px;
        margin-top: 23px;
    }

    .form-group {
        margin-bottom: 1px;
    }

    /* BOUTON SWITCH INTERVALLE */
    #btn_switch {
        display: flex;
    }

    #switch {
        margin-top: 18px;
    }

    .onoffswitch {
        position: relative;
        width: 113px;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
    }

    .onoffswitch-checkbox {
        display: none;
    }

    .onoffswitch-label {
        display: block;
        overflow: hidden;
        cursor: pointer;
        border: 2px solid #999999;
        border-radius: 20px;
    }

    .onoffswitch-inner {
        display: block;
        width: 200%;
        margin-left: -100%;
        -moz-transition: margin 0.3s ease-in 0s;
        -webkit-transition: margin 0.3s ease-in 0s;
        -o-transition: margin 0.3s ease-in 0s;
        transition: margin 0.3s ease-in 0s;
    }

    .onoffswitch-inner:before, .onoffswitch-inner:after {
        display: block;
        float: left;
        width: 50%;
        height: 30px;
        padding: 0;
        line-height: 30px;
        font-size: 14px;
        color: white;
        font-family: Trebuchet, Arial, sans-serif;
        font-weight: bold;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    .onoffswitch-inner:before {
        content: "Intervalle";
        padding-left: 10px;
        background-color: #5D9AD4;
        color: #FFFFFF;
    }

    .onoffswitch-inner:after {
        content: "Défini";
        padding-right: 10px;
        background-color: #EEEEEE;
        color: #999999;
        text-align: right;
    }

    .onoffswitch-switch {
        display: block;
        width: 18px;
        height: 18px;
        margin-left: 6px;
        margin-right: 6px;
        margin-top: auto;
        margin-bottom: auto;
        background: #FFFFFF;
        border: 2px solid #999999;
        border-radius: 20px;
        position: absolute;
        top: 0;
        bottom: 0;
        /*right: 56px;*/
        -moz-transition: all 0.3s ease-in 0s;
        -webkit-transition: all 0.3s ease-in 0s;
        -o-transition: all 0.3s ease-in 0s;
        transition: all 0.3s ease-in 0s;
    }

    .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
        margin-left: 0;
    }

    .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
        right: 0px;
    }

    #group_intervalle {
        display: none;
    }

    /* FIN - BOUTON SWITCH INTERVALLE */
    .btn_val_annul, .btn_relancer {
        margin-top: 20px;
    }

    #annuler {
        float: right;
        background-color: #777777;
    }

    #rechercher, .relancer {
        background-color: #5D9AD4;
    }

    #annuler, #rechercher, .relancer {
        width: 150px;
        font-size: 17px;
    }

    .btn_relancer {
        text-align: center;
    }

    .relancer {
        border-radius: 4px;
        border: 1px solid #5D9AD4;
        color: #FFFFFF;
        height: 38px;
    }

    .relancer:hover {
        color: black;
    }

    table {
        width: 100%;
    }

    .tab_rdv_non_transmis {
        border: 1px solid #707070;
    }

    #title_tab {
        margin-left: 20px;
    }

    .tab_label {
        background-color: #777777;
        height: 32px;
        border: 1px solid #777777;
    }

    .label_title {
        font-size: 19px;
        color: #FFFFFF;
        margin-left: 20px;
        font-weight: normal;
    }

    .header_tab {
        height: 28px;
    }

    .header_tab th {
        font-size: 19px;
        height: 29px;
        padding: 3px 0;
        border: 1px solid #707070;
    }

    .header_tab th,
    .header_tab td {
        text-align: center;
        vertical-align: middle;
        border-right: 1px solid #707070;
    }

    .label_tous {
        background-color: #464646;
        width: 75%;
        border-radius: 6px;
        margin-left: auto;
        margin-right: auto;
        padding: 3px;
        color: #FFFFFF;
        line-height: normal;
        border-width: 0;
    }

    button.label_tous:hover {
        background-color: #5D9AD4;
    }

    .checkboxAlaxione,
    .checkboxOplus {
        transform: scale(1.5);
    }

    tbody {
        border: 1px solid #707070;
    }
    .tablepadding {
        padding: 10px 0 0 0;
    }
    .nav-tabs.nav-justified>li>a {
        font-size: larger;
        color: black;
    }
    .nav-tabs.nav-justified>li.active>a {
        color: #5D9AD4;
        font-weight: bold;
    }
    tr:hover {
        background-color:#f5f5f5;
    }
    .btn-similaire {
        border: none;
        background: #5D9AD4 0 0 no-repeat padding-box;
        border-radius: 7px;
        opacity: 1;
        margin: 4px;
    }
    .disabled {
        background: #777777 0 0 no-repeat padding-box;
    }
    .text-similaire {
        float: right;
        text-align: center;
        font: normal normal 900 25px/29px Avenir LT Std;
        letter-spacing: 0;
        color: #FFFFFF;
        opacity: 1;
        padding: 5px 10px;
    }
    .svgsimilaire {
        padding: 8px 2px 2px;
    }
</style>
{literal}
    <script type="text/javascript">



        function suppression_oplus(idrdv,identite,idbtsup,idexterne) {


            $.ajax({
                cache: false,
                type: "POST",
                url: 'script/script_action_oplus/supp_oplus.php',
                data: 'idexterne=' + idrdv+'&identite='+identite+'&idrdvinterne='+idexterne ,
                headers: {
                    "x-alx-idc": '',
                    "authorization":''
                },
                dataType: 'json',
                success: function(json) {
                    if(json.result=="ok") {
                        $('#' + idbtsup).hide();

                        $.pnotify({
                            title: 'Suppression RDV chez oplus',
                            text: 'Votre demande a bien été prise en compte et est traitée en arrière plan ' + idrdv + ' ' + identite,
                            type: 'success',
                            addclass: "stack-bottomright",
                            delay: 10000
                        });
                    }else{
                        $.pnotify({
                            title: 'Problème suppression oplus',
                            text: "Probleme survenue pendant la demande de suppression",
                            type: 'error',
                            addclass: "stack-bottomright",
                            delay: 3000
                        });
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $('#div_message_importe_preference').html(
                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                    );
                }
            });

        }

        function push_oplus(idrdv,identite,iddiv) {


            $.ajax({
                cache: false,
                type: "POST",
                url: 'script/script_action_oplus/push_rdv_oplus.php',
                data: 'idrdv=' + idrdv+'&identite='+identite ,
                headers: {
                    "x-alx-idc": '',
                    "authorization":''
                },
                dataType: 'json',
                success: function(json) {

                    if(json.result=="ok") {
                        $('#' + iddiv).hide();
                        $.pnotify({
                            title: 'Push des RDV chez oplus',
                            text: 'Votre demande a bien été prise en compte et est traitée en arrière plan ' + idrdv + ' ' + identite,
                            type: 'success',
                            addclass: "stack-bottomright",
                            delay: 10000
                        });
                    }else{
                        $.pnotify({
                            title: 'Problème push oplus',
                            text: "Probleme survenue pendant la demande de suppression",
                            type: 'error',
                            addclass: "stack-bottomright",
                            delay: 3000
                        });
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $('#div_message_importe_preference').html(
                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                    );
                }
            });

        }

    function maj_alaxione(idrdv,identite) {


            $.ajax({
                cache: false,
                type: "POST",
                url: 'script/script_action_oplus/push_alaxione.php',
                data: 'id=' + idrdv+'&identite='+identite ,
                headers: {
                    "x-alx-idc": '',
                    "authorization":''
                },
                dataType: 'json',
                success: function(json) {
                         $.pnotify({
                            title: 'Rapatriement RDV chez alaxione',
                            text: 'Votre demande a bien été prise en compte et est traitée en arrière plan '+idrdv+' '+identite,
                            type: 'success',
                            addclass: "stack-bottomright",
                            delay: 10000
                       });
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $('#div_message_importe_preference').html(
                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                    );
                }
            });
          
        }

       function maj_id_alaxione(idrdv,idexterne,identite,iderror,iddiv){

        $.ajax({
                cache: false,
                type: "POST",
                url: 'script/script_action_oplus/maj_id_alaxione.php',
                data: 'id=' + idrdv+'&identite='+identite+'&idrdvinterne='+idexterne+'&iderror='+iderror,
                headers: {
                    "x-alx-idc": '',
                    "authorization":''
                },
                dataType: 'json',
                success: function(json) {

                    if(json.result=="ok") {
                        $('#' + iddiv).hide();

                        $.pnotify({
                            title: 'Mise à jour id module externe',
                            text: 'Votre demande a bien été prise en compte et est traitée en arrière plan ',
                            type: 'success',
                            addclass: "stack-bottomright",
                            delay: 10000
                        });
                    }else{
                        $.pnotify({
                            title: 'Mise à jour id module externe',
                            text: "Probleme survenue pendant la demande de mise à jour",
                            type: 'error',
                            addclass: "stack-bottomright",
                            delay: 3000
                        });
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $('#div_message_importe_preference').html(
                        "<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>"
                    );
                }
            });

       }

    </script>
{/literal}

<div class="vd_title-section clearfix no-print">
    <div class="vd_panel-header">
        <h1>{$stitreControle}</h1>
        <p>
            <br />
            Cette page présente les incohérences des données Alaxione, comparées aux données Oplus.<br />
            Pour chaque ligne, choisir si le rdv doit être pushé chez Oplus ou si l’IDOPLUS doit être mis à jour.<br />
            S’il existe un rdv similaire sur Oplus, il faut mettre à jour l’IDOPLUS.<br />
            Si aucun rdv equivalent est trouvé sur Oplus, il faut le pusher sur Oplus.<br />
        <br />
        </p>
    </div>
</div>

<div class="col-md-12">
    <div class="panel widget">

        {literal}
        <div class="panel-heading vd_bg-grey" onclick="
                if(bouverture==0){$('#formRechConflitAbsence').css( 'display', 'block');
                bouverture=1;$('#iconeplusmoins').removeClass('fa-sort-desc');$('#iconeplusmoins').addClass('fa-sort-up');}
                else{$('#formRechConflitAbsence').css( 'display', 'none');bouverture=0;$('#iconeplusmoins').removeClass('fa-sort-up');$('#iconeplusmoins').addClass('fa-sort-desc');}">
            {/literal}
            <h3 class="panel-title"> 
                <span class="menu-icon"> 
                    <i class="fa fa-sort-desc" id="iconeplusmoins"></i> 
                </span>
                Rechercher nombre de ligne {$nbrligne}
            </h3>
        </div>

        <div class="panel-body" id="formRechConflitAbsence">
            <form class="form-horizontal" action="" role="form" id="formList" method="GET">
                <input type="hidden" name="dir" value="errorrdvalaxoplus">
                <input type="hidden" name="validation" value="ok">
                <input type="hidden" name="validation" value="ok">

                {* 1er ligne du formulaire *}
                <div class="form-group" id="recherche_1">
                    <div class="col-sm-3">
                        <label class="control-label font-size">Patient :</label>
                        <div class="controls">
                            <input class="input" type="text" name="patient" id="patient" value="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label font-size">Praticien :</label>
                        <div class="controls">
                            <input class="input" type="text" name="praticien" value="">
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label font-size">Status RDV :</label>
                        <div class="controls">
                            <select id="id_form_entite" class="js-example-basic-multiple" name="status">
                                <option></option>
                                <option value="1">RDV ACTIF</option>
                                <option value="2">RDV SUPPRIMER</option>

                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label font-size">Structure :</label>
                        <div class="controls input-group" id="id_entite"">
                            <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                        <select id="id_form_entite" class="js-example-basic-multiple" name="entite">
                            <option></option>
                            {foreach from=$aTabEntite item=entite}
                                    <option value="{$entite.id}">{$entite.nom}</option>
                            {/foreach}
                        </select>
                        </div>
                    </div>
                </div>
        <div class="form-group" id="recherche_2">

                <div class="col-sm-3">
                    <label class="control-label font-size">Provenance :</label>
                    <div class="controls input-group" id="id_entite"">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                    <select id="id_form_provenance" class="js-example-basic-multiple" name="provenance">
                        <option></option>
                        {foreach from=$aTabprovenance item=provenance}
                            <option value="{$provenance.id}">{$provenance.nom}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
    </div>

                {* Bouton switch *}
                <div class="form-group" id="btn_switch">
                    <div id="interval" class="font-size col-ms-6">
                        Rechercher une date et un horaire :
                    </div>

                    <div class="col-md-2" id="switch">
                        <div class="onoffswitch">
                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch">
                            <label class="onoffswitch-label" for="myonoffswitch">
                                <span class="onoffswitch-inner"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </div>
                </div>

                {literal}
                    <script>
                        var switchStatus = false;
                        $("#myonoffswitch").on('change', function () {
                            if ($(this).is(':checked')) {
                                switchStatus = $(this).is(':checked');
                                // activation (bleu)
                                $('#group_intervalle').css('display', 'block');
                                $('#group_simple').css('display', 'none');
                            } else {
                                switchStatus = $(this).is(':checked');
                                // désactivation (gris)
                                $('#group_intervalle').css('display', 'none');
                                $('#group_simple').css('display', 'block');

                            }
                        });
                    </script>
                {/literal}

                <div class="form-group" id="group_simple">
                    <div class="col-sm-3 controls">
                        <div id="divdate_simple">
                            <label class="font-size control-label">Date :</label>
                            <div class="input-group">

                                <input type="text" value=""
                                       name="date_simple" tabindex="26"
                                       id="date_simple"
                                      >
                                <span class="input-group-addon"
                                      id="datepicker-icon-trigger"
                                      data-datepicker="#date">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                            {literal}
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $("#date_simple").datepicker({
                                            dateFormat: 'dd/mm/yy',
                                            changeMonth: true,
                                            changeYear: true
                                        });
                                        $('[data-datepicker]').click(function (e) {
                                            var data = $(this).data('datepicker');
                                            $(data).focus();
                                        });
                                    });
                                </script>
                            {/literal}
                        </div>
                    </div>

                    {* BOUTON HEURE *}
                    <div class="col-sm-3 controls">
                        <div id="divheure_simple">
                            <label class="font-size control-label">Heure :</label>
                            <div class="input-group bootstrap-timepicker" id="groupe_heure_simple">
                                <input type="text" id="heure_simple" tabindex="23"
                                       name="heure_simple"
                                       value="">

                                <span class="input-group-addon"
                                      id="timepicker-default-span"><i
                                            class="fa fa-clock-o"></i></span>
                            </div>
                        </div>

                        {literal}
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $("#groupe_heure_simple").clockpicker({
                                        placement: 'top',
                                        autoclose: true
                                    });
                                    $("#groupe_heure_simple").mask("99:99");
                                });

                            </script>
                        {/literal}

                    </div>
                </div>

                <div class="form-group" id="group_intervalle">
                    {* BOUTON DATE Intervalle*}
                    <div class="col-sm-3 controls">
                        <div id="divdatedebut">
                            <label class="font-size control-label">Date de début :</label>
                            <div class="input-group">

                                <input type="text" value=""
                                       name="datedebut" tabindex="25"
                                       id="datedebut"
                                       >
                                <span class="input-group-addon"
                                      id="datepicker-icon-trigger"
                                      data-datepicker="#datedebut">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                            {literal}
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $("#datedebut").datepicker({
                                            dateFormat: 'dd/mm/yy',
                                            changeMonth: true,
                                            changeYear: true,
                                            onSelect: function (selectedDate) {
                                                $("#datefin").val(selectedDate);
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
                    </div>

                    <div class="col-sm-3 controls">
                        <div id="divdatefin">
                            <label class="font-size control-label">Date de fin :</label>
                            <div class="input-group">

                                <input type="text" value=""
                                       name="datefin" tabindex="26"
                                       id="datefin"
                                       >
                                <span class="input-group-addon"
                                      id="datepicker-icon-trigger"
                                      data-datepicker="#datefin">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                            {literal}
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $("#datefin").datepicker({
                                            dateFormat: 'dd/mm/yy',
                                            changeMonth: true,
                                            changeYear: true
                                        });
                                        $('[data-datepicker]').click(function (e) {
                                            var data = $(this).data('datepicker');
                                            $(data).focus();
                                        });
                                    });
                                </script>
                            {/literal}
                        </div>
                    </div>

                    {* BOUTON HEURE *}
                    <div class="col-sm-3 controls">
                        <div id="divheuredebut0">
                            <label class="font-size control-label">Heure de début :</label>
                            <div class="input-group bootstrap-timepicker" id="groupe_heuredebut0">
                                <input type="text" id="heuredebut0" tabindex="23"
                                       name="heuredebut0"
                                       value="">

                                <span class="input-group-addon"
                                      id="timepicker-default-span"><i
                                            class="fa fa-clock-o"></i></span>
                            </div>
                        </div>

                        {literal}
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $("#groupe_heuredebut0").clockpicker({
                                        placement: 'top',
                                        autoclose: true
                                    });
                                    $("#groupe_heuredebut0").mask("99:99");
                                });
                                var posdisplayheuredebut = 1;
                                var posdisplayheurefin = 1;

                                function open_tranche(compte) {


                                    sdivfin = "divheurefin" + compte;
                                    sdivdebut = "divheuredebut" + compte;
                                    document.getElementById(sdivfin).style.display = "block";
                                    document.getElementById(sdivdebut).style.display = "block";

                                    compte = compte + 1;
                                    return compte;

                                }
                            </script>
                        {/literal}

                    </div>

                    <div class="col-sm-3 controls">
                        <div id="divheurefin0">
                            <label class="font-size control-label">Heure de fin :</label>
                            <div class="input-group bootstrap-timepicker" id="groupe_heurefin0">
                                <input type="text" id="heurefin0" tabindex="24"
                                       name="heurefin0"
                                       value=""
                                       >

                                <span class="input-group-addon" id="timepicker-default-span">
                                    <i class="fa fa-clock-o"></i>
                                </span>
                            </div>

                        </div>

                        {literal}
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $("#groupe_heurefin0").clockpicker({
                                        placement: 'top',
                                        autoclose: true
                                    });
                                    $("#groupe_heurefin0").mask("99:99");
                                });
                            </script>
                        {/literal}

                    </div>
                </div>
                {* BOUTON VALIDER - ANNULER *}
                <div id="container_annuler" class="col-sm-6 controls btn_val_annul">
                    <button id="annuler" name="annuler" onclick="location.href='main.php?dir=errorrdvalaxoplus';"
                            type="button" class="btn vd_btn">
                        Annuler
                    </button>
                </div>
                <div id="container_rechercher" class="col-sm-6 controls btn_val_annul">
                    <button id="rechercher" name="rechercher"
                            type="submit" class="btn vd_btn">
                        <i class="fa fa-search"></i> Rechercher
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<hr>

{* Tableau des résultats de la recherche *}
<div class="col-sm-12">

    <table id="liste_Oplus" border="1">
        <thead>

        <tr class="">
            <th>
                <button id="checkAll_Oplus" class="label_tous"> Tous</button>
            </th>

            <th>Patient</th>
            <th>Praticien</th>
            <th>motif</th>
            <th>Provenance</th>
            <th>id alaxione</th>
            <th>Rendez-vous</th>
            <th>Date saisie Alaxione</th>
            <th>Ressemblance chez Oplus</th>
        </tr>
        </thead>
        <tbody>
        {foreach from=$rdv_oplus item=rdv name=rdv_oplus}
            <tr class="">
                <td>
                    <div id="{$rdv.id}_div">
                    {if $rdv.supplogique_prise_rendez_vous eq 'Y'}
                        <button class="btn-similaire" id="{$rdv.id}_bt" onclick="bok=confirm('ATTENTION CETTE ACTION SUPPRIMERA LE RDV SUR L\'OUTIL OPLUS'); if(bok)suppression_oplus('{$rdv.id_module_externe_prise_rendez_vous}','{$rdv.identite}','{$rdv.id}_div','{$rdv.id_rdv_versus_oplus}')">Supprimer RDV chez oplus</button><br>
                    {else}
                        <button class="btn-similaire" id="{$rdv.id}_bt" onclick="bok=confirm('ATTENTION CETTE ACTION VA CREER LE RDV SUR L\'OUTIL OPLUS'); if(bok)push_oplus('{$rdv.id}','{$rdv.identite}','{$rdv.id}_div')">Push du RDV chez oplus</button><br>
                    {/if}
                    </div>
                </td>
                <td class="patient" {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.nompatient} {$rdv.prenompatient}<br>
                    {$rdv.datenaissance}
                    </td>
                <td class="praticien"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.nomdocteur}</td>
                <td class="lieu"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.libelle_type_rdv}</td>
                <td class="provenance"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.provenance_saisi_prise_rendez_vous }</td>
                <td class="lieu"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.id_module_externe_prise_rendez_vous} {if $rdv.supplogique_prise_rendez_vous eq 'Y'} RDV EN STATUS SUPPIRME{/if}</td>
                <td class="rendez-vous"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.daterdv} à {$rdv.heurerdv}</td>
                <td class="rendez-vous"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>{$rdv.datesaisie} à {$rdv.heuresaisie}</td>
                <td class="rendez-vous"  {if $rdv.supplogique_prise_rendez_vous eq 'Y'}style="color:red"{/if}>
                    {$rdv.contenu_rdv_versus_oplus}

                </td>
            </tr>
        {/foreach}

        </tbody>
    </table>

    {if isset($aTabpagination) and !empty($aTabpagination)}
        <ul class="pagination">
            <li><a href="{$aTabpagination.page_precedente_firt}&pagesimple={$aTabpagination.simple}">&laquo;&laquo;</a></li>
            <li><a href="{$aTabpagination.page_precedente}&pagesimple={$aTabpagination.simple}">&laquo;</a></li>

            {foreach from=$aTabpagination.liste item=page}
                {if isset($page.selected) and $page.selected}
                    <li class="active"><a href="#">{$page.numero}</a></li>
                {else}
                    <li><a href="{$page.url}&pagesimple={$pagesimple}">{$page.numero}</a></li>
                {/if}
            {/foreach}

            <li><a href="{$aTabpagination.page_suivante}&pagesimple={$aTabpagination.simple}">&raquo;</a></li>
            <li><a href="{$aTabpagination.page_suivant_last}&pagesimple={$aTabpagination.simple}">&raquo;&raquo;</a></li>
        </ul>
    {/if}
    {include file="modal_rdv_similaire.tpl"}
</div>