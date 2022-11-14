<script type="text/javascript">
    // @T8131 On évite de pouvoir créer des doublons en validant le form plusieurs fois d'affilé
    $(document).ready(function () {
        var allowSubmit = true;
        $("#form_etape1_prendre_rendez_vous_unique").onsubmit = function () {
            if (allowSubmit){
                allowSubmit = false;
                return true;
            } else {
                return false;
            }
        }
    });
</script>

<!-- [DEBUT] Modal Prendre un rendez-vous Unique Nouveau Praticien-->
<div style="overflow-x: hidden;overflow-y: auto;z-index:2200;" class="modal fade in"
    id="modalPrendreRendezVousUnique" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVousUnique"
    aria-hidden="false" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" style="width:1200px!important;z-index: 2300;">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                            class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalPrendreRendezVouUniques"> Prendre un rendez-vous </h4>
            </div>
            <div class="modal-body row" style="margin-right: 0!important;margin-left: 0!important;">
                <div class="col-sm-12">
                    <div id="wizard-rdv-unique" class="form-wizard">
                        <div class="progress active" style="">
                            <div class="progress-bar"> </div>
                        </div>
                        <ul>
                            <li><a href="#tabPrendreRendezVousUnique1" data-toggle="tab">
                                    <div id="tabbunique1" class="menu-icon">&nbsp;</div>
                                    RDV disponibles
                                </a>
                            </li>
                            <li><a href="#tabPrendreRendezVousUnique2" data-toggle="tab">
                                    <div id="tabbunique2" class="menu-icon">&nbsp;</div>
                                    Informations patient
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div id="wizard-rdv-unique" class="form-wizard">

                        <div class="tab-content no-bd" style="padding-top: 0px;">
                            <div class="tab-pane" id="tabPrendreRendezVousUnique1">

                                <div id="attente_chargement_etape1_prendre_rendez_vous_unique"></div>
                                <form class="form-horizontal" action="" role="form"
                                      id="form_etape1_prendre_rendez_vous_unique"
                                      name="form_etape1_prendre_rendez_vous_unique">
                                    <input type="hidden" value="" id="idp_unique" name='idp_unique' />
                                    <input type="hidden" value="" id="idp_unique_all" name='idp_unique_all' />
                                    <input type="hidden" value="" id="id_propush" name='id_propush' />
                                    <input type="hidden" value="" id="locationIdModal" name='locationIdModal' />
                                    <input type="hidden" value="planning" id="validation_rdv_unique"
                                           name='validation_rdv_unique' />
                                    <input type="hidden" value="3" id='all_unique' name='all_unique' />


                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            {* <div class="col-sm-2"></div> *}
                                            <div class="col-sm-12">

                                                <div id="div_name_praticien" class="col-sm-12"></div>

                                                <div id="divcatprofession_prendre_rendez_vous_unique"
                                                     class="col-sm-12 controls" style='display:none ;'>
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>spécialité :</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="selectcatprofession_prendre_rendez_vous_unique"
                                                                id="selectcatprofession_prendre_rendez_vous_unique"></select>
                                                    </div>
                                                </div>

                                                <div id="divprofession_prendre_rendez_vous_unique"
                                                     class="col-sm-12 controls" style='display:none;'>
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Quelle est la profession ?</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="selectprofession_prendre_rendez_vous_unique"
                                                                id="selectprofession_prendre_rendez_vous_unique"></select>
                                                    </div>
                                                </div>

                                                {* Filtres groupe *}
                                                <div id="divFiltreGroups" class="col-sm-12 controls"
                                                     style='display:none;'>
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Filtres sur les groupes ?</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="consultation_groupe_prendre_rendez_vous_unique"
                                                                id="consultation_groupe_prendre_rendez_vous_unique"></select>
                                                    </div>
                                                </div>

                                                <div id="divmotif_prendre_rendez_vous_unique" class="col-sm-12 controls"
                                                     style="display:none;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Quel est le motif de la consultation ?</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="consultation_prendre_rendez_vous_unique"
                                                                id="consultation_prendre_rendez_vous_unique"></select>
                                                    </div>
                                                </div>

                                                <div id="divlieu_prendre_rendez_vous_unique" class="col-sm-12 controls"
                                                     style="display:none;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Quel est le lieu du rendez-vous ?</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="lieu_prendre_rendez_vous_unique"
                                                                id="lieu_prendre_rendez_vous_unique"></select>
                                                    </div>
                                                </div>

                                                <div id="divpraticien_prendre_rendez_vous_unique"
                                                     class="col-sm-12 controls" style="display:none;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Avec quel praticien ?</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="praticien_prendre_rendez_vous_unique"
                                                                id="praticien_prendre_rendez_vous_unique"
                                                                onchange="get_consigns();"></select>
                                                    </div>
                                                </div>
                                                <div id="researchFieldNotFound"
                                                    class="col-sm-12" style="display:none; margin-top: 10px;">
                                                    <div class="alert alert-danger" id="fieldNotFoundText">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"></div>
                                        </div>
                                    </div>

                                    <hr noshade width="400" size="3" align="center">
                                    <div id="divoption_prendre_rendez_vous_unique" class="col-sm-12 controls"
                                         style="margin:0px; padding:0px;display:none;">
                                        <div class="form-group">
                                            <div class="col-sm-4 controls" style="margin:0px;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Date de début</b>
                                                    </label>
                                                </div>
                                                <div class="input-group">
                                                    <input type="text" placeholder="Choisissez une date de début"
                                                           value="" name="datepicker_rdv_unique" id="datepicker_rdv_unique"
                                                           class="input-widget-date-left">
                                                    <span class="input-group-addon input-widget-date-right"
                                                          id="datepicker-icon-trigger"
                                                          data-datepicker="#datepicker_rdv_unique">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                </div>
                                                <div id="bookingBoxdatepicker_rdv_unique"
                                                     style="position: absolute;z-index: 1;"></div>
                                                {literal}
                                                    <script type="text/javascript">
                                                        $("#datepicker_rdv_unique").datepicker({
                                                            dateFormat: 'dd/mm/yy',
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            showOptions:{direction:'down'},
                                                        });
                                                        $('[data-datepicker]').click(function(e) {
                                                            var data = $(this).data('datepicker');
                                                            $(data).focus();
                                                        });
                                                    </script>
                                                {/literal}
                                            </div>

                                            <div class="col-sm-4 controls" style="margin:0px;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Jour</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                    <select name="jour_prendre_rendez_vous_unique"
                                                            id="jour_prendre_rendez_vous_unique">
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
                                                        <b>Créneau horaire</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-compte" style="margin:0px;padding:0px;">
                                                    <select name="horaire_prendre_rendez_vous_unique"
                                                            id="horaire_prendre_rendez_vous_unique">
                                                        <option value="">Indifférent</option>
                                                        <option value="6-11">Matin</option>
                                                        <option value="12-21">Après-Midi</option>
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
                                        <div class="form-group">
                                            <div class="periode">
                                                <div class="col-sm-4 controls" style="margin:0px;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Période</b>
                                                        </label>
                                                    </div>
                                                    <input id="date_auto" type="number"
                                                           style="box-shadow: 2px 2px 2px silver;border-radius:5px;" min=0
                                                           oninput="validity.valid||(value='');"
                                                           onchange="calcul_date_auto();" onkeyup="calcul_date_auto();">
                                                </div>
                                                <div class="col-sm-4 controls" style="margin:0px;">
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b style="visibility:hidden"> Durée de la période</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-compte"
                                                         style="margin:0px;padding:0px;">
                                                        <select name="periode_prendre_rendez_vous_unique"
                                                                id="periode_prendre_rendez_vous_unique"
                                                                onchange="calcul_date_auto();">
                                                            <option value="jour">Jour</option>
                                                            <option value="semaine">Semaine</option>
                                                            <option value="mois">Mois</option>
                                                            <option value="annee">Année</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 controls"  style="margin:0px;">
                                                    <div style="margin:0px auto;padding: 30px;text-align: center;">
                                                        <button id="btn_recherche_rdv_prendre_rendez_vous_unique" type="button"
                                                                class="btn vd_btn vd_bg-blue vd_white"
                                                                onclick="recherche_rdv_prendre_rendez_vous_unique2();" style="border-radius: 20px !important;"><i class="fa fa-search" aria-hidden="true" style="margin-right: 5px"></i>Rechercher</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12" style="margin-top:20px">
                                        <div id="cabinet-praticien">
                                        </div>
                                    </div>

                                    <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous_unique"
                                         style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                </form>
                            </div>
                            <div class="tab-pane" id="tabPrendreRendezVousUnique2" style="width: 160%;">
                                <div id="">
                                </div>
                                <div class="col-sm-12 controls" id="divtempcheckpatient_unique" style="display:none;">
                                </div>
                                <hr>
                                <div class="form-group clearfix" id="div_teleconsult_prendre_rdv_unique">
                                    <div class="col-sm-6 controls">
                                        <div class="label-wrapper-modal" style="float: left;">
                                            <label class="control-label">RDV en Téléconsultation :</label>
                                        </div>
                                        <div class="controls">
                                            <select id="teleconsult_prendre_rdv_unique"
                                                    name="teleconsult_prendre_rdv_unique">
                                                <option value="Y">Oui</option>
                                                <option value="N" selected>Non</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 controls" id="div_montant_teleconsult_prendre_rdv_unique"
                                         style="display: none">
                                        <div class="label-wrapper-modal">
                                            <label class="control-label">Montant de la téléconsultation :</label>
                                        </div>
                                        <div class="input-group">
                                            <input type="text" id="montant_teleconsult_prendre_rdv_unique"
                                                   name="montant_teleconsult_prendre_rdv_unique">
                                            <span class="input-group-addon">€</span>
                                        </div>
                                    </div>
                                </div>
                                {* <hr> *}
                                <div class="form-group" style="margin-bottom: 5px;">
                                    <div class="col-sm-12 controls">
                                        <div class="col-sm-8" style="padding-left: 0px;">
                                            <div class="col-sm-10">
                                                <h3><a href="javascript:void(0);"
                                                       onclick="reduire_div_information_patient_unique();"><i
                                                                class="fa fa-chevron-circle-down"></i>&nbsp;</a>
                                                    Informations du patient</h3>
                                            </div>
                                            <div class="col-sm-8 controls" style="display:none;" id="div_reinit_unique">
                                                <a href="#"
                                                   onclick="debloque_modification_patient_modal_prendre_rendez_vous_unique();"><i
                                                            class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a
                                                        href='#'
                                                        onclick="reinitialise_patient_prendre_rendez_vous_unique();"><i
                                                            class="fa fa-refresh"></i> Changer de patient</a>
                                                {* <a href="#" onclick="debloque_modification_patient_modal_prendre_rendez_vous_unique();"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinitialise_patient_prendre_rendez_vous_unique();" ><i class="fa fa-refresh"></i> Réinitialiser</a> *}
                                            </div>
                                        </div>
                                        <div class="col-sm-4" style="padding-right: 0px;"
                                             id="div_title_historique_unique">
                                            <h3>Historique des RDV</h3>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                    <form class="form-horizontal" action="#" role="form"
                                          id="modal_etape2_prendre_rdv_unique" name="modal_etape2_prendre_rdv_unique"
                                          autocomplete="new-password">

                                        <div id="div_info_patient_historique_complet_unique">
                                            <div class="col-sm-8" style="padding-left: 0px;">
                                                <input type="hidden" name="id_temp_rdv_unique" value=""
                                                       id="id_temp_rdv_unique">
                                                <input type="hidden" name="id_praticien_rdv_timestamp_unique" value=""
                                                       id="id_praticien_rdv_timestamp_unique">
                                                <input type="hidden" name="id_praticien_rdv_unique" value=""
                                                       id="id_praticien_rdv_unique">
                                                <div class="col-sm-12 controls" id="divenregpatient_unique">
                                                    <div class="form-group"
                                                         {if $rdv_prive_actif!='Y'}style="display:none;" {/if}>
                                                        <div class="col-sm-6 controls">
                                                            <div class="label-wrapper-modal">
                                                                <label class="control-label">RDV privé :</label>
                                                            </div>
                                                            <div class="vd_radio radio-success">
                                                                <input type="radio" name="prive_prendre_rdv_unique"
                                                                       value="Y" id="id_prive_prendre_rdv_unique_oui">
                                                                <label for="id_prive_prendre_rdv_unique_oui">Oui</label>
                                                                <input type="radio" name="prive_prendre_rdv_unique"
                                                                       checked="checked" value="N"
                                                                       id="id_prive_prendre_rdv_unique_non">
                                                                <label for="id_prive_prendre_rdv_unique_non">Non</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" style="margin-bottom: 5px;">
                                                    </div>


                                                    <div class="form-group groupAlignFlex">
                                                        <div class="col-sm-3 controls">
                                                            <div class="vd_input-wrapper-compte"
                                                                 style="margin:0px;font-weight:400">
                                                                <select id="civilite_patient_prendre_rdv_unique"
                                                                        name="civilite_patient_prendre_rdv_unique" required
                                                                        class="required" style="border-color: red;">
                                                                    <option value="" disabled selected hidden>Civilité
                                                                    </option>
                                                                    {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                                        <option value="{$tabLC.id_civilite}">
                                                                            {$tabLC.abreviation_civilite}</option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-5 controls">
                                                            <input type="text" placeholder="Nom"
                                                                   name="nom_patient_prendre_rdv_unique"
                                                                   id="nom_patient_prendre_rdv_unique" value="" required
                                                                   style="border-color: red;"
                                                                   class="required input-majuscule input-widget"
                                                                   autocomplete="new-password" />
                                                            <input type="hidden" name="id_patient_prendre_rdv_unique"
                                                                   id="id_patient_prendre_rdv_unique">
                                                            {literal}
                                                                <!-- Script pour l'auto-completion -->
                                                                <script type="text/javascript">
                                                                    $("#nom_patient_prendre_rdv_unique").autocomplete({
                                                                        source: 'ajax/recherche_fiche_patient_auto_complete.php?nouveaupatient=ok',
                                                                        focus: function(event, ui) {
                                                                            event.preventDefault();
                                                                        },
                                                                        select: function(event, ui) {
                                                                            event.preventDefault();
                                                                            getInfoPatientModalPrendreRDV_unique(ui.item.value, ui.item.term);
                                                                        },
                                                                        appendTo: "#modalPrendreRendezVousUnique"
                                                                    });

                                                                    $("#nom_patient_prendre_rdv_unique").on('keydown',
                                                                        function(e) {
                                                                            if (e.key === 'Enter' || e.keyCode === 13) {
                                                                                if ($("#nom_patient_prendre_rdv_unique").val().length != 0) {
                                                                                    getInfoPatientModalPrendreRDV_unique(0, $("#nom_patient_prendre_rdv_unique").val());
                                                                                    $(this).val("");
                                                                                }
                                                                                e.preventDefault();
                                                                                return false;
                                                                            }
                                                                        });
                                                                </script>
                                                            {/literal}
                                                        </div>
                                                        <div class="controls arrowSwitchButton"
                                                             onclick='switchNomPrenom("#prenom_patient_prendre_rdv_unique","#nom_patient_prendre_rdv_unique")'>
                                                            <img src="img/switch.png"/>
                                                        </div>
                                                        <div class="col-sm-4 controls">
                                                            <input type="text" placeholder="Prénom"
                                                                   name="prenom_patient_prendre_rdv_unique"
                                                                   id="prenom_patient_prendre_rdv_unique" value="" required
                                                                   style="border-color: red;"
                                                                   class="required input-first-letter input-widget"
                                                                   autocomplete="new-password" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group"
                                                         id='divnomjeunefille_patient_prendre_rdv_unique'>
                                                        <div class="col-sm-12 controls">
                                                            <input type="text" placeholder="Nom de naissance"
                                                                   name="nom_jeune_fille_patient_prendre_rdv_unique"
                                                                   id="nom_jeune_fille_patient_prendre_rdv_unique" value=""
                                                                   class="input-majuscule input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <input type="text" placeholder="Adresse"
                                                                   name="adresse_patient_prendre_rdv_unique"
                                                                   id="adresse_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Code postal"
                                                                   autocomplete="new-password"
                                                                   name="code_postal_patient_prendre_rdv_unique"
                                                                   id="code_postal_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <select placeholder="Ville"
                                                                    id="ville_patient_prendre_rdv_unique"
                                                                    name="ville_patient_prendre_rdv_unique"
                                                                    autocomplete="new-password"
                                                                    class="input-majuscule input-widget"
                                                                    {if $iAccess != '10' && $iAccess!='5'}disabled{/if}></select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group groupAlignFlex">
                                                        <div class="col-sm-6 controls">
                                                            <input type="hidden"
                                                                   name="tel_mobile_patient_prendre_rdv_unique_indicatif"
                                                                   id="tel_mobile_patient_prendre_rdv_unique_indicatif"
                                                                   value="{$num_indicatif_structure}">
                                                            <input type="text" placeholder="Téléphone mobile"
                                                                   name="tel_mobile_patient_prendre_rdv_unique"
                                                                   id="tel_mobile_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                            {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    $("#tel_mobile_patient_prendre_rdv_unique")
                                                                        .intlTelInput({
                                                                            preferredCountries: ["fr", "be",
                                                                                "ch"
                                                                            ],
                                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                            utilsScript: "js/utils.js"
                                                                        });

                                                                    if ($(
                                                                        "#tel_mobile_patient_prendre_rdv_unique_indicatif")
                                                                        .val() === "41") {
                                                                        $("#tel_mobile_patient_prendre_rdv_unique")
                                                                            .inputmask("999 999 99 99");
                                                                    } else if ($(
                                                                        "#tel_mobile_patient_prendre_rdv_unique_indicatif"
                                                                    ).val() === "33") {
                                                                        $("#tel_mobile_patient_prendre_rdv_unique")
                                                                            .inputmask("99 99 99 99 99");
                                                                    }

                                                                    $("#tel_mobile_patient_prendre_rdv_unique")
                                                                        .on("keyup change", function() {
                                                                            var countryData = $("#tel_mobile_patient_prendre_rdv_unique").intlTelInput("getSelectedCountryData");
                                                                            $("#tel_mobile_patient_prendre_rdv_unique_indicatif")
                                                                                .val(countryData.dialCode);
                                                                        });

                                                                    $("#tel_mobile_patient_prendre_rdv_unique")
                                                                        .on("countrychange", function(e,
                                                                                                      countryData) {
                                                                            $("#tel_mobile_patient_prendre_rdv_unique_indicatif")
                                                                                .val(countryData.dialCode);
                                                                            var idpays = countryData.iso2;
                                                                            if (idpays === "fr") {
                                                                                $("#tel_mobile_patient_prendre_rdv_unique")
                                                                                    .inputmask(
                                                                                        "99 99 99 99 99");
                                                                            } else if (idpays === "ch") {
                                                                                $("#tel_mobile_patient_prendre_rdv_unique")
                                                                                    .inputmask(
                                                                                        "999 999 99 99");
                                                                            }
                                                                        });
                                                                });
                                                            </script>
                                                            {/literal}
                                                        </div>
                                                        <div class="controls arrowSwitchButton"
                                                             onclick='switchTel("#tel_mobile_patient_prendre_rdv_unique","#tel_fixe_patient_prendre_rdv_unique")'>
                                                            <img src="img/switch.png"/>
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="hidden" name="type_rdv" id="type_rdv" value="">
                                                            <input type="hidden"
                                                                   name="tel_fixe_patient_prendre_rdv_unique_indicatif"
                                                                   id="tel_fixe_patient_prendre_rdv_unique_indicatif"
                                                                   value="{$num_indicatif_structure}">
                                                            <input type="text" placeholder="Téléphone fixe"
                                                                   name="tel_fixe_patient_prendre_rdv_unique"
                                                                   id="tel_fixe_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                            {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    $("#tel_fixe_patient_prendre_rdv_unique")
                                                                        .intlTelInput({
                                                                            preferredCountries: ["fr", "be",
                                                                                "ch"
                                                                            ],
                                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                            utilsScript: "js/utils.js"
                                                                        });

                                                                    if ($(
                                                                        "#tel_fixe_patient_prendre_rdv_unique_indicatif")
                                                                        .val() === "41") {
                                                                        $("#tel_fixe_patient_prendre_rdv_unique")
                                                                            .inputmask("999 999 99 99");
                                                                    } else if ($(
                                                                        "#tel_fixe_patient_prendre_rdv_unique_indicatif"
                                                                    ).val() === "33") {
                                                                        $("#tel_fixe_patient_prendre_rdv_unique")
                                                                            .inputmask("99 99 99 99 99");
                                                                    }

                                                                    $("#tel_fixe_patient_prendre_rdv_unique")
                                                                        .on("keyup change", function() {
                                                                            var countryData = $(
                                                                                "#tel_fixe_patient_prendre_rdv_unique"
                                                                            ).intlTelInput(
                                                                                "getSelectedCountryData"
                                                                            );
                                                                            $("#tel_fixe_patient_prendre_rdv_unique_indicatif")
                                                                                .val(countryData.dialCode);
                                                                        });

                                                                    $("#tel_fixe_patient_prendre_rdv_unique")
                                                                        .on("countrychange", function(e,
                                                                                                      countryData) {
                                                                            $("#tel_fixe_patient_prendre_rdv_unique_indicatif")
                                                                                .val(countryData.dialCode);
                                                                            var idpays = countryData.iso2;
                                                                            if (idpays === "fr") {
                                                                                $("#tel_fixe_patient_prendre_rdv_unique")
                                                                                    .inputmask(
                                                                                        "99 99 99 99 99");
                                                                            } else if (idpays === "ch") {
                                                                                $("#tel_fixe_patient_prendre_rdv_unique")
                                                                                    .inputmask(
                                                                                        "999 999 99 99");
                                                                            }
                                                                        });
                                                                });
                                                            </script>
                                                            {/literal}
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <input type="email" placeholder="Email"
                                                                   name="email_patient_prendre_rdv_unique"
                                                                   id="email_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-4 controls">
                                                            <div class="input-group">
                                                                <input type="text" placeholder="Date de naissance"
                                                                       name="date_naissance_patient_prendre_rdv_unique"
                                                                       id="date_naissance_patient_prendre_rdv_unique"
                                                                       value="" class="required input-widget-date-left"
                                                                       required style="border-color: red;">
                                                                <span class="input-group-addon input-widget-date-right"
                                                                      id="datepicker-icon-trigger"
                                                                      data-datepicker="#date_naissance_patient_prendre_rdv_unique">
                                                                    <i class="fa fa-calendar"></i>
                                                                </span>
                                                                <div id="age_patient_prendre_rdv_unique" class="vd_blue formPatientAge"></div>
                                                            </div>
                                                            <div id="bookingBoxdate_naissance_patient_prendre_rdv_unique"
                                                                 style="position: absolute;z-index: 1;"></div>
                                                        </div>
                                                        {literal}
                                                            <script type="text/javascript">
                                                                $(document).ready(function() {
                                                                    $("#date_naissance_patient_prendre_rdv_unique")
                                                                        .datepicker({
                                                                            dateFormat: 'dd/mm/yy',
                                                                            changeMonth: true,
                                                                            changeYear: true,
                                                                            yearRange: "-100:+0"                                                                            
                                                                        }).on('change', function(ev) {
                                                                            const inputDate = $(ev.target).datepicker("getDate");
                                                                            if(inputDate){
                                                                                const dateDiff = new Date(inputDate - new Date());
                                                                                const age = Math.abs(dateDiff.getUTCFullYear() - 1970);
                                                                                $("#age_patient_prendre_rdv_unique").text( age + ' ans');
                                                                            }else{
                                                                                $("#age_patient_prendre_rdv_unique").text('');
                                                                            }
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
                                                                   placeholder="N° de sécurité sociale"
                                                                   name="num_secu_patient_prendre_rdv_unique"
                                                                   id="num_secu_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-4 controls">
                                                            <div class="vd_input-wrapper-compte"
                                                                 style="margin:0px;font-weight:400">
                                                                <select placeholder="Assurance maladie"
                                                                        id="assurance_patient_prendre_rdv_unique"
                                                                        name="assurance_patient_prendre_rdv_unique">
                                                                    <option value="">Veuillez choisir une assurance
                                                                    </option>
                                                                    {foreach from=$TabAssurance item=objAssurance}
                                                                        <option
                                                                                value="{$objAssurance.id_assurance_maladie}">
                                                                            {$objAssurance.libelle_assurance_maladie}
                                                                        </option>
                                                                    {/foreach}
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Médecin traitant"
                                                                   name="medecin_traitant_patient_prendre_rdv_unique"
                                                                   id="medecin_traitant_patient_prendre_rdv_unique"
                                                                   value="" class="input-widget" />
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Ville du médecin"
                                                                   name="ville_medecin_patient_prendre_rdv_unique"
                                                                   id="ville_medecin_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-6 controls">
                                                            <div class="input-group">
                                                                <select id="couleur_patient_prendre_rdv_unique">
                                                                    <option value="">Couleur du patient</option>
                                                                    <option value="008000"
                                                                            style="color:#FFFFFF; background-color: #008000">
                                                                        Vert</option>
                                                                    <option value="FF8D01"
                                                                            style="color:#FFFFFF; background-color: #FF8D01">
                                                                        Orange</option>
                                                                    <option value="FF0000"
                                                                            style="color:#FFFFFF; background-color: #FF0000">
                                                                        Rouge</option>
                                                                </select>
                                                                <span id="cadre_couleur_patient_prendre_rdv_unique"
                                                                      class="input-group-addon color-input"><i
                                                                            class="fa fa-square"></i>&nbsp;<i
                                                                            style="color: #000 !important;"
                                                                            class="fa fa-comment"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6 controls">
                                                            <input type="text" placeholder="Profession"
                                                                   name="profession_patient_prendre_rdv_unique"
                                                                   id="profession_patient_prendre_rdv_unique" value=""
                                                                   class="input-widget" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-12 controls">
                                                            <textarea placeholder="Commentaire"
                                                                      name="remarque_patient_prendre_rdv_unique"
                                                                      id="remarque_patient_prendre_rdv_unique"
                                                                      class="input-widget"></textarea>
                                                        </div>
                                                    </div>
                                                    {if !$bismoduleexterne}
                                                        <div class="form-group" id="formModalRdvRecurrent">
                                                            <div class="col-sm-12 controls">
                                                                <div class="label-wrapper-modal" style="float: left;">
                                                                    <label class="control-label">Définir un RDV récurrent
                                                                        :</label>
                                                                </div>
                                                                <div class="controls" style="margin-left:10px;float: left;">
                                                                    <select id="recurrent_prendre_rdv_unique">
                                                                        <option value="N" selected>Non</option>
                                                                        <option value="Y">Oui</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    {/if}
                                                    <div class="col-sm-12" align="center"
                                                         id="div_button_update_patient_unique" style="display:none;">
                                                        <div class="col-sm-12 controls" align="center">
                                                            <button type="button"
                                                                    onclick="modification_patient_modal_prendre_rendez_vous_unique();"
                                                                    name="updateButtonPatient_prendre_rdv_unique"
                                                                    id="updateButtonPatient_prendre_rdv_unique"
                                                                    class="btn vd_btn vd_bg-blue"><span
                                                                        class="menu-icon"></span>Modifier</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4" style="padding-right: 0px;padding-left: 0px;">
                                                <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                                    <div id="attente_historique_patient_prendre_rendez_vous_unique"
                                                         style="display: none;">
                                                        <div align='center'><br><br>
                                                            <h2>Veuillez patienter...<br><i
                                                                        class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                                            <br><br>
                                                        </div>
                                                    </div>
                                                    <div id='pas_historique_patient_prendre_rendez_vous_unique'
                                                         style="display: none;">
                                                        <div class="alert alert-info">
                                                            <span class="vd_alert-icon"><i
                                                                        class="fa fa-info-circle vd_blue"></i></span>
                                                            Aucun historique disponible
                                                        </div>
                                                    </div>
                                                    <div id='historique_patient_prendre_rendez_vous_unique'
                                                         style="display: none;">
                                                        <div id="menu_historique_patient_rendez_vous_unique"
                                                             class="col-sm-12"
                                                             style="padding-right: 0px;padding-left: 0px;">
                                                            <a href="javascript:void(0);"
                                                               data-filter=".patienttraite_rendez_vous">
                                                                <div align="center" class="col-sm-3"
                                                                     style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:#27a1c2;height:45px;">
                                                                    <b id="libelle_rdv_traite_rendez_vous_unique"
                                                                       title="Patient traité"
                                                                       style="vertical-align: -webkit-baseline-middle;">Tr.</b>
                                                                </div>
                                                            </a>
                                                            <a href="javascript:void(0);"
                                                               data-filter=".rdvplanifie_rendez_vous">
                                                                <div align="center" class="col-sm-3"
                                                                     style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:lime;height:45px;">
                                                                    <b id="libelle_rdv_planifie_rendez_vous_unique"
                                                                       title="Rendez-vous planifié"
                                                                       style="vertical-align: -webkit-baseline-middle;">Pl.</b>
                                                                </div>
                                                            </a>
                                                            <a href="javascript:void(0);"
                                                               data-filter=".absenceexcusee_rendez_vous">
                                                                <div align="center" class="col-sm-3"
                                                                     style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:orange;height:45px;">
                                                                    <b id="libelle_rdv_ab_excusee_rendez_vous_unique"
                                                                       title="Absence Excusée"
                                                                       style="vertical-align: -webkit-baseline-middle;">Abs.
                                                                        Ex.</b>
                                                                </div>
                                                            </a>
                                                            <a href="javascript:void(0);"
                                                               data-filter=".absencenonexcusee_rendez_vous">
                                                                <div align="center" class="col-sm-3"
                                                                     style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:red;height:45px;">
                                                                    <b id="libelle_rdv_ab_non_excusee_rendez_vous_unique"
                                                                       title="Absence Non Excusée" style="">Abs. Non
                                                                        Ex.</b>
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-sm-12"
                                                             id="boucle_historique_prendre_rendez_vous_unique"
                                                             style="padding-right: 0px; padding-left: 0px;max-height: 450px;overflow: auto;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" id="div_recurrence_perso_unique" style="display: none;">
                                            <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                    <h1>Récurrence personnalisée</h1>

                                                    <div id="div_repete_toutes_les_unique" class="col-sm-12 controls">
                                                        <label class="control-label" style="float: left;"><b>Répéter
                                                                tou(te)s les </b></label>
                                                        <div class="controls" style="margin-left:10px;float: left;">
                                                            <input type="number"
                                                                   name="recurrent_nb_repete_prendre_rdv_unique"
                                                                   id="recurrent_nb_repete_prendre_rdv_unique" min="1"
                                                                   value="1">
                                                        </div>
                                                        <div class="controls" style="margin-left:10px;float: left;">
                                                            <select id="recurrent_select_repete_prendre_rdv_unique">
                                                                <option value="jour">Jour</option>
                                                                <option value="semaine" selected>Semaine</option>
                                                                <option value="mois">Mois</option>
                                                                <option value="annee">Année</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div id="div_repete_le_unique" class="col-sm-12 controls">
                                                        <label class="control-label"><b>Répéter le</b></label>
                                                        <div>
                                                            <div class="vd_radio radio-success">
                                                                <input id="checkbox-Lundi_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="1">
                                                                <label for="checkbox-Lundi_unique"> Lundi </label>

                                                                <input id="checkbox-Mardi_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="2">
                                                                <label for="checkbox-Mardi_unique"> Mardi </label>

                                                                <input id="checkbox-Mercredi_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="3">
                                                                <label for="checkbox-Mercredi_unique"> Mercredi </label>

                                                                <input id="checkbox-Jeudi_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="4">
                                                                <label for="checkbox-Jeudi_unique"> Jeudi </label>

                                                                <input id="checkbox-Vendredi_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="5">
                                                                <label for="checkbox-Vendredi_unique"> Vendredi </label>

                                                                <input id="checkbox-Samedi_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="6">
                                                                <label for="checkbox-Samedi_unique"> Samedi </label>

                                                                <input id="checkbox-Dimanche_unique" type="radio"
                                                                       name="recurrent_repeter_le_prendre_rdv_unique"
                                                                       value="7">
                                                                <label for="checkbox-Dimanche_unique"> Dimanche </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="div_repete_se_termine_unique" class="col-sm-12 controls">
                                                        <label class="control-label"><b>Se termine</b></label>
                                                        <div>
                                                            <div class="vd_radio radio-success"
                                                                 style="margin-top: 5px;">
                                                                <input type="radio"
                                                                       name="recurrent_termine_prendre_rdv_unique"
                                                                       value="le"
                                                                       id="id_recurrent_termine_prendre_rdv_calendar_le_unique"
                                                                       style="float: left;">
                                                                <label
                                                                        for="id_recurrent_termine_prendre_rdv_calendar_le_unique"
                                                                        style="float: left;">Le</label>
                                                                <div class="col-sm-4 input-group">
                                                                    <input type="text" placeholder=""
                                                                           name="reccurent_date_fin_patient_prendre_rdv_unique"
                                                                           id="reccurent_date_fin_patient_prendre_rdv_unique"
                                                                           value="" class="input-widget-date-left">
                                                                    <span
                                                                            class="input-group-addon input-widget-date-right"
                                                                            id="datepicker-icon-trigger"
                                                                            data-datepicker="#reccurent_date_fin_patient_prendre_rdv_unique"><i
                                                                                class="fa fa-calendar"></i></span>
                                                                </div>
                                                                <div id="bookingBoxreccurent_date_fin_patient_prendre_rdv_unique"
                                                                     style="position: absolute;z-index: 1;"></div>
                                                                {literal}
                                                                    <script type="text/javascript">
                                                                        $(document).ready(function() {
                                                                            $("#reccurent_date_fin_patient_prendre_rdv_unique")
                                                                                .datepicker({
                                                                                    dateFormat: 'dd/mm/yy',
                                                                                    changeMonth: true,
                                                                                    changeYear: true,
                                                                                    beforeShow: function(
                                                                                        textbox, instance) {
                                                                                        $('#ui-datepicker-div')
                                                                                            .css({
                                                                                                position: 'initial',
                                                                                                top: -
                                                                                                    20,
                                                                                                left: 5
                                                                                            });
                                                                                        $('#bookingBoxreccurent_date_fin_patient_prendre_rdv_unique')
                                                                                            .append($(
                                                                                                '#ui-datepicker-div'
                                                                                            ));
                                                                                        $('#ui-datepicker-div')
                                                                                            .hide();
                                                                                    }
                                                                                });
                                                                            $('[data-datepicker]').click(function(
                                                                                e) {
                                                                                var data = $(this).data(
                                                                                    'datepicker');
                                                                                $(data).focus();
                                                                            });
                                                                        });
                                                                    </script>
                                                                {/literal}
                                                            </div>
                                                            <div class="vd_radio radio-success"
                                                                 style="margin-top: 5px;">
                                                                <input type="radio"
                                                                       name="recurrent_termine_prendre_rdv_unique"
                                                                       checked="checked" value="apres"
                                                                       id="id_recurrent_termine_prendre_rdv_calendar_apres_unique">
                                                                <label
                                                                        for="id_recurrent_termine_prendre_rdv_calendar_apres_unique"
                                                                        style="float: left;">Après</label>
                                                                <div class="controls"
                                                                     style="margin-left:10px;float: left;">
                                                                    <input type="number"
                                                                           name="recurrent_occurence_prendre_rdv_unique"
                                                                           id="recurrent_occurence_prendre_rdv_unique"
                                                                           min="2" value="2">
                                                                </div>
                                                                <div class="controls"
                                                                     style="margin-left:10px;float: left;"> occurence(s)
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12 controls" style="margin-top: 10px;">
                                                        <div class="label-wrapper-modal" style="float: left;">
                                                            <label class="control-label">Forcer les rdv :</label>
                                                        </div>
                                                        <div class="controls" style="margin-left:10px;float: left;">
                                                            <select id="recurrent_forcer_rdv_unique">
                                                                <option value="N" selected>Non</option>
                                                                <option value="Y">Oui</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div id="div_btn_generer_rdv_recurrent_unique"
                                                         class="col-sm-12 controls" style="text-align: center;">
                                                        <button id="btn_generer_rdv_recurrent_unique"
                                                                name="btn_generer_rdv_recurrent_unique" type="button"
                                                                class="btn vd_btn btn_widget_standard">Générer les rdv
                                                            récurrents <span class="menu-icon"><i
                                                                        class="fa fa-fw fa-refresh"></i></span></button>
                                                    </div>
                                                    <div id="div_liste_rdv_generer_unique" class="col-sm-12 controls"
                                                         style="margin-bottom: 25px;text-align: center;padding-top: 20px;">
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" align="center" id="div_button_suivant_unique">
                                            <a id="btn_prec1_unique" class="btn vd_btn prev" href="javascript:void(0);"
                                               onclick="retour_tabPrendreRendezVousUnique1();"
                                               style="background-color: white;margin: 0px 10px 0px 0px; border-radius: 20px; border-color: #5D9AD4; border-width: 3px; border-style: solid; color: #5D9AD4"><span
                                                        class="menu-icon"></span> Retour</a>
                                            <button id="btn_check_patient_prendre_rdv_unique"
                                                    name="btn_check_patient_prendre_rdv_unique" type="submit"
                                                    class="btn vd_btn btn_widget_standard" style="border-radius: 20px !important;">Enregistrer <span
                                                        class="menu-icon"></span></button>&nbsp;&nbsp;
                                            <button id="btn_valider_print_unique" name="btn_valider_print_unique"
                                                    type="submit" class="btn vd_btn btn_widget_standard" style="border-radius: 20px !important;">Enregistrer et Imprimer
                                                <span class="menu-icon"></span></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                {* Rdv dispo *}
                <div class="col-sm-5" id="divDroite" style='padding-right: 0px;padding-left: 0px;'>
                    <div id="divrdvdispoattente_prendre_rendez_vous_unique" style="padding:0;display:none;">
                        <div align='center'><br><br>
                            <h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2>
                            <br><br>
                        </div>
                    </div>
                    <div id="divrdvdispo_prendre_rendez_vous_unique" style="display:none;"></div>
                    <div id="divprochain_rdvdispo_prendre_rendez_vous_unique"
                         style="display:none; margin-top:-11%; margin-bottom:2%;"></div>
                    <div id="div_autre_praticien_rdvdispo_prendre_rendez_vous_unique" style="display:none;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal Prendre un rendez-vous Unique Nouveau Praticien-->
