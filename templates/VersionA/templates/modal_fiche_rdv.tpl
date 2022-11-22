{literal}
 <script type="text/javascript">


function ajout_all_rdv() {

    let itype =   $("#motif_fiche_rendez_vous option:selected").val();
    $('#motif_fiche_rendez_vous').empty();
    $('#motif_fiche_rendez_vous').append('<option value="">Choisir un motif de RDV</option>');

    $.ajax({
    cache: false,
    url: 'ajax/get_motif_praticien.php',
    data: 'iddocteur=' + $('#identifiant_praticien_fiche_rendez_vous').val(),
    dataType: 'json',
    success: function (json) {


        $.each(json, function (index, value) {
            $('#motif_fiche_rendez_vous').append('<option value="' + value.id_type_rdv + '">' + value.libelle_type_rdv + '</option>');
        });
        $('#motif_fiche_rendez_vous option[value="' + itype + '"]').prop('selected', true);
    }

    });



}
</script>

{/literal}
<!-- [DEBUT] Modal Fiche rendez-vous  -->
<div style="overflow-x: hidden;overflow-y: auto;z-index: 2100;" class="modal fade in" id="modalFicheRendezVous" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVous" aria-hidden="false" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" id="fiche_rdv" style="width: 793px;" data-backdrop="static" data-keyboard="false">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title title_fiche_rdv" id="LabelmodalPrendreRendezVous">Fiche rendez-vous</h4>
            </div>
            <div class="modal-body" style="overflow-y: auto;">
                {* <input type="hidden" value="" id='iduserP' name='iduserP' /> *}
                <div class="tabs">
                    <ul class="nav nav-tabs widget vd_bg-color">
                        <li class="active"> <a href="#info-rdv" data-toggle="tab" id="info_rdv_modal_link"> <span class="menu-icon"><i class="fa fa-user"></i></span>Rendez-vous<span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                        {if isset($bactivvisulog) and $bactivvisulog}
                            <li> <a href="#histo-rdv" data-toggle="tab" onclick="getHistoRdv($('#id_fiche_rendez_vous').val());"> <span class="menu-icon"><i class="fa fa-history"></i></span>Historique de gestion<span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                        {/if}
                        {if isset($buserdebug) and $buserdebug and !$bIsIntepro}
                            <li> <a href="#debug-rdv" data-toggle="tab" onclick="getDebugRdv($('#id_fiche_rendez_vous').val());"> <span class="menu-icon"><i class="fa fa-user"></i></span>Debug<span class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                        {/if}
                    </ul>

                    <div class="tab-content mgbt-xs-20">
                        <div class="tab-pane active col-sm-12" id="info-rdv">
                            <div id="message_retour_info_fiche_rendez_vous" style="margin-top:15px; display: none;"></div>

                            <div id="attente_info_rendez_vous" style="display: none;">
                                <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                            </div>

                            <div id="div_info_fiche_rendez_vous" >
                                <div class="col-sm-12" style="padding-top:10px;">

                                    <div id="div_teleconsult_fiche_rendez_vous" class="alert alert-info" style="display:none;">
                                        <span class="vd_alert-icon"><i class="fa fa-video-camera vd_blue"></i></span>
                                        Information : Ce rendez-vous est une téléconsultation
                                    </div>
                                    <div id="div_en_attente_fiche_rendez_vous" class="alert alert-warning" align="center" style="display:none;"></div>

                                    <form action="" class="form-horizontal" role="form" id="form_fiche_rendez_vous" name="form_fiche_rendez_vous" >
                                        <input type="hidden" id="id_fiche_rendez_vous" name="id_fiche_rendez_vous" value="">
                                        <input type="hidden" id="id_rdv" name="id_rdv" value="">
                                        <input type="hidden" id="identifiant_rdv_fiche_rendez_vous" name="identifiant_rdv_fiche_rendez_vous" value="">
                                        <input type="hidden" id="id_patient_fiche_rendez_vous" name="id_patient_fiche_rendez_vous" value="">
                                        <input type="hidden" id="id_praticien_fiche_rendez_vous" name="id_praticien_fiche_rendez_vous" value="">
                                        <input type="hidden" id="identifiant_praticien_fiche_rendez_vous" name="identifiant_praticien_fiche_rendez_vous" value="">
                                        <input type="hidden" id="id_lieu_fiche_rendez_vous" name="id_lieu_fiche_rendez_vous" value="">
                                        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                                        <?php $selectMin_01 = filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js') ?>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.<?php echo $selectMin_01 ?>.js"></script>


                                        <div class="form-group">
                                            <div class="col-sm-12 controls">
                                                <h3 style="font-weight:bold;margin-top:5px" id="nom_docteur_fiche_rendez_vous" ></h3>
                                                <h4 class="text-info" id="nom_lieux_fiche_rendez_vous" ></h4>
                                                <hr style="margin:0px">
                                                <p id="provenance_fiche_rendez_vous" ></p>

                                            </div>                                            
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 controls">
                                                <label class="control-label">Statut du RDV</label>
                                                <div class="controls" id="select2StatutRdv">
                                                    <select id="status_fiche_rendez_vous" name="status_fiche_rendez_vous" {if $iAccess != '10'}disabled{/if} style="width:100%!important;"></select>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 controls">
                                                <label class="control-label">Motif</label>
                                                <div class="controls" id="select2Motifs">
                                                    <select id="motif_fiche_rendez_vous" name="motif_fiche_rendez_vous" onchange="select_motif_temps(this.value)"  {if $iAccess != '10'}disabled{/if} style="width:100%!important;"></select>
                                                </div>
                                            </div>
                                        </div>

                                        {literal}
                                            <script type="text/javascript">
                                                $(document).ready(function() {
                                                    $('#status_fiche_rendez_vous').select2({
                                                        dropdownParent: $('#select2StatutRdv')
                                                    });
                                                });

                                                $(document).ready(function() {
                                                    $('#motif_fiche_rendez_vous').select2({
                                                        dropdownParent: $('#select2Motifs')
                                                    });
                                                });

                                            </script>
                                        {/literal}

                                        <div class="form-group">
                                            <div class="col-sm-6 controls">
                                            </div>
                                            <div class="col-sm-6 controls">
                                                {if isset($bblocageall) and !$bblocageall}
                                                    {if !$bblocagetyperdv}
                                                        <button type="button" name="btn_plus_rdv_modal_calendar" id="btn_plus_rdv_modal_calendar" class="btn vd_btn vd_bg-green" onclick="ajout_all_rdv();"><span class="menu-icon"></span>Plus de motif de RDV</button>&nbsp;&nbsp;
                                                    {/if}
                                                {/if}
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3">
                                                <label class="control-label">Date</label>
                                                <div class="controls">
                                                    <input type="text" id="daterdv_fiche_rendez_vous" name="daterdv_fiche_rendez_vous" value="" {if !$bmodifdate}disabled{/if} >
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="control-label">Heure patient</label>
                                                <div class="input-group bootstrap-timepicker" id="groupe_timerdvaff_fiche_rendez_vous">
                                                    <input class="input-modal-date-left" type="text" id="timerdvaff_fiche_rendez_vous" name="timerdvaff_fiche_rendez_vous" value="" {if !$bActiModif || $iAccess != '10'}disabled{/if} >
                                                    <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#groupe_timerdvaff_fiche_rendez_vous").clockpicker({
                                                                    placement: 'bottom',
                                                                    autoclose: true
                                                                });
                                                                $("#groupe_timerdvaff_fiche_rendez_vous").mask("99:99");
                                                            });

                                                        </script>
                                                    {/literal}
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="control-label">Heure réelle</label>
                                                <div class="input-group bootstrap-timepicker" id="groupe_timerdvreel_fiche_rendez_vous">
                                                    <input class="input-modal-date-left" type="text" id="timerdvreel_fiche_rendez_vous" name="timerdvreel_fiche_rendez_vous" value="" {if !$bActiModif || $iAccess != '10'}disabled{/if} >
                                                    <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#groupe_timerdvreel_fiche_rendez_vous").clockpicker({
                                                                    placement: 'bottom',
                                                                    autoclose: true
                                                                });
                                                                $("#groupe_timerdvreel_fiche_rendez_vous").mask("99:99");
                                                            });

                                                        </script>
                                                    {/literal}
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="control-label">Durée&nbsp; (en min.)</label>
                                                <div class="controls">
                                                    <input name="tpsconsultation_fiche_rendez_vous" id="tpsconsultation_fiche_rendez_vous" type="number" value="" min="0" max="720"  {if $iAccess != '10'}disabled{/if}>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="form-group">
                                            <div class="col-sm-12 controls">
                                                <span style='font-size: 24px;' id="span_nom_patient_fiche_rendez_vous"></span>
                                                {if $iAccess == '10'}
                                                    &nbsp;&nbsp;<a href="#" onclick="$('#provenance_open').val('modal_fiche_rendez_vous');$('#modalFichePatient').modal('show');getInfoPatient($('#id_patient_fiche_rendez_vous').val());$('#modalFicheRendezVous').modal('hide');"><i class="fa fa-pencil"></i> Voir la fiche patient </a>
                                                {/if}
                                            </div>
                                            <div class="col-sm-12 controls">
                                                <span style='font-size: 14px;' id="span_id_module_externe_fiche_rendez_vous"></span>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <label class="control-label">Téléphone portable</label>
                                                <div class="controls">
                                                    <input type="hidden" name="telport_fiche_rendez_vous_indicatif" id="telport_fiche_rendez_vous_indicatif" value="{$num_indicatif_structure}">
                                                    <input type="text" id="telport_fiche_rendez_vous" name="telport_fiche_rendez_vous" placeholder="Téléphone portable" disabled="disabled" value="">
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#telport_fiche_rendez_vous").intlTelInput({
                                                                    preferredCountries:["fr", "be", "ch"],
                                                                    initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                    utilsScript: "js/utils.js"
                                                                });

                                                                if($("#telport_fiche_rendez_vous_indicatif").val() === "41"){
                                                                    $("#telport_fiche_rendez_vous").inputmask("999 999 99 99");
                                                                }else if($("#telport_fiche_rendez_vous_indicatif").val() === "33"){
                                                                    $("#telport_fiche_rendez_vous").inputmask("99 99 99 99 99");
                                                                }

                                                                $("#telport_fiche_rendez_vous").on("keyup change", function() {
                                                                    var countryData = $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                                                    $("#telport_fiche_rendez_vous_indicatif").val(countryData.dialCode);
                                                                });

                                                                $("#telport_fiche_rendez_vous").on("countrychange", function(e, countryData) {
                                                                    var idpays = countryData.iso2;
                                                                    if(idpays === "fr"){
                                                                        $("#telport_fiche_rendez_vous").inputmask("99 99 99 99 99");
                                                                    }else if(idpays === "ch"){
                                                                        $("#telport_fiche_rendez_vous").inputmask("999 999 99 99");
                                                                    }
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="control-label">Téléphone fixe</label>
                                                <div class="controls">
                                                    <input type="hidden" name="telfixe_fiche_rendez_vous_indicatif" id="telfixe_fiche_rendez_vous_indicatif" value="{$num_indicatif_structure}">
                                                    <input type="text" id="telfixe_fiche_rendez_vous" name="telfixe_fiche_rendez_vous" placeholder="Téléphone fixe" disabled="disabled" value="">
                                                    {literal}
                                                        <script type="text/javascript">
                                                            $(document).ready(function () {
                                                                $("#telfixe_fiche_rendez_vous").intlTelInput({
                                                                    preferredCountries:["fr", "be", "ch"],
                                                                    initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                                    utilsScript: "js/utils.js"
                                                                });

                                                                if($("#telfixe_fiche_rendez_vous_indicatif").val() === "41"){
                                                                    $("#telfixe_fiche_rendez_vous").inputmask("999 999 99 99");
                                                                }else if($("#telfixe_fiche_rendez_vous_indicatif").val() === "33"){
                                                                    $("#telfixe_fiche_rendez_vous").inputmask("99 99 99 99 99");
                                                                }

                                                                $("#telfixe_fiche_rendez_vous").on("keyup change", function() {
                                                                    var countryData = $("#telfixe_fiche_rendez_vous").intlTelInput("getSelectedCountryData");
                                                                    $("#telfixe_fiche_rendez_vous_indicatif").val(countryData.dialCode);
                                                                });

                                                                $("#telfixe_fiche_rendez_vous").on("countrychange", function(e, countryData) {
                                                                    var idpays = countryData.iso2;
                                                                    if(idpays === "fr"){
                                                                        $("#telfixe_fiche_rendez_vous").inputmask("99 99 99 99 99");
                                                                    }else if(idpays === "ch"){
                                                                        $("#telfixe_fiche_rendez_vous").inputmask("999 999 99 99");
                                                                    }
                                                                });
                                                            });
                                                        </script>
                                                    {/literal}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <label class="control-label">Email</label>
                                                <div class="controls">
                                                    <input type="email" id="email_fiche_rendez_vous" name="email_fiche_rendez_vous" placeholder="Email" disabled="disabled" value="" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="control-label">Date de naissance</label>
                                                <div class="controls" style="display: flex; align-items: center;">
                                                    <input type="text" id="datenaissance_rendez_vous" name="datenaissance_rendez_vous" disabled="disabled" placeholder="Date de naissance" value="" class="required" required />
                                                    <div id="age_rendez_vous" class="vd_blue" style="text-align:center; padding-left: 1%; white-space: nowrap;"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="control-label">Médecin traitant</label>
                                                <div class="controls">
                                                    <input type="text" id="medecintrait_rendez_vous" name="medecintrait_rendez_vous" placeholder="Médecin traitant" disabled="disabled"  value="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <label class="control-label">Commentaire</label>
                                                <div class="controls">
                                                    <textarea id="remarque_rendez_vous" name="remarque_rendez_vous" placeholder="Commentaire" {if $iAccess != '10'}disabled{/if}></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        {if $bActifAnesthesiste}
                                            <div class="form-group" id="div_info_supp_rendez_vous" style="display: none">
                                                <div class="col-sm-12">
                                                    <label class="control-label">Informations supplémentaires</label>
                                                    <div class="controls">
                                                        <textarea id="info_supp_rendez_vous" name="info_supp_rendez_vous" placeholder="Informations supplémentaires" readonly {if $iAccess != '10'}disabled{/if}></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}

                                        <div class="form-group"  id="div_bouton_rendez_vous">
                                            {if $iAccess == '10' || $sGroupe == 'secrelimite'}

                                                <div class="col-sm-4 controls" align="left">

                                                   {if $bboutonhistorique}
                                                    <button type="button" id="btn_liste_rdv"  name="btn_liste_rdv" class="btn vd_btn vd_bg-grey" onclick="{literal}$('#modalFicheRendezVous').modal('hide'); $('#modalFichePatient').modal('show');getInfoPatient($('#id_patient_fiche_rendez_vous').val());$('#id_fiche_patient').val($('#id_patient_fiche_rendez_vous').val());$('#info_histo_link').click();{/literal}"><span class="menu-icon"></span>Historique des rdv</button>
                                                   {/if}

                                                </div>



                                                {if $iAccess == '10' and ! $bIsIntepro}
                                                    <div class="col-sm-4 controls" align="center">
                                                        <button type="submit" id="btn_modifier_fiche_rendez_vous" name="btn_modifier_fiche_rendez_vous" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier le Rendez vous</button>
                                                    </div>
                                                {/if}
                                                <div class="col-sm-4 controls" align="right">
                                                    <button type="button" id="btn_deplacer_fiche_rendez_vous"  name="btn_deplacer_fiche_rendez_vous" class="btn vd_btn vd_bg-yellow" onclick="deplacer_fiche_rendez_vous();"><span class="menu-icon"></span>Déplacer</button>&nbsp;&nbsp;
                                                    <button type="button" id="btn_supprimer_fiche_rendez_vous"  name="btn_supprimer_fiche_rendez_vous" onclick="del_fiche_rendez_vous($('#id_fiche_rendez_vous').val());" class="btn vd_btn vd_bg-red"><span class="menu-icon"></span> Supprimer</button>
                                                </div>

                                            {/if}
                                        </div>

                                        <div class="form-group"  id="div_bouton_deplacement_rendez_vous" style="display: none;">
                                            {if $iAccess == '10' || $sGroupe == 'secrelimite'}

                                                <div class="col-sm-12 controls" align="center">
                                                    <button type="submit" id="btn_modifier_fiche_rendez_vous" name="btn_modifier_fiche_rendez_vous" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Valider</button>
                                                    <button type="button" name="btn_algo_deplacement_fiche_rendez_vous" id="btn_algo_deplacement_fiche_rendez_vous" class="btn vd_btn vd_bg-green" onclick="modifier_date_attente_confirmation($('#daterdv_fiche_rendez_vous').val(), $('#identifiant_praticien_fiche_rendez_vous').val(), $('#id_lieu_fiche_rendez_vous').val(), $('#motif_fiche_rendez_vous').val(), $('#id_patient_fiche_rendez_vous').val());">Nouveau RDV</button>
                                                    <button type="button" name="btn_repositionne_deplacement_fiche_rendez_vous" id="btn_repositionne_deplacement_fiche_rendez_vous" class="btn vd_btn vd_bg-red" onclick="$(this).prop('disabled',true);location.replace('main.php?dir=rechdispo&id_praticien_copypaste='+$('#id_praticien_fiche_rendez_vous').val()+'&id_rdv_copypaste='+$('#id_fiche_rendez_vous').val());">Repositionner sur l'agenda</button>
                                                    <button type="button" name="btn_annuler_deplacement_fiche_rendez_vous" id="btn_annuler_deplacement_fiche_rendez_vous" class="btn vd_btn" style="background-color: #bf0808 !important;" onclick="annulerDeplacementRDV($('#identifiant_rdv_fiche_rendez_vous').val());$('#modalFicheRendezVous').modal('hide');">Annuler</button>
                                                </div>
                                            {/if}
                                        </div>
                                    </form>

                                    <div class="form-group">
                                        <div class="col-sm-12 controls" align="center">
                                            <button type="button" id="btn_fermer_fiche_rendez_vous" name="btn_fermer_fiche_rendez_vous" onclick="$('#modalFicheRendezVous').modal('hide');" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {* [DEBUT] Historique modification rdv *}
                        <div class="tab-pane col-sm-12" id="histo-rdv">
                            <br/>
                            <div id="attente_historique_rdv">
                                <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                            </div>
                            <div id='pas_historique_rdv' style="display: none;">
                                <div class="alert alert-info">
                                    <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                    Aucun historique disponible
                                </div>
                            </div>
                            <div id='historique_rdv' style="display: none;">
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
                                                        <th></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="boucle_historique_rdv"></tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" align="center">
                                <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Fermer</button>
                            </div>
                        </div>
                        {* [FIN] Historique modification rdv *}

                        {* [DEBUT] Debug rdv *}
                        <div class="tab-pane col-sm-12" id="debug-rdv">
                            <br/>
                            <div id="attente_debug_rdv">
                                <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                            </div>
                            <div id='pas_debug_rdv' style="display: none;">
                                <div class="alert alert-info">
                                    <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                    Aucun historique de debug disponible
                                </div>
                            </div>
                            <div id='debug_rdv' style="display: none;">
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
                                                        <th>Action</th>
                                                        <th>Commentaire</th>
                                                        <th></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="boucle_debug_rdv"></tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" align="center">
                                <button type="button" data-dismiss="modal" aria-hidden="true" class="btn vd_btn vd_bg-grey" ><span class="menu-icon"></span> Fermer</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{* [FIN] Debug rdv *}
<!-- [FIN] Modal Fiche rendez-vous -->
