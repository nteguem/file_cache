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

{literal}

    <style type="text/css">
        .active{
            background-color: #e0e0e0;
            border-radius: 10px;
            padding: 0 5px;
        }
    </style>

    <script type="text/javascript">

        function open_messagerie(id_message){
            //alert(id_message);
            window.open("main.php?dir=gestdiscupratlect&idmessage="+id_message,"_self");
        }

        function archiver_message_check() {
            $("#actionmessage").val("archiver");
            if ($(".class_messagerie").is(':checked')) {
                $("#formaction").submit();
            }else{
                $("#actionmessage").val("");
                alert("Aucun message coché !")
            }
            return false;
        }

        function supprimer_message_check() {
            $("#actionmessage").val("supprimer");
            if ($(".class_messagerie").is(':checked')) {
                if(confirm('Voulez vous vraiment supprimer votre sélection ?')){
                    $("#formaction").submit();
                }else{
                    $("#actionmessage").val("");
                   return false;
                }
            }else{
                $("#actionmessage").val("");
                alert("Aucun message coché !")
            }
            return false;
        }

    </script>

{/literal}

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>


{if isset($aRech) and $aRech|@count > 0}
    <div class="row no-print" id="form-basic" style="margin-bottom:0px;">
        <div class="col-md-12">
            <div class="panel widget">
                <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>{$sLabelRecherche}</h3>
                </div>
                <div class="panel-body">
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
                                                   onKeyUp="affiche_liste_generique('{$objRech.table_item}','{$objRech.id_table_item}','{$objRech.affichage_table_item}','{$objRech.supplogique_table_item}', '{$objRech.tabfiltre_autocomplete}',this.value,'id_form_{$objRech.nom_variable}');">
                                        </div>
                                    </div>
                                {/if}
                                    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                                    <?php  $select2Min = filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js');?>
                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.{$select2Min}.js"></script>
                                    {literal}
                                        <script type="text/javascript">
                                            $(document).ready(function() {
                                                $('.js-example-basic-single').select2();
                                            });
                                        </script>
                                    {/literal}
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">{$objRech.text_label}</label>
                                        <div class="col-sm-6 controls">
                                            <select
                                                    id="id_form_{$objRech.nom_variable}"
                                                    class="{if isset($objRech.ctrl_champ) and $objRech.ctrl_champ eq 'ok'} required {/if} js-example-basic-single "
                                                    name="{$objRech.nom_variable}{if isset($objRech.multiple)}[]{/if}"
                                                    {if isset($objRech.multiple)}multiple{/if}

                                                    {$objRech.fonction_javascript}
                                            >
                                                <option value="" ></option>
                                                {if is_array($objRech.lesitem)}
                                                    {foreach from=$objRech.lesitem key=id_valeur_possible item=valeur_possible_bdd}
                                                        <option value="{$id_valeur_possible}">
                                                            {$valeur_possible_bdd}
                                                        </option>
                                                    {/foreach}
                                                {/if}
                                            </select>
                                        </div>
                                    </div>
                                {elseif $objRech.type_champ eq 'hidden'}
                                    <div>
                                        <input
                                                type="hidden"
                                                {if isset($objRech.nom_variable)}name="{$objRech.nom_variable}"{/if}
                                                {if isset($objRech.valeur_variable)}value="{$objRech.valeur_variable}"{/if}
                                                id="id_{$objRech.nom_variable}"
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
                                {elseif $objRech.type_champ eq 'textautocomplete2'}

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">{$objRech.text_label}</label>

                                        <div class="col-sm-6 controls">
                                            <input
                                                    type="text"
                                                    id="id_{$objRech.nom_variable}"
                                                    placeholder="{$objRech.text_label}"
                                                    name="{$objRech.nom_variable}"
                                                    class="" />
                                        </div>
                                    </div>

                                {literal}
                                    <script type="text/javascript">

                                        $( "{/literal}#id_{$objRech.nom_variable}{literal}" ).autocomplete({
                                            source : '{/literal}{$objRech.fichier_php}{literal}',
                                            focus: function (event, ui) {
                                                event.preventDefault();
                                                if($(this).val()==""){
                                                    $( "{/literal}#id_{$objRech.input_hidden}{literal}" ).val("");
                                                    $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("");
                                                }
                                            },
                                            select: function (event, ui) {
                                                event.preventDefault();
                                                if(ui.item.value == 0){
                                                    $(this).val(ui.item.term);
                                                    modal_ajout_patient(ui.item.term);
                                                }else{
                                                    $(this).val(ui.item.nom);
                                                    $( "{/literal}#id_{$objRech.input_hidden}{literal}" ).val(ui.item.value);
                                                    $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("<b><i>"+ui.item.nom+"</i></b>" );
                                                    if(ui.item.tel_mobile != ''){
                                                        $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).append("<br/><b><i>Tel. mobile : "+ui.item.tel_mobile+"</i></b>" );
                                                    }
                                                    if(ui.item.tel_fixe != ''){
                                                        $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).append("<br/><b><i>Tel. fixe : "+ui.item.tel_fixe+"</i></b>" );
                                                    }
                                                    if(ui.item.date_naissance !='00/00/0000'){
                                                        $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).append("<br/><b><i>Date de naissance : "+ui.item.date_naissance+"</i></b>" );
                                                    }
                                                    $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).append("<br/><br/><a href='#' onclick='modal_modifier_patient(\""+ui.item.iduser+"\")'>Consulter la fiche patient</a>" );

                                                }
                                            },
                                            change: function(event, ui) {
                                                //alert(JSON.stringify(ui));
                                                //$( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("");
                                                if (ui.item == null) {

                                                    $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("<span style='color: #FF0000;'>Attention le patient saisie n'existe pas !</span><br/>" +
                                                        "<button id='btn_ajouter_patient' alt='Ajouter un patient' title='Ajouter un patient' onclick='modal_ajout_patient(\"\");' type='button' " +
                                                        "class='btn vd_btn btn-besoin-aide' style='background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; " +
                                                        "-webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;'>Ajouter un patient</button>");

                                                    $( "{/literal}#id_{$objRech.input_hidden}{literal}" ).val("");
                                                    //$( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("");
                                                }
                                                if($(this).val()==""){
                                                    $( "{/literal}#id_{$objRech.input_hidden}{literal}" ).val("");
                                                    $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("");
                                                }


                                            },
                                            close: function (event, ui) {
                                                if($(this).val()==""){
                                                    $( "{/literal}#id_{$objRech.input_hidden}{literal}" ).val("");
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
                                            $( "{/literal}#id_{$objRech.nom_variable}{literal}" ).val(value);
                                            $( "{/literal}#id_{$objRech.input_hidden}{literal}" ).val(id);
                                            $( "{/literal}#erreur_{$objRech.nom_variable}{literal}" ).html("");
                                        }


                                    </script>
                                {/literal}

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

                                    <?php  $datepicker3 = filemtime(PATH_ASSETS.'js/datepicker-fr.js');?>
                                        <script type="text/javascript" src="js/datepicker-fr.{$datepicker3}.js"></script>
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
                                            <script type="text/javascript" src="js/datepicker-fr.js"></script>
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
                                                                                                                                   ><i class="fa fa-search"></i> Rechercher</button>

                                {/if}
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


<div class="vd_content-section clearfix" style="min-height: 900px">
    <div class="panel widget light-widget">
        <div class="panel-body">
            <h2 class="mgtp--10"><a {if $archive==""}class="active"{/if} href="/main.php?dir=gestdiscuprat">Boite de réception</a> / <a {if $archive=="ok"}class="active"{/if} href="/main.php?dir=gestdiscuprat&archive=ok">Archive</a></h2>
            <form action="" method="post" name="formaction" id="formaction" >
                <input type="hidden" id="validation" name="validation" value="ok">
                <input type="hidden" id="actionmessage" name="actionmessage" value="">
                {if $archive==""}
                    <a href="{$sLabelCreationElemUrl}" title="Envoyer un nouveau message" class="btn vd_btn" style="background-color: #27a1c2"><span class="append-icon"><i class="icon-feather"></i></span>{$sLabelCreationElem}</a>
                    <a href="javascript:void(0);" onclick="archiver_message_check()" title="Archiver" class="btn vd_btn" style="background-color: #7c7c7c"><span class="append-icon"><i class="fa fa-archive"></i></span>Archiver</a>
                {/if}
                <a href="javascript:void(0);" onclick="supprimer_message_check()" title="Supprimer" class="btn vd_btn" style="background-color: #e50000"><span class="append-icon"><i class="fa fa-trash-o"></i></span>Supprimer</a>

                <div class="panel-body-list table-responsive">
                    <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th> <div class="vd_checkbox">
                                <input type="checkbox" id="id_checkAll_message" name="id_checkAll_message">
                                <label for="id_checkAll_message"></label>
                            </div>
                        </th>
                        {literal}
                        <script type="text/javascript">
                            $(function () {
                                $("#id_checkAll_message").click(function () {
                                    if ($("#id_checkAll_message").is(':checked')) {
                                        $(".class_messagerie").each(function () {
                                            $(this).prop("checked", true);
                                        });

                                    } else {
                                        $(".class_messagerie").each(function () {
                                            $(this).prop("checked", false);
                                        });
                                    }
                                });

                            });

                        </script>
                        {/literal}
                        <th class="col-md-2" style=align:left!important;">Sujet</th>
                        <th class="col-md-2">Expéditeur</th>
                        <th class="col-md-2">Destinataire en copie</th>
                        <th class="col-md-2">Patient concerné</th>
                        <th class="col-md-2 text-center">Date du dernier envoi</th>
                    </tr>
                    </thead>
                    <tbody>
                    {if empty($aListe)}
                        <tr><td colspan="5" align="center">Vous n'avez aucun message</td></tr>
                    {else}
                        {foreach from=$aListe item=objListe}
                            <tr {if $objListe.etat_discussion=='non_lu'}class="row-info"{/if} style="font-weight: 900; cursor: pointer; cursor: hand;">
                                    <td  align="left"><div class="vd_checkbox">
                                            <input type="checkbox" id="chkmessage_{$objListe.guid_discussion}" value="{$objListe.guid_discussion}" name="chkmessage[]" class="class_messagerie checkbox-group">
                                            <label for="chkmessage_{$objListe.guid_discussion}"></label>
                                        </div></td>
                                    <!--
                                    <td style="width:40px"><div class="vd_star">
                                            <input type="checkbox" id="checkstar-1">
                                            <label for="checkstar-1"></label>
                                        </div></td>
                                    -->
                                <td onclick="open_messagerie('{$objListe.guid_discussion}')">{$objListe.sujet_discussion} <!--<span class="prepend-icon append-icon"><i class="icon-dot"></i></span>{$objListe.contenu_discussion|truncate:80:"..."}--></td>
                                <td onclick="open_messagerie('{$objListe.guid_discussion}')">{$objListe.identifiant_emetteur_user} >> {$objListe.identifiant_receceur_user}</td>
                                <td onclick="open_messagerie('{$objListe.guid_discussion}')">{$objListe.guid_pere_discussion}</td>
                                <td onclick="open_messagerie('{$objListe.guid_discussion}')">{$objListe.identifiant_patient_concerne3}</td>
                                <td onclick="open_messagerie('{$objListe.guid_discussion}')" style="width:200px;" class="text-center">{$objListe.dateenreg_discussion}</td>
                            </tr>
                        {/foreach}
                    {/if}

                    </tbody>
                </table>
                </div>
            </form>

            {if isset($bPagination) and $bPagination and isset($aPaginationListe) and isset($aPaginationListe.select) and isset($aPaginationListe.liste)}
                <ul class="pagination">
                    <li><a href="{$aPaginationListe.liste.page_premiere}&pagesimple={$pagesimple}&archive={$archive}">&laquo;&laquo;</a></li>
                    <li><a href="{$aPaginationListe.liste.page_precedente}&pagesimple={$pagesimple}&archive={$archive}">&laquo;</a></li>

                    {foreach from=$aPaginationListe.liste.page_liste item=page}
                        {if isset($page.selected) and $page.selected}
                            <li class="active"><a href="#">{$page.numero}</a></li>
                        {else}
                            <li><a href="{$page.url}&pagesimple={$pagesimple}&archive={$archive}">{$page.numero}</a></li>
                        {/if}
                    {/foreach}

                    <li><a href="{$aPaginationListe.liste.page_suivante}&pagesimple={$pagesimple}&archive={$archive}">&raquo;</a></li>
                    <li><a href="{$aPaginationListe.liste.page_derniere}&pagesimple={$pagesimple}&archive={$archive}">&raquo;&raquo;</a></li>
                </ul>
            {/if}
        </div>
        <!-- panel-body  -->

    </div>
    <!-- panel -->

</div>