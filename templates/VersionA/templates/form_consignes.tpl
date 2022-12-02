<link rel="stylesheet" href="css/liste_consignes.{$listeConsign}.css">
<link rel="stylesheet" href="css/calendar.{$clFormConsign}.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
{foreach from=$aForm item='i'}
    {if $i.nom_variable === 'name'}
        {assign var='libelle' value=$i}
    {elseif $i.nom_variable === 'id_type_consigne'}
        {assign var='type' value=$i}
    {elseif $i.nom_variable === 'visibilityForm'}
        {assign var='visibility' value=$i}
    {elseif $i.nom_variable === 'contenu'}
        {assign var='contenu' value=$i}
    {elseif $i.nom_variable === 'appearsAfter'}
        {assign var='appearsAfter' value=$i}
    {elseif $i.nom_variable === 'position'}
        {assign var='position' value=$i}
    {elseif $i.nom_variable === 'startDateSearch'}
        {assign var='startDate' value=$i}
    {elseif $i.nom_variable === 'endDateSearch'}
        {assign var='endDate' value=$i}
    {elseif $i.nom_variable === 'filters'}
        {assign var='filters' value=$i}
    {elseif $i.nom_variable === 'locationFilters'}
        {assign var='locationFilters' value=$i}
    {elseif $i.nom_variable === 'specialtiesFilters'}
        {assign var='specialtiesFilters' value=$i}
    {elseif $i.nom_variable === 'practitionerFilters'}
        {assign var='practitionerFilters' value=$i}
    {elseif $i.nom_variable === 'typesFilters'}
        {assign var='typesFilters' value=$i}
    {elseif $i.nom_variable === 'checkAll'}
        {assign var='checkAll' value=$i}
    {elseif $i.nom_variable === 'identifiant_entite'}
        {assign var='idc' value=$i}
    {/if}
{/foreach}

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
    <div class="vd_title-section customTitleSection">
        <div class="vd_panel-header">
            <h1>
                {if isset($itemBoutonsForm.annuler) and $bAffAnnuler}
                    <a onclick="return checkRedirect()" href="{$itemBoutonsForm.annuler.url}&pagesimple={$pagesimple}">
                        <i class="fa fa-chevron-circle-left clickable" aria-hidden="true"></i>
                    </a>
                {/if}
                {$sTitreForm}
            {if $bActivtraduction=='Yes'}
                <a href="#" onclick="renvoi_info_traduction('stitreform','{$sFli_LinkUrl}','{$sLangueUser}','{$sTitreForm|replace:'\'':'\\\''}','{$sNomTable}','');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
            {/if}
            </h1>
            
        </div>
    </div>
    <!-- vd_title-section -->
    <div class="content-blocks">
        <div class="menuBar vw-10">
            <div class="menuElement selected" style='padding:8px;'>
                <span style='font-size:large'>Consigne</span>
            </div>
        </div>
        <div class="panel-body panel-max-width">
            <div class="agendaSwitch rightAlign margin-line" >
                <u id="advancedOptionsLabel" style='cursor:pointer;'>Options avancées</u>
                <label class="switch">
                    <input type="checkbox" id="avancedOptions">
                    <span class="slider round" id="avancedOptionsSlider"></span>
                </label>
            </div>
            <form id="formConsigneConfiguration" class="form-horizontal" action="{$url_form}&pagesimple={$pagesimple}" role="form" method="POST">
                <div id='formConsignes1' class="formBody">
                    <div class="line-elements margin-line">
                        <div>
                            <label class="control-label">{$libelle.text_label}</label>
                            <div class="controls">
                                <input 
                                    type="text"
                                    id="id_{$libelle.nom_variable}"
                                    name="{$libelle.nom_variable}"
                                    {if isset($libelle.valeur_variable) and $libelle.valeur_variable neq ''}value="{$libelle.valeur_variable}"{/if}
                                    {if isset($libelle.style) and $libelle.style neq ''}style="{$libelle.style}"{/if}
                                    {if isset($libelle.tableau_attribut) and $libelle.tableau_attribut|is_array}
                                        {foreach from=$libelle.tableau_attribut key=cle item=valeur}
                                            {$cle}="{$valeur}"
                                        {/foreach}
                                    {/if}
                                    {if isset($libelle.fonction_javascript) and $libelle.fonction_javascript|is_array}
                                        {foreach from=$libelle.fonction_javascript key=cle item=valeur}
                                            {$cle}="{$valeur}"
                                        {/foreach}
                                    {/if}
                                    {if isset($libelle.ctrl_champ) and $libelle.ctrl_champ eq 'ok'} required 
                                    oninvalid='changeOptionPage({$libelle.page} !== 1);'{/if}
                                >
                                <span class="help-inline"></span>
                            </div>
                        </div>
                        <div>
                            <label class="control-label">{$type.text_label}</label>
                            <div class="controls">
                                <select
                                id="id_form_{$type.nom_variable}"                     
                                name="{$type.nom_variable}"
                                {if isset($type.multiple)}multiple{/if}
                                >
                                {if is_array($type.lesitem)}
                                    {foreach from=$type.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                        <option value="{$id_valeur_possible}" {if $type.valeur_variable eq $id_valeur_possible}selected{/if}>
                                            {$valeur_possible_bdd}
                                        </option>
                                    {/foreach}
                                {/if}
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="line-elements margin-line">
                        <div>
                            <label class="control-label">{$visibility.text_label}</label>
                            <div class="controls checkboxLine">
                                {foreach from=$visibility.lesitem key=valeur_checkbox item=nom_checkbox}
                                <div class='checkboxAndLabel'>
                                    <input
                                        type="checkbox"
                                        class="noMargin biggerCheckbox darkBlueCB {if isset($visibility.check_all) and $visibility.check_all eq 'ok'}class_{$visibility.class_check_all}{/if} {if isset($visibility.ctrl_champ) and $visibility.ctrl_champ eq 'ok'}  {/if}"
                                        name="{$visibility.nom_variable}[]"
                                        value="{$valeur_checkbox}"
                                        id="id{$visibility.nom_variable}_{$valeur_checkbox}"
                                        {if is_array($visibility.valeur_variable) and in_array($valeur_checkbox, $visibility.valeur_variable)}checked{/if}
                                        {if isset($visibility.ctrl_champ) and $visibility.ctrl_champ eq 'ok'} required 
                                        oninvalid='changeOptionPage({$visibility.page} !== 1);'{/if}
                                    />
                                    <label class="noMargin" for="id{$visibility.nom_variable}_{$valeur_checkbox}"> {$nom_checkbox} </label>
                                </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                    <div class="line-elements margin-line">
                        <div>
                            <label class="control-label">{$contenu.text_label}</label>
                            <textarea
                                id="id_{$contenu.nom_variable}"
                                name="{$contenu.nom_variable}"
                                rows="3"
                                {if isset($contenu.ctrl_champ) and $contenu.ctrl_champ eq 'ok'} required 
                                oninvalid='changeOptionPage({$contenu.page} !== 1);'{/if}
                                {if isset($contenu.wysiwyg) and $contenu.wysiwyg eq 'ok'} data-rel="ckeditor" {/if}
                                {if isset($contenu.size_champ) and $contenu.size_champ neq ''}size="{$contenu.size_champ}"{/if}
                                {if isset($contenu.style) and $contenu.style neq ''}style="{$contenu.style}"{/if}
                                {if isset($contenu.tableau_attribut) and $contenu.tableau_attribut|is_array}
                                    {foreach from=$contenu.tableau_attribut key=cle item=valeur}
                                        {$cle}="{$valeur}"
                                    {/foreach}
                                {/if}
                                {if isset($contenu.fonction_javascript) and $contenu.fonction_javascript|is_array}
                                    {foreach from=$contenu.fonction_javascript key=cle item=valeur}
                                        {$cle}="{$valeur}"
                                    {/foreach}
                                {/if}
                            >
                                {$contenu.valeur_variable}
                            </textarea>
                        </div>
                    </div>
                </div>
                <div id='formConsignes2' class="formBody" style='display:none'>
                    <div class="line-elements margin-line">
                        <div>
                            <label class="control-label">{$appearsAfter.text_label}
                                {if isset($appearsAfter.tooltipText) and $appearsAfter.tooltipText neq ''}
                                    <i title="{$appearsAfter.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                {/if}
                            </label>
                            <div class="vd_radio dark_blue_radio">
                                {foreach from=$appearsAfter.lesitem key=valeur_radio item=nom_radio name=nom_radio}
                                    <input 
                                        type="radio" 
                                        class="{if isset($appearsAfter.ctrl_champ) and $appearsAfter.ctrl_champ eq 'ok'}  {/if}"
                                        name="{$appearsAfter.nom_variable}" 
                                        id="id_{$appearsAfter.nom_variable}_{$smarty.foreach.nom_radio.iteration}" 
                                        value="{$valeur_radio}" 
                                        {if $valeur_radio eq $appearsAfter.valeur_variable}checked{/if}
                                        {if isset($appearsAfter.ctrl_champ) and $appearsAfter.ctrl_champ eq 'ok'} required {/if}
                                        {if isset($appearsAfter.fonction_javascript) and $appearsAfter.fonction_javascript|is_array}
                                            {foreach from=$appearsAfter.fonction_javascript key=cle item=valeur}
                                                {$cle}="{$valeur}"
                                            {/foreach}
                                        {/if}
                                    >
                                    <label  for="id_{$appearsAfter.nom_variable}_{$smarty.foreach.nom_radio.iteration}">{$nom_radio}</label>
                                {/foreach} 
                            </div>
                        </div>
                        <div>
                            <label class="control-label">{$position.text_form}
                                {if isset($position.tooltipText) and $position.tooltipText neq ''}
                                    <i title="{$position.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                {/if}
                            </label>
                            <input type="number" min="0" step="1"
                                {if isset($position.nom_variable)}name="{$position.nom_variable}"  id="id_{$position.nom_variable}"{/if}
                                {if isset($position.valeur_variable)}value="{$position.valeur_variable}"{/if}
                            />
                        </div>
                    </div>
                    <div class="line-elements margin-line">
                        <div>
                            <label class="control-label">{$startDate.text_label}
                                {if isset($startDate.tooltipText) and $startDate.tooltipText neq ''}
                                    {if $startDate.tooltipText|is_array}
                                        <i id="tooltip_{$startDate.nom_variable}" title="{$startDate.tooltipText[0]}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                        <script>
                                            let field = {$startDate|@json_encode nofilter};
                                            document.addEventListener('DOMContentLoaded', () => {
                                                $(document).on('change', "input[name='"+ field.tooltipLink +"']" ,(event) => {
                                                    $('#tooltip_'+field.nom_variable).tooltip('option', 'content', field.tooltipText[event.target.value]);
                                                })
                                            })
                                            
                                        </script>
                                    {else if}
                                        <i title="{$startDate.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                    {/if}
                                {/if}
                            </label>
                            <div class="input-group">
                                <input 
                                    type="text"
                                    class="calendarPicker {if isset($startDate.ctrl_champ) and $startDate.ctrl_champ eq 'ok'} required {/if}" 
                                    {if isset($startDate.placeholder) and $startDate.placeholder neq ''}placeholder="{$startDate.placeholder}"{/if}
                                    id="id_{$startDate.nom_variable}"
                                    name="{$startDate.nom_variable}"
                                    {if isset($startDate.valeur_variable) and $startDate.valeur_variable neq ''}value="{$startDate.valeur_variable}"
                                    {elseif isset($startDate.defaultValue) and $startDate.defaultValue neq ''}value="{$startDate.defaultValue}"
                                    {/if}
                                    {if isset($startDate.size_champ) and $startDate.size_champ neq ''}size="{$startDate.size_champ}"{/if}
                                    {if isset($startDate.style) and $startDate.style neq ''}style="{$startDate.style}"{/if}
                                    {if isset($startDate.tableau_attribut) and $startDate.tableau_attribut|is_array}
                                        {foreach from=$startDate.tableau_attribut key=cle item=valeur}
                                            {$cle}="{$valeur}"
                                        {/foreach}
                                    {/if}
                                    {if isset($startDate.fonction_javascript) and $startDate.fonction_javascript|is_array}
                                        {foreach from=$startDate.fonction_javascript key=cle item=valeur}
                                            {$cle}="{$valeur}"
                                        {/foreach}
                                    {/if}
                                    {if isset($startDate.ctrl_champ) and $startDate.ctrl_champ eq 'ok'} required 
                                    oninvalid='changeOptionPage({$startDate.page} !== 1);'{/if}
                                />
                                <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$startDate.nom_variable}">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                        <div style="align-self: flex-end;">
                            <label class="control-label">
                            </label>
                            <div class="input-group">
                                <input 
                                    type="text"
                                    class="calendarPicker {if isset($endDate.ctrl_champ) and $endDate.ctrl_champ eq 'ok'} required {/if}" 
                                    {if isset($endDate.placeholder) and $endDate.placeholder neq ''}placeholder="{$endDate.placeholder}"{/if}
                                    id="id_{$endDate.nom_variable}"
                                    name="{$endDate.nom_variable}"
                                    {if isset($endDate.valeur_variable) and $endDate.valeur_variable neq ''}value="{$endDate.valeur_variable}"{/if}
                                    {if isset($endDate.size_champ) and $endDate.size_champ neq ''}size="{$endDate.size_champ}"{/if}
                                    {if isset($endDate.style) and $endDate.style neq ''}style="{$endDate.style}"{/if}
                                    {if isset($endDate.tableau_attribut) and $endDate.tableau_attribut|is_array}
                                        {foreach from=$endDate.tableau_attribut key=cle item=valeur}
                                            {$cle}="{$valeur}"
                                        {/foreach}
                                    {/if}
                                    {if isset($endDate.fonction_javascript) and $endDate.fonction_javascript|is_array}
                                        {foreach from=$endDate.fonction_javascript key=cle item=valeur}
                                            {$cle}="{$valeur}"
                                        {/foreach}
                                    {/if}
                                    {if isset($endDate.ctrl_champ) and $endDate.ctrl_champ eq 'ok'} required 
                                    oninvalid='changeOptionPage({$endDate.page} !== 1);'{/if}
                                />
                                <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$endDate.nom_variable}">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="margin-line">
                        <label class="control-label">{$filters.text_label}
                            {if isset($filters.tooltipText) and $filters.tooltipText neq ''}
                                <i title="{$filters.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                            {/if}
                        </label>
                        <div>
                            {foreach from=$filters.lesitem key=valeur_checkbox item=nom_checkbox}
                                {if $nom_checkbox|is_array}
                                    {assign var='itemChecked' value=(isset($filters.valeur_variable) && $filters.valeur_variable|is_array && array_key_exists($valeur_checkbox,$filters.valeur_variable) && count($filters.valeur_variable[$valeur_checkbox]) > 0)}
                                    {assign var='allMonthsChecked' value=count($filters.valeur_variable[$valeur_checkbox])}
                                    {assign var='allDaysChecked' value=count($filters.valeur_variable[$valeur_checkbox])}
                                    <div class='checkboxGroup'>
                                        <div style='width: 10%;'>
                                            <div class="checkboxAndLabel">
                                                <input
                                                    type="checkbox"
                                                    class="controlShowing noMargin biggerCheckbox darkBlueCB"
                                                    id="id{$filters.nom_variable}_{$valeur_checkbox}_control"
                                                    data-target="#id{$filters.nom_variable}_{$valeur_checkbox}"
                                                    name="{$filters.nom_variable}_control[{$valeur_checkbox}]"
                                                    {if $valeur_checkbox == 'Jours' && $allDaysChecked == 7}checked{elseif $valeur_checkbox == 'Mois' && $allMonthsChecked == 12}checked{/if}
                                                    {if $valeur_checkbox == 'Jours'} onclick="validateAndCheckAllDays()"  {else}  onclick="validateAndCheckAllMonths()" {/if}                                                    
                                                />
                                                <label class="noMargin" for="id{$filters.nom_variable}_{$valeur_checkbox}"> {$valeur_checkbox} </label>
                                            </div>
                                        </div>
                                        <div class="checkboxLine collapse" style="flex:1; padding: 0 15px; flex-wrap: wrap; border-left: 1px solid #1F3A55; align-items: center;">
                                        {foreach from=$nom_checkbox key=itemIndex item=item}
                                            <div style="flex-basis: 10%">
                                                <div class="checkboxAndLabel">
                                                    <input
                                                        type="checkbox"
                                                        class="noMargin biggerCheckbox darkBlueCB"
                                                        name="{$filters.nom_variable}[{$valeur_checkbox}][]"
                                                        value="{$itemIndex}"
                                                        id="id{$filters.nom_variable}_{$valeur_checkbox}_{$itemIndex}"
                                                        {if $itemChecked && in_array($itemIndex, $filters.valeur_variable[$valeur_checkbox])}checked{/if}
                                                        {if $valeur_checkbox == 'Jours'} onclick="validateAndUncheckDays()"  {else}  onclick="validateAndUncheckMonths()" {/if}
                                                    />
                                                    <label class="noMargin" style='margin:0;' for="id{$filters.nom_variable}_{$valeur_checkbox}"> {$item} </label>
                                                </div>
                                            </div>
                                        {/foreach} 
                                        </div>
                                    </div>
                                {else}
                                    <div class="controls checkboxLine">
                                        <input
                                            type="checkbox"
                                            class="{if isset($filters.check_all) and $filters.check_all eq 'ok'}class_{$filters.class_check_all}{/if} {if isset($filters.ctrl_champ) and $filters.ctrl_champ eq 'ok'}  {/if}"
                                            name="{$filters.nom_variable}[]"
                                            value="{$valeur_checkbox}"
                                            id="id{$filters.nom_variable}_{$valeur_checkbox}"
                                            {if is_array($filters.valeur_variable) and in_array($valeur_checkbox, $filters.valeur_variable)}checked{/if}
                                            {if isset($filters.ctrl_champ) and $filters.ctrl_champ eq 'ok'}  {/if}
                                        />
                                        <label for="id{$filters.nom_variable}_{$valeur_checkbox}"> {$nom_checkbox} </label>
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                    <hr class="lineLeft"/>
                    <div class='line-elements margin-line'>
                        <div>
                            <label class="control-label">{$locationFilters.text_label}
                                {if isset($locationFilters.tooltipText) and $locationFilters.tooltipText neq ''}
                                    <i title="{$locationFilters.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                {/if}
                            </label>
                            <select
                                id="id_form_{$locationFilters.nom_variable}"
                                class="js-example-basic-multiple {if isset($locationFilters.allParam) && $locationFilters.allParam eq 'ok'}paramAll{/if}" 
                                name="{$locationFilters.nom_variable}{if isset($locationFilters.multiple)}[]{/if}"
                                style="width:100%"
                                multiple
                            >
                                {if isset($locationFilters.allParam) && $locationFilters.allParam eq 'ok'}
                                    <option value='0' {if in_array(0,$locationFilters.valeur_variable)}selected{/if}>
                                        Tous
                                    </option>
                                {/if}
                                {if is_array($locationFilters.lesitem)}
                                    {foreach from=$locationFilters.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                        <option value="{$id_valeur_possible}" {if in_array($id_valeur_possible,$locationFilters.valeur_variable)}selected{/if}>
                                            {$valeur_possible_bdd}
                                        </option>
                                    {/foreach}
                                {/if}                            
                            </select>
                        </div>
                        <div>
                            <label class="control-label">{$specialtiesFilters.text_label}
                                {if isset($specialtiesFilters.tooltipText) and $specialtiesFilters.tooltipText neq ''}
                                    <i title="{$specialtiesFilters.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                {/if}
                            </label>
                            <select
                                id="id_form_{$specialtiesFilters.nom_variable}"
                                class="js-example-basic-multiple {if isset($specialtiesFilters.allParam) && $specialtiesFilters.allParam eq 'ok'}paramAll{/if}" 
                                name="{$specialtiesFilters.nom_variable}{if isset($specialtiesFilters.multiple)}[]{/if}"
                                style="width:100%"
                                multiple
                            >
                                {if isset($specialtiesFilters.allParam) && $specialtiesFilters.allParam eq 'ok'}
                                    <option value='0' {if in_array(0,$specialtiesFilters.valeur_variable)}selected{/if}>
                                        Tous
                                    </option>
                                {/if}
                                {if is_array($specialtiesFilters.lesitem)}
                                    {foreach from=$specialtiesFilters.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                        <option value="{$id_valeur_possible}" {if in_array($id_valeur_possible,$specialtiesFilters.valeur_variable)}selected{/if}>
                                            {$valeur_possible_bdd}
                                        </option>
                                    {/foreach}
                                {/if}                            
                            </select>
                        </div>
                    </div>
                    <div class='line-elements margin-line'>
                        <div>
                            <label class="control-label">{$practitionerFilters.text_label}
                                {if isset($practitionerFilters.tooltipText) and $practitionerFilters.tooltipText neq ''}
                                    <i title="{$practitionerFilters.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                {/if}
                            </label>
                            <select
                                id="id_form_{$practitionerFilters.nom_variable}"
                                class="js-example-basic-multiple {if isset($practitionerFilters.allParam) && $practitionerFilters.allParam eq 'ok'}paramAll{/if}" 
                                name="{$practitionerFilters.nom_variable}{if isset($practitionerFilters.multiple)}[]{/if}"
                                style="width:100%"
                                multiple
                            >
                                {if isset($practitionerFilters.allParam) && $practitionerFilters.allParam eq 'ok'}
                                    <option value='0' {if in_array(0,$practitionerFilters.valeur_variable)}selected{/if}>
                                        Tous
                                    </option>
                                {/if}
                                {if is_array($practitionerFilters.lesitem)}
                                    {foreach from=$practitionerFilters.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                        <option value="{$id_valeur_possible}" {if in_array($id_valeur_possible,$practitionerFilters.valeur_variable)}selected{/if}>
                                            {$valeur_possible_bdd}
                                        </option>
                                    {/foreach}
                                {/if}                            
                            </select>
                        </div>
                        <div>
                            <label class="control-label">{$typesFilters.text_label}
                                {if isset($typesFilters.tooltipText) and $typesFilters.tooltipText neq ''}
                                    <i title="{$typesFilters.tooltipText}" class="tooltipIcon fa fa-info-circle fg_dark_blue"></i>
                                {/if}
                            </label>
                            <select
                                id="id_form_{$typesFilters.nom_variable}"
                                class="js-example-basic-multiple {if isset($typesFilters.allParam) && $typesFilters.allParam eq 'ok'}paramAll{/if}" 
                                name="{$typesFilters.nom_variable}{if isset($typesFilters.multiple)}[]{/if}"
                                style="width:100%"
                                multiple
                            >
                                {if isset($typesFilters.allParam) && $typesFilters.allParam eq 'ok'}
                                    <option value='0' {if in_array(0,$typesFilters.valeur_variable)}selected{/if}>
                                        Tous
                                    </option>
                                {/if}
                                {if is_array($typesFilters.lesitem)}
                                    {foreach from=$typesFilters.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                        <option value="{$id_valeur_possible}" {if in_array($id_valeur_possible, $typesFilters.valeur_variable)}selected{/if}>
                                            {$valeur_possible_bdd}
                                        </option>
                                    {/foreach}
                                {/if}                            
                            </select>
                        </div>
                    </div>
                    <div class='line-elements margin-line'>
                        <div>
                            <label class="control-label">{$checkAll.text_label}</label>
                            <div class="controls checkboxLine">
                                {foreach from=$checkAll.lesitem key=valeur_checkbox item=nom_checkbox}
                                <div class='checkboxAndLabel'>
                                    <input
                                        type="checkbox"
                                        class="biggerCheckbox noMargin darkBlueCB {if isset($checkAll.allCheckLink) and !empty($checkAll.allCheckLink)}checkLink{/if}"
                                        name="{$checkAll.nom_variable}[]"
                                        value="{$valeur_checkbox}"
                                        id="id{$checkAll.nom_variable}_{$valeur_checkbox}"
                                        {if isset($checkAll.allCheckLink) and $checkAll.allCheckLink|is_array}data-checkAllLink="{join(',',$checkAll.allCheckLink)}"{/if}
                                        {if is_array($checkAll.valeur_variable) and in_array($valeur_checkbox, $checkAll.valeur_variable)}checked{/if}
                                        {if isset($checkAll.ctrl_champ) and $checkAll.ctrl_champ eq 'ok'}  {/if}
                                    />
                                    <label class='noMargin' for="id{$checkAll.nom_variable}_{$valeur_checkbox}"> {$nom_checkbox} </label>
                                </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
                <input type='hidden' id="id{$idc.nom_variable}" name="{$idc.nom_variable}" value="{$idc.valeur_variable}" />
                <div class="agendaSwitch rightAlign margin-line">
                    <button
                        id="consigneConfigurationValidate"
                        type="submit"
                        class="btn bg_dark_blue vd_white roundButton largeTextButton"
                        onclick="{literal}this.disabled=true;validateForm();{/literal}"
                        
                    ><i class="icon-ok"></i>Enregistrer</button>
                </div>
            </form>
        </div>
    <!-- Panel Widget --> 
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
        
        <script type="text/javascript" src="js/datepicker-fr.{$datePicker}.js"></script>
        <script>
            function showInfoConfigModal(title,message,onSuccess){

                $("#modalInfoConfigTitle").text(title);
                $("#modalInfoConfigText").html(message);
                $("#modalInfoConfig").modal('show');
                $("#modalInfoConfig #modalInfoConfigValidate").on('click', onSuccess)
                $("#modalInfoConfig #modalInfoConfigCancel").on('click', function(){
                    $('#consigneConfigurationValidate').prop('disabled', false);
                })
            }
    
            function hideInfoConfigModal(){
                $("#modalInfoConfig").modal('hide');
            }

            function initCalendarPickers(){
                $(document).ready(function() {
                    $(".calendarPicker").datepicker(
                        {
                            dateFormat: 'dd/mm/yy',
                            changeMonth: true,
                            changeYear: true,
                        });
                    $( '[data-datepicker]' ).click(function(e){
                        var data=$(this).data('datepicker');
                        $(data).focus();
                    });

                    const startDate = {$startDate|@json_encode nofilter};
                    const startField = $('#id_'+startDate.nom_variable);
                    const endDate = {$endDate|@json_encode nofilter};
                    const endField = $('#id_'+endDate.nom_variable);
                    startField.datepicker('option','minDate', new Date());
                    startField.on('change', (event) => {
                        endField.datepicker('option','minDate',event.target.value)
                    })
                    endField.on('change', (event) => {
                        startField.datepicker('option','maxDate',event.target.value)
                    })
                    startField.trigger('change');
                    endField.trigger('change');
                });
											
            }

            function initWysiwig(){
                const formElements = {$aForm|@json_encode nofilter};
                const wysiwygToolbar = [
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
                ];
                formElements.forEach(elem => {
                    if('wysiwyg' in elem && elem.wysiwyg === 'ok'){
                        {literal}
                            const editor = CKEDITOR.replace(
                                'id_' + elem.nom_variable,
                                {toolbar : wysiwygToolbar}
                            );
                        {/literal}
                    }
                })
                
            }

            function initCollapse(){
                $('.controlShowing').on('click', (event) => {
                    if('target' in event.target.dataset){
                        const elem = $(event.target.dataset.target);
                        event.target.checked ? elem.fadeIn() : elem.fadeOut()
                    }
                })
            }

            function initSelect2() {
                $('.js-example-basic-multiple').select2();
                $('.js-example-basic-multiple.paramAll').on('select2:selecting', (event) => {
                    let selectedId = event.params.args.data.id;
                    let selectInput = $(event.target);
                    if(selectedId === '0'){
                        selectInput.val(['0']);
                    }else if(selectInput.val().includes('0')){
                        selectInput.val([selectedId])
                    }
                })
            }

            function areAllChecked(fields){
                for(let x = 0; x < fields.length; x++){
                    const selectField = $('select[name="'+fields[x]+'[]"]');
                    if(!selectField.val().includes('0')){
                        return false;
                    }
                }

                return true;
            }

            function initCheckLinks() {
                const inputCheckLink = $('input.checkLink');
                const links = inputCheckLink[0].dataset?.checkalllink.split(',');
                inputCheckLink.on('change', (event) => {
                    const target = event.target;
                    const value = target.checked ? ['0'] : [];
                    links.forEach(elem => {
                        const selectField = $('select[name="'+elem+'[]"]');
                        selectField.val(value).trigger('change');                        
                    })
                })
                links.forEach((link) => {
                    $('select[name="'+link+'[]"]').on('select2:unselect', () => {
                        inputCheckLink.prop('checked', false);
                    });
                    $('select[name="'+link+'[]"]').on('select2:select', () => {
                        inputCheckLink.prop('checked', areAllChecked(links));
                    })
                })
                
                inputCheckLink.prop('checked', areAllChecked(links));
            }

            function changeOptionPage(toAdvanced){
                $('#avancedOptions').prop('checked',toAdvanced);
                if(toAdvanced){
                    $('#formConsignes1').hide();
                    $('#formConsignes2').fadeIn();
                } else {
                    $('#formConsignes2').hide();
                    $('#formConsignes1').fadeIn();
                }
            }

            function validateForm(){
                const form = $('#formConsigneConfiguration')[0];
                const visibility = {$visibility|@json_encode nofilter};
                console.log(visibility)
                let answer = form.checkValidity();
                if(answer){
                    const visibilities = $('[name="'+visibility.nom_variable+'[]"]:checked');
                    let answer = true;
                    if(visibilities.length === 0){
                        answer = confirm('Consigne appliquée sur aucun élément. Voulez-vous continuer ?');
                    }
                    if(answer){
                        form.submit();
                    }
                }
                
                if(!answer){
                    $('#consigneConfigurationValidate').prop("disabled", false);
                }
            }

            function checkRedirect(){
                const nameField = {$libelle|@json_encode nofilter};
                const nameValue = $("#id_"+nameField.nom_variable)[0].value;
                return nameValue !== "" ? confirm('Voulez-vous revenir en arrière ?\nVotre consigne ne sera pas enregistrée.') : true;
            }

            initWysiwig();
            document.addEventListener('DOMContentLoaded', function () {
                const elements = {$aForm|@json_encode nofilter};
                {literal}
                initCollapse();
                initCalendarPickers();
                initSelect2();
                initCheckLinks();
                $('.tooltipIcon').tooltip({
                    position: {my: "left+15 center", at: "right center"},
                    tooltipClass: 'tooltipContentBox'
                })
                $('#advancedOptionsLabel').on('click',() => {
                    $('#avancedOptions').click();
                })
                $('#avancedOptions').on('change', (event) => {
                    changeOptionPage(event.target.checked);
                });
                {/literal}
            });
             function validateAndCheckAllDays() {
                var daysInput = document.getElementById("idfilters_Jours_control");
                if (daysInput.checked) {
                    $('input[name="filters[Jours][]"]').prop("checked", true)
                } else if(!daysInput.checked) {
                    $('input[name="filters[Jours][]"]').prop("checked", false)
                }
                
            }
            function validateAndCheckAllMonths() {
                var monthsInput = document.getElementById("idfilters_Mois_control");
                if (monthsInput.checked) {
                    $('input[name="filters[Mois][]"]').prop("checked", true)
                } else if(!monthsInput.checked) {
                    $('input[name="filters[Mois][]"]').prop("checked", false)
                }
            }
            function validateAndUncheckDays() {
                var oneDayInput = $('input[name="filters[Jours][]"]');
                var checkedList= [];
                for(i=0 ; i<oneDayInput.length ; i++) {
                    if (!oneDayInput[i].checked) {
                        checkedList.push(oneDayInput[i]);
                    } 
                }      
                console.log(checkedList);
                if (checkedList && checkedList.length>0) {
                   $('#idfilters_Jours_control').prop("checked", false) 
                } else {
                    $('#idfilters_Jours_control').prop("checked", true)
                }
                
            }
             function validateAndUncheckMonths() {
                var oneMonthInput = $('input[name="filters[Mois][]"]');
                var checkedList= [];
                for(i=0 ; i<oneMonthInput.length ; i++) {
                    if (!oneMonthInput[i].checked) {
                        checkedList.push(oneMonthInput[i]);
                    } 
                }      
                console.log(checkedList);
                if (checkedList && checkedList.length>0) {
                   $('#idfilters_Mois_control').prop("checked", false) 
                } else {
                    $('#idfilters_Mois_control').prop("checked", true)
                }
            }
        </script>
    </div>
    {/if}
    
    
    