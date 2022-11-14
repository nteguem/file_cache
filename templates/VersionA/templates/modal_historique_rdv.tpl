<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalhistoriquemod" tabindex="-1" role="dialog" aria-labelledby="LabelmodalFichePatient" aria-hidden="false" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        {* <div class="modal-dialog" style="width: 793px;"> *}
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalFichePatient">historique </h4>
            </div>
            <div class="modal-body" >
                <div id='historique_modalseul_rdv' style="display: none;">
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
                                        <tbody id="boucle_modal_historique_rdv"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>