<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>
<div class="vd_content-section clearfix">

 {if $bfom1}
<form action="main.php?pagesimple={$pagesimple}" method="GET">
	<input type="hidden" value="{$dir}" name="dir">
	<input type="hidden" value="{$dir}" name="dir">
	<input type="hidden" value="ok" name="validation">
	<div class="form-group">
		 <div class="col-sm-6 controls">
			<input type="date" name="ladate" value="{$ladate}">
		</div>
	
	</div>
	<div class="form-group">
		<div class="col-sm-6 controls">
	 <input type="text" name="nom" placeholder="Nom docteur" id="idaff_nom"  value="{$nom}" >&nbsp;&nbsp;&nbsp;
                <input type="hidden" name="iddocteur" id="id_docteur"  value="{$iddocteur}">
                 {literal}
           <!-- Script pour l'auto-completion -->
              <script type="text/javascript" >
              $('#idaff_nom').autocomplete({
                  serviceUrl:'ajax/personne_auto_complete_praticien.php',
                  onSelect: function (suggestion){
                    //alert(suggestion.id);
                    document.getElementById('id_docteur').value = suggestion.id;
                   
                  }
              });

              </script>

        {/literal}
		</div>
	
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-primary" type="button">valider</button>
	</div>
</form>
{/if}


    {if $bfom2}
        <form action="" method="GET">
            <input type="hidden" value="{$dir}" name="dir">
            <input type="hidden" value="{$identifiant_entite}" name="identifiant_entite">
            <input type="hidden" value="ok" name="validation">
            <div class="form-group">
                <div class="col-sm-3 controls">
                    <input type="date" name="ladate" value="{$ladate}">
                </div>

            </div>
            <div class="form-group">
                <div class="col-sm-3 controls">
                   <select name="typesyncro">
                       <option value="les_link">Les Links module externe</option>
                       <option value="18">Info Plugins</option>
                       <option value="9">Génération fichier configuration centre</option>
                       <option value="1">Synchro praticien</option>
                       <option value="3">Synchro Activité</option>
                       <option value="4">Synchro Motif RDV</option>
                       <option value="15">Synchro des rdv (mettre une date)</option>
                       <option value="6">Synchro planning (possibilité de mettre une date)</option>
                       <option value="17">Synchro des lieux</option>
                       <option value="21">Voir les RDV d'une journée</option>
                   </select>
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-3 controls">
                    <select name="iddocteur">
                        <option></option>
                        {foreach from=$aTableauListePraticien item=objpraticien}
                            <option value="{$objpraticien.identifiant_module_externe_user}" {if $iddocteur eq $objpraticien.identifiant_module_externe_user}selected="selected"{/if}>
                                {$objpraticien.nom_user} {$objpraticien.prenom_user} {$objpraticien.identifiant_module_externe_user}</option>
                        {/foreach}
                    </select>
                </div>

            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary" type="button">valider</button>
            </div>
        </form>
    {/if}
<br>
{$sAffichage}
</div>