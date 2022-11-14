<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$Titreconsul}</h1>
    </div>
</div>

<div class="vd_content-section clearfix">

    <div class="vd_content-section clearfix">
        <div class="row">
            <div class="col-sm-6">
                <div class="panel widget">
                    <div class="panel-heading vd_bg-grey">
                        <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>Recap action</h3>
                    </div>
                    <div class="panel-body">
                        <div class="panel-body-list table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td>
                                        <b>Motif de consultation</b><br>{$motif_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>traumatismes </b><br>{$traumas_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>chirurgie </b><br>{$chin_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Pathologie(s)</b><br>{$patho_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Familiaux</b><br>{$familiaux_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Medicament(s)</b><br>{$medocs_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>LVC</b><br>{$lvc_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Thoracique</b><br>{$thoracique_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Digestif</b><br>{$digestif_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Uro gynéco</b><br>{$uro_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Posture</b><br>{$posture}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Autre</b><br>{$autre_dossier}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h3>Info réglement comsultation</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Montant</b><br>{$montant}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Moyen réglement</b><br>{$nomtypepaiement}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel widget">
                    <div class="panel-heading vd_bg-grey">
                        <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>Schema</h3>
                    </div>
                    <div class="panel-body">
                        {literal}
                        <table>
                            <tr><td>
                                    <div style="width:300px;height:900px;position:relative">
                                        <canvas id="SchemaVertebre" width="300" height="900"></canvas>
                                        {/literal}
                                        {$contentDivVertebre}
                                        {literal}
                                    </div></td><td>
                                    <div style="width:300px;height:900px;position:relative">
                                        <canvas id="SchemaSquelette" width="300" height="900"></canvas>
                                        {/literal}
                                        {$contentDivSquelette}
                                        {literal}
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <script>
                            var canvasVertebre = document.getElementById('SchemaVertebre');
                            var contextvertebre = canvasVertebre.getContext('2d');
                            var imageVertebre = new Image();

                            imageVertebre.onload = function() {
                                contextvertebre.drawImage(imageVertebre, 0, 0);

                                /*
                                  context.fillStyle = "rgba(0, 0, 200, 0.1)";
                                   context.fillRect (112.0625, 26, 112.0625, 50);
                                   */


                            };

                            imageVertebre.src = 'modules/osteo/img/imagecertebre.png';



                            var canvasSquelette = document.getElementById('SchemaSquelette');
                            var contextsquelette = canvasSquelette.getContext('2d');
                            var imagesquelette = new Image();

                            imagesquelette.onload = function() {
                                contextsquelette.drawImage(imagesquelette, 0, 0);

                                {/literal}
                                {$contentCanvasVertebre}
                                {literal}

                                {/literal}
                                {$contentCanvasSquelette}
                                {literal}
                            };
                            imagesquelette.src = 'modules/osteo/img/squellette.jpg';



                        </script>
                        {/literal}
                        <table class="table table-bordered">
                            <tbody>
                               <tr>
                                   <td>
                                       <h3>Tests ostéopathique</h3>
                                   </td>
                               </tr>

                               <tr>
                                   <td>
                                       <b>Traitement</b><br>{$traitement_dossier}
                                   </td>
                               </tr>
                            <tr>
                                <td>
                                    <b>Tests différentiels - exclusions</b><br>{$test_differentiel}
                                </td>
                            </tr>
                               <tr>
                                   <td>
                                       <b>Remarque</b><br>{$remarque_dossier}
                                   </td>
                               </tr>
                            </tbody>
                        </table>


                        <table class="table table-bordered">
                            <tbody>
                            <thead>
                            <tr>
                                <th  class="wwe-lang-rank" scope="col" >Date consultation</th>
                                <th  class="wwe-lang-rank" scope="col" >Nom vertebre</th>
                                <th  class="wwe-lang-rank" scope="col" >Action</th>
                            </tr>
                            <thead>
                            <tbody>
                            {section name=sec1 loop=$aTableauHistoriqueActionVertebre}
                                <tr>
                                    <td>
                                        {$aTableauHistoriqueActionVertebre[sec1].dateconsult}
                                    </td>

                                    <td>
                                        {$aTableauHistoriqueActionVertebre[sec1].nom_partiecorps}
                                    </td>

                                    <td>
                                        {$aTableauHistoriqueActionVertebre[sec1].comment_action_partiecorps}
                                    </td>
                                </tr>
                            {/section}
                            </tbody>

                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>