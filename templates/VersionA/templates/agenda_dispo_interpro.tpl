<script type="text/javascript" src="js/datepicker-fr.js"></script>


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
</style>

<script type="text/javascript">

function enreg_planning(nompatient, idrdv, daterdv, jsEvent, idcalendar){
    get_fiche_rendez_vous(idrdv);
    $('#modalFicheRendezVous').modal('show');
  $('#info_rdv_modal_link').click();
}

function enreg_planning_seul(idpraticien,idlieu,idrdv,date,heuredebut,heurefin,actimoduleexterne){


    if(actimoduleexterne==0){
      document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV en direct ";

      document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+idpraticien+"&ladate="+date+"&heuredebut="+heuredebut+"&heurefin="+heurefin+"&idlieu="+idlieu+'&idtyperdv='+idrdv;
     $('#myModalinfordv').modal('show');
    }else{
      alert('Synchronisation avec un module externe activée');
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

function getDate() {
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

  var dateTime = day+'/'+month+'/'+year;   
  return dateTime;
}

function actualise_calendrier(){
  {/literal}

  {foreach from=$tabPraticien item=tabP name=sTabPraticien}{literal}
    
    $('#calendar_'+{/literal}{$tabP.id_user}{literal}).fullCalendar('refetchEvents');

  {/literal}{/foreach}{literal}
}

function rafraichir_calendrier(idlieu,idrdv,validation,datedebut){
  var sdatedebut = "";

  {/literal}

  {foreach from=$tabPraticien item=tabP name=sTabPraticien}{literal}
    if(sdatedebut==""){
      sdatedebut = getDate();
    }
    //alert(sdatedebut);
    $('#datedebutaff_'+{/literal}{$tabP.id_user}{literal}).val(moment(sdatedebut, 'DD/MM/YYYY'));
    $('#calendar_{/literal}{$tabP.id_user}{literal}').fullCalendar( 'gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));

    if(document.getElementById('first_'+{/literal}{$tabP.id_user}{literal}).value =="0"){
      $('#calendar_'+{/literal}{$tabP.id_user}{literal}).fullCalendar('refetchEvents');
    }    

  {/literal}{/foreach}{literal}

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

function rafraichir_calendrier_interpro(datedebut,reinit){

    var sdatedebut = document.getElementById(datedebut).value;
    var sdatedebut2;

    if(reinit==1){
        sdatedebut = "";
    }

    {/literal}
    {foreach from=$tabPraticien item=tabP name=sTabPraticien}{literal}

    if(sdatedebut==""){
        sdatedebut = sgetDate();
        sdatedebut2 = sgetDate("YYYY-MM-DD");
    }else{
        sdatedebut2 = sdatedebut.substring(6, 10)+"-"+sdatedebut.substring(3, 5)+"-"+sdatedebut.substring(0, 2);
    }


    $('#datedebutaff_{/literal}{$tabP.id_user}{literal}').val(sdatedebut2);
    $('#calendar_{/literal}{$tabP.id_user}{literal}').fullCalendar( 'gotoDate', moment(sdatedebut, 'DD/MM/YYYY'));


    if(document.getElementById('first_'+{/literal}{$tabP.id_user}{literal}).value =="0"){
        $('#calendar_'+{/literal}{$tabP.id_user}{literal}).fullCalendar('refetchEvents');
    }

    {/literal}{/foreach}{literal}
}

$(document).ready(function() {

  var iduser = document.getElementById('iduser');
  var idc = document.getElementById('idc');
  var all = document.getElementById('all');
  var idinterpro = document.getElementById('idinterpro');

  iduser.value = {/literal}{$firstiduser}{literal};

  $(document).on( 'shown.bs.tab', '#ulcalendar a[data-toggle="tab"]', function (e) {
    var str = String(e.target);
    var res = str.split('#');
    var id_calendar = res[1].substring(3);
    $('#tabactive').val(id_calendar);
    window.localStorage.clear();
    if(document.getElementById('first_'+id_calendar).value =="1"){
      $('#calendar_'+id_calendar).fullCalendar('today');
      document.getElementById('first_'+id_calendar).value = "0";
    }else{
       $('#calendar_'+id_calendar).fullCalendar('refetchEvents');

    }

    $('#calendar_'+id_calendar).fullCalendar('gotoDate', moment($('#datedebutaff_'+id_calendar).val(), 'YYYY-MM-DD'));

    //rafraichir le select motif de rdv en fonction du praticien
    iduser.value = id_calendar;
    $.ajax({
      cache: false,
      url: 'ajax/liste_type_rdv.php',
      data: 'idc='+ idc.value+'&all='+all.value+'&interpro='+idinterpro.value+'&iduser='+iduser.value,
      dataType: 'json',
      success: function(json) {
        $.each(json, function(index, value) {
          $('#selecttyperdv2').append('<option value="'+ index +'">'+ value +'</option>');
        });
        $('#selecttyperdv2').change();
      }
    });
  });
});

function modal_widget_interpro(){
  document.getElementById("iframerdv").src="modal_widget_interpro.php?idinterpro="+$('#idinterpro').val();
  
  $('#myModalinfordv').modal('show');
  $('#myModalLabelinfordv').html('Suivez les étapes pour prendre un rendez-vous');
}


function modal_prendre_rendez_vous_anesthesiste_interpro(){
    //reinitialise_modal_prendre_rendez_vous_anesthesiste();
    reinitialise_modal_prendre_rendez_vous_anesthesiste_unique();
    $('#modalPrendreRendezVousAnesthesiste').modal('show');
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
  <input type="hidden" name="tabactive" id="tabactive">
  <input type="hidden" name="iduser" id="iduser">

  <div class="row">
    <div class="col-sm-12">
      <div class="panel widget light-widget panel-bd-top">
        <div class="panel-body">


          <div class="col-sm-12">
            <div align="center">

                {if $bActifAnesthesiste}
                  <button id="btn_prendre_rdv_anesthesiste" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_prendre_rendez_vous_anesthesiste_interpro();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Prendre un rendez-vous</button>
                {else}
                  <button id="btn_interpro_rdv" alt="Prendre un rendez-vous" title="Prendre un rendez-vous" onclick="modal_widget_interpro();"  type="button" class="btn vd_btn btn-besoin-aide" style="background-color: #AB0000;-webkit-border-bottom-right-radius: 5px; -webkit-border-bottom-left-radius: 5px; -moz-border-radius-bottomright: 5px; -moz-border-radius-bottomleft: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; -moz-box-shadow: 2px 2px 2px 0px silver;
  -webkit-box-shadow: 2px 2px 2px 0px silver;-o-box-shadow: 2px 2px 2px 0px silver;box-shadow: 2px 2px 2px 0px silver;">Prendre un rendez-vous</button>
                {/if}
            </div>
          </div>
          <div class="col-sm-12 controls hidden-xs">
            <a id="btn_mini_calendar" class="mega-link" href="javascript:void(0);" title="" onclick="affiche_mini_calendar();" >
                          <span class="mega-icon">
                              <i class="fa fa-calendar" style="font-size:xx-large;"></i>
                          </span>
            </a>
            <div id="div_affiche_mini_calendar" style="position: absolute; z-index: 999;">
              <div align='center' id="datemenupicker"></div>
            </div>
          </div>


          <div style="height:10px"></div>
            <ul id="ulcalendar" class="nav nav-tabs nav-justified">
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
                  <a href="#tab{$tabP.id_user}" sidtab="{$tabP.id_user}" data-toggle="tab">
                    <h4><b>Dr. {$tabP.nom_user}</b></h4>
                  </a>
                </li>
              {/foreach}
            </ul>
            <br/>
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
                      right: 'month,agendaWeek,agendaDay'
                    },
                    aspectRatio: 0.8,
                    lang: 'fr',         //langue francais
                    editable: false,       //calendrier modifiable
                    weekNumbers: true,      //on affiche le num de semaine
                    hiddenDays: [ 0 ],      //on n'affiche pas le dimanche
                    scrollTime: "{/literal}{$tabP2.affichage_agenda_heure_debut}{literal}",   //le scroll débute à 7h
                    minTime: "{/literal}{$tabP2.affichage_agenda_heure_debut}{literal}",    //le calendar demarre à 7h
                    maxTime: "{/literal}{$tabP2.affichage_agenda_heure_fin}{literal}",    //le calendar fini à 20h
                    slotEventOverlap: false,  //les event ne se chevoche pas
                    defaultView: 'agendaWeek',  //afficher la semaine par defaut
                    defaultDate: moment($('#datedebutaff_{/literal}{$tabP2.id_user}{literal}').val()).format('YYYY-MM-DD'),
                    //defaultDate: '2015-08-23',
                    slotMinutes: 15,
                    allDaySlot: false,
                    events:{
                      url: 'ajax/myfedd.php',
                      type: 'GET',
                      async: true,
                      dataType: 'json',
                      data: function() {
                        return {
                          idlieu: $('#idpasselieu').val(),
                          praticien: {/literal}{$tabP2.id_user}{literal},
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
                        //(nompatient, idrdv, daterdv, jsEvent, idcalendar)
                        //enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});
                        enreg_planning(calEvent.title, calEvent.idrdv, start, calEvent.id, {/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});
                      }else if(calEvent.dispo=="ok"){
                        enreg_planning(calEvent.title,calEvent.id,start,starth,calEvent.idrdv,end,endh,calEvent.nomdocteur,calEvent.iddocteur,calEvent.idlieu,calEvent.typerdvaff,calEvent.id,{/literal}{$smarty.foreach.sTabPraticien2.iteration}{literal});
                      }else if(calEvent.dispo=="not"){
                        return false;
                      }
                    },
                    dayClick: function(date, jsEvent, view) {
                      var leday = moment(date).format('DD/MM/YYYY'); 
                      var lhour = moment(date).format('HH:mm');
                      
                      //enreg_planning_seul({/literal}{$tabP2.id_user}{literal},document.getElementById("idpasselieu").value,document.getElementById("idpasserdv").value,leday,lhour,'',{/literal}{$bmoduleexterne}{literal});
                    
                    },
                    eventRender: function(event, element) {
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
                            element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                            //mode weekList (mon planning)
                            element.find("td.fc-list-item-title").html(event.picto+event.title);

                            //mode month (Mois)
                            element.find("span.fc-time").css( "display", "none");
                            element.find("span.fc-time").html("");
                            element.find("span.fc-time").text("");
                            element.find("span.fc-title").css( "color", "#000");
                            element.find("span.fc-title").html(event.picto+event.heureaffiche+event.title);
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
                            element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                        }else if(event.dispo=="not"){
                            element.find("div.fc-content").css( "background", "#ccc");
                            element.find("div.fc-bg").css( "background-color", "#ccc");
                            element.find("div.fc-content").css( "border-top-width", "0px");
                            element.find("div.fc-content").css( "border-top-style", "solid");
                            element.find("div.fc-time").css( "display", "none");
                            element.find("div.fc-time").html("");
                            element.find("div.fc-time").text("");
                            element.find("div.fc-title").css( "color", "#000");
                            element.find("div.fc-title").html(event.picto+event.heureaffiche+event.title);
                        }
                    },
                    eventMouseover: function(calEvent, jsEvent, element) {
                        var tooltip = '<div id="tooltipevent" class="tooltipevent coin_arrondi no-print hidden-xs" style="margin:10px;width:auto;height:auto;background:#ccc;position:absolute;z-index:10001;">';
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
                        return false;
                      }
                    },
                    eventMouseout: function(calEvent, jsEvent) {
                      $(this).css('z-index', 8);
                      $('#tooltipevent').remove();
                    }

                  });

                  
                });
  
                </script>
                {/literal}

                <input type="hidden" id="idpassepraticien" name="idpassepraticien" value="{$tabP2.id_user}">
                <input type="hidden" id="first_{$tabP2.id_user}" name="first_{$tabP2.id_user}" value="1">
                <div id="calendar_{$tabP2.id_user}" class="mgtp-10"> </div>
              </div>
            {/foreach}
            </div>
        </div>
      </div>
    </div>
    <!-- col-sm-12-->
  </div>
  <!-- row --> 
  
</div>
<!-- .vd_content-section --> 



<div class="modal fade" id="myModalfiltrrdv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="myModalLabelfiltre">Critères du prochain RDV disponible</h4>
      </div>
      <div class="modal-body" style="padding: 15px 0px 0px 0px;"> 
        <div class="panel-body" style="padding: 0px 0px 15px 0px;"> 
          <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           
            <input type="hidden" value="ok" name='validation' />
            <input type="hidden" name="dir" value="{$dir}">
            <input type="hidden" value="{$idc}" id='idc' />
            <input type="hidden" value="{$interpro}" id='idinterpro' />
            <input type="hidden" value="1" id='all' />
            
            <div class="col-sm-12">
              <div class="form-group">
                <div class="col-sm-6 controls">
                  <div id="datepickerrdv-widget"></div>
                  {literal}
                  <script type="text/javascript">
                    $("#datepickerrdv-widget").datepicker({
                      dateFormat: 'dd/mm/yy',
                      onSelect: function(date){
                        lejour = date;
                        document.getElementById('iddateplanningrdv').value=lejour;
                        document.getElementById('divaffrdv').innerHTML="<b>RDV disponible à partir de la date de "+lejour+"</b>";
                      }
                    });
                  </script>
                  {/literal}
                </div>
                <div class="col-sm-6 controls">
                  <div class="col-md-12">
                    <input type="hidden" id="iddateplanningrdv" name="datedebutrech">
                    <div id="divaffrdv"></div>
                  </div>
                  <div class="col-md-12">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Motif de rendez vous</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="rdv" id="selecttyperdv2"></select>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Le lieu</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="idlieu" id="selectlieux2"></select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-12" align="center">
              <button type="button"  class="btn vd_btn vd_bg-blue vd_white"  onclick="rafraichir_calendrier('selectlieux2','selecttyperdv2','ok', 'iddateplanningrdv'); $('#myModalfiltrrdv').modal('hide');">Rechercher</button>&nbsp;&nbsp;
              <a href="#" onclick="$('#myModalfiltrrdv').modal('hide');">Annuler</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="myModalFiltreInterpro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header vd_bg-blue vd_white">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="myModalLabelfiltre">Rechercher un RDV disponible</h4>
      </div>
      <div class="modal-body" style="padding: 15px 0px 0px 0px;"> 
        <div class="panel-body" style="padding: 0px 0px 15px 0px;">
          <form class="form-horizontal" action="" role="form" id="formList" method="GET" >                           
            <input type="hidden" value="planning" name='validation' />
            <input type="hidden" name="dir" value="{$dir}">
            <input type="hidden" value="{$idc}" id='idc' />
            <input type="hidden" value="3" id='all' />
            
            <div class="col-sm-12">
              <div class="form-group">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">

                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Les praticiens</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="praticien" id="idpraticien">
                        <option value="">Choisissez un praticien</option>
                        {foreach from=$aTableaupraticien item=objlist}
                          <option value="{$objlist.id_user}">{$objlist.nom_user}</option>
                        {/foreach}
                      </select>
                    </div>
                  </div>

                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Le motif de votre consultation</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="idrdv" id="idconsultation">
                        <option value="">Choisissez le motif du rendez vous</option>
                      </select>
                    </div>
                  </div>

                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Le lieu</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="idlieu" id="idlieu">
                        <option value="">Choisissez le lieu du rendez vous</option>
                      </select>
                    </div>
                  </div>

                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Choisissez une date de début</b>
                      </label>
                    </div>
                    <div class="input-group">
                      <input type="text" placeholder="Choisissez une date de début" name="ladaterech" id="id_daterdvdispo" value="" name="datepicker-interpro" id="datepicker-interpro">
                      <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#datepicker-interpro">
                        <i class="fa fa-calendar"></i>
                      </span>
                    </div>
                    {literal}
                    <script type="text/javascript">
                      $("#datepicker-interpro").datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true
                      });
                      $( '[data-datepicker]' ).click(function(e){ 
                        var data=$(this).data('datepicker');
                        $(data).focus();
                      });

                    </script>
                    {/literal}
                  </div>

                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Choisissez un jour</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="jour">
                        <option value="">Indifférent</option>
                        <option value="1">Lundi</option>
                        <option value="2">Mardi</option>
                        <option value="3">Mercredi</option>
                        <option value="4">Jeudi</option>
                        <option value="5">Vendredi</option>
                        <option value="6">Samedi</option>
                        <option value="0">Dimanche</option>
                      </select>
                    </div>
                  </div>

                  <div class="col-sm-12 controls">
                    <div class="label-wrapper">
                      <label class="control-label">
                        <b>Choisissez un créneau horaire</b>
                      </label>
                    </div>
                    <div class="vd_input-wrapper">
                      <select name="horaire">
                        <option value="">Indifférent</option>
                        <option value="6-8">06h/08h</option>
                        <option value="8-10">08h/10h</option>
                        <option value="10-12">10h/12h</option>
                        <option value="12-14">12h/14h</option>
                        <option value="14-16">14h/16h</option>
                        <option value="16-18">16h/18h</option>
                        <option value="18-20">18h/20h</option>
                        <option value="20-22">20h/22h</option>
                      </select>
                    </div>
                  </div>                  

                </div>
                <div class="col-sm-2"></div>
              </div>
            </div>
            <div class="col-sm-12" align="center">
              <button type="button"  class="btn vd_btn vd_bg-blue vd_white" onclick="rafraichir_calendrier('selectlieux','selectpraticien','selecttyperdv','','iddateplanning','0'); $('#myModalfiltremedecin').modal('hide');">Afficher</button>&nbsp;&nbsp;
              <a href="#" onclick="$('#myModalFiltreInterpro').modal('hide');">Annuler</a>
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
      <form class="form-horizontal">
        <div class="modal-body"> 
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
  </div>
</div>
