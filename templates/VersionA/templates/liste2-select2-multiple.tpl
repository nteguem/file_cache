<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/impression/gestion_liste_rdv_jour_print.{$gestionListeRdv}.css" media="print">

{literal}
    <script type="text/javascript">
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
        });

        function open_modal_update(idunique, idtranche) {

            document.getElementById("iframerhome").src = "modal/modal_disponibilite_modification.php?id_user=&idunique=" + idunique + "&idtranche=" + idtranche;
            $('#myModalHome').css("overflow-y", "scroll");
            $('#myModalHome').modal('show');
            setTimeout(function() {
                resizeIframe(document.getElementById('iframerhome'));
            }, 1000);
        }


    </script>
    <style type="text/css">

        .vd_panel-header h1 {
            position: relative;
            text-indent: -9999px;
            line-height: 0;
        }
        .vd_panel-header h1::after {
            content: "{/literal}{$sTitreListe}{literal}";
            text-indent: 0;
            display: block;
            line-height: initial;
        }
        @media print
        {
            .form-basic{display: none};
        }

        @media (max-width: 1600px){
            .form-group {
                height: 45px;
            }

        }


    </style>

{/literal}

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
{if isset($aListe)}
<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
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
    {if isset($sRetourListe) and $sRetourListe neq ''}
        <div>
            <a href="{$sRetourListe}" alt="{$sLabelRetourListe}">
                <button type="button" class="btn vd_btn vd_bg-grey"><i class="fa fa-arrow-circle-left fa-fw"></i>{$sLabelRetourListe}</button>
            </a>
        </div>
    {/if}
    {* DEBUT FILTRES *}

    {if isset($aRech) and $aRech|@count > 0}
        <div class="row" id="form-basic" style="margin-bottom:0px;">
            <div class="col-md-12">
                <div class="panel widget" style="margin-bottom:0px;">
                    <div class="panel-heading vd_bg-grey">
                        <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>{$sLabelRecherche}</h3>
                    </div>
                    <div class="panel-body" style="padding-bottom:0px;">
                        <form class="form-horizontal" action="" role="form" id="formList" method="GET" {if isset($bTelechargementFichier) and $bTelechargementFichier}enctype="multipart/form-data"{/if} style="margin-left:-50px;">
                            <input type="hidden" name="dir" value="{$sDirRech}">
                            <input type="hidden" name="pagesimple" value="" id="idpagesimple">
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
                                        <div class="form-group col-lg-3 col-sm-4" >
                                            <label class="col-sm-6 control-label">{$objRech.text_label}

                                            </label>
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
                                       {* {elseif $objRech.type_champ eq 'montant'}  *}
                                    {elseif $objRech.type_champ eq 'heure'}
                                        {if isset($objRech.select_autocomplete) and $objRech.select_autocomplete eq 'ok'}
                                            <div class="form-group col-lg-3 col-sm-4" id="label{$objRech.nom_variable}">
                                                <label class="col-sm-6 control-label">{$objRech.text_label_filtre}</label>
                                            </div>
                                        {/if}
                                        <div class="form-group col-lg-3 col-sm-4">
                                            <label class="col-sm-6 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
                                            <div class="col-sm-6 controls">
                                                <div class="input-group bootstrap-timepicker" id="heure_{$objRech.nom_variable}">
                                                    <input type="text" id="heuredebut_{$objRech.nom_variable}" tabindex="23"
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
                                                    $("{/literal}#heure_{$objRech.nom_variable}").mask("99:99");{literal}

                                            </script>
                                        {/literal}


                                    {elseif $objRech.type_champ eq 'select'}
                                        {if isset($objRech.select_autocomplete) and $objRech.select_autocomplete eq 'ok'}
                                            <div class="form-group col-lg-3 col-sm-4">
                                                <label class="col-sm-6 control-label">{$objRech.text_label_filtre}</label>
                                                <div class="col-sm-6 controls">
                                                    <input type='text'
                                                    name='rech_{$objRech.nom_variable}'
                                                    id='id_rech{$objRech.nom_variable}'
                                                    onKeyUp="affiche_liste_generique('{$objRech.table_item}','{$objRech.id_table_item}','{$objRech.affichage_table_item}','{$objRech.supplogique_table_item}', '{$objRech.tabfiltre_autocomplete}',this.value,'id_form_{$objRech.nom_variable}');">
                                                </div>
                                            </div>
                                        {/if}
                                        <div class="form-group col-lg-3 col-sm-4">
                                            <label class="col-sm-6 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
                                            <div class="col-sm-6 controls">
                                                <select
                                                id="id_form_{$objRech.nom_variable}2"
                                                class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if} js-example-basic-multiple" {if isset($objRech.multiple)}multiple="multiple"{/if}
                                                name="{$objRech.nom_variable}{if isset($objRech.multiple)}[]{/if}"
                                                {if isset($objRech.multiple)}multiple{/if}

                                                {$objRech.fonction_javascript}
                                                >
                                                    {* <option value="" {if $objRech.valeur_variable eq ''}selected{/if}></option> *}
                                                    {if is_array($objRech.lesitem)}
                                                    {foreach from=$objRech.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                                        {* <option value="{$id_valeur_possible}" {if $objRech.valeur_variable eq $id_valeur_possible}selected{/if}> *}
                                                        <option value="{$id_valeur_possible}" {if isset($objRech.multiple)}
                                                        {if is_array($objRech.valeur_variable) and in_array($id_valeur_possible, $objRech.valeur_variable)}selected{/if}
                                                        {else}{if $objRech.valeur_variable eq $id_valeur_possible}selected{/if}{/if}>
                                                            {$valeur_possible_bdd}
                                                        </option>
                                                    {/foreach}
                                                    {/if}
                                                </select>
                                            </div>
                                        </div>
                                    {elseif $objRech.type_champ eq 'hidden'}
                                            <input
                                                type="hidden"
                                                {if isset($objRech.nom_variable)}name="{$objRech.nom_variable}"{/if}
                                                {if isset($objRech.valeur_variable)}value="{$objRech.valeur_variable}"{/if}
                                            >
                                    {elseif $objRech.type_champ eq 'montant'}


                                    {elseif $objRech.type_champ eq 'textarea'}
                                        <div class="form-group col-lg-3 col-sm-4">
                                            <label class="col-sm-3 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
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
                                        <div class="form-group col-lg-3 col-sm-4">
                                            <label class="col-sm-8 control-label">{$objRech.text_label}</label>
                                        </div>

                                {elseif $objRech.type_champ eq 'date'}
                                {* Interval de recherche *}
                                {if isset($objRech.recherche_intervalle_date) and $objRech.recherche_intervalle_date eq 'ok'}
                                        {* Date de début *}
                                        {* <div class="form-group col-lg-3 col-sm-4" style="Visibility : hidden"> <label class="col-sm-6 control-label">{$objRech.recherche_intervalle_date_label[0]}</label></div> *}

                                        <div id="liste_hidden" class="form-group col-sm-12" style="Visibility : hidden"></div>

                                        <div class="form-group col-lg-3 col-sm-4">
                                            {if isset($objRech.recherche_intervalle_date_label) and isset($objRech.recherche_intervalle_date_label[0]) and $objRech.recherche_intervalle_date_label[0] neq ''}
                                                <label class="col-sm-6 control-label">{$objRech.recherche_intervalle_date_label[0]}</label>
                                            {/if}
                                            <div class="col-sm-6 controls">
                                                <div class="input-group">
                                                    <input
                                                        type="text"
                                                        id="id_{$objRech.nom_variable}_1"
                                                        name="{$objRech.nom_variable}[]"
                                                        style = "border-radius: 5px 0 0 5px;"
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
                                        </div>
                                            {* Date de fin *}
                                        <div class="form-group col-lg-3 col-sm-4">

                                            {if isset($objRech.recherche_intervalle_date_label) and isset($objRech.recherche_intervalle_date_label[1]) and $objRech.recherche_intervalle_date_label[1] neq ''}
                                                <label class="col-sm-6 control-label">{$objRech.recherche_intervalle_date_label[1]}</label>
                                            {/if}
                                            <div class="col-sm-6 controls">
                                                <div class="input-group">
                                                    <input
                                                        type="text"
                                                        id="id_{$objRech.nom_variable}_2"
                                                        name="{$objRech.nom_variable}[]"
                                                        style = "border-radius: 5px 0 0 5px;"
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
                                            <script type="text/javascript" src="js/datepicker-fr.{$datePickerFr}.js"></script>
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
                                                            changeYear: true,
                                                            minDate: curdate
                                                        });
                                                    $( '[data-datepicker]' ).click(function(e){
                                                        var data=$(this).data('datepicker');
                                                        $(data).focus();
                                                    });

                                                });
                                            </script>
                                        {/literal}
                                    {/if}
                                    {if $objRech.recherche_intervalle_date eq ''}
                                        <div class="form-group col-lg-3 col-sm-4">
                                            <label class="col-sm-6 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
                                            <div class="col-sm-6 controls">
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
                                            <script type="text/javascript">
                                                $(document).ready(function() {
                                                    $( "{/literal}#id_{$objRech.nom_variable}{literal}" ).datepicker({ dateFormat: 'dd/mm/yy'});
                                                    $( '[data-datepicker]' ).click(function(e){
                                                        var data=$(this).data('datepicker');
                                                        $(data).focus();
                                                    });
                                                });
                                            </script>
                                        {/literal}
                                    {/if}

                                    {elseif $objRech.type_champ eq 'password'}
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
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
                                        <div class="form-group col-sm-2">
                                            <label class="col-sm-2 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
                                            <div class="col-sm-6 controls">
                                                <div class="vd_radio radio-success">
                                                    {foreach from=$objRech.lesitem key=valeur_radio item=nom_radio}
                                                        <input
                                                            type="radio"
                                                            class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}"
                                                            name="{$objRech.nom_variable}"
                                                            id="id_{$objRech.nom_variable}"
                                                            value="{$valeur_radio}"
                                                            {if $valeur_radio eq $objRech.valeur_variable}checked{/if}
                                                            {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if}
                                                        >
                                                        <label  for="id_{$objRech.nom_variable}">{$nom_radio}</label>
                                                    {/foreach}
                                                </div>
                                            </div>
                                        </div>

                                    {elseif $objRech.type_champ eq 'checkbox'}
                                        <div class="form-group  col-sm-2">
                                            <label class="col-sm-2 control-label">{$objRech.text_label}
                                                {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                            </label>
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
                                            <label class="col-sm-2 control-label">{$objRech.text_label}
                                                    {if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'}<span class="vd_red">*</span>{/if}
                                                </label>
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

                            {* BOUTON ACTION *}
                            <div class="form-group form-actions">
                                <div class="col-sm-6 col-lg-12" style="text-align:center;">
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
                                            onclick="document.getElementById('formList').setAttribute('action','main.php');document.getElementById('formList').setAttribute('target','_top');"
                                        ><i class="fa fa-search"></i> Rechercher</button>

                                    {/if}
                                    <button type="submit" class="btn vd_btn vd_bg-green" ><a style="color:white;" target="_blank" onclick="document.getElementById('formList').setAttribute('target','_BLANK');document.getElementById('formList').setAttribute('action','print_liste.php');">Imprimer</a></button>
                                    {* <button type="button" class="btn vd_btn vd_bg-green" ><a style="color:white;" href="javascript:window.print()">Imprimer</a></button> *}
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
                            {* FIN BOUTON ACTION *}
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {/if}
    {* FIN FILTRES *}
    {if $bLabelCreationElem}
        {if ! $bFormPopup}
            {if $sLabelCreationElem!=''}
            <div>
                <a href="{$sLabelCreationElemUrl}" alt="{$sLabelCreationElem}">
                    <button type="button" class="btn vd_btn vd_bg-green"><i class="fa fa-plus fa-fw"></i>{$sLabelCreationElem}</button>
                </a>
            </div>
            {/if}
        {else}
            <div>
                <a href="#creerModal" class="openModal" id="test" style="text-decoration:none;color:#00e;">{$sLabelCreationElem}</a>
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
    {/if}
    {if $bAffListe}

        {if $bActiveFormSelect}<form method="post" action="{$urlFormList}">{/if}
        <div class="row" id="print_rdv">
            <div class="col-md-12">
                <div class="panel widget">
                    <div id="header_print" class="panel-heading vd_bg-grey" style="display:flex; justify-content: space-between;height: 35px; margin-top:10px;">
                        <h3 class="panel-title" id="result_search"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span>{$sTitreListe} : {$iTabListeCount} {$sLabelNbrLigne}</h3>
                    </div>
                    <div class="panel-body-list table-responsive" id="panel-body_print">
                        {* <table class="table table-bordered"> *}
                        <table class="table table-bordered" id="data-tables">
                            <thead>
                                <tr id="enTete">
                                    {if $bActiveFormSelect}
                                        {if $bRadioSelect}<th>°</th>{/if}
                                        {if $bCheckboxSelect}<th>#</th>{/if}
                                    {/if}

                                    {foreach from=$aEnteteListe item=objEnteteListe}
                                           {if  $objEnteteListe.objElement.type_champ!='chplussansafficheliste'}
                                        <th>{$objEnteteListe.sLabel}</th>
                                        {/if}
                                    {/foreach}
                                    {if $bAffFiche or $bAffMod or $bAffSupp}
                                        <th>Actions</th>
                                    {/if}
                                </tr>
                            </thead>
                            <tbody id="content-colonneTab">
                            {foreach from=$aListe item=objListe}

                                <tr {if isset($bclicktr) and $bclicktr}style="cursor:pointer" onclick="open_modal_update('','{$objListe.id}')"{/if}>
                                    {if $bActiveFormSelect}
                                        {if $bRadioSelect}<td class="center"><input type="radio" value="{$objListe.id}" name="iIdSelected"></td>{/if}
                                        {if $bCheckboxSelect}<td class="center"><input type="checkbox" value="{$objListe.id}" name="iIds[]"></td>{/if}
                                    {/if}
                                    {foreach name="enteteliste" from=$aEnteteListe item=objEnteteListe}
                                     {if  $objEnteteListe.objElement.type_champ!='chplussansafficheliste'}
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

                                                {if $objEnteteListe.objElement.activ_form_select=='ok'}
                                                    {if $objEnteteListe.objElement.type_champ=='select'}
                                                        <select
                                                            id="id_form_{$objEnteteListe.objElement.nom_variable}"
                                                            {* class="js-example-basic-single" *}
                                                            name="{$objEnteteListe.objElement.nom_variable}"
                                                            onchange="set_status_rdv({$objListe.id},this.value,'liste_rdv');">
                                                            {foreach from=$TabStatus item=objStatus}
                                                                <option value="{$objStatus.id_status}" {if $objStatus.id_status==$objListe.id_action} selected {/if}>{$objStatus.libelle_status}</option>
                                                            {/foreach}
                                                        </select>
                                                    {/if}
                                                {else}
                                                    {$objListe[$objEnteteListe.objElement.nom_variable]}
                                                {/if}
                                            {/if}
                                        </td>
                                        {/if}
                                    {/foreach}
                                    {if $bAffFiche or $bAffMod or $bAffSupp}
                                        <td class="menu-action rounded-btn">
                                            {if $bAffFiche}
                                                <a href="{$objListe.sUrlFiche}" data-original-title="Visualiser" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-green vd_green"> 
                                                    <i class="fa fa-eye"></i> 
                                                </a>
                                            {/if}
                                            {if $bAffMod}
                                                <a href="{$objListe.sUrlForm}" data-original-title="Modifier" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> 
                                                    <i class="fa fa-pencil"></i> 
                                                </a>
                                            {/if}
                                            {if $bAffSupp}
                                                <a data-original-title="Supprimer" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-red vd_red"
                                                    href="#" onclick="bconf=confirm('Voulez supprimer cette ligne');if(bconf)location.replace('{$objListe.sUrlSupp}');" > 
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
                            </tbody>
                            {* <tr><td><br><br><br></td></tr> *}
                        </table>
                        {if $bActiveFormSelect}
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
                                <li><a href="{$aPaginationListe.liste.page_premiere}">&laquo;&laquo;</a></li>
                                <li><a href="{$aPaginationListe.liste.page_precedente}">&laquo;</a></li>
                                
                                {foreach from=$aPaginationListe.liste.page_liste item=page}
                                    {if isset($page.selected) and $page.selected}
                                        <li class="active"><a href="#">{$page.numero}</a></li>
                                    {else}
                                       <li><a href="{$page.url}">{$page.numero}</a></li>
                                    {/if}
                                {/foreach}

                                <li><a href="{$aPaginationListe.liste.page_suivante}">&raquo;</a></li>
                                <li><a href="{$aPaginationListe.liste.page_derniere}">&raquo;&raquo;</a></li>
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
                <a href="{$itemBoutonsListe.precedent.url}">
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
                <a href="{$itemBoutonsListe.suivant.url}">
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
                <a href="{$itemBoutonsListe.valider.url}">
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
                <a href="{$itemBoutonsListe.annuler.url}">
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
