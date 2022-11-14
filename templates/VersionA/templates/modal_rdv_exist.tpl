
<!-- [Debut] avertissement rdv existe -->
<div class="modal fade" id="checkRdvExiste" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 2350;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" >Information</h4>
            </div>
            <input type="hidden" id="alreadyChecked" value="">
            <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                <div class="panel-body" style="padding: 0px 0px 15px 0px;">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <h3 id="txtCheckTitle">Un rendez-vous est déjà planifié pour cette spécialité</h3>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <h3 id="txtCheckRDV" style="color:#5D9AD4;"></h3>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <input type="hidden" id="txtIdNextRDV" value="" />
                            <div class="col-sm-2"><button id="boutonmyModalNoInfo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="checkModify();">Modifier l'ancien rdv</button></div>
                            <div class="col-sm-8" align="center">
                                <button id="boutonmyModalNoInfo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="checkContinue();">Continuer</button>
                            </div>
                            <input type="hidden" id="txtIdThisRDV" value="" />
                            <div class="col-sm-2"><button id="boutonmyModalNoInfo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="checkModifyThis();">Modifier ce rdv</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [Fin] avertissement rdv existe -->


<!-- [Debut] avertissement rdv existe TODAY -->
<div class="modal fade" id="checkRdvExisteToday" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 2350;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" >Information</h4>
            </div>
            <input type="hidden" id="alreadyChecked" value="">
            <div class="modal-body" style="padding: 15px 0px 0px 0px;">
                <div class="panel-body" style="padding: 0px 0px 15px 0px;">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <h3 id="txtCheckTitleToday">Un rendez-vous est déjà planifié pour cette spécialité</h3>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" align="center">
                                <div id="txtCheckRDVToday" style="color:#5D9AD4;"></div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="form-group">

                            <div class="col-sm-12" align="center">
                                <button id="boutonmyModalValid" type="button" class="btn vd_btn " onclick="checkContinueToday();">Continuer et enregister le rendez-vous</button>
                                <button id="boutonmyModalSupp" type="button" class="btn vd_btn" onclick="checkAnnulerRDV();">Annuler la prise de rendez-vous</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [Fin] avertissement rdv existe TODAY -->