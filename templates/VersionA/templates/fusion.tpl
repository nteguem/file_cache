
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

                        <button
                            type="button"
                            class="btn vd_btn vd_bg-green"
                            id="id_rechercher"
                            name="fusion" onclick="bconf=confirm('Attention, vous allez lancer la fusion automtique des patients !\n La fusion ce base sur Nom, Prènom, Date de naissance et soit un téléphone mobile ou fixe ou email identique.'); if(bconf)lancementfusion({$iddebug_user});">fusion automatique</button>

                    </div>
                </div>
            </div>
        </div>
    </form>

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
                        <tr id="container{$objPat.id}">
                            <form class="form-horizontal" action="" role="form" id="formListe{$objPat.id}" method="POST">
                                <input type="hidden" value="" name="dir">
                                <input type="hidden" value="{$objPat.id}" name="idipp">
                                <input type="hidden" value="{$IPP}" name="IPP">
                                <input type="hidden" value="{$ipagination}" name="ipagination">
                                <td>
                                    {$objPat.civilite}  {$objPat.nom_user}  {$objPat.prenom_user} né(e) {$objPat.nom_naissance} le {$objPat.datenaissance} &nbsp; (IPP : {$objPat.ipp})

                                    <a href="#" onclick="$('#modalFichePatient').modal('show');
                                            getInfoPatient('{$objPat.id}');
                                            $(this).val('');" data-original-title="Voir la fiche" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> <i class="fa fa-pencil"></i> </a>
                                    <ul>
                                        <li>email : {$objPat.email_user}</li>
                                        <li>Portable : {$objPat.tel_mobile_user}</li>
                                        <li>Fixe : {$objPat.tel_fixe_user}</li>
                                    </ul>
                                    {*<button type="button" onclick="$('#modalFichePatient').modal('show');getInfoPatient('{$objPat.id}'); $(this).val('');">Voir la fiche</button>
                                    *}
                                </td>
                                <td>
                                    <table>
                                        {if isset($objPat.liste)}
                                            {foreach from=$objPat.liste  item=objList}
                                                <tr>
                                                    <td><input type="checkbox" name="tabfusion[]" data-item-id="{$objPat.id}" required value="{$objList.id}"> &nbsp;&nbsp;&nbsp;</td>
                                                    <td>
                                                        {$objList.civilite}  {$objList.nom_user}  {$objList.prenom_user} né(e) {$objList.nom_naissance}  le {$objList.datenaissance}&nbsp; ({$objList.ipp})
                                                        <a href="#" onclick="$('#modalFichePatient').modal('show');
                                                                getInfoPatient('{$objList.id}');
                                                                $(this).val('');" data-original-title="Voir la fiche" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow"> <i class="fa fa-pencil"></i> </a>
                                                        {*
                                                        <button type="button"  onclick="$('#modalFichePatient').modal('show');;getInfoPatient('{$objList.id}'); $(this).val('');">Voir la fiche</button>
                                                        *}
                                                        <ul>
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
                            </form>
                        </tr>
                        {/foreach}
                        <script>
                            function valideForm(patientId) {
                                let tabFusionQuery = '';
                                let group = $('input[data-item-id="' + patientId + '"][name="tabfusion[]"]');
                                if(group.length > 0)
                                {
                                    group.each(function () {
                                        if($(this)[0].checked === true)
                                        {
                                            tabFusionQuery += '&tabfusion[]='+$(this).val()
                                        }
                                    });
                                }

                                if(tabFusionQuery === '')
                                {
                                    $.pnotify({
                                        title: 'Fusion patient échouée',
                                        text: "Aucune fiche sélectionnée",
                                        type: 'error',
                                        addclass: "stack-bottomright",
                                        delay: 10000
                                    });
                                    return;
                                }

                                if(confirm('Etes-vous sûr de vouloir fusionner ces patients ? Cette action est irréversible. ')==true){
                                    $.ajax({
                                        cache: false,
                                        type: 'POST',
                                        url: 'ajax/fusionner_patient.php',
                                        data: 'idipp=' + patientId + tabFusionQuery,
                                        dataType: 'json',
                                        headers: {
                                            "x-alx-idc": $('#idc').val(),
                                            "authorization":  $('#email_user').val() + " " +  $('#token_user').val()
                                        },
                                        success: function (json) {
                                            if(json.succes == true)
                                            {
                                                $.pnotify({
                                                    title: 'Fusion patient effectuée',
                                                    text: json.message,
                                                    type: 'success',
                                                    addclass: "stack-bottomright",
                                                    delay: 10000
                                                });

                                                $('#container' + patientId).remove();
                                            }
                                            else
                                            {
                                                $.pnotify({
                                                    title: 'Fusion patient échouée',
                                                    text: json.message,
                                                    type: 'error',
                                                    addclass: "stack-bottomright",
                                                    delay: 10000
                                                });
                                            }
                                        }, error: function (xhr, ajaxOptions, thrownError) {
                                            $('#div_message_importe_preference').html("<div class='alert alert-danger' style='text-align: center;'><span class='vd_alert-icon'><i class='fa fa-exclamation-circle fa-fw'></i></span>Une erreur inattendue s'est produite, veuillez recommencer ultérieurement.</div>");
                                        }
                                    });
                                }
                            }
                        </script>

                    </table>
                    {if !empty($aPaginationfusion)}
                    <ul class="pagination">
                        <li><a href="{$aPaginationfusion.liste.page_premiere}&pagesimple={$pagesimple}">&laquo;&laquo;</a></li>
                        <li><a href="{$aPaginationfusion.liste.page_precedente}&pagesimple={$pagesimple}">&laquo;</a></li>

                        {foreach from=$aPaginationfusion.liste.page_liste item=page}
                            {if isset($aPaginationfusion.liste.selected) and $aPaginationfusion.liste.selected == $page.numero}
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
</div>
