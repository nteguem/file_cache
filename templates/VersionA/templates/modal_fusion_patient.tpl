<!-- [DEBUT] Modal traitement fussion patient ------------->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalFusionpatient" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPlanTraitementSauvegarde" aria-hidden="false" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">

                <h4 class="modal-title" id="LabelmodalPlanTraitementSauvegarde">Fusionner le patient </h4>
            </div>
            <div class="modal-body" >
                {*<h3>Si vous souhaitez sauvegarder ce plan de traitement, veuillez saisir un libellé ci dessous :</h3>*}
                <h3>Confirmez vous la validation de votre plan de traitement ?</h3>

                <div id="attente_sauvegarde_plan_traitement" style='display:none;'></div>
                <div id="info_sauvegarde_plan_traitement">
                    <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                        <label for="libelle_sauvegarde_plan_traitement">Libellé de sauvegarde :</label>
                        <input type="text" name="libelle_sauvegarde_plan_traitement" id="libelle_sauvegarde_plan_traitement" placeholder="Libellé">
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-sm-12" style="margin:0px; padding:0px;margin-top: 10px;text-align: center">
                        <button id="btn_valider_plan_traitement_supplementaire" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="valider_plan_traitement();">Valider</button>&nbsp;
                        <button id="btn_annuler_plan_traitement_supplementaire" type="button"  class="btn vd_btn vd_bg-grey" onclick="$('#modalPlanTraitementSauvegarde').modal('hide');"><span class="menu-icon"></span> Annuler</button>
                    </div>
                </div>
                <div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal traitement fussion patient ------------->