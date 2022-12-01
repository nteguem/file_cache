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
{if isset($aForm)}
<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
      	<h1>{$sTitreForm}
        {if $bActivtraduction=='Yes'}
			<a href="#" onclick="renvoi_info_traduction('stitreform','{$sFli_LinkUrl}','{$sLangueUser}','{$sTitreForm|replace:'\'':'\\\''}','{$sNomTable}','');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
        {/if}</h1>
      	{*<small class="subtitle">{$sSousTitreForm}</small>*}
  	</div>
 </div>
<!-- vd_title-section -->

<div class="vd_content-section clearfix">
	<div class="row" id="form-basic">
		<div class="col-md-12">
			<div class="panel widget">
				<div class="panel-heading vd_bg-grey">
					<h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-pencil-square-o"></i> </span>{$sCategorieForm}
                    {if $bActivtraduction=='Yes'}
						<a href="#" onclick="renvoi_info_traduction('stitrecategrorieform','{$sFli_LinkUrl}','{$sLangueUser}','{$sCategorieForm|replace:'\'':'\\\''}','{$sNomTable}','');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                    {/if}</h3>
				</div>
				<div class="panel-body">
					<form id="formLocationConfiguration" class="form-horizontal" action="{$url_form}&pagesimple={$pagesimple}" role="form" method="POST" {if isset($bTelechargementFichier) and $bTelechargementFichier}enctype="multipart/form-data"{/if}>
						
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

						{if isset($aForm)}
							{foreach from=$aForm item=objForm}
								{if isset($objForm.type_champ) and ((isset($objForm.aff_form) and $objForm.aff_form eq 'ok') or ($objForm.type_champ eq 'category' or $objForm.type_champ eq 'bouton'))}
									{if $objForm.type_champ eq 'text'}
										{if $objForm.double_password eq 'ok'}
											<div class="form-group">
						                        <label class="col-sm-2 control-label">{$objForm.text_label}
							                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                    {if $bActivtraduction=='Yes'}
														&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                    {/if}
							                    </label>
						                        <div class="col-sm-6 controls">
						                        	<input 
														type="password"
														id="id_{$objForm.nom_variable}"
														placeholder="{$objForm.text_label}"
														name="{$objForm.nom_variable}"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value=""{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													>
						                        	<span class="help-inline"></span>
						                        </div>
						                    </div>
											<div class="form-group">
						                        <label class="col-sm-2 control-label">{$objForm.text_label}
							                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
							                    </label>
						                        <div class="col-sm-6 controls">
						                        	<input 
														type="password"
														id="id_{$objForm.nom_variable}_2"
														placeholder="{$objForm.text_label}"
														name="{$objForm.nom_variable}_2"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value=""{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													>
						                        	<span class="help-inline"></span>
						                        </div>
						                    </div>
										{else}

											<div class="form-group">
						                        <label class="col-sm-2 control-label">{$objForm.text_label}
							                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                    {if $bActivtraduction=='Yes'}
														&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                    {/if}
							                    </label>
						                        <div class="col-sm-6 controls">
						                        	<input 
														type="text"
														id="id_{$objForm.nom_variable}"
														placeholder="{$objForm.text_label}"
														name="{$objForm.nom_variable}"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													>
						                        	<span class="help-inline"></span>
						                        </div>
						                    </div>
						                {/if}

						            {elseif $objForm.type_champ eq 'montant'}
										<div class="form-group">
											<label class="col-sm-2 control-label">{$objForm.text_label}
												{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
											</label>
											<div class="col-sm-1 controls">
												<div class="input-group">
													<input
															type="text"
															id="id_{$objForm.nom_variable}"
															placeholder="{$objForm.text_label}"
															name="{$objForm.nom_variable}"
															class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
															{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
															{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
													{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
														{foreach from=$objForm.tableau_attribut key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
														{foreach from=$objForm.fonction_javascript key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													>
													<span class="input-group-addon">&euro;</span>
												</div>
											</div>
										</div>
						            {elseif $objForm.type_champ eq 'textautocomplete'}
						            	{literal}
					                    	<script type="text/javascript">
					                    		function inputautocomplete(){
					                    			$("{/literal}#id_{$objForm.nom_variable}{literal}").autocomplete({
											        	serviceUrl: '{/literal}{$objForm.fichier_php}{literal}',
											        	paramName: 'sautocomplete',
											        	dataType: 'json'
											    	});
											    	return false;
					                    		}

											</script>
										{/literal}
						            	<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
						                    </label>
					                        <div class="col-sm-6 controls">
					                        	<input 
													type="text"
													id="id_{$objForm.nom_variable}"
													placeholder="{$objForm.text_label}"
													name="{$objForm.nom_variable}"
													class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
													{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
													{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
													{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
													{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
														{foreach from=$objForm.tableau_attribut key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
														{foreach from=$objForm.fonction_javascript key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													onkeypress="inputautocomplete();"
												>
					                        	<span class="help-inline"></span>
					                        </div>
					                    </div>
									{elseif $objForm.type_champ eq 'textautocomplete2'}

										<div class="form-group">
											<label class="col-sm-2 control-label">{$objForm.text_label}
												{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
											</label>
											<div class="col-sm-6 controls">
												<input
														type="text"
														id="id_{$objForm.nom_variable}"
														placeholder="{$objForm.text_label}"
														name="{$objForm.nom_variable}"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
													{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
												{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
													{foreach from=$objForm.tableau_attribut key=cle item=valeur}
														{$cle}="{$valeur}"
													{/foreach}
												{/if}
												{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
													{foreach from=$objForm.fonction_javascript key=cle item=valeur}
														{$cle}="{$valeur}"
													{/foreach}
												{/if}
												{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
												">
												<span id="erreur_{$objForm.nom_variable}" class="help-inline" style="color: #5D9AD4;"></span>



											</div>
										</div>
										{literal}
											<script type="text/javascript">

												$( "{/literal}#id_{$objForm.nom_variable}{literal}" ).autocomplete({
													source : '{/literal}{$objForm.fichier_php}{literal}',
													focus: function (event, ui) {
														event.preventDefault();
														if($(this).val()==""){
															$( "{/literal}#id_{$objForm.input_hidden}{literal}" ).val("");
															$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("");
														}
													},
													select: function (event, ui) {
														event.preventDefault();
														if(ui.item.value == 0){
															$(this).val(ui.item.term);
															modal_ajout_patient(ui.item.term);
														}else{
															$(this).val(ui.item.nom);
															$( "{/literal}#id_{$objForm.input_hidden}{literal}" ).val(ui.item.value);
															$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("<b><i>"+ui.item.nom+"</i></b>" );
															if(ui.item.tel_mobile != ''){
																$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).append("<br/><b><i>Tel. mobile : "+ui.item.tel_mobile+"</i></b>" );
															}
															if(ui.item.tel_fixe != ''){
																$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).append("<br/><b><i>Tel. fixe : "+ui.item.tel_fixe+"</i></b>" );
															}
															if(ui.item.date_naissance !='00/00/0000'){
																$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).append("<br/><b><i>Date de naissance : "+ui.item.date_naissance+"</i></b>" );
															}
															$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).append("<br/><br/><a href='#' onclick='modal_modifier_patient(\""+ui.item.iduser+"\")'>Consulter la fiche patient</a>" );

														}
													},
													change: function(event, ui) {
														//alert(JSON.stringify(ui));
														//$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("");
														if (ui.item == null) {

															$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("<span style='color: #FF0000;'>Attention le patient saisie n'existe pas !</span><br/>" +
															"<button id='btn_ajouter_patient' alt='Ajouter un patient' title='Ajouter un patient' onclick='modal_ajout_patient(\"\");' type='button' " +
															"class='btn vd_btn btn-besoin-aide' style='background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; " +
															"-webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;'>Ajouter un patient</button>");

															$( "{/literal}#id_{$objForm.input_hidden}{literal}" ).val("");
															//$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("");
														}
														if($(this).val()==""){
															$( "{/literal}#id_{$objForm.input_hidden}{literal}" ).val("");
															$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("");
														}


													},
													close: function (event, ui) {
														if($(this).val()==""){
															$( "{/literal}#id_{$objForm.input_hidden}{literal}" ).val("");
														}
													}
												}).data("ui-autocomplete")._renderItem = function (ul, item) {
													return $("<li></li>")
															.data("item.autocomplete", item)
															.append(item.label)
															.appendTo(ul);
												};


												function modal_ajout_patient(term){
													document.getElementById("iframerdv").src="modal_ajout_patient.php?nom="+term+"&mode=select";

													$('#myModalinfordv').modal('show');
													$('#myModalLabelinfordv').html('Ajouter un patient');
												}


												function modal_modifier_patient(id){
                                                    $('#provenance_open').val('add_message');
                                                    $('#modalFichePatient').modal('show');
                                                    getInfoPatient(id);
												}

												function actualise_input(value, id){
													$( "{/literal}#id_{$objForm.nom_variable}{literal}" ).val(value);
													$( "{/literal}#id_{$objForm.input_hidden}{literal}" ).val(id);
													$( "{/literal}#erreur_{$objForm.nom_variable}{literal}" ).html("");
												}


											</script>
										{/literal}
					                {elseif $objForm.type_champ eq 'select'}
										{if isset($objForm.select_autocomplete) and $objForm.select_autocomplete eq 'ok'}
										<div class="form-group">
											<label class="col-sm-2 control-label">{$objForm.text_label_filtre}</label>
											<div class="col-sm-6 controls">
												<input type='text' 
												name='rech_{$objForm.nom_variable}' 	
												id='id_rech{$objForm.nom_variable}'
												onKeyUp="affiche_liste_generique('{$objForm.table_item}','{$objForm.id_table_item}','{$objForm.affichage_table_item}','{$objForm.supplogique_table_item}', '{$objForm.tabfiltre_autocomplete}',this.value,'id_form_{$objForm.nom_variable}');">
											</div>
										</div>		
										{/if}
										<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
						                    </label>
					                        <div class="col-sm-6 controls">
												{if isset($objForm.select2) and $objForm.select2 eq 'ok'}
													<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

													<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
													<div class="col-sm-12 input-group" id="id_selectmotif">
														<select
														id="id_form_{$objForm.nom_variable}"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if} js-example-basic-multiple" 
																											name="{$objForm.nom_variable}{if isset($objForm.multiple)}[]{/if}"
														{if isset($objForm.multiple)}multiple{/if}
														{$objForm.fonction_javascript}
														>
														{if !isset($objForm.enlever_premier_vide) or $objForm.enlever_premier_vide eq ''}<option value="" {if $objForm.valeur_variable eq ''}selected{/if}></option>{/if}
														{if is_array($objForm.lesitem)}
															{foreach from=$objForm.lesitem key=id_valeur_possible item=valeur_possible_bdd}
																<option value="{$id_valeur_possible}" {if $objForm.valeur_variable eq $id_valeur_possible}selected{/if}>
																	{$valeur_possible_bdd}
																</option>
															{/foreach}
														{/if}
														</select>
													</div>
												{else}
												<div class="col-sm-12 input-group" id="id_selectmotif">
														<select
														id="id_form_{$objForm.nom_variable}"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}" 
														
														name="{$objForm.nom_variable}{if isset($objForm.multiple)}[]{/if}"
														{if isset($objForm.multiple)}multiple{/if}
														{$objForm.fonction_javascript}
														>
														{if !isset($objForm.enlever_premier_vide) or $objForm.enlever_premier_vide eq ''}<option value="" {if $objForm.valeur_variable eq ''}selected{/if}></option>{/if}
														{if is_array($objForm.lesitem)}
															{foreach from=$objForm.lesitem key=id_valeur_possible item=valeur_possible_bdd}
																<option value="{$id_valeur_possible}" {if $objForm.valeur_variable eq $id_valeur_possible}selected{/if}>
																	{$valeur_possible_bdd}
																</option>
															{/foreach}
														{/if}
														</select>
													</div>
												{/if}
												{literal}
													<script> 
													// In your Javascript (external .js resource or <script> tag)
														$(document).ready(function() {
															$('.js-example-basic-multiple').select2();
															$('.tooltipPicto').tooltip({
																position: {my: "left+15 center", at: "right center"},
																tooltipClass: 'informationTooltip'
															})
															const actualInformations = {/literal}{$associatedConsigns|@json_encode nofilter}{literal};
															if(actualInformations){
																$('#visible_lieu').val(actualInformations.visibilities)
																actualInformations.consigns.forEach((consign) => {
																	addNewConsigneBloc(consign)
																})
																
															}
														});
													</script>
												{/literal}
					                        </div>
				                      	</div>

				                    {elseif $objForm.type_champ eq 'selectmultiple'}

				                    <div class="form-group">
				                        <label class="col-sm-2 control-label">{$objForm.text_label}
					                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            {if $bActivtraduction=='Yes'}
												&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                            {/if}
					                    </label>
				                        <div class="col-sm-6 controls">
				                          	<select
				                          	id="id_form_{$objForm.nom_variable}"
				                          	class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}" 
											name="{$objForm.nom_variable}[]"
											multiple="multiple"
											size="{$objForm.size_champ}"

                							{$objForm.fonction_javascript}
											>
												<option value="" ></option>
												{if is_array($objForm.lesitem)}
												{foreach from=$objForm.lesitem key=id_valeur_possible item=valeur_possible_bdd}
													<option value="{$id_valeur_possible}" {if is_array($objForm.valeur_variable) and in_array($id_valeur_possible, $objForm.valeur_variable)}selected="selected"{/if}>
														{$valeur_possible_bdd}
													</option>
												{/foreach}
												{/if}
											</select>
				                        </div>
			                      	</div>
									{elseif $objForm.type_champ eq 'hidden'}
										<div class="form-group">
											<input
												type="hidden"
												{if isset($objForm.nom_variable)}name="{$objForm.nom_variable}"  id="id_{$objForm.nom_variable}"{/if}
												{if isset($objForm.valeur_variable)}value="{$objForm.valeur_variable}"{/if}
											>
										</div>
									{elseif $objForm.type_champ eq 'number'}
										<div class="form-group">
											<label class="col-sm-2 control-label" for="id_{$objForm.nom_variable}">{$objForm.text_label}</label>
											<div class="col-sm-1 controls">
												<input type="number" min="0" step="1"
													   {if isset($objForm.nom_variable)}name="{$objForm.nom_variable}"  id="id_{$objForm.nom_variable}"{/if}
														{if isset($objForm.valeur_variable)}value="{$objForm.valeur_variable}"{/if}
												>
											</div>
										</div>
				                    {elseif $objForm.type_champ eq 'textarea'}
				                    	<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
						                    </label>
					                        <div class="col-sm-6 controls">
					                          	<textarea
													id="id_{$objForm.nom_variable}"
													name="{$objForm.nom_variable}"
													rows="3"
													class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}" 
													{if isset($objForm.wysiwyg) and $objForm.wysiwyg eq 'ok'} data-rel="ckeditor" {/if}
													{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
													{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
													{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
														{foreach from=$objForm.tableau_attribut key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
														{foreach from=$objForm.fonction_javascript key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
												>{$objForm.valeur_variable}</textarea>
												

					                        </div>
					                    </div>
					                    {if isset($objForm.wysiwyg) and $objForm.wysiwyg eq 'ok'}
					                    {literal}
					                    <script type="text/javascript">            
										    CKEDITOR.replace(
										    	{/literal}id_{$objForm.nom_variable}{literal},
										    	{toolbar :[
													{ 
														name: 'clipboard', 
														items : [ 'Bold','Italic','Underline','Strike','-','Cut','Copy','PasteText','-','Undo','Redo', '-','NumberedList','BulletedList','-','Scayt' ]
													},
													{ 
														name: 'styles', 
														items: [ 'FontSize' ] 
													},
													{
														name: 'colors', 
														items : [ 'TextColor', 'BGColor' ] 
													},
													{
														name: 'align', 
														items : [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] 
													},
                                                    {
                                                        name: 'links',
														items: [ 'Link', 'Unlink' ]
													}

												]});
										</script>
					                    {/literal}
					                    {/if}
					                {elseif $objForm.type_champ eq 'category'}
										{if isset($objForm.style) and $objForm.style eq 'line'}
											<hr style='margin:0 50px; border-color: #888888; margin-bottom: 15px;' >
										{elseif isset($objForm.style) and $objForm.style eq 'consigne'}
											<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

											<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
											<div id='bloc-consigne'>
												
											</div>
											<div class='form-group'> 
												<div class='col-sm-2'></div>
												<div class='col-sm-6'>
													<button class='btn vd_white btn_dark_blue lightgray_disabled_btn' type='button' id="addNewConsign" onclick='addNewConsigneBloc()'>Ajouter une alerte</button>
												</div>
											</div>
											<style>
												.informationTooltip{
													background-color: #134058;
													color: white;
													opacity: 1;
													width: 200px;
												}
											</style>
											<script type='text/javascript'>
												const visibilities = {$visibilities|@json_encode nofilter};
												{literal}
												let allConsigneBlocs = [];
												let removedBlocs = [];
												const actualInformations = {/literal}{$associatedConsigns|@json_encode nofilter}{literal};

												if(!actualInformations || actualInformations.consigns.length === 0){
													addNewConsigneBloc();
												}
												function addNewConsigneBloc(values = undefined){											
													const consigneBlocs = $('#bloc-consigne');
													let nbBloc = consigneBlocs.children().length;
													if(removedBlocs.length > 0){
														nbBloc = removedBlocs.shift();
													}
													const htmlBloc = getHtmlConsigne(nbBloc, values);
													consigneBlocs.append(htmlBloc);
													allConsigneBlocs.push(htmlBloc);
													if(!values){
														$("#addNewConsign").prop('disabled', true);
													}
												}

												function removeConsigneBloc(elem,id){
													const elemIndex = allConsigneBlocs.indexOf(elem)
													allConsigneBlocs.splice(elemIndex,1)
													elem.remove()
													if(id < allConsigneBlocs.length){
														removedBlocs.push(id);
													}
													checkLastConsign();
												}

												function checkLastConsign(){
													const lastVisibilityField = $($(allConsigneBlocs[allConsigneBlocs.length-1]).find(".activate_on_consigne")[0])
													$("#addNewConsign").prop('disabled', !(lastVisibilityField.val().length > 0));
												}

												function checkAllVisibilities(){
													let visibilityProblem = false;
													allConsigneBlocs.forEach((elem) => {
														const visibilityField = $($(elem).find(".activate_on_consigne")[0]);
														if(visibilityField.val().length === 0){
															visibilityProblem = true;
														}
													})

													if(allConsigneBlocs.length > 1 && visibilityProblem){
														showInfoConfigModal("Attention",
														"Une ou plusieurs alertes ne sont pas active et ne seront donc pas sauvegardées.",
														() => {
															$("#formLocationConfiguration").submit()
														})
													}else{
														$("#formLocationConfiguration").submit();
													}
												}

												function getHtmlConsigne(id,values = undefined){
													let consigneBloc = document.createElement('div');
													if(id > 0){
														const lineElement = document.createElement('hr');
														lineElement.setAttribute('style','border-color:#888888; margin: 20px 17%;')
														consigneBloc.append(lineElement)
													}		
													let blocId = 'blocConsigne_'+id;
													consigneBloc.setAttribute('id', blocId)
													let fieldId = "id_form_activate_on_consigne_"+id;
													let selectField = document.createElement('select');
													const allOption = document.createElement('option');
													allOption.setAttribute('value',0);
													allOption.textContent = 'Tous'
													selectField.append(allOption);
													visibilities.forEach((visi) => {
														const optionToAdd = document.createElement('option');
														optionToAdd.setAttribute('value',visi.id_visibilite);
														optionToAdd.textContent = visi.libelle
														selectField.append(optionToAdd);
													})
													selectField.setAttribute('id',fieldId);
													selectField.setAttribute('class','form-control js-example-basic-multiple activate_on_consigne')
													selectField.setAttribute('name',`consignes[${id}][activateOn][]`)
													selectField.setAttribute('multiple','multiple')
													
													
													const selectFieldLine = getFormGroupElement('Active sur', selectField)
													let closeCrossDiv = document.createElement('div');
													closeCrossDiv.setAttribute('class', 'col-sm-2 ');
													closeCrossDiv.setAttribute('style', 'text-align:end;');

													let closeCross = document.createElement('i');
													closeCross.setAttribute('class','icon-cross closeCrossConsigne');
													closeCross.setAttribute('style','color:#C50000; font-size: 30px; cursor: pointer; display:' + (id>0?'block':'none'));
													
													closeCrossDiv.append(closeCross);
													selectFieldLine.append(closeCrossDiv);
													closeCross.onclick = function(){
														removeConsigneBloc(consigneBloc,id)
													}

													let selectInput = $(selectField);
													selectInput.select2({width:'100%'})
													selectInput.select2("val",null)
													selectInput.val(values ? values.visibilities : null).trigger("change");
													selectInput.on('select2:selecting',(ev) => {
														let selectedId = ev.params.args.data.id;
														if(selectedId === '0'){
															selectInput.val(['0']);
														}else if(selectInput.val().includes('0')){
															selectInput.val([selectedId])
														}
													})
													selectInput.on('change',(ev) => {
														if(allConsigneBlocs[allConsigneBlocs.length-1].id === blocId){
															$("#addNewConsign").prop('disabled', !(selectInput.val().length > 0));
														}
													})

													let radioButtons = [
														{id: 'appearsBefore', value:0, libelle:'Avant le choix du créneau'},
														{id: 'appearsAfter', value:1, libelle:'Après le choix du créneau'},
													]
													let defaultRadioChecked = radioButtons[0].value;
													if(values){
														const elemFound = radioButtons.find((elem) => {
															return elem.value == values.appearsAfter
														})
														if(elemFound != -1){
															defaultRadioChecked = elemFound.value;
														}
													}
													let elemAppearingType = getRadioButtons(id, "appearsAfter", radioButtons,defaultRadioChecked);
													const inputRadio = elemAppearingType.querySelectorAll('input');
													const radioButtonsTooltipText = {
														"0" : "Période relative à la date de la prise de rendez-vous",
														"1" : "Période relative à la date du créneau sélectionné"
													}
													
													let tooltipAppearsOnId = 'tooltip_appearsOn'+id; 
													consigneBloc.append(selectFieldLine)
													consigneBloc.append(getFormGroupElement('Faire apparaître', elemAppearingType, tooltipAppearsOnId, 'Sur la prise de rendez-vous par internet'))

													let startDate = undefined;
													let endDate = undefined;
													if(values){
														const startMoment = moment(values.startDate);
														
														if(startMoment.isValid()){
															startDate = startMoment.toISOString();
														}

														const endMoment = moment(values.endDate);
														
														if(endMoment.isValid()){
															endDate = endMoment.toISOString();
														}
													}else{
														startDate = moment().toISOString();
													}
													let startInput = getDateInput('Début','startPeriod', id, new Date(), endDate, startDate);
													let endInput = getDateInput('Fin','endPeriod',id, new Date(startDate),undefined, endDate);
													
													let startInputTag = startInput.querySelector('input')
													let endInputTag = endInput.querySelector('input')
													$(startInputTag).on('change', (e) => {
														const parsedDate = moment(e.target.value,'DD/MM/YYYY').toDate()
														$(endInputTag).datepicker( "option", "minDate", new Date(parsedDate) );
													})

													$(endInputTag).on('change', (e) => {
														const parsedDate = moment(e.target.value,'DD/MM/YYYY').toDate()
														const parsedDateObject = new Date(parsedDate);
														$(startInputTag).datepicker( "option", "maxDate", parsedDateObject );
														if(startInputTag.value === ''){
															startInputTag.value = moment().format('DD/MM/YYYY');
														}
													})

													let periodInputs = document.createElement('div');
													periodInputs.append(startInput);
													periodInputs.append(endInput);

													const periodTooltipId = "period_tooltip"+id;
													consigneBloc.append(getFormGroupElement('Période', periodInputs, periodTooltipId, radioButtonsTooltipText[defaultRadioChecked]))

													$(inputRadio).on('change', (e) => {
														const value = e.target.value;
														$('#'+periodTooltipId).prop('title',radioButtonsTooltipText[value]);
													})
													return consigneBloc;
												}

												function getDateInput(libelle, name, id, minDate = undefined, maxDate = undefined, defaultValue = undefined){
													let resultInput = document.createElement('div')
													resultInput.setAttribute('class','input-group')
													resultInput.setAttribute('style','margin-bottom:10px;')
													let inputDateElem = document.createElement('input');
													inputDateElem.setAttribute('type', 'text');
													inputDateElem.setAttribute('placeholder', libelle);
													inputDateElem.setAttribute('id', name+id);
													inputDateElem.setAttribute('name', `consignes[${id}][${name}]`);
													if(defaultValue){
														const dateDefault = moment(defaultValue);
														if(dateDefault.isValid()){
															inputDateElem.setAttribute('value', dateDefault.format('DD/MM/YYYY'))
														}
													}
													const inputDateJQuery = $(inputDateElem)
												 	inputDateJQuery.datepicker(
													{
														dateFormat: 'dd/mm/yy',
														changeMonth: true,
														changeYear: true,
														minDate: minDate,
														maxDate: maxDate
													});

													let pictoCalendar = document.createElement('span');
													pictoCalendar.setAttribute('class','input-group-addon');
													pictoCalendar.innerHTML = '<i class="fa fa-calendar"></i>'
													$(pictoCalendar).click(function(e){
														inputDateJQuery.focus();
													})
													resultInput.append(inputDateElem)
													resultInput.append(pictoCalendar)
													return resultInput;
												}

												function getRadioButtons(id,name,buttons,indexChecked){
													let resultDiv = document.createElement('div');
													resultDiv.setAttribute('class','vd_radio radio-success')
													buttons.forEach((button) => {
														let radioButton = document.createElement('input');
														radioButton.setAttribute('type','radio');
														radioButton.setAttribute('name', `consignes[${id}][${name}]`);
														radioButton.setAttribute('id',button.id + id);
														radioButton.setAttribute('value',button.value);
														radioButton.setAttribute('required',true);
														if(button.value === indexChecked){
															radioButton.setAttribute('checked','checked')
														}

														let labelButton = document.createElement('label');
														labelButton.setAttribute('for',button.id + id);
														labelButton.innerHTML = button.libelle;

														resultDiv.append(radioButton,labelButton);
													})

													return resultDiv;
												}

												function getFormGroupElement(label,childToAdd, tooltipId = undefined, tooltipText = undefined){
													let resultElement = document.createElement('div')
													resultElement.setAttribute('class','form-group');

													let labelElement = document.createElement('label');
													labelElement.setAttribute('class', 'col-sm-2 control-label');
													labelElement.innerHTML = `<span>${label}</span>`;

													if(tooltipId){
														let tooltipElement = document.createElement('i');
														tooltipElement.setAttribute('class', 'fa fa-info-circle');
														tooltipElement.setAttribute('id', tooltipId);
														tooltipElement.setAttribute('title', tooltipText);
														tooltipElement.setAttribute('style', 'color:#134058; margin-left:5px; font-size:20px; vertical-align: middle');
														$(tooltipElement).tooltip({
															position: {my: "left+15 center", at: "right center"},
															tooltipClass: 'informationTooltip'
														})
														labelElement.append(tooltipElement)
													}

													let bodyElement = document.createElement('div');
													bodyElement.setAttribute('class', 'col-sm-6 controls');
													bodyElement.innerHTML = `
													<div class="col-sm-12 input-group" id="id_selectmotif">
																
													</div>`
													
													resultElement.append(labelElement)
													resultElement.append(bodyElement)

													resultElement.querySelector('.input-group').append(childToAdd)
													
													return resultElement
												}
												{/literal}
											</script>
										{else}
											<br/><h3 class="mgbt-xs-15">{$objForm.text_label}</h3>
										{/if}

									{elseif $objForm.type_champ eq 'date'}
										<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
						                    </label>
					                        <div class="col-sm-3 controls">
					                          	<div class="input-group">
					                            	<input 
					                            		type="text"
					                            		class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}" 
					                            		placeholder="{$objForm.text_label}"
					                            		id="id_{$objForm.nom_variable}"
														name="{$objForm.nom_variable}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
					                            	>
													<span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$objForm.nom_variable}">
														<i class="fa fa-calendar"></i>
													</span>
					                            </div>
					                        </div>
					                    </div>
					                    {literal}
											<script type="text/javascript" src="js/datepicker-fr.js"></script>
					                    	<script type="text/javascript">
												$(document).ready(function() {
													$( "{/literal}#id_{$objForm.nom_variable}{literal}" ).datepicker(
														{
															dateFormat: 'dd/mm/yy',
															changeMonth: true,
															changeYear: true,
															yearRange: '{/literal}-{$objForm.AnneeDebut}:+{$objForm.AnneeFin}{literal}',
														});
													$( '[data-datepicker]' ).click(function(e){
														var data=$(this).data('datepicker');
														$(data).focus();
													});
												});
											</script>
										{/literal}
									{elseif $objForm.type_champ eq 'password'}
										<div class="form-group">
						                    <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
						                    </label>
						                    <div class="controls col-sm-6" id="password-input-wrapper">
						                        <input
													type="password"
													class="width-40 {if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
													placeholder="{$objForm.text_label}"
													id="id_{$objForm.nom_variable}"
													name="{$objForm.nom_variable}"
													{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
													{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
													{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
													{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
														{foreach from=$objForm.tableau_attribut key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
														{foreach from=$objForm.fonction_javascript key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
												>
						                    </div>
						                </div>
						            {elseif $objForm.type_champ eq 'radio'}
						            	<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
						                    </label>
					                        <div class="col-sm-6 controls">
					                          	<div class="vd_radio radio-success">
					                          		{foreach from=$objForm.lesitem key=valeur_radio item=nom_radio name=nom_radio}
						                            	<input 
						                            		type="radio" 
						                            		class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}"
						                            		name="{$objForm.nom_variable}" 
						                            		id="id_{$objForm.nom_variable}_{$smarty.foreach.nom_radio.iteration}" 
						                            		value="{$valeur_radio}" 
															{if $valeur_radio eq $objForm.valeur_variable}checked{/if}
															{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
															{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
																{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																	{$cle}="{$valeur}"
																{/foreach}
															{/if}
						                            	>
						                            	<label  for="id_{$objForm.nom_variable}_{$smarty.foreach.nom_radio.iteration}">{$nom_radio}</label>
					                            	{/foreach} 
					                          	</div>
					                        </div>
					                   	</div>

					                {elseif $objForm.type_champ eq 'checkbox'}
					                	<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
						                    	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
												{if isset($objForm.tooltipText)}
													<i class='fa fa-info-circle tooltipPicto' title="{$objForm.tooltipText}" style="color:#134058; margin-left:5px; font-size:20px; vertical-align: middle"></i>
												{/if}
						                    </label>

					                        <div class="col-sm-6 controls">
					                          	<div class="vd_checkbox checkbox-success">

													{if isset($objForm.select2) and $objForm.select2 eq 'ok'}
														<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
														

														<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
														<div class="col-sm-12 input-group" id="id_selectmotif">
															<select name="{$objForm.nom_variable}[]" id="{$objForm.nom_variable}" class="js-example-basic-multiple"  multiple="multiple" style="width: 100%;">
																{foreach from=$objForm.lesitem key=valeur_checkbox item=nom_checkbox}
																	<option value="{$valeur_checkbox}" {if is_array($objForm.valeur_variable) and in_array($valeur_checkbox, $objForm.valeur_variable)}selected="selected"{/if}>{$nom_checkbox}</option>
																{/foreach}
															</select>
														</div>

														{if isset($objForm.allField) and $objForm.allField eq 'ok'}
															<script type="text/javascript">
																
																let selectId = "{$objForm.nom_variable}"
																let selectInput = $('#'+selectId);
																selectInput.on('select2:selecting',(ev) => {
																	let selectedId = ev.params.args.data.id;
																	let selectValues = selectInput.val();
																	if(selectedId === '0'){
																		selectInput.val(['0']);
																	}else if(selectInput.val().includes('0')){
																		selectInput.val([selectedId])
																	}
																})
		
															</script>
														{/if}
													{else}

														{if isset($objForm.check_all) and $objForm.check_all eq 'ok'}
														<input
																type="checkbox"
																class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}"
																name="id_checkAll_{$objForm.class_check_all}"
																value=""
																id="id_checkAll_{$objForm.class_check_all}"
																{if isset($objForm.valeur_check_all) and $objForm.valeur_check_all eq 'ok'} checked {/if}
														>
														<label for="id_checkAll_{$objForm.class_check_all}"> Tous </label>
														{/if}
														{foreach from=$objForm.lesitem key=valeur_checkbox item=nom_checkbox}

																<input
																	type="checkbox"
																	class="{if isset($objForm.check_all) and $objForm.check_all eq 'ok'}class_{$objForm.class_check_all}{/if} {if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}"
																	name="{$objForm.nom_variable}[]"
																	value="{$valeur_checkbox}"
																	id="id{$objForm.nom_variable}_{$valeur_checkbox}"
																	{if is_array($objForm.valeur_variable) and in_array($valeur_checkbox, $objForm.valeur_variable)}checked{/if}
																	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}
																>
																<label for="id{$objForm.nom_variable}_{$valeur_checkbox}"> {$nom_checkbox} </label>
														{/foreach}
													{/if}
					                          	</div>
												<style>
													#id_selectmotif span {
														border-color: #D5D5D5;
														border-radius: 0px;
													}
												</style>
												{* Script pour lister les motifs séléctionné *}
												<script> 
												// In your Javascript (external .js resource or <script> tag)
													$(document).ready(function() {
														$('.js-example-basic-multiple').select2();
													});
												</script>

												{if isset($objForm.check_all) and $objForm.check_all eq 'ok'}
												{literal}
													<script type="text/javascript">
														$(function () {
															$("#id_checkAll_{/literal}{$objForm.class_check_all}{literal}").click(function () {
																if ($("#id_checkAll_{/literal}{$objForm.class_check_all}{literal}").is(':checked')) {
																	//$("input[type=checkbox]").each(function () {
																	$(".class_{/literal}{$objForm.class_check_all}{literal}").each(function () {
																		$(this).prop("checked", true);
																	});

																} else {
																	//$("input[type=checkbox]").each(function () {
																	$(".class_{/literal}{$objForm.class_check_all}{literal}").each(function () {
																		$(this).prop("checked", false);
																	});
																}
															});

														});

													</script>
												{/literal}
												{/if}
					                        </div>
					                    </div>
								{elseif $objForm.type_champ eq 'checkboxII'}
							<div class="form-group">
								<label class="col-sm-2 control-label">{$objForm.text_label}
									{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
									{if $bActivtraduction=='Yes'}
										&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
									{/if}
								</label>
								<div class="col-sm-6 controls">
									<div class="vd_checkbox checkbox-success">
										{if isset($objForm.check_all) and $objForm.check_all eq 'ok'}
											<input
													type="checkbox"
													class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}"
													name="id_checkAll_{$objForm.class_check_all}"
													value=""
													id="id_checkAll_{$objForm.class_check_all}"
													{if isset($objForm.valeur_check_all) and $objForm.valeur_check_all eq 'ok'} checked {/if}
											>
											<label for="id_checkAll_{$objForm.class_check_all}"> Tous </label>
										{/if}
										{foreach from=$objForm.lesitem key=valeur_checkbox item=nom_checkbox}
											{if $valeur_checkbox eq 'zf14' }
												<br>{$nom_checkbox}<br>
											{else}
												<input
														type="checkbox"
														class="{if isset($objForm.check_all) and $objForm.check_all eq 'ok'}class_{$objForm.class_check_all}{/if} {if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}"
														name="{$objForm.nom_variable}[]"
														value="{$valeur_checkbox}"
														id="id{$objForm.nom_variable}_{$valeur_checkbox}"
														{if is_array($objForm.valeur_variable) and in_array($valeur_checkbox, $objForm.valeur_variable)}checked{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}  {/if}
												>
												<label for="id{$objForm.nom_variable}_{$valeur_checkbox}"> {$nom_checkbox} </label>
											{/if}

										{/foreach}
									</div>
									{if isset($objForm.check_all) and $objForm.check_all eq 'ok'}
									{literal}
										<script type="text/javascript">
											$(function () {
												$("#id_checkAll_{/literal}{$objForm.class_check_all}{literal}").click(function () {
													if ($("#id_checkAll_{/literal}{$objForm.class_check_all}{literal}").is(':checked')) {
														//$("input[type=checkbox]").each(function () {
														$(".class_{/literal}{$objForm.class_check_all}{literal}").each(function () {
															$(this).prop("checked", true);
														});

													} else {
														//$("input[type=checkbox]").each(function () {
														$(".class_{/literal}{$objForm.class_check_all}{literal}").each(function () {
															$(this).prop("checked", false);
														});
													}
												});

											});

										</script>
									{/literal}
									{/if}
								</div>
							</div>
					                {elseif $objForm.type_champ eq 'email'}
						                <div class="form-group">
					                      	<label class="col-sm-2 control-label">{$objForm.text_label}
							                   	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
							                </label>
					                      	<div id="email-input-wrapper" class="controls col-sm-6">
					                        	<input
														type="email"
														placeholder="{$objForm.text_label}"
														class="{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}"
														id="id_{$objForm.nom_variable}"
														name="{$objForm.nom_variable}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													>
					                      	</div>
						                </div>
									{elseif $objForm.type_champ eq 'color'}
										<div class="form-group">
					                        <label class="col-sm-2 control-label">{$objForm.text_label}
					                        	{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
					                        </label>
					                        <div class="col-sm-1 controls">
					                          	<div class="input-group">
						                            <input 
						                            	type="text" 
						                            	placeholder="{$objForm.text_label}" 
						                            	id="id_{$objForm.nom_variable}"
						                            	name="{$objForm.nom_variable}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
						                            >
						                            <span class="input-group-addon color-input vd_hover" {if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}style="color:{$objForm.valeur_variable}"{/if}><i class="fa fa-square"></i></span>
					                        	</div>
					                        </div>
					                    </div>
										{literal}
											<script type="text/javascript">
												$("{/literal}#id_{$objForm.nom_variable}{literal}").ColorPicker({
													color: '#000000',
													onSubmit: function(hsb, hex, rgb, el) {
														$(el).val(hex);
														$(el).ColorPickerHide();
													},
													onBeforeShow: function () {
														$(this).ColorPickerSetColor(this.value);
													},
													onChange: function (hsb, hex, rgb) {
														$("{/literal}#id_{$objForm.nom_variable}{literal}").val('#' + hex);
														$("{/literal}#id_{$objForm.nom_variable}{literal}").siblings().css({'color' : '#' + hex});
													}			
												})
												.bind('keyup', function(){
													$(this).ColorPickerSetColor(this.value);
												}).siblings().click(function(e){ 
													$(this).siblings().click();
												});	
											</script>
										{/literal}

									{elseif $objForm.type_champ eq 'time'}
										<div class="form-group">
					                        <label class="col-sm-2 control-label">Default TimePicker</label>
					                        <div class="col-sm-3 controls">
					                          	<div class="input-group bootstrap-timepicker">
					                            	<input 
					                            		type="text" 
					                            		placeholder="{$objForm.text_label}" 
						                            	id="id_{$objForm.nom_variable}"
						                            	name="{$objForm.nom_variable}"
														{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{$objForm.valeur_variable}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
														{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
														{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
															{foreach from=$objForm.tableau_attribut key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
															{foreach from=$objForm.fonction_javascript key=cle item=valeur}
																{$cle}="{$valeur}"
															{/foreach}
														{/if}
														{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
					                            	>
					                            	<span class="input-group-addon" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span> 
					                            </div>
					                        </div>
					                    </div>
					                    {literal}
					                    	<script type="text/javascript">
												$("{/literal}#id_{$objForm.nom_variable}{literal}").timepicker({
													showSeconds:false,
													showMeridian:false,
													minuteStep:15
												});
											</script>
										{/literal}

									{elseif $objForm.type_champ eq 'heure'}
										<div class="form-group">
											<label class="col-sm-2 control-label">{$objForm.text_label}
												{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
											</label>
											<div class="col-sm-2 controls">
												<div class="input-group clockpicker">
													<input
															type="text"
															placeholder="{$objForm.text_label}"
															id="id_{$objForm.nom_variable}"
															name="{$objForm.nom_variable}"
															{if isset($objForm.valeur_variable) and $objForm.valeur_variable neq ''}value="{if {$objForm.valeur_variable|count_characters}>5 } {$objForm.valeur_variable|truncate:5:""}{else}{$objForm.valeur_variable}{/if}"{/if}
														{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
															{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
													{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
														{foreach from=$objForm.tableau_attribut key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
														{foreach from=$objForm.fonction_javascript key=cle item=valeur}
															{$cle}="{$valeur}"
														{/foreach}
													{/if}
													{if isset($objForm.ctrl_champ) and $objForm.ctrl_champ eq 'ok'} required {/if}
													>
													<span class="input-group-addon" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
												</div>
											</div>
										</div>
									{literal}
										<script type="text/javascript">
											$("{/literal}#id_{$objForm.nom_variable}{literal}").clockpicker({
												placement: 'bottom',
												autoclose: true
											});
										</script>
									{/literal}
									{elseif $objForm.type_champ eq 'file'}
										<div class="form-group">
											<label class="col-sm-2 control-label">{$objForm.text_label}
                                                {if $bActivtraduction=='Yes'}
													&nbsp;<a href="#" onclick="renvoi_info_traduction('{$objForm.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objForm.text_label|replace:'\'':'\\\''}','{$sNomTable}','{$objForm.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                                {/if}
											</label>
					                        <div class="col-sm-6 controls">
												{if $objForm.valeur_variable !=""}
													<div class="form-img text-center mgbt-xs-15">
														{if $objForm.type_fichier == ""}
															<img
															src="{$objForm.file_visu}{$objForm.valeur_variable}"
															style="display:inline-block;vertical-align:middle;"
															{if isset($objForm.file_aff_modif_form_taille)}width="{$objForm.file_aff_modif_form_taille}"{/if}
															>
														{elseif $objForm.type_fichier == "pdf"}
															<a href="{$objForm.file_visu}{$objForm.valeur_variable}" target="_blank">
																<img src="img/picto_pdf.jpg" style="display:inline-block;vertical-align:middle;" width="40px">
																<br />{$objForm.valeur_variable}
															</a>
														{/if}
														{if isset($objForm.activ_supimmage) and $objForm.activ_supimmage neq ''}
															<br/><a class="vd_bg-green vd_white mgr-10 btn vd_round-btn btn-xs" role="button" 
														 	onclick="bconf=confirm('Voulez vous vraiment supprimer ce fichier ?');if(bconf)location.replace('main.php?dir={$dir}&{$objForm.link_supimmage}')"><i class="fa fa-trash-o"></i></a>
														 {/if}
													</div>
												{/if}
												<input
												type="file"
												{if isset($objForm.forcer_image) and $objForm.forcer_image}accept=".png, .jpg"{/if}
												id="id_{$objForm.nom_variable}"
												name="{$objForm.nom_variable}"
												{if isset($objForm.size_champ) and $objForm.size_champ neq ''}size="{$objForm.size_champ}"{/if}
												{if isset($objForm.style) and $objForm.style neq ''}style="{$objForm.style}"{/if}
												{if isset($objForm.tableau_attribut) and $objForm.tableau_attribut|is_array}
												{foreach from=$objForm.tableau_attribut key=cle item=valeur}
												{$cle}="{$valeur}"
												{/foreach}
												{/if}
												{if isset($objForm.fonction_javascript) and $objForm.fonction_javascript|is_array}
												{foreach from=$objForm.fonction_javascript key=cle item=valeur}
												{$cle}="{$valeur}"
												{/foreach}
												{/if}
												>
											</div>
										</div>
									{elseif $objForm.type_champ eq 'modifpassword'}
									<div class="form-group">
					                  <label class="col-sm-2 control-label">Mot de passe</label>
					                  <div class="controls col-sm-6">
					                        <a href='{$objForm.injection_code}'><button class="btn btn-primary" type="button">Modifier votre mot de passe</button></a>
					                  </div>
					                </div>
									{/if}
								{/if}
							{/foreach}	

							{if isset($itemBoutonsForm) and $itemBoutonsForm|is_array and $itemBoutonsForm|@count > 0}
								<div class="form-group form-actions">
			                        <div class="col-sm-2"> </div>
			                        <div class="col-sm-6">
										{if isset($itemBoutonsForm.annuler) and $bAffAnnuler}
										<a href="{$itemBoutonsForm.annuler.url}&pagesimple={$pagesimple}">
											<button
												type="button"
												class="btn vd_btn vd_bg-grey"
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
										{if isset($itemBoutonsForm.valider)}
											<button
												id="locationConfigurationValidate"
												type="submit"
												class="btn vd_btn vd_bg-green vd_white"
												onclick="{literal}this.disabled=true;checkAllVisibilities();{/literal}"
												
											><i class="icon-ok"></i> {$itemBoutonsForm.valider.text_label}</button>
										{/if}
			                        
			                        	{if isset($itemBoutonsForm.precedent)}
										<a class="btn vd_btn prev" href="{$itemBoutonsForm.precedent.url}&pagesimple={$pagesimple}">
											<span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-left"></i></span>
											{$itemBoutonsForm.precedent.text_label}
										</a>
										{/if}
										{if isset($itemBoutonsForm.suivant)}
										<button
											type="submit"
											class="btn vd_btn next"
											id="id_{$itemBoutonsForm.suivant.nom_variable}"
											name="{$itemBoutonsForm.suivant.nom_variable}"
											value="{$itemBoutonsForm.suivant.text_label}"
											{if isset($itemBoutonsForm.suivant.style) and $itemBoutonsForm.suivant.style neq ''}style="{$itemBoutonsForm.suivant.style}"{/if}
											{if isset($itemBoutonsForm.suivant.tableau_attribut) and $itemBoutonsForm.suivant.tableau_attribut|is_array}
												{foreach from=$itemBoutonsForm.suivant.tableau_attribut key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
											{if isset($itemBoutonsForm.suivant.fonction_javascript) and $itemBoutonsForm.suivant.fonction_javascript|is_array}
												{foreach from=$itemBoutonsForm.suivant.fonction_javascript key=cle item=valeur}
													{$cle}="{$valeur}"
												{/foreach}
											{/if}
										>{$itemBoutonsForm.suivant.text_label}<span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i>
										</span></button>
										{/if}
			                        </div>
		                      	</div>
							{/if}
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
<div class="modal fade in" id="modalInfoConfig" aria-hidden="true">
    <div class="modal-dialog" style="width:40%">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="modalInfoConfigTitle"></h4>
            </div>
            <div class="modal-body" >
                <p id="modalInfoConfigText" style="text-align:center;"></p>
                
                <div style="text-align: center;">
                    <button id="modalInfoConfigCancel" type="button" class="btn vd_bg-white vd_bd-blue vd_blue" data-dismiss="modal" ><b>Annuler</b></button>
                    <button id="modalInfoConfigValidate" type="button" class="btn vd_bg-blue vd_white" data-dismiss="modal" ><b>Valider</b></button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showInfoConfigModal(title,message,onSuccess){
            $("#modalInfoConfigTitle").text(title);
            $("#modalInfoConfigText").html(message);
            $("#modalInfoConfig").modal('show');
			$("#modalInfoConfig #modalInfoConfigValidate").on('click', onSuccess)
			$("#modalInfoConfig #modalInfoConfigCancel").on('click', function(){
				$('#locationConfigurationValidate').prop('disabled', false);
			})
        }

        function hideInfoConfigModal(){
            $("#modalInfoConfig").modal('hide');
        }
    </script>
</div>
{/if}


