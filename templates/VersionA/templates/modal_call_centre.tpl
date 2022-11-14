<!-- [Debut] modal_call_centre -->
<div class="modal fade" id="modalCallCentre" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 2100;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" >Appeler un centre</h4>
            </div>
            <input type="hidden" id="TelCentreCall" value="">
            <input type="hidden" id="id_lieux" value="{$id_lieux}">
            <input type="hidden" id="RaisonCentreCall" value="">
            <input type="hidden" id="NumInterneCentreCall" value="">
            <input type="hidden" id="TypeCentreCall" value="">
            <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                <div class="panel-body" style="padding: 0px 0px 15px 0px;">
                    <div class="col-sm-12">
                        <div class="form-group tabListeRaisonsAppelCentre">
                            <label class="col-sm-12 control-label">Numéro interne</label>
                            {if empty($numerosInternes)}
                                Aucun numéro interne sur ce lieu
                            {else}
                                {foreach from=$numerosInternes item=num name=listeNumIntern}
                                    <div class="controls">
                                        <button name="NumInterneCentre" id="NumInterneCentre{$num.id_lieux_numero_interne}" onclick="changeNumInterneCentre({$num.id_lieux_numero_interne});" title="{$num.commentaire}" data-numero="{$num.numero}" class="btn vd_btn vd_bg-color">
                                            <span class="menu-icon"></span>{$num.libelle}</br>{$num.numero}
                                        </button>
                                    </div>
                                {/foreach}
                            {/if}
                        </div>
                    </div>


                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Raison de l'appel</label>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group tabListeRaisonsAppelCentre">
                            {foreach from=$tabListeRaisonsAppelCentre item=tabLC name=stabListeRaison}
                                <div class="controls">
                                    <button name="RaisonAppelCentre" id="RaisonAppelCentre{$tabLC.id_raison}" onclick="changeRaisonAppelCentre({$tabLC.id_raison});" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span> {$tabLC.libelle_raison}</button>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group" style="margin-top: 15px">
                            <div class="col-sm-12 controls">
                                <label for="remarque_appel_centre">Commentaire sur l'appel</label>
                                <textarea name="remarque_appel_centre" id="remarque_appel_centre" rows = "3" ></textarea>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group" style="margin-top: 15px">
                            <div class="col-sm-12 controls" align="center">
                                <button name="btcallpatient" id="updateButton" onclick="callPatientModal('', $('#RaisonCentreCall').val(), $('#remarque_appel_centre').val(), $('#NumInterneCentreCall').val(), $('#TypeCentreCall').val(), $('#id_lieux').val());" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span> Appeler&nbsp;<i class="fa ico-phone"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [Fin] modal_call_centre -->
