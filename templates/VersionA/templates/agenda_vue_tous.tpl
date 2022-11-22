<!-- Fullcalendar v5 -->
<link rel="stylesheet" href="plugins/fullcalendar-v5/main.min.css">
<?php $main = filemtime(PATH_ASSETS . 'plugins/fullcalendar-v5/main.min.js') ?>
<script src="plugins/fullcalendar-v5/main.min.<?php echo $main ?>.js"></script>

<?php $localFR = filemtime(PATH_ASSETS . 'plugins/fullcalendar-v5/locales/fr.js') ?>
<script src="plugins/fullcalendar-v5/locales/fr.<?php echo $localFR ?>.js"></script>

<!-- jQuery contextmenu (rightclick) -->
<link rel="stylesheet" href="plugins/jquery-contextmenu/jquery.contextMenu.min.css">
<?php $contextMenu = filemtime(PATH_ASSETS . 'plugins/jquery-contextmenu/jquery.contextMenu.min.js') ?>
<script src="plugins/jquery-contextmenu/jquery.contextMenu.min.<?php $contextMenu ?>.js"></script>
<?php $position = filemtime(PATH_ASSETS . 'plugins/jquery-contextmenu/jquery.ui.position.js') ?>
<script src="plugins/jquery-contextmenu/jquery.ui.position.<?php echo $position ?>.js"></script>

<!-- Pikaday -->
<link href="plugins/pikaday1.8.2/pikaday.css" rel="stylesheet">
<?php $pikaday = filemtime(PATH_ASSETS . 'plugins/pikaday1.8.2/pikaday.min.js') ?>
<script src="plugins/pikaday1.8.2/pikaday.min.<?php echo $pikaday ?>.js"></script>

<!-- script chelou de Guy -->
<?php $planningDispo = filemtime(PATH_ASSETS . 'js/js_planning_dispo.js') ?>
<script type="text/javascript" src="js/js_planning_dispo.<?php echo $planningDispo ?>.js"></script>

<!-- Calendar -->
<link rel="stylesheet" href="css/calendar.css">
<?php $calendar = filemtime(PATH_ASSETS . 'js/calendar.js') ?>
<script type="text/javascript" src="js/calendar.<?php echo $calendar ?>.js"></script>
<link href="css/font-icomoon.css" rel="stylesheet" type="text/css">

<div id="calendarVueTous" style="display:flex;">
    <div class="menuBar">
        <form id="form-inline" class="searchBar">
            <input id="myInputSearch" class="form-control mr-sm-2 noBorderRadius" type="text" placeholder="Rechercher"
                   aria-label="Search">
            <span class="crossSearchBar"><i class="icon-cross"></i></span>
        </form>

        <div class="mainMenuBarActions">
            <div class="dropdown">
                <a href="#" data-toggle="dropdown">
                    <span class="mega-image">
                        <i class="fa fa-bars fa-2x burgerButtonGeneral"></i>
                    </span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" id="reloadButton" title="Recharger la vue">Actualiser</a>
                    </li>
                    <li>
                        <a href="#" id="expandAllButton" title="Etendre">Déployer</a>
                    </li>
                    <li>
                        <a href="#" id="collapseAllButton" title="Replier">Réduire</a>
                    </li>

                    <li role="separator" class="divider switchButtons"></li>
                    <li class="dropdown-header switchButtons">Segmentation par</li>
                    <li id="bySpecialty" class="switchButtons">
                        <a href="#" class="itemPicto" id="switchToSpecialty" title="Affichage par spécialité">Spécialité
                            <i class="fa fa-check" aria-hidden="true"></i>
                        </a>

                    </li>
                    <li id="byLocation" class="switchButtons">
                        <a href="#" class="itemPicto" id="switchToLocation" title="Affichage par lieux">Lieux
                            <i class="fa fa-check" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <div onclick="modal_prendre_rendez_vous_uniqueNew(true);" class="newAppointmentButton">
                <img src="img/crossButton.svg" />
            </div>
        </div>
        <div id="practitionerList" class="practitionerList"></div>
    </div>
    <div class="menuCalendar">
        <div class="headerAboveCalendar">
            <div style="flex:1;"><button style="display: none;" class="cancelFirstAvailableButton">Annuler</button>
            </div>
            <h2 class="practitionerNameTitle"></h2>
            <div>
                {if isset($aTabRetourDroits.roue_crantee.gestiondiposv2) && $aTabRetourDroits.roue_crantee.gestiondiposv2==="1"}
                    <div class="agendaSwitch" id="agendaSwitch">
                        <u>Agenda</u>
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider round" id="switchAgenda"></span>
                        </label>
                    </div>
                {/if}
            </div>
        </div>
        <div id='calendar' style="margin: 1%; padding-bottom: 5vh"></div>
        <i id="calendarLoader" class="fa fa-spinner fa-spin mgr-10 calendarLoader"></i>
    </div>
    <div>
        <input type="hidden" name="bdroitcreerendezvouscalendar" id="bdroitcreerendezvouscalendar"
               value="{if isset($aTabRetourDroits.Rendez_vous.bdroitcreerendezvouscalendar)}{$aTabRetourDroits.Rendez_vous.bdroitcreerendezvouscalendar}{else}0{/if}">
        <input type="hidden" id="id_identifiant_patient" value="">
    </div>
    {if $sSessionNumeroAppelant != "" || $sSessionNumeroAppele != ""}
        <div id="FloatingListPatient" style="    position: absolute;    display: flex;    bottom: 50px;    right: 50px;z-index:5;"><span class = "ico-floating-call" style="    font-size: 90px;opacity: 1;background: -webkit-radial-gradient(#134058, #5D9AD4);-webkit-background-clip: text;-webkit-text-fill-color: transparent;cursor: pointer;text-shadow: #fff 1px 0px 100px;" onclick="getListepatient(NumeroAppelant, NumeroAppele)"></span></div>
    {/if}
    <div>
        {include file='modal_degeu.tpl'}
        {include file='modal_filtre_dispo.tpl'}
        {include file='modal_instruction_info.tpl'}
    </div>
    <script>
        const NumeroAppelant = {$sCookieNumeroAppelant|@json_encode nofilter}
        const NumeroAppele = {$sCookieNumeroAppele|@json_encode nofilter}
        const idc = {$idc|@json_encode nofilter};
        const professionsList = {$aTabRetourPraticienProfession|@json_encode nofilter};
        const practitionersList = {$aTableaupraticien|@json_encode nofilter};
        const rights = {$userCogRights|@json_encode nofilter};
        const defaultTimeSlot = {$sTaillecellule|@json_encode nofilter};
        const userRights = {$userRights|@json_encode nofilter};
        const toDate = {$toDate|@json_encode nofilter};
        const locationsList = {$aTableauLieux|@json_encode nofilter};
        const locationsPractitioners = {$aTableauLieuxPraticiens|@json_encode nofilter};
        const globalRights = {
            sonsalleattente: {$optionsonsalleattente|@json_encode nofilter},
            masquerrdvannule: {$optionmasquerdvannule|@json_encode nofilter} === 'Y'
        };
        const customParameters = {
            defaultTimeSlot: defaultTimeSlot,
            userRights: userRights,
            initialDate: toDate,
            locationsList: locationsPractitioners,
            globalRights: globalRights
        };
        const cal = new Calendar(idc, professionsList, practitionersList, customParameters);
        cal.initCalendar();
    </script>
</div>