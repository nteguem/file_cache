<!-- [DEBUT] Modal praticien annule le RDV -->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalPraticienAnnuleRDV" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPraticienAnnuleRDV" aria-hidden="false">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalPraticienAnnuleRDV"> Le praticien annule le RDV</h4>
            </div>
            <div class="modal-body" >
                <div id="attente_formulaire_praticien_annule_rdv" style="display: none;" ></div>
                <div id="div_formulaire_praticien_annule_rdv">
                    <div class="form-group">
                        <div class="col-sm-12 controls" style="padding:0px">
                            {if isset($sbActivAlertPaiementSMSComm) and $sbActivAlertPaiementSMSComm}
                                <label class="control-label" style="color :indianred"><b>Les envois de SMS sont devenus payants depuis le 1er Juillet </b></label><br/>
                            {/if}
                            <label class="control-label" style="font-size: 16px;"><b>Que souhaitez vous annuler ?</b></label>
                            <input type="hidden" value="" name="identifiant_rdv_annulation_rdv" id="identifiant_rdv_annulation_rdv" />
                            <div>
                                <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;">
                                    <input type="radio" name="quoi_praticien_annule_rdv" value="uniquement_rdv" checked="checked" id="quoi_praticien_annule_rdv_seul">
                                    <label for="quoi_praticien_annule_rdv_seul" style="float: left;">Uniquement le RDV sélectionné</label>
                                </div>
                                <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;" id="choix_tranche">
                                    <input type="radio" name="quoi_praticien_annule_rdv" value="tranche_rdv" id="quoi_praticien_annule_rdv_tranche" style="float: left;">
                                    <label for="quoi_praticien_annule_rdv_tranche" style="float: left;">Les RDV de la tranche horaire</label>
                                    <div class="col-sm-1 controls" style="text-align: center;">&nbsp;De&nbsp;</div>
                                    <div class="col-sm-3 controls">
                                        <div class="input-group">
                                            <div class="input-group bootstrap-timepicker">
                                                <input type="text" id="heure_debut_praticien_annule_rdv" name="heure_debut_praticien_annule_rdv" value="08:00" class="input-modal-date-left">
                                                <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $("#heure_debut_praticien_annule_rdv").clockpicker({
                                                placement: 'bottom',
                                                autoclose: true
                                            });
                                            $("#heure_debut_praticien_annule_rdv").mask("99:99");
                                        });
                                    </script>
                                    <div class="col-sm-1 controls" style="text-align: center;">&nbsp;A&nbsp;</div>
                                    <div class="col-sm-3 controls">
                                        <div class="input-group">
                                            <div class="input-group bootstrap-timepicker">
                                                <input type="text" id="heure_fin_praticien_annule_rdv" name="heure_fin_praticien_annule_rdv" value="12:00" class="input-modal-date-left">
                                                <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $("#heure_fin_praticien_annule_rdv").clockpicker({
                                                placement: 'bottom',
                                                autoclose: true
                                            });
                                            $("#heure_fin_praticien_annule_rdv").mask("99:99");
                                        });
                                    </script>
                                </div>
                                <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;" id="choix_journer_entiere">
                                    <input type="radio" name="quoi_praticien_annule_rdv" value="journee_rdv" id="quoi_praticien_annule_rdv_journee">
                                    <label for="quoi_praticien_annule_rdv_journee" style="float: left;">Les RDV de la journée entière</label>
                                </div>
                                <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;" id="choix_option_avance">
                                    <input type="radio" name="quoi_praticien_annule_rdv" value="option_avancee" id="quoi_praticien_annule_rdv_option_avancee">
                                    <label for="quoi_praticien_annule_rdv_option_avancee" style="float: left;">Option avancée</label>
                                </div>

                                <div id="div_option_avance_praticien_annule" style="display: none">
                                    <label class="control-label" style="font-size: 14px;"><b>Type de sélection :</b></label>
                                    <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;">
                                        <input type="radio" name="option_avancee_praticien_annule_rdv" value="liste_rdv" checked="checked" id="option_avancee_praticien_annule_liste_rdv">
                                        <label for="option_avancee_praticien_annule_liste_rdv" style="float: left;">Sélectionner des RDV de la journée</label>
                                    </div>
                                    <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;">
                                        <input type="radio" name="option_avancee_praticien_annule_rdv" value="liste_motif" id="option_avancee_praticien_annule_liste_motif">
                                        <label for="option_avancee_praticien_annule_liste_motif" style="float: left;">Sélectionner des motifs de la journée</label>
                                    </div>

                                    <div class="form-group" id="grp_div_liste_rdv_annulation">
                                        <div class="col-sm-12 controls" style="margin-top: 15px; margin-bottom: 15px;">
                                            <label class="control-label" style="font-size: 16px;">Liste des RDV de la journée</label>
                                            <div id="div_liste_rdv_annulation">

                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group" id="grp_div_liste_motif_annulation" style="display: none">
                                        <div class="col-sm-12 controls" style="margin-top: 15px; margin-bottom: 15px;">
                                            <label class="control-label" style="font-size: 16px;">Liste des motifs de la journée</label>
                                            <div id="div_liste_motif_annulation">

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12 controls" style="margin-top: 15px; margin-bottom: 15px;">
                            <label class="control-label" style="font-size: 16px;">Comment doit être prévenu le patient ?</label>
                            <div class="vd_checkbox checkbox-success">
                                <input type="checkbox" class="" name="id_check_mode_annulation[]" value="mail" checked="checked" id="id_check_mode_annulation_mail" title="" alt="">
                                <label title="" style="text-align: left;" for="id_check_mode_annulation_mail">Mail</label>
                                <input type="checkbox" class="" name="id_check_mode_annulation[]" value="sms_vocal" checked="checked" id="id_check_mode_annulation_sms_vocal" title="" alt="">
                                <label title="" style="text-align: left;" for="id_check_mode_annulation_sms_vocal">SMS</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label" style="font-size: 16px;">Texte à envoyer au(x) patient(s) :</label>
                        <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;">
                            <input type="radio" name="predefini_praticien_annule_rdv" value="texte_predefini" checked="checked" id="predefini_praticien_annule_rdv_texte_predefini">
                            <label for="predefini_praticien_annule_rdv_texte_predefini" style="float: left;">Texte prédéfini</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 controls">
                            <div class="controls">
                                <select id="liste_predefini_praticien_annule_rdv" name="liste_predefini_praticien_annule_rdv" onchange="update_texte_envoye_patient();"></select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="vd_radio radio-success col-sm-12" style="margin-top: 5px;">
                            <input type="radio" name="predefini_praticien_annule_rdv" value="texte_libre" id="predefini_praticien_annule_rdv_texte_libre">
                            <label for="predefini_praticien_annule_rdv_texte_libre" style="float: left;">Texte libre</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12 controls" style="margin-top: 15px; margin-bottom: 15px;">
                            <textarea placeholder="Texte envoyé au patient" name="texte_envoye_patient" id="texte_envoye_patient" rows="10"></textarea>
                            <p id="compteur_texte_envoye_patient">0 Caractère / 132</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 controls" style="margin-top: 15px; margin-bottom: 15px;">
                            <p style="font-size: 16px"><b>Variables disponibles :</b></p>
                            <p>[date] : Affichera la date du RDV</p>
                            <p>[heure] : Affichera l'heure du RDV</p>
                            <p>[praticien] : Affichera le praticien du RDV</p>
                            <p>[lieu] : Affichera le lieu du RDV</p>
                            <p>[tel_lieu] : Affichera le numéro de téléphone du lieu du RDV</p>
                            <p>[link] : Affichera le lien pour reprendre un nouveau RDV</p>
                            <p>[infosupp] : Champ "Infos supplémentaires", disponible sur Paramètre > Votre structure</p>
                            <p>[infosupp] : Champ "Infos supplémentaires", disponible sur Paramètre > Votre structure</p>

                        </div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function (e) {
                            var sms_checked = true;
                            var mail_checked = true;
                            $('#btnconfirmPraticienAnnuleRDV').addClass('disabled');
                            $('#texte_envoye_patient').prop('disabled', true);
                            $('#heure_debut_praticien_annule_rdv').prop('disabled', true);
                            $('#heure_fin_praticien_annule_rdv').prop('disabled', true);
                            $('#compteur_texte_envoye_patient').hide();

                            $("#id_check_mode_annulation_mail").change(function () {
                                if (this.checked) {
                                    mail_checked = true;
                                } else {
                                    mail_checked = false;
                                }

                                if (!mail_checked && !sms_checked) {
                                    $('#btnconfirmPraticienAnnuleRDV').addClass("disabled");
                                } else {
                                    $('#texte_envoye_patient').keyup();
                                }

                            });

                            $("#id_check_mode_annulation_sms_vocal").change(function () {
                                if (this.checked) {
                                    sms_checked = true;
                                    $('#compteur_texte_envoye_patient').show();
                                } else {
                                    sms_checked = false;
                                    $('#compteur_texte_envoye_patient').hide();
                                    $('#btnconfirmPraticienAnnuleRDV').removeClass("disabled");
                                }

                                if (!mail_checked && !sms_checked) {
                                    $('#btnconfirmPraticienAnnuleRDV').addClass("disabled");
                                } else {
                                    $('#texte_envoye_patient').keyup();
                                }
                            });

                            $('#texte_envoye_patient').keyup(function () {
                                var nombreCaractere = $(this).val().length;
                                var pluriel_caractere = '';

                                if (nombreCaractere > 1) {
                                    pluriel_caractere = 's';
                                }
                                var msg = ' ' + nombreCaractere + ' Caractère' + pluriel_caractere + ' / 132';
                                $('#compteur_texte_envoye_patient').text(msg);
                                if (nombreCaractere > 132) {
                                    $('#compteur_texte_envoye_patient').addClass("mauvais");
                                    if (sms_checked) {
                                        $('#btnconfirmPraticienAnnuleRDV').addClass('disabled');
                                    } else {
                                        $('#btnconfirmPraticienAnnuleRDV').removeClass("disabled");
                                    }
                                } else if (nombreCaractere === 0) {
                                    $('#btnconfirmPraticienAnnuleRDV').addClass('disabled');
                                } else {
                                    $('#btnconfirmPraticienAnnuleRDV').removeClass("disabled");
                                    $('#compteur_texte_envoye_patient').removeClass("mauvais");
                                }
                            });

                            $('input[type=radio][name=predefini_praticien_annule_rdv]').change(function () {
                                if (this.value === 'texte_predefini') {
                                    $('#liste_predefini_praticien_annule_rdv').prop('disabled', false);
                                    $('#texte_envoye_patient').prop('disabled', true);
                                    $('#compteur_texte_envoye_patient').hide();
                                } else if (this.value === 'texte_libre') {
                                    $('#liste_predefini_praticien_annule_rdv').prop('disabled', true);
                                    $('#texte_envoye_patient').prop('disabled', false);
                                    $('#compteur_texte_envoye_patient').show();
                                }
                            });

                            $('input[type=radio][name=quoi_praticien_annule_rdv]').change(function () {
                                if (this.value === 'uniquement_rdv') {
                                    $('#heure_debut_praticien_annule_rdv').prop('disabled', true);
                                    $('#heure_fin_praticien_annule_rdv').prop('disabled', true);
                                    $('#li_option_avance_praticien_annule').hide();
                                    $('#div_option_avance_praticien_annule').css('display', 'none');
                                } else if (this.value === 'tranche_rdv') {
                                    $('#heure_debut_praticien_annule_rdv').prop('disabled', false);
                                    $('#heure_fin_praticien_annule_rdv').prop('disabled', false);
                                    $('#div_option_avance_praticien_annule').css('display', 'none');
                                    //$('#li_option_avance_praticien_annule').show();
                                } else if (this.value === 'journee_rdv') {
                                    $('#heure_debut_praticien_annule_rdv').prop('disabled', true);
                                    $('#heure_fin_praticien_annule_rdv').prop('disabled', true);
                                    $('#div_option_avance_praticien_annule').css('display', 'none');
                                    //$('#li_option_avance_praticien_annule').show();
                                } else if (this.value === 'option_avancee') {
                                    $('#heure_debut_praticien_annule_rdv').prop('disabled', true);
                                    $('#heure_fin_praticien_annule_rdv').prop('disabled', true);
                                    $('#div_option_avance_praticien_annule').css('display', 'block');
                                }
                            });

                        });
                    </script>
                    <div style="margin-top:10px;" align="center">
                        <button type="button" name="btnconfirmPraticienAnnuleRDV" id="btnconfirmPraticienAnnuleRDV" class="btn vd_btn vd_bg-blue" onclick="annulation_rdv_praticien();">Confirmer</button>
                        &nbsp;&nbsp;
                        <button type="button" name="btnannulePraticienAnnuleRDV" id="btnannulePraticienAnnuleRDV" onclick="$('#modalPraticienAnnuleRDV').modal('hide');" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Annuler</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal praticien annule le RDV -->
