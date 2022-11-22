<?php $listeDispo = filemtime(PATH_ASSETS . 'js/liste_dispo.js')
<script type="text/javascript" src="js/liste_dispo.<?php echo $listeDispo ?>.js"></script>

{literal}
<style type="text/css">
  .stripe-salle-attente {
    background: repeating-linear-gradient(
            45deg,
            #606dbc,
            #606dbc 15px,
            #465298 15px,
            #465298 30px
    );
  }

  .stripe-salle-attente_fils {
    background: repeating-linear-gradient(
            45deg,
            #606dbc,
            #606dbc 15px,
            #465298 15px,
            #465298 30px
    );

    border-color: #f85d2c !important;
  }

  .fils_simple {
     border-color: #f85d2c !important;
  }

</style>
  <?php $planningDispo = filemtime(PATH_ASSETS . 'js/js_planning_dispo.js') ?>
  <script type="text/javascript" src="js/js_planning_dispo.<?php echo $planningDispo ?>.js"></script>

<!-- Calendar -->
<script type="text/javascript">
  $(document).ready(function() {
    affiche_bouton_coller('copiecookie{/literal}{$id_salle}{literal}');
    });

  var oplus = {/literal}{if $isOplus} true {else} false{/if}{literal};


  function open_modal(){

    //document.getElementById("myModalLabelinfordv").innerHTML="";
    $('#myModalLabelinfordv').html("");
    document.getElementById("iframerdv").src="modal_disponibilite_box.php?idbox={/literal}{$id_salle}{literal}";
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');

  }

  function open_modal_update(idunique, idtranche,iduniquepere,idtranchepere){

    document.getElementById("myModalLabelinfordv").innerHTML="";


    if(idtranchepere==null){
        if(oplus)
          document.getElementById("iframerdv").src="modal_disponibilite_partition_box.php?idbox={/literal}{$id_salle}{literal}&idunique="+idunique+"&idtranche="+idtranche;
        else
         document.getElementById("iframerdv").src="modal_disponibilite_box.php?idbox={/literal}{$id_salle}{literal}&idunique="+idunique+"&idtranche="+idtranche;
    }
    else
      document.getElementById("iframerdv").src="modal_disponibilite_partition_box.php?idbox={/literal}{$id_salle}{literal}&idunique="+iduniquepere+"&idtranche="+idtranchepere+"&actiontranche=modification&idtranchesup="+idtranche;

    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');

  }


  function open_modal_del(){

    document.getElementById("myModalLabelinfordv").innerHTML="";
    document.getElementById("iframerdv").src="modal_disponibilite_suppression_box.php?id_salle={/literal}{$id_salle}{literal}";
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');

  }

  function open_modal_duplicate(idunique, idtranche){

    document.getElementById("myModalLabelinfordv").innerHTML="";
    document.getElementById("iframerdv").src="modal_disponibilite_duplication_box.php?id_salle={/literal}{$id_salle}{literal}";
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');

  }

  function refresh_calendar(){
    $('#calendar_1').fullCalendar('refetchEvents');
  }


  function coller_semaine_box(nomcookie,ladate,id_salle){

      var elem = ladate.split('T');
      var elem2 = elem[0].split('-');
      aaaa =elem2[0];
      mm =elem2[1];
      jj =elem2[2];

      valeurcookie = readookie(nomcookie);
      isemainecoller= calcul_numero_semaine(ladate);
      if(valeurcookie!=null) {
          var tabcolle = valeurcookie.split('|');
          smessageconfime="Voulez vous copier la semaine "+tabcolle[0]+" de l'année "+tabcolle[1]+ " sur la semaine "+isemainecoller+" de l'année "+aaaa;
      }


      if(valeurcookie==null) {
          alert('Aucune semaine sélectionnée');
          return 0;
      }
      bconf = confirm(smessageconfime);

      if(bconf) {
          // alert(smessageconfime + " " + iduser);
          //annule_copier_box(nomcookie);
          location.replace('main.php?dir=gestdispobox&id_salle='+id_salle+'&duplicate=ok&semainecopie='+tabcolle[0]+'&semainecoller='+isemainecoller+'&annecopier='+tabcolle[1]+'&anneecoller='+aaaa);
      }
      else
          alert('rien');
  }

</script>
{/literal}



<div class="vd_title-section clearfix">
  <div class="vd_panel-header no-menu">
    <h1>{$TitreCalandrier}</h1>
    <small class="subtitle"></small>
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
    {if !$isOplus}
      <button type="button"  class="btn vd_btn vd_bg-green" onclick="open_modal();">Ajouter une disponibilité</button>      &nbsp;&nbsp;
      <button type="button"  class="btn vd_btn" style="color:#FFFFFF !important; background-color: #AB0000 !important;" onclick="open_modal_del();">Supprimer une tranche de disponibilité</button> &nbsp;&nbsp;
    {/if}
    <button type="button" class="btn vd_btn" style="color:#FFFFFF !important; background-color: #2dab28 !important;" onclick="var moment = $('#calendar_1').fullCalendar('getDate');DefSemaineNum(moment.format(),'copiecookie{$id_salle}');">copier la semaine </button>
    <input type="button" class="btn vd_btn" id="idboutoncoller" style="color:#FFFFFF !important; background-color: #2dab28 !important;display:none" onclick="var moment = $('#calendar_1').fullCalendar('getDate');coller_semaine_box('copiecookie{$id_salle}',moment.format(),{$id_salle});" value="coller" ></input>
    <input type="button" class="btn vd_btn" id="idboutonvidercache" style="color:#FFFFFF !important; background-color: red !important;display:none" onclick="annule_copier_box('copiecookie{$id_salle}')" value="Annule le copier" ></input>

</div>
<div class="vd_content-section clearfix">
  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-body">
          {literal}
            <!-- Calendar -->
            <script type="text/javascript">
             $(document).ready(function() {

              $('#calendar_1').fullCalendar({
                header: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'month,agendaWeek,agendaDay'
                },
                lang: 'fr',         //langue francais
                editable: false,       //calendrier modifiable
                weekNumbers: true,      //on affiche le num de semaine
                    //on n'affiche pas le dimanche
                scrollTime: "07:00:00",   //le scroll débute à 7h
                minTime: "07:00:00",    //le calendar demarre à 7h
                maxTime: "22:00:00",    //le calendar fini à 20h
                slotEventOverlap: false,  //les event ne se chevoche pas
                defaultView: 'agendaWeek',  //afficher la semaine par defaut
                allDaySlot: false,
                events:{
                  url: 'ajax/myfedd_tranche_box.php',
                  type: 'GET',
                  async: true,
                  dataType: 'json',
                  data: function() {
                    return {
                        id_salle: {/literal}{$id_salle}{literal}
                    };
                  }
                },
                eventRender: persoEventAfterRender,
                eventClick: function(calEvent, jsEvent, view) {
                  {/literal}{literal}open_modal_update(calEvent.idunique, calEvent.idtranche,calEvent.iduniquepere,calEvent.idtranchepere);{/literal}{literal}

                }
              });

               $('#calendar_1').fullCalendar( 'gotoDate', '{/literal}{$dateposition}{literal}');
             });
             function persoEventAfterRender(event, element, view) {
               if (event.actifplanning=="N") {

               }
             }



            </script>
          {/literal}
          <div id="calendar_1" class="mgtp-10"> </div>
        </div>
      </div>
    </div>
  </div>
</div>