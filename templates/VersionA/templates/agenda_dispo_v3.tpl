

<!-- Yannick test 2-->
  <link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.{$xtAgandaDispoV3}.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-treeview.{$treeAgandaDispoV3}.css">

  <script type="text/javascript" src="js/datepicker-fr.{$datepickerFr}.js"></script>

  <script type="text/javascript" src="js/liste_e7.{$listeE7}.js?{$stime}"></script>
  <script type="text/javascript" src="js/js_planning_dispo.{$jsPlanningDispo}.js?{$stime}"></script>

  <script type="text/javascript" src="js/jquery.contextmenu.{$contextMenu}.js"></script>

  <script type="text/javascript" src="js/bootstrap-treeview.{$treeview}.js"></script>

{literal}
<!--
<script type="text/javascript" src="js/jquery.contextMenu.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.position.min.js"></script>
-->

<style type="text/css">
.fc-time-grid .fc-slats td {
    /* height: {/literal}{$sTaillecellule}em !important;{literal}*/
}

.stylegreen{
  background-color: #00ff00;
}

.fc-ltr .fc-time-grid .fc-event-container {
  margin: 0 10% 0 2px;
}

.fc-event-time {
  display: inline;
  font-size: 12px;
  color: gray;
  cursor: pointer;
}


.fc-event{
    cursor: pointer;
}

.fc-event-container a{
  border:0px;
}


.nav-tabs.nav-justified>li>a{
  background-color: #eee;
  color:#555;
}


.nav-tabs.nav-justified>.active>a, .nav-tabs.nav-justified>.active>a:hover, .nav-tabs.nav-justified>.active>a:focus{
  background-color: #fff;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
  color:#27A1C2;
}


.coin_arrondi{
  border: solid 1px #81817C;
  -moz-border-radius:5px;
  -webkit-border-radius:5px;
  border-radius:5px;

  padding: 5px;
}

.timeline {
    position: absolute;    
    border-top: 2px solid red;
    width: 100%;
    margin: 0;
    padding: 0;
    z-index: 999 !important;
}

.stripe-salle-attente {
  background: repeating-linear-gradient(
    45deg,
    #606dbc,
    #606dbc 15px,
    #465298 15px,
    #465298 30px
  );
}

/*.stripe-salle-attente > .striped(#606dbc; 45deg);*/

.niveau_bas{
  background-color: #FDFFD7;
}

.niveau_normal{
  background-color: #ffffff;
}

.niveau_haut{
  background-color: #D7E7FF;
}

.niveau_urgent{
  background-color: #FFD7D7;
}

.list-group-item {
  padding: 5px 5px !important;
}

</style>

<script type="text/javascript">
  var refreshIntervalId = "";
  var headerHeightagenda = "";
</script>

{/literal}

<div id="dialog-confirm" title="Reinitialiser la sélection" style="display:none;">
  <p>Souhaitez-vous réinitialiser la sélection ?</p>
</div>

{if $bsucess}
<div class="alert alert-success">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
              <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
            {$sMessageSucess}
 </div>
{/if}

{if $berror}
<div class="alert alert-danger">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
              <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
              {$sMessageError}
          </div>
{/if}
<div class="vd_content-section clearfix">
<input type="hidden" name="passepraticien" id="idpassepraticien">
<input type="hidden" name="passelieu" id="idpasselieu">
<input type="hidden" name="passerdv" id="idpasserdv">
<input type="hidden" name="passevalidation" id="idpassevalidation">
<input type="hidden" name="tabactive" id="tabactive" value="1">
<input type="hidden" name="moderecherche" id="moderecherche">
<input type="hidden" name="chktime" id="chktime" value="0">
<input type="hidden" name="widthagenda" id="widthagenda" value="">


  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget">
        <div class="panel-body">


          <div class="btn_param no-print">
            <div id="div_param_agenda" class="vd_content-section clearfix row" style="display:none;">
              <form class="form-horizontal" action="main.php?dir=rechdispo" role="form" id="form_filtre_agenda" method="POST">
                {*<input type="hidden" name="lstfiltreagenda" id="lstfiltreagenda" value="">*}
                <input type="hidden" name="bsetfiltre" id="bsetfiltre" value="ok">
                <input type="hidden" name="bsetapplique" id="bsetapplique" value="praticien">
                <input type="hidden" name="identifiant_entite" value="{$idc}">
                <div class="col-sm-12">
                  <h3 class="col-xs-3" style="padding-left:0px;">Nombre d'agenda par ligne :</h3>
                  <div class="controls col-xs-1">
                    <select id="nb_agenda_ligne" name="nb_agenda_ligne">
                      <option value="4" {if $nbagendaaffiche=='4'}selected{/if}>4</option>
                      <option value="5" {if $nbagendaaffiche=='5'}selected{/if}>5</option>
                      <option value="6" {if $nbagendaaffiche=='6'}selected{/if}>6</option>
                      <option value="7" {if $nbagendaaffiche=='7'}selected{/if}>7</option>
                    </select>
                  </div>
                </div>
                <hr>
                <div class="col-sm-12">
                  <h3>Agenda visible :</h3>
                  <ul class="nav nav-tabs">
                    <li class="active"><a id="tab_praticien" href="#fltab1" data-toggle="tab">Praticiens</a></li>
                    <li class=""><a id="tab_profession" href="#fltab2" data-toggle="tab">Professions</a></li>
                  </ul>
                  <div class="tab-content mgbt-xs-20" style="background-color:#fff; padding: 10px;">
                    <div class="tab-pane active no-print" id="fltab1">
                      <div class="vd_checkbox checkbox-success clearfix">
                        {foreach from=$tabPraticienPermanent item=tabPParam name=sTabPraticienParam}

                          <div class="col-sm-4">
                            <input class="checkpraticien" name="lstfiltreagenda[]" type="checkbox" value="{$tabPParam.identifiant_user}" id="checkbox-{$smarty.foreach.sTabPraticienParam.iteration}" {if $tabPParam.check_p == 1} checked="checked" {/if}>
                            <label for="checkbox-{$smarty.foreach.sTabPraticienParam.iteration}">{$tabPParam.abreviation_civilite} {$tabPParam.nom_user} {$tabPParam.prenom_user} ({$tabPParam.nom_profession})</label>
                          </div>
                        {/foreach}

                      </div>
                    </div>
                    <div class="tab-pane" id="fltab2">
                      <div class="vd_checkbox checkbox-success clearfix">
                      {foreach from=$aTableauprofession item=tabProParam name=sTabProfessionParam}

                        <div class="col-sm-3">
                          <input class="checkprofession" name="lstfiltreprofession[]" type="checkbox" value="{$tabProParam.id_profession}" id="checkboxpro-{$smarty.foreach.sTabProfessionParam.iteration}" {if $tabProParam.check_p == 1} checked="checked" {/if}>
                          <label for="checkboxpro-{$smarty.foreach.sTabProfessionParam.iteration}">{$tabProParam.nom_profession}</label>
                        </div>
                      {/foreach}
                      </div>
                    </div>

                  </div>
                </div>
                <div class="col-sm-12">
                  <div class="col-sm-4"></div>
                  <div class="col-sm-4" align="center">
                    <button id="btn_valider_param_agenda" alt="Valider" title="Valider" type="submit" class="btn vd_btn" style="background-color: #00D3C8;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Valider</button>
                    &nbsp;&nbsp;<button id="btn_annule_param_agenda" alt="Annuler" title="Annuler" type="button" class="btn vd_btn" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Annuler</button>
                  </div>
                  <div class="col-sm-4"></div>
                </div>
              </form>

            </div>
           {* <a href="#" onclick="$('#myModalfiltremedecin').modal('show');" alt="Sélectionner le planning à afficher" title="Sélectionner le planning à afficher"><img src="img/logo_afficher_agenda.gif" border="0" height="40px" /></a>
            &nbsp;&nbsp;&nbsp;
            <a href="#" onclick="$('#myModalfiltrrdv').modal('show');" alt="Aller au prochain RDV disponible" title="Aller au prochain RDV disponible"><img src="img/Picto_Chercher_RDV.gif" border="0" height="40px" /></a>
                <h2 id="divtextenteteplanning" align="center"><b>Planning Général</b></h2>*}
              <div class="row">
                   <div class="col-sm-12">
                      <div class="col-sm-2 controls">
                          <div class="btn-group" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                             <button id="btn_copie_rdv" alt="Copier en cours ..." title="Copier en cours ..." onclick="suppression_copier_rdv();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none">Copier en cours ... cliquez pour annuler</button>

                          </div>
                      </div>
                     <div class="col-sm-8 controls">
                       <div align="center">
                         <button id="btn_select_rdv" alt="Filtre sur le planning" title="Filtre sur le planning" onclick="aff_divattente('divfiltrepraticien', 'divattentefiltrepraticien');$('#myModalfiltremedecin').modal('show');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: blue;">Filtre sur le planning</button>

                         <button id="btn_prochain_rdv" alt="Aller au prochain RDV disponible" title="Aller au prochain RDV disponibles" onclick="aff_divattente('divfiltrerdv', 'divattentefiltrerdv');$('#myModalfiltrrdv').modal('show');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: green;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Aller au prochain RDV disponible</button>
                         &nbsp<button id="btn_prendre_rdv" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Prendre un rendez-vous</button>
                       </div>
                      </div>

                      <div class="col-sm-2 controls">
                        <div align="center">
                          <button id="btn_interpro_rdv" alt="Retour" title="Retour" onclick="rafraichir_calendrier('selectlieux2','selectpraticien2','selecttyperdv2','','datepickerrdv-widget','0', '1');$('#btn_interpro_rdv').css('display','none');$('#moderecherche').val('');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none">Retour</button>
                        </div>
                        <div align="right">
                          <a id="btn_param_calendar" class="mega-link" href="javascript:void(0);" data-action="click-trigger" alt="Paramètres de l'agenda" title="Paramètres de l'agenda">
                            <span class="mega-icon">
                                <i class="fa fa-cog" style="font-size:xx-large;"></i>
                            </span>
                          </a>
                          &nbsp;&nbsp;
                          <a id="btn_print_calendar" class="mega-link" href="javascript:void(0);" onclick="window.print();" alt="Imprimer" title="Imprimer">
                            <span class="mega-icon">
                                <i class="fa fa-print append-icon" style="font-size:xx-large;"></i>
                            </span>
                          </a>
                        </div>
                    </div>

        </div>
      </div>

          </div>
          <div style="height:10px"></div>
          <ul id="ulcalendar" class="nav nav-tabs nav-justified no-print">
              {foreach from=$tabPraticien item=tabP name=sTabPraticien}

                <li {if $smarty.foreach.sTabPraticien.iteration==1}class="active"{/if} >
                  <div title="Configuration" data-placement="bottom" class="width-sm-1" style="position:absolute;z-index:{50-$smarty.foreach.sTabPraticien.iteration};margin-left:10px;margin-top:10px;">
                    <div class="menu-trigger mega-icon" data-action="click-trigger"> <i class="fa fa-cog"></i> </div>
                    <div data-action="click-target" class="vd_mega-menu-content  width-sm-3">
                      <div class="child-menu">
                        <div class="content-list content-menu">
                          <ul class="list-wrapper pd-lr-10">
                            <li><a href="main.php?dir=boc_gestion_user&action=form&id_user={$tabP.id_user}">Fiche praticien</a></li>
                            <li><a href="main.php?dir=gestlieuplus&id_user={$tabP.id_user}">Gestion des lieux</a></li>
                            <li><a href="main.php?dir=gestrecomprat&identifiant_user={$tabP.identifiant_user}">Gestion des consignes</a></li>
                            <li><a href="main.php?dir=gestiondiposv2&id_user={$tabP.id_user}">Disponibilité Graphique</a></li>
                            <li><a href="main.php?dir=progdispo&id_user={$tabP.id_user}">Disponibilité Liste</a></li>
                            <li><a href="main.php?dir=configtypepersord&id_user={$tabP.id_user}">Les temps des RDV</a></li>
                            <li><a href="main.php?dir=tranchefertranche&id_user={$tabP.id_user}">Fermeture temporaire widget</a></li>
                            <li><a href="main.php?dir=gestrdvinterpro&id_user={$tabP.id_user}">Acces inter pro</a></li>
                            <li><a href="main.php?dir=progremplacant&identifiant_user={$tabP.identifiant_user}">Gestion des remplacants</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                  <a href="#tab{$smarty.foreach.sTabPraticien.iteration}" sidtab="{$smarty.foreach.sTabPraticien.iteration}" data-toggle="tab">

                    <h4><b>{$tabP.abreviation_civilite} {$tabP.nom_user}&nbsp;</b>
                      <span id="nb_consigne_{$smarty.foreach.sTabPraticien.iteration}" class="badge vd_bg-red" style="position:absolute;margin-top:-8px;margin-left:15px;"></span>
                      <span data-action="click-trigger" id="id_consigne_{$smarty.foreach.sTabPraticien.iteration}" class="menu-icon" title="Consigne du medecin"><i class="fa fa-list"></i></span>
                    </h4>
                  </a>
                  <div id="div-top-menu-consigne_{$smarty.foreach.sTabPraticien.iteration}" class="vd_mega-menu-content width-xs-3 width-sm-4 width-md-5 width-lg-4 right-xs left-sm" data-action="click-target">
                    <div class="child-menu">
                      <div class="title">
                        Liste des consignes
                      </div>
                      <div class="content-list content-image">
                        <div data-rel="scroll" class="mCustomScrollbar _mCS_2" style="overflow: hidden;">
                          <div class="mCustomScrollBox mCS-light" id="mCSB_2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                              <ul id="lst_consignes_{$smarty.foreach.sTabPraticien.iteration}" class="list-wrapper  pd-lr-10">
                              </ul>
                            </div>
                            <div class="mCSB_scrollTools" style="position: absolute; opacity: 0; display: none;">
                              <div class="mCSB_draggerContainer">
                                <div class="mCSB_dragger" style="position: absolute; height: 209px; top: 0px;" oncontextmenu="return false;">
                                  <div class="mCSB_dragger_bar" style="position: relative; line-height: 209px;"></div>
                                </div>
                                <div class="mCSB_draggerRail"></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div> <!-- child-menu -->
                  </div>   <!-- vd_mega-menu-content -->

                </li>
                {if $tabPraticien|@count > 1 && $smarty.foreach.sTabPraticien.iteration == $tabPraticien|@count}
                  <li ><a href="#taball" sidtab="all" data-toggle="tab"><h4><b>Tous</b></h4></a></li>
                {/if}
                {if $smarty.foreach.sTabPraticien.iteration % $nbagendaaffiche == 0}
                  <div></div>
                {/if}
              {/foreach}
          </ul>

            <br/>

            <div class="tab-content  mgbt-xs-20">
            {foreach from=$tabPraticien item=tabP2 name=sTabPraticien2}

              <div class="tab-pane {if $smarty.foreach.sTabPraticien2.iteration==1}active{/if}" id="tab{$smarty.foreach.sTabPraticien2.iteration}">
                <div id="div_name_praticien" class="affiche_print" style="display:none;" align="center">{$tabP2.abreviation_civilite} {$tabP2.nom_user}</div>
                <input type="hidden" id="datedebutaff_{$smarty.foreach.sTabPraticien2.iteration}" name="datedebutaff_{$smarty.foreach.sTabPraticien2.iteration}" value="{$datedebutaff}">
                
                {literal}
                <!-- Calendar -->
                <script type="text/javascript">
                 $(document).ready(function() {

                   $('#calendar_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').fullCalendar({
                    header: {
                      left: 'prev,next today',
                      center: 'title',
                      right: 'month,agendaWeek,agendaDay'
                    },
                    
                    contentHeight: 'auto',
                    height: 'auto',
                    lang: 'fr',         //langue francais
                    editable: false,       //calendrier modifiable
                    weekNumbers: true,      //on affiche le num de semaine
                    hiddenDays: [ 0 ],      //on n'affiche pas le dimanche
                    scrollTime: "{/literal}{$tabP2.affichage_agenda_heure_debut}{literal}",   //le scroll débute à 7h
                    minTime: "{/literal}{$tabP2.affichage_agenda_heure_debut}{literal}",    //le calendar demarre à 7h
                    maxTime: "{/literal}{$tabP2.affichage_agenda_heure_fin}{literal}",    //le calendar fini à 20h
                    slotEventOverlap: false,  //les event ne se chevoche pas
                    defaultView: 'agendaWeek',  //afficher la semaine par defaut
                    defaultDate: moment($('#datedebutaff_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').val()).format('YYYY-MM-DD'),
                    slotLabelFormat: 'H:mm',
                    slotLabelInterval: '00:'+{/literal}{$sTaillecellule}{literal},
                    slotDuration: '00:'+{/literal}{$sTaillecellule}{literal}+':00',
                    allDaySlot: false,    //ne pas afficher la ligne "Toute la journée"
                    //allDayText: 'Memo',
                    events:{
                      url: 'ajax/myfedd.php',
                      type: 'GET',
                      async: true,
                      dataType: 'json',
                      data: function() {
                        return {
                          dateposition: $('#datedebutaff_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').val(),
                          idlieu: $('#idpasselieu').val(),
                          praticien: {/literal}{$tabP2.id_user}{literal},
                          identifiant_entite:'{/literal}{$idc}{literal}',
                          rdv:$('#idpasserdv').val(),
                          validation:$('#idpassevalidation').val() 
                        };
                      }
                    },
                    eventClick: function(calEvent, jsEvent, view) {
                      var start = moment(calEvent.start).format('DD/MM/YYYY'); 
                      var starth = moment(calEvent.start).format('HH:mm');
                      var end = moment(calEvent.end).format('DD/MM/YYYY'); 
                      var endh = moment(calEvent.end).format('HH:mm');

                      if (calEvent.dispo=="") {
                        enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});
                      }else if(calEvent.dispo=="ok"){
                        enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});
                      }else if(calEvent.dispo=="not"){
                        return false;
                      }
                    },
                    dayClick: function(date, jsEvent, view) {
                      var leday = moment(date).format('DD/MM/YYYY'); 
                      var lhour = moment(date).format('HH:mm');

                      enreg_planning_seul({/literal}{$tabP2.id_user}{literal},document.getElementById("idpasselieu").value,document.getElementById("idpasserdv").value,leday,lhour,'',{/literal}{$ibmodule}{literal}, {/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});


                    },
                    eventRender: persoEventAfterRender,
                    eventMouseover: function(calEvent, jsEvent, element) {
                      var tooltip = '<div id="tooltipevent" class="tooltipevent coin_arrondi" style="margin:10px;width:auto;height:auto;background:#ccc;position:absolute;z-index:10001;">';
                      tooltip += calEvent.title;
                      if(calEvent.nomrdv!=""){
                        tooltip += '<br />Type : ' + calEvent.nomrdv;
                      }
                      if(calEvent.tempsrdv!=""){
                        tooltip += '<br />Durée : ' + calEvent.tempsrdv + ' min.';
                      }
                      if(calEvent.tel!=""){
                        tooltip += '<br />Tel mobile : ' + calEvent.tel;
                      }
                      if(calEvent.telfixe!=""){
                        tooltip += '<br />Tel fixe : ' + calEvent.telfixe;
                      }
                      if(calEvent.commentairerdv!=""){
                        tooltip += '<br />Commentaire : ' + calEvent.commentairerdv;
                      }
                      tooltip += '</div>';

                      if (calEvent.dispo=="") {

                        $("body").append(tooltip);
                        $(this).mouseover(function(e) {
                          $(this).css('z-index', 10000);
                          $(this).fadeIn();
                          //$('#tooltipevent').fadeTo('500', 1);
                        }).mousemove(function(e) {
                          $('#tooltipevent').css('top', e.pageY + 10);
                          $('#tooltipevent').css('left', e.pageX + 20);
                        });
                      }else if(calEvent.dispo=="ok"){
                        $("body").append(tooltip);
                        $(this).mouseover(function(e) {
                          $(this).css('z-index', 10000);
                          $('#tooltipevent').fadeIn('500');
                          $('#tooltipevent').fadeTo('500', 1.9);
                        }).mousemove(function(e) {
                          $('#tooltipevent').css('top', e.pageY + 10);
                          $('#tooltipevent').css('left', e.pageX + 20);
                        });
                      }else if(calEvent.dispo=="not"){
                        //element.find("fc-event").css( "cursor", "auto");
                        //$('fc-event').css( 'cursor', 'auto' );
                        return false;
                      }
                    },
                    eventMouseout: function(calEvent, jsEvent) {
                      $(this).css('z-index', 8);
                      //$('#tooltipevent').fadeOut('200', function() { $('#tooltipevent').remove(); });
                      $('#tooltipevent').remove();
                    },
                    loading:function(isLoading,view){

                      if (!isLoading){
                        $('#div_attente_chargement_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').hide();
                        if($('#moderecherche').val()=="ok" && $('#calendar_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').fullCalendar('clientEvents').length == 0){
                          //alert('Aucune information trouvé!');
                          //$('#myModalNoInfo').modal('show');
                          if(document.getElementById('tabactive').value == {/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}){
                            affiche_popup_message("Désolé...", "Aucune information trouvée!", "Ok");
                          }
                        }
                      }else{
                        $('#div_attente_chargement_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').show();
                      }
                    },

                    eventAfterAllRender: function (view) {
                      
                      if(view.name=="agendaWeek"){
                        $.ajax({
                          url: 'ajax/get_nb_rdv.php',
                          data: 'praticien='+{/literal}{$tabP2.id_user}{literal}+'&date_debut='+encodeURIComponent(moment(view.start).format('DD/MM/YYYY')),
                          dataType: 'json',
                          async: false,
                          success: function(json) {
                            $.each(json, function(index, value) {
                                
                              var sJourSemaine = value.joursemaine;
                              var sNbMatin = value.nbmatin;
                              var sNbSoir = value.nbsoir;
                              var sOccupation = value.nboccupation;
                              var thedate = "";
                              var tmpEntete = $("#calendar_"+{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}+' .fc-widget-header .fc-'+sJourSemaine).html();
                              var resEntete = tmpEntete.split("<!-- separator2 -->",1);
                              var resEntete2 = resEntete[0].split("<!-- separator -->",2);
                              //alert(resEntete);
                              //alert(resEntete2);
                              if(resEntete2.length > 1){
                                thedate = resEntete2[1];
                              }else{
                                thedate = resEntete[0];
                              }

                              var idgenerer = thedate.split(" ",2);
                              var idgenerer2 = idgenerer[1].split("/",2);
                              var idgenererfinal = idgenerer2[0]+idgenerer2[1];

                              //alert(idgenererfinal);
                              var sscript = "<script type='text\/javascript'>$(document).ready(function() {"+
                              "$('#link_consigne_day_"+idgenererfinal+"').bind('click', function() {"+
                              "if (! $('#div_link_consigne_day_"+idgenererfinal+"').hasClass('open')){"+
                              "$('#div_link_consigne_day_"+idgenererfinal+"').addClass('open');"+
                              "$('#div_link_consigne_day_"+idgenererfinal+"').slideDown('fast',  function(){});"+
                              "} else {"+
                              "$('#div_link_consigne_day_"+idgenererfinal+"').removeClass('open');"+
                              "$('#div_link_consigne_day_"+idgenererfinal+"').slideUp('fast',  function(){});"+
                              "}"+
                              "});"+
                              "});<\/script>";

                              var icone = '<span id="link_consigne_day_'+idgenererfinal+'" data-action="click-trigger" class="mega-icon" style="color:red;" title="Consigne du jour"><i title="Consigne du jour" class="fa fa-warning"></i></span>&nbsp;';

                              var divconsigne = '<div id="div_link_consigne_day_'+idgenererfinal+'" class="vd_mega-menu-content width-xs-3 width-sm-3 width-md-3 width-lg-3" data-action="click-target" style="display: none;">'+
                              '<div class="child-menu">'+
                              '<div class="title">Liste des consignes</div>'+
                              '<div class="content-list content-image">'+
                              '<div data-rel="scroll" class="mCustomScrollbar _mCS_2 _mCS_3" style="overflow: hidden;"><div class="mCustomScrollBox mCS-light" id="mCSB_3" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;"><div class="mCSB_container mCS_no_scrollbar" style="position:relative; top:0;">'+
                              '<div class="mCustomScrollBox mCS-light" id="mCSB_2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">'+
                              '<div class="mCSB_container" style="position: relative; top: 0px;">'+
                              "<ul id='lst_consignes_1' class='list-wrapper  pd-lr-10'><li style='cursor: pointer; cursor: hand;' onclick='affiche_popup_message(\"Consigne\",\""+value.consigne+"\",\"ok\")'><div class='menu-text' style='margin-left:0px;'><div class='menu-info'><span class='menu-date'>"+value.consigne+"</span></div></div></li></ul>"+
                              '</div>'+
                              '<div class="mCSB_scrollTools" style="position: absolute; opacity: 0; display: none;">'+
                              '<div class="mCSB_draggerContainer">'+
                              '<div class="mCSB_dragger" style="position: absolute; height: 209px; top: 0px;" oncontextmenu="return false;">'+
                              '<div class="mCSB_dragger_bar" style="position: relative; line-height: 209px;"></div>'+
                              '</div>'+
                              '<div class="mCSB_draggerRail"></div>'+
                              '</div>'+
                              '</div>'+
                              '</div>'+
                              '</div><div class="mCSB_scrollTools" style="position: absolute; display: none;"><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position:relative;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>'+
                              '</div>'+
                              '</div>'+
                              '</div><!-- separator -->';

                              if(value.consigne == ''){
                                sscript = "";
                                icone = "";
                                divconsigne = "";
                              }
                              $("#calendar_"+{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}+' .fc-widget-header .fc-'+sJourSemaine).html(sscript+icone+divconsigne+thedate+'<!-- separator2 --> <br><span style="font-size:12px;">M: <b><span style="color:green;">'+sNbMatin+' RDV</span></b> - A.M: <b><span style="color:red;">'+sNbSoir+' RDV</span></b> - '+sOccupation+'%</span>');


                            });
                          }
                        });
                      }

                      headerHeightagenda = $(".fc-head").height();

                    },
                    viewRender: function(view, element) {
                      //alert("viewRender");
                      var curTime2 = new Date();
                      $('#div_attente_chargement_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}').hide();

                      if (view.intervalStart < curTime2 && view.intervalEnd > curTime2) {
                        setTimeline("#calendar_"+{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}, view);
                        clearInterval(refreshIntervalId);
                        refreshIntervalId="";
                        refreshIntervalId = setInterval(function(){ 
                          setTimeline("#calendar_"+{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}, view);
                        }, 1000); 
                      }else{
                        clearInterval(refreshIntervalId);
                        refreshIntervalId="";
                      }


                    },
                    /*dayRightclick: function (sdate, jsEvent, view) {
                      alert(sdate);
                      // Prevent browser context menu:
                      //menuContextuelDayClick(sdate, jsEvent, view);
                      var menu2 = [
                        {'Prendre un RDV : ': {
                          onclick:function(menuItem,menu) {
                            alert(sdate);
                          },
                          title:'Prendre un RDV : '
                        }
                        }
                      ];

                      var fcContainer = $(jsEvent.target).closest(
                              '.fc-bg, .fc-slats, .fc-content-skeleton, .fc-bgevent-skeleton'
                      );

                      fcContainer.contextMenu(menu2,{
                        theme:'gloss',
                        showSpeed:200,
                        hideSpeed:200,
                        showTransition:'fadeIn',
                        hideTransition:'fadeOut'
                      });

                      return false;
                    },
                    eventRightclick: function (event, jsEvent, view) {
                      alert('an event has been rightclicked!');
                      // Prevent browser context menu:
                      return false;
                    }*/
                  });
                  /*
                   $(document).bind( 'scroll', function() {

                     var scroll= $(document).scrollTop();

                     if ( scroll >= 150 ) {

                       $('.fc-head').css({'position':'fixed'});
                       $('.fc-head').css({'z-index':'999999'});
                       $('.fc-body').css({'marign-top':$('.fc-head').height()+'px'});
                     }
                   });
                   */
                   getConsigne($("#identifiant_praticien_{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}").val(), {/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});


                });

                function menuContextuelDayClick(sdate, jsEvent, view){
                  var menu2 = [
                    {'Prendre un RDV : ': {
                      onclick:function(menuItem,menu) {
                        //alert(sdate);
                      },
                      title:'Prendre un RDV : '
                    }
                    }
                  ];

                  var fcContainer = $(jsEvent.target).closest(
                          '.fc-bg, .fc-slats, .fc-content-skeleton, .fc-bgevent-skeleton'
                  );

                  fcContainer.contextMenu(menu2,{
                    theme:'gloss',
                    showSpeed:200,
                    hideSpeed:200,
                    showTransition:'fadeIn',
                    hideTransition:'fadeOut'
                  });
                }

                function persoEventAfterRender(event, element, view) {

                  var picto = "";
                  if(event.statusrdv == "deplacer"){
                    picto = "<span style='color:#000;'><i class='fa fa-arrow-circle-right'></i></span>&nbsp;";
                  }else if(event.statusrdv == "web"){
                    picto = "<span style='color:#000;'><i class='fa fa-globe'></i></span>&nbsp;";
                  }else if(event.statusrdv == "interpro"){
                    picto = "<span style='color:#000;'><i class='fa fa-user-md'></i></span>&nbsp;";
                  }

                  if (event.dispo=="") {
                    element.find("div.fc-content").css( "border-top-color", event.couleurrdv);
                    element.find("div.fc-content").css( "border-top-width", "7px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").html(picto+"<span style='color:#000;'>"+event.heureaffiche+" - </span><span style='color:#000;'>"+event.title+"</span>");
                  }else if(event.dispo=="ok"){
                    element.find("div.fc-content").css( "border-top-color", event.couleurrdv);
                    element.find("div.fc-content").css( "border-top-width", "7px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").html(picto+"<span style='color:#000;'>"+event.heureaffiche+" - </span><span style='color:#000;'>"+event.title+"</span>");
                  }else if(event.dispo=="not"){
                    element.find("div.fc-content").css( "background", "#ccc");
                    element.find("div.fc-bg").css( "background-color", "#ccc");
                    element.find("div.fc-content").css( "border-top-width", "0px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").html(picto+"<span style='color:#aaa;'>"+event.heureaffiche+" - </span><span style='color:#aaa;'>"+event.title+"</span>");
                  } 
                  /*
                  $.contextMenu({
                    selector: 'a.fc-event',
                    trigger: 'right',
                    callback: function(key, options) {
                        var m = "clicked: " + key;
                        window.console && console.log(m) || alert(m); 
                    },
                    items: {
                        "edit": {"name": "Edit", "icon": "edit"},
                        "cut": {"name": "Cut", "icon": "cut"},
                        "sep1": "---------",
                        "quit": {"name": "Quit", "icon": "quit"},
                        "sep2": "---------",
                        "fold1": {
                            "name": "Sub group", 
                            "items": {
                                "fold1-key1": {"name": "Foo bar"},
                                "fold2": {
                                    "name": "Sub group 2", 
                                    "items": {
                                        "fold2-key1": {"name": "alpha"},
                                        "fold2-key2": {"name": "bravo"},
                                        "fold2-key3": {"name": "charlie"}
                                    }
                                },
                                "fold1-key3": {"name": "delta"}
                            }
                        },
                        "fold1a": {
                            "name": "Other group", 
                            "items": {
                                "fold1a-key1": {"name": "echo"},
                                "fold1a-key2": {"name": "foxtrot"},
                                "fold1a-key3": {"name": "golf"}
                            }
                        }
                    }
                  });
*/

                  if(typeof event.idrdv != 'undefined'){

                    var menu1 = [
                      {/literal}{if $ibmodule=="0"}{literal}
                      {'Copier ce rdv': {
                        onclick:function(menuItem,menu) {
                          //alert(JSON.stringify(event));
                          copier_rdv(event.idrdv+'|'+event.nompatient+'|'+event.dateaff+'|'+event.heureaffiche+'|'+event.nomdocteur, 'copierdv');
                        },
                        title:'Copier ce rdv'
                      }
                      },
                      {/literal}
                 {/if}
                 {literal}
                      {'Rendez vous planifié': {
                          onclick:function(menuItem,menu) { 
                            changement_status_rdv(event.idrdv, 'rdvplanifie'); 
                          }, 
                          title:'Rendez vous planifié' 
                        }
                      },
                      {'Patient en salle d\'attente': {
                          onclick:function(menuItem,menu) { 
                            changement_status_rdv(event.idrdv, 'patientensalle'); 
                          }, 
                          title:'Patient en salle d\'attente' 
                        }
                      },
                      {'Patient en cours d\'examen': {
                          onclick:function(menuItem,menu) { 
                            changement_status_rdv(event.idrdv, 'patientencours'); 
                          }, 
                          title:'Patient en cours d\'examen' 
                        }
                      },
                      {'Patient traité': {
                          onclick:function(menuItem,menu) { 
                            //changement_status_rdv(event.idrdv, 'patienttraite');
                            document.getElementById("myModalLabelinfordv").innerHTML="Paiement du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_patient_traite.php?idrdv="+event.idrdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                            $('#myModalinfordv').modal('show');
                          }, 
                          icon:'css/patient_traite_icon.png',
                          title:'Patient traité' 
                        }
                      },
                      {'Paiement': {
                          onclick:function(menuItem,menu) {
                            document.getElementById("myModalLabelinfordv").innerHTML="Paiement du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_paiement.php?idrdv="+event.idrdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                            $('#myModalinfordv').modal('show');
                          },
                          title:'Paiement'
                        }
                      },
                      $.contextMenu.separator,
                      {'Déplacer le RDV': {
                          onclick:function(menuItem,menu) { 
                            document.getElementById("myModalLabelinfordv").innerHTML="Déplacer le rendez-vous du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_deplacer_rdv.php?id_patient=&idrdv="+event.idrdv+"&jsEvent="+event.idrdv+"&idcalendar="+{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                            $('#myModalinfordv').modal('show');
                          },
                          icon:'css/deplacement_icon.png',
                          title:'Déplacer le rendez-vous'
                        }
                      },
                      {'Supprimer le RDV': {
                          onclick:function(menuItem,menu) {
                            bconfirm=confirm('Voulez vous supprimer ce rendez vous ?');
                            if(bconfirm){
                              //supprimer_rdv(event.idrdv, {/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});
                              del_fiche_rendez_vous(event.idrdv);
                            }
                          }, 
                          icon:'css/delete_icon.gif',
                          title:'Supprimer le rendez-vous' 
                        }
                      },
                      $.contextMenu.separator,
                      {'Absence excusée': {
                          onclick:function(menuItem,menu) {
                            changement_status_rdv(event.idrdv, 'absenceexcusee');
                          },
                          title:'Absence excusée'
                        }
                      },
                      {'Absence NON excusée': {
                          onclick:function(menuItem,menu) {
                            changement_status_rdv(event.idrdv, 'absencenonexcusee');
                          },
                          title:'Absence NON excusée'
                        }
                      }
                    ];

                    element.contextMenu(menu1,{
                      theme:'gloss',
                      showSpeed:200,
                      hideSpeed:200,
                      showTransition:'fadeIn',
                      hideTransition:'fadeOut'
                    });


                  }
                  //getConsigne();
                }

                </script>
                {/literal}

                <input type="hidden" id="idpassepraticien" name="idpassepraticien" value="{$tabP2.id_user}">
                <input type="hidden" id="id_praticien_{$smarty.foreach.sTabPraticien2.iteration}" name="id_praticien_{$smarty.foreach.sTabPraticien2.iteration}" value="{$tabP2.id_user}">
                <input type="hidden" id="identifiant_praticien_{$smarty.foreach.sTabPraticien2.iteration}" name="identifiant_praticien_{$smarty.foreach.sTabPraticien2.iteration}" value="{$tabP2.identifiant_user}">
                <input type="hidden" id="first_{$smarty.foreach.sTabPraticien2.iteration}" name="first_{$smarty.foreach.sTabPraticien2.iteration}" value="1">
                <div>
                <div id="div_attente_chargement_{$smarty.foreach.sTabPraticien2.iteration}" align='center' style="display:none;position: absolute;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10002;opacity:0.7;filter: alpha(opacity=70);color:#fff;">
                  <br><br><br><br>
                  <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                </div>
                <div id="calendar_{$smarty.foreach.sTabPraticien2.iteration}" class="mgtp-10"> </div>
                </div>
              </div>
            {/foreach}

            <!-- Calendar ALL -->
              <div class="tab-pane" id="taball">
                <input type="hidden" id="datedebutaff_all" name="datedebutaff_all" value="{$datedebutaff}">
                
                {literal}
                <!-- Calendar -->
                <script type="text/javascript">
                 $(document).ready(function() {
                  

                  $('#calendar_all').fullCalendar({
                    header: {
                      left: 'prev,next today',
                      center: 'title',
                      right: 'agendaDay'
                    },
                    
                    contentHeight: 'auto',
                    height: 'auto',
                    lang: 'fr',         //langue francais
                    editable: false,       //calendrier modifiable
                    weekNumbers: true,      //on affiche le num de semaine
                    hiddenDays: [ 0 ],      //on n'affiche pas le dimanche
                    scrollTime: "08:00:00",   //le scroll débute à 7h
                    minTime: "08:00:00",    //le calendar demarre à 7h
                    maxTime: "22:00:00",    //le calendar fini à 20h
                    slotEventOverlap: false,  //les event ne se chevoche pas
                    defaultView: 'agendaDay',  //afficher la semaine par defaut
                    defaultDate: moment($('#datedebutaff_all').val()).format('YYYY-MM-DD'),
                    slotLabelFormat: 'H:mm',
                    slotLabelInterval: '00:'+{/literal}{$sTaillecellule}{literal},
                    slotDuration: '00:'+{/literal}{$sTaillecellule}{literal}+':00',
                    allDaySlot: false,    //ne pas afficher la ligne "Toute la journée"
                    //allDayText: 'Memo',
                    resources: [
                      {/literal}{foreach from=$tabPraticien item=tabP name=sTabPraticien}{literal}
                        { id: '{/literal}{$tabP.id_user}{literal}', title: '{/literal}{$tabP.abreviation_civilite} {$tabP.nom_user}{literal}' }
                        {/literal}{if $smarty.foreach.sTabPraticien.iteration < $tabPraticien|@count }{literal}
                          ,
                        {/literal}{/if}{literal}
                      {/literal}{/foreach}{literal}
                    ],
                    events:{
                      url: 'ajax/myfedd_journee.php',
                      type: 'GET',
                      async: true,
                      dataType: 'json',
                      data: function() {
                        return {
                          dateposition: $('#datedebutaff_all').val(),
                          idlieu: $('#idpasselieu').val(),
                          praticien: "all",
                          rdv:$('#idpasserdv').val(),
                          validation:$('#idpassevalidation').val()
                        };
                      }
                    },
                    eventClick: function(calEvent, jsEvent, view) {
                      var start = moment(calEvent.start).format('DD/MM/YYYY'); 
                      var starth = moment(calEvent.start).format('HH:mm');
                      var end = moment(calEvent.end).format('DD/MM/YYYY'); 
                      var endh = moment(calEvent.end).format('HH:mm');

                      if (calEvent.dispo=="") {
                        enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,"all");
                      }else if(calEvent.dispo=="ok"){
                        enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,"all");
                      }else if(calEvent.dispo=="not"){
                        return false;
                      }
                    },
                    dayClick: function(date, jsEvent, view) {
                      var leday = moment(date).format('DD/MM/YYYY'); 
                      var lhour = moment(date).format('HH:mm');

                      enreg_planning_seul({/literal}{$tabP2.id_user}{literal},document.getElementById("idpasselieu").value,document.getElementById("idpasserdv").value,leday,lhour,'',"all");
                    },
                    eventRender: persoEventAfterRenderAll,
                    eventMouseover: function(calEvent, jsEvent, element) {
                      var tooltip = '<div id="tooltipevent" class="tooltipevent coin_arrondi" style="margin:10px;width:auto;height:auto;background:#ccc;position:absolute;z-index:10001;">';
                      tooltip += calEvent.title;
                      if(calEvent.nomrdv!=""){
                        tooltip += '<br />Type : ' + calEvent.nomrdv;
                      }
                      if(calEvent.tempsrdv!=""){
                        tooltip += '<br />Durée : ' + calEvent.tempsrdv + ' min.';
                      }
                      if(calEvent.tel!=""){
                        tooltip += '<br />Tel mobile : ' + calEvent.tel;
                      }
                      if(calEvent.telfixe!=""){
                        tooltip += '<br />Tel fixe : ' + calEvent.telfixe;
                      }
                      if(calEvent.commentairerdv!=""){
                        tooltip += '<br />Commentaire : ' + calEvent.commentairerdv;
                      }
                      tooltip += '</div>';

                      if (calEvent.dispo=="") {

                        $("body").append(tooltip);
                        $(this).mouseover(function(e) {
                          $(this).css('z-index', 10000);
                          $(this).fadeIn();
                          //$('#tooltipevent').fadeTo('500', 1);
                        }).mousemove(function(e) {
                          $('#tooltipevent').css('top', e.pageY + 10);
                          $('#tooltipevent').css('left', e.pageX + 20);
                        });
                      }else if(calEvent.dispo=="ok"){
                        $("body").append(tooltip);
                        $(this).mouseover(function(e) {
                          $(this).css('z-index', 10000);
                          $('#tooltipevent').fadeIn('500');
                          $('#tooltipevent').fadeTo('500', 1.9);
                        }).mousemove(function(e) {
                          $('#tooltipevent').css('top', e.pageY + 10);
                          $('#tooltipevent').css('left', e.pageX + 20);
                        });
                      }else if(calEvent.dispo=="not"){
                        //element.find("fc-event").css( "cursor", "auto");
                        //$('fc-event').css( 'cursor', 'auto' );
                        return false;
                      }
                    },
                    eventMouseout: function(calEvent, jsEvent) {
                      $(this).css('z-index', 8);
                      //$('#tooltipevent').fadeOut('200', function() { $('#tooltipevent').remove(); });
                      $('#tooltipevent').remove();
                    },
                    loading:function(isLoading,view){
                      if (!isLoading){
                        $('#div_attente_chargement_all').hide();
                        if($('#moderecherche').val()=="ok" && $('#calendar_all').fullCalendar('clientEvents').length == 0){
                          //alert('Aucune information trouvé!');
                          //$('#myModalNoInfo').modal('show');
                          if(document.getElementById('tabactive').value == {/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}){
                            affiche_popup_message("Désolé...", "Aucune information trouvée!", "Ok");
                          }
                        }
                      }else{
                        $('#div_attente_chargement_all').show();
                      }
                    },

                    eventAfterAllRender: function (view) {
                      
                      if(view.name=="agendaWeek"){
                        $.ajax({
                          url: 'ajax/get_nb_rdv.php',
                          data: 'praticien='+{/literal}{$tabP2.id_user}{literal}+'&date_debut='+encodeURIComponent(moment(view.start).format('DD/MM/YYYY')),
                          dataType: 'json',
                          async: false,
                          success: function(json) {
                            $.each(json, function(index, value) {
                                
                              var sJourSemaine = value.joursemaine;
                              var sNbMatin = value.nbmatin;
                              var sNbSoir = value.nbsoir;
                              var sOccupation = value.nboccupation;
                              var thedate = "";

                              var tmpEntete = $("#calendar_"+{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal}+' .fc-widget-header .fc-'+sJourSemaine).html();
                              var resEntete = tmpEntete.split("<br>",1);
                              var resEntete2 = resEntete[0].split("</a>",1);
                              if(resEntete2.length > 1){
                                thedate = resEntete2[1];
                              }else{
                                thedate = resEntete[0];
                              }

                              var icone = '<a href="index.php" class="mega-link" data-action="click-trigger" alt="" title=""> <span class="mega-icon"><i class="fa fa-warning"></i></span></a>';

                                $('#calendar_all .fc-widget-header .fc-'+sJourSemaine).html(icone+thedate+'<br><span style="font-size:12px;">M: <b><span style="color:green;">'+sNbMatin+' RDV</span></b> - A.M: <b><span style="color:red;">'+sNbSoir+' RDV</span></b> - '+sOccupation+'%</span>');
                            });
                          }
                        });
                      }
                      
                    },
                    viewRender: function(view, element) {
                      var curTime2 = new Date();
                      $('#div_attente_chargement_all').hide();

                      if (view.intervalStart < curTime2 && view.intervalEnd > curTime2) {
                        setTimeline("#calendar_all", view);
                        clearInterval(refreshIntervalId);
                        refreshIntervalId="";
                        refreshIntervalId = setInterval(function(){ 
                          setTimeline("#calendar_all", view);
                        }, 1000); 
                      }else{
                        clearInterval(refreshIntervalId);
                        refreshIntervalId="";
                      }     
                    }
                  });

                });
                function persoEventAfterRenderAll(event, element, view) {
                  if (event.dispo=="") {
                    element.find("div.fc-content").css( "border-top-color", event.couleurrdv);
                    element.find("div.fc-content").css( "border-top-width", "7px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").html("<span style='color:#000;'>"+event.heureaffiche+" - </span><span style='color:#000;'>"+event.title+"</span>");
                  }else if(event.dispo=="ok"){
                    element.find("div.fc-content").css( "border-top-color", event.couleurrdv);
                    element.find("div.fc-content").css( "border-top-width", "7px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").html("<span style='color:#000;'>"+event.heureaffiche+" - </span><span style='color:#000;'>"+event.title+"</span>");
                  }else if(event.dispo=="not"){
                    element.find("div.fc-content").css( "background", "#ccc");
                    element.find("div.fc-bg").css( "background-color", "#ccc");
                    element.find("div.fc-content").css( "border-top-width", "0px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").html("<span style='color:#aaa;'>"+event.heureaffiche+" - </span><span style='color:#aaa;'>"+event.title+"</span>");
                  } 

                  /*
                  if(typeof event.idrdv != 'undefined'){

                    var menu1 = [
                      {'Rendez vous planifié': {
                          onclick:function(menuItem,menu) { 
                            changement_status_rdv(event.idrdv, 'rdvplanifie'); 
                          }, 
                          title:'Rendez vous planifié' 
                        }
                      },
                      {'Patient en salle d\'attente': {
                          onclick:function(menuItem,menu) { 
                            changement_status_rdv(event.idrdv, 'patientensalle'); 
                          }, 
                          title:'Patient en salle d\'attente' 
                        }
                      },
                      {'Patient en cours d\'examen': {
                          onclick:function(menuItem,menu) { 
                            changement_status_rdv(event.idrdv, 'patientencours'); 
                          }, 
                          title:'Patient en cours d\'examen' 
                        }
                      },
                      {'Patient traité': {
                          onclick:function(menuItem,menu) { 
                            //changement_status_rdv(event.idrdv, 'patienttraite');
                            document.getElementById("myModalLabelinfordv").innerHTML="Paiement du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_patient_traite.php?idrdv="+event.idrdv;
                            $('#myModalinfordv').modal('show');
                          }, 
                          icon:'css/patient_traite_icon.png',
                          title:'Patient traité' 
                        }
                      },
                      {'Paiement': {
                        onclick:function(menuItem,menu) {
                          document.getElementById("myModalLabelinfordv").innerHTML="Paiement du patient : "+event.title;
                          document.getElementById("iframerdv").src="modal_paiement.php?idrdv="+event.idrdv;
                          $('#myModalinfordv').modal('show');
                        },
                        title:'Paiement'
                      }
                      },
                      $.contextMenu.separator,
                      {'Déplacer le RDV': {
                          onclick:function(menuItem,menu) { 
                            document.getElementById("myModalLabelinfordv").innerHTML="Déplacer le rendez-vous du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_deplacer_rdv.php?id_patient=&idrdv="+event.idrdv+"&jsEvent="+event.idrdv+"&idcalendar=all";
                            $('#myModalinfordv').modal('show');
                          },
                          icon:'css/deplacement_icon.png',
                          title:'Déplacer le rendez-vous'
                        }
                      },
                      {'Supprimer le RDV': {
                          onclick:function(menuItem,menu) {
                            bconfirm=confirm('Voulez vous supprimer ce rendez vous ?');
                            if(bconfirm){
                              supprimer_rdv(event.idrdv, "all");
                            }
                          }, 
                          icon:'css/delete_icon.gif',
                          title:'Supprimer le rendez-vous' 
                        }
                      }
                    ];

                    element.contextMenu(menu1,{
                      theme:'gloss',
                      showSpeed:200,
                      hideSpeed:200,
                      showTransition:'fadeIn',
                      hideTransition:'fadeOut'
                    });
                  }
                  */
                }
                </script>
                {/literal}

                <input type="hidden" id="idpassepraticien" name="idpassepraticien" value="{$tabP2.id_user}">
                <input type="hidden" id="id_praticien_all" name="id_praticien_all" value="{$tabP2.id_user}">
                <input type="hidden" id="first_all" name="first_all" value="1">
                <div>
                <div id="div_attente_chargement_all" align='center' style="display:none;position: absolute;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10002;opacity:0.7;filter: alpha(opacity=70);color:#fff;">
                  <br><br><br><br>
                  <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                </div>
                <div id="calendar_all" class="mgtp-10"> </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
    <!-- col-sm-12-->
  </div>
  <!-- row --> 
  
</div>
<!-- .vd_content-section --> 


<div class="modal fade" id="myModalNoInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="myModalLabelNoInfo">Désolé...</h4>
      </div>
      <div class="modal-body" style="padding: 15px 0px 0px 0px;"> 
        <div class="panel-body" style="padding: 0px 0px 15px 0px;"> 
          <div class="col-sm-12">
            <div class="form-group">
              <div class="col-sm-2"></div>
              <div class="col-sm-8" align="center">
                <h3 id="txtmyModalNoInfo">Aucune information trouvée!</h3>
              </div>
              <div class="col-sm-2"></div>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="form-group">
              <div class="col-sm-2"></div>
              <div class="col-sm-8" align="center">
                <button id="boutonmyModalNoInfo" type="button" class="btn vd_btn vd_bg-blue vd_white" onclick="$('#myModalNoInfo').modal('hide');">Ok</button>
              </div>
              <div class="col-sm-2"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="myModalfiltremedecin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="myModalLabelfiltre">Sélectionner vos critères d'affichage</h4>
      </div>
      <div class="modal-body" style="padding: 15px 0px 0px 0px;"> 
        <div id="divattentefiltrepraticien" style="display:none;"><div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div></div> 
        <div id="divfiltrepraticien" class="panel-body" style="padding: 0px 0px 15px 0px;"> 
          <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           
            <input type="hidden" value="planning" name='validation' />
            <input type="hidden" value="3" id='all' />
            
            <div class="col-sm-12">
              <div class="form-group">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Date de début</b>
                      </label>
                    </div>
                    <div class="input-group">
                      <input type="text" placeholder="Sélectionnez une date de début" value="" name="datepicker-widget" id="datepicker-widget" >
                      <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#datepicker-widget">
                        <i class="fa fa-calendar"></i>
                      </span>
                    </div>
                    {literal}
                    <script type="text/javascript">
                      $("#datepicker-widget").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        onSelect: function(date){
                          document.getElementById('iddateplanning').value=date;
                        }
                      });
                      $( '[data-datepicker]' ).click(function(e){ 
                        var data=$(this).data('datepicker');
                        $(data).focus();
                      });

                    </script>
                    {/literal}
                    <input type="hidden" id="iddateplanning" name="datedebutrech">
                  </div>
                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Motif de rendez vous</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select  name="rdv" id="selecttyperdv">
                        <option value="">Indifférent</option>
                        {foreach from=$aTableaurdv item=objRDV}
                          <option value="{$objRDV.id_type_rdv}">{$objRDV.libelle_type_rdv}</option>
                        {/foreach}
                      </select>
                    </div>
                  </div>
                  <div class="col-md-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Le lieu</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="idlieu" id="selectlieux">
                        <option value="">Indifférent</option>
                        {foreach from=$aTableauLieux item=objLieu}
                          <option value="{$objLieu.id_lieux}">{$objLieu.nom_lieux}</option>
                        {/foreach}
                      </select>
                    </div>
                  </div>

                </div>
                <div class="col-sm-2"></div>
              </div>
            </div>
            <div class="col-sm-12" align="center">
              <button type="button" id="btn_modal_filtre_praticien" name="btn_modal_filtre_praticien" class="btn vd_btn vd_bg-blue vd_white">Afficher</button>&nbsp;&nbsp;
              <a href="#" onclick="$('#myModalfiltremedecin').modal('hide');">Annuler</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="myModalfiltrrdv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="myModalLabelfiltre">Critères du prochain RDV disponible</h4>
      </div>
      <div class="modal-body" style="padding: 15px 0px 0px 0px;">
        <div id="divattentefiltrerdv" style="display:none;"><div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div></div> 
        <div id="divfiltrerdv" class="panel-body" style="padding: 0px 0px 15px 0px;"> 
          <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           
            <input type="hidden" value="ok" name='validation' />
            <input type="hidden" name="dir" value="{$dir}">
            <input type="hidden" value="{$idc}" id='idc' />
            <input type="hidden" value="1" id='all' />
            
            <div class="col-sm-12">
              <div class="form-group">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Date de début</b>
                      </label>
                    </div>
                    <div class="input-group">
                      <input type="text" placeholder="Sélectionnez une date de début" value="" name="datepickerrdv-widget" id="datepickerrdv-widget" >
                      <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#datepickerrdv-widget">
                        <i class="fa fa-calendar"></i>
                      </span>
                    </div>
                    {literal}
                    <script type="text/javascript">
                      $("#datepickerrdv-widget").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        onSelect: function(date){
                          document.getElementById('iddateplanningrdv').value=date;
                        }
                      });
                      $( '[data-datepicker]' ).click(function(e){ 
                        var data=$(this).data('datepicker');
                        $(data).focus();
                      });
                    </script>
                    {/literal}
                    <input type="hidden" id="iddateplanningrdv" name="datedebutrech">
                  </div>
                  <div class="col-sm-12">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Quelle est le professionnel de santé ?</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="rdv" id="selectcatprofession"></select>
                    </div>
                  </div>

                  <div class="col-sm-12">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Quelle est la spécialité ?</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="rdv" id="selectprofession"></select>
                    </div>
                  </div>

                  <div class="col-sm-12">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Quel est le motif de la consultation ?</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="rdv" id="selecttyperdv2"></select>
                    </div>
                  </div>

                  <div class="col-sm-12">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Quel est le lieu du rendez-vous ?</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="idlieu" id="selectlieux2"></select>
                    </div>
                  </div>
                </div>
                <div class="col-sm-2"></div>
              </div>
            </div>
            <div class="col-sm-12" align="center">
              <button type="button"  class="btn vd_btn vd_bg-blue vd_white" name="btn_modal_search_filtre_rdv" id="btn_modal_search_filtre_rdv" >Rechercher</button>&nbsp;&nbsp;
              <a href="#" onclick="$('#myModalfiltrrdv').modal('hide');">Annuler</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>




<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <input type="hidden" name="dir" value="rechdispo">
          <input type="hidden" name="iddocteur" value="" id="iddocteur">
          <input type="hidden" name="idlieu" value="{$idlieu}" >
          <input type="hidden" name="rdv" value="{$rdv}">
          <input type="hidden" name="praticien" value="{$praticien}">
          <input type="hidden" name="validation" value="creatiordv">

           <div class="form-group">
            <label class="col-sm-4 control-label">La date</label>
            <div class="col-sm-4 controls">
              <input class="input-border-btm" type="text" name="ladate" id="idladate" readonly>
            </div>



          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">Heure</label>
            <div class="col-sm-4 controls">
              <input class="input-border-btm" type="text" name="heure" id="idheure" readonly>
            </div>

          </div>

            <div class="form-group">
                <label class="col-sm-4 control-label">Genre</label>
            <div class="col-sm-4 controls">
              <input class="input-border-btm" type="radio" name="genre" value="Mme" id="idgenremme" >Mme &nbsp;
              <input class="input-border-btm" type="radio" name="genre" value="M." id="idgenrem" >M.
            </div>
          </div>

          <div class="form-group">

            <label class="col-sm-4 control-label">Nom</label>
            <div class="col-sm-7 controls">
              <input class="input-border-btm" type="text" name="nom" required>
            </div>

          </div>
          <div class="form-group">
            <label class="col-sm-4 control-label">Prénom</label>
            <div class="col-sm-7 controls">
              <input class="input-border-btm" type="text" name="prenom">
            </div>

          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">Téléphone portable</label>
            <div class="col-sm-7 controls">
              <input class="input-border-btm" type="tel" name="tel">
            </div>

          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">Téléphone fixe</label>
            <div class="col-sm-7 controls">
              <input class="input-border-btm" type="tel" name="telfixe">
            </div>

          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">Date naissance</label>
            <div class="col-sm-7 controls">
              <input class="input-border-btm" type="date" name="datenaissance">
            </div>

          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">email</label>
            <div class="col-sm-7 controls">
              <input class="input-border-btm" type="text" name="email">
            </div>

          </div>

           <div class="form-group">
            <label class="col-sm-4 control-label">Note</label>
            <div class="col-sm-7 controls">
              <textarea name="note" cols="5" rows="4"></textarea>
            </div>

          </div>




      </div>
      <div class="modal-footer background-login">
        <button type="button" class="btn vd_btn vd_bg-grey" data-dismiss="modal">Close</button>
        <button type="submit" class="btn vd_btn vd_bg-green">Valider</button>
      </div>
    </form>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>






{literal}
<script type="text/javascript">

  function getConsigne(idp_consigne, nb_tab) {

    $('#nb_consigne_'+nb_tab).html("");

    $.ajax({
      cache: false,
      url: 'ajax/liste_consignes.php',
      data: 'idp=' + idp_consigne,
      dataType: 'json',
      async: true, // Mode synchrone
      success: function (json) {
        var text = "";
        $.each(json, function(index, value) {

          var sclass_niveau = "";

          if(value.niveau == 0){
            sclass_niveau = "niveau_bas";
          }else if(value.niveau == 1){
            sclass_niveau = "niveau_normal";
          }else if(value.niveau == 2){
            sclass_niveau = "niveau_haut";
          }else if(value.niveau == 3){
            sclass_niveau = "niveau_urgent";
          }

          if(value.nb_consigne != 0){
            $('#nb_consigne_'+nb_tab).html(value.nb_consigne);
          }

          text +="<li class='"+sclass_niveau+"' style='cursor: pointer; cursor: hand;' onclick='affiche_popup_message(\""+value.titre+"\", \""+value.message+"\", \"Ok\")'>";
          text +="<div class='menu-text' style='margin-left:0px;'>"+value.titre;
          text +="<div class='menu-info'>";
          text +="<span class='menu-date'>"+value.message+"</span>";
          text +="</div>";
          text +="</div>";
          text +="</li>";
        });

        if(text == ""){
          text = "<li>Aucune consigne</li>";
        }
        $('#lst_consignes_'+nb_tab).html(text);
      }
    });

  }

  function getSalleAttente() {

    document.getElementById("top-menu-salle-attente").style.display = "block";

    var nb_tab_active = $('#tabactive').val();
    if(nb_tab_active==""){
      nb_tab_active = 1;
    }
    var idp_sse = $('#id_praticien_'+nb_tab_active).val();

    $.ajax({
      cache: false,
      url: 'ajax/get_salle_attente.php',
      data: 'idp='+ idp_sse+'&tri='+$('#trie_salle_attente').val(),
      dataType: 'json',
      async: false, // Mode synchrone
      success: function(json) {
        $.each(json, function(index, value) {
          var text = "";

          if(value.nb_salle_attente != 0) {
            $('#nb_salle_attente').html(value.nb_salle_attente);
          }else{
            $('#nb_salle_attente').html("");
          }

          //liste En cours
          if(value.tab3.length!=0){
            text +="<li class='group-heading vd_bg-black-20'>En cours d'examen</li>";
          }

          for (i = 0; i < value.tab3.length; i++) {
            var sstyle = "";
            if(value.tab3.length >1){
              sstyle = "style='border-bottom: 1px solid #fff;'";
            }
            text +="<li "+sstyle+" id='item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab3[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: #DDDDDD;'>"+value.tab3[i]['civilite']+" "+value.tab3[i]['nom']+" "+value.tab3[i]['prenom']+" ( "+value.tab3[i]['temps_en_cours']+" )";
            text +="<div class='menu-info'><span class='menu-date'>En cours depuis "+value.tab3[i]['heure_en_cours']+" </span> | <span class='menu-date'>Prévu à "+value.tab3[i]['heure_prevu']+" </span></div>";
            text +="</div></a></li>";
            text +="<script type='text/javascript'>";
            text +="var menu_salle_attente_en_cours = ["+
                    "{'Patient traité': {"+
                  "onclick:function(menuItem,menu) {"+
                    "document.getElementById('myModalLabelinfordv').innerHTML='Paiement du patient : "+value.tab3[i]['civilite']+" "+value.tab3[i]['nom']+" "+value.tab3[i]['prenom']+"';"+
                    "document.getElementById('iframerdv').src='modal_patient_traite.php?idrdv="+value.tab3[i]['id_prise_rendez_vous']+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000)+"';"+
                    "$('#myModalinfordv').modal('show');"+
                  "},"+
                  "icon:'css/patient_traite_icon.png',"+
                  "title:'Patient traité'"+
                "}"+
              "},"+
                    "{'Rendez-vous planifié': {"+
                  "onclick:function(menuItem,menu) {"+
                    "changement_status_rdv("+value.tab3[i]['id_prise_rendez_vous']+", 'rdvplanifie'); "+
                  "},"+
                  "title:'Rendez-vous planifié' "+
                "}"+
              "},"+
                    "{\"Patient en salle d\'attente\": {"+
                  "onclick:function(menuItem,menu) { "+
                    "changement_status_rdv("+value.tab3[i]['id_prise_rendez_vous']+", 'patientensalle'); "+
                  "}, "+
                  "title:\"Patient en salle d\'attente\" "+
            "}"+
            "}"+
            "];";
            text +="$('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_en_cours,{theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut'});";
            text +="<\/script>";
          }

          //liste salle d'attente
          if(value.tab.length!=0){
            text +="<li class='group-heading vd_bg-black-20'>En salle d'attente</li>";
          }

          for (i = 0; i < value.tab.length; i++) {
            var sstyle1 = "";

            if(value.tab.length >1){
              sstyle1 = "style='border-bottom: 1px solid #fff;'";
            }

            text +="<li "+sstyle1+" id='item_sa_"+value.tab[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: #27A1C2;'>"+value.tab[i]['civilite']+" "+value.tab[i]['nom']+" "+value.tab[i]['prenom']+" ( "+value.tab[i]['temps_attente']+" )";
            text +="<div class='menu-info'><span class='menu-date'>Arrivé à "+value.tab[i]['heure_arrive']+" </span> | <span class='menu-date'>Prévu à "+value.tab[i]['heure_prevu']+" </span></div>";
            text +="</div></a></li>";
            text +="<script type='text/javascript'>";
            text +="var menu_salle_attente = ["+
              "{'Rendez-vous planifié': {"+
                  "onclick:function(menuItem,menu) {"+
                    "changement_status_rdv("+value.tab[i]['id_prise_rendez_vous']+", 'rdvplanifie'); "+
                  "},"+
                  "title:'Rendez-vous planifié' "+
                "}"+
              "},"+
              "{\"Patient en cours d\'examen\": {"+
                  "onclick:function(menuItem,menu) { "+
                    "changement_status_rdv("+value.tab[i]['id_prise_rendez_vous']+", 'patientencours'); "+
                  "}, "+
                  "title:\"Patient en cours d\'examen\" "+
                "}"+
              "}"+
            "];";
            text +="$('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente,{theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut'});";
            text +="<\/script>";
          }

          //liste en retard
          if(value.tab2.length!=0){
            text +="<li class='group-heading vd_bg-black-20'>En retard</li>";
          }

          for (i = 0; i < value.tab2.length; i++) {
            var sstyle2 = "";
            if(value.tab2.length >1){
              sstyle2 = "style='border-bottom: 1px solid #fff;'";
            }

            text +="<li "+sstyle2+" id='item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab2[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: red;'>"+value.tab2[i]['civilite']+" "+value.tab2[i]['nom']+" "+value.tab2[i]['prenom'];
            text +="<div class='menu-info'><span class='menu-date'>Prévu à "+value.tab2[i]['heure_prevu']+" ( <span class='menu-date' style='color:red;''>"+value.tab2[i]['temps_retard']+"</span> de retard )</span></div>";
            text +="</div></a></li>";
            text +="<script type='text/javascript'>";
            text +="var menu_salle_attente_retard = ["+
              "{\"Patient en salle d\'attente\": {"+
                  "onclick:function(menuItem,menu) {"+
                    "changement_status_rdv("+value.tab2[i]['id_prise_rendez_vous']+", 'patientensalle'); "+
                  "},"+
                  "title:\"Patient en salle d\'attente\" "+
            "}"+
            "},"+
            "$.contextMenu.separator,"+
            "{\"Absence excusée\": {"+
                  "onclick:function(menuItem,menu) {"+
                    "changement_status_rdv("+value.tab2[i]['id_prise_rendez_vous']+", 'absenceexcusee'); "+
                  "},"+
                  "title:\"Absence excusée\" "+
            "}"+
            "},"+
            "{\"Absence NON excusée\": {"+
                  "onclick:function(menuItem,menu) {"+
                    "changement_status_rdv("+value.tab2[i]['id_prise_rendez_vous']+", 'absencenonexcusee'); "+
                  "},"+
                  "title:\"Absence NON excusée\" "+
            "}"+
            "}"+
            "];";
            text +="$('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_retard,{theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut'});";
            text +="<\/script>";
          }

          $('#tab_salle_attente').html(text);

        });
      }
    });

  }

function launch_getSalleAttente(){
  setInterval(function(){
    getSalleAttente();
  }, 60000);
}

function setTimeline(mycalendar, view) {
  var curTime = new Date();

  if(curTime.getHours() == 0 && curTime.getMinutes() <= 5) // Because I am calling this function every 5 minutes
  {// the day has changed
            var todayElem = $(".fc-today");
            todayElem.removeClass("fc-today");
            todayElem.removeClass("fc-state-highlight");

            todayElem.next().addClass("fc-today");
            todayElem.next().addClass("fc-state-highlight");
            }

  var parentDiv = $('.fc-slats:visible').parent();
  var timeline = parentDiv.children(".timeline");
  if (timeline.length == 0) { //if timeline isn't there, add it
    timeline = $("<hr>").addClass("timeline");
    parentDiv.prepend(timeline);
  }

  //var curCalView = $(mycalendar).fullCalendar('getView');
  var curCalView = view;

  if (curCalView.intervalStart < curTime && curCalView.intervalEnd > curTime) {
    timeline.show();
  } else {
    timeline.hide();
    return;
  }

  var calMinTimeInMinutes = strTimeToMinutes(curCalView.opt("minTime"));
  var calMaxTimeInMinutes = strTimeToMinutes(curCalView.opt("maxTime"));
  var curSeconds = (( ((curTime.getHours() * 60) + curTime.getMinutes()) - calMinTimeInMinutes) * 60) + curTime.getSeconds();
  var percentOfDay = curSeconds / ((calMaxTimeInMinutes - calMinTimeInMinutes) * 60);
  //alert(curCalView.intervalStart);
  //alert(calMinTimeInMinutes);
  var topLoc = Math.floor(parentDiv.height() * percentOfDay);
  var timeCol = $('.fc-time:visible');
  var infoCol = $('.fc-widget-content:visible');
  timeline.css("top",topLoc + "px");
  timeline.css("left",(timeCol.outerWidth(true))+"px");
  //alert($('.fc-time-grid').outerWidth());
  //alert(infoCol.outerWidth());
  timeline.css("width",(infoCol.outerWidth()-(timeCol.outerWidth(true)))+"px");


  if (curCalView.name == "agendaWeek") { //week view, don't want the timeline to go the whole way across
    var dayCol = $(".fc-today:visible");

    if(dayCol.position() != null)
    {
      var left = dayCol.position().left + 1;
      var width = dayCol.width() + 1;
      timeline.css("left",left + "px");
      timeline.css("width",width + "px");
    }
  }
}

function strTimeToMinutes(str_time) {
  var arr_time = str_time.split(":");
  var hour = parseInt(arr_time[0]);
  var minutes = parseInt(arr_time[1]);
  return((hour * 60) + minutes);
}

function aff_divattente(divattente, divacacher){
  document.getElementById(divacacher).style.display = "none";
  document.getElementById(divattente).style.display = "block";
  return true;
}


function pad(n) {
  return (n < 10) ? '0' + n : n;
}

function fiche_rdv(idrdv){
  /*document.getElementById("iframerdv").src="modal_fiche_rdv_patient.php?idrdv="+idrdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
  $('#myModalinfordv').modal('show');*/
  get_fiche_rendez_vous(idrdv);
  $('#modalFicheRendezVous').modal('show');
  $('#info_rdv_modal_link').click();
}

function enreg_planning(nompatient,idrdv,daterdv,heurerdv,idrdv,daterdvfin,heurefin,nomdocteur,iddocteur,idlieu,idtyperdv,jsEvent,idcalendar){

  var jour = daterdv.substring(0,2);
  var mois = daterdv.substring(3,5)-1;
  var moisreel = mois+1;

  var annee = daterdv.substring(6,10);

  var heures = heurerdv.substring(0,2);
  var minutes = heurerdv.substring(3,5);

  document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nomdocteur;
  document.getElementById("idladate").value=daterdv;
  document.getElementById("idheure").value=heurerdv;


  if(idrdv==0){
    $.ajax({
        cache: false,
        url: 'ajax/lock_rdv.php',
        data: 'idpraticien='+iddocteur+'&date='+annee+moisreel+jour+'&heure='+heures+minutes,
        dataType: 'json',
        success: function(json) {
          $.each(json, function(index, value) {
            if (value.sucess=='nop'){
              affiche_popup_message('Information', value.message, 'Ok');
            }

            document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV avec le docteur "+nomdocteur+" le "+daterdv;
            document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+iddocteur+"&ladate="+daterdv+"&heuredebut="+heurerdv+"&heurefin="+heurefin+"&idlieu="+idlieu+'&idtyperdv='+idtyperdv+"&idcalendar="+idcalendar+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
            $('#myModalinfordv').modal('show');
          });
        }
    });

    //
  }else{
    /*
    document.getElementById("myModalLabelinfordv").innerHTML="Rendez vous patient "+nompatient+" du "+daterdv;
    document.getElementById("iframerdv").src="modal_fiche_rdv_patient.php?idrdv="+idrdv+"&jsEvent="+jsEvent+"&idcalendar="+idcalendar+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
    $('#myModalinfordv').modal('show');*/
    get_fiche_rendez_vous(idrdv);
    $('#modalFicheRendezVous').modal('show');
    $('#info_rdv_modal_link').click();
  }
}

function enreg_planning_seul(idpraticien,idlieu,idrdv,date,heuredebut,heurefin,actimoduleexterne, idcalendar){

  var dateJour = new Date();
  var numberJour = dateJour.getTime();

  var jour = date.substring(0,2);
  var mois = date.substring(3,5)-1;
  var annee = date.substring(6,10);

  var heures = heuredebut.substring(0,2);
  var minutes = heuredebut.substring(3,5);

  var dateClick = new Date(annee, mois, jour, heures, minutes, "00", "00");
  dateClick.setMinutes(dateClick.getMinutes() + {/literal}{$sTaillecellule}{literal} - 1);
  var numberdateClick = dateClick.getTime();



    if(actimoduleexterne==0){

      var moisreel = mois+1;
      $.ajax({
        cache: false,
        url: 'ajax/lock_rdv.php',
        data: 'idpraticien='+idpraticien+'&date='+annee+moisreel+jour+'&heure='+heures+minutes,
        dataType: 'json',
        success: function(json) {
          $.each(json, function(index, value) {
            if (value.sucess=='nop'){
              affiche_popup_message('Information', value.message, 'Ok');
            }
            if (numberdateClick < numberJour) {
              affiche_popup_message('Information', 'ATTENTION ! Vous êtes sur le point de créer un rendez-vous dans le passé', 'Ok');
            }

            document.getElementById("myModalLabelinfordv").innerHTML = "Enregistrement d'un RDV en direct ";
            document.getElementById("iframerdv").src = "modal_enreg_rdv_patient.php?iddocteur=" + idpraticien + "&ladate=" + date + "&heuredebut=" + heuredebut + "&heurefin=" + heurefin + "&idlieu=" + idlieu + '&idtyperdv=' + idrdv + "&idcalendar=" + idcalendar + "&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);

            valeurcookie = readookie("rdvcopie");
            //s nou sommes dans la situeation ou il y a un rdv copier dans le  cookiee
            if (valeurcookie != null && valeurcookie != "") {
              tab = valeurcookie.split('|');
              Message = "Deplacez le RDV de " + tab[1] + " le " + tab[2] + " à " + tab[3] + " avec le docteur " + tab[4] + "<br> Le " + date + " à " + heuredebut + " sur ce calendrier";
              $("#id_id_rdv_copie").val(tab[0]);
              $("#id_date_coller").val(date);
              $("#id_heure_coller").val(heuredebut);
              $("#id_id_calendar").val(idpraticien);

              $('#div_confim').html(Message);
              $('#modalComfirm').modal('show');
            } else {
              $('#myModalinfordv').modal('show');
            }
          });
        }
      });

    }else{
      //alert('Synchronisation avec un module externe activée');
      affiche_popup_message('Information', ' ATTENTION : Votre parametrage n\'autorise pas la prise de rendez-vous depuis le calendier, merci d\'utiliser la fonction "Prendre un rendez-vous"', 'Ok');
    }
}

function getDateTime() {
  var now     = new Date();
  var year    = now.getFullYear();
  var month   = now.getMonth()+1;
  var day     = now.getDate();
  var hour    = now.getHours();
  var minute  = now.getMinutes();
  var second  = now.getSeconds();
  if(month.toString().length == 1) {
    var month = '0'+month;
  }
  if(day.toString().length == 1) {
    var day = '0'+day;
  }
  if(hour.toString().length == 1) {
    var hour = '0'+hour;
  }
  if(minute.toString().length == 1) {
    var minute = '0'+minute;
  }
  if(second.toString().length == 1) {
    var second = '0'+second;
  }
  var dateTime = day+'/'+month+'/'+year+' '+hour+':'+minute+':'+second;
  return dateTime;
}

function sgetDate(format) {
  var now     = new Date();
  var year    = now.getFullYear();
  var month   = now.getMonth()+1;
  var day     = now.getDate();
  if(month.toString().length == 1) {
    var month = '0'+month;
  }
  if(day.toString().length == 1) {
    var day = '0'+day;
  }

  var dateTime;
  if(format=="YYYY-MM-DD"){
    dateTime = year+'-'+month+'-'+day;
  }else{
    dateTime = day+'/'+month+'/'+year;
  }

  return dateTime;
}


function affiche_popup_message(titre, message, text_bouton){
  $('#myModalLabelNoInfo').html(titre);
  $('#txtmyModalNoInfo').html(message);
  $('#boutonmyModalNoInfo').html(text_bouton);

  $('#myModalNoInfo').modal('show');
}

function rafraichir_calendrier(idlieu,idpratcien,idrdv,validation,datedebut,firstrdvdispo, reinit){
  var sidpasselieu = document.getElementById(idlieu).value;
  var sidrdv = document.getElementById(idrdv).value;
  var sdatedebut = document.getElementById(datedebut).value;
  var sdateTemp = document.getElementById(datedebut).value;
  var sdatedebut2;

  if(reinit==1){
    sidpasselieu = "";
    sidrdv = "";
    sdatedebut = "";
    sdateTemp = "";
  }

  document.getElementById("idpasselieu").value = sidpasselieu;
  document.getElementById("idpasserdv").value = sidrdv;
  document.getElementById("idpassevalidation").value=validation;

  {/literal}
  {foreach from=$tabPraticien item=tabP name=sTabPraticien}{literal}

    if(sdatedebut==""){
      sdatedebut = sgetDate();
      sdatedebut2 = sgetDate("YYYY-MM-DD");
    }else{
      sdatedebut2 = sdatedebut.substring(6, 10)+"-"+sdatedebut.substring(3, 5)+"-"+sdatedebut.substring(0, 2);
    }

    if(firstrdvdispo==1){
      $.ajax({
        url: 'ajax/myfeddfirts.php',
        data: 'idlieu='+sidpasselieu+'&identifiant_entite={/literal}{$idc}{literal}&praticien='+{/literal}{$tabP.id_user}{literal}+'&validation='+validation+'&rdv='+sidrdv+'&date_debut='+sdatedebut2,
        dataType: 'json',
        async: false,
        success: function(json) {
          $.each(json, function(index, value) {
            var sdateTemp1 = moment(value.start).format('DD/MM/YYYY');
            var sdateTemp2 = moment(value.start).format('YYYY-MM-DD');

            $('#datedebutaff_{/literal}{$smarty.foreach.sTabPraticien.iteration}{literal}').val(sdateTemp2);
            $('#calendar_{/literal}{$smarty.foreach.sTabPraticien.iteration}{literal}').fullCalendar( 'gotoDate', moment(sdateTemp1, 'DD/MM/YYYY'));
          });
        }
      });
    }else{
      $('#datedebutaff_{/literal}{$smarty.foreach.sTabPraticien.iteration}{literal}').val(sdatedebut2);
      $('#calendar_{/literal}{$smarty.foreach.sTabPraticien.iteration}{literal}').fullCalendar( 'gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));
    }

    if(document.getElementById('first_'+{/literal}{$smarty.foreach.sTabPraticien.iteration} {literal}).value =="0"){
      $('#calendar_'+{/literal}{$smarty.foreach.sTabPraticien.iteration} {literal}).fullCalendar('refetchEvents');
    }

  {/literal}{/foreach}{literal}
  }

  function changement_status_rdv(idrdv, idstatus){

    $.ajax({
      url: 'ajax/set_status_rdv.php',
      data: 'idrdv='+idrdv+'&idstatus='+idstatus,
      dataType: 'json',
      async: false,
      success: function(json) {
        $.each(json, function(index, value) {
          getSalleAttente();
        });
      }
    });
  }

  function supprimer_rdv(idrdv, idcalendar){

    $.ajax({
      url: 'ajax/del_rdv.php',
      data: 'idrdv='+idrdv,
      dataType: 'json',
      async: false,
      success: function(json) {
        $.each(json, function(index, value) {
          if(value.success){
            $('#calendar_'+idcalendar).fullCalendar('removeEvents', idrdv);
          }else{
            alert(value.message_html);
          }
        });
      }
    });
  }

  function modal_prendre_rendez_vous(){
    /*document.getElementById("iframerdv").src="modal_widget_backoffice.php?idinterpro=&tout=ok&identifiant_entite={/literal}{$idc}{literal}";

    $('#myModalinfordv').modal('show');
    $('#myModalLabelinfordv').html('Suivez les étapes pour prendre un rendez-vous');
*/
    reinitialise_modal_prendre_rendez_vous();
    $('#modalPrendreRendezVous').modal('show');
  }

  $(document).ready(function() {

    {/literal}{foreach from=$tabPraticien item=tabConsigne name=sTabConsigne}{literal}
    $('#id_consigne_{/literal}{$smarty.foreach.sTabConsigne.iteration}{literal}').bind('click', function() {

      // if this is close
      if (! $('#div-top-menu-consigne_{/literal}{$smarty.foreach.sTabConsigne.iteration}{literal}').hasClass('open')){

        $('#div-top-menu-consigne_{/literal}{$smarty.foreach.sTabConsigne.iteration}{literal}').addClass('open');
        $('#div-top-menu-consigne_{/literal}{$smarty.foreach.sTabConsigne.iteration}{literal}').slideDown('fast',  function(){});

        // if this is open
      } else {
        $('#div-top-menu-consigne_{/literal}{$smarty.foreach.sTabConsigne.iteration}{literal}').removeClass('open');
        $('#div-top-menu-consigne_{/literal}{$smarty.foreach.sTabConsigne.iteration}{literal}').slideUp('fast',  function(){});
      }

    });
    {/literal}{/foreach}{literal}

    document.getElementById('first_1').value = "0";
    $(document).on( 'shown.bs.tab', '#ulcalendar a[data-toggle="tab"]', function (e) {
      var str = String(e.target);
      var res = str.split('#');
      var id_calendar = res[1].substring(3);
      document.getElementById('tabactive').value = id_calendar;
      if(document.getElementById('first_'+id_calendar).value =="1"){
        $('#calendar_'+id_calendar).fullCalendar('today');
        document.getElementById('first_'+id_calendar).value = "0";
      }
      $('#calendar_'+id_calendar).fullCalendar('refetchEvents');

      $('#calendar_'+id_calendar).fullCalendar('gotoDate', moment($('#datedebutaff_'+id_calendar).val(), 'YYYY-MM-DD'));

      clearInterval(refreshIntervalId);
      refreshIntervalId="";
      var view = $('#calendar_'+id_calendar).fullCalendar('getView');
      setTimeline('#calendar_'+id_calendar, view);
      clearInterval(refreshIntervalId);
      refreshIntervalId="";
      refreshIntervalId = setInterval(function(){
        setTimeline('#calendar_'+id_calendar, view);
      }, 1000);
      getSalleAttente();
      getConsigne($("#identifiant_praticien_"+id_calendar).val(), id_calendar);
      $('#widthagenda').val($('#calendar_'+id_calendar).width());

    });

    $('#tab_profession').click(function() {
      $('#bsetapplique').val("profession");
    });

    $('#tab_praticien').click(function() {
      $('#bsetapplique').val("praticien");
    });

    $('#btn_modal_search_filtre_rdv').click(function() {
      $('#moderecherche').val("ok");

      document.getElementById('divfiltrerdv').style.display = "none";
      document.getElementById('divattentefiltrerdv').style.display = "block";
      setTimeout(function() {
        rafraichir_calendrier('selectlieux2','selectpraticien2','selecttyperdv2','ok','datepickerrdv-widget','1', '0');
      }, 0);
      $('#myModalfiltrrdv').modal('hide');
      $('#btn_interpro_rdv').css('display','block');
      return false;
    });

    $('#btn_modal_filtre_praticien').click(function() {
      document.getElementById('divfiltrepraticien').style.display = "none";
      document.getElementById('divattentefiltrepraticien').style.display = "block";
      setTimeout(function() {
        rafraichir_calendrier('selectlieux','selectpraticien','selecttyperdv','','iddateplanning','0', '0');
      }, 0);
      $('#myModalfiltremedecin').modal('hide');
      return false;
    });

    $('#trie_salle_attente').on('change', function() {
      getSalleAttente();
    });

    getSalleAttente();
    launch_getSalleAttente();


    $('#btn_param_calendar').click(function() {

      if (document.getElementById('div_param_agenda').style.display == "none"){
        $('#div_param_agenda').slideDown('slow',  function(){});

        $('#dialog-confirm').show();
        $( "#dialog-confirm" ).dialog({
          resizable: false,
          height:200,
          width:'auto',
          modal: true,
          buttons: {
            "Oui": function() {
              $(".checkpraticien").prop("checked", false);
              $(".checkprofession").prop("checked", false);
              $( this ).dialog( "close" );

            },
            "Non": function() {
              $( this ).dialog( "close" );
            }
          }
        });

      } else {
        $('#div_param_agenda').slideUp('slow',  function(){});
        $('#dialog-confirm').hide();
      }
      return false;
    });

    $('#btn_annule_param_agenda').click(function() {
      $('#div_param_agenda').slideUp('slow',  function(){});
      return false;
    });

    //header agenda
    var tmpWidhtAgenda = "";
    $(window).on("scroll", function(){
      //alert($(window).scrollTop()+" "+headerHeightagenda);
      if ($(window).scrollTop() > headerHeightagenda + 200) {
        //alert(1);
        if($('#widthagenda').val()== ""){
          tmpWidhtAgenda = $(".fc-view-container").width();
        }else{
          tmpWidhtAgenda = $('#widthagenda').val();
        }
        $('.fc-head').css({
          top: '63px',
          position: 'fixed',
          zIndex: '999',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff'
        });

      } else if ($(window).scrollTop() <= 300 ) {
        $('.fc-head').removeAttr('style');
      }
    });

  });

  affiche_bouton_rdv_en_cour()
</script>

{/literal}