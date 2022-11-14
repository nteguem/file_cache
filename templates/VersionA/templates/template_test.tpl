<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>
<div class="vd_content-section clearfix">





        <form action="" method="POST">
            <input type="hidden" value="{$dir}" name="dir">
            <input type="hidden" value="ok" name="validation">
            <div class="form-group">
                <div class="col-sm-3 controls">
                    <textarea name="algo" ></textarea>
                </div>

            </div>
            <div class="form-group">
                <div class="col-sm-3 controls">
                  <input type="text" name="filtre" >
                </div>

            </div>


            <div class="form-group">
                <button type="submit" class="btn btn-primary" type="button">valider</button>
            </div>
        </form>

<br>
{$sAffichage}
</div>