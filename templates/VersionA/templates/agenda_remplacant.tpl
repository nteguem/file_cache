{literal}


<script type="text/javascript">

  
  function open_modal(){
    document.getElementById("myModalLabelinfordv").innerHTML="{/literal}{$TitreModal}{literal}";
    document.getElementById("iframerdv").src="modal/modal_remplacant.php?identifiant_user={/literal}{$identifiant_user}{literal}";
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');
  }

  function open_modal_update(idunique, idplage){
    document.getElementById("myModalLabelinfordv").innerHTML="{/literal}{$TitreModalModif}{literal}";
    document.getElementById("iframerdv").src="modal/modal_remplacant.php?identifiant_user={/literal}{$identifiant_user}{literal}&idunique="+idunique+"&idplage="+idplage;
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');
  }
  function refresh_calendar(){
      $('#calendar_1').fullCalendar('refetchEvents');
  }
</script>
{/literal}

<div class="vd_title-section clearfix">
  <div class="vd_panel-header no-menu">
    <h1>{$TitreCalandrier}</h1>
    <small class="subtitle"></small>
  </div>
  <div class="col-sm-12">
    <button type="button"  class="btn vd_btn vd_bg-green" onclick="open_modal();">Ajouter une plage d'un remplaçant</button>
  </div>
  <div class="col-sm-12 hidden-xs" style="margin-top: 10px;">
    <a id="btn_mini_calendar" class="mega-link" href="javascript:void(0);" title="" onclick="affiche_mini_calendar();" >
      <span class="mega-icon">
          <i class="fa fa-calendar" style="font-size:xx-large;"></i>
      </span>
    </a>
    <div id="div_affiche_mini_calendar" style="position: absolute; z-index: 999;">
      <div align='center' id="datemenupicker"></div>
    </div>
  </div>
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
                //hiddenDays: [ 0 ],      //on n'affiche pas le dimanche
                scrollTime: "07:00:00",   //le scroll débute à 7h
                minTime: "07:00:00",    //le calendar demarre à 7h
                maxTime: "22:00:00",    //le calendar fini à 20h
                slotEventOverlap: false,  //les event ne se chevoche pas
                defaultView: 'agendaWeek',  //afficher la semaine par defaut
                allDaySlot: false,
                events:{
                  url: 'ajax/myfedd_remplacant.php',
                  type: 'GET',
                  async: true,
                  dataType: 'json',
                  data: function() {
                    return {
                      identifiant_user: '{/literal}{$identifiant_user}{literal}'
                    };
                  }
                },
                eventClick: function(calEvent, jsEvent, view) {
                  open_modal_update(calEvent.idunique, calEvent.idplage);

                }
              });
            });
          </script>
          {/literal}
          <div id="calendar_1" class="mgtp-10"> </div>
        </div>
      </div>
    </div>
  </div>
</div>