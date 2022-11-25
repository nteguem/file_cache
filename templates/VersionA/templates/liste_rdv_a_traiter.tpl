{literal}
    <style type="text/css">
        span.select2.select2-container.select2-container--default { width: 100%!important; }
    </style>
{/literal}

{if $bDebugRequete}
    <p class="no-print">
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
{if isset($aListe)}
<div class="vd_title-section clearfix no-print">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
        {if $bActivtraduction=='Yes'}
           <a href="#" onclick="renvoi_info_traduction('stitreselect','{$sFli_LinkUrl}','{$sLangueUser}','{$sTitreListe|replace:'\'':'\\\''}','{$sNomTable}','');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
        {/if}
    </div>
</div>
<div class="col-sm-12 controls no-print" style="margin-top:15px;margin-bottom:15px;">
    <div align="right">
        <a id="btn_print_calendar" class="mega-link" href="javascript:void(0);" onclick="window.print();" alt="Imprimer" title="Imprimer">
            <span class="mega-icon">
                <i class="fa fa-print append-icon" style="font-size:xx-large;"></i>
            </span>
        </a>
    </div>
</div>
<!-- vd_title-section -->
<div class="vd_content-section clearfix">
    {if isset($bMessageSupprElem) and $bMessageSupprElem}
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
            <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
            {if isset($sMessageSupprElem)}{$sMessageSupprElem}{/if}
        </div>
    {/if}
    {if isset($bMessageSuccesForm) and $bMessageSuccesForm}
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
            <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
            {if isset($sMessageSuccesForm)}{$sMessageSuccesForm}{/if}
        </div>
    {/if}
    {if isset($bMessageErreurForm) and $bMessageErreurForm}
        <div class="alert alert-danger"> 
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
            <span class="vd_alert-icon">
                <i class="fa fa-exclamation-circle vd_red"></i>
            </span>
            {if isset($sMessageErreurForm)}{$sMessageErreurForm}{/if}
        </div>
    {/if}

     {if isset($bMessageSuccesALL) and $bMessageSuccesALL}
        <div class="alert alert-success">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
            <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
            {if isset($sMessageSuccesALL)}{$sMessageSuccesALL}{/if}
        </div>
    {/if}
    {if isset($bMessageErreurALL) and $bMessageErreurALL}
        <div class="alert alert-danger">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
            <span class="vd_alert-icon">
                <i class="fa fa-exclamation-circle vd_red"></i>
            </span>
            {if isset($sMessageErreurALL)}{$sMessageErreurALL}{/if}
        </div>
    {/if}


    {if isset($sRetourListe) and $sRetourListe neq ''}
        <div>
            <a href="{$sRetourListe}" alt="{$sLabelRetourListe}">
                <button type="button" class="btn vd_btn vd_bg-grey"><i class="fa fa-arrow-circle-left fa-fw"></i>{$sLabelRetourListe}</button>
            </a>
        </div>
    {/if}
    {if isset($aRech) and $aRech|@count > 0}
        <div class="row no-print" id="form-basic" style="margin-bottom:0px;">
            <div class="col-md-12">
                <div class="panel widget" style="overflow: auto;">
                    {literal}<div class="panel-heading vd_bg-grey" onclick="if(bouverture==0){$('#formrech').css( 'display', 'block');bouverture=1;$('#iconeplusmoins').removeClass('fa-sort-desc');$('#iconeplusmoins').addClass('fa-sort-up');}else{$('#formrech').css( 'display', 'none');bouverture=0;$('#iconeplusmoins').removeClass('fa-sort-up');$('#iconeplusmoins').addClass('fa-sort-desc');}">
                     {/literal}   <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-sort-desc" id="iconeplusmoins"></i> </span>{$sLabelRecherche}</h3>
                    </div> 
                    <div class="panel-body" id="formrech" style="display: none;">
                        <form class="form-horizontal" action="" role="form" id="formList" method="GET" {if isset($bTelechargementFichier) and $bTelechargementFichier}enctype="multipart/form-data"{/if}>
                            <input type="hidden" name="dir" value="{$sDirRech}">
                            <input type="hidden" name="pagesimple" value="{$pagesimple}">
                            {if isset($aParametreWizardListe) and $aParametreWizardListe|is_array}
                                {foreach from=$aParametreWizardListe key=CleParametreWizardListe item=ValeurParametreWizardListe}
                                    <input type="hidden" name="{$CleParametreWizardListe}" value="{$ValeurParametreWizardListe}">
                                {/foreach}
                            {/if}
                            {if isset($aRetourListe) and $aRetourListe|is_array}
                                {foreach from=$aRetourListe key=sCleRetourListe item=sValeurRetourListe}
                                    <input type="hidden" name="{$sCleRetourListe}" value="{$sValeurRetourListe}">
                                {/foreach}
                            {/if}

                            {foreach from=$aRech item=objRech}
                                {if isset($objRech.type_champ) and ((isset($objRech.aff_recherche) and $objRech.aff_recherche eq 'ok') or ($objRech.type_champ eq 'category' or $objRech.type_champ eq 'bouton'))}
                                    {if $objRech.type_champ eq 'text'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div class="col-sm-6 controls">
                                                <input 
                                                    type="text"
                                                    id="id_{$objRech.nom_variable}"
                                                    placeholder="{$objRech.text_label}"
                                                    name="{$objRech.nom_variable}"
                                                    class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}  {/if}"
                                                    {if isset($objRech.valeur_variable) and $objRech.valeur_variable neq ''}value="{$objRech.valeur_variable}"{/if}
                                                    {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                    {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                    {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                        {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                            {$cle}="{$valeur}"
                                                        {/foreach}
                                                    {/if}
                                                    {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                        {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                            {$cle}="{$valeur}"
                                                        {/foreach}
                                                    {/if}
                                                    {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}  {/if}
                                                >
                                                <span class="help-inline"></span>
                                            </div>
                                        </div>

                                    {elseif $objRech.type_champ eq 'select'}
                                        {if isset($objRech.select_autocomplete) and $objRech.select_autocomplete eq 'ok'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label_filtre}</label>
                                            <div class="col-sm-6 controls">
                                                <input type='text' 
                                                name='rech_{$objRech.nom_variable}'     
                                                id='id_rech{$objRech.nom_variable}'
                                                onKeyUp="affiche_liste_generique('{$objRech.table_item}','{$objRech.id_table_item}','{$objRech.affichage_table_item}','{$objRech.supplogique_table_item}', '{$objRech.tabfiltre_autocomplete}',this.value,'id_form_{$objRech.nom_variable}')"
                                                ;>
                                            </div>
                                        </div>      
                                        {/if}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div class="col-sm-6 controls">
                                                {if isset($objRech.select2) and $objRech.select2 eq 'ok'}
                                                    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

                                                    <?php
                                                    $cdnjsCloudflare = filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js');
                                                    ?>
                                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
                                                    <div class="col-sm-12 input-group" id="id_selectmotif">
                                                        <select
                                                        id="id_form_{$objRech.nom_variable}"
                                                        class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if} js-example-basic-multiple" 
                                                        name="{$objRech.nom_variable}{if isset($objRech.multiple)}[]{/if}"
                                                        {if isset($objRech.multiple)}multiple{/if}
                                                        {$objRech.fonction_javascript}
                                                        >
                                                            <option value="" ></option>
                                                            {if is_array($objRech.lesitem)}
                                                                {foreach from=$objRech.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                                                    <option value="{$id_valeur_possible}" {if $objRech.valeur_variable eq $id_valeur_possible}selected="selected"{/if} 
                                                                    >
                                                                        {$valeur_possible_bdd}
                                                                    </option>
                                                                {/foreach}
                                                            {/if}
                                                        </select>
                                                    </div>
                                                {else}
                                                    <div class="col-sm-12 input-group" id="id_selectmotif">
                                                        <select
                                                        id="id_form_{$objRech.nom_variable}"
                                                        class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if} js-example-basic-multiple" 
                                                        name="{$objRech.nom_variable}{if isset($objRech.multiple)}[]{/if}"
                                                        {if isset($objRech.multiple)}multiple{/if}
                                                        {$objRech.fonction_javascript}
                                                        >
                                                            <option value=""  ></option>
                                                            {if is_array($objRech.lesitem)}
                                                                {foreach from=$objRech.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                                                    <option value="{$id_valeur_possible}" {if $objRech.valeur_variable eq $id_valeur_possible}selected="selected"{/if}
                                                                    >
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
                                                        });
                                                    </script>
                                                {/literal}
                                            </div>
                                        </div>

                                    {* {elseif $objRech.type_champ eq 'heure'}
                                        {if isset($objRech.select_autocomplete) and $objRech.select_autocomplete eq 'ok'}
                                            <div class="form-group" id="label{$objRech.nom_variable}">
                                                <label class="col-sm-3 control-label">{$objRech.text_label_filtre}</label>
                                            </div>
                                        {/if}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
                                            <div class="col-sm-6 controls">
                                                <div class="input-group bootstrap-timepicker" id="heure_{$objRech.nom_variable}">
                                                    <input type="text" id="heuredebut0" tabindex="23"
                                                            name="{$objRech.nom_variable}"
                                                            value="{$objRech.valeur_variable}"
                                                            class="input-modal-date-left">
                                                    <span class="input-group-addon input-modal-date-right" id="timepicker-default-span">
                                                        <i class="fa fa-clock-o"></i>
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                        {literal}
                                            <script type="text/javascript">
                                                    $("{/literal}#heure_{$objRech.nom_variable}{literal}").clockpicker({
                                                        placement: 'bottom',
                                                        autoclose: true
                                                    });
                                                    $("#heure_{$objRech.nom_variable}").mask("99:99");

                                            </script>
                                        {/literal} *}


                                    {elseif $objRech.type_champ eq 'hidden'}
                                        <div>
                                            <input
                                                type="hidden"
                                                {if isset($objRech.nom_variable)}name="{$objRech.nom_variable}"{/if}
                                                {if isset($objRech.valeur_variable)}value="{$objRech.valeur_variable}"{/if}
                                            >
                                        </div>
                                    {elseif $objRech.type_champ eq 'textarea'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div class="col-sm-6 controls">
                                                <textarea
                                                    id="id_{$objRech.nom_variable}"
                                                    name="{$objRech.nom_variable}"
                                                    rows="3"
                                                    class="width-50 {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}" 
                                                    {if isset($objRech.wysiwyg) and $objRech.wysiwyg eq 'ok'}class="ckeditor"{/if}
                                                    {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                    {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                    {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                        {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                            {$cle}="{$valeur}"
                                                        {/foreach}
                                                    {/if}
                                                    {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                        {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                            {$cle}="{$valeur}"
                                                        {/foreach}
                                                    {/if}
                                                    {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                >{$objRech.valeur_variable}</textarea>
                                            </div>
                                        </div>
                                    {elseif $objRech.type_champ eq 'category'}
                                        <div class="form-group">
                                            <label class="col-sm-8 control-label">{$objRech.text_label}</label>
                                        </div>
                                    {elseif $objRech.type_champ eq 'date'}
                                        {if isset($objRech.recherche_intervalle_date) and $objRech.recherche_intervalle_date eq 'ok'}

                                            <div class="form-group">
                                                {if isset($objRech.recherche_intervalle_date_label) and isset($objRech.recherche_intervalle_date_label[0]) and $objRech.recherche_intervalle_date_label[0] neq ''}
                                                    <label class="col-sm-3 control-label">{$objRech.recherche_intervalle_date_label[0]}</label>
                                                {/if}
                                                <div class="col-sm-2 controls">
                                                    <div class="input-group">
                                                        <input
                                                        type="text"
                                                        id="id_{$objRech.nom_variable}_1"
                                                        name="{$objRech.nom_variable}[]"
                                                        {if isset($objRech.valeur_variable) and isset($objRech.valeur_variable[0]) and $objRech.valeur_variable[0] neq ''}value="{$objRech.valeur_variable[0]}"{/if}
                                                        {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                        {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                        {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                            {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                                {$cle}="{$valeur}"
                                                            {/foreach}
                                                        {/if}
                                                        {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                            {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                                {$cle}="{$valeur}"
                                                            {/foreach}
                                                        {/if}

                                                        >
                                                        <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$objRech.nom_variable}_1">
                                                            <i class="fa fa-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                {if isset($objRech.recherche_intervalle_date_label) and isset($objRech.recherche_intervalle_date_label[1]) and $objRech.recherche_intervalle_date_label[1] neq ''}
                                                    <label class="col-sm-2 control-label">{$objRech.recherche_intervalle_date_label[1]}</label>
                                                {/if}
                                                <div class="col-sm-2 controls">
                                                    <div class="input-group">
                                                        <input
                                                        type="text"
                                                        id="id_{$objRech.nom_variable}_2"
                                                        name="{$objRech.nom_variable}[]"
                                                        {if isset($objRech.valeur_variable) and isset($objRech.valeur_variable[1]) and $objRech.valeur_variable[1] neq ''}value="{$objRech.valeur_variable[1]}"{/if}
                                                        {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                        {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                        {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                            {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                                {$cle}="{$valeur}"
                                                            {/foreach}
                                                        {/if}
                                                        {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                            {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                                {$cle}="{$valeur}"
                                                            {/foreach}
                                                        {/if}
                                                        >
                                                        <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$objRech.nom_variable}_2">
                                                            <i class="fa fa-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            {literal}
                                               <?php
                                                $datepicker = filemtime(PATH_ASSETS.'js/datepicker-fr.js');
                                                ?>
                                                <script type="text/javascript" src="js/datepicker-fr.{$datepicker}.js"></script>
                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        var curdate = new Date();
                                                        curdate = curdate.getDate()+"/"+(curdate.getMonth()+1)+"/"+curdate.getFullYear();

                                                        $( "{/literal}#id_{$objRech.nom_variable}_1{literal}" ).datepicker(
                                                            {
                                                                dateFormat: 'dd/mm/yy',
                                                                changeMonth: true,
                                                                changeYear: true
                                                            });

                                                        $( "{/literal}#id_{$objRech.nom_variable}_2{literal}" ).datepicker(
                                                            {
                                                                dateFormat: 'dd/mm/yy',
                                                                changeMonth: true,
                                                                changeYear: true
                                                            });
                                                        $( '[data-datepicker]' ).click(function(e){
                                                            var data=$(this).data('datepicker');
                                                            $(data).focus();
                                                        });

                                                    });
                                                </script>
                                            {/literal}
                                        {else}
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                                <div class="col-sm-2 controls">
                                                    <div class="input-group">
                                                        <input 
                                                            type="text"
                                                            class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}" 
                                                            placeholder="{$objRech.text_label}"
                                                            id="id_{$objRech.nom_variable}"
                                                            name="{$objRech.nom_variable}"
                                                            {if isset($objRech.valeur_variable) and $objRech.valeur_variable neq ''}value="{$objRech.valeur_variable}"{/if}
                                                            {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                            {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                            {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                                {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                                    {$cle}="{$valeur}"
                                                                {/foreach}
                                                            {/if}
                                                            {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                                {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                                    {$cle}="{$valeur}"
                                                                {/foreach}
                                                            {/if}
                                                            {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                        >
                                                        <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_{$objRech.nom_variable}">
                                                            <i class="fa fa-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            {literal}
                                                <?php
                                                $datepicker1 = filemtime(PATH_ASSETS.'js/datepicker-fr.js');
                                                ?>
                                                <script type="text/javascript" src="js/datepicker-fr.{$datepicker}.js"></script>
                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $( "{/literal}#id_{$objRech.nom_variable}{literal}" ).datepicker(
                                                            {
                                                                dateFormat: 'dd/mm/yy',
                                                                changeMonth: true,
                                                                changeYear: true
                                                            });
                                                    });
                                                </script>
                                            {/literal}
                                        {/if}
                                        
                                    {elseif $objRech.type_champ eq 'password'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div class="controls col-sm-6" id="password-input-wrapper">
                                                <input
                                                    type="password"
                                                    class="width-40 {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}"
                                                    placeholder="{$objRech.text_label}"
                                                    id="id_{$objRech.nom_variable}"
                                                    name="{$objRech.nom_variable}"
                                                    {if isset($objRech.valeur_variable) and $objRech.valeur_variable neq ''}value="{$objRech.valeur_variable}"{/if}
                                                    {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                    {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                    {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                        {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                            {$cle}="{$valeur}"
                                                        {/foreach}
                                                    {/if}
                                                    {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                        {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                            {$cle}="{$valeur}"
                                                        {/foreach}
                                                    {/if}
                                                    {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                >
                                            </div>
                                        </div>
                                    {elseif $objRech.type_champ eq 'radio'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div class="col-sm-6 controls">
                                                <div class="vd_radio radio-success">
                                                    {foreach from=$objRech.lesitem key=valeur_radio item=nom_radio name=foo}
                                                        <input 
                                                            type="radio" 
                                                            class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}"
                                                            name="{$objRech.nom_variable}"
                                                            id="id_{$objRech.nom_variable}{$smarty.foreach.foo.iteration}"
                                                            value="{$valeur_radio}" 
                                                            {if $valeur_radio eq $objRech.valeur_variable}checked{/if}
                                                            {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                        >
                                                        <label  for="id_{$objRech.nom_variable}{$smarty.foreach.foo.iteration}">{$nom_radio}</label>
                                                    {/foreach} 
                                                </div>
                                            </div>
                                        </div>

                                    {elseif $objRech.type_champ eq 'checkbox'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div class="col-sm-6 controls">
                                                <div class="vd_checkbox checkbox-success">
                                                    {foreach from=$objRech.lesitem key=valeur_checkbox item=nom_checkbox}
                                                        <input
                                                            type="checkbox"
                                                            class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}"
                                                            name="{$objRech.nom_variable}[]"
                                                            value="{$valeur_checkbox}"
                                                            id="id_{$objRech.nom_variable}[]"
                                                            {if is_array($objRech.valeur_variable) and in_array($valeur_checkbox, $objRech.valeur_variable)}checked{/if}
                                                            {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                        >
                                                        <label for="id_{$objRech.nom_variable}[]"> {$valeur_checkbox} </label>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>
                                    {elseif $objRech.type_champ eq 'email'}
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                            <div id="email-input-wrapper" class="controls col-sm-6">
                                                <input
                                                        type="email"
                                                        placeholder="{$objRech.text_label}"
                                                        class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}"
                                                        id="id_{$objRech.nom_variable}"
                                                        name="{$objRech.nom_variable}"
                                                        {if isset($objRech.valeur_variable) and $objRech.valeur_variable neq ''}value="{$objRech.valeur_variable}"{/if}
                                                        {if isset($objRech.size_champ) and $objRech.size_champ neq ''}size="{$objRech.size_champ}"{/if}
                                                        {if isset($objRech.style) and $objRech.style neq ''}style="{$objRech.style}"{/if}
                                                        {if isset($objRech.tableau_attribut) and $objRech.tableau_attribut|is_array}
                                                            {foreach from=$objRech.tableau_attribut key=cle item=valeur}
                                                                {$cle}="{$valeur}"
                                                            {/foreach}
                                                        {/if}
                                                        {if isset($objRech.fonction_javascript) and $objRech.fonction_javascript|is_array}
                                                            {foreach from=$objRech.fonction_javascript key=cle item=valeur}
                                                                {$cle}="{$valeur}"
                                                            {/foreach}
                                                        {/if}
                                                        {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                    >
                                            </div>
                                        </div>
                                    {/if}
                                {/if}
                            {/foreach}
                            {if isset($bforsupp) && $bforsupp}
                                 {$htmlformsupp}
                            {/if}
                            <div class="form-group form-actions">
                                <div class="col-sm-3"> </div>
                                <div class="col-sm-6">
                                    {if isset($itemBoutons.reset)}
                                        <a href="{$itemBoutons.reset.url}">
                                            <button
                                                type="button"
                                                class="btn vd_btn vd_bg-grey"
                                                {if isset($itemBoutons.reset.tableau_attribut) and $itemBoutons.reset.tableau_attribut|is_array}
                                                    {foreach from=$itemBoutons.reset.tableau_attribut key=cle item=valeur}
                                                        {$cle}="{$valeur}"
                                                    {/foreach}
                                                {/if}
                                                {if isset($itemBoutons.reset.fonction_javascript) and $itemBoutons.reset.fonction_javascript|is_array}
                                                    {foreach from=$itemBoutons.reset.fonction_javascript key=cle item=valeur}
                                                        {$cle}="{$valeur}"
                                                    {/foreach}
                                                {/if}
                                            > Annuler</button>
                                        </a>
                                    {/if}
                                    {if isset($itemBoutons.valider)}
                                        <button
                                            type="submit"
                                            class="btn vd_btn vd_bg-green"
                                            id="id_{$itemBoutons.valider.nom_variable}"
                                            name="{$itemBoutons.valider.nom_variable}"
                                            
                                            {if isset($itemBoutons.valider.tableau_attribut) and $itemBoutons.valider.tableau_attribut|is_array}
                                                {foreach from=$itemBoutons.valider.tableau_attribut key=cle item=valeur}
                                                    {$cle}="{$valeur}"
                                                {/foreach}
                                            {/if}
                                            {if isset($itemBoutons.valider.fonction_javascript) and $itemBoutons.valider.fonction_javascript|is_array}
                                                {foreach from=$itemBoutons.valider.fonction_javascript key=cle item=valeur}
                                                    {$cle}="{$valeur}"
                                                {/foreach}
                                            {/if}
                                            onclick="this.form.action='';document.getElementById('formList').setAttribute('target','_top');"
                                            ><i class="fa fa-search"></i> Rechercher
                                        </button>
                                    {/if}
                                    <button type="submit" class="btn vd_btn vd_bg-green" >
                                        <a style="color:white;" target="_blank" 
                                            onclick="document.getElementById('formList').setAttribute('target','_BLANK');
                                            document.getElementById('formList').setAttribute('action','print_liste_rdv_a_traiter.php');">Imprimer
                                        </a>
                                    </button>

                                    {if isset($itemBoutons.csv) && $bCsv}
                                        <button
                                            type="submit"
                                            class="btn vd_btn vd_bg-blue vd_white"
                                            {if isset($itemBoutons.csv.style) and $itemBoutons.csv.style neq ''}style="{$itemBoutons.csv.style}"{/if}
                                            {if isset($itemBoutons.csv.tableau_attribut) and $itemBoutons.csv.tableau_attribut|is_array}
                                                {foreach from=$itemBoutons.csv.tableau_attribut key=cle item=valeur}
                                                    {$cle}="{$valeur}"
                                                {/foreach}
                                            {/if}
                                            {if isset($itemBoutons.csv.fonction_javascript) and $itemBoutons.csv.fonction_javascript|is_array}
                                                {foreach from=$itemBoutons.csv.fonction_javascript key=cle item=valeur}
                                                    {$cle}="{$valeur}"
                                                {/foreach}
                                            {/if}
                                            onclick="this.form.action='main_csv.php';document.getElementById('formList').setAttribute('target','_BLANK');"
                                        ><i class="icon-ok"></i> {$itemBoutons.csv.text_label}</button>
                                    {/if}
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="no-print" style="margin-bottom:20px;"><b>{$iTabListeCount} {$sLabelNbrLigne}</b></div>
    {/if}

    {if $bLabelCreationElem}
        {if ! $bFormPopup}
           
            <div>
                {if $sLabelCreationElem!=''}
                <a href="{$sLabelCreationElemUrl}&pagesimple={$pagesimple}" alt="{$sLabelCreationElem}">
                    <button type="button" class="btn vd_btn vd_bg-green"><i class="fa fa-plus fa-fw"></i>{$sLabelCreationElem}</button>
                      {if $bActivtraduction=='Yes'}
                     &nbsp; <a href="#" onclick="renvoi_info_traduction('btAjout','{$sFli_LinkUrl}','{$sLangueUser}','{$sLabelCreationElem|replace:'\'':'\\\''}','{$sNomTable}','');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                     {/if}
                </a>
                {/if}
                {if $bBtnRetour}
                    <div>
                        <a href="{$sDirRetour}&pagesimple={$pagesimple}" alt="">
                            <button type="button" class="btn vd_btn vd_bg-green"><i class="fa fa-plus fa-fw"></i>Retour</button>
                        </a>
                    </div>
                {/if}

                {if isset($bboutonpplus) and $bboutonpplus}
                 <a href="{$sDirRetourboutonplus}" alt="">
                     <button type="button" class="btn vd_btn vd_bg-green"><i class="fa fa-plus fa-fw"></i>{$titreboutonplus}</button>
                 </a>
                 {/if}

            </div>
            <br/>
        {else}
            <div>
                <a href="#creerModal" class="openModal" id="test" style="text-decoration:none;color:#00e;">{$sLabelCreationElem}</a>
                {if $bActivtraduction=='Yes'}
                     &nbsp;<a href="#" onclick="renvoi_info_traduction('btAjout','{$sFli_LinkUrl}','{$sLangueUser}','{$|replace:'\'':'\\\''}','{$sNomTable}','');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                 {/if}
                <aside id="creerModal" class="modal">
                    <div style="overflow-y:auto;max-height:85%;background:#FFF;text-shadow:none;">
                        {include file='formulaire.tpl'}
                        <a href="#close" title="Fermer" style="top:15px;right:15px;">Fermer</a>
                    </div>
                </aside>
                {if ! $bMessageSuccesForm and $bMessageErreurForm}
                    <script>
                        creermodal = document.getElementById('test').click();
                    </script>
                {/if}
            </div>
        {/if}

    {else}
        {if $bBtnRetour}
            <div>
                <a href="{$sDirRetour}&pagesimple={$pagesimple}" alt="">
                    <button type="button" class="btn vd_btn vd_bg-green"><i class="fa fa-plus fa-fw"></i>Retour</button>
                </a>
            </div>
        {/if}

    <br/>
    {/if}


    {if $bAffListe}
        
        {if $bActiveFormSelect  or $bRadioSelect or $bCheckboxSelect}<form method="post" action="{$urlFormList}">{/if}


         {if isset($sDivplus)}
            {$sDivplus}
        {/if}


        <div class="row">
            <div class="col-md-12">
                <div class="panel widget" >
                    <div class="panel-heading vd_bg-grey">
                        <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span>{$sTitreListe}

                        </h3>
                        {if isset($sTitreplus)}
                            {$sTitreplus}
                        {/if}
                    </div>
                    <div class="panel-body-list table-responsive" style="overflow: auto;">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    {if $bActiveFormSelect  or $bRadioSelect or $bCheckboxSelect}
                                        {if $bRadioSelect}<th>°</th>{/if}
                                        {if $bCheckboxSelect}<th>#</th>{/if}                    
                                    {/if}
                                    {foreach from=$aEnteteListe item=objEnteteListe}
                                        {if $objEnteteListe.objElement.type_champ!='hidden'}
                                        <th>{$objEnteteListe.sLabel}
                                        {if $bActivtraduction=='Yes'}
                                        &nbsp;<a href="#" onclick="renvoi_info_traduction('{$objEnteteListe.objElement.nom_variable}','{$sFli_LinkUrl}','{$sLangueUser}','{$objEnteteListe.sLabel|replace:'\'':'\\\''}','{$sNomTable}','{$objEnteteListe.objElement.mapping_champ}');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                                        {/if}
                                        </th>
                                        {/if}

                                    {/foreach}
                                    {* :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: *}
                                    {if $bAffFiche or $bAffMod or $bAffSupp}
                                        <th>Actions</th>
                                    {/if}
                                </tr>
                            </thead>
                            <tbody>
                            {foreach from=$aListe item=objListe}
                                <tr>
                                    {if $bActiveFormSelect or $bRadioSelect or $bCheckboxSelect}
                                        {if $bRadioSelect}<td class="center"><input type="radio" value="{$objListe.id}" name="iIdSelected"></td>{/if}
                                        {if $bCheckboxSelect}<td class="center"><input type="checkbox" value="{$objListe.id}" name="iIds[]"></td>{/if}                        
                                    {/if}
                                    {foreach name="enteteliste" from=$aEnteteListe item=objEnteteListe}
                                        {if $objEnteteListe.objElement.type_champ!='hidden'}
                                            <td class="center">
                                                {if $smarty.foreach.enteteliste.first}
                                                    {if isset($objListe.liste_fils) and $objListe.liste_fils|is_array and $objListe.liste_fils|@count > 0}
                                                        <input type="submit" value=" + " class="class_form_list_toggle_input">
                                                    {/if}
                                                {/if}

                                                {if $bActiveFormSelect}
                                                    {if $objEnteteListe.objElement.activ_form_select=='ok'}
                                                        <!-- ---------------- TEXT ---------------- -->
                                                        {if $objEnteteListe.objElement.type_champ=='text'}
                                                            <input type="text" name="{$objEnteteListe.objElement.nom_variable}" value="{$objListe[$objEnteteListe.objElement.nom_variable]}" >
                                                        {/if}
                                                        <!-- ---------------- SELECT ---------------- -->
                                                        {if $objEnteteListe.objElement.type_champ=='select'}
                                                            <select
                                                                style="padding:5px;"
                                                                id="id_form_{$objEnteteListe.objElement.nom_variable}"
                                                                name="{$objEnteteListe.objElement.nom_variable}{if isset($objEnteteListe.objElement.multiple)}[]{/if}"
                                                                {if isset($objEnteteListe.objElement.multiple)}multiple{/if}

                                                                {$objEnteteListe.objElement.fonction_javascript}
                                                            >
                                                                <option value=""></option>
                                                                {if is_array($listeElemSelect)}
                                                                    {foreach from=$listeElemSelect key=id_valeur_possible item=valeur_possible_bdd}
                                                                        <option value="{$id_valeur_possible}" {if $objListe[$objEnteteListe.objElement.nom_variable] eq $valeur_possible_bdd}selected{/if}>
                                                                            {$valeur_possible_bdd}
                                                                        </option>
                                                                    {/foreach}
                                                                {/if}
                                                            </select>
                                                        {/if}
                                                        <!-- ---------------- CHECKBOX ---------------- -->
                                                        {if $objEnteteListe.objElement.type_champ=='checkbox'}
                                                            <table>
                                                                <tbody>
                                                               {foreach from=$allElements.lesitem key=valeur_checkbox item=nom_checkbox}
                                                                <tr>
                                                                    <td style="padding-right:10px;">
                                                                        <input
                                                                            type="checkbox"
                                                                            name="{$objEnteteListe.objElement.nom_variable}[]"
                                                                            value="{$valeur_checkbox}"
                                                                            {if is_array($objListe.tableauChecked) and in_array($valeur_checkbox, $objListe.tableauChecked)}checked{/if}
                                                                        >

                                                                    </td>
                                                                    <td style="padding-right:20px;">{$nom_checkbox}</td>
                                                                </tr>
                                                                {/foreach}
                                                                </tbody>
                                                            </table>
                                                        {/if}
                                                        <!-- ---------------- RADIO ---------------- -->
                                                        {if $objEnteteListe.objElement.type_champ=='radio'}
                                                            <table>
                                                                <tbody>
                                                               {foreach from=$allElements.lesitem key=valeur_radio item=nom_radio}
                                                                <tr>
                                                                    <td style="padding-right:20px;padding-bottom:0;vertical-align:middle;height:32px;">
                                                                        <input
                                                                            type="radio"
                                                                            name="{$objEnteteListe.objElement.nom_variable}"
                                                                            value="{$valeur_radio}"
                                                                            {if $valeur_radio eq $objListe.checked}checked{/if}
                                                                        >
                                                                    </td>
                                                                    <td style="padding-bottom:0;vertical-align:middle;height:32px;">{$nom_radio}</td>
                                                                </tr>
                                                                {/foreach}
                                                                </tbody>
                                                            </table>
                                                        {/if}
                                                    {/if}
                                                {else}
                                                    {if $objEnteteListe.objElement.type_champ=='montant'}
                                                        {$objListe[$objEnteteListe.objElement.nom_variable]} &euro;
                                                    {else}
                                                        {$objListe[$objEnteteListe.objElement.nom_variable]}
                                                    {/if}

                                                {/if}
                                            </td>
                                        {/if}
                                    {/foreach}


                                    {* Colonne "actions" à droite avec les îcones *}
                                    {if $bAffFiche or $bAffMod or $bAffSupp}
                                        <td class="menu-action rounded-btn" id="icones_action">
                                            {if $bAffFiche}
                                                <a href="{$objListe.sUrlFiche}&pagesimple={$pagesimple}" data-original-title="Visualiser" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-green vd_green">
                                                    <i class="fa fa-eye"></i> 
                                                </a>
                                            {/if}
                                            {if $bAffMod}
                                                <a href="{$objListe.sUrlForm}&pagesimple={$pagesimple}" data-original-title="Modifier" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow">
                                                    <i class="fa fa-pencil"></i> 
                                                </a>
                                            {/if}
                                            {if $bAffSupp}
                                                <a data-original-title="Supprimer" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-red vd_red"
                                                    href="#" onclick="bconf=confirm('Voulez supprimer cette ligne');if(bconf)location.replace('{$objListe.sUrlSupp}&pagesimple={$pagesimple}');" >
                                                    <i class="fa fa-times"></i> 
                                                </a>    
                                            {/if}
                                          </td>
                                    {/if}
                                </tr>
                                {if isset($objListe.liste_fils) and $objListe.liste_fils|is_array and $objListe.liste_fils|@count > 0}
                                    <tr>
                                        <td style="padding:0;" colspan="{$iNombreColonneListe}">
                                            <div class="class_form_list_toggle_div">
                                                <div style="padding:20px 20px 0 20px;">
                                                    {foreach from=$objListe.liste_fils item=sTpl}
                                                        {$sTpl}
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                {/if}
                            {/foreach}
                            <tr>
                                 {foreach from=$aEnteteListe item=objEnteteListe}
                                    {if $objEnteteListe.objElement.type_champ!='hidden'}
                                        <td height="200px"></td>
                                    {/if}
                                {/foreach}
                                {if $bAffFiche or $bAffMod or $bAffSupp}
                                    <td height="200px"></td>
                                {/if}
                            </tr>
                            </tbody>
                        </table>
                        {if $bActiveFormSelect   or $bRadioSelect or $bCheckboxSelect}
                            <div style="clear:both;float:right;margin-top:20px;">
                                <input type="submit" value="Valider" style="background-color:#94B52C;border:1px solid #719C27;border-radius:8px;padding:7px 16px;font-size:11px;color:#FFF;cursor:pointer;">
                            </div>
                            </form>
                        {/if}
                        {literal}
                        <script type="text/javascript">
                            $(document).ready(function() {
                                $('.class_form_list_toggle_div').hide();
                                $('.class_form_list_toggle_input').click(function() {
                                    $(this).parent().parent().next().find('.class_form_list_toggle_div').first().slideToggle();
                                });
                            });
                        </script>
                        {/literal}
                        {if isset($bPagination) and $bPagination and isset($aPaginationListe) and isset($aPaginationListe.select) and isset($aPaginationListe.liste)}
                            <ul class="pagination">
                                <li><a href="{$aPaginationListe.liste.page_premiere}&pagesimple={$pagesimple}">&laquo;&laquo;</a></li>
                                <li><a href="{$aPaginationListe.liste.page_precedente}&pagesimple={$pagesimple}">&laquo;</a></li>
                                
                                {foreach from=$aPaginationListe.liste.page_liste item=page}
                                    {if isset($page.selected) and $page.selected}
                                        <li class="active"><a href="#">{$page.numero}</a></li>
                                    {else}
                                       <li><a href="{$page.url}&pagesimple={$pagesimple}">{$page.numero}</a></li>
                                    {/if}
                                {/foreach}

                                <li><a href="{$aPaginationListe.liste.page_suivante}&pagesimple={$pagesimple}">&raquo;</a></li>
                                <li><a href="{$aPaginationListe.liste.page_derniere}&pagesimple={$pagesimple}">&raquo;&raquo;</a></li>
                            </ul>
                        {/if}

                    
                    </div>
                </div>
                <!-- Panel Widget --> 
            </div>
            <!-- col-md-12 --> 
        </div>
        <!-- row -->
    {/if}

    {if isset($itemBoutonsListe) and $itemBoutonsListe|is_array and $itemBoutonsListe|@count > 0}
        <div style="clear:both;float:right;margin-top:20px;">
            {if isset($itemBoutonsListe.precedent)}
                <a href="{$itemBoutonsListe.precedent.url}&pagesimple={$pagesimple}">
                    <input
                            type="button"
                            value="{$itemBoutonsListe.precedent.text_label}"
                            {if isset($itemBoutonsListe.precedent.style) and $itemBoutonsListe.precedent.style neq ''}style="{$itemBoutonsListe.precedent.style}"{/if}
                    {if isset($itemBoutonsListe.precedent.tableau_attribut) and $itemBoutonsListe.precedent.tableau_attribut|is_array}
                        {foreach from=$itemBoutonsListe.precedent.tableau_attribut key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    {if isset($itemBoutonsListe.precedent.fonction_javascript) and $itemBoutonsListe.precedent.fonction_javascript|is_array}
                        {foreach from=$itemBoutonsListe.precedent.fonction_javascript key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    >
                </a>
            {/if}
            {if isset($itemBoutonsListe.suivant)}
                <a href="{$itemBoutonsListe.suivant.url}&pagesimple={$pagesimple}">
                    <input
                            type="button"
                            id="id_{$itemBoutonsListe.suivant.nom_variable}"
                            name="{$itemBoutonsListe.suivant.nom_variable}"
                            value="{$itemBoutonsListe.suivant.text_label}"
                            {if isset($itemBoutonsListe.suivant.style) and $itemBoutonsListe.suivant.style neq ''}style="{$itemBoutonsListe.suivant.style}"{/if}
                    {if isset($itemBoutonsListe.suivant.tableau_attribut) and $itemBoutonsListe.suivant.tableau_attribut|is_array}
                        {foreach from=$itemBoutonsListe.suivant.tableau_attribut key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    {if isset($itemBoutonsListe.suivant.fonction_javascript) and $itemBoutonsListe.suivant.fonction_javascript|is_array}
                        {foreach from=$itemBoutonsListe.suivant.fonction_javascript key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    >
                </a>
            {/if}
            {if isset($itemBoutonsListe.valider)}
                <a href="{$itemBoutonsListe.valider.url}&pagesimple={$pagesimple}">
                    <input
                            type="button"
                            id="id_{$itemBoutonsListe.valider.nom_variable}"
                            name="{$itemBoutonsListe.valider.nom_variable}"
                            value="{$itemBoutonsListe.valider.text_label}"
                            {if isset($itemBoutonsListe.valider.style) and $itemBoutonsListe.valider.style neq ''}style="{$itemBoutonsListe.valider.style}"{/if}
                    {if isset($itemBoutonsListe.valider.tableau_attribut) and $itemBoutonsListe.valider.tableau_attribut|is_array}
                        {foreach from=$itemBoutonsListe.valider.tableau_attribut key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    {if isset($itemBoutonsListe.valider.fonction_javascript) and $itemBoutonsListe.valider.fonction_javascript|is_array}
                        {foreach from=$itemBoutonsListe.valider.fonction_javascript key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    >
                </a>
            {/if}
            {if isset($itemBoutonsListe.annuler)}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="{$itemBoutonsListe.annuler.url}&pagesimple={$pagesimple}">
                    <input
                            type="button"
                            value="{$itemBoutonsListe.annuler.text_label}"
                            {if isset($itemBoutonsListe.annuler.style) and $itemBoutonsListe.annuler.style neq ''}style="{$itemBoutonsListe.annuler.style}"{/if}
                    {if isset($itemBoutonsListe.annuler.tableau_attribut) and $itemBoutonsListe.annuler.tableau_attribut|is_array}
                        {foreach from=$itemBoutonsListe.annuler.tableau_attribut key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    {if isset($itemBoutonsListe.annuler.fonction_javascript) and $itemBoutonsListe.annuler.fonction_javascript|is_array}
                        {foreach from=$itemBoutonsListe.annuler.fonction_javascript key=cle item=valeur}
                            {$cle}="{$valeur}"
                        {/foreach}
                    {/if}
                    >
                </a>
            {/if}
        </div>
    {/if}
{/if}
</div>

{if isset($bmodalfusionpateint) and $bmodalfusionpateint}
    {include file="modal_fusion_patient.tpl"}
{/if}