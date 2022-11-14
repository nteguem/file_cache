<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>Création d'une structure</h1>
    </div>
</div>
<div class="vd_content-section clearfix">
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">

                <form action="" method="GET">
                    <input type="hidden" value="{$dir}" name="dir">
                    <input type="hidden" value="ok" name="validation">
                    <div class="col-sm-12 controls form-group">
                        <input type="text" name="nom_structure" id="nom_structure" value="" placeholder="Nom de la structure" required/>
                    </div>
                    <div class="col-sm-12 controls form-group">
                        <div class="label-wrapper">
                            <label class="control-label">Quelle type de donnée ?</label>
                        </div>
                        <div class="vd_input-wrapper">
                            <select id="select_type_structure">
                                <option value="1">Interne</option>
                                <option value="2">Module externe</option>
                                <option value="3">Module CSV</option>
                            </select>
                        </div>
                    </div>
                    <div id="div_view_module_externe" class="col-sm-12 controls form-group" style="display: none;">
                        <div class="label-wrapper">
                            <label class="control-label">Quel module externe ?</label>
                        </div>
                        <div class="vd_input-wrapper">
                            <select id="select_module_externe">
                                <option value=""></option>
                                <option value="oplus">oPlus</option>
                                <option value="ardion">Ardion</option>
                                <option value="adsion">Adsion</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-12 controls" align="center">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" type="button">Suivant</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
</div>


{literal}
    <script type="text/javascript">
    $(document).ready(function() {
        $('#select_type_structure').on('change', function() {
            if($('#select_type_structure').val()=='2'){
                $('#div_view_module_externe').slideDown('slow', function(){});
            }else{
                $('#div_view_module_externe').slideUp('slow', function(){});
                $('#select_module_externe').val("");
            }
        });
    });
    </script>
{/literal}