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
        margin-top: 10px;
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
    #check_visible {
        transform: scale(1.5);
        vertical-align: text-bottom;
        margin-left: 5px;
    }
    #container_visible{
        margin-top:10px;
    }
    #panel_widget_liste{
        margin-top:10px;
        padding-bottom: 60px;
    }
    #container_demande_predefini{
        padding-right: 1px;
        padding-left: 1px;
    }
    /* BOUTON SWITCH INTERVALLE */
        #btn_switch {
            display: flex;
        }

        #switch {
            margin-top: 18px;
        }

        .onoffswitch {
            position: relative;
            width: 113px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .onoffswitch-checkbox {
            display: none;
        }

        .onoffswitch-label {
            display: block;
            overflow: hidden;
            cursor: pointer;
            border: 2px solid #999999;
            border-radius: 20px;
        }

        .onoffswitch-inner {
            display: block;
            width: 200%;
            margin-left: -100%;
            -moz-transition: margin 0.3s ease-in 0s;
            -webkit-transition: margin 0.3s ease-in 0s;
            -o-transition: margin 0.3s ease-in 0s;
            transition: margin 0.3s ease-in 0s;
        }

        .onoffswitch-inner:before, .onoffswitch-inner:after {
            display: block;
            float: left;
            width: 50%;
            height: 30px;
            padding: 0;
            line-height: 30px;
            font-size: 14px;
            color: white;
            font-family: Trebuchet, Arial, sans-serif;
            font-weight: bold;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .onoffswitch-inner:before {
            content: "Question";
            padding-left: 10px;
            background-color: #5D9AD4;
            color: #FFFFFF;
        }

        .onoffswitch-inner:after {
            content: "Demande";
            padding-right: 10px;
            background-color: #EEEEEE;
            color: #999999;
            text-align: right;
        }

        .onoffswitch-switch {
            display: block;
            width: 18px;
            height: 18px;
            margin-left: 6px;
            margin-right: 6px;
            margin-top: auto;
            margin-bottom: auto;
            background: #FFFFFF;
            border: 2px solid #999999;
            border-radius: 20px;
            position: absolute;
            top: 0;
            bottom: 0;
            /*right: 56px;*/
            -moz-transition: all 0.3s ease-in 0s;
            -webkit-transition: all 0.3s ease-in 0s;
            -o-transition: all 0.3s ease-in 0s;
            transition: all 0.3s ease-in 0s;
        }

        .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-inner {
            margin-left: 0;
        }

        .onoffswitch-checkbox:checked + .onoffswitch-label .onoffswitch-switch {
            right: 0px;
        }

        #group_intervalle {
            display: none;
        }
        #container_question{
            display:none
        }
    /* FIN - BOUTON SWITCH INTERVALLE */
</style>
<?php $selectGestBorQuest = filemtime(PATH_ASSETS.'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css') ?>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.<?php echo $selectGestBorQuest ?>.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

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
                if(bouverture==0){$('#formRechCrea').css( 'display', 'block');
                bouverture=1;$('#iconeplusmoins').removeClass('fa-sort-desc');$('#iconeplusmoins').addClass('fa-sort-up');}
                else{$('#formRechCrea').css( 'display', 'none');bouverture=0;$('#iconeplusmoins').removeClass('fa-sort-up');$('#iconeplusmoins').addClass('fa-sort-desc');}">
        {/literal}
            <h3 class="panel-title"> 
                <span class="menu-icon"> 
                    <i class="fa fa-sort-desc" id="iconeplusmoins"></i> 
                </span>
                Création
            </h3>
        </div> 

        <div class="panel-body" id="formRechCrea">
            <form class="form-horizontal" action="" role="form" id="formList" method="GET">

                {* 1er ligne du formulaire *}
                <div class="form-group" id="recherche_crea">
                    {* Bouton switch *}
                    <div class="form-group col-sm-10" id="btn_switch">
                        <div id="interval" class="font-size col-ms-6">
                            Créer une nouvelle :
                        </div>

                        <div class="col-md-2" id="switch">
                            <div class="onoffswitch">
                                <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch">
                                <label class="onoffswitch-label" for="myonoffswitch">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>
                    </div>

                    {literal}
                        <script>
                            var switchStatus = false;
                            $("#myonoffswitch").on('change', function () {
                                if ($(this).is(':checked')) {
                                    switchStatus = $(this).is(':checked');
                                    // activation (bleu)
                                    $('#container_question').css('display', 'block');
                                    $('#container_demande').css('display', 'none');
                                } else {
                                    switchStatus = $(this).is(':checked');
                                    // désactivation (gris)
                                    $('#container_question').css('display', 'none');
                                    $('#container_demande').css('display', 'block');
                                }
                            });
                        </script>
                    {/literal}
                    {* FIN - Bouton switch *}

                    <div class="col-sm-6">
                        <label class="control-label font-size">Intitulé :</label>
                        <div class="controls">
                            <input class="input" type="text" name="daterdv" id="intitule" value="">
                        </div>
                    </div>

                    <div class="col-sm-6" id="container_question">
                        <label class="control-label font-size">Question :</label>
                        <div class="controls">
                            <input class="input" type="text" name="daterdv" id="question_quest" value="">
                        </div>
                    </div>
                    <div class="col-sm-6" id="container_demande">
                        <label class="control-label font-size">Demande :</label>
                        <div class="controls">
                            <input class="input" type="text" name="daterdv" id="demande_dem" value="">
                        </div>
                    </div>

                    <div class="col-sm-12 font-size" id="container_visible">
                        Visible sur la borne : <input type="checkbox" id="check_visible">
                    </div>

                {* BOUTON VALIDER - ANNULER *}
                <div id="container_annuler" class="col-sm-6 controls btn_val_annul">
                    <button id="annuler" name="annuler"
                            type="button" class="btn vd_btn">
                        Annuler
                    </button>
                </div>
                <div id="container_rechercher" class="col-sm-6 controls btn_val_annul">
                    <button id="rechercher" name="rechercher" type="button" class="btn vd_btn">
                        Ajouter
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

{* GESTION DES DEMANDES PREDEFINI *}
<div class="col-md-12" id="container_demande_predefini">
    <div class="panel widget" id="panel_widget_liste">
         {literal}
            <div class="panel-heading vd_bg-grey" onclick="
                if(bouverture==0){$('#listRechCrea').css( 'display', 'block');
                bouverture=1;$('#iconemoinsplus').removeClass('fa-sort-desc');$('#iconemoinsplus').addClass('fa-sort-up');}
                else{$('#listRechCrea').css( 'display', 'none');bouverture=0;$('#iconemoinsplus').removeClass('fa-sort-up');$('#iconemoinsplus').addClass('fa-sort-desc');}">
        {/literal}
            <h3 class="panel-title"> 
                <span class="menu-icon"> 
                    <i class="fa fa-sort-desc" id="iconemoinsplus"></i> 
                </span>
                Gestion des demandes prédéfini
            </h3>
        </div> 

        <div class="panel-body" id="listRechCrea">
            {* Tableau des résultats de la recherche *}
            <div class="col-sm-12">
                <table id="liste_crea_borne">
                    <thead>
                        <tr class="tab_label">
                            <th class="label_title" colspan="5"><span id="title_tab">Liste des demandes faites sur la borne</span></th>
                        </tr>
                        <tr class="header_tab">
                            <th>Action</th>
                            <th>Intitulé</th>
                            <th>Date</th>
                            <th>Demande</th>
                            <th>Visible</th>
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
				                </div>                            
                            </td>
                            <td class="intitule font-size">XXXXX xxxxx</td>
                            <td class="date font-size">00/00/00</td>
                            <td class="demande font-size">Xxxxxx Xxxxxx Xxxxxx Xxxxxx</td>
                            <td class="visible font-size">Oui</td>
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
                            <td class="intitule font-size">XXXXX xxxxx</td>
                            <td class="date font-size">00/00/00</td>
                            <td class="demande font-size">Xxxxxx Xxxxxx Xxxxxx Xxxxxx</td>
                            <td class="visible font-size">Oui</td>
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
                            <td class="intitule font-size">XXXXX xxxxx</td>
                            <td class="date font-size">00/00/00</td>
                            <td class="demande font-size">Xxxxxx Xxxxxx Xxxxxx Xxxxxx</td>
                            <td class="visible font-size">Oui</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
