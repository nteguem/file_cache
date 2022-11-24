<script type="text/javascript" src="js/liste_dispo.{$listeDispo}.js"></script>

<div class="vd_title-section clearfix">
  <div class="vd_panel-header no-menu">
    <h1>{$TitreCalandrier}</h1>
    <small class="subtitle">Gestion des disponibilités</small> </div>
</div>
<div class="vd_content-section clearfix">
  <div class="row">
    
    <div class="col-sm-3">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-heading no-title"> </div>
        <div class="panel-body">
          <h2 class="mgtp--5 mgbt-xs-20"> <strong></strong> <span class="font-light">Création Dispo</span> </h2>
          <div id="external-events">
            <form class="inline-form">
             <input type="hidden" name="dir" value="{$dir}">
             <input type="hidden" name="id_user" value="{$id_user}" id="liduser">
              <input type="hidden" value="" id='idc' />
               <div class="form-group" id="divlieux">
               <label class="col-sm-4 control-label">Lieu</label>
                <select name="idlieu" id="idlieu">
                  <option value=""></option>
                    {section name=sec1 loop=$aTableauLieu}

                       <option value="{$aTableauLieu[sec1][0]}" {if $idlieu eq $aTableauLieu[sec1][0]}selected="selected"{/if}>{$aTableauLieu[sec1][1]}</option>

                    {/section}
                </select>
              </div>
              <div class="input-group">
            <div class="form-group">
               <label class="col-sm-4 control-label">Activité</label>
                <select name="rdv" id="selectactivite">
                  
                </select>
              </div>
               <div class="form-group" id="divpraticien">
               <label class="col-sm-4 control-label">Heure début</label>
              <input type="time" name="heuredebut" value="{$heureebut}">
              </div> 
              <div class="form-group" id="divpraticien">
               <label class="col-sm-4 control-label">Heure fin</label>
              <input type="time" name="heuredebut" value="{$heurefin}">
              </div> 
              
              
             <div class="form-group" id="divpraticien3">
             
                <input type="checkbox"  name="day[]" value="1" >Lundi</br>
                <input type="checkbox"  name="day[]" value="2">Mardi<br>
                <input type="checkbox"  name="day[]" value="3">Mercredi<br>
                <input type="checkbox"  name="day[]" value="4">Jeudi<br>
                <input type="checkbox"  name="day[]" value="5">Vendredi<br>
                <input type="checkbox"  name="day[]" value="6">Samedi<br>
                <input type="checkbox"  name="day[]" value="0">Dimanche<br>
           
              </div> 

              <div class="form-group" id="divpraticien">
               <label class="col-sm-6 control-label">Semaine séparée par ;</label>
              <input type="text" name="semaine" value="{$semaine}">
              </div> 
              
              

             
              <button  type="submit">Valider</button>

                <!-- /btn-group --> 
              </div>
            </form>
            <br/>
            <div id="events"> </div>
            <br/>
         
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


function enreg_planning(nondocteur,iddoteur,daterdv){

    //alert(daterdv);

    document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nondocteur;
    document.getElementById("idladate").value=daterdv.format('DD/MM/YYYY');
    document.getElementById("idheure").value=daterdv.format('HH:mm');
  
  
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
                            <input type="hidden" name="idlieu" value="" >
                            <input type="hidden" name="rdv" value="">
                            <input type="hidden" name="praticien" value="">
                            <input type="hidden" name="validation" value="creatiordv">

                             <div class="form-group">
                              <label class="col-sm-4 control-label">La date</label>
                              <div class="col-sm-7 controls">
                                <input class="input-border-btm" type="text" name="date" id="idladate">
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
                                <input class="input-border-btm" type="text" name="non">
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
