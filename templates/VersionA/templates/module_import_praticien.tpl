
<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>
{if isset($message_erreur) and $message_erreur!=""}
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
        {$message_erreur}
    </div>
{/if}
<div class="vd_content-section clearfix">
    {if $etape1==1}
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <form method="POST" class="form-horizontal" action="#" role="form" enctype="multipart/form-data">
                    <input type="hidden" value="{$identifiant_entite}" name="identifiant_entite">
                    <input type="hidden" value="{$dir}" name="dir">
                    <input type="hidden" value="{$iduniqueimport}" name="iduniqueimport">
                    <input type="hidden" value="1" name="etape1">
                    <input type="hidden" value="ok" name="validation">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Fichier CSV :</label>
                        <div class="col-sm-8 controls">
                            <input name="fileupload" id="fileupload" type="file">
                        </div>
                    </div>
                    <div class="col-sm-12 controls" align="center">
                        <div class="form-group">
                            <input type="checkbox" name="action[]" value="1"> Enregistrer dans la base<br>
                            <input type="checkbox" name="action[]" value="2"> Modifier les informations de l'utilisateur si celui-ci existe
                        </div>
                    </div>
                    <div class="col-sm-12 controls" align="center">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" type="button">Traitement</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
    {/if}

    {if $etape2==1}
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel widget">
                            <div class="panel-heading vd_bg-grey">
                                <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span>Praticiens</h3>
                            </div>
                            <div class="panel-body-list table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Identifiant Module Externe</th>
                                        <th>Nom</th>
                                        <th>Prénom</th>
                                        <th>Email</th>
                                        <th>Statut</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {foreach name="tabPraticien" from=$tabPraticien item=objPraticien}
                                        <tr>
                                            <td class="center">{$objPraticien['id_praticien']}</td>
                                            <td class="center">{$objPraticien['nom_praticien']}</td>
                                            <td class="center">{$objPraticien['prenom_praticien']}</td>
                                            <td class="center">{$objPraticien['email_praticien']}</td>
                                            <td class="center">{$objPraticien['statut']}</td>
                                        </tr>
                                    {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="col-sm-1"></div>
        </div>
    </div>
    {/if}
    {if $etape3==1}
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                Importation terminée !
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
    {/if}
</div>
