<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$Titreconsul}</h1>
    </div>
</div>

{if isset($berror) and $berror}
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
        {if isset($sMessageError)}{$sMessageError}{/if}
    </div>
{/if}

{if isset($bsucces) and $bsucces}
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
        {if isset($sMessageSuccess)}{$sMessageSuccess}{/if}
    </div>

{/if}

<div class="vd_content-section clearfix">

    <div class="vd_content-section clearfix">
        <div class="row">
            <div class="col-sm-6">
                <div class="panel widget">
                    <div class="panel-heading vd_bg-grey">
                        <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span></h3>
                    </div>
                    <div class="panel-body">
                        <form class="validate"  {if $bpost}method="POST"{else}  method="GET"{/if} {if $bfichier}enctype="multipart/form-data"{/if} id="valid">
                        <input type="hidden" name="validation" value="ok">
                        <input type="hidden" name="dir" value="{$dir}">
                        <input type="hidden" name="id" value="{$id}">
                        <input type="hidden" name="id_rdv" value="{$id_rdv}">
                        <input type="hidden" name="sTypeRetour" value="{$sTypeRetour}">
                        <div class="panel-body-list table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td>
                                        <b>Motif de consultation</b><br>
                                        <textarea name="motif_dossier"  rows="5" cols="10">{$motif_dossier}</textarea>
                                        <table class="table table-bordered" border="0">
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauMotif)}
                                                {foreach from=$aTableauMotif item=objMotif}
                                                    <tr>
                                                        <td>
                                                            {$objMotif.date}
                                                        </td>
                                                        <td>
                                                            {$objMotif.comment}
                                                        </td>
                                                    </tr>
                                                {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>traumatismes </b><br><textarea name="traumas_dossier"  rows="5" cols="10">{$traumas_dossier}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>chirurgie </b><br><textarea name="chin_dossier"  rows="5" cols="10">{$chin_dossier}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Pathologie(s)</b><br><textarea name="patho_dossier"  rows="5" cols="10">{$patho_dossier}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Familiaux</b><br><textarea name="familiaux_dossier"  rows="5" cols="10">{$familiaux_dossier}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Medicament(s)</b><br>
                                        <textarea name="medocs_dossier"  rows="5" cols="10">{$medocs_dossier}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauMedoc)}
                                                {foreach from=$aTableauMedoc item=objMedoc}

                                                <tr>
                                                    <td>
                                                        {$objMedoc.date}
                                                    </td>
                                                    <td>
                                                        {$objMedoc.comment}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>LVC</b><br><textarea name="lvc_dossier"  rows="5" cols="10">{$lvc_dossier}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauLVC)}
                                                {foreach from=$aTableauLVC item=objLvc}

                                                <tr>
                                                    <td>
                                                        {$objLvc.date}
                                                    </td>
                                                    <td>
                                                        {$objLvc.comment}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Thoracique</b><br><textarea name="thoracique_dossier"  rows="5" cols="10">{$thoracique_dossier}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauThora)}
                                             {foreach from=$aTableauThora item=objThora}
                                                  <tr>
                                                    <td>
                                                        {$objThora.date}
                                                    </td>
                                                    <td>
                                                        {$objThora.comment}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Digestif</b><br><textarea name="digestif_dossier"  rows="5" cols="10">{$digestif_dossier}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableaudigestif)}
                                                {foreach from=$aTableaudigestif item=objdigest}
                                                <tr>
                                                    <td>
                                                        {$objdigest.date}
                                                    </td>
                                                    <td>
                                                        {$objdigest.comment}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Uro gynéco</b><br><textarea name="uro_dossier"  rows="5" cols="10">{$uro_dossier}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauUro)}
                                                {foreach from=$aTableauUro item=objUro}

                                                <tr>
                                                    <td>
                                                        {$objUro.date}
                                                    </td>
                                                    <td>
                                                        {$objUro.comment}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Posture</b><br><textarea name="posture"  rows="5" cols="10">{$posture}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauPosture)}
                                                {foreach from=$aTableauPosture item=objPosture}

                                                    <tr>
                                                        <td>
                                                            {$objPosture.date}
                                                        </td>
                                                        <td>
                                                            {$objPosture.comment}
                                                        </td>
                                                    </tr>
                                                {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Autre</b><br><textarea name="autre_dossier"  rows="5" cols="10">{$autre_dossier}</textarea>
                                        <table class="table table-bordered"  border="0">
                                            <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                            <thead>
                                            <tr>
                                                <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                            </tr>
                                            <thead>
                                            <tbody>
                                            {if !empty($aTableauAutre)}
                                                {foreach from=$aTableauAutre item=objAutre}

                                                <tr>
                                                    <td>
                                                        {$objAutre.date}
                                                    </td>
                                                    <td>
                                                        {$objAutre.comment}
                                                    </td>
                                                </tr>
                                            {/foreach}
                                            {/if}
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                               {* <tr>
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
                                *}
                                </tbody>
                            </table>



                       <table  class="table table-bordered" >
                           <tr>
                               <td>
                                   <input type="button"  onclick="location.replace('{$sUrlretour}')" value="annuler"/>
                               </td>
                               <td align="right">
                                   <input type="submit" />
                               </td>
                           </tr>
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
                            <caption><h3>Tests ostéopathique</h3></caption>
                            <tr>
                                   <td>
                                       <b>Traitement</b><br><textarea name="traitement_dossier"  rows="5" cols="10">{$traitement_dossier}</textarea>
                                       <table class="table table-bordered"  border="0">
                                           <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                           <thead>
                                           <tr>
                                               <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                           </tr>
                                           <thead>
                                           <tbody>
                                           {if !empty($aTableauTrait)}
                                               {foreach from=$aTableauTrait item=objtrait}

                                               <tr>
                                                   <td>
                                                       {$objtrait.date}
                                                   </td>
                                                   <td>
                                                       {$objtrait.comment}
                                                   </td>
                                               </tr>
                                           {/foreach}
                                           {/if}
                                           </tbody>
                                       </table>
                                   </td>
                               </tr>
                            <tr>
                                <td>
                                    <b>Tests différentiels - exclusions</b><br><textarea name="test_differentiel"  rows="5" cols="10">{$test_differentiel}</textarea>
                                    <table class="table table-bordered"  border="0">
                                        <caption><b>INFORMATION DE LA PRECEDENTE CONSULTATION</b></caption>
                                        <thead>
                                        <tr>
                                            <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                        </tr>
                                        <thead>
                                        <tbody>
                                        {if !empty($aTableauTestdifferentiel)}
                                            {foreach from=$aTableauTestdifferentiel item=objdiff}

                                            <tr>
                                                <td>
                                                    {$objdiff.date}
                                                </td>
                                                <td>
                                                    {$objdiff.comment}
                                                </td>
                                            </tr>
                                        {/foreach}
                                        {/if}
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                               <tr>
                                   <td>
                                       <b>Remarque</b><br><textarea name="remarque_dossier"  rows="5" cols="10">{$remarque_dossier}</textarea>
                                       <table class="table table-bordered"  border="0">
                                           <thead>
                                           <tr>
                                               <th  class="wwe-lang-rank" scope="col" >Date consul</th><th>Info Consul</th>

                                           </tr>
                                           <thead>
                                           <tbody>
                                           {if !empty($aTableauRemarque)}
                                               {foreach from=$aTableauRemarque item=objRemar}
                                               <tr>
                                                   <td>
                                                       {$objRemar.date}
                                                   </td>
                                                   <td>
                                                       {$objRemar.comment}
                                                   </td>
                                               </tr>
                                           {/foreach}
                                           {/if}
                                           </tbody>
                                       </table>
                                   </td>
                               </tr>
                            <tr>
                                <td>
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>
                                                <label>
                                                    Montant consultation
                                                </label>
                                                <input type="text" name="montant" value="{$montant}">
                                            </td>
                                            <td>
                                                <label>
                                                    Type de reglement
                                                </label>
                                                <select name="typepaiement">
                                                    <option type=""></value>
                                                        {if !empty($aTableauListePaiement)}
                                                        {foreach from=$aTableauListePaiement item=objpaie}

                                                    <option value="{$objpaie.id_reglement}" {if $typepaiement eq $objpaie.id_reglement}selected="selected"{/if}>{$objpaie.libelle_reglement}</option>

                                                    {/foreach}
                                                    {/if}

                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table  class="table table-bordered" >
                                        <tr>
                                            <td>
                                                <input type="button"  onclick="location.replace('{$sUrlretour}')" value="annuler"/>
                                            </td>
                                            <td align="right">
                                                <input type="submit" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                        <form class="validate"  {if $bpost}method="POST"{else}  method="GET"{/if} {if $bfichier}enctype="multipart/form-data"{/if} id="valid">
                            <input type="hidden" name="validation" value="enregpartiecorps">
                            <input type="hidden" name="dir" value="{$dir}">
                            <input type="hidden" name="id" value="{$id}">
                            <input type="hidden" name="id_rdv" value="{$id_rdv}">
                            <input type="hidden" name="sTypeRetour" value="{$sTypeRetour}">
                        <table class="table table-bordered">
                            <caption>
                                    <h3>Enregistrer une intervention </h3>
                            </caption>
                            <tr>
                                <td>
                                    Rechercher
                                </td>
                                <td>
                                    <input  name="rechmembre"  value="" size="" id="id_rech" type="text" onKeyUp="affiche_liste_generique('osteo_partiecorps','id_partiecorps','nom_partiecorps','supplogique_partiecorps', 'tabfiltre[0]=nom_partiecorps|%<rech>%|like',this.value,'idselect_partie');">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Les membres
                                </td>
                                <td>
                                    <select name="idpartie" id="idselect_partie" size="4">

                                        <select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    L'intervention
                                </td>
                                <td>
                                    <input  name="content"  value="" size="" id="id_content" type="text">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table  class="table table-bordered" >
                                        <tr>
                                            <td>
                                                <input type="button"  onclick="location.replace('{$sUrlretour}')" value="annuler"/>
                                            </td>
                                            <td align="right">
                                                <input type="submit" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </form>
                        <table class="table table-bordered">
                            <caption>

                                    <h3>Historique Intervention </h3>

                            </caption>
                            <tbody>
                            <thead>
                            <tr>
                                <th  class="wwe-lang-rank" scope="col" >Date consultation</th>
                                <th  class="wwe-lang-rank" scope="col" >Nom vertebre</th>
                                <th  class="wwe-lang-rank" scope="col" >Action</th>
                            </tr>
                            <thead>
                            <tbody>
                            {if !empty($aTableauHistoriqueActionVertebre)}
                            {foreach from=$aTableauHistoriqueActionVertebre item=objhisto}

                                <tr>
                                    <td>
                                        {$objhisto.dateconsult}
                                    </td>

                                    <td>
                                        {$objhisto.nom_partiecorps}
                                    </td>

                                    <td>
                                        {$objhisto.comment_action_partiecorps}
                                    </td>
                                </tr>
                            {/foreach}
                            {/if}
                            </tbody>

                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>