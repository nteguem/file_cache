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
                       <option value="version_module">Version</option>
                       <option value="info_pluggin">Info Plugins</option>
                       <option value="info_pluggin">Information des methode disponible dans le plugin</option>
                      {* <option value="enregistement_praticien">Synchro praticien</option>
                       <option value="enregistrement_lieux">Synchro des lieux</option>
                       <option value="enregistrement_motif_rdv">Synchro Motif RDV</option>
                       <option value="enregistrement_activite">Synchro Activité</option>
                       <option value="get_rdv">Synchro des rdv (mettre une date)</option>
                       <option value="get_planning">Synchro planning (possibilité de mettre une date)</option>
                       <option value="affiche_rdv_module_externe">Voir les RDV d'une journée</option>*}
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

    {if isset($bform3) and $bform3}
    <form action="" method="GET">
        <input type="hidden" value="{$dir}" name="dir">
        <input type="hidden" value="{$identifiant_entite}" name="identifiant_entite">
        <input type="hidden" value="ok" name="validation">
        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Date RDV</label>
                <input type="date" name="ladate" value="">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Heure RDV</label>
                <input type="time" name="heure" value="">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Praticien</label>
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
            <div class="col-sm-3 controls">
                <label>Lieux</label>
                <select name="idlieu">
                    <option></option>
                    {foreach from=$aTableaulieux item=objlieu}
                        <option value="{$objlieu.id_lieux}" {if $idlieu eq $objlieu.id_lieux}selected="selected"{/if}>
                            {$objlieu.nom_lieux} </option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Motif RDV</label>
                <select name="idmotif">
                    <option></option>
                    {foreach from=$aTableauMotif item=objMotifRdv}
                        <option value="{$objMotifRdv.id_type_rdv}" {if $idmotif eq $objMotifRdv.id_type_rdv}selected="selected"{/if}>
                            {$objMotifRdv.nom}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Patient alaxione</label>
                <select name="iduser">
                    <option></option>
                    {foreach from=$aTableauUserPatient item=objPateint}
                        <option value="{$objPateint.id_user}" {if $iduser eq $objPateint.id_user}selected="selected"{/if}>
                            {$objPateint.nom}</option>
                    {/foreach}
                </select>
            </div>
        </div>


        <div class="form-group">
            <button type="submit" class="btn btn-primary" type="button">valider</button>
        </div>
    </form>
    {/if}

    {if isset($bform4) and $bform4}
    <form action="" method="GET">
        <input type="hidden" value="{$dir}" name="dir">
        <input type="hidden" value="{$identifiant_entite}" name="identifiant_entite">
        <input type="hidden" value="{$iddocteur}" name="iddocteur">
        <input type="hidden" value="ok" name="validation">

        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Heure RDV</label>
                <input type="time" name="heure" value="">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-3 controls">
                <label>Typerdv</label>
                <select name="idrdv">
                    <option></option>
                    {foreach from=$aTableauListerdv item=objrdv}
                        <option value="{$objrdv.id_type_rdv}" {if $idrdv eq $objrdv.id_type_rdv}selected="selected"{/if}>
                            {$objrdv.libelle_type_rdv} </option>
                    {/foreach}
                </select>
            </div>
        </div>
   {/if}
<br>
{$sAffichage}
</div>