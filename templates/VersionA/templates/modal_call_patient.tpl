
<!-- [Debut] avertissement rdv existe -->
<div class="modal fade" id="modalCallPatient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 2100;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" >Appeler un patient</h4>
            </div>
            <input type="hidden" id="idPatientCall" value="">
            <input type="hidden" id="TelPatientCall" value="">
            <input type="hidden" id="RaisonPatientCall" value="">
            <input type="hidden" id="TypePatientCall" value="">
            <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                <div class="panel-body" style="padding: 0px 0px 15px 0px;">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <h3 id="txtPatientCall" style="color:#5D9AD4;"></h3>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Raison de l'appel</label>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            {foreach from=$tabListeRaisonsAppelPatient item=tabLC name=stabListeRaison}
                                <div class="col-sm-3 controls" align="center">
                                    <button name="RaisonAppelPatient" id="RaisonAppelPatient{$tabLC.id_raison}" onclick="changeRaisonAppel({$tabLC.id_raison});" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span> {$tabLC.libelle_raison}</button>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group" style="margin-top: 15px">
                            <div class="col-sm-12 controls">
                                <textarea placeholder="Commentaire sur l'appel" name="remarque_appel_patient" id="remarque_appel_patient" rows = "3" ></textarea>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group" style="margin-top: 15px">
                            <div class="col-sm-12 controls" align="center">
                                {* <button type="button" onclick="$('#modalFichePatient').modal('hide');modal_prendre_rendez_vous_patient('');" name="updatepriserdv" id="updatepriserdv" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span> Prendre un rendez-vous</button> *}

                                <button name="btcallpatient" id="updateButton" onclick="callPatientModal($('#id_fiche_patient').val(), $('#RaisonPatientCall').val(), $('#remarque_appel_patient').val(), $('#TelPatientCall').val(), $('#TypePatientCall').val(), '');" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span> Appeler&nbsp;<i class="fa ico-phone"></i></button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [Fin] avertissement rdv existe -->

