<!-- agenda v4-->
  <link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-treeview.css">

  <script type="text/javascript" src="js/datepicker-fr.{datepicker}.js"></script>

  <script type="text/javascript" src="js/liste_e7.{listeE7}.js?{$stime}"></script>

  <script type="text/javascript" src="js/js_planning_dispo.{planningDispo}.js?{$stime}"></script>

  <script type="text/javascript" src="js/jquery.contextmenu.{contextMenu}.js"></script>

  <script type="text/javascript" src="js/bootstrap-treeview.{treeview}.js"></script>

{literal}
<!--
<script type="text/javascript" src="js/jquery.contextMenu.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.position.min.js"></script>
-->

<style type="text/css">

.btn_widget_standard:active{
  color:#fff;
}
.btn_widget_standard:visited{
  color:#fff;
}
.btn_widget_standard:focus{
  color:#fff;
}
.ui-datepicker {
    background: #5D9AD4;
    position: initial !important;
}

.fc-event .fc-bg {
    background: none !important;
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

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
  margin-top: 1px;
  margin-right: 1px;
}


.nav-tabs.nav-justified>li>a{
  background-color: #eee;
  border-color: #969696;
  color:#555;
}


.nav-tabs.nav-justified>.active>a, .nav-tabs.nav-justified>.active>a:hover, .nav-tabs.nav-justified>.active>a:focus{
  background-color: #27A1C2 !important;
  border-top-color: #27A1C2 !important;
  border-left-color: #27A1C2 !important;
  border-right-color: #27A1C2 !important;
  border-bottom-color: #27A1C2 !important;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus{
  color:#fff !important;
}


.coin_arrondi{
  border: solid 1px #81817C;
  -moz-border-radius:5px;
  -webkit-border-radius:5px;
  border-radius:5px;

  padding: 5px;
}

.coin_arrondi_time{
  border: solid 1px #980006;
  -moz-border-radius:50px;
  -webkit-border-radius:50px;
  border-radius:50px;

  padding: 5px;
}

.timeline {
    position: absolute !important;
    border-top: 2px solid red;
    width: 100%;
    margin: 0;
    padding: 0;
    z-index: 999 !important;
}

.stripe-salle-attente {
  background: repeating-linear-gradient(
    45deg,
    #aebaff,
    #aabdff 15px,
    #90b4ff 15px,
    #99b5ff 30px
  );
}

.conge {
  background: repeating-linear-gradient(
    135deg,
    #8bf0fc,
    #8bf0fc 30px,
    #8be6d7 30px,
    #8be6d7 60px
  );
  font-size: xx-large;
  font-weight: 900;
  text-transform: uppercase;
  text-align: center;
  /*padding-top: 60px !important;*/
  /* display: flex;
  align-items: center;
  justify-content: center;*/
}

a.conge .fc-content {
  border: 0 !important;
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

select:disabled {
    background: #ebebe4;
}

.element-item {
  position: static;
  }

.fc-scroller {
   height: auto !important;
}

{/literal}{if $bIsMobile}{literal}


.fc-toolbar{
  display: none;
}

div.datepicker table {
    background: #121212 !important;
    border-collapse: collapse;
    width: 100%;
}
div.datepicker table td {
    padding: 8px !important;
    color: #000 !important;

}

.vd_content-section{
  margin: 0px !important;
  padding: 0px !important;
}

.vd_head-section, .vd_content-section, .vd_title-section {
    padding: 0px !important;
}

.panel .panel-body {
    padding: 0px !important;
}

.datepickerBorderT{
  display: none;
}
.datepickerBorderB{
  display: none;
}
.datepickerBorderL{
  display: none;
}
.datepickerBorderR{
  display: none;
}
.datepickerBorderTL{
  display: none;
}
.datepickerBorderTR{
  display: none;
}
.datepickerBorderBL{
  display: none;
}
.datepickerBorderBR{
  display: none;
}
.fc-scroller {
   overflow-y: hidden !important;
}

.ui-pnotify.stack-bottomright, .ui-pnotify.stack-bottomleft{
  top:auto !important;
}

{/literal}{/if}{literal}
</style>

<script type="text/javascript">
  var refreshIntervalId = "";
  var headerHeightagenda = "";

</script>

{/literal}
<div id="tooltipeventbg" class="tooltipevent coin_arrondi_time no-print {if $bIsMobile}hidden{/if}" style="display:none;margin:10px;width:auto;height:auto;color:#000;font-weight:900;background:#fff422;position:absolute;z-index:10001;"></div>

<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalCalendarMobile" tabindex="-1" role="dialog" aria-labelledby="LabelmodalCalendarMobile" aria-hidden="false">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-body" style="height: 300px;">
          <div class="col-md-12" id="datemenupickermobile"></div>
      </div>
      <div class="modal-footer" style="background-color: #cccccc;">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>


<div id="btn_rdv_prec_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;left: 15px; bottom: 25px;">
  <a class="mega-link" href="javascript:void(0);" onclick="btn_calendar_mobile_day_prev()" style="
  background-color: #9f9ba0;
  color: #ffffff !important;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 35px 0px 0px 35px;
  -moz-border-radius: 35px 0px 0px 35px;
  -webkit-border-radius: 35px 0px 0px 35px;
  border: 1px solid #292929;">
    <span class="mega-icon">
      <i class="fa fa-chevron-left"></i>
    </span>
  </a>
</div>
<div id="btn_rdv_calendar_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;left: 65px; bottom: 25px;">
  <a class="mega-link" href="javascript:void(0);" onclick="$('#modalCalendarMobile').modal('show');" style="
  background-color: #9f9ba0;
  color: #ffffff !important;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border: 1px solid #292929;">
    <span class="mega-icon">
      <i class="fa fa-calendar"></i>
    </span>
  </a>
</div>
<div id="btn_rdv_next_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;left: 120px; bottom: 25px;">
  <a class="mega-link" href="javascript:void(0);" onclick="btn_calendar_mobile_day_next()" style="
  background-color: #9f9ba0;
  color: #ffffff !important;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 0px 35px 35px 0px;
  -moz-border-radius: 0px 35px 35px 0px;
  -webkit-border-radius: 0px 35px 35px 0px;
  border: 1px solid #292929;">
    <span class="mega-icon">
      <i class="fa fa-chevron-right"></i>
    </span>
  </a>
</div>


<div id="add_rdv_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="position: fixed; z-index: 999;right: 15px; bottom: 25px;">
  <a class="mega-link" href="javascript:void(0);" onclick="modal_prendre_rendez_vous();" style="
  background-color: #AB0000;
  color: #ffffff !important;
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  -webkit-border-radius: 35px;
  -moz-border-radius: 35px;
  border-radius: 35px;">
    <span class="mega-icon">
      <i class="fa fa-plus"></i>
    </span>
  </a>
</div>

<div id="messagerie_mobile" class=" no-print {if $bIsMobile}visible{else}hidden{/if}" style="display: none !important;position: fixed; z-index: 999;right: 75px; bottom: 25px;">
  <a class="mega-link" href="main.php?dir=gestdiscuprat" style="
  background-color: #27a1c2;
  color: #ffffff !important;
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  -webkit-border-radius: 35px;
  -moz-border-radius: 35px;
  border-radius: 35px;">
    <span class="mega-icon">
      <i class="fa fa-envelope"></i>
      <span class="badge vd_bg-red" id="nb_message_menu_mobile" style="z-index: 9999;position: fixed;display: none;"></span>
    </span>

  </a>
</div>

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
<div id="div_affiche_mini_calendar" style="position: fixed; top: 100px; left: 100px; z-index: 999;">
  <div align='center' id="datemenupicker"></div>
</div>
<div class="vd_content-section clearfix">
<input type="hidden" name="passepraticien" id="idpassepraticien">
<input type="hidden" name="passelieu" id="idpasselieu">
<input type="hidden" name="passerdv" id="idpasserdv">
<input type="hidden" name="passevalidation" id="idpassevalidation">
<input type="hidden" name="tabactive" id="tabactive" value="">
<input type="hidden" name="moderecherche" id="moderecherche">
<input type="hidden" name="chktime" id="chktime" value="0">
<input type="hidden" name="widthagenda" id="widthagenda" value="">
<input type="hidden" name="id_praticien_copypaste" id="id_praticien_copypaste" value="{$id_praticien_copypaste}">
<input type="hidden" name="id_rdv_copypaste" id="id_rdv_copypaste" value="{$id_rdv_copypaste}">


  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget">
        <div class="panel-body">

          <div class="btn_param no-print" style="height: 53px;">
            <div id="div_param_agenda" class="vd_content-section clearfix row" style="display:none;">
              <form class="form-horizontal" action="main.php?dir=rechdispo" role="form" id="form_filtre_agenda" method="POST">
                {*<input type="hidden" name="lstfiltreagenda" id="lstfiltreagenda" value="">*}
                <input type="hidden" name="bsetfiltre" id="bsetfiltre" value="ok">
                <input type="hidden" name="bsetapplique" id="bsetapplique" value="praticien">
                <input type="hidden" name="identifiant_entite" value="{$idc}">
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Nombre d'agenda par ligne :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="nb_agenda_ligne" name="nb_agenda_ligne">
                      <option value="4" {if $nbagendaaffiche=='4'}selected{/if}>4</option>
                      <option value="5" {if $nbagendaaffiche=='5'}selected{/if}>5</option>
                      <option value="6" {if $nbagendaaffiche=='6'}selected{/if}>6</option>
                      <option value="7" {if $nbagendaaffiche=='7'}selected{/if}>7</option>
                      <option value="8" {if $nbagendaaffiche=='8'}selected{/if}>8</option>
                      <option value="9" {if $nbagendaaffiche=='9'}selected{/if}>9</option>
                      <option value="10" {if $nbagendaaffiche=='10'}selected{/if}>10</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Entête flottante :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="active_entete_flottante_calendar" name="active_entete_flottante_calendar">
                      <option value="Y" {if $activeenteteflottante=='Y'}selected{/if}>Oui</option>
                      <option value="N" {if $activeenteteflottante=='N'}selected{/if}>Non</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Afficher le motif dans le RDV :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="affiche_motif_rdv_calendar" name="affiche_motif_rdv_calendar">
                      <option value="Y" {if $affichemotifrdv=='Y'}selected{/if}>Oui</option>
                      <option value="N" {if $affichemotifrdv=='N'}selected{/if}>Non</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Afficher l'heure dans le RDV :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="affiche_heure_rdv_calendar" name="affiche_heure_rdv_calendar">
                      <option value="Y" {if $afficheheurerdv=='Y'}selected{/if}>Oui</option>
                      <option value="N" {if $afficheheurerdv=='N'}selected{/if}>Non</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Afficher l'icône commentaire :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="affiche_icone_commentaire_rdv_calendar" name="affiche_icone_commentaire_rdv_calendar">
                      <option value="Y" {if $afficheiconecomrdv=='Y'}selected{/if}>Oui</option>
                      <option value="N" {if $afficheiconecomrdv=='N'}selected{/if}>Non</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Activer le son de la salle d'attente :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="option_son_salle_attente" name="option_son_salle_attente">
                      <option value="Y" {if $optionsonsalleattente=='Y'}selected{/if}>Oui</option>
                      <option value="N" {if $optionsonsalleattente=='N'}selected{/if}>Non</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4 class="col-sm-3 col-xs-6" style="padding-left:0px;">Masquer les RDV annulés :</h4>
                  <div class="controls col-sm-1 col-xs-6">
                    <select id="option_masque_rdv_annule" name="option_masque_rdv_annule">
                      <option value="Y" {if $optionmasquerdvannule=='Y'}selected{/if}>Oui</option>
                      <option value="N" {if $optionmasquerdvannule=='N'}selected{/if}>Non</option>
                    </select>
                  </div>
                </div>
                <div class="col-sm-12">
                  <h4>Agenda visible :</h4>
                  <ul class="nav nav-tabs">
                    <li class="active"><a id="tab_praticien" href="#fltab1" data-toggle="tab" style="color:#27a1c2 !important;">Praticiens</a></li>
                    <li class=""><a id="tab_profession" href="#fltab2" data-toggle="tab" style="color:#27a1c2 !important;">Professions</a></li>
                  </ul>
                  <div class="tab-content mgbt-xs-20" style="background-color:#fff; padding: 10px;">
                    <div class="tab-pane active" id="fltab1">
                      <div class="vd_checkbox checkbox-success clearfix">
                        {foreach from=$tabPraticienPermanent item=tabPParam name=sTabPraticienParam}

                          <div class="col-sm-4">
                            <input class="checkpraticien" name="lstfiltreagenda[]" type="checkbox" value="{$tabPParam.identifiant_user}" id="checkbox-{$tabPParam.identifiant_user}" {if $tabPParam.check_p == 1} checked="checked" {/if}>
                            <label for="checkbox-{$tabPParam.identifiant_user}">{$tabPParam.abreviation_civilite} {$tabPParam.nom_user} {$tabPParam.prenom_user} ({$tabPParam.nom_profession})</label>
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
              <div class="clearfix row">
                   <div class="col-sm-12">
                      <div class="col-sm-3 controls {if $bIsMobile}hidden{/if}">
                          <a id="btn_mini_calendar" class="mega-link" href="javascript:void(0);" title="" onclick="affiche_mini_calendar();" >
                            <span class="mega-icon">
                                <i class="fa fa-calendar" style="font-size:xx-large;"></i>
                            </span>
                          </a>


                          <div class="btn-group" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                             <button id="btn_copier_rdv" title="Copier en cours ..." onclick="suppression_copier_rdv();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none">Copier en cours ... cliquez pour annuler</button>
                          </div>
                          <div class="btn-group" style="-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver; -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">
                             <button id="btn_couper_rdv" title="Couper en cours ..." onclick="suppression_couper_rdv();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none">Couper en cours ... cliquez pour annuler</button>
                          </div>
                      </div>
                     <div class="col-sm-7 controls {if $bIsMobile}hidden{/if}">
                       {if $iAccess == '10' || $sGroupe == 'secrelimite'}
                       <div align="center">
                         <button id="btn_select_rdv" alt="Filtre sur le planning" title="Filtre sur le planning" onclick="aff_divattente('divfiltrepraticien', 'divattentefiltrepraticien');$('#myModalfiltremedecin').modal('show');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: blue;">Filtre sur le planning</button>
                         {if !$bActifAnesthesiste}
                            <button id="btn_prochain_rdv" alt="Aller au prochain RDV disponible" title="Aller au prochain RDV disponibles" onclick="aff_divattente('divfiltrerdv', 'divattentefiltrerdv');$('#myModalfiltrrdv').modal('show');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: green;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Aller au prochain RDV disponible</button>
                         {/if}
                         {if $bActifAnesthesiste}
                         &nbsp;<button id="btn_prendre_rdv_anesthesiste" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_anesthesiste();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Prendre un rendez-vous</button>
                         {else}
                         &nbsp;{*<button id="btn_prendre_rdv" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Prendre un rendez-vous</button>*}
                         &nbsp;<button id="btn_prendre_rdv_unique" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_unique();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
    -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Prendre un rendez-vous</button>
                         {/if}

                       </div>
                       {/if}
                      </div>

                      <div class="col-sm-2 controls ">
                        <div align="center" class="{if $bIsMobile}hidden{/if}">
                          <button id="btn_interpro_rdv" alt="Retour" title="Retour" onclick="rafraichir_calendrier('selectlieux2','selectpraticien2','selecttyperdv2','','datepickerrdv-widget','0', '1');$('#btn_interpro_rdv').css('display','none');$('#moderecherche').val('');"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
                  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;display:none">Retour</button>
                        </div>
                        <div align="right">
                          <a id="btn_param_calendar" {if $bIsMobile}style="position: fixed; z-index: 999;left: 30px; top: 0px;"{/if} class="mega-link" href="javascript:void(0);" data-action="click-trigger" alt="Paramètres de l'agenda" title="Paramètres de l'agenda">
                            <span class="mega-icon">
                                <i class="fa fa-cog" style="font-size:xx-large;"></i>
                            </span>
                          </a>
                          &nbsp;&nbsp;
                          <a id="btn_print_calendar" class="mega-link {if $bIsMobile}hidden{/if}" href="javascript:void(0);" onclick="window.print();" alt="Imprimer" title="Imprimer">
                            <span class="mega-icon">
                                <i class="fa fa-print append-icon" style="font-size:xx-large;"></i>
                            </span>
                          </a>
                        </div>
                    </div>

        </div>
      </div>


          </div>

            <ul id="ulcalendar" class="nav nav-tabs nav-justified no-print">
              {foreach from=$tabPraticien item=tabP name=sTabPraticien}
                {if $smarty.foreach.sTabPraticien.iteration==1}
                  {literal}
                    <script type="text/javascript">
                      $(document).ready(function() {
                        $('#tabactive').val({/literal}{$tabP.id_user}{literal});
                      });
                    </script>
                  {/literal}
                {/if}



                <li {if $smarty.foreach.sTabPraticien.iteration==1}class="active"{/if} >

                  <div title="Configuration" data-placement="bottom" class="width-sm-1" style="position:absolute;z-index:{50-$smarty.foreach.sTabPraticien.iteration};margin-left:10px;margin-top:10px;cursor:pointer;">
                        <div class="menu-trigger mega-icon" data-action="click-trigger"> <i class="fa fa-cog"></i> </div>
                        <div data-action="click-target" class="vd_mega-menu-content  width-sm-3">
                      <div class="child-menu">
                        <div class="content-list content-menu">
                          <ul class="list-wrapper pd-lr-10">
                      {if !empty($aTableauMenu[2][4]) }

                             {if $bactionplanning or  $tabP.identifiant_user==$identifiantuser} {/if}
                            <li><a href="main.php?dir=boc_gestion_user&action=form&id_user={$tabP.id_user}"   {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarFichepraticien}</a>
                              {if $bActivtraduction=='Y'}
								&nbsp;<a href="#" style="display:inline" onclick="renvoi_info_traduction('fichepraticiemenuagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarFichepraticien|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                             {/if}
                            </li>
                            <li><a href="main.php?dir=gestlieuplus&id_user={$tabP.id_user}"  {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarLieux}</a>
                               {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#" style="display:inline" onclick="renvoi_info_traduction('lieuxagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarLieux|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>
                            <li><a href="main.php?dir=gestrecomprat&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarConsigne}</a>
                             {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('consigneagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarConsigne|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>

                            <li><a href="main.php?dir={$dirPlanning}&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarDispographique}</a>
                              {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('dispoagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarDispographique|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>

                              {if $bactionplanning or  $tabP.identifiant_user==$identifiantuser} {/if}
                            <!--<li><a href="main.php?dir=frameplanning&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarDispographique}</a>
                              {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('dispoagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarDispographique|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>

                             <li><a href="ReactCalendar/#/gestiondisponibilite/identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>Disponibilité Graphique React</a>

                            </li>
                            
                            <li><a href="main.php?dir=progdispo&id_user={$tabP.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarlistDispo}</a>
                              {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('listedispoagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarlistDispo|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>-->
                            <li><a href="main.php?dir=configtypepersord&id_user={$tabP.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarTpsRdv}</a>
                             {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('tpsrdvoagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarTpsRdv|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>
                            <li><a href="main.php?dir=tranchefertranche&id_user={$tabP.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarfermewidget}</a>
                            {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('fermerwidgetagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarfermewidget|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>
                            <li><a href="main.php?dir=gestrdvinterpro&id_user={$tabP.id_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarAccesintepro}</a>
                             {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('accesinterproagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarAccesintepro|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                            </li>
                            <li><a href="main.php?dir=progremplacant&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarGestionRemplacant}</a>
                            {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('gestionremplacantagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarGestionRemplacant|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                             {/if}
                            </li>
                            <li><a href="main.php?dir=gestconge&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarCongeferie}</a>
                             {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('gestioncongeagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarCongeferie|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                             {/if}
                            </li>
                            <li><a href="main.php?dir=gestioncodemotif&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarCongeCode}</a>
                             {if $bActivtraduction=='Y'}
								&nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('gestioncodeagenda','fli_menuagneda','{$sLangueUser}','{$MenuCalendarCongeCode|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                             {/if}
                            </li>
                            {if $tabP.teleconsult_active == 'Y'}
                              <li><a href="main.php?dir=gestrdvtele&identifiant_user={$tabP.identifiant_user}" {if $bActivtraduction=='Y'}style="display:inline;padding: 4px 4px;"{/if}>{$MenuCalendarListeTeleconsult}</a>
                               {if $bActivtraduction=='Y'}
                                  &nbsp;  <a href="#"  style="display:inline" onclick="renvoi_info_traduction('listeteleconsultation','fli_menuagneda','{$sLangueUser}','{$MenuCalendarListeTeleconsult|replace:'\'':'\\\''}','MenuAgenda','MenuAgenda');$('#fli_modallg').modal('show');"><span class="glyphicon glyphicon-pencil"></span></a>
                               {/if}
                              </li>
                            {/if}



                            {/if}
                          </ul>
                        </div>
                      </div>
                    </div>

                  </div>

                  <a href="#tab{$tabP.id_user}" sidtab="{$tabP.id_user}" data-toggle="tab" style="background-color: {$tabP.couleur_user}">

                    <h4><b>{if $tabP.nom_affichage_calendar_user!=''}{$tabP.nom_affichage_calendar_user}{else}{$tabP.abreviation_civilite} {$tabP.nom_user}{/if}&nbsp;</b>
                      <span id="nb_consigne_{$tabP.id_user}" class="badge vd_bg-red" style="position:absolute;margin-top:-8px;margin-left:15px;display:none;"></span>
                      <span data-action="click-trigger" id="id_consigne_{$tabP.id_user}" class="menu-icon" style="display:none;cursor:pointer;" title="Consigne du medecin"><i class="fa fa-edit"></i></span>
                      {if $iAccess == '10'}
                        {if !$bActifAnesthesiste}
                          {*<button id="btn_prendre_rdv_unique_{$tabP.id_user}" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_unique('{$tabP.identifiant_user}');" type="button"
                          style="width: 36px;height: 36px;padding: 2px 6px;background-color: Transparent;background-image: url('img/picto-add-rdv.png');background-repeat: no-repeat;background-size: 36px;float: right;border:0;">&nbsp;</button>*}
                          <button id="btn_prendre_rdv_unique_{$tabP.id_user}" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_unique('{$tabP.identifiant_user}');" type="button" class="btn vd_btn btn-besoin-aide" style="background-color: Transparent;width: 25px;height: 25px;padding: 2px 6px;font-size: 25px;line-height: 0;float: right;color:#555;" onMouseOver="this.style.color='#e6e6e6'" onMouseOut="this.style.color='#555'"><span class="mega-icon"><i class="icon icon-publish"></i></span></button>
                          {*<button id="btn_prendre_rdv_unique_{$tabP.id_user}" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_unique('{$tabP.identifiant_user}');" type="button" class="btn vd_btn btn-besoin-aide" style="width: 25px;height: 25px;padding: 2px 6px;font-size: 14px;background-color: #AB0000; -moz-box-shadow: 2px 2px 2px 0px silver;-webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;line-height: 1.33; -webkit-border-radius: 35px; -moz-border-radius: 35px; border-radius: 35px;float: right;"><span class="mega-icon"><i class="fa fa-plus"></i></span></button>*}
                        {/if}
                      {/if}
                    </h4>
                  </a>
                  <div id="div-top-menu-consigne_{$tabP.id_user}" class="vd_mega-menu-content width-xs-3 width-sm-4 width-md-5 width-lg-4 right-xs left-sm" data-action="click-target" style="z-index:99;">
                    <div class="child-menu">
                      <div class="title">
                        Liste des consignes
                      </div>
                      <div class="content-list content-image">
                        <div data-rel="scroll" class="mCustomScrollbar _mCS_2" style="overflow: hidden;">
                          <div class="mCustomScrollBox mCS-light" id="mCSB_2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                              <ul id="lst_consignes_{$tabP.id_user}" class="list-wrapper  pd-lr-10">
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

            <div class="tab-content  mgbt-xs-20">
            {foreach from=$tabPraticien item=tabP2 name=sTabPraticien2}

              <div class="tab-pane {if $smarty.foreach.sTabPraticien2.iteration==1}active{/if}" id="tab{$tabP2.id_user}">
                <input type="hidden" id="datedebutaff_{$tabP2.id_user}" name="datedebutaff_{$tabP2.id_user}" value="{$datedebutaff}">

                {literal}
                <!-- Calendar -->
                <script type="text/javascript">
                 $(document).ready(function() {

                   $('#calendar_{/literal}{$tabP2.id_user}{literal}').fullCalendar({
                    header: {
                      left: 'prev,next today',
                      center: 'title',
                      right: 'month,agendaWeek,agendaTroisJours,agendaDay,listWeek'
                    },

                    views: {
                        day: { // name of view
                            columnFormat: 'dddd DD MMMM YYYY'
                            // other view-specific options here
                        },
                        agendaTroisJours: {
                            type: 'agenda',
                            duration: { days: 3 },
                            buttonText: '3 jours'
                        }
                    },

                    contentHeight: 'auto',
                    height: 'auto',
                    lang: 'fr',         //langue francais
                    editable: false,       //calendrier modifiable
                    weekNumbers: true,      //on affiche le num de semaine
                    {/literal}{if $tabP2.active_dimanche_user == 'N'}{literal}hiddenDays: [ 0 ],{/literal}{/if}{literal}      //on n'affiche pas le dimanche
                    scrollTime: "{/literal}{$tabP2.affichage_agenda_heure_debut}{literal}",   //le scroll débute à 7h
                    minTime: "{/literal}{$tabP2.affichage_agenda_heure_debut}{literal}",    //le calendar demarre à 7h
                    maxTime: "{/literal}{$tabP2.affichage_agenda_heure_fin}{literal}",    //le calendar fini à 20h
                    slotEventOverlap: false,  //les event ne se chevoche pas
                    defaultView: '{/literal}{$sDefaultAgenda}{literal}',  //afficher la semaine par defaut
                    defaultDate: moment($('#datedebutaff_{/literal}{$tabP2.id_user}{literal}').val()).format('YYYY-MM-DD'),
                    slotLabelFormat: 'H:mm',
                    slotLabelInterval: '00:'+{/literal}{if $tabP2.affichage_agenda_slot_duration != ''}{$tabP2.affichage_agenda_slot_duration}{else}{$sTaillecellule}{/if}{literal},
                    slotDuration: '00:'+{/literal}{if $tabP2.affichage_agenda_slot_duration != ''}{$tabP2.affichage_agenda_slot_duration}{else}{$sTaillecellule}{/if}{literal}+':00',
                    allDaySlot: false,    //ne pas afficher la ligne "Toute la journée"
                    events:{
                      url: 'ajax/myfedd.php?nocache='+Math.random(),
                      type: 'GET',
                      async: true,
                      cache: false,
                      dataType: 'json',
                      data: function() {
                        return {
                          dateposition: $('#datedebutaff_{/literal}{$tabP2.id_user}{literal}').val(),
                          idlieu: $('#idpasselieu').val(),
                          praticien: '{/literal}{$tabP2.id_user}{literal}',
                          affichemotif: '{/literal}{$affichemotifrdv}{literal}',
                          affichepictocommentaire: '{/literal}{$afficheiconecomrdv}{literal}',
                          affichelieu: '{/literal}{if $bIsMobile}Y{else}N{/if}{literal}',
                          identifiant_entite:'{/literal}{$idc}{literal}',
                          rdv:$('#idpasserdv').val(),
                          validation:$('#idpassevalidation').val()
                        };
                      }
                    },
                    /*eventSources: [{
                      url: 'ajax/feed.json',
                      ignoreTimezone: false
                    }],*/

                    eventClick: function(calEvent, jsEvent, view) {
                      var start = moment(calEvent.start).format('DD/MM/YYYY');
                      var starth = moment(calEvent.start).format('HH:mm');
                      var end = moment(calEvent.end).format('DD/MM/YYYY');
                      var endh = moment(calEvent.end).format('HH:mm');

                      if (calEvent.idrdv!=0) {
                        if (calEvent.dispo=="") {
                          enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,{/literal}{$tabP2.id_user}{literal}, '{/literal}{$tabP2.identifiant_user}{literal}');
                        }else if(calEvent.dispo=="ok"){
                          enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,{/literal}{$tabP2.id_user}{literal}, '{/literal}{$tabP2.identifiant_user}{literal}');
                        }else if(calEvent.dispo=="not"){
                          return false;
                        }
                      }else{

                        if(calEvent.messagepopup=='')
                          affiche_popup_message("RDV Privé", "Ce rendez-vous est privé, vous ne pouvez pas le consulter", "Ok");
                         else
                            affiche_popup_message("Absences",calEvent.messagepopup, "Ok");
                      }
                    },
                    dayClick: function(date, jsEvent, view ) {
                        $bretour = true;

                        {/literal}{if $iAccess == '10'}{literal}
                        $('#calendar_{/literal}{$tabP2.id_user}{literal}').fullCalendar('clientEvents', function(event) {
                            if(event.className == 'conge' && event.start <= date && event.end >= date) {
                               affiche_popup_message("Absences",event.messagepopup, "Ok");
                               $bretour = false;
                            }
                        });

                        if($bretour){
                            var leday = moment(date).format('DD/MM/YYYY');
                            var lhour = moment(date).format('HH:mm');
                            enreg_planning_seul({/literal}{$tabP2.id_user}{literal},document.getElementById("idpasselieu").value,document.getElementById("idpasserdv").value,leday,lhour,'',{/literal}{$ibmodule}{literal}, {/literal}{$tabP2.id_user}{literal}, '{/literal}{$tabP2.identifiant_user}{literal}');
                        }
                        {/literal}{/if}{literal}

                    },
                    eventRender: persoEventAfterRender,
                    eventMouseover: function(calEvent, jsEvent, element) {
                      var tooltip = '<div id="tooltipevent" class="tooltipevent coin_arrondi no-print hidden-xs hidden-sm" style="margin:10px;width:auto;height:auto;background:#ccc;position:absolute;z-index:10001;">';
                      tooltip += calEvent.title;
                      if(calEvent.nomrdv!=""){
                        tooltip += '<br />Type : ' + calEvent.nomrdv;
                      }
                      if(calEvent.tempsrdv!=""){
                        tooltip += '<br />Durée : ' + calEvent.tempsrdv + ' min.';
                      }
                      if(calEvent.tel!="" && calEvent.tel!="undefined"){
                        tooltip += '<br />Tel mobile : ' + calEvent.tel;
                      }
                      if(calEvent.telfixe!="" && calEvent.telfixe!="undefined"){
                        tooltip += '<br />Tel fixe : ' + calEvent.telfixe;
                      }
                      if(calEvent.commentairerdv!=""){
                        tooltip += '<br />Commentaire : ' + calEvent.commentairerdv;
                      }
                      tooltip += '</div>';

                      if (calEvent.dispo=="") {
                        if (calEvent.idrdv!=0) {
                          $("body").append(tooltip);
                          $(this).mouseover(function(e) {
                            $(this).css('z-index', 10000);
                            $(this).fadeIn();
                          }).mousemove(function(e) {
                            $('#tooltipevent').css('top', e.pageY + 10);
                            $('#tooltipevent').css('left', e.pageX + 20);
                          });
                        }
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
                        $('#div_attente_chargement_{/literal}{$tabP2.id_user}{literal}').hide();
                        if($('#moderecherche').val()=="ok" && $('#calendar_{/literal}{$tabP2.id_user}{literal}').fullCalendar('clientEvents').length == 0){
                          //alert('Aucune information trouvé!');
                          //$('#myModalNoInfo').modal('show');
                          if($('#tabactive').val() == {/literal}{$tabP2.id_user}{literal}){
                            affiche_popup_message("Désolé...", "Aucune information trouvée!", "Ok");
                          }
                        }
                      }else{
                        $('#div_attente_chargement_{/literal}{$tabP2.id_user}{literal}').show();
                      }
                    },

                    eventAfterAllRender: function (view) {
                      jours = new Array('Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi');
                      var tmp1 = moment(view.start).format('DD/MM/YYYY');
                      var datedumoment = tmp1.split("/",3);
                      var thedate = new Date(datedumoment[2], datedumoment[1]-1, datedumoment[0], 0, 0, 0, 0);
                      var resultJour = jours[thedate.getDay()];

                      var tmpSemOuDate = $("#calendar_"+{/literal}{$tabP2.id_user}{literal}+' .fc-toolbar .fc-center').html();
                      var resSemOuDate = tmpSemOuDate.split("<!-- separator3 -->",2);

                      if(resSemOuDate.length > 1){
                          tmpSemOuDate = resSemOuDate[1];
                      }
                      var tmpTextSemOuDate = '<h2 id="div_name_praticien_{/literal}{$tabP2.id_user}{literal}" class="affiche_print" style="display:none;"></h2><!-- separator3 -->'+tmpSemOuDate;


                      $("#calendar_"+{/literal}{$tabP2.id_user}{literal}+' .fc-toolbar .fc-center').html(tmpTextSemOuDate);

                      if(view.name=="agendaDay"){
                        $("#div_name_praticien_{/literal}{$tabP2.id_user}{literal}").html("{/literal}{$tabP2.abreviation_civilite} {$tabP2.nom_user}{literal} - "+resultJour+"&nbsp;");

                      }else if(view.name=="agendaWeek"){
                        $("#div_name_praticien_{/literal}{$tabP2.id_user}{literal}").html("{/literal}{$tabP2.abreviation_civilite} {$tabP2.nom_user}{literal} -&nbsp;");

                        $.ajax({
                          url: 'ajax/get_nb_rdv.php',
                          data: 'praticien='+{/literal}{$tabP2.id_user}{literal}+'&date_debut='+encodeURIComponent(moment(view.start).format('DD/MM/YYYY')),
                          dataType: 'json',
                          async: true,
                          success: function(json) {
                            $.each(json, function(index, value) {

                              var sJourSemaine = value.joursemaine;
                              var sNbMatin = value.nbmatin;
                              var sNbSoir = value.nbsoir;
                              var sOccupation = value.nboccupation;
                              var thedate = "";
                              var tmpEntete = $("#calendar_"+{/literal}{$tabP2.id_user}{literal}+' .fc-widget-header .fc-'+sJourSemaine).html();
                              var resEntete = "";
                              var resEntete2 = "";
                              if(tmpEntete){
                                if(tmpEntete.indexOf("<!-- separator2 -->")>0)
                                {
                                  var resEntete = tmpEntete.split("<!-- separator2 -->",1);
                                  if(resEntete){
                                    if(resEntete.indexOf("<!-- separator -->")>0)
                                    {

                                      if(resEntete2.length > 1){
                                        thedate = resEntete2[1];
                                      }else{
                                        thedate = resEntete[0];
                                      }

                                      var spanTemp = document.createElement('span');
                                      spanTemp.innerHTML = thedate;
                                      thedate = spanTemp.innerText;

                                      var idgenerer = thedate.split(" ",2);
                                      var idgenerer2 = idgenerer[1].split("/",2);
                                      var idgenererfinal = idgenerer2[0]+idgenerer2[1];

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
                                      $("#calendar_"+{/literal}{$tabP2.id_user}{literal}+' .fc-widget-header .fc-'+sJourSemaine).html(sscript+icone+divconsigne+thedate+'<!-- separator2 --> <br><span style="font-size:12px;">M: <b><span style="color:green;">'+sNbMatin+' RDV</span></b> - A.M: <b><span style="color:red;">'+sNbSoir+' RDV</span></b> - '+sOccupation+'%</span>');
                                    }
                                  }
                                }
                              }
                              //tmpTextSem = '<h2 id="div_name_praticien_{/literal}{$tabP2.id_user}{literal}" class="affiche_print" style="display:none;">{/literal}{$tabP2.abreviation_civilite} {$tabP2.nom_user}{literal} -</h2>'+tmpSem;
                              //$("#calendar_"+{/literal}{$tabP2.id_user}{literal}+' .fc-toolbar .fc-center').html(tmpTextSem);


                            });
                          }
                        });
                      }

                      var $row = $("#calendar_"+{/literal}{$tabP2.id_user}{literal}+" div.fc-slats table").find("tr");
                      var $tds = $row.children("td:nth-child(1)");

                      var tableau_heure = "<table><tbody>";

                      $.each($tds, function() {
                          tableau_heure += "<tr><td onMouseOver=\"highlightBG(this);\" onMouseOut=\"nohighlightBG(this);\" style='color:transparent;height: 1.5em;text-align: right;padding-right: 2px;'><span style='font-weight:900;'>"+$(this).text()+"</span></td></tr>";
                      });
                      tableau_heure += "</tbody></table>";

                      $('.fc-highlight-container').html(tableau_heure);
                      $('.fc-highlight-container').css('position', 'absolute');
                      $('.fc-scroller').css('overflow-y', 'hidden');
                      headerHeightagenda = $(".fc-head").height();



                    },
                    viewRender: function(view, element) {
                      //alert("viewRender");
                      var curTime2 = new Date();
                      $('#div_attente_chargement_{/literal}{$tabP2.id_user}{literal}').hide();

                      if (view.intervalStart < curTime2 && view.intervalEnd > curTime2) {
                        setTimeline("#calendar_"+{/literal}{$tabP2.id_user}{literal}, view);
                        clearInterval(refreshIntervalId);
                        refreshIntervalId="";
                        refreshIntervalId = setInterval(function(){ 
                          setTimeline("#calendar_"+{/literal}{$tabP2.id_user}{literal}, view);
                        }, 1000); 
                      }else{
                        clearInterval(refreshIntervalId);
                        refreshIntervalId="";
                      }

                    }

                  });

                  $('#calendar_{/literal}{$tabP2.id_user}{literal}').find('.fc-today-button').click(function(){
                      var curdate = new Date();
                      curdate = curdate.getDate()+"/"+(curdate.getMonth()+1)+"/"+curdate.getFullYear();
                      $('#datemenupicker').DatePickerSetDate(curdate, true);
                   });

                  $("#calendar_{/literal}{$tabP2.id_user}{literal}").find('.fc-month-button').addClass('hidden-xs hidden-sm');
                  $("#calendar_{/literal}{$tabP2.id_user}{literal}").find('.fc-agendaWeek-button').addClass('hidden-xs hidden-sm');
                  $("#calendar_{/literal}{$tabP2.id_user}{literal}").find('.fc-agendaDay-button').addClass('hidden-xs hidden-sm');
                  $("#calendar_{/literal}{$tabP2.id_user}{literal}").find('.fc-button-group').addClass('hidden-xs hidden-sm');
                  $("#calendar_{/literal}{$tabP2.id_user}{literal}").find('.fc-today-button').addClass('hidden-xs hidden-sm');

                   getConsigne($("#identifiant_praticien_{/literal}{$tabP2.id_user}{literal}").val(), {/literal}{$tabP2.id_user}{literal});


                   //$('.fc-bgevent-container').css('top', '3px');
                });

                function highlightBG(element) {
                  element.style.backgroundColor = '#39b6f0';
                  element.style.color = 'black';
                }

                function nohighlightBG(element) {
                  element.style.backgroundColor = 'initial';
                  element.style.color = 'transparent';
                }

                function persoEventAfterRender(event, element, view) {
                  if (event.dispo=="") {
                    element.find("div.fc-content").css( "padding-left", "7px");
                    element.find("div.fc-content").css( "overflow", "hidden");
                    element.find("div.fc-content").css( "text-overflow", "ellipsis");
                    element.find("div.fc-content").css( "-webkit-box-flex", "1");
                    element.find("div.fc-content").css( "-webkit-flex", "1 0 auto");
                    element.find("div.fc-content").css( "-ms-flex", "1 0 auto");
                    element.find("div.fc-content").css( "flex", "1 0 auto");

                    element.find("div.fc-bg").css( "border-left-color", event.couleurrdv);
                    element.find("div.fc-bg").css( "border-left-width", "7px");
                    element.find("div.fc-bg").css( "border-left-style", "solid");
                    element.find("div.fc-bg").css( "border-right-color", "#000");
                    element.find("div.fc-bg").css( "border-right-width", "1px");
                    element.find("div.fc-bg").css( "border-right-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").css( "color", "#000");


                    if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                    }else{
                        element.find("div.fc-title").html(event.picto+event.title);
                    }
                    //mode listWeek (mon planning)
                    element.find("td.fc-list-item-title").html(event.picto+event.title+" <span class='no-print'>"+event.commentairerdv+"</span>");

                    //mode month (Mois)
                    element.find("span.fc-time").css( "display", "none");
                    element.find("span.fc-time").html("");
                    element.find("span.fc-time").text("");
                    element.find("span.fc-title").css( "color", "#000");
                    if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("span.fc-title").html(event.picto+event.heureaffiche+event.title);
                    }else{
                        element.find("span.fc-title").html(event.picto+event.title);
                    }

                    if(event.className=="conge") {
                      element.find("div.fc-bg").css( "border", "0");
                      element.find("div.fc-title").html("<span style='color:#000;'>"+event.title+"</span>");
                    }
                  }else if(event.dispo=="ok"){
                    element.find("div.fc-content").css( "padding-left", "7px");
                    element.find("div.fc-content").css( "overflow", "hidden");
                    element.find("div.fc-content").css( "text-overflow", "ellipsis");
                    element.find("div.fc-content").css( "-webkit-box-flex", "1");
                    element.find("div.fc-content").css( "-webkit-flex", "1 0 auto");
                    element.find("div.fc-content").css( "-ms-flex", "1 0 auto");
                    element.find("div.fc-content").css( "flex", "1 0 auto");

                    element.find("div.fc-bg").css( "border-left-color", event.couleurrdv);
                    element.find("div.fc-bg").css( "border-left-width", "7px");
                    element.find("div.fc-bg").css( "border-left-style", "solid");
                    element.find("div.fc-bg").css( "border-right-color", "#000");
                    element.find("div.fc-bg").css( "border-right-width", "1px");
                    element.find("div.fc-bg").css( "border-right-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").css( "color", "#000");
                    if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                    }else{
                        element.find("div.fc-title").html(event.picto+event.title);
                    }
                  }else if(event.dispo=="not"){
                    element.find("div.fc-content").css( "background", "#ccc");
                    element.find("div.fc-bg").css( "background-color", "#ccc");
                    element.find("div.fc-content").css( "border-top-width", "0px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").css( "color", "#000");
                    if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                    }else{
                        element.find("div.fc-title").html(event.picto+event.title);
                    }
                  }

                   {/literal}{if $iAccess == '10'}{literal}
                  if((typeof event.idrdv !== 'undefined') && (event.idrdv != 0) && (event.etatrdv != "suppression_groupe")){
                    var menu1 = [
                      {/literal}{if $ibmodule=="0"}{literal}
                      {'Copier - Coller ce rdv': {
                          onclick:function(menuItem,menu) {
                              var sheure = extractContent(event.heureaffiche);
                              var resHeure = sheure.split("-");
                              copier_rdv(event.idrdv+'|'+extractContent(event.nompatient)+'|'+extractContent(event.dateaff)+'|'+resHeure[0]+'|'+extractContent(event.nomdocteur), 'copierdv');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Copier - Coller ce rdv'
                        }
                      },
                      {'Couper - Coller ce rdv': {
                          onclick:function(menuItem,menu) {
                              var sheure = extractContent(event.heureaffiche);
                              var resHeure = sheure.split("-");
                              couper_rdv(event.idrdv+'|'+extractContent(event.nompatient)+'|'+extractContent(event.dateaff)+'|'+resHeure[0]+'|'+extractContent(event.nomdocteur), 'copierdv');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Couper - Coller ce rdv'
                        }
                      },
                      {/literal}{/if}{literal}
                      {'Rendez vous planifié': {
                          onclick:function(menuItem,menu) { 
                              changement_status_rdv(event.idrdv, 'rdvplanifie');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          }, 
                          title:'Rendez vous planifié' 
                        }
                      },
                      {'Patient en salle d\'attente': {
                          onclick:function(menuItem,menu) {
                              changement_status_rdv(event.idrdv, 'patientensalle');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          }, 
                          title:'Patient en salle d\'attente' 
                        }
                      },
                      {'Patient en cours d\'examen': {
                          onclick:function(menuItem,menu) { 
                              changement_status_rdv(event.idrdv, 'patientencours');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          }, 
                          title:'Patient en cours d\'examen' 
                        }
                      },
                      {'Patient traité': {
                          onclick:function(menuItem,menu) {
                              document.getElementById("myModalLabelinfordv").innerHTML="Paiement du patient : "+event.title;
                              document.getElementById("iframerdv").src="modal_patient_traite.php?idrdv="+event.idrdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                              $('#myModalinfordv').modal('show');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          }, 
                          icon:'css/patient_traite_icon.png',
                          title:'Patient traité' 
                        }
                      },
                      {/literal}{if isset($bosteo) && $bosteo}{literal}
                      {'Dossier Ostéopathe': {
                          onclick:function(menuItem,menu) {
                              window.location = "main.php?dir=activiteosteo&id_rdv="+event.identifiant_rdv+"&sTypeRetour=calendar";
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Dossier Ostéopathe'
                        }
                      },
                      {/literal}{/if}{literal}
                      {'Profilage du rdv': {
                          onclick:function(menuItem,menu) {
                              document.getElementById("myModalLabelinfordv").innerHTML="Profilage du RDV : "+event.title;
                              document.getElementById("iframerdv").src="modal/modal_patient_profilage.php?identifiant_rdv="+event.identifiant_rdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                              $('#myModalinfordv').modal('show');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Profilage du rdv'
                        }
                      },
                      {'Encaissement': {
                          onclick:function(menuItem,menu) {
                              document.getElementById("myModalLabelinfordv").innerHTML="Encaissement du patient : "+event.title;
                              document.getElementById("iframerdv").src="modal_paiement.php?idrdv="+event.idrdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                              $('#myModalinfordv').modal('show');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Encaissement'
                        }
                      },
                      $.contextMenu.separator,
                      {'Déplacer le RDV': {
                          onclick:function(menuItem,menu) { 
                              document.getElementById("myModalLabelinfordv").innerHTML="Déplacer le rendez-vous du patient : "+event.title;
                              document.getElementById("iframerdv").src="modal_deplacer_rdv.php?id_patient=&idrdv="+event.idrdv+"&jsEvent="+event.idrdv+"&idcalendar="+{/literal}{$tabP2.id_user}{literal}+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                              $('#myModalinfordv').modal('show');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          icon:'css/deplacement_icon.png',
                          title:'Déplacer le rendez-vous'
                        }
                      },
                      {'Supprimer le RDV': {
                          onclick:function(menuItem,menu) {
                              del_fiche_rendez_vous(event.idrdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          }, 
                          icon:'css/delete_icon.gif',
                          title:'Supprimer le rendez-vous' 
                        }
                      },
                      {'Le praticien annule le RDV': {
                          onclick:function(menuItem,menu) {
                              praticien_annule_rdv(event.idrdv, event.identifiant_rdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Le praticien annule le RDV'
                        }

                      },
                      {'Communiquer avec le patient': {
                          onclick:function(menuItem,menu) {
                              initialise_praticien_initier_rdv(event.idrdv, event.identifiant_rdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Communiquer avec le patient'
                        }
                      },
                      $.contextMenu.separator,
                      {'Absence excusée': {
                          onclick:function(menuItem,menu) {
                              bconfirm=confirm('En changeant le statut du rendez vous en "Absence excusée", l\'emplacement sera à nouveau disponible, confirmez-vous le changement ?');
                              if(bconfirm){
                                  del_rendez_vous_absence_excusee(event.idrdv);
                              }
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Absence excusée'
                        }
                      },
                      {'Absence NON excusée': {
                          onclick:function(menuItem,menu) {
                              changement_status_rdv(event.idrdv, 'absencenonexcusee');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Absence NON excusée'
                        }
                      },
                      $.contextMenu.separator,
                      {'Imprimer le RDV': {
                          onclick:function(menuItem,menu) {
                              window.open('print_rdv.php?idrdv='+event.identifiant_rdv,'_blank');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Imprimer le rendez-vous'
                        }
                      },
                      $.contextMenu.separator,
                      {'Appel Urgence': {
                          onclick:function(menuItem,menu) {
                              initialise_appel_urgence(event.identifiant_rdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Appel Urgence'
                        }
                      }
                    ];
                    //if(event.autoriseteleconsult == 'Y'){
                      if(event.actifteleconsult == 'N'){
                        menu1.push(
                        {'Basculer le RDV en téléconsultation': {
                            onclick:function(menuItem,menu) {
                              var bcontinu = true;
                              if(bcontinu){
                                basculer_rdv_teleconsultation(event.identifiant_rdv, 'Y', event.idrdv);
                              }

                              $(".menu_custom_alaxione").hide();
                              return true;
                            },
                            title:'Basculer le RDV en téléconsultation'
                          }
                        });
                      }else{
                        menu1.push(
                        {'Basculer le RDV sur site': {
                            onclick:function(menuItem,menu) {
                              basculer_rdv_teleconsultation(event.identifiant_rdv, 'N');
                              $(".menu_custom_alaxione").hide();
                              return true;
                            },
                            title:'Basculer le RDV en téléconsultation'
                          }
                        });

                        if(typeof event.linkteleconsultation !== 'undefined'){
                          if(event.linkteleconsultation != ""){
                            menu1.push(
                            {'Lancer la téléconsultation': {
                                onclick:function(menuItem,menu) {
                                  changement_status_rdv(event.idrdv, 'patientencours');
                                  openInNewTab(encodeURI(event.linkteleconsultation));
                                  $(".menu_custom_alaxione").hide();
                                  return true;
                                },
                                title:'Lancer la téléconsultation'
                              }
                            });
                          }
                        }

                      }
                    //}


                    element.bind('mousedown', function (e) {
                        if (e.which == 3) {

                            $(".menu_custom_alaxione").hide();
                            element.contextMenu(menu1,{
                                className:'menu_custom_alaxione',
                                theme:'gloss',
                                showSpeed:200,
                                hideSpeed:200,
                                showTransition:'fadeIn',
                                hideTransition:'fadeOut',
                                shadow:false,
                                useIframe:false
                            });
                        }
                    });



                  }else if((typeof event.idrdv !== 'undefined') && (event.idrdv != 0) && (event.etatrdv == "suppression_groupe")){

                    var menu4 = [
                      {'Annuler l\'action': {
                          onclick:function(menuItem,menu) {
                              annulerDeplacementRDV(event.identifiant_rdv,{/literal}{$tabP2.id_user}{literal}, event);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Annuler l\'action'
                        }
                      },
                      {'Déplacer le RDV': {
                          onclick:function(menuItem,menu) {
                              document.getElementById("myModalLabelinfordv").innerHTML="Déplacer le rendez-vous du patient : "+event.title;
                              document.getElementById("iframerdv").src="modal_deplacer_rdv.php?id_patient=&idrdv="+event.idrdv+"&jsEvent="+event.idrdv+"&idcalendar="+{/literal}{$tabP2.id_user}{literal}+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                              $('#myModalinfordv').modal('show');
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          icon:'css/deplacement_icon.png',
                          title:'Déplacer le rendez-vous'
                        }
                      },
                      {'Communiquer avec le patient': {
                          onclick:function(menuItem,menu) {
                              initialise_praticien_initier_rdv(event.idrdv, event.identifiant_rdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Communiquer avec le patient'
                        }
                      },
                    ];

                    element.bind('mousedown', function (e) {
                        if (e.which == 3) {

                            $(".menu_custom_alaxione").hide();
                            element.contextMenu(menu4,{
                                className:'menu_custom_alaxione',
                                theme:'gloss',
                                showSpeed:200,
                                hideSpeed:200,
                                showTransition:'fadeIn',
                                hideTransition:'fadeOut',
                                shadow:false,
                                useIframe:false
                            });
                        }
                    });

                  }else if(event.id_conge != 0){
                    var menu5 = [
                      {'Supprimer la fermeture': {
                          onclick:function(menuItem,menu) {
                            bconfirm=confirm('Confirmez-vous la suppression de la fermeture ?');
                            if(bconfirm){
                              supprimerTrancheConge(event.id_conge, {/literal}{$tabP2.id_user}{literal}, event);
                            }

                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Supprimer la fermeture'
                        }
                      }
                    ];

                    element.bind('mousedown', function (e) {
                        if (e.which == 3) {

                            $(".menu_custom_alaxione").hide();
                            element.contextMenu(menu5,{
                                className:'menu_custom_alaxione',
                                theme:'gloss',
                                showSpeed:200,
                                hideSpeed:200,
                                showTransition:'fadeIn',
                                hideTransition:'fadeOut',
                                shadow:false,
                                useIframe:false
                            });
                        }
                    });

                  }else{
                    var menu2 = [
                      {'Aucune action disponible': {
                          title:'Aucune action disponible'
                        }
                      }
                    ];

                    element.bind('mousedown', function (e) {
                      if (e.which == 3) {
                          $(".menu_custom_alaxione").hide();
                          element.contextMenu(menu2,{
                              className:'menu_custom_alaxione',
                              theme:'gloss',
                              showSpeed:200,
                              hideSpeed:200,
                              showTransition:'fadeIn',
                              hideTransition:'fadeOut',
                              shadow:false,
                              useIframe:false
                          });
                      }
                    });

                  }
                  {/literal}{else}{literal}

                  var menu3 = [
                      {'Aucune action disponible': {
                          title:'Aucune action disponible'
                        }
                      }
                    ];

                    element.bind('mousedown', function (e) {
                      if (e.which == 3) {
                          $(".menu_custom_alaxione").hide();
                          element.contextMenu(menu3,{
                              className:'menu_custom_alaxione',
                              theme:'gloss',
                              showSpeed:200,
                              hideSpeed:200,
                              showTransition:'fadeIn',
                              hideTransition:'fadeOut',
                              shadow:false,
                              useIframe:false
                          });
                      }
                    });
                  {/literal}{/if}{literal}


                }

                </script>
                {/literal}

                <input type="hidden" id="idpassepraticien" name="idpassepraticien" value="{$tabP2.id_user}">
                <input type="hidden" id="id_praticien_{$tabP2.id_user}" name="id_praticien_{$tabP2.id_user}" value="{$tabP2.id_user}">
                <input type="hidden" id="identifiant_praticien_{$tabP2.id_user}" name="identifiant_praticien_{$tabP2.id_user}" value="{$tabP2.identifiant_user}">
                <input type="hidden" id="first_{$tabP2.id_user}" name="first_{$tabP2.id_user}"
                        {if $smarty.foreach.sTabPraticien2.iteration == 1}
                          value="0"
                        {else}
                          value="1"
                        {/if}
                >
                <div>
                <div id="div_attente_chargement_{$tabP2.id_user}" align='center' style="display:none;position: absolute;left: 0%;width: 100%;height: 100%;background-color: #2F2F2F;z-index:10002;opacity:0.7;filter: alpha(opacity=70);color:#fff;">
                  <br><br><br><br>
                  <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                </div>
                <div id="calendar_{$tabP2.id_user}" class="mgtp-10"> </div>
                </div>
              </div>
            {/foreach}


                {literal}
                  <script type="text/javascript">
                    function changeVue($mode){
                       {/literal}
                       {foreach from=$tabPraticien item=tabP2 name=sTabPraticien2}
                       {literal}
                       $('#calendar_{/literal}{$tabP2.id_user}{literal}').fullCalendar( 'changeView', $mode);

                       {/literal}{/foreach}{literal}
                   }
                   {/literal}{if $bIsMobile}{literal}
                   changeVue('agendaDay');
                   {/literal}{/if}{literal}

                   </script>
                {/literal}


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
                    scrollTime: "06:00:00",   //le scroll débute à 7h
                    minTime: "06:00:00",    //le calendar demarre à 7h
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
                      url: 'ajax/myfedd_journee.php?nocache='+Math.random(),
                      type: 'GET',
                      async: true,
                      cache: false,
                      dataType: 'json',
                      data: function() {
                        return {
                          dateposition: $('#datedebutaff_all').val(),
                          idlieu: $('#idpasselieu').val(),
                          praticien: "all",
                          affichemotif: '{/literal}{$affichemotifrdv}{literal}',
                          affichepictocommentaire: '{/literal}{$afficheiconecomrdv}{literal}',
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

                      if(calEvent.idrdv!=0){
                          if (calEvent.dispo=="") {
                            enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,"all");
                          }else if(calEvent.dispo=="ok"){
                            enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,"all");
                          }else if(calEvent.dispo=="not"){
                            return false;
                          }
                      }else{

                        if(calEvent.messagepopup=='')
                          affiche_popup_message("RDV Privé", "Ce rendez-vous est privé, vous ne pouvez pas le consulter", "Ok");
                         else
                            affiche_popup_message("Congés",calEvent.messagepopup, "Ok");
                      }

                    },
                    dayClick: function(date, jsEvent, view, resourceObj) {

                        $bretour = true;

                        $('#calendar_{/literal}{$tabP2.id_user}{literal}').fullCalendar('clientEvents', function(event) {
                            if(event.className == 'conge' && event.start <= date && event.end >= date) {
                               affiche_popup_message("Congés",event.messagepopup, "Ok");
                               $bretour = false;
                            }
                        });

                        if($bretour){
                            var leday = moment(date).format('DD/MM/YYYY');
                            var lhour = moment(date).format('HH:mm');
                            enreg_planning_seul(resourceObj.id,document.getElementById("idpasselieu").value,document.getElementById("idpasserdv").value,leday,lhour,'','{/literal}{$ibmodule}{literal}');
                        }

                    },
                    eventRender: persoEventAfterRenderAll,
                    eventMouseover: function(calEvent, jsEvent, element) {
                      var tooltip = '<div id="tooltipevent" class="tooltipevent coin_arrondi no-print" style="margin:10px;width:auto;height:auto;background:#ccc;position:absolute;z-index:10001;">';
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
                        if (calEvent.idrdv!=0) {
                          $("body").append(tooltip);
                          $(this).mouseover(function(e) {
                            $(this).css('z-index', 10000);
                            $(this).fadeIn();
                          }).mousemove(function(e) {
                            $('#tooltipevent').css('top', e.pageY + 10);
                            $('#tooltipevent').css('left', e.pageX + 20);
                          });
                        }
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
                          if($('#tabactive').val() == {/literal}{$tabP2.id_user}{literal}){
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
                          async: true,
                          success: function(json) {
                            $.each(json, function(index, value) {
                                
                              var sJourSemaine = value.joursemaine;
                              var sNbMatin = value.nbmatin;
                              var sNbSoir = value.nbsoir;
                              var sOccupation = value.nboccupation;
                              var thedate = "";

                              var tmpEntete = $("#calendar_"+{/literal}{$tabP2.id_user}{literal}+' .fc-widget-header .fc-'+sJourSemaine).html();
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

                      var $row = $("#calendar_all div.fc-slats table").find("tr");
                      var $tds = $row.children("td:nth-child(1)");

                      var tableau_heure = "<table><tbody>";

                      $.each($tds, function() {
                          tableau_heure += "<tr><td onMouseOver=\"highlightBG(this);\" onMouseOut=\"nohighlightBG(this);\" style='color:transparent;height: 1.5em;text-align: right;padding-right: 2px;'><span style='font-weight:900;'>"+$(this).text()+"</span></td></tr>";
                      });
                      tableau_heure += "</tbody></table>";

                      $('.fc-highlight-container').html(tableau_heure);
                      $('.fc-highlight-container').css('position', 'absolute');
                      $('.fc-scroller').css('overflow-y', 'hidden');
                      headerHeightagenda = $(".fc-head").height();

                      
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
                    element.find("div.fc-content").css( "padding-left", "7px");
                    element.find("div.fc-content").css( "overflow", "hidden");
                    element.find("div.fc-content").css( "text-overflow", "ellipsis");
                    element.find("div.fc-content").css( "-webkit-box-flex", "1");
                    element.find("div.fc-content").css( "-webkit-flex", "1 0 auto");
                    element.find("div.fc-content").css( "-ms-flex", "1 0 auto");
                    element.find("div.fc-content").css( "flex", "1 0 auto");

                    element.find("div.fc-bg").css( "border-left-color", event.couleurrdv);
                    element.find("div.fc-bg").css( "border-left-width", "7px");
                    element.find("div.fc-bg").css( "border-left-style", "solid");
                    element.find("div.fc-bg").css( "border-right-color", "#000");
                    element.find("div.fc-bg").css( "border-right-width", "1px");
                    element.find("div.fc-bg").css( "border-right-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").css( "color", "#000");
                    if(view.name=="listWeek"){
                      if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title+" "+event.commentairerdv);
                      }else{
                          element.find("div.fc-title").html(event.picto+event.title+" "+event.commentairerdv);
                      }
                    }else{
                      if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                      }else{
                          element.find("div.fc-title").html(event.picto+event.title);
                      }
                    }

                    if(event.className=="conge") {
                      element.find("div.fc-bg").css( "border", "0");
                      element.find("div.fc-title").html("<span style='color:#000;'>"+event.title+"</span>");
                    }
                  }else if(event.dispo=="ok"){
                    element.find("div.fc-content").css( "padding-left", "7px");
                    element.find("div.fc-content").css( "overflow", "hidden");
                    element.find("div.fc-content").css( "text-overflow", "ellipsis");
                    element.find("div.fc-content").css( "-webkit-box-flex", "1");
                    element.find("div.fc-content").css( "-webkit-flex", "1 0 auto");
                    element.find("div.fc-content").css( "-ms-flex", "1 0 auto");
                    element.find("div.fc-content").css( "flex", "1 0 auto");

                    element.find("div.fc-bg").css( "border-left-color", event.couleurrdv);
                    element.find("div.fc-bg").css( "border-left-width", "7px");
                    element.find("div.fc-bg").css( "border-left-style", "solid");
                    element.find("div.fc-bg").css( "border-right-color", "#000");
                    element.find("div.fc-bg").css( "border-right-width", "1px");
                    element.find("div.fc-bg").css( "border-right-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").css( "color", "#000");
                    if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                    }else{
                        element.find("div.fc-title").html(event.picto+event.title);
                    }
                  }else if(event.dispo=="not"){
                    element.find("div.fc-content").css( "background", "#ccc");
                    element.find("div.fc-bg").css( "background-color", "#ccc");
                    element.find("div.fc-content").css( "border-top-width", "0px");
                    element.find("div.fc-content").css( "border-top-style", "solid");
                    element.find("div.fc-time").css( "display", "none");
                    element.find("div.fc-time").html("");
                    element.find("div.fc-time").text("");
                    element.find("div.fc-title").css( "color", "#000");
                    if("{/literal}{$afficheheurerdv}{literal}" === "Y"){
                        element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                    }else{
                        element.find("div.fc-title").html(event.picto+event.title);
                    }
                  }

                  {/literal}{if $iAccess == '10'}{literal}
                  if((typeof event.idrdv !== 'undefined') && (event.idrdv != 0)){
                    var menu1 = [
                      {/literal}{if $ibmodule=="0"}{literal}
                      {'Copier - Coller ce rdv': {
                          onclick:function(menuItem,menu) {
                            var sheure = extractContent(event.heureaffiche);
                            var resHeure = sheure.split("-");
                            copier_rdv(event.idrdv+'|'+extractContent(event.nompatient)+'|'+extractContent(event.dateaff)+'|'+resHeure[0]+'|'+extractContent(event.nomdocteur), 'copierdv');
                            $(".menu_custom_alaxione").hide();
                            return true;
                            },
                          title:'Copier - Coller ce rdv'
                        }
                      },
                      {'Couper - Coller ce rdv': {
                          onclick:function(menuItem,menu) {
                            var sheure = extractContent(event.heureaffiche);
                            var resHeure = sheure.split("-");
                            couper_rdv(event.idrdv+'|'+extractContent(event.nompatient)+'|'+extractContent(event.dateaff)+'|'+resHeure[0]+'|'+extractContent(event.nomdocteur), 'copierdv');
                            $(".menu_custom_alaxione").hide();
                            return true;
                            },
                          title:'Couper - Coller ce rdv'
                        }
                      },
                      {/literal}{/if}{literal}
                      {'Rendez vous planifié': {
                          onclick:function(menuItem,menu) {
                            changement_status_rdv(event.idrdv, 'rdvplanifie');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Rendez vous planifié'
                        }
                      },
                      {'Patient en salle d\'attente': {
                          onclick:function(menuItem,menu) {
                            changement_status_rdv(event.idrdv, 'patientensalle');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Patient en salle d\'attente'
                        }
                      },
                      {'Patient en cours d\'examen': {
                          onclick:function(menuItem,menu) {
                            changement_status_rdv(event.idrdv, 'patientencours');
                            $(".menu_custom_alaxione").hide();
                            return true;
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
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          icon:'css/patient_traite_icon.png',
                          title:'Patient traité'
                        }
                      },
                      {/literal}{if isset($bosteo) && $bosteo}{literal}
                      {'Dossier Ostéopathe': {
                          onclick:function(menuItem,menu) {
                              window.location = "main.php?dir=activiteosteo&id_rdv="+event.identifiant_rdv+"&sTypeRetour=calendar";
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Dossier Ostéopathe'
                        }
                      },
                      {/literal}{/if}{literal}
                      {'Profilage du rdv': {
                          onclick:function(menuItem,menu) {
                            //changement_status_rdv(event.idrdv, 'patienttraite');
                            document.getElementById("myModalLabelinfordv").innerHTML="Profilage du RDV : "+event.title;
                            document.getElementById("iframerdv").src="modal/modal_patient_profilage.php?identifiant_rdv="+event.identifiant_rdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                            $('#myModalinfordv').modal('show');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Profilage du rdv'
                        }
                      },
                      {'Encaissement': {
                          onclick:function(menuItem,menu) {
                            document.getElementById("myModalLabelinfordv").innerHTML="Encaissement du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_paiement.php?idrdv="+event.idrdv+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                            $('#myModalinfordv').modal('show');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Encaissement'
                        }
                      },
                      $.contextMenu.separator,
                      {'Déplacer le RDV': {
                          onclick:function(menuItem,menu) {
                            document.getElementById("myModalLabelinfordv").innerHTML="Déplacer le rendez-vous du patient : "+event.title;
                            document.getElementById("iframerdv").src="modal_deplacer_rdv.php?id_patient=&idrdv="+event.idrdv+"&jsEvent="+event.idrdv+"&idcalendar="+{/literal}{$tabP2.id_user}{literal}+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
                            $('#myModalinfordv').modal('show');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          icon:'css/deplacement_icon.png',
                          title:'Déplacer le rendez-vous'
                        }
                      },
                      {'Supprimer le RDV': {
                          onclick:function(menuItem,menu) {
                            del_fiche_rendez_vous(event.idrdv);
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          icon:'css/delete_icon.gif',
                          title:'Supprimer le rendez-vous'
                        }
                      },
                      {'Le praticien annule le RDV': {
                          onclick:function(menuItem,menu) {
                              praticien_annule_rdv(event.idrdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Le praticien annule le RDV'
                        }
                      },

                      {'Communiquer avec le patient': {
                          onclick:function(menuItem,menu) {
                              initialise_praticien_initier_rdv(event.idrdv, event.identifiant_rdv);
                              $(".menu_custom_alaxione").hide();
                              return true;
                          },
                          title:'Communiquer avec le patient'
                        }
                      },
                      $.contextMenu.separator,
                      {'Absence excusée': {
                          onclick:function(menuItem,menu) {
                            bconfirm=confirm('En changeant le statut du rendez vous en "Absence excusée", l\'emplacement sera à nouveau disponible, confirmez-vous le changement ?');
                            if(bconfirm){
                                del_rendez_vous_absence_excusee(event.idrdv);
                            }
                            $(".menu_custom_alaxione").hide();
                            return true;

                          },
                          title:'Absence excusée'
                        }
                      },
                      {'Absence NON excusée': {
                          onclick:function(menuItem,menu) {
                            changement_status_rdv(event.idrdv, 'absencenonexcusee');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Absence NON excusée'
                        }
                      },
                      $.contextMenu.separator,
                      {'Imprimer le RDV': {
                          onclick:function(menuItem,menu) {
                            window.open('print_rdv.php?idrdv='+event.identifiant_rdv,'_blank');
                            $(".menu_custom_alaxione").hide();
                            return true;
                          },
                          title:'Imprimer le rendez-vous'
                        }
                      }
                    ];


                    element.bind('mousedown', function (e) {
                        if (e.which == 3) {

                            $(".menu_custom_alaxione").hide();
                            element.contextMenu(menu1,{
                                className:'menu_custom_alaxione',
                                theme:'gloss',
                                showSpeed:200,
                                hideSpeed:200,
                                showTransition:'fadeIn',
                                hideTransition:'fadeOut',
                                shadow:false,
                                useIframe:false
                            });
                        }
                    });



                  }else{
                    var menu2 = [
                      {'Aucune action disponible': {
                          title:'Aucune action disponible'
                        }
                      }
                    ];

                    element.bind('mousedown', function (e) {
                      if (e.which == 3) {
                          $(".menu_custom_alaxione").hide();
                          element.contextMenu(menu2,{
                              className:'menu_custom_alaxione',
                              theme:'gloss',
                              showSpeed:200,
                              hideSpeed:200,
                              showTransition:'fadeIn',
                              hideTransition:'fadeOut',
                              shadow:false,
                              useIframe:false
                          });
                      }
                    });


                  }


                  {/literal}{else}{literal}

                  var menu3 = [
                      {'Aucune action disponible': {
                          title:'Aucune action disponible'
                        }
                      }
                    ];

                    element.bind('mousedown', function (e) {
                      if (e.which == 3) {
                          $(".menu_custom_alaxione").hide();
                          element.contextMenu(menu3,{
                              className:'menu_custom_alaxione',
                              theme:'gloss',
                              showSpeed:200,
                              hideSpeed:200,
                              showTransition:'fadeIn',
                              hideTransition:'fadeOut',
                              shadow:false,
                              useIframe:false
                          });
                      }
                    });
                  {/literal}{/if}{literal}

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


<div class="modal fade" id="myModalNoInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 10000;">
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
          <form class="form-horizontal" action="" role="form" id="formList1" method="GET" >
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
                    <div id="bookingBoxdatepicker-widget" style="position: absolute;z-index: 1;"></div>
                    {literal}
                    <script type="text/javascript">
                      $("#datepicker-widget").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        onSelect: function(date){
                          document.getElementById('iddateplanning').value=date;
                        },
                        beforeShow:function(textbox, instance){
                          $('#ui-datepicker-div').css({
                              position: 'initial',
                              top:-20,
                              left:5
                          });
                          $('#bookingBoxdatepicker-widget').append($('#ui-datepicker-div'));
                          $('#ui-datepicker-div').hide();
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
                    <div id="bookingBoxdatepickerrdv-widget" style="position: absolute;z-index: 1;"></div>
                    {literal}
                    <script type="text/javascript">
                      $("#datepickerrdv-widget").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        onSelect: function(date){
                          document.getElementById('iddateplanningrdv').value=date;
                        },
                        beforeShow:function(textbox, instance){
                          $('#ui-datepicker-div').css({
                              position: 'initial',
                              top:-20,
                              left:5
                          });
                          $('#bookingBoxdatepickerrdv-widget').append($('#ui-datepicker-div'));
                          $('#ui-datepicker-div').hide();
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
                        <b>Quel est le professionnel de santé ?</b>
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

<!-- [DEBUT] Modal enregistrer un rendez-vous  -->
<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalEnregistrerRendezVous" tabindex="-1" role="dialog" aria-labelledby="LabelmodalEnregistrerRendezVous" aria-hidden="false">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="LabelmodalEnregistrerRendezVous">Prendre un rendez-vous</h4>
      </div>
      <div class="modal-body">
        <div id="message_retour_info_enregistrer_rendez_vous" style="margin-top:15px; display: none;"></div>

        <div id="attente_info_enregistrer_rendez_vous" style="display: none;">
          <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
        </div>

        <div id="div_info_enregistrer_rendez_vous" >
          <div class="col-sm-12" style="padding-top:10px;">

          <div id="divMessageRemplacant"  class="alert alert-warning" style="display: none;">
              <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
              <span id="sMessageRemplacant" name="sMessageRemplacant"></span>
          </div>

            <form class="form-horizontal" action="#" role="form" id="modal_enregistrer_rdv" name="modal_enregistrer_rdv" autocomplete="new-password" >
              <input type="hidden" name="id_tmp_del" id="id_tmp_del" value="">
              <div class="form-group" {if $rdv_prive_actif!='Y'}style="display:none;"{/if}>
                <div class="col-sm-6 controls">
                  <div class="label-wrapper-modal">
                    <label class="control-label">RDV privé :</label>
                  </div>
                  <div class="vd_radio radio-success">
                    <input type="radio" name="prive_prendre_rdv_calendar" value="Y" id="id_prive_prendre_rdv_calendar_oui">
                    <label for="id_prive_prendre_rdv_calendar_oui">Oui</label>
                    <input type="radio" name="prive_prendre_rdv_calendar" checked="checked" value="N" id="id_prive_prendre_rdv_calendar_non">
                    <label for="id_prive_prendre_rdv_calendar_non">Non</label>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-6 controls">
                  <select id="id_praticien_prendre_rdv_calendar" name="id_praticien_prendre_rdv_calendar" required {if $bblocageall} disabled{/if}>
                    <option value="">Choisir un praticien</option>
                    {foreach from=$tabPraticienPermanent item=objPraticien}
                      <option value="{$objPraticien.identifiant_user}" >{$objPraticien.abreviation_civilite} {$objPraticien.nom_user} {$objPraticien.prenom_user}</option>
                    {/foreach}
                  </select>
                </div>
                <div class="col-sm-6 controls">
                  <select id="type_rdv_calendar" name="type_rdv_calendar" required onchange="select_tmp(this.value)" {if $bblocageall} disabled{/if}>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <div class="col-sm-6 controls">
                  <select id='id_lieu_prendre_rdv_calendar' name="id_lieu_prendre_rdv_calendar" required {if $bblocageall} disabled{/if}>
                    {*<option value="">Choisir un lieu de RDV</option>
                    {foreach from=$aTableauLieux item=aItemLieu}
                      <option value="{$aItemLieu.id_lieux}">{$aItemLieu.nom_lieux}</option>
                    {/foreach}*}
                  </select>
                </div>
                <div class="col-sm-6 controls">
                  {if !$bblocageall}
                    {if !$bblocagetyperdv}
                      <button type="button" name="btn_plus_rdv_modal_calendar" id="btn_plus_rdv_modal_calendar" class="btn vd_btn vd_bg-green" onclick="if(plus_motif_rdv)ajout_tout_rdv();plus_motif_rdv=false;"><span class="menu-icon"></span>Plus de motif de RDV</button>&nbsp;&nbsp;
                    {/if}
                  {/if}
                </div>
              </div>


              <div class="form-group">
                <div class="col-sm-3 controls">
                  <label class="control-label">Date</label>
                  <div class="input-group">
                    <input type="text" id="date_prendre_rdv_calendar" name="date_prendre_rdv_calendar" value="" {if $bblocageall}readonly="readonly"{/if}>
                    <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#date_prendre_rdv_calendar"><i class="fa fa-calendar"></i></span>
                  </div>
                  <div id="bookingBoxdate_prendre_rdv_calendar" style="position: absolute;z-index: 2;"></div>
                  {if !$bblocageall}
                    {literal}
                      <script type="text/javascript">
                        $(document).ready(function() {
                          $( "#date_prendre_rdv_calendar" ).datepicker({
                            dateFormat: 'dd/mm/yy',
                            changeMonth: true,
                            changeYear: true,
                            yearRange: "-0:+10",
                            beforeShow:function(textbox, instance){
                              $('#ui-datepicker-div').css({
                                  position: 'initial',
                                  top:-20,
                                  left:5
                              });
                              $('#bookingBoxdate_prendre_rdv_calendar').append($('#ui-datepicker-div'));
                              $('#ui-datepicker-div').hide();
                            }
                          });
                          $( '[data-datepicker]' ).click(function(e){
                            var data=$(this).data('datepicker');
                            $(data).focus();
                          });
                        });
                      </script>
                    {/literal}
                  {/if}
                </div>
                <div class="col-sm-3">
                  <label class="control-label">Heure patient</label>
                  <div class="input-group bootstrap-timepicker">
                    <input class="input-modal-date-left" type="text" id="heure_patient_prendre_rdv_calendar" name="heure_patient_prendre_rdv_calendar" value="" {if $bblocageall}readonly="readonly"{/if}>
                    <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                  </div>
                  {literal}
                      <script type="text/javascript">
                          $(document).ready(function () {
                              $("#heure_patient_prendre_rdv_calendar").clockpicker({
                                  placement: 'bottom',
                                  autoclose: true
                              });
                              $("#heure_patient_prendre_rdv_calendar").mask("99:99");
                          });

                      </script>
                    {/literal}
                </div>
                <div class="col-sm-3 controls">
                  <label class="control-label">Heure réelle</label>
                  <div class="input-group bootstrap-timepicker">
                    <input class="input-modal-date-left" type="text" id="heure_reelle_prendre_rdv_calendar" name="heure_reelle_prendre_rdv_calendar" value="" {if $bblocageall}readonly="readonly"{/if}>
                    <span class="input-group-addon input-modal-date-right" id="timepicker-default-span"><i class="fa fa-clock-o"></i></span>
                    {literal}
                      <script type="text/javascript">
                          $(document).ready(function () {
                              $("#heure_reelle_prendre_rdv_calendar").clockpicker({
                                  placement: 'bottom',
                                  autoclose: true
                              });
                              $("#heure_reelle_prendre_rdv_calendar").mask("99:99");
                          });

                      </script>
                    {/literal}
                  </div>
                </div>
                <div class="col-sm-3">
                  <label class="control-label">Durée&nbsp; (en min.)</label>
                  <div class="controls">
                    <input name="temps_consultation_calendar" id="temps_consultation_calendar" type="number" value="" min="0" max="720" {if $boplus or $bblocageall}readonly="readonly"{/if}>

                  </div>
                </div>

              </div>
              <div class="form-group" id="div_teleconsult_prendre_rdv_calendar">
                  <div class="col-sm-6 controls">
                  <div class="label-wrapper-modal" style="float: left;">
                    <label class="control-label">RDV en Téléconsultation :</label>
                  </div>
                      <div class="controls" >
                          <select id="teleconsult_prendre_rdv_calendar" name="teleconsult_prendre_rdv_calendar">
                              <option value="Y">Oui</option>
                              <option value="N" selected>Non</option>
                          </select>
                      </div>
                  </div>
                  <div class="col-sm-6 controls" id="div_montant_teleconsult_prendre_rdv_calendar" style="display: none">
                    <div class="label-wrapper-modal" >
                      <label class="control-label">Montant de la téléconsultation :</label>
                    </div>
                    <div class="input-group">
                      <input type="text" id="montant_teleconsult_prendre_rdv_calendar" name="montant_teleconsult_prendre_rdv_calendar" >
                      <span class="input-group-addon">€</span>
                    </div>
                  </div>
              </div>
              <hr>
              <div class="form-group" style="margin-bottom: 5px;">
                <div class="col-sm-12 controls" >
                    <div class="col-sm-8" style="padding-left: 0px;">
                        <h3><a href="javascript:void(0);" onclick="reduire_div_information_patient();"><i class="fa fa-chevron-circle-down"></i>&nbsp;</a> Informations du patient</h3>
                    </div>
                    <div class="col-sm-4" style="padding-right: 0px;" id="div_title_historique">
                        <h3>Historique des RDV</h3>
                    </div>

                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-12 controls" id="divtempcheckpatient_calendar" style="display:none;"></div>
                <div class="col-sm-12 controls" id="divenregpatient_calendar">

                  <div id="div_info_patient_historique_complet">
                    <div class="form-group" style="margin-bottom: 5px;">
                      <div class="col-sm-12 controls" style="display:none;" id="div_reinit_calendar">
                        <a href="#" onclick="debloque_modification_patient_modal_prendre_rendez_vous_calendar();return false;"><i class="fa fa-pencil"></i> Modifier la fiche patient</a> - <a href='#' onclick="reinitialise_modal_prendre_rendez_vous_calendar();return false;" >Réinitialiser</a>
                      </div>
                    </div>
                    <div class="col-sm-12" style="padding-right: 0px;padding-left: 0px;" id="div_info_patient_historique">
                      <div class="col-sm-8" style="padding-left: 0px;">
                        <div class="form-group">
                          <div class="col-sm-3 controls">
                            <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                              <select id="civilite_patient_prendre_rdv_calendar" name="civilite_patient_prendre_rdv_calendar" required class="required" style="border-color: red;">
                                <option value="" disabled selected hidden>Civilité</option>
                                {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                  <option value="{$tabLC.id_civilite}">{$tabLC.abreviation_civilite}</option>
                                {/foreach}
                              </select>
                            </div>
                          </div>
                          <div class="col-sm-5 controls">
                            <input type="text" placeholder="Nom" name="nom_patient_prendre_rdv_calendar" id="nom_patient_prendre_rdv_calendar" value="" required style="border-color: red;" class="required input-majuscule input-widget" autocomplete="new-password" />
                            <input type="hidden" name="id_patient_prendre_rdv_calendar" id="id_patient_prendre_rdv_calendar">
                            {literal}
                              <!-- Script pour l'auto-completion -->
                              <script type="text/javascript" >
                                $("#nom_patient_prendre_rdv_calendar").autocomplete({
                                  source : 'ajax/recherche_fiche_patient_auto_complete.php',
                                  focus: function (event, ui) {
                                    event.preventDefault();
                                  },
                                  select: function (event, ui) {
                                    event.preventDefault();
                                    getInfoPatientModalPrendreRDVCalendar(ui.item.value);
                                  },
                                  appendTo: "#modalEnregistrerRendezVous"
                                });
                              </script>
                            {/literal}
                          </div>
                          <div class="col-sm-4 controls">
                            <input type="text" placeholder="Prénom" name="prenom_patient_prendre_rdv_calendar" id="prenom_patient_prendre_rdv_calendar" value="" required style="border-color: red;" class="required input-first-letter input-widget" autocomplete="new-password" />
                          </div>
                        </div>
                        <div class="form-group" id='divnomjeunefille_patient_prendre_rdv_calendar' style='display:none;'>
                          <div class="col-sm-12 controls">
                            <input type="text" placeholder="Nom de naissance" name="nom_jeune_fille_patient_prendre_rdv_calendar" id="nom_jeune_fille_patient_prendre_rdv_calendar" value="" class="input-majuscule input-widget" />
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-12 controls">
                            <input type="text" placeholder="Adresse" name="adresse_patient_prendre_rdv_calendar" id="adresse_patient_prendre_rdv_calendar" value="" class="input-widget" />
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-6 controls">
                            <input type="text" placeholder="Code postal" name="code_postal_patient_prendre_rdv_calendar" id="code_postal_patient_prendre_rdv_calendar" value="" class="input-widget" />
                          </div>
                          <div class="col-sm-6 controls">
                            <input type="text" placeholder="Ville" name="ville_patient_prendre_rdv_calendar" id="ville_patient_prendre_rdv_calendar" value="" class="input-majuscule input-widget" />
                          </div>
                        </div>

                        <div class="form-group">
                          <div class="col-sm-6 controls">
                            <input type="hidden" name="tel_mobile_patient_prendre_rdv_calendar_indicatif" id="tel_mobile_patient_prendre_rdv_calendar_indicatif" value="">
                            <input type="text" placeholder="Téléphone mobile" name="tel_mobile_patient_prendre_rdv_calendar" id="tel_mobile_patient_prendre_rdv_calendar" value="" class="input-widget" />
                            {literal}
                              <script type="text/javascript">
                                  $(document).ready(function () {
                                      $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput({
                                          preferredCountries:["fr", "be", "ch"],
                                          initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                          utilsScript: "js/utils.js"
                                      });
                                      $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                      var countryDataInit = $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").intlTelInput("getSelectedCountryData");
                                      $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").val(countryDataInit.dialCode);

                                      $("#tel_mobile_patient_prendre_rdv_calendar").on("keyup change", function() {
                                          var countryData = $("#tel_mobile_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                          $("#tel_mobile_patient_prendre_rdv_calendar_indicatif").val(countryData.dialCode);
                                      });

                                      $("#tel_mobile_patient_prendre_rdv_calendar").on("countrychange", function(e, countryData) {
                                          var idpays = countryData.iso2;
                                          if(idpays === "fr"){
                                              $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                          }else if(idpays === "ch"){
                                              $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("999 999 99 99");
                                          }
                                      });
                                  });
                              </script>
                              {/literal}
                          </div>
                          <div class="col-sm-6 controls">
                            <input type="hidden" name="tel_fixe_patient_prendre_rdv_calendar_indicatif" id="tel_fixe_patient_prendre_rdv_calendar_indicatif" value="">
                            <input type="text" placeholder="Téléphone fixe" name="tel_fixe_patient_prendre_rdv_calendar" id="tel_fixe_patient_prendre_rdv_calendar" value="" class="input-widget" />
                              {literal}
                              <script type="text/javascript">
                                  $(document).ready(function () {
                                      $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput({
                                          preferredCountries:["fr", "be", "ch"],
                                          initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                          utilsScript: "js/utils.js"
                                      });
                                      $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                      var countryDataInit = $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                      $("#tel_fixe_patient_prendre_rdv_calendar_indicatif").val(countryDataInit.dialCode);

                                      $("#tel_fixe_patient_prendre_rdv_calendar").on("keyup change", function() {
                                          var countryData = $("#tel_fixe_patient_prendre_rdv_calendar").intlTelInput("getSelectedCountryData");
                                          $("#tel_fixe_patient_prendre_rdv_calendar_indicatif").val(countryData.dialCode);
                                      });

                                      $("#tel_fixe_patient_prendre_rdv_calendar").on("countrychange", function(e, countryData) {
                                          var idpays = countryData.iso2;
                                          if(idpays === "fr"){
                                              $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                                          }else if(idpays === "ch"){
                                              $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("999 999 99 99");
                                          }
                                      });
                                  });
                              </script>
                              {/literal}
                          </div>
                        </div>

                        <div class="form-group">
                          <div class="col-sm-12 controls">
                            <input type="email" placeholder="Email" name="email_patient_prendre_rdv_calendar" id="email_patient_prendre_rdv_calendar" value="" class="input-widget" />
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-4 controls">
                            <div class="input-group">
                              <input type="text" placeholder="Date de naissance" name="date_naissance_patient_prendre_rdv_calendar" id="date_naissance_patient_prendre_rdv_calendar" value="" class="required input-widget-date-left" required style="border-color: red;">
                              <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#date_naissance_patient_prendre_rdv_calendar">
                                              <i class="fa fa-calendar"></i>
                                            </span>
                            </div>
                            <div id="bookingBoxdate_naissance_patient_prendre_rdv_calendar" style="position: absolute;z-index: 1;"></div>
                          </div>
                          {literal}
                            <script type="text/javascript">
                              $(document).ready(function() {
                                $( "#date_naissance_patient_prendre_rdv_calendar" ).datepicker({
                                  dateFormat: 'dd/mm/yy',
                                  changeMonth: true,
                                  changeYear: true,
                                  yearRange: "-100:+0",
                                  beforeShow:function(textbox, instance){
                                    $('#ui-datepicker-div').css({
                                        position: 'initial',
                                        top:-20,
                                        left:5
                                    });
                                    $('#bookingBoxdate_naissance_patient_prendre_rdv_calendar').append($('#ui-datepicker-div'));
                                    $('#ui-datepicker-div').hide();
                                  }
                                });
                                $( '[data-datepicker]' ).click(function(e){
                                  var data=$(this).data('datepicker');
                                  $(data).focus();
                                });
                              });
                            </script>
                          {/literal}
                          <div class="col-sm-4 controls">
                            <input type="text" onkeyup="checkInsee(this);" placeholder="N° de sécurité sociale" name="num_secu_patient_prendre_rdv_calendar" id="num_secu_patient_prendre_rdv_calendar" value="" class="input-widget" />
                          </div>
                          <div class="col-sm-4 controls">
                            <div class="vd_input-wrapper-compte" style="margin:0px;font-weight:400">
                              <select placeholder="Assurance maladie" id="assurance_patient_prendre_rdv_calendar" name="assurance_patient_prendre_rdv_calendar">
                                <option value="">Veuillez choisir une assurance</option>
                                {foreach from=$TabAssurance item=objAssurance}
                                  <option value="{$objAssurance.id_assurance_maladie}">{$objAssurance.libelle_assurance_maladie}</option>
                                {/foreach}
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-6 controls">
                            <input type="text" placeholder="Médecin traitant" name="medecin_traitant_patient_prendre_rdv_calendar" id="medecin_traitant_patient_prendre_rdv_calendar" value="" class="input-widget" />
                          </div>
                          <div class="col-sm-6 controls">
                            <input type="text" placeholder="Ville du médecin" name="ville_medecin_patient_prendre_rdv_calendar" id="ville_medecin_patient_prendre_rdv_calendar" value="" class="input-widget" />
                          </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6 controls">
                                <div class="input-group">
                                    <select id="couleur_patient_prendre_rdv_calendar">
                                        <option value="">Couleur du patient</option>
                                        <option value="008000" style="color:#FFFFFF; background-color: #008000">Vert</option>
                                        <option value="FF8D01" style="color:#FFFFFF; background-color: #FF8D01">Orange</option>
                                        <option value="FF0000" style="color:#FFFFFF; background-color: #FF0000">Rouge</option>
                                    </select>
                                    <span id="cadre_couleur_patient_prendre_rdv_calendar" class="input-group-addon color-input"><i class="fa fa-square"></i></span>
                                </div>
                            </div>
                            <div class="col-sm-6 controls">
                                <input type="text" placeholder="Profession" name="profession_patient_prendre_rdv_calendar" id="profession_patient_prendre_rdv_calendar" value="" class="input-widget" />
                            </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-12 controls">
                            <textarea placeholder="Remarque" name="remarque_patient_prendre_rdv_calendar" id="remarque_patient_prendre_rdv_calendar" class="input-widget" ></textarea>
                          </div>
                        </div>


                        {if !$bismoduleexterne}
                        <div class="form-group">
                          <div class="col-sm-12 controls">
                            <div class="label-wrapper-modal" style="float: left;">
                              <label class="control-label">Définir un RDV récurrent :</label>
                            </div>
                            <div class="controls" style="margin-left:10px;float: left;">
                              <select id="recurrent_prendre_rdv_calendar">
                                  <option value="N" selected>Non</option>
                                  <option value="Y">Oui</option>
                              </select>
                            </div>
                          </div>
                        </div>
                        {/if}
                      </div>
                      <div class="col-sm-4" style="padding-right: 0px;padding-left: 0px;">
                        <div class="col-sm-12" style='padding-right: 0px;padding-left: 0px;'>
                            <div id="attente_historique_patient_prendre_rdv_calendar" style="display: none;">
                                <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                            </div>
                            <div id='pas_historique_patient_prendre_rdv_calendar' style="display: none;">
                                <div class="alert alert-info">
                                    <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                    Aucun historique disponible
                                </div>
                            </div>
                            <div id='historique_patient_prendre_rdv_calendar' style="display: none;">
                                <div id="menu_historique_patient" class="col-sm-12" style="padding-right: 0px;padding-left: 0px;">
                                    <a href="javascript:void(0);" data-filter=".patienttraite">
                                        <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:lime;height:45px;">
                                            <b id="libelle_rdv_traite" title="Patient traité" style="vertical-align: -webkit-baseline-middle;">Tr.</b>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);" data-filter=".rdvplanifie">
                                        <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:#27a1c2;height:45px;">
                                            <b id="libelle_rdv_planifie" title="Rendez-vous planifié" style="vertical-align: -webkit-baseline-middle;">Pl.</b>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);" data-filter=".absenceexcusee">
                                        <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:orange;height:45px;">
                                            <b id="libelle_rdv_ab_excusee" title="Absence Excusée" style="vertical-align: -webkit-baseline-middle;">Abs. Ex.</b>
                                        </div>
                                    </a>
                                    <a href="javascript:void(0);" data-filter=".absencenonexcusee">
                                        <div align="center" class="col-sm-3" style="padding-right: 0px;padding-left: 0px;color:#FFFFFF;background-color:red;height:45px;">
                                            <b id="libelle_rdv_ab_non_excusee" title="Absence Non Excusée" style="">Abs. Non Ex.</b>
                                        </div>
                                    </a>
                                </div>
                                  <div class="col-sm-12" id="boucle_historique_prendre_rdv_calendar" style="padding-right: 0px; padding-left: 0px;max-height: 450px;overflow: auto;"></div>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-12" id="div_recurrence_perso" style="display: none;">
                    <div class="form-group">
                      <div class="col-sm-12 controls">
                        <h1>Récurrence personnalisée</h1>

                        <div id="div_repete_toutes_les" class="col-sm-12 controls">
                          <label class="control-label" style="float: left;"><b>Répéter tou(te)s les </b></label>
                          <div class="controls" style="margin-left:10px;float: left;">
                            <input type="number" name="recurrent_nb_repete_prendre_rdv_calendar" id="recurrent_nb_repete_prendre_rdv_calendar" min="1" value="1">
                          </div>
                          <div class="controls" style="margin-left:10px;float: left;">
                            <select id="recurrent_select_repete_prendre_rdv_calendar">
                                <option value="jour">Jour</option>
                                <option value="semaine" selected >Semaine</option>
                                <option value="mois">Mois</option>
                                <option value="annee">Année</option>
                            </select>
                          </div>
                        </div>

                        <div id="div_repete_le" class="col-sm-12 controls">
                            <label class="control-label"><b>Répéter le</b></label>
                            <div>
                                <div class="vd_radio radio-success">
                                    <input id="checkbox-Lundi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="1">
                                    <label for="checkbox-Lundi"> Lundi </label>

                                    <input id="checkbox-Mardi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="2">
                                    <label for="checkbox-Mardi"> Mardi </label>

                                    <input id="checkbox-Mercredi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="3">
                                    <label for="checkbox-Mercredi"> Mercredi </label>

                                    <input id="checkbox-Jeudi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="4">
                                    <label for="checkbox-Jeudi"> Jeudi </label>

                                    <input id="checkbox-Vendredi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="5">
                                    <label for="checkbox-Vendredi"> Vendredi </label>

                                    <input id="checkbox-Samedi" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="6">
                                    <label for="checkbox-Samedi"> Samedi </label>

                                    <input id="checkbox-Dimanche" type="radio" name="recurrent_repeter_le_prendre_rdv_calendar" value="7">
                                    <label for="checkbox-Dimanche"> Dimanche </label>
                                </div>
                            </div>
                        </div>

                        <div id="div_repete_se_termine" class="col-sm-12 controls">
                          <label class="control-label"><b>Se termine</b></label>
                          <div>
                            {*<div class="vd_radio radio-success">
                              <input type="radio" name="recurrent_termine_prendre_rdv_calendar" checked="checked" value="jamais" id="id_recurrent_termine_prendre_rdv_calendar_jamais">
                              <label for="id_recurrent_termine_prendre_rdv_calendar_jamais">Jamais</label>
                            </div>*}
                            <div class="vd_radio radio-success" style="margin-top: 5px;">
                              <input type="radio" name="recurrent_termine_prendre_rdv_calendar" value="le" id="id_recurrent_termine_prendre_rdv_calendar_le" style="float: left;">
                              <label for="id_recurrent_termine_prendre_rdv_calendar_le" style="float: left;">Le</label>
                              <div class="col-sm-4 input-group">
                                <input type="text" placeholder="" name="reccurent_date_fin_patient_prendre_rdv_calendar" id="reccurent_date_fin_patient_prendre_rdv_calendar" value="" class="input-widget-date-left">
                                <span class="input-group-addon input-widget-date-right" id="datepicker-icon-trigger" data-datepicker="#reccurent_date_fin_patient_prendre_rdv_calendar"><i class="fa fa-calendar"></i></span>
                              </div>
                              <div id="bookingBoxreccurent_date_fin_patient_prendre_rdv_calendar" style="position: absolute;z-index: 1;"></div>
                              {literal}
                                <script type="text/javascript">
                                  $(document).ready(function() {
                                    $( "#reccurent_date_fin_patient_prendre_rdv_calendar" ).datepicker({
                                      dateFormat: 'dd/mm/yy',
                                      changeMonth: true,
                                      changeYear: true,
                                      beforeShow:function(textbox, instance){
                                        $('#ui-datepicker-div').css({
                                            position: 'initial',
                                            top:-20,
                                            left:5
                                        });
                                        $('#bookingBoxreccurent_date_fin_patient_prendre_rdv_calendar').append($('#ui-datepicker-div'));
                                        $('#ui-datepicker-div').hide();
                                      }
                                    });
                                    $( '[data-datepicker]' ).click(function(e){
                                      var data=$(this).data('datepicker');
                                      $(data).focus();
                                    });
                                  });
                                </script>
                              {/literal}
                            </div>
                            <div class="vd_radio radio-success" style="margin-top: 5px;">
                              <input type="radio" name="recurrent_termine_prendre_rdv_calendar" checked="checked" value="apres" id="id_recurrent_termine_prendre_rdv_calendar_apres">
                              <label for="id_recurrent_termine_prendre_rdv_calendar_apres" style="float: left;">Après</label>
                              <div class="controls" style="margin-left:10px;float: left;">
                                <input type="number" name="recurrent_occurence_prendre_rdv_calendar" id="recurrent_occurence_prendre_rdv_calendar" min="2" value="2">
                              </div>
                              <div class="controls" style="margin-left:10px;float: left;"> occurence(s)</div>
                            </div>
                          </div>
                        </div>
                        <div class="col-sm-12 controls" style="margin-top: 10px;">
                          <div class="label-wrapper-modal" style="float: left;">
                            <label class="control-label">Forcer les rdv :</label>
                          </div>
                          <div class="controls" style="margin-left:10px;float: left;">
                            <select id="recurrent_forcer_rdv_calendar">
                                <option value="N" selected>Non</option>
                                <option value="Y">Oui</option>
                            </select>
                          </div>
                        </div>
                        <div id="div_btn_generer_rdv_recurrent" class="col-sm-12 controls" style="text-align: center;">
                          <button id="btn_generer_rdv_recurrent" name="btn_generer_rdv_recurrent" type="button" class="btn vd_btn btn_widget_standard">Générer les rdv récurrents <span class="menu-icon"><i class="fa fa-fw fa-refresh"></i></span></button>
                        </div>
                        <div id="div_liste_rdv_generer" class="col-sm-12 controls" style="margin-bottom: 25px;text-align: center;padding-top: 20px;">
                        </div>

                      </div>
                    </div>
                  </div>

                  <div class="col-sm-12" align="center" id="div_button_update_patient_calendar" style="display:none;">
                    <hr style="border-top: 1px solid #b9b3b3;">
                    <div class="col-sm-12 controls" align="center">
                      <button type="button" onclick="modification_patient_modal_prendre_rendez_vous_calendar();" name="updateButtonPatient_prendre_rdv_calendar" id="updateButtonPatient_prendre_rdv_calendar" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier</button>
                    <button type="button" id="btn_annuler_patient_enregistrer_rendez_vous" name="btn_annuler_patient_enregistrer_rendez_vous" onclick="getInfoPatientModalPrendreRDVCalendar($('#id_patient_prendre_rdv_calendar').val());" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Annuler</button>
                    </div>
                  </div>

                  <div class="col-sm-12" align="center" id="div_button_suivant_calendar">
                    <hr style="border-top: 1px solid #b9b3b3;">
                    <button type="submit" id="btn_check_patient_prendre_rdv_calendar" name="btn_check_patient_prendre_rdv_calendar" class="btn vd_btn btn_widget_standard"><span class="menu-icon">Valider<i class="fa fa-fw fa-chevron-circle-right"></i></span></button>&nbsp;&nbsp;
                    <button id="btn_check_patient_prendre_rdv_print_calendar" name="btn_check_patient_prendre_rdv_print_calendar" type="submit" class="btn vd_btn btn_widget_standard">Valider et Imprimer <span class="menu-icon"><i class="fa fa-fw fa-print"></i></span></button>&nbsp;&nbsp;
                    <button type="button" id="btn_fermer_enregistrer_rendez_vous" name="btn_fermer_enregistrer_rendez_vous" onclick="$('#modalEnregistrerRendezVous').modal('hide');" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Annuler</button>
                  </div>
                </div>
              </div>

          </form>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
  </div>
</div>
<!-- [FIN] Modal enregistrer un rendez-vous -->




{literal}
<script type="text/javascript">

  var tableau_data = new Array();
  var tableau_autre = new Array();
  var plus_motif_rdv = true;

  var button_valid_and_print_calendar = "";

  function getConsigne(idp_consigne, nb_tab) {
    $('#id_consigne_'+nb_tab).hide();
    $('#nb_consigne_'+nb_tab).hide();
    $('#nb_consigne_'+nb_tab).html("");

    $.ajax({
      url: 'ajax/liste_consignes.php',
      data: 'idp=' + idp_consigne,
      dataType: 'json',
      async: true,
      cache: false,
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
            $('#id_consigne_'+nb_tab).show();
            $('#nb_consigne_'+nb_tab).show();
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
    var tabid = new Array();
    document.getElementById("top-menu-salle-attente").style.display = "block";

    var nb_tab_active = $('#tabactive').val();
    if(nb_tab_active==""){
      tabid.push($('#id_praticien_1').val());
    }else if (nb_tab_active==="all"){
      {/literal}{foreach from=$tabPraticien item=tabSP name=sTabSallePraticien}{literal}
      tabid.push({/literal}{$tabSP.id_user}{literal});
      {/literal}{/foreach}{literal}
    }else{
      tabid.push($('#id_praticien_'+nb_tab_active).val());
    }

    $.ajax({
      url: 'ajax/get_salle_attente.php',
      data: 'idp='+tabid+'&tri='+$('#trie_salle_attente').val(),
      dataType: 'json',
      async: true,
      cache: false,
      success: function(json) {
        $.each(json, function(index, value) {
          var text = "";
          var picto = "";

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

            picto = "";
            if(value.tab3[i]['ouverture_telconsullt_prise_rendez_vous'] == 'Y'){
                picto = '<span title="Téléconsultation" style="font-size: small;"><i style="padding:2px;color:#DDDDDD;display: inline-block;text-align: center;" class="fa fa-video-camera"></i></span>&nbsp;';
            }

            text +="<li "+sstyle+" id='item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab3[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: #DDDDDD;'>"+picto+value.tab3[i]['civilite']+" "+value.tab3[i]['nom']+" "+value.tab3[i]['prenom']+" ( "+value.tab3[i]['temps_en_cours']+" )";
            text +="<div class='menu-info'><span class='menu-date'>En cours depuis "+value.tab3[i]['heure_en_cours']+" </span> | <span class='menu-date'>Prévu à "+value.tab3[i]['heure_prevu']+" </span></div>";
            text +="</div></a></li>";
            text +="<script type='text/javascript'>";
            text +="var menu_salle_attente_en_cours_"+value.tab3[i]['id_prise_rendez_vous']+" = ["+
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
            //text +="$('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_en_cours,{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});";
            text +="$('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').bind('mousedown', function (e) { if (e.which == 3) { $(\".menu_custom_alaxione\").hide(); $('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_en_cours_"+value.tab3[i]['id_prise_rendez_vous']+",{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});} });";

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

            picto = "";
            if(value.tab[i]['ouverture_telconsullt_prise_rendez_vous'] == 'Y'){
                picto = '<span title="Téléconsultation" style="font-size: small;"><i style="padding:2px;color:#27A1C2;display: inline-block;text-align: center;" class="fa fa-video-camera"></i></span>&nbsp;';
            }

            text +="<li "+sstyle1+" id='item_sa_"+value.tab[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: #27A1C2;'>"+picto+value.tab[i]['civilite']+" "+value.tab[i]['nom']+" "+value.tab[i]['prenom']+" ( "+value.tab[i]['temps_attente']+" )";
            text +="<div class='menu-info'><span class='menu-date'>Arrivé à "+value.tab[i]['heure_arrive']+" </span> | <span class='menu-date'>Prévu à "+value.tab[i]['heure_prevu']+" </span></div>";
            text +="</div></a></li>";
            text +="<script type='text/javascript'>";
            text +="var menu_salle_attente_"+value.tab[i]['id_prise_rendez_vous']+" = ["+
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
              "}";

            if(value.tab[i]['linkteleconsultation'] === null || value.tab[i]['linkteleconsultation'] == ""){
            //rien
            }else{
              text += ",{\"Lancer la téléconsultation\": {"+
                  "onclick:function(menuItem,menu) { "+
                    "changement_status_rdv("+value.tab[i]['id_prise_rendez_vous']+", 'patientencours');"+
                    "openInNewTab('"+encodeURI(value.tab[i]['linkteleconsultation'])+"'); "+
                  "}, "+
                  "title:\"Lancer la téléconsultation\" "+
                "}"+
              "}";
            }

            text += "];";


            //text +="$('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente,{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});";
            text +="$('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').bind('mousedown', function (e) { if (e.which == 3) { $(\".menu_custom_alaxione\").hide(); $('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_"+value.tab[i]['id_prise_rendez_vous']+",{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});} });";

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

            picto = "";
            if(value.tab2[i]['ouverture_telconsullt_prise_rendez_vous'] == 'Y'){
                picto = '<span title="Téléconsultation" style="font-size: small;"><i style="padding:2px;color:#red;display: inline-block;text-align: center;" class="fa fa-video-camera"></i></span>&nbsp;';
            }

            text +="<li "+sstyle2+" id='item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab2[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: red;'>"+picto+value.tab2[i]['civilite']+" "+value.tab2[i]['nom']+" "+value.tab2[i]['prenom'];
            text +="<div class='menu-info'><span class='menu-date'>Prévu à "+value.tab2[i]['heure_prevu']+" ( <span class='menu-date' style='color:red;''>"+value.tab2[i]['temps_retard']+"</span> de retard )</span></div>";
            text +="</div></a></li>";
            text +="<script type='text/javascript'>";
            text +="var menu_salle_attente_retard_"+value.tab2[i]['id_prise_rendez_vous']+" = ["+
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
                    "bconfirm=confirm(\"En changeant le statut du rendez vous en \'Absence excusée\', l\'emplacement sera à nouveau disponible, confirmez-vous le changement ?\");"+
                    "if(bconfirm){"+
                        "del_rendez_vous_absence_excusee("+value.tab2[i]['id_prise_rendez_vous']+");"+
                    "}"+
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
            //text +="$('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_retard,{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});";
            text +="$('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').bind('mousedown', function (e) { if (e.which == 3) { $(\".menu_custom_alaxione\").hide(); $('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_retard_"+value.tab2[i]['id_prise_rendez_vous']+",{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});} });";

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
  get_fiche_rendez_vous(idrdv);
  $('#modalFicheRendezVous').modal('show');
  $('#info_rdv_modal_link').click();
}

function enreg_planning(nompatient,idrdv,daterdv,heurerdv,idrdv,daterdvfin,heurefin,nomdocteur,iddocteur,idlieu,idtyperdv,jsEvent,idcalendar,identifiant_praticien){

  var jour = daterdv.substring(0,2);
  var mois = daterdv.substring(3,5)-1;
  var moisreel = mois+1;

  var annee = daterdv.substring(6,10);

  var heures = heurerdv.substring(0,2);
  var minutes = heurerdv.substring(3,5);

  //document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nomdocteur;
  //document.getElementById("idladate").value=daterdv;
  //document.getElementById("idheure").value=heurerdv;
  var sidrdv = String(idrdv);
  var dispo = sidrdv.split("-");
  if( dispo.length>0 ){
      sidrdv = dispo[0];
      var sid_rdv_temp_del = dispo[1];
  }
  if(sidrdv=='Nan'){
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

            //document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV avec le docteur "+nomdocteur+" le "+daterdv;
            //document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+iddocteur+"&ladate="+daterdv+"&heuredebut="+heurerdv+"&heurefin="+heurefin+"&idlieu="+idlieu+'&idtyperdv='+idtyperdv+"&idcalendar="+idcalendar+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000);
            //$('#myModalinfordv').modal('show');

            $('#id_tmp_del').val(sid_rdv_temp_del);
            get_new_rendez_vous(identifiant_praticien, daterdv, heurerdv, idlieu, idtyperdv);
            $('#modalEnregistrerRendezVous').modal('show');
            $('#nom_patient_prendre_rdv_calendar').focus();
          });
        }
    });

    //
  }else{
    get_fiche_rendez_vous(idrdv);
    $('#modalFicheRendezVous').modal('show');
    $('#info_rdv_modal_link').click();
  }
}

function enreg_planning_seul(idpraticien,idlieu,idrdv,date,heuredebut,heurefin,actimoduleexterne, idcalendar, identifiant_praticien){

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

            valeurcookiecopier = readookie("rdvcopier");
            valeurcookiecouper = readookie("rdvcouper");

            if (valeurcookiecouper != null && valeurcookiecouper != "") {
              tab = valeurcookiecouper.split('|');
              Message = "Déplacer le RDV de " + tab[1] + " le " + tab[2] + " à " + tab[3] + " avec le docteur " + tab[4] + "<br> Le " + date + " à " + heuredebut + " sur ce calendrier";
              $("#modal_couper_id_rdv_copie").val(tab[0]);
              $("#modal_couper_date_coller").val(date);
              $("#modal_couper_heure_coller").val(heuredebut);
              $("#modal_couper_id_calendar").val(idpraticien);

              $('#div_confirme_couper').html(Message);
              $('#modalComfirmeCouper').modal('show');
            } else if (valeurcookiecopier != null && valeurcookiecopier != "") {
              tab = valeurcookiecopier.split('|');
              Message = "Copier le RDV de " + tab[1] + " le " + tab[2] + " à " + tab[3] + " avec le docteur " + tab[4] + "<br> Le " + date + " à " + heuredebut + " sur ce calendrier";
              $("#modal_copier_id_rdv_copie").val(tab[0]);
              $("#modal_copier_date_coller").val(date);
              $("#modal_copier_heure_coller").val(heuredebut);
              $("#modal_copier_id_calendar").val(idpraticien);

              $('#div_confirme_copier').html(Message);
              $('#modalComfirmeCopier').modal('show');
            } else {

                if (typeof identifiant_praticien === 'undefined') {
                    identifiant_praticien = value.guid_praticien;
                }
                get_new_rendez_vous(identifiant_praticien, date, heuredebut, idlieu, "");
                $('#modalEnregistrerRendezVous').modal('show');
                $("#modalEnregistrerRendezVous").on('shown.bs.modal', function () {
                    $('#nom_patient_prendre_rdv_calendar').focus();
                });
            }
          });
        }
      });

    }else{
      //alert('Synchronisation avec un module externe activée');
      affiche_popup_message('Information', ' ATTENTION : Votre paramétrage n\'autorise pas la prise de rendez-vous depuis le calendrier, merci d\'utiliser la fonction "Prendre un rendez-vous"', 'Ok');
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
            if(Object.keys(json).length!=0){
               $.each(json, function(index, value) {
                var sdateTemp1 = moment(value.start).format('DD/MM/YYYY');
                var sdateTemp2 = moment(value.start).format('YYYY-MM-DD');

                $('#datedebutaff_{/literal}{$tabP.id_user}{literal}').val(sdateTemp2);
                $('#calendar_{/literal}{$tabP.id_user}{literal}').fullCalendar( 'gotoDate', moment(sdateTemp1, 'DD/MM/YYYY'));

              });
            }else{
                if($('#tabactive').val() == {/literal}{$tabP.id_user}{literal}){
                    affiche_popup_message("Désolé...", "Aucune disponibilité trouvée!", "Ok");
                }

            }

        }
      });
    }else{
      $('#datedebutaff_{/literal}{$tabP.id_user}{literal}').val(sdatedebut2);
      $('#calendar_{/literal}{$tabP.id_user}{literal}').fullCalendar( 'gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));
    }

    if(document.getElementById('first_'+{/literal}{$tabP.id_user}{literal}).value =="0"){
      $('#calendar_'+{/literal}{$tabP.id_user}{literal}).fullCalendar('refetchEvents');
    }

  {/literal}{/foreach}{literal}
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
    reinitialise_modal_prendre_rendez_vous();
    $('#modalPrendreRendezVous').modal('show');
  }

    function modal_prendre_rendez_vous_unique(idp){
      reinitialise_modal_prendre_rendez_vous();
      $('#idp_unique').val(idp);
      reinitialise_modal_prendre_rendez_vous_unique();
      //$('#wizard-rdv-unique a[href="#tabPrendreRendezVousUnique1"]').tab('show');
      $('#modalPrendreRendezVousUnique').modal('show');
  }

  function modal_prendre_rendez_vous_anesthesiste(){
    reinitialise_modal_prendre_rendez_vous_anesthesiste_unique();
    $('#modalPrendreRendezVousAnesthesiste').modal('show');
  }


  $(document).ready(function() {

      affiche_bouton_rdv_en_cour("rdvcouper");
      affiche_bouton_rdv_en_cour("rdvcopier");

    {/literal}{foreach from=$tabPraticien item=tabConsigne name=sTabConsigne}{literal}
    $('#id_consigne_{/literal}{$tabConsigne.id_user}{literal}').bind('click', function() {

      // if this is close
      if (! $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').hasClass('open')){

        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').addClass('open');
        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').slideDown('fast',  function(){});
c
        // if this is open
      } else {
        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').removeClass('open');
        $('#div-top-menu-consigne_{/literal}{$tabConsigne.id_user}{literal}').slideUp('fast',  function(){});
      }

    });
    {/literal}{/foreach}{literal}

    //document.getElementById('first_1').value = "0";
    $(document).on( 'shown.bs.tab', '#ulcalendar a[data-toggle="tab"]', function (e) {
      var str = String(e.target);
      var res = str.split('#');
      var id_calendar = res[1].substring(3);
      $('#tabactive').val(id_calendar);
      window.localStorage.clear();
      if(document.getElementById('first_'+id_calendar).value =="1" && $('#iddateplanning').val()==""){
        $('#calendar_'+id_calendar).fullCalendar('today');
        document.getElementById('first_'+id_calendar).value = "0";
      }else{
          if($('#iddateplanning').val()!=""){
              $('#calendar_'+id_calendar).fullCalendar('gotoDate', moment($('#iddateplanning').val(), 'DD/MM/YYYY'));
          }
         //$('#calendar_'+id_calendar).fullCalendar('refetchEvents');

      }

      if( $('#iddateplanning').val()=="" ){
          //modif effectué a la demande de guy le 27/09/2019 pour le centre Union
          //$('#calendar_'+id_calendar).fullCalendar('gotoDate', moment($('#datedebutaff_'+id_calendar).val(), 'YYYY-MM-DD'));
      }

      $('#calendar_'+id_calendar).fullCalendar('refetchEvents');

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
      $('#divfiltrerdv').hide();
      $('#divattentefiltrerdv').show();
      setTimeout(function() {
        rafraichir_calendrier('selectlieux2','selectpraticien2','selecttyperdv2','ok','datepickerrdv-widget','1', '0');
      }, 0);
      $('#myModalfiltrrdv').modal('hide');
      $('#btn_interpro_rdv').css('display','block');
      return false;
    });

    $('#btn_modal_filtre_praticien').click(function() {
      $('#divfiltrepraticien').hide();
      $('#divattentefiltrepraticien').show();
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

        $(".checkpraticien").prop("checked", false);
        $(".checkprofession").prop("checked", false);

        /*$('#dialog-confirm').show();
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
        });*/

      } else {
        $('#div_param_agenda').slideUp('slow',  function(){});
        //$('#dialog-confirm').hide();
      }

      return false;
    });

    $('#btn_annule_param_agenda').click(function() {
      $('#div_param_agenda').slideUp('slow',  function(){});
      return false;
    });



    $('input[type=radio][name=recurrent_termine_prendre_rdv_calendar]').change(function() {
        if (this.value === 'jamais') {
            $('#reccurent_date_fin_patient_prendre_rdv_calendar').prop('disabled', true);
            $('#recurrent_occurence_prendre_rdv_calendar').prop('disabled', true);
        }else if (this.value === 'le') {
            $('#reccurent_date_fin_patient_prendre_rdv_calendar').prop('disabled', false);
            $('#recurrent_occurence_prendre_rdv_calendar').prop('disabled', true);
        }else if (this.value === 'apres') {
            $('#reccurent_date_fin_patient_prendre_rdv_calendar').prop('disabled', true);
            $('#recurrent_occurence_prendre_rdv_calendar').prop('disabled', false);
        }
    });

    //header agenda
    var headerHeight = $("#header").height();
    var ulcalendarHeight = $("#ulcalendar").height();
    var btnparamHeight = $(".btn_param").height();
    var fctoolbarHeight = $(".fc-toolbar").height();

    var tempheaderHeight = 0;
    var ulcalendarTop = 0;
    var fctoolbarTop = 0;
    var fcheadTop = 0;
    var decalageTop = 0;

    var tmpWidhtAgenda = "";

    $('.fc-head').removeAttr('style');
    $('.fc-toolbar').removeAttr('style');
    $('#ulcalendar').removeAttr('style');
    $('.btn_param').removeAttr('style');
    $('.fc-unthemed').removeAttr('style');

    $(window).on("scroll", function(){
      //if ($(window).scrollTop() > headerHeightagenda + 0) {

      scroll_calendar_page();

    });

    function scroll_calendar_page(){

      $('#divsalleattente').css({
        top: headerHeight+'px',
        position: 'fixed',
        zIndex: '1000',
        //zIndex: '999999999999999',
        //"padding-top": '40px'
      });

      {/literal}{if $activeenteteflottante=='Y'}{literal}

      if ($(window).scrollTop() > 0) {
        $('.fc-head').removeAttr('style');
        $('.fc-toolbar').removeAttr('style');
        $('#ulcalendar').removeAttr('style');
        $('.btn_param').removeAttr('style');
        $('.fc-unthemed').removeAttr('style');
          //alert(headerHeightagenda);
        if($('#widthagenda').val()== ""){
          tmpWidhtAgenda = $(".fc-view-container").width();
        }else{
          tmpWidhtAgenda = $('#widthagenda').val();
        }
        {/literal}{if !$bIsMobile}{literal}

        $('.btn_param').css({
          top: headerHeight+'px',
          position: 'fixed',
          zIndex: '2',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff',
          "padding-top": '40px'//,
          //"transition": 'all .5s ease 0s'
        });

        ulcalendarTop = headerHeight + btnparamHeight+40;

        $('#ulcalendar').css({
          top: ulcalendarTop+'px',
          position: 'fixed',
          zIndex: '998',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff'
        });

        fctoolbarTop = headerHeight + btnparamHeight + ulcalendarHeight+40;

        $('.fc-toolbar').css({
          top: fctoolbarTop+'px',
          position: 'fixed',
          zIndex: '800',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff',
          "padding-top": '10px',
          "padding-bottom": '12px',
          "margin-bottom": '13px'//,
          //"transition": 'all .5s ease 0s'
        });

        fcheadTop = headerHeight + btnparamHeight + ulcalendarHeight + fctoolbarHeight+40;

        $('.fc-agendaWeek-view .fc-head').css({
          top: fcheadTop+'px',
          position: 'fixed',
          zIndex: '999',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff',
          "margin-top": '22px'//,
          //"transition": 'all .5s ease 0s'
        });

        $('.fc-agendaTroisJours-view .fc-head').css({
          top: fcheadTop+'px',
          position: 'fixed',
          zIndex: '999',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff',
          "margin-top": '22px'//,
          //"transition": 'all .5s ease 0s'
        });

        $('.fc-agendaDay-view .fc-head').css({
          top: fcheadTop+'px',
          position: 'fixed',
          zIndex: '999',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff',
          "margin-top": '22px'//,
          //"transition": 'all .5s ease 0s'
        });

        decalageTop = fcheadTop + 25;
        $(".fc-unthemed").css("cssText", "margin-top: "+decalageTop+"px !important;");

        {/literal}{else}{literal}
        $('.fc-head').css({
          top: '20px',
          position: 'fixed',
          zIndex: '999',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff'
        });
        {/literal}{/if}{literal}

      } else if ($(window).scrollTop() <= 300 ) {
        $('.fc-head').removeAttr('style');
        $('.fc-toolbar').removeAttr('style');
        $('#ulcalendar').removeAttr('style');
        $('.btn_param').removeAttr('style');
        $('.fc-unthemed').removeAttr('style');
      }

      {/literal}{else}{literal}

      if ($(window).scrollTop() > 0) {
          //alert(headerHeightagenda);
        if($('#widthagenda').val() === ""){
          tmpWidhtAgenda = $(".fc-view-container").width();
        }else{
          tmpWidhtAgenda = $('#widthagenda').val();
        }
        {/literal}{if $bIsMobile}{literal}

        $('.fc-head').css({
          top: '20px',
          position: 'fixed',
          zIndex: '999',
          width: parseInt(tmpWidhtAgenda)+1,
          "background-color": '#ffffff'
        });
        {/literal}{/if}{literal}

      } else if ($(window).scrollTop() <= 300 ) {
        $('.fc-head').removeAttr('style');
        $('.fc-toolbar').removeAttr('style');
        $('#ulcalendar').removeAttr('style');
        $('.btn_param').removeAttr('style');
        $('.fc-unthemed').removeAttr('style');
      }

      {/literal}{/if}{literal}

    }

    $("#btn_check_patient_prendre_rdv_calendar").click( function() {
        button_valid_and_print_calendar = $(this).attr('name');
    });

    $("#btn_check_patient_prendre_rdv_print_calendar").click( function() {
        button_valid_and_print_calendar = $(this).attr('name');
    });

    $('#modal_enregistrer_rdv').submit(function() {
      var bcontinu = true;
      if($('#teleconsult_prendre_rdv_calendar').val() == 'Y'){
        //|| $('#tel_mobile_patient_prendre_rdv_calendar').val() != ""
        if($('#email_patient_prendre_rdv_calendar').val() != ""){
          bcontinu = true;
        }else{
          //alert("Pour une téléconsultation, vous devez renseigner l'email du patient");
          affiche_popup_message('Information', "Pour une téléconsultation, vous devez renseigner l'email du patient", 'Ok');
          bcontinu = false;
          return false;
        }

        if($('#montant_teleconsult_prendre_rdv_calendar').val() != ""){
          bcontinu = true;
        }else{
          //alert("Pour une téléconsultation, vous devez renseigner l'email du patient");
          affiche_popup_message('Information', "Pour une téléconsultation, vous devez renseigner un montant de téléconsultation", 'Ok');
          bcontinu = false;
          return false;
        }
      }

      if(bcontinu){
        enregistrement_rdv_calendar();
      }

      return false;
    });


    $("#btn_generer_rdv_recurrent").click( function() {

      if($('#id_praticien_prendre_rdv_calendar').val()!='' && $('#id_lieu_prendre_rdv_calendar').val()!='' && $('#type_rdv_calendar').val()!='' && ($('#id_patient_prendre_rdv_calendar').val()!='' || ($('#civilite_patient_prendre_rdv_calendar').val()!=null && $('#nom_patient_prendre_rdv_calendar').val()!='' && $('#prenom_patient_prendre_rdv_calendar').val()!=''))){


        $('#div_info_patient_historique_complet').hide('slow');
        $('#div_title_historique').hide();
        $('#div_liste_rdv_generer').show('slow');
        $('#div_liste_rdv_generer').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");

        var data = $('#date_prendre_rdv_calendar').val();
        var arr = data.split('/');
        var data2 = $('#heure_reelle_prendre_rdv_calendar').val();
        var arr2 = data2.split(':');

        var data3 = $('#heure_patient_prendre_rdv_calendar').val();
        var arr3 = data3.split(':');

        var id_praticien_rdv_timestamp = $('#id_praticien_prendre_rdv_calendar').val()+'-'+arr[2]+'-'+arr[1]+'-'+arr[0]+'-'+arr2[0]+'-'+arr2[1]+'-'+$('#id_lieu_prendre_rdv_calendar').val()+'-1-'+$('#type_rdv_calendar').val();
        var selected_recurrent_repeter_le = $('input[name=recurrent_repeter_le_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();
        var selected_recurrent_termine = $('input[name=recurrent_termine_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();

        var tabInfo = id_praticien_rdv_timestamp.split('-');

        var month = new Array(12);
        month[0] = "Janvier";
        month[1] = "Février";
        month[2] = "Mars";
        month[3] = "Avril";
        month[4] = "Mai";
        month[5] = "Juin";
        month[6] = "Juillet";
        month[7] = "Août";
        month[8] = "Septembre";
        month[9] = "Octobre";
        month[10] = "Novembre";
        month[11] = "Décembre";

        var sjour = new Array(7);
        sjour[0] = "Dimanche";
        sjour[1] = "Lundi";
        sjour[2] = "Mardi";
        sjour[3] = "Mercredi";
        sjour[4] = "Jeudi";
        sjour[5] = "Vendredi";
        sjour[6] = "Samedi";

        var formattedDate = new Date(tabInfo[1]+"-"+tabInfo[2]+"-"+tabInfo[3]);
        var d = formattedDate.getDay();
        var m =  formattedDate.getMonth();

        //var jourliteralrdvinitial = sjour[d] +" "+ tabInfo[3]+" "+month[m]+" "+tabInfo[1] +" à "+ tabInfo[4]+":"+tabInfo[5];
        var jourliteralrdvinitial = sjour[d] +" "+ tabInfo[3]+" "+month[m]+" "+tabInfo[1] +" à "+ arr3[0]+":"+arr3[1];


        $.ajax({
            url: 'ajax/generer_liste_rdv_reccurent.php',
            data: 'select_rdv='+id_praticien_rdv_timestamp
                +'&recurrent_nb_repete='+$('#recurrent_nb_repete_prendre_rdv_calendar').val()
                +'&recurrent_select_repete='+$('#recurrent_select_repete_prendre_rdv_calendar').val()
                +'&recurrent_repeter_le='+selected_recurrent_repeter_le
                +'&recurrent_termine='+selected_recurrent_termine
                +'&reccurent_date_fin='+$('#reccurent_date_fin_patient_prendre_rdv_calendar').val()
                +'&recurrent_occurence='+$('#recurrent_occurence_prendre_rdv_calendar').val()
                +'&recurrent_forcer_rdv='+$('#recurrent_forcer_rdv_calendar').val(),
            dataType: 'json',
            success: function(json) {
                $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', false);
                $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', false);
                $.each(json, function(index, value) {
                    var tableau_rdv_recurrent = "<table style='padding:10px;' width='100%' border='1'>";

                    tableau_rdv_recurrent += "<tr><td></td><td><b>Le jour du RDV</b></td><td><b>Les propositions</b></td><td><b>Actions</b></td></tr>";
                    tableau_rdv_recurrent += "<tr><td id='tdnum-1' style='padding:5px;'><span style='font-size: small;' class='badge vd_bg-red'>1</span></td><td style='padding: 20px;'>"+jourliteralrdvinitial+"</td><td></td><td></td></tr>";

                    var i=2;
                    $.each(value.tabRDVRecurrent, function(index, value) {

                        tableau_rdv_recurrent += "<tr id='tr-"+value.lejour+"' ><td id='tdnum-"+i+"' style='padding:5px;'><span style='font-size: small;' class='badge vd_bg-red'>"+i+"</span></td><td><span id='jourchoisi-"+value.lejour+"'>"+value.jourliteral+"</span></td><td id='btndatechoisi-"+value.lejour+"'><div class='btn-group-vertical'>";
                        i++;
                        tableau_rdv_recurrent += "<input type='hidden' class='date-rdv-recurrent' id='tabrdvrecurrenthidden-"+value.lejour+"' value=''>";

                        if(value.liste.length > 0){
                            $.each(value.liste, function(index, value) {
                                if(value.statut === "conge"){
                                    tableau_rdv_recurrent += value.descconge;
                                }else{
                                    tableau_rdv_recurrent += "<button class='"+value.ladate+" btn ";
                                    if(value.checked===1){
                                        tableau_rdv_recurrent += " btn_widget_standard ";
                                    }
                                    tableau_rdv_recurrent += "' type='button' onclick='changedaterdvrecurrent(\""+value.ladate+"\", this, \""+value.decoupe+"\", \""+value.lejour+"\", \""+value.dateaff+"\", \""+value.heureaff_patient+"\", \""+value.jourliteral+"\");'>"+value.lejour +" "+value.dateaff +" à "+ value.heureaff_patient+" <br/>(Heure réelle : "+value.heure_debut+")</button>";
                                }
                            });
                        }else{
                            tableau_rdv_recurrent += "Pas de proposition automatique pour ce jour";
                        }
                        tableau_rdv_recurrent += "</div></td><td>";
                        tableau_rdv_recurrent += "<button class='btn btn_widget_standard' type='button' style='width: 95%;margin-top:10px;margin-bottom:10px;' onclick='modifier_ligne_date_reccurent(\""+value.lejour+"\");'>Choisir une autre date/horaire</button>";
                        //tableau_rdv_recurrent += "<br/><button class='btn btn_widget_standard' type='button' style='width: 95%;background-color: #d9534f;margin-top:10px;margin-bottom:10px;' onclick='supprimer_ligne_date_reccurent(\"tr-"+value.lejour+"\");'>Supprimer cette date/horaire</button>";
                        tableau_rdv_recurrent += "</td></tr>";
                    });
                    tableau_rdv_recurrent += "</table>";
                    $('#div_liste_rdv_generer').html(tableau_rdv_recurrent);

                    var hiddendate = "";
                    var initdatereccurent = "";
                    $.each(value.tabRDVRecurrent, function(index, value2) {
                        if(value2.liste.length > 0){
                            $.each(value2.liste, function(index, value) {
                                if(value.checked===1){
                                    hiddendate = value.ladate;
                                    initdatereccurent = value.decoupe;
                                    $('#jourchoisi-'+value.ladate).html(value2.jourliteral+" à "+value.heureaff_patient);
                                }
                                $('#tabrdvrecurrenthidden-'+hiddendate).val(initdatereccurent);
                            });
                        }
                    });
                });
            }
        });
      }else{
          if($('#type_rdv_calendar').val()===''){
              affiche_popup_message('Information', "Veuillez choisir un motif de RDV", 'Ok');
          }

          if($('#id_patient_prendre_rdv_calendar').val()==='' && ($('#civilite_patient_prendre_rdv_calendar').val()===null || $('#nom_patient_prendre_rdv_calendar').val()==='' || $('#prenom_patient_prendre_rdv_calendar').val()==='')){
              affiche_popup_message('Information', "Veuillez sélectionner un patient ou saisir les champs obligatoires", 'Ok');
          }

          if($('#id_praticien_prendre_rdv_calendar').val()===''){
              affiche_popup_message('Information', "Veuillez sélectionner un praticien", 'Ok');
          }

          if($('#id_lieu_prendre_rdv_calendar').val()===''){
              affiche_popup_message('Information', "Veuillez sélectionner un lieu", 'Ok');
          }

      }

      return false;

    });

    $('#type_rdv_calendar').on('change', function() {

      if($('#type_rdv_calendar').val() != ""){
            $.ajax({
                url: 'ajax/get_montant_motif_teleconsultation.php',
                data: 'idtyperdv='+$('#type_rdv_calendar').val()+'&identifiant_docteur='+$('#id_praticien_prendre_rdv_calendar').val(),
                dataType: 'json',
                success: function(json) {
                    if($('#montant_teleconsult_prendre_rdv_calendar').val() == "" || $('#montant_teleconsult_prendre_rdv_calendar').val() != json.montant){
                        $('#montant_teleconsult_prendre_rdv_calendar').val(json.montant);
                    }
                    if(json.type_motif == "Telconsult"){
                      $('#teleconsult_prendre_rdv_calendar').val("Y");
                      $('#div_montant_teleconsult_prendre_rdv_calendar').show();
                    }else{
                      $('#teleconsult_prendre_rdv_calendar').val("N");
                      $('#div_montant_teleconsult_prendre_rdv_calendar').hide();
                    }
                }
            });
        }
    });



    $('#teleconsult_prendre_rdv_calendar').on('change', function() {
        //affiche_popup_message('Information', "Veuillez sélectionner un lieu", 'Ok');
        if($('#teleconsult_prendre_rdv_calendar').val() == 'Y'){
            $('#div_montant_teleconsult_prendre_rdv_calendar').show();
            if($('#type_rdv_calendar').val() != ""){
                $.ajax({
                    url: 'ajax/get_montant_motif_teleconsultation.php',
                    data: 'idtyperdv='+$('#type_rdv_calendar').val()+'&identifiant_docteur='+$('#id_praticien_prendre_rdv_calendar').val(),
                    dataType: 'json',
                    success: function(json) {
                        if($('#montant_teleconsult_prendre_rdv_calendar').val() == "" || $('#montant_teleconsult_prendre_rdv_calendar').val() != json.montant){
                            $('#montant_teleconsult_prendre_rdv_calendar').val(json.montant);
                        }
                    }
                });
            }
        }else{
            $('#div_montant_teleconsult_prendre_rdv_calendar').hide();
        }


    });

    $('#recurrent_prendre_rdv_calendar').on('change', function() {
        if($('#recurrent_prendre_rdv_calendar').val()==="Y"){

            if($('#id_praticien_prendre_rdv_calendar').val()!='' && $('#id_lieu_prendre_rdv_calendar').val()!='' && $('#type_rdv_calendar').val()!='' && ($('#id_patient_prendre_rdv_calendar').val()!='' || ($('#civilite_patient_prendre_rdv_calendar').val()!=null && $('#nom_patient_prendre_rdv_calendar').val()!='' && $('#prenom_patient_prendre_rdv_calendar').val()!='' && $('#date_naissance_patient_prendre_rdv_calendar').val()!=''))){
              $('#div_info_patient_historique_complet').hide('slow');
              $('#div_title_historique').hide();
              $('#div_recurrence_perso').show('slow');
              $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', true);
              $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', true);
            }else{
                $('#recurrent_prendre_rdv_calendar').val('N');

                if($('#type_rdv_calendar').val()===''){
                    affiche_popup_message('Information', "Veuillez choisir un motif de RDV", 'Ok');
                }


                if($('#id_patient_prendre_rdv_calendar').val()==='' && ($('#civilite_patient_prendre_rdv_calendar').val()===null || $('#nom_patient_prendre_rdv_calendar').val()==='' || $('#prenom_patient_prendre_rdv_calendar').val()==='' || $('#date_naissance_patient_prendre_rdv_calendar').val()==='')){
                    affiche_popup_message('Information', "Veuillez sélectionner un patient ou saisir les champs obligatoires", 'Ok');
                }

                if($('#id_praticien_prendre_rdv_calendar').val()===''){
                    affiche_popup_message('Information', "Veuillez sélectionner un praticien", 'Ok');
                }

                if($('#id_lieu_prendre_rdv_calendar').val()===''){
                    affiche_popup_message('Information', "Veuillez sélectionner un lieu", 'Ok');
                }
            }
        }else{
            $('#div_recurrence_perso').hide('slow');
            $('#btn_check_patient_prendre_rdv_calendar').prop('disabled', false);
            $('#btn_check_patient_prendre_rdv_print_calendar').prop('disabled', false);
            $('#div_liste_rdv_generer').html("").hide();
        }

    });

      $('#recurrent_select_repete_prendre_rdv_calendar').on('change', function() {

          if($('#recurrent_select_repete_prendre_rdv_calendar').val() === 'semaine') {
              $('#div_repete_le').show('slow');
          }else{
              $('#div_repete_le').hide('slow');
          }

      });

      $('#menu_historique_patient a').click( function() {
          var cat_id = $(this).attr( 'data-filter' );
          $('#boucle_historique_prendre_rdv_calendar').isotope({ filter:  cat_id });
      });

      $('#couleur_patient_prendre_rdv_calendar').on('change', function() {
        $('#cadre_couleur_patient_prendre_rdv_calendar').attr( 'style', 'color:#'+$('#couleur_patient_prendre_rdv_calendar').val() );
      });

      var curdatemobile = new Date();
      curdatemobile = curdatemobile.getDate()+"/"+(curdatemobile.getMonth()+1)+"/"+curdatemobile.getFullYear();

      $('#datemenupickermobile').DatePicker({
          flat: true,
          date: curdatemobile,
          current: curdatemobile,
          format: 'd/m/Y',
          calendars: 1,
          mode: 'single',
          starts: 1,
          onChange: function(formated, dates){
              //alert(formated);
              if($('#iddateplanning').val()!=formated || $('#iddateplanningrdv').val()!=formated){
                  $('#iddateplanning').val(formated);
                  $('#iddateplanningrdv').val(formated);
                  setTimeout(function() {
                      if($('#dir').val()=='rechdispo'){
                          rafraichir_calendrier('selectlieux','selectpraticien','selecttyperdv','','iddateplanning','0', '0');
                          rafraichir_calendrier_all(formated);
                      }

                  }, 0);
              }
              $('#modalCalendarMobile').modal('hide');
          }
      });

      if($('#id_praticien_copypaste').val()!="" && $('#id_rdv_copypaste').val()!=""){
          active_tab_praticien($('#id_praticien_copypaste').val());
          $.ajax({
              cache: false,
              url: 'ajax/get_info_rendez_vous.php',
              data: 'id_fiche_rendez_vous='+$('#id_rdv_copypaste').val()+'&identifiant_entite='+$('#idc').val()+'&identifiant_user='+$('#ident_user').val(),
              dataType: 'json',
              success: function(json) {
                  $.each(json, function(index, value) {
                      couper_rdv($('#id_rdv_copypaste').val()+'|'+value.civilite_patient+' '+value.nom_patient+' '+value.prenom_patient+'|'+value.ladte+'|'+value.heuredebut+'|'+value.nomdocteurseul, 'copierdv');
                      $('#id_praticien_copypaste').val("");
                      $('#id_rdv_copypaste').val("");
                  });
              }
          });
      }

  });


  function reinitialise_modal_prendre_rendez_vous_calendar(){

    $('#id_patient_prendre_rdv_calendar').val("");
    $('#civilite_patient_prendre_rdv_calendar').val("");
    $('#nom_patient_prendre_rdv_calendar').val("");
    $('#prenom_patient_prendre_rdv_calendar').val("");
    $('#nom_fille_patient_prendre_rdv_calendar').val("");
    $('#adresse_patient_prendre_rdv_calendar').val("");
    $('#code_postal_patient_prendre_rdv_calendar').val("");
    $('#ville_patient_prendre_rdv_calendar').val("");
    $('#tel_mobile_patient_prendre_rdv_calendar').val("");
    $('#tel_fixe_patient_prendre_rdv_calendar').val("");
    $('#email_patient_prendre_rdv_calendar').val("");
    $('#date_naissance_patient_prendre_rdv_calendar').val("");
    $('#num_secu_patient_prendre_rdv_calendar').val("");
    $('#medecin_traitant_patient_prendre_rdv_calendar').val("");
    $('#ville_medecin_patient_prendre_rdv_calendar').val("");
    $('#profession_patient_prendre_rdv_calendar').val("");
    $('#remarque_patient_prendre_rdv_calendar').val("");
    $('#assurance_patient_prendre_rdv_calendar').val("");
    $('#couleur_patient_prendre_rdv_calendar').val("").change();
    $('#cadre_couleur_patient_prendre_rdv_calendar').prop("title", "");
    $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>');

    $("#code_postal_patient_prendre_rdv_calendar").inputmask("9*999");
    $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
    $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
    $("#num_secu_patient_prendre_rdv_calendar").inputmask("9 99 99 9* 999 999 99");
    $("#date_naissance_patient_prendre_rdv_calendar").inputmask("99/99/9999");

    $('#civilite_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#nom_patient_prendre_rdv_calendar').prop('disabled', false).focus();
    $('#prenom_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#nom_fille_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#adresse_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#ville_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#email_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#profession_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#assurance_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#couleur_patient_prendre_rdv_calendar').prop('disabled', false);


    //recurrence

    $('#recurrent_prendre_rdv_calendar').val("N");
    $('#recurrent_nb_repete_prendre_rdv_calendar').val("1");
    $('#recurrent_select_repete_prendre_rdv_calendar').val("semaine");
    $('#reccurent_date_fin_patient_prendre_rdv_calendar').val("").prop('disabled', true);
    //$('#recurrent_occurence_prendre_rdv_calendar').val("2").prop('disabled', true);
    $('#recurrent_occurence_prendre_rdv_calendar').val("2");


    $("input[name=recurrent_repeter_le_prendre_rdv_calendar][value='1']").prop('checked', true);

    $("input[name=recurrent_termine_prendre_rdv_calendar][value='apres']").prop('checked', true);


    $('#div_recurrence_perso').hide();
    $('#div_liste_rdv_generer').html("").hide();

    $('#div_reinit_calendar').hide();

    //historique patient
    $('#attente_historique_patient_prendre_rdv_calendar').hide();
    $('#pas_historique_patient_prendre_rdv_calendar').show();
    $('#historique_patient_prendre_rdv_calendar').hide();
    $('#boucle_historique_prendre_rdv_calendar').html("");

    $('#div_button_suivant_calendar').show();
    $('#div_button_update_patient_calendar').hide();



  }

  function getInfoPatientModalPrendreRDVCalendar(idpatient){

      $.ajax({
          cache: false,
          url: 'ajax/get_info_patient.php',
          data: 'idpatient='+idpatient,
          dataType: 'json',
          success: function(json) {
              $.each(json, function(index, value) {

                  $('#civilite_patient_prendre_rdv_calendar option[value="'+value.id_civilite+'"]').prop('selected', true);

                  civiliteNomJeuneFille(value.civilite, 'divnomjeunefille_patient_prendre_rdv_calendar');

                  $('#id_patient_prendre_rdv_calendar').val(idpatient);
                  $('#nom_patient_prendre_rdv_calendar').val(value.nom);
                  $('#prenom_patient_prendre_rdv_calendar').val(value.prenom);
                  $('#nom_fille_patient_prendre_rdv_calendar').val(value.nom_fille);
                  $('#adresse_patient_prendre_rdv_calendar').val(value.adresse);
                  $('#code_postal_patient_prendre_rdv_calendar').val(value.codepostal);
                  $('#ville_patient_prendre_rdv_calendar').val(value.ville);
                  $('#tel_mobile_patient_prendre_rdv_calendar').val(value.telmobile);
                  $('#tel_fixe_patient_prendre_rdv_calendar').val(value.telfixe);
                  $('#email_patient_prendre_rdv_calendar').val(value.email);
                  $('#date_naissance_patient_prendre_rdv_calendar').val(value.datenaissance);
                  $('#num_secu_patient_prendre_rdv_calendar').val(value.numsecu);
                  $('#medecin_traitant_patient_prendre_rdv_calendar').val(value.medecintraitant);
                  $('#ville_medecin_patient_prendre_rdv_calendar').val(value.villemedecin);
                  $('#profession_patient_prendre_rdv_calendar').val(value.profession);
                  $('#couleur_patient_prendre_rdv_calendar').val(value.couleur).change();

                  if(value.remarque!=""){
                      $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>&nbsp;<i style="color: #000 !important;" class="fa fa-comments-o"></i>');
                      $('#cadre_couleur_patient_prendre_rdv_calendar').prop('title', value.remarque);
                  }else{
                      $('#cadre_couleur_patient_prendre_rdv_calendar').html('<i class="fa fa-square"></i>');
                  }

                  $('#assurance_patient_prendre_rdv_calendar option[value="'+value.id_assurance_maladie+'"]').prop('selected', true);

                  //Masque de saisie pour la Fiche Patient
                  $("#code_postal_patient_prendre_rdv_calendar").inputmask("9*999");
                  $("#tel_mobile_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                  $("#tel_fixe_patient_prendre_rdv_calendar").inputmask("99 99 99 99 99");
                  $("#num_secu_patient_prendre_rdv_calendar").inputmask("9 99 99 9* 999 999 99");
                  $("#date_naissance_patient_prendre_rdv_calendar").inputmask("99/99/9999");


                  if($('#nom_patient_prendre_rdv_calendar').val() != ""){
                      $('#div_reinit_calendar').show();
                  }else{
                      $('#div_reinit_calendar').hide();
                  }

                  $('#civilite_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#nom_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#prenom_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#nom_fille_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#adresse_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#ville_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#email_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#profession_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#assurance_patient_prendre_rdv_calendar').prop('disabled', true);
                  $('#couleur_patient_prendre_rdv_calendar').prop('disabled', true);

                  $('#div_button_update_patient_calendar').hide();
                  $('#div_button_suivant_calendar').show();

                  getHistoriquePatient();
              });
          }
      });

      return false;
  }

  function get_new_rendez_vous(idpraticienrdv, daterdv, heurereellerdv, idlieurdv, idmotif){

    $('#div_info_enregistrer_rendez_vous').show();
    $('#attente_info_enregistrer_rendez_vous').hide();

    $('#div_info_patient_historique_complet').show('slow');
    $('#div_title_historique').show();

    $('#teleconsult_prendre_rdv_calendar').val("N");
    $('#montant_teleconsult_prendre_rdv_calendar').val("");
    $('#div_montant_teleconsult_prendre_rdv_calendar').hide();
    reinitialise_modal_prendre_rendez_vous_calendar();

    $("#id_prive_prendre_rdv_calendar_non").prop( "checked", true );

    $('#id_praticien_prendre_rdv_calendar').val(idpraticienrdv);
    $('#date_prendre_rdv_calendar').val(daterdv);
    $('#heure_patient_prendre_rdv_calendar').val(heurereellerdv);
    $('#heure_reelle_prendre_rdv_calendar').val(heurereellerdv);

    /*if(idlieurdv!=''){
        $('#id_lieu_prendre_rdv_calendar').val(idlieurdv);
    }else{
        $('#id_lieu_prendre_rdv_calendar').val(idlieurdv);
    }*/

    $('#temps_consultation_calendar').val('');



    $('#divMessageRemplacant').hide();
    $('#sMessageRemplacant').html("");
    $('#message_retour_info_enregistrer_rendez_vous').hide().html("");

    $('#btn_plus_rdv_modal_calendar').prop('disabled', false);

    tableau_data = new Array();
    tableau_autre = new Array();
    tableau_id = new Array();
    plus_motif_rdv = true;
    $("#type_rdv_calendar").empty();
    $("#id_lieu_prendre_rdv_calendar").empty();

    var tabInfo = daterdv.split('/');
    var formattedDate = new Date(tabInfo[2]+"-"+tabInfo[1]+"-"+tabInfo[0]);
    var lejour = formattedDate.getDay();
    var sjour = new Array(7);
    sjour[0] = "7";
    sjour[1] = "1";
    sjour[2] = "2";
    sjour[3] = "3";
    sjour[4] = "4";
    sjour[5] = "5";
    sjour[6] = "6";

    $("input[name=recurrent_repeter_le_prendre_rdv_calendar][value="+sjour[lejour]+"]").prop('checked', true);

    $.ajax({
      cache: false,
      url: 'ajax/check_status_teleconsultation_praticien_rdv.php',
      data: 'identifiant_user='+idpraticienrdv,
      dataType: 'json',
      success: function(json) {
        if(json.result === 'ok'){
          $('#div_teleconsult_prendre_rdv_calendar').show();
        }else{
          $('#div_teleconsult_prendre_rdv_calendar').hide();
        }
      }
    });

    $.ajax({
      cache: false,
      url: 'ajax/get_initialise_rendez_vous_calendar.php',
      data: 'idc='+$('#idc').val()+'&iddocteur='+idpraticienrdv+'&daterdv='+daterdv+'&heuredebut='+heurereellerdv+'&idlieu='+idlieurdv,
      dataType: 'json',
      success: function(json) {
        $.each(json, function(index, value) {
            //alert(JSON.stringify(value['tabMotifRDV']));
            $('#type_rdv_calendar').append('<option value="">Choisir un motif de RDV</option>');
            $.each(value['tabMotifRDV'], function(index, value) {
              $('#type_rdv_calendar').append('<option value="'+value.id_type_rdv+'">'+value.libelle_type_rdv+'</option>');
            });

            $('#id_lieu_prendre_rdv_calendar').append('<option value="">Choisir un lieu de RDV</option>');
            $.each(value['listelieux'], function(index, value) {
              $('#id_lieu_prendre_rdv_calendar').append('<option value="'+value.id_lieux+'">'+value.nom_lieux+'</option>');
            });

            count=0;
            $.each(value['tabMotifAutreRDV'], function(index, value) {
              tableau_data.push(value.tmprdv) ;
              tableau_autre.push(value.libelle_type_rdv);
               tableau_id.push(value.id_type_rdv);
               count=count+1;

            });
            //console.table(tableau_data);

            if(idmotif!="" && idmotif!="0"){
              $('#type_rdv_calendar').val(idmotif);
              $('#type_rdv_calendar').change();
            }

            if(idlieurdv!="" && idlieurdv!="0"){
              $('#id_lieu_prendre_rdv_calendar').val(idlieurdv);
            }else{
              $('#id_lieu_prendre_rdv_calendar').val(value['idlieu']);
            }

            if(value['bRemplacant']){
              $('#divMessageRemplacant').show();
              $('#sMessageRemplacant').html(value['messageRemplacant']);

            }
            $('#nom_patient_prendre_rdv_calendar').focus();
        });
      }
    });



  }


  function debloque_modification_patient_modal_prendre_rendez_vous_calendar(){

    $('#civilite_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#nom_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#prenom_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#nom_fille_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#adresse_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#ville_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#email_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#profession_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#assurance_patient_prendre_rdv_calendar').prop('disabled', false);
    $('#couleur_patient_prendre_rdv_calendar').prop('disabled', false);

    $('#div_button_suivant_calendar').hide();
    $('#div_button_update_patient_calendar').show();

  }

  function modification_patient_modal_prendre_rendez_vous_calendar(){

      $.ajax({
          cache: false,
          url: 'ajax/modif_patient.php',
          data: 'identifiant_entite='+$('#idc').val()+'&id_patient='+$('#id_patient_prendre_rdv_calendar').val()+'&nom_mod_up='+$('#nom_patient_prendre_rdv_calendar').val()+'&nom_fille_mod_up='+$('#nom_fille_patient_prendre_rdv_calendar').val()
          +'&prenom_mod_up='+$('#prenom_patient_prendre_rdv_calendar').val()+'&tel_mod_up='+$('#tel_mobile_patient_prendre_rdv_calendar').val()+'&tel_fixe_mod_up='+$('#tel_fixe_patient_prendre_rdv_calendar').val()
          +'&email_mod_up='+$('#email_patient_prendre_rdv_calendar').val()+'&date_naissance_mod_up='+$('#date_naissance_patient_prendre_rdv_calendar').val()+'&adresse_mod_up='+$('#adresse_patient_prendre_rdv_calendar').val()
          +'&code_postal_mod_up='+$('#code_postal_patient_prendre_rdv_calendar').val()+'&ville_mod_up='+$('#ville_patient_prendre_rdv_calendar').val()+'&num_secu_mod_up='+$('#num_secu_patient_prendre_rdv_calendar').val()
          +'&selectassurance='+$('#assurance_patient_prendre_rdv_calendar').val()+'&medecin_traitant_mod_up='+$('#medecin_traitant_patient_prendre_rdv_calendar').val()+'&ville_medecin_mod_up='+$('#ville_medecin_patient_prendre_rdv_calendar').val()
          +'&profession_mod_up='+$('#profession_patient_prendre_rdv_calendar').val()+'&couleur='+$('#couleur_patient_prendre_rdv_calendar').val()+'&remarque='+$('#remarque_patient_prendre_rdv_calendar').val()+'&civilite_mod_up='+$('#civilite_patient_prendre_rdv_calendar').val(),
          dataType: 'json',
          success: function(json) {
              $.each(json, function(index, value) {
                  if(value.success = true){

                      $('#civilite_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#nom_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#prenom_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#nom_fille_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#adresse_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#code_postal_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#ville_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#tel_mobile_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#tel_fixe_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#email_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#date_naissance_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#num_secu_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#medecin_traitant_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#ville_medecin_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#profession_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#assurance_patient_prendre_rdv_calendar').prop('disabled', true);
                      $('#couleur_patient_prendre_rdv_calendar').prop('disabled', true);

                      $('#div_button_suivant_calendar').show();
                      $('#div_button_update_patient_calendar').hide();

                      $.pnotify({
                          title: 'Modification de la fiche patient',
                          text: 'Modification effectué avec succès ',
                          type: 'success',
                          addclass: "stack-bottomright",
                          delay: 3000
                      });
                  }else{
                      $.pnotify({
                          title: 'Modification de la fiche patient',
                          text: value.message,
                          type: 'error',
                          addclass: "stack-bottomright",
                          delay: 3000
                      });
                  }

              });

          }
      });

  }




  function select_tmp(lavaleur){

      /*itaille = tableau_data.length;
      $temps="error";
     for(i=0;i<itaille;i++){

         if(tableau_id[i]==lavaleur){
             $temps = tableau_data[i];
             //alert($temps);
         }

      }*/

    //$('#temps_consultation_calendar').val($temps);

     $.ajax({
      cache: false,
      url: 'ajax/calcul_temps_rendez_vous_calendar.php',
      data: 'iddocteur='+$('#id_praticien_prendre_rdv_calendar').val()+'&idtyperdv='+lavaleur+'&idlieu='+$('#id_lieu_prendre_rdv_calendar').val(),
      dataType: 'json',
      success: function(json) {
        $.each(json, function(index, value) {
            $('#temps_consultation_calendar').val(value['tmprdv']);
        });
      }
    });

    $.ajax({
      cache: false,
      url: 'ajax/calcul_heure_patient_rendez_vous_calendar.php',
      data: 'iddocteur='+$('#id_praticien_prendre_rdv_calendar').val()+'&idtyperdv='+lavaleur+'&heuredebut='+$('#heure_reelle_prendre_rdv_calendar').val()+'&idlieu='+$('#id_lieu_prendre_rdv_calendar').val(),
      dataType: 'json',
      success: function(json) {
        $.each(json, function(index, value) {
            $('#heure_patient_prendre_rdv_calendar').val(value['heurepatient']);
        });
      }
    });
  }

  function ajout_tout_rdv(){

    itaille = tableau_autre.length;
    $('#type_rdv_calendar').empty();
     $('#type_rdv_calendar').append('<option value="">Choisir un motif de RDV</option>');
     for(i=0;i<itaille;i++){
     $('#type_rdv_calendar').append('<option value="'+ tableau_id[i]+'">'+ tableau_autre[i] +'</option>');
    }
    $("#btn_plus_rdv_modal_calendar").prop('disabled', true);
  }


  function enregistrement_rdv_calendar(){

     $('#div_info_enregistrer_rendez_vous').hide();
     $('#attente_info_enregistrer_rendez_vous').show();

     //$('#attente_info_enregistrer_rendez_vous').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");

     $.ajax({
        cache: false,
        url: 'ajax/enregistrement_patient.php',
        data: 'identifiant_entite='+$('#idc').val()+'&idinterpro=&id_patient='+$('#id_patient_prendre_rdv_calendar').val()+'&idaff_nom='+encodeURIComponent($('#nom_patient_prendre_rdv_calendar').val())
        +'&nom_fille_mod_up='+encodeURIComponent($('#nom_fille_patient_prendre_rdv_calendar').val())+'&idaff_prenon='+encodeURIComponent($('#prenom_patient_prendre_rdv_calendar').val())+'&idaff_telport='+encodeURIComponent($('#tel_mobile_patient_prendre_rdv_calendar').val())
        +'&idaff_telfixe='+encodeURIComponent($('#tel_fixe_patient_prendre_rdv_calendar').val())+'&idaff_email='+encodeURIComponent($('#email_patient_prendre_rdv_calendar').val())+'&id_datenaissance='+encodeURIComponent($('#date_naissance_patient_prendre_rdv_calendar').val())
        +'&adresse_mod_up='+encodeURIComponent($('#adresse_patient_prendre_rdv_calendar').val())+'&code_postal_mod_up='+encodeURIComponent($('#code_postal_patient_prendre_rdv_calendar').val())+'&ville_mod_up='+encodeURIComponent($('#ville_patient_prendre_rdv_calendar').val())
        +'&num_secu_mod_up='+encodeURIComponent($('#num_secu_patient_prendre_rdv_calendar').val())+'&selectassurance='+encodeURIComponent($('#assurance_patient_prendre_rdv_calendar').val())+'&medecintrait='+encodeURIComponent($('#medecin_traitant_patient_prendre_rdv_calendar').val())
        +'&ville_medecin_mod_up='+encodeURIComponent($('#ville_medecin_patient_prendre_rdv_calendar').val())+'&profession_mod_up='+encodeURIComponent($('#profession_patient_prendre_rdv_calendar').val())+'&remarque='+encodeURIComponent($('#remarque_patient_prendre_rdv_calendar').val())
        +'&civilite='+$('#civilite_patient_prendre_rdv_calendar').val()+'&indicatif_mobile='+$('#tel_mobile_patient_prendre_rdv_calendar_indicatif').val()+'&indicatif_fixe='+$('#tel_fixe_patient_prendre_rdv_calendar_indicatif').val(),
        dataType: 'json',
        async: false,
        success: function(json) {
            $.each(json, function(index, value) {

                var data = $('#date_prendre_rdv_calendar').val();
                var arr = data.split('/');
                var data2 = $('#heure_reelle_prendre_rdv_calendar').val();
                var arr2 = data2.split(':');

                var id_praticien_rdv_timestamp = $('#id_praticien_prendre_rdv_calendar').val()+'-'+arr[2]+'-'+arr[1]+'-'+arr[0]+'-'+arr2[0]+'-'+arr2[1]+'-'+$('#id_lieu_prendre_rdv_calendar').val()+'-1-'+$('#type_rdv_calendar').val()+'-'+value.idpatient;

                var checkedprive = $('input[name=prive_prendre_rdv_calendar]:checked').val();
                var complementtxt = "";

                /*var recurrent_repeter_leArray = [];
                $(".recurrent_repeter_le_prendre_rdv_calendar:checked").each(function() {
                    recurrent_repeter_leArray.push($(this).val());
                });
                var selected_recurrent_repeter_le;
                selected_recurrent_repeter_le = recurrent_repeter_leArray.join(',') ;*/

                var selected_recurrent_repeter_le = $('input[name=recurrent_repeter_le_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();
                var selected_recurrent_termine = $('input[name=recurrent_termine_prendre_rdv_calendar]:checked', '#modal_enregistrer_rdv').val();

                var date_choisi_recurrent = $('.date-rdv-recurrent').map(function(){
                    return $(this).val()
                }).get();

                var commentaire_rdv_recurrent = $('.commentaire-rdv-recurrent').map(function(){
                    return encodeURIComponent($(this).val())
                }).get();
                //console.log("date_choisi_recurrent: ",date_choisi_recurrent);

                $.ajax({
                    cache: false,
                    url: 'ajax/enregistrement_rendez_vous_backoffice.php',
                    data: 'select_rdv='+id_praticien_rdv_timestamp+'&cookie=&type=&remarque='+encodeURIComponent($('#remarque_patient_prendre_rdv_calendar').val())+'&prive='+checkedprive
                    +'&duree_consult='+$('#temps_consultation_calendar').val()
                    +'&recurrent='+$('#recurrent_prendre_rdv_calendar').val()
                    +'&recurrent_nb_repete='+$('#recurrent_nb_repete_prendre_rdv_calendar').val()
                    +'&recurrent_select_repete='+$('#recurrent_select_repete_prendre_rdv_calendar').val()
                    +'&recurrent_repeter_le='+selected_recurrent_repeter_le
                    +'&recurrent_termine='+selected_recurrent_termine
                    +'&reccurent_date_fin='+$('#reccurent_date_fin_patient_prendre_rdv_calendar').val()
                    +'&recurrent_occurence='+$('#recurrent_occurence_prendre_rdv_calendar').val()
                    +'&date_choisi_recurrent='+date_choisi_recurrent
                    +'&commentaire_rdv_recurrent='+commentaire_rdv_recurrent
                    +'&teleconsult='+$('#teleconsult_prendre_rdv_calendar').val()
                    +'&montant_teleconsult='+$('#montant_teleconsult_prendre_rdv_calendar').val(),
                    dataType: 'json',
                    success: function(json) {
                        $.each(json, function(index, value) {

                            if(value.success == 1){
                                $('#div_liste_rdv_generer').html("");
                                  $('#modalEnregistrerRendezVous').modal('hide');

                                  if(checkedprive == 'Y'){
                                      complementtxt = " (rdv privé)";
                                  }

                                  event = new Object();
                                  event.type = "rdv";
                                  event.title = value.title+complementtxt;
                                  event.nompatient = value.nompatient;
                                  event.start = value.start;
                                  event.end = value.end;
                                  event.color = value.color;
                                  event.couleurrdv = value.couleurrdv;
                                  event.idrdv = value.idrdv;
                                  event.id = value.idrdv;
                                  event.nomdocteur = value.nomdocteur;
                                  event.heureaffiche = value.heureaffiche;
                                  event.dispo = value.dispo;
                                  event.idrdvaff = value.idrdvaff;
                                  event.idlieu = value.idlieu;
                                  event.action = "A";
                                  event.idcalendar = value.idcalendar;
                                  event.status = value.status;
                                  event.className = value.className;
                                  event.nomrdv = value.nomrdv;
                                  event.tempsrdv = value.tempsrdv;
                                  event.tel = value.tel;
                                  event.telfixe = value.telfixe;
                                  event.commentairerdv = value.commentairerdv;
                                  event.statusrdv = value.statusrdv;
                                  event.idpraticien = value.idpraticien;
                                  event.picto = value.picto;
                                  event.identifiant_rdv = value.guid;

                                  if($('#id_tmp_del').val()!= ""){
                                      supp_bouton_vert(parseInt($('#id_tmp_del').val()));
                                      $('#id_tmp_del').val("");
                                  }

                                  eventTmp = $('#calendar_'+value.idpraticien).fullCalendar('clientEvents', value.idrdv);
                                  if(eventTmp.length == 0){
                                      $('#calendar_'+value.idpraticien).fullCalendar( 'renderEvent', event);
                                      $('#calendar_'+value.idpraticien).fullCalendar('rerenderEvents');
                                  }

                                  if(button_valid_and_print_calendar==='btn_check_patient_prendre_rdv_print_calendar'){
                                      window.open('print_rdv.php?idrdv='+value.guid,'_blank');
                                  }

                                  $.pnotify({
                                      title: 'Prise de rendez-vous',
                                      text: 'Le rendez-vous a été enregistré avec succès !\nPatient : '+value.nompatient+'\nLieu : '+value.nom_lieux+'\nDate : '+value.daterdv+'\nHeure : '+value.heurerdv+'\nMotif : '+value.nomrdv+'\nAvec : '+value.Infodocteur+'',
                                      type: 'success',
                                      addclass: "stack-bottomright",
                                      delay: 3000
                                  });
                            }else{
                            $('#div_info_enregistrer_rendez_vous').show();
                            $('#attente_info_enregistrer_rendez_vous').hide();
                                $('#message_retour_info_enregistrer_rendez_vous').html('<div class="alert alert-danger">'+
                                    '<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>'+
                                    '<span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>'+value.message_html+'</div>');
                                $('#message_retour_info_enregistrer_rendez_vous').show();

                                $.pnotify({
                                    title: 'Prise de rendez-vous',
                                    text: value.message_html,
                                    type: 'error',
                                    addclass: "stack-bottomright",
                                    delay: 3000
                                });
                            }

                        });
                    }

              });

            });
        }
    });
  }

  function getHistoriquePatient(){
    var idpatient = $('#id_patient_prendre_rdv_calendar').val();
    var identifiantentite = $('#idc').val();

    $('#attente_historique_patient_prendre_rdv_calendar').show();
    $('#pas_historique_patient_prendre_rdv_calendar').hide();
    $('#historique_patient_prendre_rdv_calendar').hide();
    //$('#boucle_historique_prendre_rdv_calendar').html("");

    $('#boucle_historique_prendre_rdv_calendar').isotope();
    $('#boucle_historique_prendre_rdv_calendar').isotope( 'destroy' );

    $.ajax({
        cache: false,
        url: 'ajax/get_historique_patient.php',
        data: 'idpatient='+idpatient+'&identifiantentite='+identifiantentite,
        dataType: 'json',
        success: function(json) {
            $('#attente_historique_patient_prendre_rdv_calendar').hide();

            if ( json.length == 0 ) {
                $('#pas_historique_patient_prendre_rdv_calendar').show();

            }else {
                var tabStatut = new Array();
                $.ajax({
                    cache: false,
                    url: 'ajax/get_statut_patient.php',
                    data: '',
                    dataType: 'json',
                    async: false,
                    success: function (json) {
                        $.each(json, function (index, value) {
                            var taTemp = new Array();
                            taTemp.push(value.id_status);
                            taTemp.push(value.libelle_status);
                            tabStatut.push(taTemp);
                        });
                    }
                });
                var nb_p=0;
                var nb_t=0;
                var nb_abe=0;
                var nb_abne=0;
                $.each(json, function (index, value) {


                    $('#historique_patient_prendre_rdv_calendar').show();
                    var background = "";
                    if(value.status_rdv == "rdvplanifie"){
                        background = "color:#27a1c2;";
                        nb_p++;
                    }else if(value.status_rdv == "patienttraite"){
                        background = "color:lime;";
                        nb_t++;
                    }else if(value.status_rdv == "absenceexcusee"){
                        background = "color:orange;";
                        nb_abe++;
                    }else if(value.status_rdv == "absencenonexcusee" || value.status_rdv == "annulationparsms" || value.status_rdv == "annulationparvocal"){
                        background = "color:red;";
                        nb_abne++;
                    }
                    var str_abr_praticien = value.abreviation_praticien;
                    var str_abr_motif = value.abreviation_rdv;

                    /*
                    var boucle_historique = ' <tr><td class="'+value.status_rdv+'" data-category="'+value.status_rdv+'" style="'+background+'">' +
                        'Dr. ' + str_abr_praticien.toUpperCase() + ' - '+value.date_rdv + ' à ' + value.heure_rdv + ' - ' +str_abr_motif.toUpperCase();

                    boucle_historique += '</td></tr>';
                    */
                    if(value.status_rdv != ""){
                        var boucle_historique = '<div class="element-item col-sm-12 '+value.status_rdv+'" data-category="'+value.status_rdv+'" style="border:1px solid #CCCCCC;padding-top: 1px;padding-bottom: 1px;padding-right: 0px;padding-left: 0px; '+background+'">' +
                            value.abre_civilite_docteur +' ' + str_abr_praticien.toUpperCase() + ' - '+value.date_rdv + ' à ' + value.heure_rdv + ' - ' +str_abr_motif.toUpperCase()+'<br/>'+
                            '<span style="color:#000;">'+value.remarque_rdv+'</span>'+
                            '</div>';
                    }

                    $('#boucle_historique_prendre_rdv_calendar').append(boucle_historique);

                });

                var txt_p = " Pl.";
                if(nb_p>1){
                    txt_p = " Pl.";
                }
                var txt_t = " Tr.";
                if(nb_t>1){
                    txt_t = " Tr.";
                }
                var txt_abe = " Abs. Ex.";
                if(nb_abe>1){
                    txt_abe = " Abs. Ex.";
                }
                var txt_abne = " Abs. Non Ex.";
                if(nb_abne>1){
                    txt_abne = " Abs. Non Ex.";
                }
                $('#libelle_rdv_planifie').html(nb_p+txt_p);
                $('#libelle_rdv_traite').html(nb_t+txt_t);
                $('#libelle_rdv_ab_excusee').html(nb_abe+txt_abe);
                $('#libelle_rdv_ab_non_excusee').html(nb_abne+txt_abne);

                $('#boucle_historique_prendre_rdv_calendar').isotope({
                 itemSelector: '.element-item',
                 filter: '.patienttraite'
                });

                /*$('#boucle_historique_prendre_rdv_calendar').mCustomScrollbar({
                    theme:"widget-theme"
                });*/
            }
        }
    });

    return false;
  }


  function btn_calendar_mobile_day_prev(){
      var tabactive = $('#tabactive').val();
      $('#calendar_'+tabactive).fullCalendar( 'prev' );
  }

  function btn_calendar_mobile_day_next(){
      var tabactive = $('#tabactive').val();
      $('#calendar_'+tabactive).fullCalendar( 'next' );
  }

  function extractContent(html) {
      return (new DOMParser).parseFromString(html, "text/html").documentElement.textContent;
  }


  function supp_bouton_vert(idrdv){
      var tabactive = $('#tabactive').val();
      $('#calendar_'+tabactive).fullCalendar('removeEvents', idrdv);
  }

  function changedaterdvrecurrent(ladate, lebouton, ladecoupe, joursemaine, dateaff, heureaff, jourliteral) {
      $('.'+ladate).removeClass('btn_widget_standard');
      $(lebouton).addClass('btn_widget_standard');
      $('#tabrdvrecurrenthidden-'+ladate).val(ladecoupe);
      $('#jourchoisi-'+ladate).html(jourliteral+" à "+heureaff);


      //alert(vals);
  }

  function modifier_ligne_date_reccurent(id_jour_table){
    $('#modalPrendreRendezVousRecurrent').modal('show');
    $('#praticien_prendre_rendez_vous_recurrent').val($('#id_praticien_prendre_rdv_calendar').val());
    $('#lieu_prendre_rendez_vous_recurrent').val($('#id_lieu_prendre_rdv_calendar').val());
    $('#consultation_prendre_rendez_vous_recurrent').val($('#type_rdv_calendar').val());
    $('#id_jour_recurrent').val(id_jour_table);

    var tabInfo = id_jour_table.split('-');
    $('#datepicker_rdv_recurrent').val(tabInfo[2]+"/"+tabInfo[1]+"/"+tabInfo[0]);
    $('#jour_prendre_rendez_vous_recurrent').val("");
    $('#horaire_prendre_rendez_vous_recurrent').val("");

    $('#datepicker_force_rdv_recurrent').val(tabInfo[2]+"/"+tabInfo[1]+"/"+tabInfo[0]);
    $('#heure_force_rdv_recurrent').val("");

    recherche_rdv_prendre_rendez_vous_recurrent();
  }


  function supprimer_ligne_date_reccurent(ligneasupp){
      $( "#"+ligneasupp ).hide('slow', function(){ $( "#"+ligneasupp ).remove(); });
  }

  function reduire_div_information_patient() {
    if ($('#div_info_patient_historique_complet').is(":hidden")) {
        $('#div_info_patient_historique_complet').show('slow');
        $('#div_title_historique').show();
    }else{
        $('#div_info_patient_historique_complet').hide('slow');
        $('#div_title_historique').hide();
    }

  }

</script>

{/literal}