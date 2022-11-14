
<!-- [DEBUT] Modal Prendre un rendez-vous  -->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalPrendreRendezVous" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVous" aria-hidden="false">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalPrendreRendezVous"> Prendre un rendez-vous</h4>
            </div>

            <div class="modal-body" >


                <div id="wizard-2" class="form-wizard">
                    <div class="progress progress active">
                        <div class="progress-bar progress-bar-info" > </div>
                    </div>
                    <ul>
                        <li><a href="#tabPrendreRendezVous1" data-toggle="tab">
                                <div id="tabb1" class="menu-icon">&nbsp;</div>
                                Informations patient  </a></li>
                        <li><a href="#tabPrendreRendezVous2" data-toggle="tab">
                                <div id="tabb2" class="menu-icon">&nbsp;</div>
                                RDV disponibles </a></li>
                    </ul>
                    <div class="tab-content no-bd" style="padding-top: 0px;">
                        <div class="tab-pane" id="tabPrendreRendezVous1">

                            <div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                <div class="col-sm-8" style="padding-left: 0px;">
                                    <form class="form-horizontal" action="#" role="form" id="modal_etape1_prendre_rdv" name="modal_etape1_prendre_rdv" autocomplete="new-password"  >

                                        <div class="col-sm-12 controls" id="divtempcheckpatient" style="display:none;"></div>
                                        <div class="col-sm-12 controls" id="divenregpatient">
                                            <div class="form-group" {if $rdv_prive_actif!='Y'}style="display:none;"{/if}>
                                                <div class="col-sm-6 controls">
                                                    <div class="label-wrapper-modal">
                                                        <label class="control-label">RDV privé :</label>
                                                    </div>
                                                    <div class="vd_radio radio-success">
                                                        <input type="radio" name="prive_prendre_rdv" value="Y" id="id_prive_prendre_rdv_oui">
                                                        <label for="id_prive_prendre_rdv_oui">Oui</label>
                                                        <input type="radio" name="prive_prendre_rdv" checked="checked" value="N" id="id_prive_prendre_rdv_non">
                                                        <label for="id_prive_prendre_rdv_non">Non</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-bottom: 5px;">
                                                <div class="col-sm-12 controls" style="display:none;" id="div_reinit">
                                                    <a href="#" onclick="debloque_modification_patient_modal_prendre_rendez_vous();"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinitialise_modal_prendre_rendez_vous();" >Réinitialiser</a>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-sm-3 controls">
                                                    <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                        <select id="civilite_patient_prendre_rdv" name="civilite_patient_prendre_rdv" required class="required" style="border-color: red;">
                                                            <option value="" disabled selected hidden>Civilité</option>
                                                            {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                                <option value="{$tabLC.id_civilite}">{$tabLC.abreviation_civilite}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-5 controls">
                                                    <input type="text" placeholder="Nom" name="nom_patient_prendre_rdv" id="nom_patient_prendre_rdv" value="" required style="border-color: red;" class="required input-majuscule input-widget" autocomplete="new-password" />
                                                    <input type="hidden" name="id_patient_prendre_rdv" id="id_patient_prendre_rdv">
                                                    {literal}
                                                        <!-- Script pour l'auto-completion -->
                                                        <script type="text/javascript" >
                                                            $("#nom_patient_prendre_rdv").autocomplete({
                                                                source : 'ajax/recherche_fiche_patient_auto_complete.php',
                                                                focus: function (event, ui) {
                                                                    event.preventDefault();
                                                                },
                                                                select: function (event, ui) {
                                                                    event.preventDefault();
                                                                    getInfoPatientModalPrendreRDV(ui.item.value);
                                                                },
                                                                appendTo: "#modalPrendreRendezVous"
                                                            });
                                                        </script>
                                                    {/literal}
                                                </div>
                                                <div class="col-sm-4 controls">
                                                    <input type="text" placeholder="Prénom" name="prenom_patient_prendre_rdv" id="prenom_patient_prendre_rdv" value="" required style="border-color: red;" class="required input-first-letter input-widget" autocomplete="new-password" />
                                                </div>
                                            </div>
                                            <div class="form-group" id='divnomjeunefille_patient_prendre_rdv' style='display:none;'>
                                                <div class="col-sm-12 controls">
                                                    <input type="text" placeholder="Nom de naissance" name="nom_jeune_fille_patient_prendre_rdv" id="nom_jeune_fille_patient_prendre_rdv" value="" class="input-majuscule input-widget" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                    <input type="text" placeholder="Adresse" name="adresse_patient_prendre_rdv" id="adresse_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Code postal" name="code_postal_patient_prendre_rdv" id="code_postal_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Ville" name="ville_patient_prendre_rdv" id="ville_patient_prendre_rdv" value="" class="input-majuscule input-widget" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Téléphone mobile" name="tel_mobile_patient_prendre_rdv" id="tel_mobile_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Téléphone fixe" name="tel_fixe_patient_prendre_rdv" id="tel_fixe_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                    <input type="email" placeholder="Email" name="email_patient_prendre_rdv" id="email_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-4 controls">
                                                    <div class="input-group">
                                                        <input type="text" placeholder="Date de naissance" name="date_naissance_patient_prendre_rdv" id="date_naissance_patient_prendre_rdv" value="" class="required input-widget-date-left"  required style="border-color: red;">
                                                        <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#id_datenaissance">
                                                <i class="fa fa-calendar"></i>
                                              </span>
                                                    </div>
                                                    <div id="bookingBoxdate_naissance_patient_prendre_rdv" style="position: absolute;z-index: 1;"></div>
                                                </div>
                                                {literal}
                                                    <script type="text/javascript">
                                                        $(document).ready(function() {
                                                            $( "#date_naissance_patient_prendre_rdv" ).datepicker({
                                                                dateFormat: 'dd/mm/yy',
                                                                changeMonth: true,
                                                                changeYear: true,
                                                                yearRange: "-100:+0",
                                                            });
                                                            $( '[data-datepicker]' ).click(function(e){
                                                                var data=$(this).data('datepicker');
                                                                $(data).focus();
                                                            });
                                                        });
                                                    </script>
                                                {/literal}
                                                <div class="col-sm-4 controls">
                                                    <input type="text" onkeyup="checkInsee(this);" placeholder="N° de sécurité sociale" name="num_secu_patient_prendre_rdv" id="num_secu_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                                <div class="col-sm-4 controls">
                                                    <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                                                        <select placeholder="Assurance maladie" id="assurance_patient_prendre_rdv" name="assurance_patient_prendre_rdv">
                                                            <option value="">Veuillez choisir une assurance</option>
                                                            {foreach from=$TabAssurance item=objAssurance}
                                                                <option value="{$objAssurance.id_assurance_maladie}">{$objAssurance.libelle_assurance_maladie}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Médecin traitant" name="medecin_traitant_patient_prendre_rdv" id="medecin_traitant_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Ville du médecin" name="ville_medecin_patient_prendre_rdv" id="ville_medecin_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-6 controls">
                                                    <div class="input-group">
                                                        <select id="couleur_patient_prendre_rdv">
                                                            <option value="">Couleur du patient</option>
                                                            <option value="008000" style="color:#FFFFFF; background-color: #008000">Vert</option>
                                                            <option value="FF8D01" style="color:#FFFFFF; background-color: #FF8D01">Orange</option>
                                                            <option value="FF0000" style="color:#FFFFFF; background-color: #FF0000">Rouge</option>
                                                        </select>
                                                        <span id="cadre_couleur_patient_prendre_rdv" class="input-group-addon color-input"><i class="fa fa-square"></i></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 controls">
                                                    <input type="text" placeholder="Profession" name="profession_patient_prendre_rdv" id="profession_patient_prendre_rdv" value="" class="input-widget" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12 controls">
                                                    <textarea placeholder="Commentaire" name="remarque_patient_prendre_rdv" id="remarque_patient_prendre_rdv" class="input-widget" ></textarea>
                                                </div>
                                            </div>


                                            <div class="col-sm-12" align="center" itesd="div_button_update_patient" style="display:none;">
                                                <div class="col-sm-12 controls" align="center">
                                                    <button type="button" onclick="modification_patient_modal_prendre_rendez_vous();" name="updateButtonPatient_prendre_rdv" id="updateButtonPatient_prendre_rdv" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier</button>
                                                </div>
                                            </div>

                                            <div class="col-sm-12" align="center" id="div_button_suivant">
                                                <button id="btn_check_patient_prendre_rdv" name="btn_check_patient_prendre_rdv" type="submit" class="btn vd_btn btn_widget_standard">Suivant <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="col-sm-4" style="padding-right: 0px;padding-left: 0px;">
                                    <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                        <div id="attente_historique_patient_prendre_rendez_vous" style="display: none;">
                                            <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                        </div>
                                        <div id='pas_historique_patient_prendre_rendez_vous' style="display: none;">
                                            <div class="alert alert-info">
                                                <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                                Aucun historique disponible
                                            </div>
                                        </div>
                                        <div id='historique_patient_prendre_rendez_vous' style="display: none;">
                                            <div id="menu_historique_patient_rendez_vous" class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                                <a href="javascript:void(0);" data-filter=".patienttraite_rendez_vous">
                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:lime;height:45px;">
                                                        <b id="libelle_rdv_traite_rendez_vous" title="Patient traité" style="vertical-align: -webkit-baseline-middle;">Tr.</b>
                                                    </div>
                                                </a>
                                                <a href="javascript:void(0);" data-filter=".rdvplanifie_rendez_vous">
                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:#27a1c2;height:45px;">
                                                        <b id="libelle_rdv_planifie_rendez_vous" title="Rendez-vous planifié" style="vertical-align: -webkit-baseline-middle;">Pl.</b>
                                                    </div>
                                                </a>
                                                <a href="javascript:void(0);" data-filter=".absenceexcusee_rendez_vous">
                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:orange;height:45px;">
                                                        <b id="libelle_rdv_ab_excusee_rendez_vous" title="Absence Excusée" style="vertical-align: -webkit-baseline-middle;">Abs. Ex.</b>
                                                    </div>
                                                </a>
                                                <a href="javascript:void(0);" data-filter=".absencenonexcusee_rendez_vous">
                                                    <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:red;height:45px;">
                                                        <b id="libelle_rdv_ab_non_excusee_rendez_vous" title="Absence Non Excusée" style="">Abs. Non Ex.</b>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-sm-12" id="boucle_historique_prendre_rendez_vous" style="padding-right: 0px; padding-left: 0px;max-height: 450px;overflow: auto;"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane" id="tabPrendreRendezVous2">

                            <div id="attente_chargement_etape2_prendre_rendez_vous"></div>
                            <form class="form-horizontal" action="" role="form" id="form_etape2_prendre_rendez_vous" name="form_etape2_prendre_rendez_vous">
                                <input type="hidden" value="planning" name='validation' />
                                <input type="hidden" value="3" id='all' />

                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-8">

                                            <div id="divcatprofession_prendre_rendez_vous" class="col-sm-12 controls" style='display:none;'>
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quel est le professionnel de santé ?</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-modal">
                                                    <select name="selectcatprofession_prendre_rendez_vous" id="selectcatprofession_prendre_rendez_vous"></select>
                                                </div>
                                            </div>

                                            <div id="divprofession_prendre_rendez_vous" class="col-sm-12 controls" style='display:none;'>
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quelle est la spécialité ?</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-modal">
                                                    <select name="selectprofession_prendre_rendez_vous" id="selectprofession_prendre_rendez_vous"></select>
                                                </div>
                                            </div>

                                            <div id="divmotif_prendre_rendez_vous" class="col-sm-12 controls" style="display:none;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quel est le motif de la consultation ?</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-modal">
                                                    <select name="consultation_prendre_rendez_vous" id="consultation_prendre_rendez_vous"></select>
                                                </div>
                                            </div>

                                            <div id="divlieu_prendre_rendez_vous" class="col-sm-12 controls" style="display:none;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Quel est le lieu du rendez-vous ?</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-modal">
                                                    <select name="lieu_prendre_rendez_vous" id="lieu_prendre_rendez_vous"></select>
                                                </div>
                                            </div>

                                            <div id="divpraticien_prendre_rendez_vous" class="col-sm-12 controls" style="display:none;">
                                                <div class="label-wrapper">
                                                    <label class="control-label">
                                                        <b>Avec quel praticien ?</b>
                                                    </label>
                                                </div>
                                                <div class="vd_input-wrapper-modal">
                                                    <select name="praticien_prendre_rendez_vous" id="praticien_prendre_rendez_vous" ></select>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-sm-2"></div>
                                    </div>
                                </div>
                                <div id="divoption_prendre_rendez_vous" class="col-sm-12 controls" style="margin:0px; padding:0px;display:none;">
                                    <div class="form-group">
                                        <div class="col-sm-4 controls" style="margin:0px;">
                                            <div class="label-wrapper">
                                                <label class="control-label">
                                                    <b>Choisissez une date de début</b>
                                                </label>
                                            </div>
                                            <div class="input-group">
                                                <input type="text" placeholder="Choisissez une date de début" value="" name="datepicker-interpro" id="datepicker-interpro" class="input-widget-date-left">
                                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#datepicker-interpro">
                                        <i class="fa fa-calendar"></i>
                                      </span>
                                            </div>
                                            <div id="bookingBoxdatepicker-interpro" style="position: absolute;z-index: 1;"></div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $("#datepicker-interpro").datepicker({
                                                        dateFormat: 'dd/mm/yy',
                                                        changeMonth: true,
                                                        changeYear: true,
                                                        beforeShow:function(textbox, instance){
                                                            $('#ui-datepicker-div').css({
                                                                position: 'initial',
                                                                top:-20,
                                                                left:5
                                                            });
                                                            $('#bookingBoxdatepicker-interpro').append($('#ui-datepicker-div'));
                                                            $('#ui-datepicker-div').hide();
                                                        }
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
                                                <select name="jour_prendre_rendez_vous" id="jour_prendre_rendez_vous">
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
                                                <select name="horaire_prendre_rendez_vous" id="horaire_prendre_rendez_vous">
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
                                </div>
                                <div class="col-sm-12" align="center">
                                    <a  id="btn_prec1" class="btn vd_btn prev" href="javascript:void(0);" onclick="$('#horaire_prendre_rendez_vous').val('');$('#jour_prendre_rendez_vous').val('');document.getElementById('datepicker-interpro').value='';retour_tabPrendreRendezVous1();" style="background-color: #8E8E8E;margin: 0px 10px 0px 0px;"><span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span> Retour</a>
                                    <button id="btn_recherche_rdv_prendre_rendez_vous" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="recherche_rdv_prendre_rendez_vous();">Rechercher</button>
                                </div>

                                <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                                    <div id="divrdvdispoattente_prendre_rendez_vous" style="padding:0;display:none;">
                                        <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                                    </div>
                                    <div id="divrdvdispo_prendre_rendez_vous" style="display:none;"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal Prendre rendez-vous -->
