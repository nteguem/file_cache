<style>
    .vd_mega-menu-wrapper.horizontal-menu .vd_mega-menu > .mega-ul > .mega-li {
        padding: 8px 5px;
    }
</style>

{if $idinterpro == "0" }
    <div align="center">
        <div class="vd_mega-menu-wrapper horizontal-menu">
            <div class="vd_mega-menu">
                <ul class="mega-ul">
                    {if $sGroupe=="agendaconsult"}
                        <li class="mega-li" style="text-align: center;margin:10px;">
                            <a href="main.php?dir=agendaconsult" class="mega-link" alt="Agenda" title="Agenda">
                                <span class="mega-icon"><i class="fa fa-calendar" style="font-size: x-large;"
                                                           alt="Agenda"></i></span><br/>
                            </a>
                        </li>
                        <li class="mega-li" style="text-align: center;margin:10px;">
                            <a href="main.php?dir=gestdiscuprat" class="mega-link" alt="Messagerie" title="Messagerie">
                                <span class="mega-icon"><i class="fa fa-envelope" style="font-size: x-large;"
                                                           alt="Messagerie"></i></span><br/>
                            </a>
                        </li>
                    {else}
                        {if $idc=="88ydcgnhduwwdkgvq"}
                            <li class="mega-li" style="text-align: center;margin:10px;">
                                <a href="main.php?dir=calpresta" class="mega-link" alt="Agenda presta"
                                   title="Agenda presta">
                                    <span class="mega-icon"><i class="fa fa-calendar" style="font-size: x-large;"
                                                               alt="Agenda presta<"></i></span><br/>
                                </a>
                            </li>
                        {/if}
                        <li class="mega-li" style="text-align: center;margin:10px;" alt="Patients" title="Patients">
                            <a href="main.php?dir=gestpatientstruct" class="mega-link">
                                <span class="mega-icon"><i class="fa fa-user"
                                                           style="font-size: x-large;"></i></span><br/>
                            </a>
                        </li>
                        <li class="mega-li" style="text-align: center;margin:10px;" title="Messagerie">
                            <a href="main.php?dir=gestdiscuprat" class="mega-link" alt="Messagerie">
                                <span class="mega-icon"><i class="fa fa-envelope"
                                                           style="font-size: x-large;"></i></span><br/>
                            </a>
                        </li>
                        {section name='sec1param' loop=$aTableauMenu}
                            {if  {$aTableauMenu[sec1param][2]}=="Paramétrage"}
                                <li class="hover-trigger mega-li" style="text-align: center;margin:10px;"
                                    title="Paramètres">
                                    <a href="#" class="mega-link" data-action="click-trigger">
                                        <div class="menu-icon">
                                            <i class="fa fa-cog" style="font-size: x-large;"></i>
                                        </div>
                                    </a>
                                    <div class="vd_mega-menu-content  width-xs-4  right-xs" data-action="click-target"
                                         style="display: none;">
                                        <div class="child-menu">
                                            <div class="content-list content-menu">
                                                <ul class="list-wrapper pd-lr-10">
                                                    {section name='sec1' loop=$aTableauMenu}
                                                        {if {$aTableauMenu[sec1][2]}=="Paramétrage"}
                                                            {if !empty($aTableauMenu[sec1][4])}
                                                                {foreach from=$aTableauMenu[sec1][4] item=tabM name=sTabM}
                                                                    <li {if $bActivtraduction=='Yes'}style="padding: 10px 10px 10px 10px;"{/if}>
                                                                        <a href="{$tabM[1]}"
                                                                           {if $bActivtraduction=='Yes'}style="display:inline"{/if}>
                                                                            <span class="menu-text">{$tabM[2]}</span>
                                                                        </a>
                                                                        {if $bActivtraduction=='Yes'}
                                                                            &nbsp;
                                                                            <a href="#" style="display:inline"
                                                                               onclick="renvoi_info_traduction('{$tabM[1]}','{$tabM[1]}','{$sLangueUser}','{$tabM[2]|replace:'\'':'\\\''}','fli_menulist','fli_menulist');$('#fli_modallg').modal('show');"><span
                                                                                        class="glyphicon glyphicon-pencil"></span></a>
                                                                        {/if}
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        {/if}
                                                    {/section}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                        {/section}

                        {section name='sec1test' loop=$aTableauMenu}
                            {if {$aTableauMenu[sec1test][2]}=="RH"}
                                <li class="hover-trigger mega-li" style="text-align: center;margin-top:0;">
                                    <a href="#" class="mega-link" data-action="click-trigger">
                                        <div class="menu-icon">
                                            <i class="fa fa-users" style="font-size: x-large;"></i>
                                        </div>
                                        <div class="menu-text"><i class="fa fa-caret-down fa-fw"></i>
                                        </div>
                                    </a>
                                    <div class="vd_mega-menu-content  width-xs-4  right-xs" data-action="click-target"
                                         style="display: none;">
                                        <div class="child-menu">
                                            <div class="content-list content-menu">
                                                <ul class="list-wrapper pd-lr-10">
                                                    {section name='sec11' loop=$aTableauMenu}
                                                        {if {$aTableauMenu[sec11][2]}=="RH"}
                                                            {if !empty($aTableauMenu[sec11][4])}
                                                                {foreach from=$aTableauMenu[sec11][4] item=tabM name=sTabM}
                                                                    <li {if $bActivtraduction=='Yes'}style="padding: 10px 10px 10px 10px;"{/if}>
                                                                        <a href="{$tabM[1]}"
                                                                           {if $bActivtraduction=='Yes'}style="display:inline"{/if}>
                                                                            <span class="menu-text">{$tabM[2]}</span>
                                                                        </a>
                                                                        {if $bActivtraduction=='Yes'}
                                                                            &nbsp;
                                                                            <a href="#" style="display:inline"
                                                                               onclick="renvoi_info_traduction('{$tabM[1]}','{$tabM[1]}','{$sLangueUser}','{$tabM[2]|replace:'\'':'\\\''}','fli_menulist','fli_menulist');$('#fli_modallg').modal('show');"><span
                                                                                        class="glyphicon glyphicon-pencil"></span></a>
                                                                        {/if}
                                                                    </li>
                                                                {/foreach}
                                                            {/if}
                                                        {/if}
                                                    {/section}
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            {/if}
                        {/section}

                        {if isset($bmenuraccourci) and $bmenuraccourci}
                            <li class="mega-li" style="text-align: center;margin:10px;" title="Raccourcis">
                                <a href="#" class="mega-link" data-action="click-trigger">
                                    <div class="menu-icon">
                                        <i class="fa fa-flash" style="font-size: x-large;"></i>
                                    </div>
                                </a>
                                <div class="vd_mega-menu-content  width-xs-auto width-sm-5  right-xs"
                                     data-action="click-target" style="display: none;">
                                    <div class="child-menu">
                                        <div class="content-grid column-sm-3 column-xs-1 height-xs-auto">
                                            <ul class="list-wrapper pd-lr-10">

                                                {if in_array('listerdv',$tabdroituser)}
                                                    <li>
                                                        <a href="main.php?dir=listerdvjour">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-book"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Liste des RDV
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}

                                                {if in_array('listerdvatraiter',$tabdroituser)}
                                                    <li>
                                                        <a href="main.php?dir=listerdvatraiter">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-check-square-o"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                RDV à traiter
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}

                                                {if in_array('listeprofilageenattente',$tabdroituser)}
                                                    <li>
                                                        <a href="main.php?dir=listeprofilageenattente">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-copy"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                RDV Profilage en attente
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}

                                                {if in_array('print_recap_paiement_rdv',$tabdroituser)}
                                                    <li>
                                                        <a href="main.php?dir=print_recap_paiement_rdv">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-eur"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Récap. des Paiements
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}

                                                {if in_array('droitfusionpatient',$tabdroituser) and $bactivefusionpatient}
                                                    <li>
                                                        <a href="main.php?dir=droitfusionpatient ">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-exchange"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Fusionner les patients
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}
                                                {if in_array('droitfusionpatient',$tabdroituser) and $bActivefusionNom}
                                                    <li>
                                                        <a href="main.php?dir=droitfusionpatientnomprenom ">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-exchange"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Fusionner les patients nom/prenom/ddn
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}

                                                {if in_array('reponsemail',$tabdroituser)}
                                                    <li>
                                                        <a href="ReactAlaxioneCalendar/#/reponseEmail">
                                                            <div class="menu-icon">
                                                                <i class="fa fa-paper-plane"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Mail D'ensemble
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}

                                                {if in_array('statistique',$tabdroituser)}
                                                    <li>
                                                        <a href="main.php?dir=statistique">
                                                            <div class="menu-icon">
                                                                <i class="glyphicon glyphicon-stats"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Statistique
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}
                                                {if $bActifSurvey && in_array('voiravispatients',$tabdroituser)}
                                                    <li>
                                                        <a href="{$sLinkAlaxioneSurvey}?token_user={$token_user}&sdomaine={$sDomaine}" target = "_blank">
                                                            <div class="menu-icon">
                                                                <i class="ico-survey"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Avis
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}
                                                {if in_array('gestionappeltel',$tabdroituser)}
                                                    <li>
                                                        <a href="main.php?dir=gestionappeltel">
                                                            <div class="menu-icon">
                                                                <i class="ico-phone"></i>
                                                            </div>
                                                            <div class="menu-text">
                                                                Appels
                                                                {*<div class="menu-info">
                                                                    <span class="menu-date vd_bg-red badge">Nouveau</span>
                                                                </div>*}
                                                            </div>
                                                        </a>
                                                    </li>
                                                {/if}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        {/if}
                        <li class="mega-li" style="text-align: center;margin:10px;" title="Raccourcis">
                            <a href="#" class="mega-link" data-action="click-trigger">
                                <div class="menu-icon">
                                    <i class="icon-screen" style="font-size: x-large;"></i>
                                </div>
                            </a>

                            <div class="vd_mega-menu-content  width-xs-auto width-sm-5  right-xs"
                                 data-action="click-target" style="display: none;">
                                <div class="child-menu">
                                    <div class="content-grid column-sm-3 column-xs-1 height-xs-auto">
                                        <ul class="list-wrapper pd-lr-10">
                                            <li>
                                                <a href="main.php?dir=gestquestion">
                                                    <div class="menu-icon">
                                                        <i class="icon-question"></i>
                                                    </div>
                                                    <div class="menu-text">Liste des Questions</div>
                                                </a>
                                            </li>

                                            <li>
                                                <a href="main.php?dir=gestdem">
                                                    <div class="menu-icon">
                                                        <i class="icon-comment"></i>
                                                    </div>
                                                    <div class="menu-text">Liste des Demandes</div>
                                                </a>
                                            </li>
                                       


                                    </ul>
                                </div>
                            </div>
                        </li>
                    {/if}

                    {if !empty($tabLstCentre)}
                        <li class="hover-trigger mega-li" style="text-align: center;margin-top:0;">
                            <a href="#" class="mega-link" data-action="click-trigger">
                                <div class="menu-icon">
                                    <i class="fa fa-cog" style="font-size: xx-large;"></i>
                                </div>
                                <div class="menu-text">Liste des centres<i class="fa fa-caret-down fa-fw"></i>
                                </div>
                            </a>
                            <div class="vd_mega-menu-content  width-xs-4  right-xs" data-action="click-target"
                                 style="display: none;">
                                <div class="child-menu">
                                    <div class="content-list content-menu">
                                        <ul class="list-wrapper pd-lr-10">
                                            {foreach from=$tabLstCentre item=tabLCentre name=sTabListeCentre}
                                                <li>
                                                    <a href="main.php?dir=rechdispo&basculecentre=ok&identifiant_centre={$tabLCentre.identifiant_entite}">
                                                        <span class="menu-text">{$tabLCentre.nom_entite}</span>
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                    {/if}
                </ul>
                <!-- Head menu search form ends -->
            </div>
        </div>
    </div>
{else}
    <div align="center">
        <div class="vd_mega-menu-wrapper horizontal-menu">
            <div class="vd_mega-menu">
                <ul class="mega-ul">
                    <li class="mega-li" style="text-align: center;margin-top:0;">
                        <a href="index.php" class="mega-link">
                            <span class="mega-icon"><i class="fa fa-calendar" style="font-size: x-large;"></i></span><br/>
                            <span class="mega-text">Agenda</span>
                        </a>
                    </li>
                </ul>
                <!-- Head menu search form ends -->
            </div>
        </div>
    </div>
{/if}