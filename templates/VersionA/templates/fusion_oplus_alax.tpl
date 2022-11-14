
<br><br><br>
{if $bsuccess}
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon">
            <i class="fa fa-check-circle vd_green"></i>
        </span>
        {$sMessagesucess}
    </div>
{/if}

{if $berreur}
    <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon">
            <i class="fa fa-exclamation-circle vd_red"></i>
        </span>
        {$sMessagerreur}
    </div>
{/if}

<div class="row no-print" id="form-basic" style="margin-bottom:0px;">
    <form class="form-horizontal" action="" role="form" id="formList" method="POST">
        <input type="hidden" value="droitfusionpatient" name="dir">
        <div class="col-md-12">
            <div class="panel widget">
                <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>{$sLabelRecherche}</h3>
                </div>
            </div>


            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-sm-12 ">
                        <label class="col-sm-3 control-label">Rechercher un patient: </label>
                        <div class="col-sm-4 controls">
                            <input type="text" name="IPP" placeholder="IPP, nom, prenom, nom jeune fille, date naissance">
                        </div>
                        <button
                            type="submit"
                            class="btn vd_btn vd_bg-green"
                            id="id_rechercher"
                            name="Rechercher">Rechercher</button>

                        <button
                            type="button"
                            class="btn vd_btn vd_bg-green"
                            id="id_rechercher"
                            name="raz" onclick="location.href = 'main.php?dir=droitfusionpatient'">RAZ</button>

                    </div>

                    {* <div class="form-group col-sm-3 ">
                    <label class="col-sm-3 control-label">Nom patient</label>
                    <div class="col-sm-6 controls">
                    <input type="text" name="nom">
                    </div>
                    </div>
    
                    <div class="form-group col-sm-3 ">
                    <label class="col-sm-3 control-label">Prénom patient</label>
                    <div class="col-sm-6 controls">
                    <input type="text" name="prenom">
                    </div>
                    </div>
                    </div>
                    *}
                </div>

                </form>
            </div>



            <div class="row">
                <div class="col-md-12">
                    <div class="panel widget">
                        <div class="panel-heading vd_bg-grey">
                            <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span>{$sTitreListe} {$inombredossier}</h3>
                        </div>


                        <div class="panel-body-list table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Patient avec IPP</th>

                                        <th>Patient avec identifiant provisoire</th>
                                    </tr>
                                </thead>

                                {foreach from=$apatient item=objPat}
                                    <form class="form-horizontal" action="" role="form" id="formList" method="POST">
                                        <input type="hidden" value="" name="dir">
                                        <input type="hidden" value="fusionner" name="validation">
                                        <input type="hidden" value="{$objPat.id}" name="idipp">
                                        <input type="hidden" value="{$IPP}" name="IPP">
                                        <tr>
                                            <td>
                                                {$objPat.civilite}  {$objPat.nom_user}  {$objPat.prenom_user} née {$objPat.nom_naissance} le {$objPat.datenaissance} &nbsp; (IPP : {$objPat.ipp})
                                                <a href="#" onclick="$('#modalFichePatient').modal('show');
                                                        getInfoPatient('{$objPat.id}');
                                                        $(this).val('');" data-original-title="Voir la fiche" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> <i class="fa fa-pencil"></i> </a>
                                                {*<button type="button" onclick="$('#modalFichePatient').modal('show');getInfoPatient('{$objPat.id}'); $(this).val('');">Voir la fiche</button>
                                                *}
                                            </td>
                                            <td>
                                                <table>
                                                    {if isset($objPat.liste)}
                                                        {foreach from=$objPat.liste  item=objList}
                                                            <tr>
                                                                <td><input type="checkbox" name="tabfusion[]" required value="{$objList.id}"> &nbsp;&nbsp;&nbsp;</td>
                                                                <td>
                                                                    {$objList.civilite}  {$objList.nom_user}  {$objList.prenom_user} née {$objList.nom_naissance}  le {$objList.datenaissance}&nbsp; ({$objList.ipp})
                                                                    <a href="#" onclick="$('#modalFichePatient').modal('show');
                                                                            getInfoPatient('{$objList.id}');
                                                                            $(this).val('');" data-original-title="Voir la fiche" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> <i class="fa fa-pencil"></i> </a>
                                                                    {*
                                                                    <button type="button"  onclick="$('#modalFichePatient').modal('show');;getInfoPatient('{$objList.id}'); $(this).val('');">Voir la fiche</button>
                                                                    *}
                                                                </td>
                                                            </tr>
                                                        {/foreach}
                                                    {/if}
                                                </table>

                                            </td>
                                            <td><button class="btn vd_btn vd_bg-green" onclick="bconf = confirm('IMPORTANT\nVoulez allez fusionner les fiches de patients contenant des identifiants provisoires avec celles contenant un IPP.\nAttention, cette action est irréversible !!! ');
                                                    if (bconf)
                                                        submit()">fusionner</button></td>
                                        </tr>
                                    </form>
                                {/foreach}

                            </table>
                            {if !empty($aPaginationfusion)}
                            <ul class="pagination">
                                <li><a href="{$aPaginationfusion.liste.page_premiere}&pagesimple={$pagesimple}">&laquo;&laquo;</a></li>
                                <li><a href="{$aPaginationfusion.liste.page_precedente}&pagesimple={$pagesimple}">&laquo;</a></li>

                                {foreach from=$aPaginationfusion.liste.page_liste item=page}
                                    {if isset($page.selected) and $page.selected}
                                        <li class="active"><a href="#">{$page.numero}</a></li>
                                    {else}
                                        <li><a href="{$page.url}&pagesimple={$pagesimple}">{$page.numero}</a></li>
                                    {/if}
                                {/foreach}

                                <li><a href="{$aPaginationfusion.liste.page_suivante}&pagesimple={$pagesimple}">&raquo;</a></li>
                                <li><a href="{$aPaginationfusion.liste.page_derniere}&pagesimple={$pagesimple}">&raquo;&raquo;</a></li>
                            </ul>
                            {/if}
                        </div>




                    </div>
                </div>
            </div>