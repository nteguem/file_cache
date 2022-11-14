
<script type="text/javascript">
  $(document).ready(function() {
    $("#id_tel_mobile_user").mask("99 99 99 99 99");
    $("#id_tel_fixe_user").mask("99 99 99 99 99");
    $("#id_tel_fax_user").mask("99 99 99 99 99");
    $("#id_date_naissance").mask("99/99/9999");

  });

</script>

<div class="vd_title-section clearfix">
  <div class="vd_panel-header">
    <h1>Profil utilisateur</h1>
  </div>
</div>
<div class="vd_content-section clearfix">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget">
        <div class="panel-heading no-title"> </div>
          <form class="form-horizontal" action="{$url_form}" role="form" method="POST" {if isset($bTelechargementFichier) and $bTelechargementFichier}enctype="multipart/form-data"{/if} data-file-upload="options">
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
          <div  class="panel-body">
            <h2 class="mgbt-xs-20"> Profil: <span class="font-semibold">{$aForm[0].valeur_variable} {$aForm[1].valeur_variable}</span> </h2>
            <br/>
            <div class="row">
              <div class="col-sm-3 mgbt-xs-20">
                <h3 class="mgbt-xs-15">Photo de profil</h3>
                <div class="form-group">
                  <div class="col-xs-12" align='center'>
                    <div class="form-img text-center mgbt-xs-15">
                      <img
                        src="{$aForm[3].file_visu}{$aForm[3].valeur_variable}"
                        style="display:inline-block;vertical-align:middle;"
                        {if isset($aForm[3].file_aff_modif_form_taille)}width="{$aForm[3].file_aff_modif_form_taille}"{/if}
                      >
                      </div>
                    <!-- The global progress bar -->
                    
                    <input
                      type="file"
                      id="id_{$aForm[3].nom_variable}"
                      name="{$aForm[3].nom_variable}"
                      {if isset($aForm[3].size_champ) and $aForm[3].size_champ neq ''}size="{$aForm[3].size_champ}"{/if}
                      {if isset($aForm[3].style) and $aForm[3].style neq ''}style="{$aForm[3].style}"{/if}
                      {if isset($aForm[3].tableau_attribut) and $aForm[3].tableau_attribut|is_array}
                        {foreach from=$aForm[3].tableau_attribut key=cle item=valeur}
                          {$cle}="{$valeur}"
                        {/foreach}
                      {/if}
                      {if isset($aForm[3].fonction_javascript) and $aForm[3].fonction_javascript|is_array}
                        {foreach from=$aForm[3].fonction_javascript key=cle item=valeur}
                          {$cle}="{$valeur}"
                        {/foreach}
                      {/if}
                      >
                  </div>
                </div>
              </div>
              <div class="col-sm-9">
                <h3 class="mgbt-xs-15">Information du connexion</h3>
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[2].text_label}
                    {if isset($aForm[2].ctrl_champ) and $aForm[2].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                  <div id="email-input-wrapper" class="controls col-sm-9">
                    <div class="row mgbt-xs-0">
                      <div class="col-xs-9">
                        <input
                          type="email"
                          placeholder="{$aForm[2].text_label}"
                          class="{if isset($aForm[2].ctrl_champ) and $aForm[2].ctrl_champ eq 'ok'} required {/if}"
                          id="id_{$aForm[2].nom_variable}"
                          name="{$aForm[2].nom_variable}"
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
                    </div>
                  </div>
                </div>
                <!-- form-group -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">Mot de passe</label>
                  <div class="controls col-sm-9">
                    <div class="row mgbt-xs-0">
                      <div class="col-xs-9">
                        <button class="btn btn-primary" type="button" onclick="initialise_modif_mdp('{$identifiant_user}');">Modifier votre mot de passe</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- form-group -->

                <hr />
                <h3 class="mgbt-xs-15">Informations utilisateur</h3>
                
                <!-- Genre -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[8].text_label}
                    {if isset($aForm[8].ctrl_champ) and $aForm[8].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                  <div class="col-sm-9 controls">
                    <div class="row mgbt-xs-0">
                      <div class="col-xs-2">
                        <div class="vd_input-wrapper" style="background-color:#fff;">
                          <select
                                  id="id_{$aForm[8].nom_variable}"
                                  name="{$aForm[8].nom_variable}"
                                  required>
                            <option value="">Civilité</option>
                            {foreach from=$aForm[8].lesitem key=id_valeur_possible item=valeur_possible_bdd}
                              <option value="{$id_valeur_possible}" {if $aForm[8].valeur_variable eq $id_valeur_possible}selected{/if}>
                                {$valeur_possible_bdd}
                              </option>
                            {/foreach}
                          </select>
                        </div>
<!--
                        <div class="vd_radio radio-success">
                        {foreach from=$aForm[8].lesitem key=valeur_radio item=nom_radio}
                          <input 
                            type="radio" 
                            class="{if isset($aForm[8].ctrl_champ) and $aForm[8].ctrl_champ eq 'ok'} required {/if}"
                            name="{$aForm[8].nom_variable}" 
                            id="id_{$aForm[8].nom_variable}_{$valeur_radio}" 
                            value="{$valeur_radio}" 
                            {if $valeur_radio eq $aForm[8].valeur_variable}checked{/if}
                            {if isset($aForm[8].ctrl_champ) and $aForm[8].ctrl_champ eq 'ok'} required {/if}
                          >
                          <label  for="id_{$aForm[8].nom_variable}_{$valeur_radio}">{$nom_radio}</label>
                        {/foreach} 
                        </div>
                        -->
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Nom -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[0].text_label}
                    {if isset($aForm[0].ctrl_champ) and $aForm[0].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                    <div class="col-sm-9 controls">
                      <div class="row mgbt-xs-0">
                        <div class="col-xs-9">
                          <input 
                            type="text"
                            id="id_{$aForm[0].nom_variable}"
                            placeholder="{$aForm[0].text_label}"
                            name="{$aForm[0].nom_variable}"
                            class="input-majuscule {if isset($aForm[0].ctrl_champ) and $aForm[0].ctrl_champ eq 'ok'} required {/if}"
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
                      </div>  
                    <span class="help-inline"></span>
                  </div>
                </div>

                <!-- Prénom -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[1].text_label}
                    {if isset($aForm[1].ctrl_champ) and $aForm[1].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                    <div class="col-sm-9 controls">
                      <div class="row mgbt-xs-0">
                        <div class="col-xs-9">
                          <input 
                            type="text"
                            id="id_{$aForm[1].nom_variable}"
                            placeholder="{$aForm[1].text_label}"
                            name="{$aForm[1].nom_variable}"
                            class="input-first-letter {if isset($aForm[1].ctrl_champ) and $aForm[1].ctrl_champ eq 'ok'} required {/if}"
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
                      </div>  
                    <span class="help-inline"></span>
                  </div>
                </div>
                
                <!-- Date de naissance -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[4].text_label}
                    {if isset($aForm[4].ctrl_champ) and $aForm[4].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                    <div class="col-sm-6 controls">
                      <div class="row mgbt-xs-0">
                        <div class="col-xs-6">
                          <div class="input-group">
                            <input 
                              type="text"
                              class="{if isset($aForm[4].ctrl_champ) and $aForm[4].ctrl_champ eq 'ok'} required {/if}" 
                              placeholder="{$aForm[4].text_label}"
                              id="id_{$aForm[4].nom_variable}"
                              name="{$aForm[4].nom_variable}"
                              {if isset($aForm[4].valeur_variable) and $aForm[4].valeur_variable neq ''}value="{$aForm[4].valeur_variable}"{/if}
                              {if isset($aForm[4].size_champ) and $aForm[4].size_champ neq ''}size="{$aForm[4].size_champ}"{/if}
                              {if isset($aForm[4].style) and $aForm[4].style neq ''}style="{$aForm[4].style}"{/if}
                              {if isset($aForm[4].tableau_attribut) and $aForm[4].tableau_attribut|is_array}
                                {foreach from=$aForm[4].tableau_attribut key=cle item=valeur}
                                  {$cle}="{$valeur}"
                                {/foreach}
                              {/if}
                              {if isset($aForm[4].fonction_javascript) and $aForm[4].fonction_javascript|is_array}
                                {foreach from=$aForm[4].fonction_javascript key=cle item=valeur}
                                  {$cle}="{$valeur}"
                                {/foreach}
                              {/if}
                              {if isset($aForm[4].ctrl_champ) and $aForm[4].ctrl_champ eq 'ok'} required {/if}
                            >
                            <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$aForm[4].nom_variable}">
                              <i class="fa fa-calendar"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                {literal}
                  <script type="text/javascript">
                    $(document).ready(function() {
                      $( "{/literal}#id_{$aForm[4].nom_variable}{literal}" ).datepicker({ 
                          dateFormat: 'dd/mm/yy',
                          changeMonth: true,
                          yearRange: "1900:",
                          changeYear: true
                        });
                      
                      $( '[data-datepicker]' ).click(function(e){ 
                        var data=$(this).data('datepicker');
                        $(data).focus();
                      });
                    });
                  </script>
                {/literal}

                <hr/>
                <h3 class="mgbt-xs-15">Informations de contact</h3>
                <!-- Tel Mobile -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[5].text_label}
                    {if isset($aForm[5].ctrl_champ) and $aForm[5].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                    <div class="col-sm-9 controls">
                      <div class="row mgbt-xs-0">
                        <div class="col-xs-9">
                          <input 
                            type="text"
                            id="id_{$aForm[5].nom_variable}"
                            placeholder="{$aForm[5].text_label}"
                            name="{$aForm[5].nom_variable}"
                            class="{if isset($aForm[5].ctrl_champ) and $aForm[5].ctrl_champ eq 'ok'} required {/if}"
                            {if isset($aForm[5].valeur_variable) and $aForm[5].valeur_variable neq ''}value="{$aForm[5].valeur_variable}"{/if}
                            {if isset($aForm[5].size_champ) and $aForm[5].size_champ neq ''}size="{$aForm[5].size_champ}"{/if}
                            {if isset($aForm[5].style) and $aForm[5].style neq ''}style="{$aForm[5].style}"{/if}
                            {if isset($aForm[5].tableau_attribut) and $aForm[5].tableau_attribut|is_array}
                              {foreach from=$aForm[5].tableau_attribut key=cle item=valeur}
                                {$cle}="{$valeur}"
                              {/foreach}
                            {/if}
                            {if isset($aForm[5].fonction_javascript) and $aForm[5].fonction_javascript|is_array}
                              {foreach from=$aForm[5].fonction_javascript key=cle item=valeur}
                                {$cle}="{$valeur}"
                              {/foreach}
                            {/if}
                            {if isset($aForm[5].ctrl_champ) and $aForm[5].ctrl_champ eq 'ok'} required {/if}
                          >
                        </div>
                      </div>  
                    <span class="help-inline"></span>
                  </div>
                </div>

                <!-- Tel Fixe -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[6].text_label}
                    {if isset($aForm[6].ctrl_champ) and $aForm[6].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                    <div class="col-sm-9 controls">
                      <div class="row mgbt-xs-0">
                        <div class="col-xs-9">
                          <input 
                            type="text"
                            id="id_{$aForm[6].nom_variable}"
                            placeholder="{$aForm[6].text_label}"
                            name="{$aForm[6].nom_variable}"
                            class="{if isset($aForm[6].ctrl_champ) and $aForm[6].ctrl_champ eq 'ok'} required {/if}"
                            {if isset($aForm[6].valeur_variable) and $aForm[6].valeur_variable neq ''}value="{$aForm[6].valeur_variable}"{/if}
                            {if isset($aForm[6].size_champ) and $aForm[6].size_champ neq ''}size="{$aForm[6].size_champ}"{/if}
                            {if isset($aForm[6].style) and $aForm[6].style neq ''}style="{$aForm[6].style}"{/if}
                            {if isset($aForm[6].tableau_attribut) and $aForm[6].tableau_attribut|is_array}
                              {foreach from=$aForm[6].tableau_attribut key=cle item=valeur}
                                {$cle}="{$valeur}"
                              {/foreach}
                            {/if}
                            {if isset($aForm[6].fonction_javascript) and $aForm[6].fonction_javascript|is_array}
                              {foreach from=$aForm[6].fonction_javascript key=cle item=valeur}
                                {$cle}="{$valeur}"
                              {/foreach}
                            {/if}
                            {if isset($aForm[6].ctrl_champ) and $aForm[6].ctrl_champ eq 'ok'} required {/if}
                          >
                        </div>
                      </div>  
                    <span class="help-inline"></span>
                  </div>
                </div>

                <!-- Fax -->
                <div class="form-group">
                  <label class="col-sm-3 control-label">{$aForm[7].text_label}
                    {if isset($aForm[7].ctrl_champ) and $aForm[7].ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                  </label>
                    <div class="col-sm-9 controls">
                      <div class="row mgbt-xs-0">
                        <div class="col-xs-9">
                          <input 
                            type="text"
                            id="id_{$aForm[7].nom_variable}"
                            placeholder="{$aForm[7].text_label}"
                            name="{$aForm[7].nom_variable}"
                            class="{if isset($aForm[7].ctrl_champ) and $aForm[7].ctrl_champ eq 'ok'} required {/if}"
                            {if isset($aForm[7].valeur_variable) and $aForm[7].valeur_variable neq ''}value="{$aForm[7].valeur_variable}"{/if}
                            {if isset($aForm[7].size_champ) and $aForm[7].size_champ neq ''}size="{$aForm[7].size_champ}"{/if}
                            {if isset($aForm[7].style) and $aForm[7].style neq ''}style="{$aForm[7].style}"{/if}
                            {if isset($aForm[7].tableau_attribut) and $aForm[7].tableau_attribut|is_array}
                              {foreach from=$aForm[7].tableau_attribut key=cle item=valeur}
                                {$cle}="{$valeur}"
                              {/foreach}
                            {/if}
                            {if isset($aForm[7].fonction_javascript) and $aForm[7].fonction_javascript|is_array}
                              {foreach from=$aForm[7].fonction_javascript key=cle item=valeur}
                                {$cle}="{$valeur}"
                              {/foreach}
                            {/if}
                            {if isset($aForm[7].ctrl_champ) and $aForm[7].ctrl_champ eq 'ok'} required {/if}
                          >
                        </div>
                      </div>  
                    <span class="help-inline"></span>
                  </div>
                </div>

              </div>
              <!-- col-sm-12 --> 
            </div>
            <!-- row --> 
            
          </div>
          <!-- panel-body -->
          <div class="pd-20">
            <button class="btn vd_btn vd_bg-green col-md-offset-3"><span class="menu-icon"><i class="fa fa-fw fa-check"></i></span> Enregistrer</button>
          </div>
        </form>
      </div>
      <!-- Panel Widget --> 
    </div>
    <!-- col-sm-12--> 
  </div>
  <!-- row --> 
  
</div>
<!-- .vd_content-section --> 

<!-- .content -->