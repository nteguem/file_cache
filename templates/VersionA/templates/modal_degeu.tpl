<!-- [DEBUT] Modal enregistrer un rendez-vous  -->

<script type="text/javascript" src="js/rechercher_code_postal.{$jsRechercherCodePostal}.js"></script>

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
                                    <div class="col-sm-4 controls" id="modalSelectService" style="display:none;">
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
                                                    $("#id_lieu_prendre_rdv_calendar").on('change',function (event) {
                                                        const locationId = event.target.value;
                                                        $.ajax({
                                                            url: '../ajax/liste_uniter_fonctionnelle_praticien.php',
                                                            data: {
                                                                'id_lieu': locationId,
                                                                'id_praticien_long': $('#id_globalidpraticienlong').val(),
                                                            },
                                                            dataType: 'html',
                                                            success: function (data) {
                                                                $('#id_service_lieu').html("<option value=''>Choisir un service</option>" + data);
                                                                $('#modalSelectService').css("display", "block");
                                                            },
                                                            error: function () {
                                                                $('#id_service_lieu').css("<option value=''>Aucun service</option>");
                                                                $('#modalSelectService').css("display", "none");
                                                                $('#id_service_lieu').removeAttr("required");
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
                                                        <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                            <select id="civilite_patient_prendre_rdv_calendar_vue_tous" name="civilite_patient_prendre_rdv_calendar_vue_tous" required class="required" style="border-color: red;">
                                                                <option value="" disabled selected hidden>Civilité</option>
                                                                {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                                    <option value="{$tabLC.id_civilite}">{$tabLC.abreviation_civilite}</option>
                                                                {/foreach}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4 controls">
                                                        <input type="text" placeholder="Nom" name="nom_patient_prendre_rdv_calendar_vue_tous"  autocomplete="new-password" id="nom_patient_prendre_rdv_calendar_vue_tous" value="" required style="border-color: red;" class="required input-majuscule input-widget" autocomplete="new-password" />

                                                        {literal}
                                                            <!-- Script pour l'auto-completion -->
                                                            <script type="text/javascript" >
                                                                $("#nom_patient_prendre_rdv_calendar_vue_tous").autocomplete({
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
                                                        <input type="text" placeholder="Prénom" name="prenom_patient_prendre_rdv_calendar_vue_tous"  autocomplete="new-password" id="prenom_patient_prendre_rdv_calendar_vue_tous" value="" required style="border-color: red;" class="required input-first-letter input-widget" autocomplete="new-password" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-sm-12 controls" id='divnomjeunefille_patient_prendre_rdv_calendar'>
                                                        <input type="text" placeholder="Nom de naissance " name="nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous" value="" class="input-majuscule input-widget" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-sm-12 controls" id="myModalAdresse">
                                                        <input type="text" placeholder="Adresse" name="adresse_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="adresse_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div class="col-sm-6 controls">
                                                        <input type="text" placeholder="Code postal" name="code_postal_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="code_postal_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                    <div class="col-sm-6 controls" id="myModalVille">
                                                        <select placeholder="Ville " id="ville_patient_prendre_rdv_calendar_vue_tous" name="ville_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password"  class="input-majuscule input-widget"></select>
                                                    </div>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            // In your Javascript (external .js resource or <script> tag)
                                                            $(document).ready(function() {
                                                                $('#ville_patient_prendre_rdv_calendar_vue_tous').select2({
                                                                    placeholder: 'Ville',
                                                                    dropdownParent: $('#myModalVille')
                                                                });
                                                            });

                                                        </script>
                                                    {/literal}
                                                </div>

                                                <div class="form-group groupAlignFlex">
                                                    <div class="col-sm-6 controls">
                                                        <input type="hidden" name="tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif" id="tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif" value="">
                                                        <input type="text" placeholder="Téléphone mobile" name="tel_mobile_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="tel_mobile_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                        {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").intlTelInput({
                                                                    preferredCountries: ["fr", "be", "ch"],
                                                                    initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                    utilsScript: "js/utils.js"
                                                                });
                                                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                                                                var countryDataInit = $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif").intlTelInput("getSelectedCountryData");
                                                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif").val(countryDataInit.dialCode);

                                                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").on("keyup change", function () {
                                                                    var countryData = $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").intlTelInput("getSelectedCountryData");
                                                                    $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif").val(countryData.dialCode);
                                                                });

                                                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").on("countrychange", function (e, countryData) {
                                                                    var idpays = countryData.iso2;
                                                                    if (idpays === "fr") {
                                                                        $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                                                                    } else if (idpays === "ch") {
                                                                        $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("999 999 99 99");
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
                                                        <input type="hidden" name="tel_fixe_patient_prendre_rdv_calendar_vue_tous_indicatif" id="tel_fixe_patient_prendre_rdv_calendar_vue_tous_indicatif" value="">
                                                        <input type="text" placeholder="Téléphone fixe" name="tel_fixe_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="tel_fixe_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                        {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").intlTelInput({
                                                                    preferredCountries: ["fr", "be", "ch"],
                                                                    initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                    utilsScript: "js/utils.js"
                                                                });
                                                                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                                                                var countryDataInit = $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").intlTelInput("getSelectedCountryData");
                                                                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous_indicatif").val(countryDataInit.dialCode);

                                                                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").on("keyup change", function () {
                                                                    var countryData = $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").intlTelInput("getSelectedCountryData");
                                                                    $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous_indicatif").val(countryData.dialCode);
                                                                });

                                                                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").on("countrychange", function (e, countryData) {
                                                                    var idpays = countryData.iso2;
                                                                    if (idpays === "fr") {
                                                                        $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                                                                    } else if (idpays === "ch") {
                                                                        $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").inputmask("999 999 99 99");
                                                                    }
                                                                });
                                                            });
                                                        </script>
                                                        {/literal}
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-sm-12 controls">
                                                        <input type="email" placeholder="Email" name="email_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="email_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-4 controls">
                                                        <div class="input-group">
                                                            <input type="text" placeholder="Date de naissance" name="date_naissance_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="date_naissance_patient_prendre_rdv_calendar_vue_tous" value="" class="required input-widget-date-left" required style="border-color: red;">
                                                            <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#date_naissance_patient_prendre_rdv_calendar_vue_tous">
                                                                <i class="fa fa-calendar"></i>
                                                            </span>
                                                            <div id="age_patient_prendre_rdv_calendar_vue_tous" class="vd_blue formPatientAge"></div>
                                                        </div>
                                                        <div id="bookingBoxdate_naissance_patient_prendre_rdv_calendar_vue_tous" style="position: absolute;z-index: 1;"></div>
                                                    </div>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#date_naissance_patient_prendre_rdv_calendar_vue_tous").datepicker({
                                                                    dateFormat: 'dd/mm/yy',
                                                                    changeMonth: true,
                                                                    changeYear: true,
                                                                    yearRange: "-100:+0",
                                                                }).on('change', function(ev) {
                                                                    const inputDate = $(ev.target).datepicker("getDate");
                                                                    if(inputDate){
                                                                        const dateDiff = new Date(inputDate - new Date());
                                                                        const age = Math.abs(dateDiff.getUTCFullYear() - 1970);
                                                                        $("#age_patient_prendre_rdv_calendar_vue_tous").text( age + ' ans');
                                                                    }else{
                                                                        $("#age_patient_prendre_rdv_calendar_vue_tous").text('');
                                                                    }
                                                                });
                                                                $('[data-datepicker]').click(function (e) {
                                                                    let data = $(this).data('datepicker');
                                                                    $(data).focus();
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}
                                                    <div class="col-sm-4 controls">
                                                        <input type="text" onkeyup="checkInsee(this);" placeholder="N° de sécurité sociale" autocomplete="new-password" name="num_secu_patient_prendre_rdv_calendar_vue_tous" id="num_secu_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                    <div class="col-sm-4 controls">
                                                        <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                            <select placeholder="Assurance maladie" id="assurance_patient_prendre_rdv_calendar_vue_tous" name="assurance_patient_prendre_rdv_calendar_vue_tous">
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
                                                        <input type="text" placeholder="Médecin traitant" name="medecin_traitant_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="medecin_traitant_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                    <div class="col-sm-6 controls">
                                                        <input type="text" placeholder="Ville du médecin" name="ville_medecin_patient_prendre_rdv_calendar_vue_tous" autocomplete="new-password" id="ville_medecin_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-6 controls">
                                                        <div class="input-group">
                                                            <select id="couleur_patient_prendre_rdv_calendar_vue_tous">
                                                                <option value="">Couleur du patient</option>
                                                                <option value="008000" style="color:#FFFFFF; background-color: #008000">Vert</option>
                                                                <option value="FF8D01" style="color:#FFFFFF; background-color: #FF8D01">Orange</option>
                                                                <option value="FF0000" style="color:#FFFFFF; background-color: #FF0000">Rouge</option>
                                                            </select>
                                                            <span id="cadre_couleur_patient_prendre_rdv_calendar_vue_tous" class="input-group-addon color-input"><i class="fa fa-square"></i></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 controls">
                                                        <input type="text" placeholder="Profession" name="profession_patient_prendre_rdv_calendar_vue_tous" id="profession_patient_prendre_rdv_calendar_vue_tous" value="" class="input-widget" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-sm-12 controls">
                                                        <textarea placeholder="Remarque" name="remarque_patient_prendre_rdv_calendar" id="remarque_patient_prendre_rdv_calendar" class="input-widget" ></textarea>
                                                    </div>
                                                </div>

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
        let tableau_data = [];
        let tableau_autre = [];
        let plus_motif_rdv = true;

        let button_valid_and_print_calendar = "";

        function launch_getSalleAttente() {
            setInterval(function () {
                getSalleAttente();
            }, 60000);
        }

        function setTimeline(mycalendar, view) {
            let curTime = new Date();

            if (curTime.getHours() == 0 && curTime.getMinutes() <= 5) // Because I am calling this function every 5 minutes
            {// the day has changed
                let todayElem = $(".fc-today");
                todayElem.removeClass("fc-today");
                todayElem.removeClass("fc-state-highlight");

                todayElem.next().addClass("fc-today");
                todayElem.next().addClass("fc-state-highlight");
            }

            let parentDiv = $('.fc-slats:visible').parent();
            let timeline = parentDiv.children(".timeline");
            if (timeline.length == 0) { //if timeline isn't there, add it
                timeline = $("<hr>").addClass("timeline");
                parentDiv.prepend(timeline);
            }

            let curCalView = view;

            if (curCalView.intervalStart < curTime && curCalView.intervalEnd > curTime) {
                timeline.show();
            } else {
                timeline.hide();
                return;
            }

            let calMinTimeInMinutes = strTimeToMinutes(curCalView.opt("minTime"));
            let calMaxTimeInMinutes = strTimeToMinutes(curCalView.opt("maxTime"));
            let curSeconds = ((((curTime.getHours() * 60) + curTime.getMinutes()) - calMinTimeInMinutes) * 60) + curTime.getSeconds();
            let percentOfDay = curSeconds / ((calMaxTimeInMinutes - calMinTimeInMinutes) * 60);
            let topLoc = Math.floor(parentDiv.height() * percentOfDay);
            let timeCol = $('.fc-time:visible');
            let infoCol = $('.fc-widget-content:visible');
            timeline.css("top", topLoc + "px");
            timeline.css("left", (timeCol.outerWidth(true)) + "px");
            timeline.css("width", (infoCol.outerWidth() - (timeCol.outerWidth(true))) + "px");


            if (curCalView.name == "agendaWeek") { //week view, don't want the timeline to go the whole way across
                var dayCol = $(".fc-today:visible");

                if (dayCol.position() != null)
                {
                    let left = dayCol.position().left + 1;
                    let width = dayCol.width() + 1;
                    timeline.css("left", left + "px");
                    timeline.css("width", width + "px");
                }
            }
        }

        function strTimeToMinutes(str_time) {
            let arr_time = str_time.split(":");
            let hour = parseInt(arr_time[0]);
            let minutes = parseInt(arr_time[1]);

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

        function enreg_planning_vue_tous(nompatient, idrdv, daterdv, heurerdv, idrdv, daterdvfin, heurefin, nomdocteur, iddocteur, idlieu, idtyperdv, jsEvent, idcalendar, identifiant_praticien, idaide, idplanning, nomaide, id_lieu_service) {            
            let jour = daterdv.substring(0, 2);
            let mois = daterdv.substring(3, 5) - 1;
            let moisreel = mois + 1;

            let annee = daterdv.substring(6, 10);

            let heures = heurerdv.substring(0, 2);
            let minutes = heurerdv.substring(3, 5);

            let sidrdv = String(idrdv);
            let dispo = sidrdv.split("-");
            if (dispo.length > 0) {
                sidrdv = dispo[0];
                let sid_rdv_temp_del = dispo[1];
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

                            get_new_rendez_vous_vue_tous(identifiant_praticien, daterdv, heurerdv, idlieu, idtyperdv, idaide, idplanning, nomaide, id_lieu_service);
                            $('#modalEnregistrerRendezVous').modal('show');
                            $('#nom_patient_prendre_rdv_calendar_vue_tous').focus();
                        });
                    }
                });
            } else {
                get_fiche_rendez_vous(idrdv);
                $('#modalFicheRendezVous').modal('show');
                $('#info_rdv_modal_link').click();
            }
        }

        function show_event() {
            $.ajax({
                cache: false,
                url: 'ajax/lock_rdv.php',
                data: 'idpraticien=' + 582824 + '&date=' + 2022107 + '&heure=' + 0810,
                dataType: 'json',
                success: function (json) {
                    $.each(json, function (index, value) {

                        if (value.sucess == 'nop') {
                            affiche_popup_messageRDV('Information', value.message, 'Oui', 'Non');
                        }

                        //$('#id_tmp_del').val(sid_rdv_temp_del);
                        get_new_rendez_vous_vue_tous(582824, daterdv, heurerdv, idlieu, idtyperdv, idaide, idplanning, nomaide, id_lieu_service);
                        $('#modalEnregistrerRendezVous').modal('show');
                        $('#nom_patient_prendre_rdv_calendar_vue_tous').focus();
                    });
                }
            });
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

        function getPractitionerForcedRights(id_user) {
            let result = false;
            $.ajax({
                url: 'ajax/get_droit_user_praticien.php',
                data: {idpraticien: id_user},
                dataType: 'json',
                async: false,
                cache: false,
                success: function(json) {
                    result = (json.length > 0 && json[0].bSucces && json[0].bSucces === "ok");
                }
            })
            return result;
        }

        function enreg_planning_seul_vue_tous(idpraticien, idlieu, idrdv, date, heuredebut, heurefin, actimoduleexterne, idcalendar, identifiant_praticien, idaide, idplanning, nomaide, copyId, appointmentAction, practitionerName = "", idLieuxFiltres="") {
            let dateJour = new Date();
            let numberJour = dateJour.getTime();

            let jour = date.substring(0, 2);
            let mois = date.substring(3, 5) - 1;
            let annee = date.substring(6, 10);

            let heures = heuredebut.substring(0, 2);
            let minutes = heuredebut.substring(3, 5);

            let dateClick = new Date(annee, mois, jour, heures, minutes, "00", "00");
            let dateClick2 = new Date(annee, mois, jour, heures, minutes, "00", "00");
            dateClick.setMinutes(dateClick.getMinutes() + {/literal}{$sTaillecellule}{literal} - 1);
            let numberdateClick = dateClick.getTime();
            let numberdateClick2 = dateClick2.getTime();

            $('#id_globalclickpriserdv').val('bt_calendar')

            const practitionerForcedRight = getPractitionerForcedRights(idpraticien);
            if ($("#bdroitcreerendezvouscalendar").val() === "1" && practitionerForcedRight) {

                var moisreel = mois + 1;
                $.ajax({
                    cache: false,
                    url: 'ajax/lock_rdv.php',
                    data: 'idpraticien=' + idpraticien + '&date=' + annee + moisreel + jour + '&heure=' + heures + minutes,
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {
                            var practitionerId = value.guid_praticien;
                            if (value.sucess == 'nop') {
                                showInformationMessage(value.message);
                            }
                            var valeurcookiecopier = '';
                            var valeurcookiecouper = '';
                            if(copyId !== "") {
                                valeurcookie= copyId;
                                if(appointmentAction === "copy"){
                                    valeurcookiecopier = copyId;
                                }else{
                                    valeurcookiecouper = copyId;
                                }
                            }



                            if (valeurcookiecouper != null && valeurcookiecouper != "") {
                                if (numberdateClick2 < numberJour) {
                                    showInformationMessage('Vous ne pouvez pas déplacer un rendez-vous dans le passé.');
                                }else{
                                    idplanning=0;
                                    let tabcolle = valeurcookie.split('|');

                                    $.ajax({
                                        cache: false,
                                        url: 'ajax/controle_dispo_planning.php',
                                        data: 'idpraticien=' + idpraticien + '&daterdv=' + date+ '&heurerdv=' + heuredebut+ '&idrdv=' + copyId,
                                        dataType: 'json',
                                        success: function (json) {
                                            $.each(json, function (index, value) {
                                                $("#id_planningcopiercouper").val(value.idplanning);
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
                                                messagetitle ="Informations sur le rendez-vous "+ copyId +" le "+ date + " à " + heuredebut + " avec le docteur " + idpraticien;
                                                $("#LabelmodalComfirmeCouper").html(messagetitle);
                                                Message = sMessageAlert+"<span style='color:black;font-size:20px'>Souhaitez-vous déplacer ce rendez-vous au "+date + " à " + heuredebut + " sur ce calendrier </span>";
                                                $("#modal_couper_id_rdv_copie").val(copyId);
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
                                    showInformationMessage('ATTENTION ! Vous êtes sur le point de créer un rendez-vous dans le passé');
                                }
                                sMessageAlert ="";
                                idplanning=0;
                                let tabcolle = valeurcookie.split('|');
                                $.ajax({
                                    cache: false,
                                    url: 'ajax/controle_dispo_planning.php',
                                    data: 'idpraticien=' + idpraticien + '&daterdv=' + date+ '&heurerdv=' + heuredebut+ '&idrdv=' + copyId,
                                    dataType: 'json',
                                    success: function (json) {
                                        $.each(json, function (index, value) {
                                            $("#id_planningcopiercouper").val(value.idplanning);

                                            tab = valeurcookiecopier.split('|');

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
                                            messagetitle ="Rendez-vous le "+ date + " à " + heuredebut + " avec " + practitionerName +"";
                                            $("#LabelmodalComfirmeCopier").html(messagetitle);
                                            Message = sMessageAlert+"<span style='color:black;font-size:20px'>Souhaitez-vous copier ce rendez-vous au "+date + " à " + heuredebut + " sur ce calendrier </span>";

                                            $("#modal_copier_id_rdv_copie").val(copyId);
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
                                    showInformationMessage('ATTENTION ! Vous êtes sur le point de créer un rendez-vous dans le passé');
                                }
                                if (typeof identifiant_praticien === 'undefined') {
                                    identifiant_praticien = value.guid_praticien;
                                }
                                get_new_rendez_vous_vue_tous(identifiant_praticien, date, heuredebut, idlieu, "", idaide, idplanning, nomaide, "", idLieuxFiltres);

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
                                    $('#nom_patient_prendre_rdv_calendar_vue_tous').focus();
                                });
                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif").val('fr');
                                $("#id_praticien_prendre_rdv_calendar").prop('disabled', true);
                            }
                        });
                    }
                });

            } else {
                showInformationMessage('ATTENTION : Votre paramétrage n\'autorise pas la prise de rendez-vous depuis le calendrier, merci d\'utiliser la fonction "Prendre un rendez-vous"');
            }
        }

        var propositiionfirst="";

        function getDateTime() {
            let now = new Date();
            let year = now.getFullYear();
            let month = now.getMonth() + 1;
            let day = now.getDate();
            let hour = now.getHours();
            let minute = now.getMinutes();
            let second = now.getSeconds();
            if (month.toString().length == 1) {
                let month = '0' + month;
            }
            if (day.toString().length == 1) {
                let day = '0' + day;
            }
            if (hour.toString().length == 1) {
                let hour = '0' + hour;
            }
            if (minute.toString().length == 1) {
                let minute = '0' + minute;
            }
            if (second.toString().length == 1) {
                let second = '0' + second;
            }
            let dateTime = day + '/' + month + '/' + year + ' ' + hour + ':' + minute + ':' + second;
            return dateTime;
        }

        function sgetDate(format) {
            let now = new Date();
            let year = now.getFullYear();
            let month = now.getMonth() + 1;
            let day = now.getDate();
            if (month.toString().length == 1) {
                let month = '0' + month;
            }
            if (day.toString().length == 1) {
                let day = '0' + day;
            }

            let dateTime;
            if (format == "YYYY-MM-DD") {
                dateTime = year + '-' + month + '-' + day;
            } else {
                dateTime = day + '/' + month + '/' + year;
            }

            return dateTime;
        }

        function rafraichir_calendrierNew(idlieu, idpratcien, idrdv, validation, datedebut, firstrdvdispo, reinit, idprofession = 0, force_praticien = false) {
            let iHeure = 0;
            let sidpasselieu = document.getElementById(idlieu).value;
            let sidrdv = document.getElementById(idrdv).value;
            let sdatedebut = document.getElementById(datedebut).value;

            let sdatedebut2;
            let found = false;

            if (reinit == 1) {
                sidpasselieu = "";
                sidrdv = "";
                sdatedebut = "";
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
                                let sdateTemp1 = moment(value.start).format('DD/MM/YYYY');
                                let sdateTemp2 = moment(value.start).format('YYYY-MM-DD');
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
                    let node = document.getElementById('headingOne' + profession)
                    $(Node).css("display", "block");
                    $("#headingOne" + profession).css("display", "inline-flex");
                    $("#collapseOne" + profession).collapse('show');
                    $("#vd_checkboxTous" + profession).css("display", "block");
                    let NodeForPraticien = document.getElementById("collapseOne" + profession);
                    $("#collapseOne" + profession).css("height", "unset");
                    $("#btn_link" + profession).removeClass("collapsed");
                    let childNode = NodeForPraticien.getElementsByClassName('mySearchChild');
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
            let sidpasselieu = document.getElementById(idlieu).value;
            let sidrdv = document.getElementById(idrdv).value;
            let sdatedebut = document.getElementById(datedebut).value;
            let sdateTemp = document.getElementById(datedebut).value;
            let sdatedebut2;

            if (reinit == 1) {
                sidpasselieu = "";
                sidrdv = "";
                sdatedebut = "";
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
                                showInformationMessage("Aucune disponibilité trouvée!");
                            }

                        }

                    }
                });
            } else {
                $('#datedebutaff_{/literal}{$objetPraticien.id_user}{literal}').val(sdatedebut2);
                $('#calendar_{/literal}{$objetPraticien.id_user}{literal}').fullCalendar('gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));
            }

            $('#calendar_' +{/literal}{$objetPraticien.id_user}{literal}).fullCalendar('refetchEvents');
            {/literal}{/foreach}{literal}
        }

        function retourProchainRDV() {
            document.getElementById("idpasselieu").value = "";
            document.getElementById("idpasserdv").value = "";
            document.getElementById("idpassevalidation").value = "";
            document.getElementById("id_propositionfirst").value = "";
            {/literal}
            {foreach from=$tabPraticien item=objetPraticien name=sTabPraticien}{literal}


            $('#calendar_' +{/literal}{$objetPraticien.id_user}{literal}).fullCalendar('refetchEvents');
            {/literal}{/foreach}{literal}
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

        function modal_prendre_rendez_vous_unique(idp, idprofession, link = 'normal', nom, bDeletePatient = false, idlieu = undefined) {
            $('#LabelmodalPrendreRendezVouUniques').html('Prendre un rendez-vous');
            $('#idnomaffichepatient').val('');
            if (bDeletePatient){
                $('#id_identifiant_patient').val('');
            }

            $('#div_name_praticien').html('<h2></h2>');
            $('#idp_unique').val(idp);
            if (!idp || idp == '') {
                $('#idp_unique_all').val('vide');
            } else {
                $('#idp_unique_all').val('plein');
            }
            $('#id_propush').val(idprofession);

            $('#id_globalclickpriserdv').val('bt_plus');

            if(idlieu){
                $('#locationIdModal').val(idlieu);
            }

            if (link == "normal") {
                reinitialise_modal_prendre_rendez_vous_unique();
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
            reinitialise_modal_prendre_rendez_vous_uniqueGlobal();
            $('#modalPrendreRendezVousUniqueGlobal').modal('show');
            $('#modalPrendreRendezVousUniqueGlobal').css('display', 'block');
            $('#tabPrendreRendezVousUnique1Global').css('display', 'block');
            $('#form_etape1_prendre_rendez_vous_uniqueGlobal').show();
            $('#modalPrendreRendezVousUniqueGlobal').css("z-index","2100");
        }

        function modal_prochain_rendez_vous_unique(idp, idprofession) {
            $('#idp_unique').val(idp);
            $('#id_propush').val(idprofession);
            reinitialise_modal_prochain_rendez_vous_unique();
            $('#id_globalclickpriserdv').val('bt_calendar');
            $('#selectprofession').prop('disabled', true);

            $('#myModalfiltrrdv').modal('show');
        }


        function modal_prendre_rendez_vous_anesthesiste() {
            reinitialise_modal_prendre_rendez_vous_anesthesiste_unique();
            $('#modalPrendreRendezVousAnesthesiste').modal('show');
        }

        function getFormValues(formElement){
            const result = {
                startDate: formElement.find('#date_prendre_rdv_calendar').val(),
                startHour: formElement.find('#heure_reelle_prendre_rdv_calendar').val(),
                duration: formElement.find('#temps_consultation_calendar').val(),
                practitionerId: formElement.find('#id_praticien_prendre_rdv_calendar').val(),
                typeId: formElement.find('#type_rdv_calendar').val(),
                firstName: formElement.find('#prenom_patient_prendre_rdv_calendar_vue_tous').val(),
                lastName: formElement.find('#nom_patient_prendre_rdv_calendar_vue_tous').val(),
                birthName: formElement.find('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').val(),
                address: formElement.find('#adresse_patient_prendre_rdv_calendar_vue_tous').val(),
                zipCode: formElement.find('#code_postal_patient_prendre_rdv_calendar_vue_tous').val(),
                city: formElement.find('#ville_patient_prendre_rdv_calendar_vue_tous').val(),
                mobilePhone: formElement.find('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').val(),
                mobilePrefix: formElement.find('#tel_mobile_patient_prendre_rdv_calendar_vue_tous_indicatif').val(),
                fixPhone: formElement.find('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').val(),
                fixPrefix: formElement.find('#tel_fixe_patient_prendre_rdv_calendar_vue_tous_indicatif').val(),
                mailAddress: formElement.find('#email_patient_prendre_rdv_calendar_vue_tous').val(),
                birthDate: formElement.find('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val(),
                secuNumber: formElement.find('#num_secu_patient_prendre_rdv_calendar_vue_tous').val(),
                assurance: formElement.find('#assurance_patient_prendre_rdv_calendar_vue_tous').val(),
                assignedDoctor: formElement.find('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').val(),
                doctorCity: formElement.find('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').val(),
                color: formElement.find('#couleur_patient_prendre_rdv_calendar_vue_tous').val(),
                profession: formElement.find('#profession_patient_prendre_rdv_calendar_vue_tous').val(),
                comment: formElement.find('#remarque_patient_prendre_rdv_calendar').val(),
                civility: formElement.find('#civilite_patient_prendre_rdv_calendar_vue_tous').val(),
                locationId: formElement.find('#id_lieu_prendre_rdv_calendar').val(),
                
            }
            return result;
        }

        $(document).ready(function () {
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

            $(document).on('shown.bs.tab', '#ulcalendar a[data-toggle="tab"]', function (e) {
                let str = String(e.target);
                let res = str.split('#');
                if (str != "") {
                    let id_calendar = res[1].substring(3);

                    $('#tabactive').val(id_calendar);
                    window.localStorage.clear();
                    if (document.getElementById('first_' + id_calendar).value == "1" && $('#iddateplanning').val() == "") {
                        $('#calendar_' + id_calendar).fullCalendar('today');
                        document.getElementById('first_' + id_calendar).value = "0";
                    } else {
                        if ($('#iddateplanning').val() != "") {
                            $('#calendar_' + id_calendar).fullCalendar('gotoDate', moment($('#iddateplanning').val(), 'DD/MM/YYYY'));
                        }
                    }

                    getSalleAttente();
                    getConsigne($("#identifiant_praticien_" + id_calendar).val(), id_calendar);
                }

            });

            $('#tab_profession').click(function () {
                $('#bsetapplique').val("profession");
            });

            $('#tab_praticien').click(function () {
                $('#bsetapplique').val("praticien");
            });

            $('#btn_modal_search_filtre_rdv').click(function (ev) {
                $('#moderecherche').val("ok");
                $('#divErreurfiltrerdv').hide();
                $('#divfiltrerdv').hide();
                $('#divattentefiltrerdv').show();
                
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

            $('#btn_param_calendar').click(function () {


                if (document.getElementById('div_param_agenda').style.display == "none") {
                    $('#div_param_agenda').slideDown('slow', function () {});

                    $(".checkpraticien").prop("checked", false);
                    $(".checkprofession").prop("checked", false);
                } else {
                    $('#div_param_agenda').slideUp('slow', function () {});
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

            $('#form-inline').removeAttr('style');
            $('#ulcalendar').removeAttr('style');
            $('.fc-unthemed').removeAttr('style');

            $("#btn_check_patient_prendre_rdv_calendar").click(function () {
                if ($('#civilite_patient_prendre_rdv_calendar_vue_tous').val()=="" || $('#nom_patient_prendre_rdv_calendar_vue_tous').val()=="" || $('#prenom_patient_prendre_rdv_calendar_vue_tous').val()=="" ){
                    showInformationMessage("Veuillez saisir toutes les informations nécessaires pour le patient");
                    return false;
                }
                if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==false){
                    showInformationMessage("Date de naissance incorrecte");
                    return false;
                }
                button_valid_and_print_calendar = $(this).attr('name');
                $('#id_globaltypeprint').val($(this).attr('name'));
            });

            $("#btn_check_patient_prendre_rdv_print_calendar").click(function () {
                if ($('#civilite_patient_prendre_rdv_calendar_vue_tous').val()=="" || $('#nom_patient_prendre_rdv_calendar_vue_tous').val()=="" || $('#prenom_patient_prendre_rdv_calendar_vue_tous').val()=="" ){
                    showInformationMessage("Veuillez saisir toutes les informations nécessaires pour le patient");
                    return false;
                }
                if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==false){
                    showInformationMessage("Date de naissance incorrecte");
                    return false;
                }
                button_valid_and_print_calendar = $(this).attr('name');
                $('#id_globaltypeprint').val($(this).attr('name'));
            });

            $('#modal_enregistrer_rdv').submit(function (event ) {
                var bcontinu = true;
                if ($('#teleconsult_prendre_rdv_calendar').val() == 'Y') {
                    if ($('#email_patient_prendre_rdv_calendar_vue_tous').val() != "") {
                        bcontinu = true;
                    } else {
                        showInformationMessage("Pour une téléconsultation, vous devez renseigner l'email du patient");
                        bcontinu = false;
                        return false;
                    }

                    if ($('#montant_teleconsult_prendre_rdv_calendar').val() != "") {
                        bcontinu = true;
                    } else {
                        showInformationMessage("Pour une téléconsultation, vous devez renseigner un montant de téléconsultation");
                        bcontinu = false;
                        return false;
                    }
                }
                const formElement = $(event.target);
                const idc = $('#idc').val();
                const idPatient = $('#id_patient_prendre_rdv_calendar').val();

                const formValues = getFormValues(formElement);
                formValues['patientId'] = idPatient;
                formValues['idc'] = idc;
                
                const searchParams = {
                    id_centre: idc,
                    id_patient: idPatient,
                    date_debut: formValues.startDate,
                    heure_debut: formValues.startHour,
                    duree: formValues.duration,
                    idpraticien: formValues.practitionerId,
                    idmotif: formValues.typeId
                }
                //vérification si un rdv de ce type n'existe pas déjà
                $.ajax({
                    cache: false,
                    url: 'ajax/check_rdv_existe.php',
                    data: searchParams,
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

                                let Mytable = '<table class="table table-striped table-hover no-head-border"><thead class="vd_bg-color vd_white">' +
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
                                    enregistrement_rdv_calendar(formValues);
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
                        || ($('#civilite_patient_prendre_rdv_calendar_vue_tous').val() != null && $('#nom_patient_prendre_rdv_calendar_vue_tous').val() != ''
                            && $('#prenom_patient_prendre_rdv_calendar_vue_tous').val() != ''))
                    && isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==true) {

                    $('#div_title_historique').hide();
                    $('#div_liste_rdv_generer').show('slow');
                    $('#div_liste_rdv_generer').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");

                    let data = $('#date_prendre_rdv_calendar').val();
                    let arr = data.split('/');
                    let data2 = $('#heure_reelle_prendre_rdv_calendar').val();
                    let arr2 = data2.split(':');

                    let data3 = $('#heure_patient_prendre_rdv_calendar').val();
                    let arr3 = data3.split(':');

                    let id_praticien_rdv_timestamp = $('#id_praticien_prendre_rdv_calendar').val() + '-' + arr[2] + '-' + arr[1] + '-' + arr[0] + '-' + arr2[0] + '-' + arr2[1] + '-' + $('#id_lieu_prendre_rdv_calendar').val() + '-1-' + $('#type_rdv_calendar').val();
                    let selected_recurrent_repeter_le = $('input[name=recurrent_repeter_le_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();
                    let selected_recurrent_termine = $('input[name=recurrent_termine_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();

                    let tabInfo = id_praticien_rdv_timestamp.split('-');

                    let month = new Array(12);
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

                    let sjour = new Array(7);
                    sjour[0] = "Dimanche";
                    sjour[1] = "Lundi";
                    sjour[2] = "Mardi";
                    sjour[3] = "Mercredi";
                    sjour[4] = "Jeudi";
                    sjour[5] = "Vendredi";
                    sjour[6] = "Samedi";

                    let formattedDate = new Date(tabInfo[1] + "-" + tabInfo[2] + "-" + tabInfo[3]);
                    let d = formattedDate.getDay();
                    let m = formattedDate.getMonth();

                    let jourliteralrdvinitial = sjour[d] + " " + tabInfo[3] + " " + month[m] + " " + tabInfo[1] + " à " + arr3[0] + ":" + arr3[1];

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
                                let tableau_rdv_recurrent = "<table style='padding:10px;' width='100%' border='1'>";

                                tableau_rdv_recurrent += "<tr><td></td><td><b>Le jour du RDV</b></td><td><b>Les propositions</b></td><td><b>Actions</b></td></tr>";
                                tableau_rdv_recurrent += "<tr><td id='tdnum-1' style='padding:5px;'><span style='font-size: small;' class='badge vd_bg-red'>1</span></td><td style='padding: 20px;'>" + jourliteralrdvinitial + "</td><td></td><td></td></tr>";

                                let i = 2;
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
                                    tableau_rdv_recurrent += "</td></tr>";
                                });
                                tableau_rdv_recurrent += "</table>";
                                $('#div_liste_rdv_generer').html(tableau_rdv_recurrent);

                                let hiddendate = "";
                                let initdatereccurent = "";
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
                    if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==false){
                        showInformationMessage("Date de naissance incorrecte");
                    }
                    if ($('#type_rdv_calendar').val() === '') {
                        showInformationMessage("Veuillez choisir un motif de RDV");
                    }

                    if ($('#id_patient_prendre_rdv_calendar').val() === '' && ($('#civilite_patient_prendre_rdv_calendar_vue_tous').val() === null || $('#nom_patient_prendre_rdv_calendar_vue_tous').val() === '' || $('#prenom_patient_prendre_rdv_calendar_vue_tous').val() === '' || $('#nom_patient_prendre_rdv_unique').prop('disabled') === false)) {
                        showInformationMessage("Veuillez sélectionner, valider ou saisir les champs obligatoires de la fiche patient");
                    }

                    if ($('#id_praticien_prendre_rdv_calendar').val() === '') {
                        showInformationMessage("Veuillez sélectionner un praticien");
                    }

                    if ($('#id_lieu_prendre_rdv_calendar').val() === '') {
                        showInformationMessage("Veuillez sélectionner un lieu");
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
                            || ($('#civilite_patient_prendre_rdv_calendar_vue_tous').val() != null && $('#nom_patient_prendre_rdv_calendar_vue_tous').val() != ''
                                && $('#prenom_patient_prendre_rdv_calendar_vue_tous').val() != '' && $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val() != ''))
                        && isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==true) {
                        $('#div_title_historique').hide();
                        $('#div_recurrence_perso').show('slow');
                        $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', true);
                        $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', true);
                    } else {
                        $('#recurrent_prendre_rdv_calendar').val('N');
                        if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==false){
                            showInformationMessage("Date de naissance incorrecte");
                        }
                        if ($('#type_rdv_calendar').val() === '') {
                            showInformationMessage("Veuillez choisir un motif de RDV");
                        }


                        if ($('#id_patient_prendre_rdv_calendar').val() === '' && ($('#civilite_patient_prendre_rdv_calendar_vue_tous').val() === null || $('#nom_patient_prendre_rdv_calendar_vue_tous').val() === '' || $('#prenom_patient_prendre_rdv_calendar_vue_tous').val() === '' || $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val() === '' || $('#nom_patient_prendre_rdv_unique').prop('disabled') === false)) {
                            showInformationMessage("Veuillez sélectionner, valider ou saisir les champs obligatoires de la fiche patient");
                        }

                        if ($('#id_praticien_prendre_rdv_calendar').val() === '') {
                            showInformationMessage("Veuillez sélectionner un praticien");
                        }

                        if ($('#id_lieu_prendre_rdv_calendar').val() === '') {
                            showInformationMessage("Veuillez sélectionner un lieu");
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

            $('#couleur_patient_prendre_rdv_calendar_vue_tous').on('change', function () {
                $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').attr('style', 'color:#' + $('#couleur_patient_prendre_rdv_calendar_vue_tous').val());
            });

            let curdatemobile = new Date();
            curdatemobile = curdatemobile.getDate() + "/" + (curdatemobile.getMonth() + 1) + "/" + curdatemobile.getFullYear();

            $('#datemenupickermobile').DatePicker({
                flat: true,
                date: curdatemobile,
                current: curdatemobile,
                format: 'd/m/Y',
                calendars: 1,
                mode: 'single',
                starts: 1,
                onChange: function (formated) {
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

        });

        // *********************************************************************************************************************************************************************************** -- FUNCTION -- **********************************************************************************//

        function reinitialise_modal_prendre_rendez_vous_calendar() {
            $('#id_patient_prendre_rdv_calendar').val("");
            $('#id_patient_prendre_rdv_unique').val("");
            $('#civilite_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#nom_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#prenom_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#adresse_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#code_postal_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#ville_patient_prendre_rdv_calendar_vue_tous option').remove();
            $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#email_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').trigger('change');
            $('#num_secu_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#profession_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#remarque_patient_prendre_rdv_calendar').val("");
            $('#assurance_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#couleur_patient_prendre_rdv_calendar_vue_tous').val("").change();
            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').prop("title", "");
            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').html('<i class="fa fa-square"></i>');
            $('#id_service_lieu').html("");

            $("#code_postal_patient_prendre_rdv_calendar_vue_tous").inputmask("9*999");
            $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
            $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
            $("#num_secu_patient_prendre_rdv_calendar_vue_tous").inputmask("9 99 99 9* 999 999 99");
            $("#date_naissance_patient_prendre_rdv_calendar_vue_tous").inputmask("99/99/9999");

            $('#civilite_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#nom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false).focus();
            $('#prenom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#adresse_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#code_postal_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#ville_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#email_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#num_secu_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#profession_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#assurance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#couleur_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $("#id_lieu_prendre_rdv_calendar").attr('disabled', false);
            $("#id_service_lieu").attr('disabled', false);

            //recurrence
            $('#recurrent_prendre_rdv_calendar').val("N");
            $('#recurrent_nb_repete_prendre_rdv_calendar').val("1");
            $('#recurrent_select_repete_prendre_rdv_calendar').val("semaine");
            $('#reccurent_date_fin_patient_prendre_rdv_calendar').val("").prop('disabled', true);
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
            $('#civilite_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#nom_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#prenom_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#adresse_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#code_postal_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#ville_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#email_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').trigger('change');
            $('#num_secu_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#profession_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#remarque_patient_prendre_rdv_calendar').val("");
            $('#assurance_patient_prendre_rdv_calendar_vue_tous').val("");
            $('#couleur_patient_prendre_rdv_calendar_vue_tous').val("").change();
            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').prop("title", "");
            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').html('<i class="fa fa-square"></i>');

            $("#code_postal_patient_prendre_rdv_calendar_vue_tous").inputmask("9*999");
            $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
            $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
            $("#num_secu_patient_prendre_rdv_calendar_vue_tous").inputmask("9 99 99 9* 999 999 99");
            $("#date_naissance_patient_prendre_rdv_calendar_vue_tous").inputmask("99/99/9999");

            $('#civilite_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#nom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false).focus();
            $('#prenom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#adresse_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#code_postal_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#ville_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#email_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#num_secu_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#profession_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#assurance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#couleur_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);

            //recurrence
            $('#recurrent_prendre_rdv_calendar').val("N");
            $('#recurrent_nb_repete_prendre_rdv_calendar').val("1");
            $('#recurrent_select_repete_prendre_rdv_calendar').val("semaine");
            $('#reccurent_date_fin_patient_prendre_rdv_calendar').val("").prop('disabled', true);
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
                        $('#civilite_patient_prendre_rdv_calendar_vue_tous option[value="' + value.id_civilite + '"]').prop('selected', true);
                        $('#id_patient_prendre_rdv_calendar').val(idpatient);
                        $('#nom_patient_prendre_rdv_calendar_vue_tous').val(value.nom);
                        $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').val(value.nom_fille);
                        $('#prenom_patient_prendre_rdv_calendar_vue_tous').val(value.prenom);
                        $('#adresse_patient_prendre_rdv_calendar_vue_tous').val(value.adresse);
                        $('#code_postal_patient_prendre_rdv_calendar_vue_tous').val(value.codepostal);
                        $('#ville_patient_prendre_rdv_calendar_vue_tous').val(value.ville);
                        $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').val(value.telmobile);
                        $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').val(value.telfixe);
                        $('#email_patient_prendre_rdv_calendar_vue_tous').val(value.email);
                        $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val(value.datenaissance);
                        $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').trigger('change');
                        $('#num_secu_patient_prendre_rdv_calendar_vue_tous').val(value.numsecu);
                        $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').val(value.medecintraitant);
                        $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').val(value.villemedecin);
                        $('#profession_patient_prendre_rdv_calendar_vue_tous').val(value.profession);
                        $('#couleur_patient_prendre_rdv_calendar_vue_tous').val(value.couleur).change();
                        $('#ville_patient_prendre_rdv_unique').empty();

                        $('#ville_patient_prendre_rdv_calendar_vue_tous').append('<option value="' + value.ville + '">' + value.ville + '</option>');


                        if (value.remarque != "") {
                            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').html('<i class="fa fa-square"></i>&nbsp;<i style="color: #000 !important;" class="fa fa-comments-o"></i>');
                            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').prop('title', value.remarque);
                        } else {
                            $('#cadre_couleur_patient_prendre_rdv_calendar_vue_tous').html('<i class="fa fa-square"></i>');
                        }

                        $('#assurance_patient_prendre_rdv_calendar_vue_tous option[value="' + value.id_assurance_maladie + '"]').prop('selected', true);

                        //Masque de saisie pour la Fiche Patient
                        $("#code_postal_patient_prendre_rdv_calendar_vue_tous").inputmask("9*999");
                        $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                        $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").inputmask("99 99 99 99 99");
                        $("#num_secu_patient_prendre_rdv_calendar_vue_tous").inputmask("9 99 99 9* 999 999 99");
                        $("#date_naissance_patient_prendre_rdv_calendar_vue_tous").inputmask("99/99/9999");


                        if ($('#nom_patient_prendre_rdv_calendar_vue_tous').val() != "") {
                            $('#div_reinit_calendar').show();
                        } else {
                            $('#div_reinit_calendar').hide();
                        }

                        $('#civilite_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#nom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#prenom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#adresse_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#code_postal_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#ville_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#email_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#num_secu_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#profession_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#assurance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                        $('#couleur_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);

                        $('#div_button_update_patient_calendar').hide();
                        $('#div_button_suivant_calendar').show();

                        getHistoriquePatient();
                    });
                }
            });

            return false;
        }

        function get_new_rendez_vous_vue_tous(idpraticienrdv, daterdv, heurereellerdv, idlieurdv, idmotif, idaide, idplanning, nomaide, id_lieu_service = "", idLieuxFiltres = "") {
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

            $('#divMessageRemplacant').hide();
            $('#sMessageRemplacant').html("");
            $('#message_retour_info_enregistrer_rendez_vous').hide().html("");

            $('#btn_plus_rdv_modal_calendar').prop('disabled', false);

            tableau_data = [];
            tableau_autre = [];
            tableau_id = [];
            plus_motif_rdv = true;
            $("#type_rdv_calendar").empty();
            $("#id_lieu_prendre_rdv_calendar").empty();

            let tabInfo = daterdv.split('/');
            let formattedDate = new Date(tabInfo[2] + "-" + tabInfo[1] + "-" + tabInfo[0]);
            let lejour = formattedDate.getDay();
            let sjour = new Array(7);
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
                data: 'idc=' + $('#idc').val() + '&iddocteur=' + idpraticienrdv + '&daterdv=' + daterdv + '&heuredebut=' +
                    heurereellerdv + '&idlieu=' + idlieurdv + '&idaide=' + idaide + '&idplanning=' + idplanning + '&nomaide=' +
                    nomaide + '&id_lieu_service=' + id_lieu_service + '&id_lieux_filtres=' + idLieuxFiltres,
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

                        let count = 0;
                        $.each(value['tabMotifAutreRDV'], function (index, value) {
                            tableau_data.push(value.tmprdv);
                            tableau_autre.push(value.libelle_type_rdv);
                            tableau_id.push(value.id_type_rdv);
                            count = count + 1;
                        });                        

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
                        
                        if (value.id_planning === "") {
                            $("#id_lieu_prendre_rdv_calendar").trigger('change');
                        } else {
                            $("#id_lieu_prendre_rdv_calendar").attr('disabled', true);
                            $("#id_service_lieu").attr('disabled', true);
                        }

                        if (value['bcouple']) {
                            $('#divMessageAide').show();
                            $('#sMessageRdvAide').html(value['messageCouple']);
                            $('#id_rdv_aide').val(idaide);
                        } else {
                            $('#divMessageAide').hide();
                            $('#id_rdv_aide').val('');
                        }

                        $('#nom_patient_prendre_rdv_calendar_vue_tous').focus();
                    });
                }
            });
        }


        function debloque_modification_patient_modal_prendre_rendez_vous_calendar() {

            $('#civilite_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#nom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#prenom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#adresse_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#code_postal_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#ville_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#email_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#num_secu_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#profession_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#assurance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);
            $('#couleur_patient_prendre_rdv_calendar_vue_tous').prop('disabled', false);

            $('#div_button_suivant_calendar').hide();
            $('#div_button_update_patient_calendar').show();

        }

        function modification_patient_modal_prendre_rendez_vous_calendar() {
            if(isValidDate($('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val())==false){
                showInformationMessage("Date de naissance incorrecte");
                return false;
            }else{
                $.ajax({
                    cache: false,
                    url: 'ajax/modif_patient.php',
                    data: 'identifiant_entite=' + $('#idc').val() + '&id_patient=' + $('#id_patient_prendre_rdv_calendar').val() + '&nom_mod_up=' + $('#nom_patient_prendre_rdv_calendar_vue_tous').val() + '&nom_fille_mod_up=' + $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').val()
                        + '&prenom_mod_up=' + $('#prenom_patient_prendre_rdv_calendar_vue_tous').val() + '&tel_mod_up=' + $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').val() + '&tel_fixe_mod_up=' + $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').val()
                        + '&email_mod_up=' + $('#email_patient_prendre_rdv_calendar_vue_tous').val() + '&date_naissance_mod_up=' + $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').val() + '&adresse_mod_up=' + $('#adresse_patient_prendre_rdv_calendar_vue_tous').val()
                        + '&code_postal_mod_up=' + $('#code_postal_patient_prendre_rdv_calendar_vue_tous').val() + '&ville_mod_up=' + $('#ville_patient_prendre_rdv_calendar_vue_tous').val() + '&num_secu_mod_up=' + $('#num_secu_patient_prendre_rdv_calendar_vue_tous').val()
                        + '&selectassurance=' + $('#assurance_patient_prendre_rdv_calendar_vue_tous').val() + '&medecin_traitant_mod_up=' + $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').val() + '&ville_medecin_mod_up=' + $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').val()
                        + '&profession_mod_up=' + $('#profession_patient_prendre_rdv_calendar_vue_tous').val() + '&couleur=' + $('#couleur_patient_prendre_rdv_calendar_vue_tous').val() + '&remarque=' + $('#remarque_patient_prendre_rdv_calendar').val() + '&civilite_mod_up=' + $('#civilite_patient_prendre_rdv_calendar_vue_tous').val(),
                    dataType: 'json',
                    success: function (json) {
                        $.each(json, function (index, value) {
                            if (value.success = true) {
                                $('#civilite_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#nom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#prenom_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#nom_jeune_fille_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#adresse_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#code_postal_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#ville_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#tel_mobile_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#tel_fixe_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#email_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#date_naissance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#num_secu_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#medecin_traitant_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#ville_medecin_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#profession_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#assurance_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);
                                $('#couleur_patient_prendre_rdv_calendar_vue_tous').prop('disabled', true);

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
            let itaille = tableau_autre.length;
            $('#type_rdv_calendar').empty();
            $('#type_rdv_calendar').append('<option value="">Choisir un motif de RDV</option>');


            $.ajax({
                cache: false,
                url: 'ajax/get_motif_praticien.php',
                data: 'iddocteur=' + $('#id_praticien_prendre_rdv_calendar').val(),
                dataType: 'json',
                success: function (json) {
                    $.each(json, function (index, value) {
                        $('#type_rdv_calendar').append('<option value="' + value.id_type_rdv + '">' + value.libelle_type_rdv + '</option>');
                    });
                }
            });
            $("#btn_plus_rdv_modal_calendar").prop('disabled', true);
        }


        function getHistoriquePatient() {
            let idpatient = $('#id_patient_prendre_rdv_calendar').val();
            let identifiantentite = $('#idc').val();

            $('#attente_historique_patient_prendre_rdv_calendar').show();
            $('#pas_historique_patient_prendre_rdv_calendar').hide();
            $('#historique_patient_prendre_rdv_calendar').hide();

            let $boucleHistoriquePrendreRdvCalendar = $('#boucle_historique_prendre_rdv_calendar');

            $boucleHistoriquePrendreRdvCalendar.isotope();
            $boucleHistoriquePrendreRdvCalendar.isotope('destroy');

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
                        let tabStatut = [];
                        $.ajax({
                            cache: false,
                            url: 'ajax/get_statut_patient.php',
                            data: '',
                            dataType: 'json',
                            async: false,
                            success: function (json) {
                                $.each(json, function (index, value) {
                                    let taTemp = [];
                                    taTemp.push(value.id_status);
                                    taTemp.push(value.libelle_status);
                                    tabStatut.push(taTemp);
                                });
                            }
                        });
                        let nb_p = 0;
                        let nb_t = 0;
                        let nb_abe = 0;
                        let nb_abne = 0;

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
                            let str_abr_praticien = value.abreviation_praticien;
                            let str_abr_motif = value.abreviation_rdv;

                            if (value.status_rdv != "") {
                                let boucle_historique = '<div class="element-item col-sm-12 ' + value.status_rdv + '" data-category="' + value.status_rdv + '" style="border:1px solid #CCCCCC;padding-top: 1px;padding-bottom: 1px;padding-right: 0px;padding-left: 0px; ' + background + '">' +
                                    value.abre_civilite_docteur +' ' + str_abr_praticien.toUpperCase() + ' - ' + value.date_rdv + ' à ' + value.heure_rdv + ' - ' + str_abr_motif.toUpperCase() + '<br/>' +
                                    '<span style="color:#000;">' + value.remarque_rdv + '</span>' +
                                    '</div>';

                                $boucleHistoriquePrendreRdvCalendar.append(boucle_historique);
                            }
                        });

                        $('#libelle_rdv_planifie').html(nb_p + " Pl.");
                        $('#libelle_rdv_traite').html(nb_t + " Tr.");
                        $('#libelle_rdv_ab_excusee').html(nb_abe + " Abs. Ex.");
                        $('#libelle_rdv_ab_non_excusee').html(nb_abne + " Abs. Non Ex.");

                        $boucleHistoriquePrendreRdvCalendar.isotope({
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#arrow_switch_names').on('click', function(){
                var nom = $("#nom_patient_prendre_rdv_calendar_vue_tous").val();
                var prenom = $("#prenom_patient_prendre_rdv_calendar_vue_tous").val();
                $("#nom_patient_prendre_rdv_calendar_vue_tous").val(prenom);
                $("#prenom_patient_prendre_rdv_calendar_vue_tous").val(nom);
            });
            $('#arrow_switch_phones').on('click', function(){
                var mobile = $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").val();
                var fixe = $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").val();
                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").val(fixe);
                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").val(mobile);

                var mobileNumber = $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").intlTelInput("getSelectedCountryData");
                var fixeNumber = $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").intlTelInput("getSelectedCountryData");
                $("#tel_fixe_patient_prendre_rdv_calendar_vue_tous").intlTelInput("setCountry",mobileNumber.iso2);
                $("#tel_mobile_patient_prendre_rdv_calendar_vue_tous").intlTelInput("setCountry",fixeNumber.iso2);
            });
            $('.js-example-basic-single').select2();

        });
    </script>
</div>
<!-- [FIN] Modal enregistrer un rendez-vous  -->

<div>
    {include file='modal_alert_information.tpl'}
</div>
