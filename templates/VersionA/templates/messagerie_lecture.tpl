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

    <script type="text/javascript">
        function modal_modifier_patient(id){
            $('#provenance_open').val('read_message');
            $('#modalFichePatient').modal('show');
            getInfoPatient(id);
        }
    </script>

{/literal}

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>

<div class="vd_content-section clearfix" style="min-height: 900px">

    <div class="panel widget light-widget">
        <div class="col-md-12">
            <a href="main.php?dir=gestdiscuprat" alt="Retour messagerie" class="btn vd_btn vd_bg-red" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                                    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;"><span class="append-icon"><i class="fa fa-arrow-circle-left"></i></span>Retour messagerie</a>
        </div>

        <div class="col-md-3"></div>
        <div class="pannel-body col-md-6">
            <div class="vd_comments col-md-12" >
                <ul class="commentlist clearfix">
                    {foreach from=$aListe item=objListe name=foo}
                        {if $smarty.foreach.foo.iteration == 1}
                            <h2 style="margin-bottom: 15px"><b>{$objListe.sujet_discussion}</b></h2>
                            <hr style="border-top: 2px solid #27a1c2;">
                        {/if}
                    {/foreach}
                    {foreach from=$aListe item=objListe name=foo2}
                        <li class="comment" id="li-comment-5">
                            <div id="comment-5" class="comment-wrap clearfix">
                                <div class="comment-meta">
                                    <div class="comment-author"> <img src="/uploads/{$objListe.photo_user}" alt=""> </div>
                                </div>
                                <div class="comment-content clearfix">
                                    <div class="comment-author">{$objListe.identifiant_emetteur_user}</div>
                                    <div class="comment-date">{$objListe.dateenreg_discussion_affiche}</div>
                                    <div class="comment-reply"><a class=" btn btn-small" href="#idrepondre"><i class="fa fa-reply append-icon"></i>Répondre</a></div>
                                    <div class="comment-arrow"></div>

                                    <p class="comment-word">
                                        {if $smarty.foreach.foo2.iteration == 1}
                                            {if $le_praticien != ''}
                                                <div class="alert alert-info"><b>Concerne le praticien : <i>{$le_praticien}</i></b></div>
                                            {/if}
                                            {if $le_patient != ''}
                                                <div class="alert alert-info">
                                                    <b>
                                                        Concerne le patient :<br/>
                                                        <i>{$le_patient}</i>
                                                        <a href='#' onclick='modal_modifier_patient("{$id_patient}")'>Consulter la fiche patient</a>
                                                    </b>
                                                </div>
                                            {/if}
                                        {/if}
                                        {$objListe.contenu_discussion}
                                    </p>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </li>
                    {/foreach}

                </ul>
            </div>

            <div class="vd_comments-form clearfix col-md-12">
                <h3 id="idrepondre">Répondre</span></h3>
                <form class="clearfix" action="" method="post" id="commentform">
                    <input type="hidden" name="validation" id="validation" value="ok">
                    <input type="hidden" name="idrecepteur" id="idrecepteur" value="{$idrecepteur}">
                    <input type="hidden" name="idemetteur" id="idemetteur" value="{$idemetteur}">
                    <input type="hidden" name="guid_pere" id="guid_pere" value="{$guid_pere}">
                    <input type="hidden" name="idmessage" id="idmessage" value="{$idmessage}">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="comment">Message</label>
                                <div class="controls">
                                    <textarea id="message_reponse" name="message_reponse" cols="30" rows="3" data-rel="ckeditor" autofocus required class="required"></textarea>
                                    {literal}
                                    <script type="text/javascript">
                                        CKEDITOR.replace(
                                                message_reponse,
                                                {toolbar :[
                                                    {
                                                        name: 'clipboard',
                                                        items : [ 'Bold','Italic','Underline','Strike','-','Cut','Copy','PasteText','-','Undo','Redo', '-','NumberedList','BulletedList' ]
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

                                                ]});
                                    </script>
                                    {/literal}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <button name="submit" type="submit" id="submit-button" tabindex="5" value="Submit" class="vd_btn btn" style="background-color: #00D3C8;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                                        -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Envoyer</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-3"></div>
        <div class="col-md-12">
            <a href="main.php?dir=gestdiscuprat" alt="Retour messagerie" class="btn vd_btn vd_bg-red" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                                    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;"><span class="append-icon"><i class="fa fa-arrow-circle-left"></i></span>Retour messagerie</a>
        </div>
    </div>
    <!-- panel -->

</div>