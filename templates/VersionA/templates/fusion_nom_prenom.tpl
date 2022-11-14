
<br><br><br>

{if $berreur}
    <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon">
            <i class="fa fa-exclamation-circle vd_red"></i>
        </span>
        {$sMessagerreur}
    </div>
{/if}

{literal}
    <script type="text/javascript">

        function lancementfusion($iduser){
            $.ajax({
                cache: false,
                type: "POST",
                url: 'script/fusion_automatique.php',
                data: 'iduser='+$iduser,
                dataType: 'json',
                headers: {
                    "x-alx-idc": $('#idc').val(),
                    "authorization":  $('#email_user').val() + " " +  $('#token_user').val()
                },
                success: function (json) {
                    var vide="";
                    $.pnotify({
                        title: 'Confirmation prise en demande fusion automatique',
                        text: 'Votre demande bien été prise en compte et est traitée en arrière plan ',
                        type: 'success',
                        addclass: "stack-bottomright",
                        delay: 10000
                    });

                }, error: function (xhr, ajaxOptions, thrownError) {
                    $('#div_message_importe_preference').html("<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>");
                }
            });
        }
    </script>
{/literal}

<div class="row no-print" id="form-basic" style="margin-bottom:0px;">
    <form class="form-horizontal" action="" role="form" id="formList" method="POST">
        <input type="hidden" value="droitfusionpatient" name="dir">
        <input type="hidden" value="ok" name="recherche">
        <div class="col-md-12">
            <div class="panel widget">
                <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>{$sLabelRecherche}</h3>
                </div>
            </div>


            <div class="panel-body">
                <div class="row">

                    {if isset($bMessageErreurFusion) and $bMessageErreurFusion}
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                            <span class="vd_alert-icon">
                        <i class="fa fa-exclamation-circle vd_red"></i>
                    </span>
                                    {if isset($sMessageErreurFusion)}{$sMessageErreurFusion}{/if}
                                </div>
                    {/if}


                    {if isset($bMessageSuccesFusion) and $bMessageSuccesFusion}
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                            <span class="vd_alert-icon">
                <i class="fa fa-check-circle vd_green"></i>
            </span>
                            {if isset($sMessagesucess)}{$sMessagesucess}{/if}
                        </div>
                    {/if}

                    <div class="form-group col-sm-12 ">
                        <label class="col-sm-3 control-label">Rechercher un patient : </label>

                        <div class="col-sm-4 controls">
                            <table>
                                <tr>
                                    <td style="padding: 5px;">
                                        <input type="text" name="nom" placeholder="nom" value="{$nom}" size="20"  required>
                                    </td>
                                    <td  style="padding: 5px;">
                                        <input type="text" name="prenom" placeholder="prenom" value="{$prenom}"  size="20"  required>
                                    </td>
                                    <td>
                                       <input type="date" name="datenaissance" placeholder="date naissance (dd/mm/YYYY)"   required value="{$datenaissance}">
                                    </td>
                                </tr>
                            </table>
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
                            name="raz" onclick="location.href = 'main.php?dir=droitfusionpatientnomprenom'">Réinitialiser</button>

                    </div>

                </div>

                </form>
            </div>



            <div class="row">
                <div class="col-md-12">
                    <div class="panel widget">
                        <div class="panel-heading vd_bg-grey">
                            <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span>{$sTitreListe} </h3>
                        </div>


                        <div class="panel-body-list table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Patient de destination</th>

                                        <th> Le(s) patient(s) à fusionner</th>
                                    </tr>
                                </thead>

                                {foreach from=$apatient item=objPat}
                                    <form class="form-horizontal" action="" role="form" id="formListe{$objPat.id}" method="POST">
                                        <input type="hidden" value="" name="dir">
                                        <input type="hidden" value="fusionner" name="validation">
                                        <input type="hidden" name="nom" value="{$nom}">
                                        <input type="hidden" name="prenom"  value="{$prenom}" >
                                        <input type="hidden" name="datenaissance"   value="{$datenaissance}" >

                                        <tr>
                                            <td>
                                                <table>
                                                    {if isset($objPat.liste)}
                                                        {foreach from=$objPat.liste  item=objList}
                                                            <tr>
                                                                <td><input type="radio" name="principal" required value="{$objList.id}"> &nbsp;&nbsp;&nbsp;</td>
                                                                <td>
                                                                    {$objList.civilite}  {$objList.nom_user}  {$objList.prenom_user}  {$objList.nom_naissance}  le {$objList.datenaissance}&nbsp; {if $objList.ipp!=''} ({$objList.ipp}){/if}
                                                                    <a href="#" onclick="$('#modalFichePatient').modal('show');
                                                                            getInfoPatient('{$objList.id}');
                                                                            $(this).val('');" data-original-title="Voir la fiche" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> <i class="fa fa-pencil"></i> </a>
                                                                    {*
                                                                    <button type="button"  onclick="$('#modalFichePatient').modal('show');;getInfoPatient('{$objList.id}'); $(this).val('');">Voir la fiche</button>
                                                                    *}
                                                                    <ul>
                                                                        <li>idalax : {$objList.id}</li>
                                                                        <li>email : {$objList.email_user}</li>
                                                                        <li>Portable : {$objList.tel_mobile_user}</li>
                                                                        <li>Fixe : {$objList.tel_fixe_user}</li>
                                                                        <li>Patient gestionniare du compte : <b>{$objList.gestionnaire}</b></li>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                        {/foreach}
                                                    {/if}
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    {if isset($objPat.liste)}
                                                        {foreach from=$objPat.liste  item=objList}
                                                            <tr>
                                                                <td><input type="checkbox" name="tabfusion[]" required value="{$objList.id}"> &nbsp;&nbsp;&nbsp;</td>
                                                                <td>
                                                                    {$objList.civilite}  {$objList.nom_user}  {$objList.prenom_user}  {$objList.nom_naissance}  le {$objList.datenaissance}&nbsp; {if $objList.ipp!=''} ({$objList.ipp}){/if}
                                                                    <a href="#" onclick="$('#modalFichePatient').modal('show');
                                                                            getInfoPatient('{$objList.id}');
                                                                            $(this).val('');" data-original-title="Voir la fiche" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> <i class="fa fa-pencil"></i> </a>
                                                                    {*
                                                                    <button type="button"  onclick="$('#modalFichePatient').modal('show');;getInfoPatient('{$objList.id}'); $(this).val('');">Voir la fiche</button>
                                                                    *}
                                                                    <ul>
                                                                        <li>idalax : {$objList.id}</li>
                                                                        <li>email : {$objList.email_user}</li>
                                                                        <li>Portable : {$objList.tel_mobile_user}</li>
                                                                        <li>Fixe : {$objList.tel_fixe_user}</li>
                                                                    </ul>
                                                                </td>
                                                            </tr>
                                                        {/foreach}
                                                    {/if}
                                                </table>

                                            </td>
                                            <td>
                                                <a class="btn vd_btn vd_bg-green" onclick="valideForm({$objPat.id})">fusionner</a>
                                            </td>
                                        </tr>
                                    </form>
                                    <script>
                                    function valideForm(form){
                                        if(confirm('Etes-vous sûr de vouloir fusionner ces patients ? Cette action est irréversible. ')==true){
                                            $('#formListe' + form).submit();
                                        }

                                    }
                                    </script>
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