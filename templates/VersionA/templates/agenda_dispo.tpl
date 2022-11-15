<?php $liste_e5 = filemtime(PATH_ASSETS.'js/liste_e5'); ?>
<script type="text/javascript" src="js/liste_e5.<?php echo $liste_e5 ?>.js"></script>


{literal}
<style type="text/css">
.fc-time-grid .fc-slats td {
    height: 5em !important;
}

.stylegreen{
  background-color: #00ff00;
}
</style>



<!-- Calendar -->
<script type="text/javascript">
 



  $(document).ready(function() {



  $('#calendar').fullCalendar({
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
     aspectRatio: 0.6,
    lang: 'fr',         //langue francais
    editable: false,       //calendrier modifiable
    weekNumbers: true,      //on affiche le num de semaine
    hiddenDays: [ 0 ],      //on n'affiche pas le dimanche
    scrollTime: "07:00:00",   //le scroll débute à 7h
    minTime: "07:00:00",    //le calendar demarre à 7h
    maxTime: "22:00:00",    //le calendar fini à 20h
    slotEventOverlap: false,  //les event ne se chevoche pas
    defaultView: 'agendaWeek',  //afficher la semaine par defaut
    defaultDate: moment('{/literal}{$datedebutaff}{literal}'),
    slotMinutes: 15,

  eventClick: function(calEvent, jsEvent, view) {
              //alert('Event: ' + calEvent.title+' '+calEvent.start+' '+calEvent.id);
              // change the border color just for fun 
              //$(this).css('border-color', 'red');
              enreg_planning(calEvent.title,calEvent.id,calEvent.start,calEvent.idrdv,calEvent.end,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu);
          },
  eventRender: function(event, element) {                                          
      element.find("div.fc-content").css( "background-color", event.couleurrdv);

  },
    /* dayClick: function(date, allDay, jsEvent, view) { 
                $('#myModal').modal('show');
             },*/

    events: [
      {/literal}
        {$sListevent}
      {literal}
    ],

  });
});



function enreg_planning(nompatient,idrdv,daterdv,idrdv,heurefin,nomdocteur,iddocteur,idlieu){

    //alert(idrdv);

    document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nomdocteur;
    document.getElementById("idladate").value=daterdv.format('DD/MM/YYYY');
    document.getElementById("idheure").value=daterdv.format('HH:mm');
    
    // $('#myModalinfordv').modal('show');
   if(idrdv==0){
      document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV avec le docteur "+nomdocteur+" le "+daterdv.format('DD/MM/YYYY');
      document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+iddocteur+"&ladate="+daterdv.format('DD/MM/YYYY')+"&heuredebut="+daterdv.format('HH:mm')+"&heurefin="+heurefin.format('HH:mm')+"&idlieu="+idlieu;
      $('#myModalinfordv').modal('show');
    }else{
     /* $('#myModalinfordv').css('width','850px');
      $('#myModalinfordv').css('margin','100px auto 100px auto');*/

      document.getElementById("myModalLabelinfordv").innerHTML="Rendez vous patient "+nompatient+" du "+daterdv.format('DD/MM/YYYY');
    
       document.getElementById("iframerdv").src="modal_fiche_rdv_patient.php?idrdv="+idrdv;
      $('#myModalinfordv').modal('show');
    }
}

function close_modal_prinicpal(){
  $('#myModalinfordv').modal('hide');
}





</script>
{/literal}


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

   <div class="row" id="form-basic">
            <div class="col-md-2">
                  <button type="button" onclick="$('#myModalfiltremedecin').modal('show');" class="btn vd_btn vd_bg-blue vd_white">
                    Planning</button>         

          </div>

           <div class="col-md-2">
                  <button type="button" onclick="$('#myModalfiltre').modal('show');" class="btn vd_btn vd_bg-blue vd_white">RDV disponible</button>         

          </div>

<br /><br>
  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-body">
          <div id="calendar" class="mgtp-10"> </div>
        </div>
      </div>
    </div>
    <!-- col-sm-12-->
  </div>
  <!-- row --> 
  
</div>
<!-- .vd_content-section --> 



<div class="modal fade" id="myModalfiltremedecin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header vd_bg-blue vd_white">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                          <h4 class="modal-title" id="myModalLabelfiltre">Sélectionner vos critères d'affichage</h4>
                        </div>
                        <div class="modal-body"> 

                            <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           

                             <input type="hidden" value="planning" name='validation' />
                              <input type="hidden" name="dir" value="{$dir}">
                           
                              {*<div class="form-group">
                                <div class="col-sm-3 controls">*}
                                    <table>
                                      <tr>
                                        <td>
                                  <div id="datepicker-widget"></div>
                                  {literal}
                                  <script type="text/javascript">
                                     $("#datepicker-widget").datepicker({
                                      onSelect: function(date){
                                        var tab= date.split('/');
                                        //alert(tab[0]);
                                        lejour = tab[1]+"/"+tab[0]+"/"+tab[2];
                                        document.getElementById('iddateplanning').value=lejour;
                                        document.getElementById('divaff').innerHTML="<b>Planning à la date de "+lejour+"</b>";

                                      },

                                     });

                                  </script>
                                  {/literal}
                                </td>
                                <td>
                                  &nbsp;&nbsp;&nbsp;
                                </td>
                                <td valign="top" align="center">
                                    <table>

                                       <tr>
                                          <td height="25px">

                                          </td>
                                       </tr>
                                      <tr>
                                        <td colspan="2">
                                          <input type="hidden" id="iddateplanning" name="datedebutrech">
                                          <div id="divaff"></div>
                                        </td>
                                       </tr>
                                      <tr>
                                        <td>
                                           <b>Motif de RDV </b>&nbsp;&nbsp;
                                         </td>
                                        <td>
                                             <select  name="rdv" class="selecttyperdv">

                                          </select>
                                        </td>
                                       </tr>
                                       <tr>
                                          <td height="15px">

                                          </td>
                                       </tr>
                                      <tr>
                                        <td>
                                           <b>Le lieu </b>&nbsp;&nbsp;
                                         </td>
                                        <td>
                                             <select  name="idlieu" class="selectlieux">

                                          </select>
                                        </td>
                                       </tr>
                                       <tr>
                                          <td height="15px">

                                          </td>
                                       </tr>
                                      <tr>
                                        <td>
                                           <b>Praticien</b>&nbsp;&nbsp;
                                         </td>
                                        <td>
                                             <select  name="praticien" class="selectpraticien">

                                          </select>
                                        </td>
                                       </tr>
                                     </table>
                                </td>
                              </tr>
                                </table>
                               {* </div>
                                </div>*}
                               
                                  <br>
                            

                            <div class="col-sm-6" align="right">
                                 <button type="submit"  class="btn vd_btn vd_bg-blue vd_white">Afficher</button>&nbsp;&nbsp;
                                <button type="button" class="btn vd_btn vd_bg-gray " onclick="
  $('#myModalfiltremedecin').modal('hide');">Annuler</button>
                           
                          </form>
                      </div>


                        </div>
</div>
</div>
</div>


<div class="modal fade" id="myModalfiltre" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header vd_bg-blue vd_white">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                          <h4 class="modal-title" id="myModalLabelfiltre">Modal title</h4>
                        </div>
                        <div class="modal-body"> 

                            <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           

                             <input type="hidden" value="{$idc}" id='idc' />
                             <input type="hidden" value="1" id='all' />
                             <input type="hidden" value="ok" name='validation' />
                              <input type="hidden" name="dir" value="{$dir}">
                          <div class="form-group">
                             <label class="col-sm-2 control-label">Motif de RDV</label>
                               <div class="col-sm-4 controls">
                                  <select  name="rdv" id="selecttyperdv">

                                  </select>
                              </div>

                         
                              <label class="col-sm-2 control-label">Le lieu</label>
                               <div class="col-sm-4 controls">
                                  <select name="idlieu" id="selectlieux">

                                  </select>
                              </div>                           
                              </div>
                              <div class="form-group">
                              <label class="col-sm-2 control-label">Praticien</label>
                               <div class="col-sm-4 controls">
                                  <select name="praticien" id="selectpraticien">

                                  </select>
                              </div>
                            </div>

                            <div class="col-sm-6">
                                           <button type="submit"  class="btn vd_btn vd_bg-blue vd_white">Les Prochains RDV disponibles</button>
                                      </div>
                             {*<div class="col-sm-6">
                                         
                                           <button type="submit"  class="btn vd_btn vd_bg-blue vd_white">Aller au prochain RDV</button>
                                      </div>*}
                          </form>
                      </div>


                        </div>
              </div>
</div>




<div class="modal fade" id="myModalinfordv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="width:850px">
                      <div class="modal-content">
                        <div class="modal-header vd_bg-blue vd_white">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                          <h4 class="modal-title" id="myModalLabelinfordv">Modal title</h4>
                        </div>
                        <div class="modal-body"> 

                        <iframe id="iframerdv" frameborder="0" width="800px"  height="600px"></iframe>
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