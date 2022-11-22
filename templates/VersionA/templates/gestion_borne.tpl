<style type="text/css">
    body{
        font-family: Arial, 'Open sans';
    }
    .font-size{
        font-size: 15px;
    }
    .panel{
        margin-bottom: 10px;
    }
    .panel.widget{
        overflow: auto;
    }
    hr{
        color: #777777;
    }
    .panel.widget{
        overflow: auto;
        margin-top: 42px;
    }
    .panel-body{
        display: none;
        padding: 15px 15px 10px 15px;
    }
    .control-label{
        margin-left: 10px;
    }
    .input{
        border-radius: 7px;
        border: 1px solid #707070;
    }
    #interval{
        height: 21px;
        margin-left: 14px;
        margin-top: 23px;
    }
    .form-group{
        margin-bottom:1px;
    }
    input#date_simple {
        border-radius: 5px 0 0 5px;
    }
    .btn_val_annul{
        margin-top: 20px;
    }
    #annuler{
        float: right;
        background-color:#777777;
    }
    #config{
        margin-bottom: 15px;
    }
    #rechercher, #config{
        background-color:#5D9AD4;
    }
    #annuler, #rechercher{
        width: 150px;
        font-size: 17px;
    }
    table{
        width:100%;
    }
    .tab_rdv_non_transmis{
        border: 1px solid #707070;
    }
    #title_tab{
        margin-left: 20px;
    }
    .tab_label{
        background-color: #777777;
        height: 32px;
        border:1px solid #777777;
    }
    .label_title{
        font-size: 19px;
        color: #FFFFFF;
        margin-left: 20px;
        font-weight: normal;
    }
    .header_tab{
        height:28px;
    }
    .header_tab th{
        font-size: 19px;
        height: 29px;
        padding: 3px 0;
        border: 1px solid #707070;
    }
    .header_tab th,
    .header_tab td{
        text-align: center;
        vertical-align: middle;
        border-right: 1px solid #707070;
    }
    tbody{
        border: 1px solid #707070;
    }
    .fa-ellipsis-v {
        font-size: xx-large;
        color:#707070;
    }
    button.btn.btn-default.dropdown-toggle.button_ellipsis{
        margin: 1px!important;
        background: transparent!important;
        border: none;
    }
    span.select2.select2-container.select2-container--default.select2-container--focus,
    span.select2.select2-container.select2-container--default {
        width: 100%!important;
    }
    td.demande {
        text-align: left;
        padding-left: 10px;
    }
    #lien_config{
        color: white;
    }
</style>

<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.{select2}.js"></script>

<div class="vd_title-section clearfix no-print">
    <div class="vd_panel-header">
        <h1>Gestion des demandes sur la borne</h1>
    </div>
</div>

<div class="col-md-12">
    <div class="panel widget">
        {* <div class="panel-heading vd_bg-grey"> *}
         {literal}
            <div class="panel-heading vd_bg-grey" onclick="
                if(bouverture==0){$('#formRechBorne').css( 'display', 'block');
                bouverture=1;$('#iconeplusmoins').removeClass('fa-sort-desc');$('#iconeplusmoins').addClass('fa-sort-up');}
                else{$('#formRechBorne').css( 'display', 'none');bouverture=0;$('#iconeplusmoins').removeClass('fa-sort-up');$('#iconeplusmoins').addClass('fa-sort-desc');}">
        {/literal}
            <h3 class="panel-title"> 
                <span class="menu-icon"> 
                    <i class="fa fa-sort-desc" id="iconeplusmoins"></i> 
                </span>
                Rechercher
            </h3>
        </div> 

        <div class="panel-body" id="formRechBorne">
            <form class="form-horizontal" action="" role="form" id="formList" method="GET">

                {* 1er ligne du formulaire *}
                <div class="form-group" id="recherche_1">
                    <div class="col-sm-3">
                        <label class="control-label font-size">Patient :</label>
                        <div class="controls">
                            <input class="input" type="text" name="daterdv" id="patient" value="">
                        </div>
                    </div>
                    <div class="col-sm-3 controls">
                        <div id="divdate_simple">
                            <label class="font-size control-label">Date :</label>
                            <div class="input-group">
                                <input type="text" value=""
                                        name="date_simple" tabindex="26"
                                        id="date_simple" required
                                        class="required">
                                <span class="input-group-addon"
                                        id="datepicker-icon-trigger"
                                        data-datepicker="#date">
                                    <i class="fa fa-calendar"></i>
                                </span>
                            </div>
                            {literal}
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $("#date_simple").datepicker({
                                            dateFormat: 'dd/mm/yy',
                                            changeMonth: true,
                                            changeYear: true
                                        });
                                        $('[data-datepicker]').click(function (e) {
                                            var data = $(this).data('datepicker');
                                            $(data).focus();
                                        });
                                    });
                                </script>
                            {/literal}
                        </div>
                    </div>

                    <div class="col-sm-3">
                        <label class="control-label font-size" id="label_type_demande">Type de demande :</label>
                        <div id="type_demande">
                            <select id="id_form" class="js-example-basic-multiple" name="">
                                <option></option>
                                {* {foreach from=$objForm.lesitem key=id_valeur_possible item=valeur_possible_bdd} *}
                                    <option value=""selected>
                                       Question
                                    </option>
                                    <option value="">
                                       Document
                                    </option>
                                {* {/foreach} *}
                            </select>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <label class="control-label font-size" id="label_type_demande">Statut :</label>
                        <div id="type_demande">
                            <select id="id_form" class="js-example-basic-multiple" name="">
                                <option></option>
                                {* {foreach from=$objForm.lesitem key=id_valeur_possible item=valeur_possible_bdd} *}
                                    <option value=""selected>
                                       Traité
                                    </option>
                                    <option value="">
                                       En attente de traitement
                                    </option>
                                {* {/foreach} *}
                            </select>
                        </div>
                    </div>


                {* BOUTON VALIDER - ANNULER *}
                <div id="container_annuler" class="col-sm-6 controls btn_val_annul">
                    <button id="annuler" name="annuler"
                            type="button" class="btn vd_btn">
                        Annuler
                    </button>
                </div>
                <div id="container_rechercher" class="col-sm-6 controls btn_val_annul">
                    <button id="rechercher" name="rechercher"
                            type="button" class="btn vd_btn">
                        <i class="fa fa-search"></i> Rechercher
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


{* Tableau des résultats de la recherche *}
<div class="col-sm-12">

    <div class="col-sm-12">
        <div id="container_config" class="controls">
            <button id="config" name="config" type="button" class="btn vd_btn">
                <a id="lien_config" href="main.php?dir=gestquestion">
                    Configurer les demandes de la borne
                </a>
            </button>
        </div>
        <table id="liste_demande_borne">
            <thead>
                <tr class="tab_label">
                    <th class="label_title" colspan="5"><span id="title_tab">Liste des demandes faites sur la borne</span></th>
                </tr>
                <tr class="header_tab">
                    <th>Action</th>
                    <th>Patient</th>
                    <th>Date</th>
                    <th>Demande</th>
                    <th>Statut</th>
                </tr>
            </thead>
            <tbody>
                <tr class="header_tab">
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle button_ellipsis" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="">Supprimer</a></li>
                                <li><a href="">Modifier</a></li>
                            </ul>
                        </div>
                    </td>
                    <td class="patient font-size">Mr. XXXXX xxxxx</td>
                    <td class="date font-size">00/00/00</td>
                    <td class="demande font-size">Xxxxxx Xxxxxx Xxxxxx Xxxxxx</td>
                    <td class="rendez-vous font-size">Xxxxxx</td>
                </tr>
                <tr class="header_tab">
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle button_ellipsis" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="">Supprimer</a></li>
                                <li><a href="">Modifier</a></li>
                            </ul>
                        </div>
                    </td>
                    <td class="patient font-size">Mr. XXXXX xxxxx</td>
                    <td class="date font-size">00/00/00</td>
                    <td class="demande font-size">Xxxxxx Xxxxxx Xxxxxx Xxxxxx</td>
                    <td class="rendez-vous font-size">Xxxxxx</td>
                </tr>
                <tr class="header_tab">
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle button_ellipsis" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="">Supprimer</a></li>
                                <li><a href="">Modifier</a></li>
                            </ul>
                        </div>
                    </td>
                    <td class="patient font-size">Mr. XXXXX xxxxx</td>
                    <td class="date font-size">00/00/00</td>
                    <td class="demande font-size">Xxxxxx Xxxxxx Xxxxxx Xxxxxx</td>
                    <td class="rendez-vous font-size">Xxxxxx</td>
                </tr>
            </tbody>
        </table>
    </div>


    
</div>

{literal}
    <script> 
    // In your Javascript (external .js resource or <script> tag)
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
        });
    </script>
{/literal}
