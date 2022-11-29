<script type="text/javascript" src="js/datepicker-fr.{$datepickerFr}.js"></script>

<script type="text/javascript" src="js/liste_e5.{$listeE5}.js"></script>


{literal}
<style type="text/css">
.fc-time-grid .fc-slats td {
    height: 5em !important;
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
    aspectRatio: 0.8,
    lang: 'fr',         //langue francais
    editable: false,       //calendrier modifiable
    weekNumbers: true,      //on affiche le num de semaine
    hiddenDays: [ 0 ],      //on n'affiche pas le dimanche
    scrollTime: "08:00:00",   //le scroll débute à 7h
    minTime: "08:00:00",    //le calendar demarre à 7h
    maxTime: "22:00:00",    //le calendar fini à 20h
    slotEventOverlap: false,  //les event ne se chevoche pas
    defaultView: 'agendaWeek',  //afficher la semaine par defaut
    defaultDate: moment('{/literal}{$datedebutaff}{literal}'),
    slotMinutes: 15,
    allDaySlot: false,
    events: {
      url: 'ajax/myfedd.php',
      type: 'GET',
      async: true,

      data: function() {
        return {
          dateposition: '{/literal}{$datedebutaff}{literal}',
          idlieu: $('#idpasselieu').val(),
          praticien: $('#idpassepraticien').val(),
          rdv:$('#idpasserdv').val(),
          validation:$('#idpassevalidation').val() 
        };
      }
    },
    eventClick: function(calEvent, jsEvent, view) {
      if (calEvent.dispo=="") {
        enreg_planning(calEvent.title,calEvent.id,calEvent.start,calEvent.idrdv,calEvent.end,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.idrdvaff,jsEvent);
      }else if(calEvent.dispo=="ok"){
        enreg_planning(calEvent.title,calEvent.id,calEvent.start,calEvent.idrdv,calEvent.end,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.idrdvaff,jsEvent);
      }else if(calEvent.dispo=="not"){
        return false;
      }
    },
    dayClick: function(date, jsEvent, view) {
      enreg_planning_seul(document.getElementById("idpassepraticien").value,document.getElementById("idpasselieu").value,document.getElementById("idpasserdv").value,date.format('DD/MM/YYYY'),date.format('HH:mm'),'');
    },
    eventRender: function(event, element) {
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
    },
    eventMouseover: function(calEvent, jsEvent) {
      var tooltip = '<div id="tooltipevent" class="tooltipevent" style="width:100px;height:100px;background:#ccc;position:absolute;z-index:10001;">' + calEvent.title + '</div>';
      
      if (calEvent.dispo=="") {
        $("body").append(tooltip);
        $(this).mouseover(function(e) {
          $(this).css('z-index', 10000);
          $('#tooltipevent').fadeIn('500');
          $('#tooltipevent').fadeTo('10', 1.9);
        }).mousemove(function(e) {
          $('#tooltipevent').css('top', e.pageY + 10);
          $('#tooltipevent').css('left', e.pageX + 20);
        });
      }else if(calEvent.dispo=="ok"){
        $("body").append(tooltip);
        $(this).mouseover(function(e) {
          $(this).css('z-index', 10000);
          $('#tooltipevent').fadeIn('500');
          $('#tooltipevent').fadeTo('10', 1.9);
        }).mousemove(function(e) {
          $('#tooltipevent').css('top', e.pageY + 10);
          $('#tooltipevent').css('left', e.pageX + 20);
        });
      }else if(calEvent.dispo=="not"){
        element.find("fc-event").css( "cursor", "auto");
        return false;
      }
    },
    eventMouseout: function(calEvent, jsEvent) {
      $(this).css('z-index', 8);
      $('#tooltipevent').remove();
    }

  });


  //var custom_buttons = 'test';
  //$('.fc-button-group').parent('div').after(custom_buttons);
});


function enreg_planning(nompatient,idrdv,daterdv,idrdv,heurefin,nomdocteur,iddocteur,idlieu,idtyperdv,jsEvent){

    //alert(idrdv);

    document.getElementById("myModalLabel").innerHTML="Rendez vous avec le "+nomdocteur;
    document.getElementById("idladate").value=daterdv.format('DD/MM/YYYY');
    document.getElementById("idheure").value=daterdv.format('HH:mm');
    
    // $('#myModalinfordv').modal('show');
   if(idrdv==0){
      document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV avec le docteur "+nomdocteur+" le "+daterdv.format('DD/MM/YYYY');
      document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+iddocteur+"&ladate="+daterdv.format('DD/MM/YYYY')+"&heuredebut="+daterdv.format('HH:mm')+"&heurefin="+heurefin.format('HH:mm')+"&idlieu="+idlieu+'&idtyperdv='+idtyperdv;
      $('#myModalinfordv').modal('show');
    }else{
      document.getElementById("myModalLabelinfordv").innerHTML="Rendez vous patient "+nompatient+" du "+daterdv.format('DD/MM/YYYY');
      document.getElementById("iframerdv").src="modal_fiche_rdv_patient.php?idrdv="+idrdv+"&jsEvent"+jsEvent;
      $('#myModalinfordv').modal('show');
    }
}

function enreg_planning_seul(idpraticien,idlieu,idrdv,date,heuredebut,heurefin){

   document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV en direct ";

   document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+idpraticien+"&ladate="+date+"&heuredebut="+heuredebut+"&heurefin="+heurefin+"&idlieu="+idlieu+'&idtyperdv='+idrdv;
     $('#myModalinfordv').modal('show');
}

function rafraichir_calendrier(idlieu,idpratcien,idrdv,validation){
  var sidpasselieu = document.getElementById(idlieu).value;
  var sidpratcien = document.getElementById(idpratcien).value;
  var sidrdv = document.getElementById(idrdv).value;

  document.getElementById("idpasselieu").value = sidpasselieu;
  document.getElementById("idpassepraticien").value = sidpratcien;
  document.getElementById("idpasserdv").value = sidrdv;
  document.getElementById("idpassevalidation").value=validation;

  if(sidpratcien==0 || sidpratcien==''){
    $('#divtextenteteplanning').html("<b>Planning Général</b>");
  }else{
    $.ajax({
      url: 'ajax/get_info_user.php',
      data: 'iduser='+document.getElementById("idpassepraticien").value,
      dataType: 'json',
      success: function(json) {
        $.each(json, function(index, value) {
          $('#divtextenteteplanning').html("<b>Planning du Dr. "+value.prenom+" "+value.nom+"</b>");
        });
      }
    });
  }
  $('#calendar').fullCalendar('refetchEvents');

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
<input type="hidden" name="passepraticien" id="idpassepraticien">
<input type="hidden" name="passelieu" id="idpasselieu">
<input type="hidden" name="passerdv" id="idpasserdv">
<input type="hidden" name="passevalidation" id="idpassevalidation">

  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-body">
          <div >
            <a href="#" onclick="$('#myModalfiltremedecin').modal('show');" alt="Sélectionner le planning à afficher" title="Sélectionner le planning à afficher"><img src="img/logo_afficher_agenda.gif" border="0" height="40px" /></a>
            &nbsp;&nbsp;&nbsp;
            <a href="#" onclick="$('#myModalfiltrrdv').modal('show');" alt="Aller au prochain RDV disponible" title="Aller au prochain RDV disponible"><img src="img/Picto_Chercher_RDV.gif" border="0" height="40px" /></a>
                  <h2 id="divtextenteteplanning" align="center"><b>Planning Général</b></h2>
          </div>
          <div style="height:10px"></div>
          
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
                                <input type="hidden" value="{$idc}" id='idc' />
                             <input type="hidden" value="3" id='all' />
                           
                              {*<div class="form-group">
                                <div class="col-sm-3 controls">*}
                                    <table>
                                      <tr>
                                        <td>
                                  <div id="datepicker-widget"></div>
                                  {literal}
                                  <script type="text/javascript">
                                     $("#datepicker-widget").datepicker({
                                      dateFormat: 'dd/mm/yy',
                                      onSelect: function(date){
                                        // var tab= date.split('/');
                                        //alert(tab[0]);
                                        //lejour = tab[1]+"/"+tab[0]+"/"+tab[2];
                                        lejour = date;
                                        document.getElementById('iddateplanning').value=lejour;
                                        document.getElementById('divaff').innerHTML="<b>Planning à la date de "+lejour+"</b>";

                                      }

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
                                          <select  name="rdv" id="selecttyperdv">
                                                <option value="">Indifférent</option>
                                                {foreach from=$aTableaurdv item=objRDV}
                                                  <option value="{$objRDV.id_type_rdv}">{$objRDV.libelle_type_rdv}</option>
                                                {/foreach}
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
                                             <select  name="idlieu" id="selectlieux">
                                                <option value="">Indifférent</option>
                                                {foreach from=$aTableauLieux item=objLieu}
                                                  <option value="{$objLieu.id_lieux}">{$objLieu.nom_lieux}</option>
                                                {/foreach}
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
                                             <select  name="praticien" id="selectpraticien">
                                                <option value="">Indifférent</option>
                                                {foreach from=$aTableaupraticien item=objUser}
                                                  <option value="{$objUser.id_user}">{$objUser.prenom_user} {$objUser.nom_user}</option>
                                                {/foreach}
                                          </select>
                                        </td>
                                       </tr>
                                     </table>
                                </td>
                              </tr>
                                </table>
                               
                                  <br>
                            

                            <div class="col-sm-6" align="right">
                                 <button type="button"  class="btn vd_btn vd_bg-blue vd_white" onclick="rafraichir_calendrier('selectlieux','selectpraticien','selecttyperdv',''); $('#myModalfiltremedecin').modal('hide');">Afficher</button>&nbsp;&nbsp;
                                <button type="button" class="btn vd_btn vd_bg-gray " onclick="
  $('#myModalfiltremedecin').modal('hide');">Annuler</button>
                           
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
                        <div class="modal-body"> 

                            <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           

                             <input type="hidden" value="ok" name='validation' />
                              <input type="hidden" name="dir" value="{$dir}">
                                <input type="hidden" value="{$idc}" id='idc' />
                             <input type="hidden" value="1" id='all' />
                           
                              {*<div class="form-group">
                                <div class="col-sm-3 controls">*}
                                    <table>
                                      <tr>
                                        <td>
                                  <div id="datepickerrdv-widget"></div>
                                  {literal}
                                  <script type="text/javascript">
                                     $("#datepickerrdv-widget").datepicker({
                                      dateFormat: 'dd/mm/yy',
                                      onSelect: function(date){
                                       // var tab= date.split('/');
                                        //alert(tab[0]);
                                        //lejour = tab[1]+"/"+tab[0]+"/"+tab[2];
                                        lejour = date;
                                        document.getElementById('iddateplanningrdv').value=lejour;
                                        document.getElementById('divaffrdv').innerHTML="<b>RDV disponible à partir de la date de "+lejour+"</b>";

                                      }

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
                                          <input type="hidden" id="iddateplanningrdv" name="datedebutrech">
                                          <div id="divaffrdv"></div>
                                        </td>
                                       </tr>
                                      <tr>
                                        <td>
                                           <b>Motif de RDV </b>&nbsp;&nbsp;
                                         </td>
                                        <td>
                                             <select  name="rdv" id="selecttyperdv2">

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
                                             <select  name="idlieu" id="selectlieux2">

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
                                             <select  name="praticien" id="selectpraticien2">

                                          </select>
                                        </td>
                                       </tr>
                                     </table>
                                </td>
                              </tr>
                                </table>
                               
                                  <br>
                            

                            <div class="col-sm-6" align="right">
                                 <button type="button"  class="btn vd_btn vd_bg-blue vd_white"  onclick="rafraichir_calendrier('selectlieux2','selectpraticien2','selecttyperdv2','ok'); $('#myModalfiltrrdv').modal('hide');">Rechercher</button>&nbsp;&nbsp;
                                <button type="button" class="btn vd_btn vd_bg-gray " onclick="
  $('#myModalfiltrrdv').modal('hide');">Annuler</button>
                           
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