<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>
<div class="vd_content-section clearfix">

    <div class="col-md-12">
        <div class="panel widget">
            <div class="panel-heading vd_bg-grey">
                <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>Recherche </h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" action="" role="form" id="formList" method="GET">
                    <input type="hidden" name="dir" value="statistique">
                    <input type="hidden" name="validation" value="ok">
                    <input type="hidden" name="pagesimple" value="">


                    <div class="form-group">
                        <label class="col-sm-1 control-label">Date debut</label>
                        <div class="col-sm-1 controls">
                            <div class="input-group">
                                <input type="date" id="id_daterech_1" name="datedebut"   value="{$datedebut}">

                            </div>
                        </div>

                        <label class="col-sm-1 control-label">date fin</label>
                        <div class="col-sm-1 controls">
                            <div class="input-group">
                                <input type="date" id="id_daterech_2" name="datefin"   value="{$datefin}">

                            </div>
                        </div>
                        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                        <label  class="col-sm-2 control-label">Choix des  stats</label>
                        <div class="col-sm-2 controls">
                            <div class="input-group">
                            <select name="typestat[]"  id="id_stat"  multiple="multiple">
                                <option value="" ></option>
                                <option value="4" {if in_array('4',$typestat)}selected="selected" {/if} >Stat recap global</option>
                                <option value="1" {if in_array('1',$typestat)}selected="selected" {/if} >Stat par motif rdv</option>
                                <option value="2" {if in_array('2',$typestat)}selected="selected" {/if} >Stat par lieu</option>
                                <option value="3" {if in_array('3',$typestat)}selected="selected" {/if} >Stat par activité</option>
                            </select>
                            </div>
                        </div>
                        <script>
                            // In your Javascript (external .js resource or <script> tag)
                            $(document).ready(function() {
                                $('.js-example-basic-multiple').select2();
                            });
                        </script>
                        <label  class="col-sm-2 control-label">Choix des  praticiens</label>
                        <div class="col-sm-2 controls">
                            <div class="input-group">
                                <select name="typepraticien[]" class="js-example-basic-multiple"  id="id_praticien"  multiple="multiple">

                                    <option value="4" {if in_array('4',$typepraticien)}selected="selected" {/if} >Stat globale</option>
                                    {foreach from=$aTableauPraticien item=objpraticien}
                                        <option {if in_array($objpraticien.id_user,$typepraticien)}selected="selected" {/if}value="{$objpraticien.id_user}">{$objpraticien.nom_user}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                    <script>
                    // In your Javascript (external .js resource or <script> tag)
                        $(document).ready(function() {
                            $('.js-example-basic-multiple').select2();
                        });
                    </script>



                    <div class="form-group form-actions">
                        <div class="col-sm-3"> </div>
                        <div class="col-sm-6">
                            <button type="submit" class="btn vd_btn vd_bg-green" id="id_btsubmit" name="btsubmit" onclick="this.form.action='';document.getElementById('formList').setAttribute('target','_top');"><i class="fa fa-search"></i> Rechercher</button>

                            <a href="main.php?dir=statistique">
                                <button type="button" class="btn vd_btn vd_bg-grey"> Annuler</button>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="col-md-12">
        {foreach from=$aTableaustat item=objstat}
            <div class="panel widget col-md-6">
                <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-bars"></i> </span>{$objstat.Nom} {$speriode}</h3>
                </div>
                <div class="panel-body">
                    <table>
                        {if empty($typestat) or in_array('4',$typestat) }
                            <tr>

                                <td>

                                    <table border="1" style="" class="table table-bordered">
                                        <caption><h3>Statistique Globale</h3></caption>
                                        {foreach from=$objstat.stat item=objitemstat}
                                            <tr>
                                                <td>
                                                    {$objitemstat.nom}
                                                </td>
                                                <td>
                                                    {$objitemstat.value}
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </table>
                                </td>
                                <td>
                                    {if !empty($objstat.stat)}
                                    {literal}

                                        <script type="text/javascript">
                                            google.charts.load('current', {packages:['corechart']});
                                            google.charts.setOnLoadCallback(drawChart_C11);
                                            function drawChart_C11() {
                                                var data = new google.visualization.DataTable();
                                                data.addColumn('string', 'Character');
                                                data.addColumn('number', 'Totaux');
                                                data.addColumn({label: 'Style', type: 'string', role: 'style'});
                                                data.addRows([
                                                    {/literal}
                                                    {if !empty($objstat.stat)}

                                                    {foreach from=$objstat.stat item=objitemstat}

                                                    [' {$objitemstat.nom}',{{$objitemstat.value}},'color:{$objitemstat.couleur}'],

                                                    {/foreach}
                                                    {/if}
                                                    {literal}

                                                ]);



                                                var chart = new google.visualization.ColumnChart(document.getElementById('chart_{/literal}{$objstat.iddocteur}{literal}'));
                                                chart.draw(data, {height: 500, legend:'none',  title: 'Graphe'});
                                            }
                                        </script>
                                    {/literal}
                                        <div id="chart_{$objstat.iddocteur}" style="width: 600px; height: 500px;"></div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td height="10px"></td>
                            </tr>
                        {/if}
                        {if empty($typestat) or in_array('1',$typestat) }
                            <tr>
                                <td>
                                    <table border="1" style=""  class="table table-bordered">
                                        <caption><h3>Statistique par Motif de RDV</h3></caption>
                                        {foreach from=$objstat.motif item=objitemmotif}
                                            <tr>
                                                <td>
                                                    {$objitemmotif.nom}
                                                </td>
                                                <td>
                                                    {$objitemmotif.value}
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </table>
                                </td>

                                <td>
                                    {if !empty($objstat.motif)}
                                    {literal}

                                        <script type="text/javascript">
                                            google.charts.load('current', {packages:['corechart']});
                                            google.charts.setOnLoadCallback(drawChart_C11);
                                            function drawChart_C11() {
                                                var data = new google.visualization.DataTable();
                                                data.addColumn('string', 'Character');
                                                data.addColumn('number', 'Totaux');
                                                data.addColumn({label: 'Style', type: 'string', role: 'style'});
                                                data.addRows([
                                                    {/literal}
                                                    {if !empty($objstat.motif)}

                                                    {foreach from=$objstat.motif item=objitemmotif}

                                                    [' {$objitemmotif.nom}',{{$objitemmotif.value}},'color:{$objitemmotif.couleur}'],

                                                    {/foreach}
                                                    {/if}
                                                    {literal}

                                                ]);



                                                var chart = new google.visualization.ColumnChart(document.getElementById('chartrdv_{/literal}{$objstat.iddocteur}{literal}'));
                                                chart.draw(data, {height: 500, legend:'none',  title: 'Graphe'});
                                            }
                                        </script>
                                    {/literal}
                                        <div id="chartrdv_{$objstat.iddocteur}" style="width: 600px; height: 500px;"></div>
                                    {/if}
                                </td>
                            </tr>

                            <tr>
                                <td height="10px"></td>
                            </tr>
                        {/if}
                        {if empty($typestat) or in_array('2',$typestat) }
                            <tr>
                                <td>
                                    <table border="1" style=""  class="table table-bordered">
                                        <caption><h3>Statistique par Lieux</h3></caption>
                                        {foreach from=$objstat.lieu item=objitemlieu}
                                            <tr>
                                                <td>
                                                    {$objitemlieu.nom}
                                                </td>
                                                <td>
                                                    {$objitemlieu.value}
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </table>
                                </td>

                                <td>
                                    {if !empty($objstat.lieu)}
                                    {literal}

                                        <script type="text/javascript">
                                            google.charts.load('current', {packages:['corechart']});
                                            google.charts.setOnLoadCallback(drawChart_C11);
                                            function drawChart_C11() {
                                                var data = new google.visualization.DataTable();
                                                data.addColumn('string', 'Character');
                                                data.addColumn('number', 'Totaux');
                                                data.addColumn({label: 'Style', type: 'string', role: 'style'});
                                                data.addRows([
                                                    {/literal}
                                                    {if !empty($objstat.lieu)}

                                                    {foreach from=$objstat.lieu item=objitemlieu}

                                                    [' {$objitemlieu.nom}',{{$objitemlieu.value}},'color:{$objitemlieu.couleur}'],

                                                    {/foreach}
                                                    {/if}
                                                    {literal}

                                                ]);



                                                var chart = new google.visualization.ColumnChart(document.getElementById('chartlieu_{/literal}{$objstat.iddocteur}{literal}'));
                                                chart.draw(data, {height: 500, legend:'none',  title: 'Graphe'});
                                            }
                                        </script>
                                    {/literal}
                                        <div id="chartlieu_{$objstat.iddocteur}" style="width: 600px; height: 500px;"></div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td height="10px"></td>
                            </tr>
                        {/if}
                        {if !empty($typestat) or in_array('4',$typestat) }
                            <tr>
                                <td>
                                    <table border="1" style=""  class="table table-bordered">
                                        <caption><h3>Statistique par Activite</h3></caption>
                                        {foreach from=$objstat.activite item=objitemactivite}
                                            <tr>
                                                <td>
                                                    {$objitemactivite.nom}
                                                </td>
                                                <td>
                                                    {$objitemactivite.value}
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </table>
                                </td>
                                <td>
                                    {if !empty($objstat.activite)}
                                    {literal}

                                        <script type="text/javascript">
                                            google.charts.load('current', {packages:['corechart']});
                                            google.charts.setOnLoadCallback(drawChart_C11);
                                            function drawChart_C11() {
                                                var data = new google.visualization.DataTable();
                                                data.addColumn('string', 'Character');
                                                data.addColumn('number', 'Totaux');
                                                data.addColumn({label: 'Style', type: 'string', role: 'style'});
                                                data.addRows([
                                                    {/literal}
                                                    {if !empty($objstat.activite)}

                                                    {foreach from=$objstat.activite item=objitemactivite}

                                                    [' {$objitemactivite.nom}',{{$objitemactivite.value}},'color:{$objitemactivite.couleur}'],

                                                    {/foreach}
                                                    {/if}
                                                    {literal}

                                                ]);



                                                var chart = new google.visualization.ColumnChart(document.getElementById('chartactivite_{/literal}{$objstat.iddocteur}{literal}'));
                                                chart.draw(data, {height: 500, legend:'none',  title: 'Graphe'});
                                            }
                                        </script>
                                    {/literal}
                                        <div id="chartactivite_{$objstat.iddocteur}" style="width: 600px; height: 500px;"></div>
                                    {/if}
                                </td>
                            </tr>
                        {/if}
                    </table>
                </div>
            </div>
        {/foreach}
    </div>

    {foreach from=$aTableaustatrecap item=objstatrecap}
    <div class="col-md-6">
        <div class="panel widget col-md-12">
            <div class="panel-heading vd_bg-grey">
                <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-bars"></i> </span>{$objstatrecap.Nom} {$speriode}</h3>
            </div>
            <div class="panel-body">
                <table>
                    <tr>

                        <td>

                            <table border="1" style="" class="table table-bordered">
                                <caption><h3>Statistique Nombre RDV</h3></caption>
                                {foreach from=$objstatrecap.stat item=objitemstat}
                                    <tr>
                                        <td>
                                            {$objitemstat.nom}
                                        </td>
                                        <td>
                                            {$objitemstat.value}
                                        </td>
                                    </tr>
                                {/foreach}
                            </table>
                        </td>
                        <td>
                            {literal}

                            <script type="text/javascript">
                                google.charts.load('current', {packages:['corechart']});
                                google.charts.setOnLoadCallback(drawChart_C11);
                                function drawChart_C11() {
                                    var data = new google.visualization.DataTable();
                                    data.addColumn('string', 'Character');
                                    data.addColumn('number', 'Totaux');
                                    data.addColumn({label: 'Style', type: 'string', role: 'style'});
                                    data.addRows([
                                        {/literal}
                                        {if !empty($objstatrecap.stat)}

                                        {foreach from=$objstatrecap.stat item=objitemstat}

                                        [' {$objitemstat.nom}',{{$objitemstat.value}},'color:{$objitemstat.couleur}'],

                                        {/foreach}
                                        {/if}
                                        {literal}

                                    ]);

                                    var chart = new google.visualization.ColumnChart(document.getElementById('chart_{/literal}{$objstatrecap.iddocteur}{literal}'));
                                    chart.draw(data, {height: 500, legend:'none',  title: 'Graphe'});
                                }
                            </script>
                            {/literal}
                            <div id="chart_{$objstatrecap.iddocteur}" style="width: 600px; height: 500px;"></div>

                        </td>
                    <tr></tr>
                </table>
            </div>
        </div>
    </div>
    {/foreach}



<br>
</div>