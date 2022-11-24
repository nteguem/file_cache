<script type="text/javascript" src="js/liste_e1.{listeEl}.js"></script>

<div class="vd_title-section clearfix">
  <div class="vd_panel-header no-menu">
    <h1>Agenda</h1>
    <small class="subtitle">Gérer votre prise de Rendez-Vous</small> {$sMessage}</div>
</div>
<div class="vd_content-section clearfix">
  <div class="row">
    
    <div class="col-sm-3">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-heading no-title"> </div>
        <div class="panel-body">
          <h2 class="mgtp--5 mgbt-xs-20"> <strong></strong> <span class="font-light">Recherche Dispo</span> </h2>
          <div id="external-events">
            <form class="inline-form">
              <input type="hidden" value="{$idc}" id='idc' />
              <input type="hidden" name="dir" value="{$dir}">
              <div class="input-group">
            <div class="form-group">
               <label class="col-sm-2 control-label">Motif de RDV</label>
                <select name="rdv" id="selecttyperdv">
                  
                </select>
              </div>
               <div class="form-group" id="divlieux">
               <label class="col-sm-2 control-label">Lieu</label>
                <select name="idlieu" id="selectlieux">
                 
                </select>
              </div>
               <div class="form-group" id="divpraticien">
               <label class="col-sm-2 control-label">Praticien</label>
                <select name="praticien" id="selectpraticien">
                  
                </select>
              </div>
              <button  type="submit">Rech</button>

                <!-- /btn-group --> 
              </div>
            </form>
            <br/>
            <div id="events"> </div>
            <br/>
            <div class="vd_checkbox checkbox-success">
              <input type="checkbox"  id="drop-remove">
              <label for="drop-remove"> Remove after drop </label>
            </div>
          </div>
          <!-- #external-events --> 
        </div>
        <!-- panel-body --> 
      </div>
      <!-- panel --> 
    </div>
    <!-- col-sm-3 --> 

    <div class="col-sm-9">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-body">
          <div id="fullcalendar" class="mgtp-10"> </div>
        </div>
      </div>
    </div>
    <!-- col-sm-9-->
  </div>
  <!-- row --> 
  
</div>
<!-- .vd_content-section --> 

{literal}
<!-- Calendar -->

<script type="text/javascript">
$(window).load(function() 
  {
  "use strict";

    function renderCalendar(){

        if (!jQuery().fullCalendar) {
            return;
        }

        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();


    var h = {
      left: 'title, prev,next',
      center: '',
      right: 'today,month,agendaWeek,agendaDay'
    };


        function initDragObject(element) {
            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim(element.text()) // use the element's text as the event title
            };
            // store the Event Object in the DOM element so we can get to it later
            element.data('eventObject', eventObject);
            // make the event draggable using jQuery UI
            element.draggable({
                zIndex: 999,
                revert: true, // will cause the event to go back to its
                revertDuration: 0 //  original position after the drag
            });
        }

        var addEvent = function (title) {
            title = title.length == 0 ? "Untitled Event" : title;
            var html = $('<div class="external-event btn vd_btn vd_bg-blue btn-xs mgr-10 mgbt-xs-10" style="" role="button">' + title + '</div>');
            jQuery('#events').append(html);
            initDragObject(html);
        }




        
        $('#external-events div.external-event').each(function () {
            initDragObject($(this))
        });
    

        $('#event-add').unbind('click').click(function () {
            var title = $('#event-title').val();
            addEvent(title);
        });

    $('#event-title').keypress(function(event) {
      if (event.keyCode == 13) {
        event.preventDefault();
        $('#event-add').click();
      }
    });     

        //predefined events
        $('#events').html("");

        $('#fullcalendar').html("");
        $('#fullcalendar').fullCalendar({

             header: h,
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!



            eventClick: function(calEvent, jsEvent, view) {
                //alert('Event: ' + calEvent.title+' '+calEvent.start+' '+calEvent.id);
                // change the border color just for fun 
                //$(this).css('border-color', 'red');
                enreg_planning(calEvent.title,calEvent.id,calEvent.start);
            },

             dayClick: function(date, allDay, jsEvent, view) {
                enreg_planning();
             },

            drop: function (date, allDay) { // this function is called when something is dropped

                // retrieve the dropped element's stored Event Object
                var originalEventObject = $(this).data('eventObject');
                // we need to copy it, so that multiple events don't have a reference to the same object
                var copiedEventObject = $.extend({}, originalEventObject);

                // assign it the date that was reported
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;
                copiedEventObject.className = $(this).attr("data-class");

                // render the event on the calendar
                // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                $('#fullcalendar').fullCalendar('renderEvent', copiedEventObject, true);

                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            },
            events: [{/literal} {$planningdispo} {literal}]
        });

        

    }

  renderCalendar();

});



function recherche_client(nom,entite){

  var $idlepatient = $('#idlepatient');
   // on récupère la valeur du motif de rdv
    if(nom != '') {
      $idlepatient.empty(); // on vide la liste des lieu
      $.ajax({
        url: 'ajax/liste_patient.php',
        data: 'rech='+ nom+'&entite='+entite, //on envoie $_GET['selecttyperdv']
        dataType: 'json',
        success: function(json) {
          $.each(json, function(index, value) {
            //var element = String value.split('|');
            //console.log(value);
            //$selectrdv.append('<option value="'+ index +'" '+element[1]+'>'+ element[0] +'</option>');
            $idlepatient.append('<option value="'+ index +'" '+value.selected+'>'+ value.nom +'</option>');
          });
        }
      });
    }
    else {
      $idlepatient.empty();
    }

}

function enreg_planning(nondocteur,iddoteur,daterdv){

    //alert(daterdv);

    document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nondocteur;
    document.getElementById("idladate").value=daterdv.format('DD/MM/YYYY');
    document.getElementById("idheure").value=daterdv.format('HH:mm');
    document.getElementById("iddocteur").value=iddoteur;
  
  
    $('#myModal').modal('show');
}
</script>

{/literal}


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
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="ladate" id="idladate">
                              </div>

                            </div>

                            <div class="form-group">
                              <label class="col-sm-4 control-label">Heure</label>
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="heure" id="idheure">
                              </div>

                            </div>

                            <div class="form-group">
                              <label class="col-sm-4 control-label">Nom</label>
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="non"  onKeyUp="recherche_client(this.value,'{$idc}')">
                              </div>

                            </div>
                            <div class="form-group">
                              <label class="col-sm-4 control-label">Prénom</label>
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="prenom">
                              </div>

                            </div>
                            <div class="form-group">
                              <label class="col-sm-4 control-label">Téléphone</label>
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="tel">
                              </div>

                            </div>
                            <div class="form-group">
                              <label class="col-sm-4 control-label">email</label>
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="email">
                              </div>

                            </div>

                            <div class="form-group">
                              <label class="col-sm-4 control-label">Les patients</label>
                              <div class="col-sm-7 controls">
                                <select name="idpatient" id="idlepatient" size="6">

                                </select>
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
