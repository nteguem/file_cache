<header class="header-1 no-print" id="header" style="height: 63px !important;background-color: #242729 !important;">
    <div class="vd_top-menu-wrapper">
        <div class="container ">
            <div class="vd_top-nav vd_nav-width" style=" {if $bIsMobile}width: 100%;{else}width: auto;{/if}">
                <div class="vd_panel-header">
                    <div style="text-align: center">
                        <a href="index.php"><img style="height: 40px;" alt="Alaxione"
                                src="img/logo-alaxione-01.png"></a>
                    </div>
                    <div style="text-align: center">
                        <span style="text-align: center;color:#ffffff;" id="date_heure"></span>
                    </div>
                </div>
            </div>

            <div class="vd_panel-menu left-pos {if $bIsMobile}visible{else}hidden{/if}"
                style="position: fixed !important;">
                <span class="menu" data-action="toggle-navbar-left" style="Background-color:#9f9ba0; color: #000;">
                    <i class="fa fa-ellipsis-v"></i>
                </span>
            </div>

            <div class="vd_container {if $bIsMobile}hidden{/if}">
                <div>
                    {if $iAccess == "10" || $sGroupe == 'secrelimite'}
                        <div class="col-lg-2 col-sm-3">
                            {* <div class="col-sm-2 col-xs-12"> *}

                            <div class="vd_menu-search" style="width: auto;">
                                
                                    <input type="text" id="id_autocomplete_recherche_patient"
                                        name="autocomplete_recherche_patient" class="vd_menu-search-text width-80"
                                        placeholder="Rechercher un patient">
                                    <span class="vd_menu-search-submit2"><i class="fa fa-search"></i> </span>
                                    {literal}
                                        <script type="text/javascript">
                                            $("#id_autocomplete_recherche_patient").autocomplete({
                                                source: 'ajax/recherche_fiche_patient_auto_complete.php',
                                                focus: function(event, ui) {
                                                    event.preventDefault();
                                                },
                                                select: function(event, ui) {
                                                    event.preventDefault();

                                                    $('#modalFichePatient').modal('show');
                                                    getInfoPatient(ui.item.value, ui.item.term);

                                            },
                                            response: function(event, ui) {
                                                $("#ui-id-1").scrollTop(0);
                                            }
                                            });
                                            $("#id_autocomplete_recherche_patient").on('keydown', function(e) {
                                                if (e.key === 'Enter' || e.keyCode === 13) {
                                                    if ($("#id_autocomplete_recherche_patient").val().length != 0) {
                                                        $('#modalFichePatient').modal('show');
                                                        getInfoPatient(0, $("#id_autocomplete_recherche_patient").val());
                                                        $(this).val("");
                                                    }
                                                    e.preventDefault();
                                                    return false;
                                                }
                                            });
                                        </script>
                                    {/literal}
                                
                            </div>
                        </div>
                    {/if}
                    <div class="{if $iAccess == "10" || $sGroupe == 'secrelimite'}col-lg-5{else}col-sm-7{/if} col-xs-5"
                        id="icone_menu">
                        {include file="menu.tpl"}

                    </div>
                    <div class="col-lg-5" id="icone-compte">
                        <div class="vd_mega-menu-wrapper">
                            <div class="vd_mega-menu pull-right">
                                <ul class="mega-ul">
                                    {if isset($numeroappele) and $numeroappele!=""}
                                        <li id="top-menu-6" class="one-icon mega-li">
                                            <i class="mega-link" id="btcallCentreMobile"
                                                onclick="callCentre('$numeroappel');" title="Appeler le centre"
                                                alt="Appeler le centre"
                                                style="font-size: 20px;color: #707070;background: #EEEEEE 0% 0% no-repeat padding-box;border: 1px solid #D5D5D5;border-radius: 0px 5px 6px 0px;opacity: 1;padding: 5px;">
                                                <span class="mega-icon"><i class="fa ico-phone"
                                                        style="padding-top: 8px !important;padding-left: 1px !important;"></i></span>
                                            </i>

                                        </li>
                                    {/if}
                                    {if isset($bisAlaxioneMaitreModuleExterne) and $bisAlaxioneMaitreModuleExterne!=false and in_array('listerdvsynchro',$tabdroituser)}
                                        <li id="top-menu-5" class="one-icon mega-li">
                                            <a href="main.php?dir=listerdvsynchro" class="mega-link"
                                                alt="Rendez-vous en attente ou en erreur de synchronisation avec le module externe"
                                                title="Rendez-vous synchronisation">
                                                <span class="mega-icon"><i class="fa ico-sync"
                                                        style="padding-top: 8px !important;padding-left: 1px !important;"></i></span>
                                                <span class="badge vd_bg-red" id="nb_rdv_desynchro_erreur"></span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $fichierconsigne!=""}
                                        <li id="top-menu-3" class="one-icon mega-li">
                                            <a href="uploads/{$fichierconsigne}" class="mega-link" target="_blank"
                                                alt="Consignes générales" title="Consignes générales">
                                                <span class="mega-icon">
                                                    <i class="fa fa-paperclip"></i>
                                                </span>
                                            </a>
                                        </li>
                                    {/if}
                                    {if $smsRetourVisible=="Y" &&  in_array('smsretour',$tabdroituser)}
                                        <li id="top-menu-4" class="one-icon mega-li">
                                            <a href="main.php?dir=listesmsatraiter" class="mega-link" alt="SMS de retour"
                                                title="SMS de retour">
                                                <span class="mega-icon"><i class="fa fa-comments"
                                                        style="padding-top: 8px !important;padding-left: 1px !important;"></i></span>
                                                <span class="badge vd_bg-red" id="nb_sms_menu"></span>
                                            </a>
                                        </li>
                                    {/if}
                                    <li id="top-menu-2" class="one-icon mega-li">
                                        <a href="index.php" class="mega-link" data-action="click-trigger"
                                            alt="Votre Messagerie" title="Votre Messagerie">
                                            <span class="mega-icon"><i class="fa fa-envelope"></i></span>
                                            <span class="badge vd_bg-red" id="nb_message_menu"></span>
                                        </a>
                                        <div class="vd_mega-menu-content width-xs-3 width-sm-4 width-md-5 width-lg-4 right-xs left-sm"
                                            data-action="click-target" style="display: none;">
                                            <div class="child-menu">
                                                <div class="title">
                                                    Messages
                                                </div>
                                                <div class="content-list content-image">
                                                    <div data-rel="scroll" class="mCustomScrollbar _mCS_2"
                                                        style="overflow: hidden;">
                                                        <div class="mCustomScrollBox mCS-light" id="mCSB_2"
                                                            style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">
                                                            <div class="mCSB_container mCS_no_scrollbar"
                                                                style="position: relative; top: 0px;">
                                                                <ul class="list-wrapper pd-lr-10" id="lst_message_menu">
                                                                </ul>
                                                            </div>
                                                            <div class="mCSB_scrollTools"
                                                                style="position: absolute; display: none;">
                                                                <div class="mCSB_draggerContainer">
                                                                    <div class="mCSB_dragger"
                                                                        style="position: absolute; top: 0px;"
                                                                        oncontextmenu="return false;">
                                                                        <div class="mCSB_dragger_bar"
                                                                            style="position:relative;"></div>
                                                                    </div>
                                                                    <div class="mCSB_draggerRail"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="closing text-center" style="">
                                                        <a href="main.php?dir=gestdiscuprat">Voir tous les messages <i
                                                                class="fa fa-angle-double-right"></i></a>
                                                    </div>
                                                </div>
                                            </div> <!-- child-menu -->
                                        </div> <!-- vd_mega-menu-content -->
                                    </li>


                                    {if in_array('rdverreursynchro',$tabdroituser) and $bErreurSynchorFtp}
                                        <li id="top-menu-1" class="one-icon mega-li">
                                            <a href="index.php" class="mega-link" data-action="click-trigger"
                                                alt="Liste des erreurs de synchro" title="Liste des erreurs de synchro">
                                                <span class="mega-icon">
                                                    <i class="fa icon-switch"></i>
                                                </span>
                                                <span class="badge vd_bg-red">{$iAlerterreurSynchro}</span>
                                            </a>
                                            <div class="vd_mega-menu-content width-xs-3 width-sm-4 width-md-5 width-lg-4 right-xs left-sm"
                                                data-action="click-target" style="display: none;">
                                                <div class="child-menu">
                                                    <div class="title">
                                                        Liste des erreurs de synchro
                                                    </div>
                                                    <div class="content-list content-image">
                                                        <div data-rel="scroll" class="mCustomScrollbar _mCS_2"
                                                            style="overflow: hidden;">
                                                            <div class="mCustomScrollBox mCS-light" id="mCSB_2"
                                                                style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">

                                                                <div class="mCSB_scrollTools"
                                                                    style="position: absolute; opacity: 0; display: none;">
                                                                    <div class="mCSB_draggerContainer">
                                                                        <div class="mCSB_dragger"
                                                                            style="position: absolute; height: 209px; top: 0px;"
                                                                            oncontextmenu="return false;">
                                                                            <div class="mCSB_dragger_bar"
                                                                                style="position: relative; line-height: 209px;">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mCSB_draggerRail"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="closing text-center" style="">
                                                            <a href="main.php?dir=rdverreursynchro">Tous les erreurs de
                                                                synchro <i class="fa fa-angle-double-right"></i></a>
                                                        </div>
                                                    </div>
                                                </div> <!-- child-menu -->
                                            </div> <!-- vd_mega-menu-content -->
                                        </li>
                                    {/if}

                                    {if in_array('notification',$tabdroituser)}

                                        <li id="top-menu-1" class="one-icon mega-li">
                                            <a href="index.php" class="mega-link" data-action="click-trigger"
                                                alt="Notifications de rdv" title="Notifications de rdv">
                                                <span class="mega-icon">
                                                    <i class="fa fa-warning"></i>
                                                </span>
                                                <span class="badge vd_bg-red">{$iAlertRdvattente}</span>
                                            </a>
                                            <div class="vd_mega-menu-content width-xs-3 width-sm-4 width-md-5 width-lg-4 right-xs left-sm"
                                                data-action="click-target" style="display: none;">
                                                <div class="child-menu">
                                                    <div class="title">
                                                        Notifications
                                                    </div>
                                                    <div class="content-list content-image">
                                                        <div data-rel="scroll" class="mCustomScrollbar _mCS_2"
                                                            style="overflow: hidden;">
                                                            <div class="mCustomScrollBox mCS-light" id="mCSB_2"
                                                                style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">
                                                                <div class="mCSB_container"
                                                                    style="position: relative; top: 0px;">
                                                                    <ul class="list-wrapper  pd-lr-10">
                                                                        {foreach from=$aTableauListeRDVattente item=objRDV}
                                                                            <li>
                                                                                <a href="#"
                                                                                    onclick="get_fiche_rendez_vous({$objRDV.id_prise_rendez_vous});
                                                                                        $('#modalFicheRendezVous').modal('show');$('#info_rdv_modal_link').click();">
                                                                                    <div class="menu-icon"><img
                                                                                            alt="example image"
                                                                                            src="uploads/{$objRDV.photo_user}">
                                                                                    </div>
                                                                                    <div class="menu-text"> Rendez vous du
                                                                                        {$objRDV.daterdv} à {$objRDV.heurerdv}
                                                                                        <div class="menu-info">
                                                                                            <span class="menu-date">de
                                                                                                {$objRDV.abreviation_civilite}
                                                                                                {$objRDV.nompatient}
                                                                                                {$objRDV.prenompatient}</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </a>
                                                                            </li>
                                                                        {/foreach}
                                                                        <li>
                                                                            <a href="main.php?dir=rdvattenteconf">

                                                                                <div class="menu-text"
                                                                                    style="margin-left: 10px;">En attente
                                                                                    confirmation
                                                                                    <div class="menu-info">
                                                                                        <span
                                                                                            class="menu-date">{$nbrrdvattenteconifrmation}
                                                                                            Rendez-vous </span>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                        </li>

                                                                        <li>
                                                                            <a href="main.php?dir=rdvsuppressiongroupe">

                                                                                <div class="menu-text"
                                                                                    style="margin-left: 10px;">En annulation
                                                                                    groupée
                                                                                    <div class="menu-info">
                                                                                        <span
                                                                                            class="menu-date">{$nbrrdvsuppressiongroupe}
                                                                                            Rendez-vous </span>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                        </li>

                                                                        <li>
                                                                            <a href="main.php?dir=rdvdeprogram">

                                                                                <div class="menu-text"
                                                                                    style="margin-left: 10px;">En conflit
                                                                                    absence
                                                                                    <div class="menu-info">
                                                                                        <span
                                                                                            class="menu-date">{$nbrrdvconfliconge}
                                                                                            Rendez-vous </span>
                                                                                    </div>
                                                                                </div>
                                                                            </a>
                                                                        </li>

                                                                    </ul>
                                                                </div>
                                                                <div class="mCSB_scrollTools"
                                                                    style="position: absolute; opacity: 0; display: none;">
                                                                    <div class="mCSB_draggerContainer">
                                                                        <div class="mCSB_dragger"
                                                                            style="position: absolute; height: 209px; top: 0px;"
                                                                            oncontextmenu="return false;">
                                                                            <div class="mCSB_dragger_bar"
                                                                                style="position: relative; line-height: 209px;">
                                                                            </div>
                                                                        </div>
                                                                        <div class="mCSB_draggerRail"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {*<div class="closing text-center" style="">
                                                            <a href="main.php?dir=rdvattenteconf">Tous les RDV en attente de confirmation <i class="fa fa-angle-double-right"></i></a>
                                                        </div>
                                                        *}

                                                    </div>
                                                </div> <!-- child-menu -->
                                            </div> <!-- vd_mega-menu-content -->
                                        </li>
                                    {/if}

                                    <li id="top-menu-profile" class="profile mega-li">
                                        <a href="#" class="mega-link" data-action="click-trigger">
                                            <span class="mega-image">
                                                <img src="uploads/{$photouser}" alt="{$prenomuser}" />
                                            </span>
                                            <span class="mega-name">
                                                {$prenomuser} <i class="fa fa-caret-down fa-fw"></i>
                                            </span>
                                        </a>

                                        <div class="vd_mega-menu-content  width-xs-2  left-xs left-sm"
                                            data-action="click-target" style="z-index: 10">
                                            <div class="child-menu">
                                                <div class="content-list content-menu">
                                                    <ul class="list-wrapper pd-lr-10">
                                                        <li>
                                                            <span class="mega-name" style="display:none;">
                                                                {$prenomuser} <i class="fa fa-caret-down fa-fw"></i>
                                                            </span>
                                                        </li>
                                                        <li> <a href="?dir=mon_compte">
                                                                <div class="menu-icon"><i class=" fa fa-user"></i></div>
                                                                <div class="menu-text">Mon compte</div>
                                                            </a> </li>
                                                        {if $sGroupe=='adminstructure' or in_array('vos_factures',$tabdroituser)}
                                                            <li> <a href="?dir=vos_factures">
                                                                    <div class="menu-icon"><i
                                                                            class=" fa fa-folder-open"></i></div>
                                                                    <div class="menu-text">Vos factures</div>
                                                                </a> </li>
                                                        {/if}
                                                        {if $binfofile=='ok'}
                                                            <li> <a href="#">
                                                                    <div class="menu-icon"><i class=" fa fa-trophy"></i>
                                                                    </div>
                                                                    <div class="menu-text">{$filescript}</div>
                                                                </a> </li>
                                                            <li> <a href="#">
                                                                    <div class="menu-icon"><i class="fa fa-university"></i>
                                                                    </div>
                                                                    <div class="menu-text">{$lecentre}</div>
                                                                    <div class="menu-badge"></div>
                                                                </a> </li>
                                                        {/if}
                                                        <li> <a href="javascript:void(0);" onclick="info_support();">
                                                                <div class="menu-icon"><i class="fa fa-info"></i></div>
                                                                <div class="menu-text">Obtenir de l'aide</div>
                                                            </a> </li>
                                                        <!--<li> <a href="https://get.teamviewer.com/alaxione" target="_blank"> <div class="menu-icon"><i class="ico-teamviewer fa-info"></i></div> <div class="menu-text">T&eacute;l&eacute;charger Quick Support</div> </a> </li>-->
                                                        <li> <a href="javascript:void(0);" onclick="ouvrir_cgu_menu();">
                                                                <div class="menu-icon"><i class="fa fa-file-text-o"></i>
                                                                </div>
                                                                <div class="menu-text">CGU</div>
                                                            </a> </li>
                                                        <li> <a href="deco.php">
                                                                <div class="menu-icon"><i class=" fa fa-sign-out"></i>
                                                                </div>
                                                                <div class="menu-text">Déconnexion</div>
                                                            </a> </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    {literal}
                                    <script>
                                        function ouvrir_cgu_menu() {
                                            $('#myModalcgumedecin').modal('show');
                                            $('#btn_cgu_retour').remove();
                                            $('#btn_cgu_return').html(
                                                '<button type="button" class="btn btn_confirm" data-dismiss="modal" aria-hidden="true" style="background-color: #01D0CA;">Retour <span class="menu-icon"><i class="fa fa-fw fa-chevron-circle-right"></i></span></button>'
                                                );
                                        }
                                    </script>
                                    {/literal}

                                    <li id="top-menu-salle-attente" style="display:none;"
                                        class="one-big-icon {if $bIsMobile}hidden{/if} mega-li" data-intro=""
                                        data-step="2" data-position="left">
                                        <a href="#" class="mega-link" 
                                            alt="Salle d'attente" title="Salle d'attente">
                                            <span class="mega-icon">
                                                <i class="fa fa-users"></i>
                                            </span>
                                            <span id="nb_salle_attente" class="badge vd_bg-red"></span>
                                        </a>

                                    </li>

                                </ul>
                                <!-- Head menu search form ends -->
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- container -->
    </div>
    <!-- vd_primary-menu-wrapper -->

</header>
<!-- Header Ends -->