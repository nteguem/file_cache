<!-- [DEBUT] Modal Prendre un rendez-vous Unique Nouveau Praticien-->
<div style="overflow-x: hidden;overflow-y: auto;z-index:2100;" class="modal fade in" id="modalPrendreRendezVousUniqueGlobal" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVousUnique" aria-hidden="false" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" style="width:1200px!important">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalPrendreRendezVouUniquesGlobal"> Prendre un rendez-vous</h4>
            </div>
            <div class="modal-body row" style="margin-right: 0!important;margin-left: 0!important;">
                <div class="col-sm-7">
                    <div id="wizard-rdv-unique" class="form-wizard">
                        <div class="tab-content no-bd" style="padding-top: 0px;">
                            <div class="tab-pane" id="tabPrendreRendezVousUnique1Global">

                                <div id="attente_chargement_etape1_prendre_rendez_vous_uniqueGlobal"></div>
                                <form class="form-horizontal" action="" role="form" id="form_etape1_prendre_rendez_vous_uniqueGlobal" name="form_etape1_prendre_rendez_vous_unique">
                                    <input type="hidden" value="" id="idp_uniqueGlobal" name='idp_unique' val />
                                    <input type="hidden" value="{$id_lieux}" id="id_lieux_main" name='id_lieux_main' />
                                    <input type="hidden" value="" id="id_propushGlobal" name='id_propush' />
                                    <input type="hidden" value="planning" id="validation_rdv_uniqueGlobal" name='validation_rdv_unique' />
                                    <input type="hidden" value="3" id='all_uniqueGlobal' name='all_unique' />
                                    <input type="hidden" value="" id='linkGlobal' name='linkGlobal' />
                                    <input type="hidden" value="" id='nomGlobal' name='linkGlobal' />
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            {* <div class="col-sm-2"></div> *}
                                            <div class="col-sm-12">

                                                <div id="divcatprofession_prendre_rendez_vous_uniqueGlobal" class="col-sm-12 controls" style='display:none;'>
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Profession :</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="selectcatprofession_prendre_rendez_vous_unique" id="selectcatprofession_prendre_rendez_vous_uniqueGlobal"></select>
                                                    </div>
                                                </div>

                                                <div id="divprofession_prendre_rendez_vous_uniqueGlobal" class="col-sm-12 controls" style='display:none;'>
                                                    <div class="label-wrapper">
                                                        <label class="control-label">
                                                            <b>Quelle est la spécialité ?</b>
                                                        </label>
                                                    </div>
                                                    <div class="vd_input-wrapper-modal">
                                                        <select name="selectprofession_prendre_rendez_vous_unique" id="selectprofession_prendre_rendez_vous_uniqueGlobal"></select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-2"></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12" align="center">
                                        <button id="btn_recherche_rdv_prendre_rendez_vous_uniqueGlobal" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="$('.modal-backdrop').remove();modal_prendre_rendez_vous_unique('', $('#selectprofession_prendre_rendez_vous_uniqueGlobal').val(), $('#linkGlobal').val(), $('#linkGlobal').val());$('#modalPrendreRendezVousUniqueGlobal').hide();">Suivant</button>
                                    </div>

                                    <div class="col-sm-12" id="return_message_rdv_prendre_rendez_vous_uniqueGlobal" style="display:none;margin-top:10px; margin-bottom:0px;"></div>

                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                {* Rdv dispo *}
                <div class="col-sm-5" id="divDroite" style='padding-right: 0px;padding-left: 0px;'>
                    <div id="divrdvdispoattente_prendre_rendez_vous_unique" style="padding:0;display:none;">
                        <div align='center'><br><br><h2>En attente de confirmation...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
                    </div>
                    <div id="divrdvdispo_prendre_rendez_vous_unique" style="display:none;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- [FIN] Modal Prendre un rendez-vous Unique Nouveau Praticien-->