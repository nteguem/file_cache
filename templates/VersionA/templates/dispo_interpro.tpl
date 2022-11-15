{literal}
<script type="text/javascript">
function enreg_planning(daterdv,heurerdv,heurefin,nomdocteur,iddocteur,idlieu,idtyperdv){
 
 document.getElementById("myModalLabelinfordv").innerHTML="Enregistrement d'un RDV avec le docteur "+nomdocteur+" le "+daterdv;
 document.getElementById("iframerdv").src="modal_enreg_rdv_patient.php?iddocteur="+iddocteur+"&ladate="+daterdv+"&heuredebut="+heurerdv+"&heurefin="+heurefin+"&idlieu="+idlieu+'&idtyperdv='+idtyperdv;
    $('#myModalinfordv').modal('show');
}

</script>
{/literal}

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>

{if $bsucess}
<div class="alert alert-success">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
  <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
  {$sMessageSucess}
</div>
{/if}
  <?php
  $listeE6 = filemtime(PATH_ASSETS.'js/liste_e6.js');
?>
<script type="text/javascript" src="js/liste_e6.<?php echo $listeE6 ?>.js"></script>

{if $berror}
<div class="alert alert-danger">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
  <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
  {$sMessageError}
</div>
{/if}
<!-- vd_title-section -->


<div class="vd_content-section clearfix">
   <div class="row" id="form-basic">
        <div class="col-md-12">
            <div class="panel widget">
                <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span></h3>
                </div> 
                <div class="panel-body">
					<form action="" method="GET" class="form-horizontal">
                	<input type="hidden" name="dir" value="{$dir}">
                	<input type="hidden" name="interpro" value="{$interpro}" id="idinterpro">
      				  <input type="hidden" name="validation" value="ok">


                	 <div class="form-group">
			          <div class="col-sm-12 controls">
			              <h3>Rechercher un autre rendez-vous disponible :</h3>
			          </div>
			        </div>
			         <div class="row">
			        
			          	<div class="col-sm-3 col-lg-3 controls">
				          <select name="praticien" id="idpraticien">
				              <option value="">Les particiens</option>
				              {foreach from=$aTableaupraticien item=objlist}

				              	<option value="{$objlist.id_user}">{$objlist.nom_user}</option>

				              {/foreach}
				          </select>
				        </div>
				        <div class="col-sm-3  col-lg-3 controls">
				          <select name="idrdv" id="idconsultation">
				              <option value="">Les consultations</option>
				          </select>
				        </div>

				        <div class="col-sm-3  col-lg-3 controls">
				          <select name="idlieu" id="idlieu">
				              <option value="">Les Lieux</option>
				          </select>
				        </div>

				          <div class="col-sm-3 col-lg-3 controls">
				            <div class="input-group">
				              <input type="text" name="ladaterech" id="id_daterdvdispo" value="{$ladaterech}">
				              <span class="input-group-addon" id="datepicker-icon-trigger" data-datepicker="#id_daterdvdispo"><i class="fa fa-calendar"></i></span>
				            </div>
				          </div>
				        {literal}
				        <script type="text/javascript">
				          $(document).ready(function() {
				            $( "#id_daterdvdispo" ).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,changeYear: true,yearRange: "-100:+0"});
				            $( '[data-datepicker]' ).click(function(e){ 
				              var data=$(this).data('datepicker');
				              $(data).focus();
				            });
				          });
				        </script>
				        {/literal}
				        </div>
				        <div class="col-sm-3  col-lg-3 controls">
				          <select name="jour">
				              <option value="">Choix du jour (tous les jours)</option>
				              <option value="1" {if $jour eq "1"}selected="selected"{/if}>Lundi</option>
				              <option value="2" {if $jour eq "2"}selected="selected"{/if}>Mardi</option>
				              <option value="3" {if $jour eq "3"}selected="selected"{/if}>Mercredi</option>
				              <option value="4" {if $jour eq "4"}selected="selected"{/if}>Jeudi</option>
				              <option value="5" {if $jour eq "5"}selected="selected"{/if}>Vendredi</option>
				              <option value="6" {if $jour eq "6"}selected="selected"{/if}>Samedi</option>
				              <option value="0" {if $jour eq "0"}selected="selected"{/if}>Dimanche</option>
				          </select>
				        </div>

				        <div class="col-sm-3  col-lg-3 controls">
				          <select name="horaire">
				              <option value="">Créneau horaire</option>
				              <option value="6-8" {if $horaire eq "6-8"}selected="selected"{/if}>06h/08h</option>
				              <option value="8-10" {if $horaire eq "8-10"}selected="selected"{/if}>08h/10h</option>
				              <option value="10-12" {if $horaire eq "10-12"}selected="selected"{/if}>10h/12h</option>
				              <option value="12-14" {if $horaire eq "12-14"}selected="selected"{/if}>12h/14h</option>
				              <option value="14-16" {if $horaire eq "14-16"}selected="selected"{/if}>14h/16h</option>
				              <option value="16-18" {if $horaire eq "16-18"}selected="selected"{/if}>16h/18h</option>
				              <option value="18-20" {if $horaire eq "18-20"}selected="selected"{/if}>18h/20h</option>
				              <option value="20-22" {if $horaire eq "20-22"}selected="selected"{/if}>20h/22h</option>
				          </select>
				        </div>

				        <div class="col-sm-3  col-lg-3 controls">
				          <button type="submit"  name="updateButton" id="updateButton" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Rechercher des RDV</button>
				        </div>


								</form>


				          <div class="form-group" >
		        <div class="col-sm-12 controls">
		            <b>Les prochains rendez vous disponibles du docteur </b>
		        </div>
		      </div>
		        <div class="form-group">
		          {foreach from=$aTableauRDVdispo item=objRDVdispo}
		               <div class="col-sm-4 controls">
		                  <input type="radio" name="deplace" value="{$objRDVdispo.value}" onclick="enreg_planning('{$objRDVdispo.dateafffr}','{$objRDVdispo.heuredebut}','','{$objRDVdispo.nom_user}','{$objRDVdispo.id_user}','{$idlieu}','{$idrdv}')">&nbsp;&nbsp;{$objRDVdispo.dateaff} à {$objRDVdispo.heuredebut}
		               </div>
		          {/foreach}
         </div> 
				         </div>




                </div>

            </div>
        </div>
    </div>