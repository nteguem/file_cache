<style type="text/css">
    #modal_tous{
        
    }
    .col-sm-2{
        text-align: end;
    }
    .col-sm-12 {
        margin: 10px 0;
    }
    .modal-body {
        height: 300px;
    }
    button#updateButton{
        margin-left: 200px;
    }
    .modal_content{
        z-index: 1041;
    }
    #interval_container{
        padding-left:0;
        padding-right:0;
    }
</style>


<div class="modal fade in" id="modal_tous"  style="overflow-x:hidden; overflow-y:auto; margin-top:15%;" tabindex="-1" role="dialog" aria-labelledby="LabelmodalTous" aria-hidden="false" data-keyboard="false" data-backdrop="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalTous">Tous</h4>
            </div>
            <div class="modal-body" >
                <div class="col-sm-12">
                    <label class="control-label col-sm-2">Heure de début</label>
                    <div class="input-group bootstrap-timepicker col-sm-6">
                        <input class="input-modal-date-left" type="text" id="heure_debut_tous" name="heure_debut_tous" value="" {if $bblocageall}readonly="readonly"{/if}>
                        <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                    </div>
                    {literal}
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $("#heure_debut_tous").clockpicker({
                                    placement: 'bottom',
                                    autoclose: true
                                });
                                $("#heure_debut_tous").mask("99:99");
                            });

                        </script>
                    {/literal}
                </div>
                <div class="col-sm-12">
                    <label class="control-label col-sm-2">Heure de fin</label>
                    <div class="input-group bootstrap-timepicker col-sm-6">
                        <input class="input-modal-date-left" type="text" id="heure_fin_tous" name="heure_fin_tous" value="" {if $bblocageall}readonly="readonly"{/if}>
                        <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                    </div>
                    {literal}
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $("#heure_fin_tous").clockpicker({
                                    placement: 'bottom',
                                    autoclose: true
                                });
                                $("#heure_fin_tous").mask("99:99");
                            });

                        </script>
                    {/literal}
                </div>
                <div class="col-sm-12" >
                    <label class="control-label col-sm-2">Durée de l'intervalle <br> (en min.)</label>
                    <div class="controls col-sm-6" id="interval_container">
                        <input name="interval_tous" id="interval_tous" type="number" value="" min="0" max="720" {if $boplus or $bblocageall}readonly="readonly"{/if}>
                    </div>
                </div>
                <button type="submit" name="updateButton" id="updateButton" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span>Valider</button>
            </div>
        </div>
    </div>
</div>