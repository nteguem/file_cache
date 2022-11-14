{literal}
  <style type="text/css">

    .clockpicker-popover
    {
      z-index: 999999 !important;
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
      padding-top: 60px !important;
      /* display: flex;
       align-items: center;
       justify-content: center;*/
    }


  </style>
<script type="text/javascript">

  
  function open_modal(){
    document.getElementById("myModalLabelinfordv").innerHTML="{/literal}{$TitreModal}{literal}";
    document.getElementById("iframerdv").src="modal/modal_conge_praticien.php?identifiant_user={/literal}{$identifiant_user}{literal}";
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');
  }


  function open_modal_suppression(idunique, idplage){
    document.getElementById("myModalLabelinfordv").innerHTML="{/literal}{$TitreModalModif}{literal}";
    document.getElementById("iframerdv").src="modal/modal_suppression_conge.php?identifiant_user={/literal}{$identifiant_user}{literal}&idunique="+idunique+"&idplage="+idplage;
    $('#iframerdv').css("overflow-y", "scroll");
    $('#myModalinfordv').modal('show');
  }

  function refresh_calendar(){
    $('#calendar_1').fullCalendar('refetchEvents');
  }

  function open_modal_update(idunique, idplage){

    $.ajax({
      url: 'ajax/get_info_conge.php',
      data: 'idconge=' + idplage,
      dataType: 'json',
      success: function (json) {
        var sMessagetitre = 'Description du congé du '+json.dateconge+" de "+json.heuredebut+" à "+json.heurefin;
        $('#LabelmodalFichePatient').html(sMessagetitre);
        $('#idpage').val(idplage);
        $('#remarque_conge').val(json.remarque_conge_praticien);
        $('#libelleconge').val(json.description_conge_praticien);
        $('#heuredebut').val(json.heuredebut);
        $('#heurefin').val(json.heurefin);
      }
    });


    $('#modaldesctiption').modal('show');
  }

  function set_remarque(){

    $.ajax({
      url: 'ajax/set_info_conge.php',
      data: 'idconge=' +  $('#idpage').val()+'&remarque='+ $('#remarque_conge').val()+'&libelleconge='+ $('#libelleconge').val()+'&heuredebut='+ $('#heuredebut').val()+'&heurefin='+ $('#heurefin').val(),
      dataType: 'json',
      success: function (json) {
        var sMessagetitre = 'Description du congé du '+json.dateconge+" de "+json.heuredebut+" à "+json.heurefin;
        $('#LabelmodalFichePatient').html(sMessagetitre);

      }
    });
    const promise1 = new Promise((resolve, reject) => {
      setTimeout(() => {
        refresh_calendar();
      }, 50);
    });
   
    $('#modaldesctiption').modal('hide');
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
    <button type="button"  class="btn vd_btn vd_bg-green" onclick="open_modal();">Ajouter une plage pour les absences</button>
    <button type="button"  class="btn vd_btn vd_bg-red" onclick="open_modal_suppression('','');">Supprimer une plage d'absence</button>
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


              function suppression_conge_via_fenetre(){
                bconfirm = confirm('Confirmez-vous la suppression de ce congé ?');

                if (bconfirm) {
                  supprimerTrancheConge($('#idpage').val());
                  refresh_calendar();
                  $('#modaldesctiption').modal('hide');
                }

              }


             $(document).ready(function() {



              $('#calendar_1').fullCalendar({
                header: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'month,agendaWeek,agendaDay,listYear'
                },
                buttonText : {
                    listYear:     'Liste Annuelle'
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
                  url: 'ajax/myfedd_conge.php',
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
                  var u=0;
                }
              });
            });


             function persoEventAfterRenderAll(event, element, view) {
               var menu1 = [
                 {'Supprimer la fermeture': {
                     onclick: function (menuItem, menu) {
                       bconfirm = confirm('Confirmez-vous la suppression de la fermeture ?');
                       if (bconfirm) {
                         supprimerTrancheConge(event.id_conge, id_user, event);
                       }

                       $(".menu_custom_alaxione").hide();
                       return true;
                     },
                     title: 'Supprimer la fermeture'
                   }
                 }
               ];


               element.bind('mousedown', function (e) {
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

               });

             }
          </script>
          {/literal}
          <div id="calendar_1" class="mgtp-10"> </div>
        </div>
      </div>
    </div>
  </div>
</div>


<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modaldesctiption" tabindex="-1" role="dialog" aria-labelledby="LabelmodalPrendreRendezVous" aria-hidden="false" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog" id="fiche_rdv" style="width: 793px;" data-backdrop="static" data-keyboard="false">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="LabelmodalFichePatient">Fiche patient </h4>
      </div>
      <div class="modal-body" style="height: 500px;">
      <input type="hidden" id="idpage">


      {literal}


        <div class="form-group">
          <div class="col-sm-12 controls" style="padding: 20px;">
            <div  id="divdatedebut">
              <label >Libellé absence</label>
              <div class="input-group">
                <input type="text" value="Congés" name="libelleconge" id="libelleconge" size="60" required class="required ">
              </div>
            </div>
          </div>


          <div class="col-sm-6 controls"  style="padding: 20px;">
            <div class="input-group" id="divheuredebut0">
              <label>Heure de début </label>
              <div class="input-group bootstrap-timepicker">
                <input type="text" id="heuredebut"
                       name="heuredebut"
                       value="00:00"
                       class="input-modal-date-left" >
                <span class="input-group-addon input-modal-date-right"
                      id="timepicker-default-span">
                                                                <i class="fa fa-clock-o"></i>
                                                          </span>
              </div>
            </div>
          </div>


          <script type="text/javascript">
            $(document).ready(function () {
              $("#heuredebut").clockpicker({
                placement: 'top',
                autoclose: true
              });
              $("#heuredebut").mask("99:99");
            });
            var posdisplayheuredebut = 1;
            var posdisplayheurefin = 1;

            function open_tranche(compte) {
              sdivfin = "divheurefin" + compte;
              sdivdebut = "divheuredebut" + compte;
              document.getElementById(sdivfin).style.display = "block";
              document.getElementById(sdivdebut).style.display = "block";
              compte = compte + 1;
              //alert(compte);
              return compte;
            }

          </script>

          <div class="col-sm-6 controls"  style="padding: 20px;">
            <div class="input-group" id="divheuredebut0">
              <label>Heure de fin </label>
              <div class="input-group bootstrap-timepicker">
                <input type="text" id="heurefin"
                       name="heurefin"
                       value="23:59"
                       class="input-modal-date-left" >
                <span class="input-group-addon input-modal-date-right"
                      id="timepicker-default-span">
                     <i class="fa fa-clock-o"></i>
                </span>
              </div>
            </div>
          </div>


          <script type="text/javascript">
            $(document).ready(function () {
              $("#heurefin").clockpicker({
                placement: 'top',
                autoclose: true
              });
              $("#heurefin").mask("99:99");
            });
            var posdisplayheuredebut = 1;
            var posdisplayheurefin = 1;

            function open_tranche(compte) {


              sdivfin = "divheurefin" + compte;
              sdivdebut = "divheuredebut" + compte;
              document.getElementById(sdivfin).style.display = "block";
              document.getElementById(sdivdebut).style.display = "block";
              return compte;

            }
          </script>

      {/literal}



          <div class="col-sm-12 controls"  style="padding: 20px;" >
            <div  id="divdatedebut">
              <label >Remarque</label>
              <div class="input-group">
                 <textarea placeholder="Remarque conge" name="remarque_conge" id="remarque_conge" style="height: 100px;width: 500px;"></textarea>
              </div>
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-12 controls" align="center">
            <button type="button" onclick="bconf=confirm('Voulez vous mettre à jour ce congé');if(bconf)set_remarque()" name="updateButton" id="updateButton" class="btn vd_btn" style="background-color: #5D9AD4;
          -webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px;
          -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
          -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;"><span class="menu-icon"></span> Valider</button>
            <button type="button" onclick="suppression_conge_via_fenetre();" name="updateButton" id="updateButton" class="btn vd_btn" style="background-color: #f85d2c;
          -webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px;
          -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver
          -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;"><span class="menu-icon"></span> Supprimer</button>

          </div>
        </div>

      </div>


    </div>
  </div>
</div>