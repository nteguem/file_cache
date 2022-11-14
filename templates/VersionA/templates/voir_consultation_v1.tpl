<div role="main" class="container_12" id="content-wrapper">

    <div id="main_content">
        <h2 class="grid_6" >{$Titreconsul}</h2>

        {if $bsucces}
        <div class="alert success grid_10">
            <span class="icon"></span><strong>Sucess</strong>
            {$sMessageSuccess}
        </div>
        {/if}

        {if $bfailure}
        <div class="alert error grid_10">
            <span class="icon"></span><strong>Error</strong> {$sMessagefailure}
        </div>
        {/if}

        <div class="grid_5">
            <div class="box">
                <div class="header">
                    <img src="img/icons/packs/fugue/16x16/grid.png" alt="" width="16"
                         height="16">
                    <h3>{$textformrecherche}</h3>
                    <span></span>
                </div>
                <div class="content">
                    <form class="validate"  {if $bpost}method="POST"{else}  method="GET"{/if} {if $bfichier}enctype="multipart/form-data"{/if} id="valid">
                        <input type="hidden" name="validation" value="ok">
                        <input type="hidden" name="dir" value="{$dir}">
                        <input type="hidden" name="id" value="{$id}">
                        <div class="_100">
                            <p>
                                <label>
                                    Motif de consultation
                                </label>
                                {$motif_dossier}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Traumatisme
                                </label>
                                {$traumas_dossier}

                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Chirurgie
                                </label>
                                {$chin_dossier}

                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Pathologie(s)
                                </label>
                                {$patho_dossier}

                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Familiaux
                                </label>
                                {$familiaux_dossier}

                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Medicament(s)
                                </label>
                                {$medocs_dossier}

                            </p>
                            <hr>
                        </div>

                        <div class="_100">
                            <p>
                                <label>
                                    LVC
                                </label>
                                {$lvc_dossier}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Thoracique
                                </label>
                                {$thoracique_dossier}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Digestif
                                </label>
                                {$digestif_dossier}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Uro gynéco
                                </label>
                                {$uro_dossier}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Autre
                                </label>
                                {$autre_dossier}
                            </p>
                            <hr>
                        </div>

                        <div class="_100">
                            <p>
                                <label>
                                    Posture
                                </label>
                                {$posture}
                            </p>
                            <hr>
                        </div>
                        <h3>Info réglement comsultation</h3>
                        <div class="_100">
                            <p>
                                <label>
                                    Montant
                                </label>
                                {$montant}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">
                            <p>
                                <label>
                                    Moyen réglement
                                </label>
                                {$nomtypepaiement}
                            </p>
                            <hr>
                        </div>
                        <div class="_100">


                        </div>
                </div>

            </div>
        </div>

        <div class="grid_5">
            <div class="box">
                <div class="header">
                    <img src="img/icons/packs/fugue/16x16/grid.png" alt="" width="16"
                         height="16">
                    <h3>{$textformrecherche}</h3>
                    <span></span>
                </div>
                <div class="content">
                    <center>
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

                                /*context.fillStyle = "rgba(0, 0, 200, 0.1)";
                                   context.fillRect (112.0625, 26, 112.0625, 50);*/


                            };

                            imageVertebre.src = 'img/imagecertebre.png';



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




                            imagesquelette.src = 'img/squellette.jpg';



                        </script>
                        {/literal}

                        </map>

                    </center>
                </div>

            </div>

            <h3>Tests ostéopathique</h3>
            <div class="_100">
                <p>
                    <label>
                        Traitement
                    </label>
                    {$traitement_dossier}
                </p>
                <hr>
            </div>



            <div class="_100">
                <p>
                    <label>
                        Tests différentiels - exclusions
                    </label>
                    {$test_differentiel}
                </p>
                <hr>
            </div>


            <div class="_100">
                <p>
                    <label>
                        Remarque
                    </label>
                    {$remarque_dossier}
                </p>
                <hr>
            </div>

            <div class="_100">
                <p>
                    <label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </label>

                </p>

            </div>

            <div class="_100">
                <table class="table"  border="0">

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
                </table>
            </div>

        </div>

    </div>
    </form>
</div>


</div>