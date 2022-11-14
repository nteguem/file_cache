{if $bDebugRequete}
<p>
	Requete Select : <br><br>
	{$sDebugRequeteSelect}<br><br>
	Requete Insert/Update : <br><br>
	{$sDebugRequeteInsertUpdate}<br><br>
</p>
{/if}
{if isset($sScriptJavascriptInsert)}
	{$sScriptJavascriptInsert}
{/if}
{if isset($sScriptJavascriptUpdate)}
	{$sScriptJavascriptUpdate}
{/if}

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
      	<h1>{$sTitreForm}</h1>
      	<small class="subtitle">{$sSousTitreForm}</small>
  	</div>
 </div>
<!-- vd_title-section -->

<div class="vd_content-section clearfix">
	<div class="row" id="form-basic">
		<div class="col-md-12">
			<div class="panel widget">
				<div class="panel-heading vd_bg-grey">
					<h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-bar-chart-o"></i> </span>{$sCategorieForm}</h3>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" action="{$url_form}" role="form" method="POST" {if isset($bTelechargementFichier) and $bTelechargementFichier}enctype="multipart/form-data"{/if}>
						{if isset($bMessageErreurForm) and $bMessageErreurForm}
						<div class="alert alert-danger">
                    		<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    		<span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>{if isset($sMessageErreurForm)}{$sMessageErreurForm}{/if}
                    	</div>
                    	{/if}
						{if isset($bMessageSuccesForm) and $bMessageSuccesForm}
                  		<div class="alert alert-success">
                    		<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    		<span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>{if isset($sMessageSuccesForm)}{$sMessageSuccesForm}{/if} 
                		</div>
                		{/if}

            			<div class="form-group">
							<label class="col-sm-3 control-label">{$aForm[0].text_label}</label>
							<div class="col-sm-9 controls">
								<div class="row mgbt-xs-0">
									<div class="col-xs-9">
										<input 
											type="password"
											id="id_{$aForm[0].nom_variable}"
											placeholder="{$aForm[0].text_label}"
											name="{$aForm[0].nom_variable}"
											class="width-40 {if isset($aForm[0].ctrl_champ) and $aForm[0].ctrl_champ eq 'ok'} required {/if}"
											{if isset($aForm[0].valeur_variable) and $aForm[0].valeur_variable neq ''}value="{$aForm[0].valeur_variable}"{/if}
											{if isset($aForm[0].size_champ) and $aForm[0].size_champ neq ''}size="{$aForm[0].size_champ}"{/if}
											{if isset($aForm[0].style) and $aForm[0].style neq ''}style="{$aForm[0].style}"{/if}
											{if isset($aForm[0].tableau_attribut) and $aForm[0].tableau_attribut|is_array}
												{foreach from=$aForm[0].tableau_attribut key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($aForm[0].fonction_javascript) and $aForm[0].fonction_javascript|is_array}
												{foreach from=$aForm[0].fonction_javascript key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($aForm[0].ctrl_champ) and $aForm[0].ctrl_champ eq 'ok'} required {/if}
										>
									</div>
									<!-- col-xs-12 --> 
								</div>
								<!-- row --> 
							</div>
							<!-- col-sm-10 --> 
						</div>
						<!-- form-group -->

						<div class="form-group">
							<label class="col-sm-3 control-label">{$aForm[1].text_label}</label>
							<div class="col-sm-9 controls">
								<div class="row mgbt-xs-0">
									<div class="col-xs-9">
										<input 
											type="password"
											id="id_{$aForm[1].nom_variable}"
											placeholder="{$aForm[1].text_label}"
											name="{$aForm[1].nom_variable}"
											class="width-40 {if isset($aForm[1].ctrl_champ) and $aForm[1].ctrl_champ eq 'ok'} required {/if}"
											{if isset($aForm[1].valeur_variable) and $aForm[1].valeur_variable neq ''}value="{$aForm[1].valeur_variable}"{/if}
											{if isset($aForm[1].size_champ) and $aForm[1].size_champ neq ''}size="{$aForm[1].size_champ}"{/if}
											{if isset($aForm[1].style) and $aForm[1].style neq ''}style="{$aForm[1].style}"{/if}
											{if isset($aForm[1].tableau_attribut) and $aForm[1].tableau_attribut|is_array}
												{foreach from=$aForm[1].tableau_attribut key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($aForm[1].fonction_javascript) and $aForm[1].fonction_javascript|is_array}
												{foreach from=$aForm[1].fonction_javascript key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($aForm[1].ctrl_champ) and $aForm[1].ctrl_champ eq 'ok'} required {/if}
										>
									</div>
									<!-- col-xs-12 --> 
								</div>
								<!-- row --> 
							</div>
							<!-- col-sm-10 --> 
						</div>
						<!-- form-group -->

						<div class="form-group">
							<label class="col-sm-3 control-label">{$aForm[2].text_label}</label>
							<div class="col-sm-9 controls">
								<div class="row mgbt-xs-0">
									<div class="col-xs-9">
										<input 
											type="password"
											id="id_{$aForm[2].nom_variable}"
											placeholder="{$aForm[2].text_label}"
											name="{$aForm[2].nom_variable}"
											class="width-40 {if isset($aForm[2].ctrl_champ) and $aForm[2].ctrl_champ eq 'ok'} required {/if}"
											{if isset($aForm[2].valeur_variable) and $aForm[2].valeur_variable neq ''}value="{$aForm[2].valeur_variable}"{/if}
											{if isset($aForm[2].size_champ) and $aForm[2].size_champ neq ''}size="{$aForm[2].size_champ}"{/if}
											{if isset($aForm[2].style) and $aForm[2].style neq ''}style="{$aForm[2].style}"{/if}
											{if isset($aForm[2].tableau_attribut) and $aForm[2].tableau_attribut|is_array}
												{foreach from=$aForm[2].tableau_attribut key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($aForm[2].fonction_javascript) and $aForm[2].fonction_javascript|is_array}
												{foreach from=$aForm[2].fonction_javascript key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($aForm[2].ctrl_champ) and $aForm[2].ctrl_champ eq 'ok'} required {/if}
										>
									</div>
									<!-- col-xs-12 --> 
								</div>
								<!-- row --> 
							</div>
							<!-- col-sm-10 --> 
						</div>
						<!-- form-group -->

						{if isset($itemBoutonsForm) and $itemBoutonsForm|is_array and $itemBoutonsForm|@count > 0}
							<div class="form-group form-actions">
		                        <div class="col-sm-2"> </div>
		                        <div class="col-sm-6">
		                        	{if isset($itemBoutonsForm.valider)}
									<button
										type="submit"
										class="btn vd_btn vd_bg-green vd_white"
										id="id_{$itemBoutonsForm.valider.nom_variable}"
										name="{$itemBoutonsForm.valider.nom_variable}"
										{if isset($itemBoutonsForm.valider.style) and $itemBoutonsForm.valider.style neq ''}style="{$itemBoutonsForm.valider.style}"{/if}
										{if isset($itemBoutonsForm.valider.tableau_attribut) and $itemBoutonsForm.valider.tableau_attribut|is_array}
											{foreach from=$itemBoutonsForm.valider.tableau_attribut key=cle item=valeur}
												{$cle}="{$valeur}"
											{/foreach}
										{/if}
										{if isset($itemBoutonsForm.valider.fonction_javascript) and $itemBoutonsForm.valider.fonction_javascript|is_array}
											{foreach from=$itemBoutonsForm.valider.fonction_javascript key=cle item=valeur}
												{$cle}="{$valeur}"
											{/foreach}
										{/if}
									><i class="icon-ok"></i> {$itemBoutonsForm.valider.text_label}</button>
									{/if}

		                          	{if isset($itemBoutonsForm.annuler) and $bAffAnnuler}
									<a href="{$itemBoutonsForm.annuler.url}">
										<button
											type="button"
											class="btn vd_btn"
											{if isset($itemBoutonsForm.annuler.style) and $itemBoutonsForm.annuler.style neq ''}style="{$itemBoutonsForm.annuler.style}"{/if}
											{if isset($itemBoutonsForm.annuler.tableau_attribut) and $itemBoutonsForm.annuler.tableau_attribut|is_array}
												{foreach from=$itemBoutonsForm.annuler.tableau_attribut key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($itemBoutonsForm.annuler.fonction_javascript) and $itemBoutonsForm.annuler.fonction_javascript|is_array}
												{foreach from=$itemBoutonsForm.annuler.fonction_javascript key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
										>{$itemBoutonsForm.annuler.text_label}</button>
									</a>
									{/if}
		                        </div>
	                      	</div>
						{/if}

					</form>
				</div>
	        </div>
        <!-- Panel Widget --> 
      	</div>
      	<!-- col-md-12 --> 
    </div>
    <!-- row -->
</div>
<!-- .vd_content-section -->

