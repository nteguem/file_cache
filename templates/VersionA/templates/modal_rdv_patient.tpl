<!DOCTYPE html>
<!--[if IE 8]>      <html class="ie ie8"> <![endif]-->
<!--[if IE 9]>      <html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->  <html><!--<![endif]-->

<!-- Specific Page Data -->
<!-- End of Data -->

<head>
    <meta charset="utf-8" />
    <title>Alaxione</title>
    <meta name="keywords" content="" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta HTTP-EQUIV="cache-control" CONTENT="NO-CACHE">
    <meta HTTP-EQUIV="pragma" CONTENT="NO-CACHE">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    
    
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="img/ico/favicon.png">
    
    
    <!-- CSS -->
       
    <!-- Bootstrap & FontAwesome & Entypo CSS --> 
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <link href="css/fonts.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">    
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">    
    <link href="plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">
   
         
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">    
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">    
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">            


    <!-- Theme CSS -->
    <link href="css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css">

    
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">


    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <?php  $query_1 = filemtime(PATH_ASSETS.'js/jquery.js');?>
    <script type="text/javascript" src="js/jquery.<?php echo $query_1 ?>.js"></script> 
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    
    <?php  $boostrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js');?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $boostrapMin ?>.js"></script> 
    
    <?php  $customMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js');?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMin ?>.js'></script>
    <?php  $punchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $punchMin ?>.js"></script>

    <?php  $fredsel = filemtime(PATH_ASSETS.'js/caroufredsel.js');?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $fredsel ?>.js"></script> 
    
    <?php  $plugin_1 = filemtime(PATH_ASSETS.'js/plugins.js');?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugin_1 ?>.js"></script>

    <?php  $breakpoint_1 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js');?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoint_1 ?>.js"></script>
    
    <?php  $datatablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js');?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $datatablesMin ?>.js"></script>
    
    <?php  $prettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js');?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhoto ?>.js"></script> 

    <?php  $concatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js');?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $concatMin ?>.js"></script>
    
    <?php  $tagsMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js');?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsMin ?>.js"></script>
    
    <?php  $switchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js');?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $switchMin ?>.js"></script>
    
    <?php  $blockUI = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js');?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $blockUI ?>.js"></script>
    
    <?php  $pnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js');?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotifyMin ?>.js"></script>

    <?php  $theme_1 = filemtime(PATH_ASSETS.'js/theme.js');?>
    <script type="text/javascript" src="js/theme.<?php echo $theme_1 ?>.js"></script>
    
    <?php  $custom_2 = filemtime(PATH_ASSETS.'custom/custom.js');?>
    <script type="text/javascript" src="custom/custom.<?php echo $custom_2 ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->

    <?php  $wizardMax = filemtime(PATH_ASSETS.'plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js');?>
    <script type="text/javascript" src='plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.<?php echo $wizardMax ?>.js'></script>

    <?php  $datepicker_5 = filemtime(PATH_ASSETS.'js/datepicker-fr.js');?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepicker_5 ?>.js"></script>
    <!-- Head SCRIPTS -->
    
    <?php  $datepicker_5 = filemtime(PATH_ASSETS.'js/modernizr.js');?>
    <script type="text/javascript" src="js/modernizr.<?php echo $datepicker_5 ?>.js"></script> 
    
    <?php  $detectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js');?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $detectMin ?>.js"></script> 
   
    <?php  $detectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js');?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $detectModernizr ?>.js"></script> 
    
    <?php  $maskedInput = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js');?>
    <script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedInput ?>.js"></script> 
    
    <?php  $compteWidget = filemtime(PATH_ASSETS.'js/compte_widget.js');?>
    <script type="text/javascript" src="js/compte_widget.<?php echo $compteWidget ?>.js"></script>
   <!-- Script pour l'auto-completion -->
    
   <?php  $autocompleteMin = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js');?>
   <script type="text/javascript" src="js/jquery.autocomplete.min.<?php echo $autocompleteMin ?>.js"></script>


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->

{literal}
<script type="text/javascript">

$(document).ready(function() {
  $("#telport").mask("99 99 99 99 99");
  $("#telfixe").mask("99 99 99 99 99");
});

function civiliteClickModal(myRadioCompte){
  var divnomjeunefille_mod_up = document.getElementById('divnomjeunefille_mod_up');
  var smyRadioCompte = document.getElementById(myRadioCompte);

  if(myRadioCompte.value=="Mme"){
    divnomjeunefille_mod_up.style.display = "";
    $('input:radio[name="civilite_mod_up"]').filter('[value="M"]').attr('checked', false);
    $('input:radio[name="civilite_mod_up"]').filter('[value="Mme"]').attr('checked', true);
    
   }else{
    divnomjeunefille_mod_up.style.display = "none";
    $('input:radio[name="civilite_mod_up"]').filter('[value="Mme"]').attr('checked', false);
    $('input:radio[name="civilite_mod_up"]').filter('[value="M"]').attr('checked', true);
    
   }

}

function set_status_rdv(idrdv, idstatus){

  $.ajax({
    url: 'ajax/set_status_rdv.php',
    data: 'idrdv='+idrdv+'&idstatus='+idstatus,
    dataType: 'json',
    success: function(json) {}
  });
  return false;
}


    function updateDeplacementRDV(idrdv){

        $('#divenattente').html("<div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>");

        $.ajax({
            url: 'ajax/update_deplacement.php',
            data: 'idrdv='+idrdv+'&action=1',
            dataType: 'json',
            success: function(json) {
                $.each(json, function(index, value) {
                    $('#divenattente').html(value.message_html);
                    /*if( value.success ){
                        //value.message_html;
                        $('#divenattente').html(value.message_html);
                    }*/
                });

            }
        });

        return false;
    }

</script>

    <style type="text/css">
      @media (min-width: 768px) {
        .modal-dialog {
          width:700px;
        }
      }

      .vd_bg-color {
        background-color: #5D9AD4 !important;
      }

      a {
        color: #5D9AD4;
      }

      a:hover {
        color: #5D9AD4;
      }

      .vd_radio.radio-success input[type=radio]:checked+label:before {
        border: 1px solid #5D9AD4;
      }

      .vd_radio.radio-success label:after {
        background-color: #5D9AD4;
        border: 1px solid #5D9AD4;
      }

      .ui-datepicker {
        background: #5D9AD4;
      }

      .ui-datepicker a {
        color: #fff;
      }

    </style>
     <style type="text/css">
        .autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
        .autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
        .autocomplete-selected { background: #F0F0F0; }
        .autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }

        select {
          
          height: 39px;
        }
    </style>


{/literal}


</head>    

<body id="forms" class="full-layout no-nav-left no-nav-right nav-top-fixed background-login responsive remove-navbar login-layout clearfix" data-active="forms "  data-smooth-scrolling="1">
 
 <div class="col-xs-12 table-responsive"  style='padding:0;'>
      <div class="col-md-12" style='padding-right: 0px;padding-left: 0px;'>
    <div id="divrdvdispoattente" style="padding:0;display:none;">
      <div align='center'><br><br><h2>En attente de traitement...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2><br><br></div>
    </div>
    <div id="divrdvdispo"></div>
  </div>
</div>


<div id="blocktotal">

  <div class="col-sm-12" style="padding-top:10px;">
      {if $bremplacant}
          <div class="alert alert-warning">
              <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
              {$smessageremplacant}
          </div>
      {/if}

      {if $benattente}
          <div id="divenattente" class="alert alert-warning" align="center">
              Ce rendez-vous est en attente de confirmation de déplacement !
              <div style="margin-top:10px;">
                  <button type="button" name="btnconfirmdeplacement" id="btnconfirmdeplacement" class="btn vd_btn vd_bg-green" onclick="updateDeplacementRDV('{$TabInfoRDV[0].id_prise_rendez_vous}')">Confirmer</button>
                  &nbsp;&nbsp;
                  <button type="button" name="btnsupprimerdeplacement" id="btnsupprimerdeplacement" onclick="bconfirm=confirm('Voulez vous supprimer ce rendez vous ?');if(bconfirm)location.replace('modal_fiche_rdv_patient.php?validation=supp&idrdv={$TabInfoRDV[0].id_prise_rendez_vous}&jsEvent={$TabInfoRDV[0].id_prise_rendez_vous}&idcalendar={$idcalendar}');" class="btn vd_btn vd_bg-red"><span class="menu-icon"></span> Supprimer</button>
              </div>
          </div>
      {/if}
    {* {if $bsucess}
      <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>
        {$sMessageSucess}
      </div>
    {/if} *}
    {if $berror}
      <div class="alert alert-danger">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
        <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
        {$sMessageError}
      </div>
    {/if}

  {if $bsucess}

  {literal}
   <script type="text/javascript">
    parent.close_modal_principal({/literal}'{$jsEvent}', '{$sAction}', '{$idcalendar}'{literal});

    </script>
    {/literal}
  {/if}
  {if $bpasse}    
    <form action="" method="" onsubmit={literal}""{/literal} class="form-horizontal">
      <input type="hidden" name="idcalendar" value="{$idcalendar}">
      <input type="hidden" name="jsEvent" value="{$jsEvent}">
      <input type="hidden" name="idrdv" value="{$TabInfoRDV[0].id_prise_rendez_vous}">
      <input type="hidden" name="validation" value="modif">
      <div class="form-group">
        <div class="col-sm-6 controls">
          <h3>Avec le Dr. {$TabInfoRDV[0].nomdocteur}</h3>
        </div>
          <div class="col-sm-6 controls">
          <h3>Enregistré {$provenance}</h3>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-6 controls">
          <label class="control-label">Status du RDV</label>
          <div class="controls">
            <select name="status" onchange="set_status_rdv({$TabInfoRDV[0].id_prise_rendez_vous},this.value);">
              {foreach from=$aTabStatus item=objStatus}
               {if $binterpro}
                    {if $objStatus.valeur_champ_vrac == $TabInfoRDV[0].valeur_champ_vrac}
                       <option value="{$objStatus.identifiant_champ_vrac}" {if $objStatus.valeur_champ_vrac == $TabInfoRDV[0].valeur_champ_vrac} selected {/if} >{$objStatus.valeur_champ_vrac}</option>
            
                    {/if}
               {else}
                <option value="{$objStatus.identifiant_champ_vrac}" {if $objStatus.valeur_champ_vrac == $TabInfoRDV[0].valeur_champ_vrac} selected {/if} >{$objStatus.valeur_champ_vrac}</option>
                {/if}
              {/foreach}
            </select>
          </div>
        </div>
        <div class="col-sm-6 controls">
          <label class="control-label">Motif</label>
          <div class="controls">
            <select name="idtyperdv">
              {foreach from=$aTabTypeRDV item=objTypeRDV}
                  {if $binterpro}
                    {if $objTypeRDV.id_type_rdv == $TabInfoRDV[0].id_type_rdv} 
                          <option value="{$objTypeRDV.id_type_rdv}" {if $objTypeRDV.id_type_rdv == $TabInfoRDV[0].id_type_rdv} selected {/if} >{$objTypeRDV.libelle_type_rdv}</option>
                     {/if}
                  {else}
                      <option value="{$objTypeRDV.id_type_rdv}" {if $objTypeRDV.id_type_rdv == $TabInfoRDV[0].id_type_rdv} selected {/if} >{$objTypeRDV.libelle_type_rdv}</option>
                  {/if}
              {/foreach}
            </select>
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="col-sm-3">
          <label class="control-label">Date</label>
          <div class="controls">
            <input type="text" name="daterdv" id="id_daterdv" value="{$TabInfoRDV[0].ladte}" {if $binterpro}disabled="disabled" {/if}>
          </div>
        </div>
        <div class="col-sm-3">
          <label class="control-label">Heure patient</label>
          <div class="controls">
            <input type="text" name="timerdvaff" value="{$TabInfoRDV[0].heuredebutaff}" {if $binterpro} readonly{/if}>
          </div>
        </div>
        <div class="col-sm-3">
          <label class="control-label">Heure réelle</label>
          <div class="controls">
            <input type="text" name="timerdvreel" value="{$TabInfoRDV[0].heuredebut}" {if $binterpro}readonly{/if}>
          </div>
        </div>
        <div class="col-sm-3">
          <label class="control-label">Durée</label>
          <div class="controls">
            <select name="tpsconsultation">
              {foreach from=$atabtpsConsult item=objTpsConsult}
                {if $binterpro}
                    {if $tpsconsultation eq $objTpsConsult.value}
                         <option value="{$objTpsConsult.value}" {if $tpsconsultation eq $objTpsConsult.value}selected="selected"{/if}>{$objTpsConsult.nom}</option>
                    {/if}
                {else}
                  <option value="{$objTpsConsult.value}" {if $tpsconsultation eq $objTpsConsult.value}selected="selected"{/if}>{$objTpsConsult.nom}</option>
                {/if}
              {/foreach}
            </select>
          </div>
        </div>
      </div>
      <hr>
      <div class="form-group">
        <div class="col-sm-12 controls">
          <span style='font-size: 24px;'>Patient : {$TabInfoRDV[0].abreviation_civilite} {$TabInfoRDV[0].nompatient} {$TabInfoRDV[0].prenompatient}
          </span>
          &nbsp;&nbsp;<a href="#" onclick="location.replace('modal_fiche_patient.php?id_patient={$TabInfoRDV[0].idpatient_user}&idrdv={$TabInfoRDV[0].id_prise_rendez_vous}')"><i class="fa fa-pencil"></i> Modifier la fiche patient</a>
          &nbsp;&nbsp;<a href="#" onclick="{literal}window.parent.$('#modalFichePatient').modal('show');window.parent.getInfoPatient({/literal}{$TabInfoRDV[0].idpatient_user}{literal});{/literal}"><i class="fa fa-pencil"></i> Modifier la fiche patient</a>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-6">
          <label class="control-label">Téléphone portable</label>
          <div class="controls">
            <input type="text" name="telport" id="telport" placeholder="Téléphone portable" disabled="disabled" value="{$TabInfoRDV[0].tel_mobile_user}">
          </div>
        </div>
        <div class="col-sm-6">
          <label class="control-label">Téléphone fixe</label>
          <div class="controls">
            <input type="text" name="telfixe" id="telfixe" placeholder="Téléphone fixe" disabled="disabled" value="{$TabInfoRDV[0].tel_fixe_user}">
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-6">
          <label class="control-label">Email</label>
          <div class="controls">
            <input type="email" name="email" placeholder="Email" disabled="disabled" value="{$TabInfoRDV[0].email_user}">
          </div>
        </div>
        <div class="col-sm-6">
          <label class="control-label">Date de naissance</label>
          <div class="controls">
            <input type="text" name="datenaissance" disabled="disabled" placeholder="Date de naissance" id="id_datenaissance" value="{$TabInfoRDV[0].datenaissance}"></td>
          </div>
        </div>
      </div>    
      <div class="form-group">
        <div class="col-sm-12">
          <label class="control-label">Médecin traitant</label>
          <div class="controls">
            <input type="text" name="medecintrait" placeholder="Médecin traitant" disabled="disabled"  value="{$TabInfoRDV[0].medecin_traitant_user}">
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-12">
          <label class="control-label">Remarque</label>
          <div class="controls">
            <textarea  name="remarque" placeholder="Remarque">{$TabInfoRDV[0].remarque_prise_rendez_vous}</textarea>
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-4 controls" align="center">
        </div>
        {if !$binterpro}
        <div class="col-sm-4 controls" align="center">
          <button {if $bmoduleexterne eq 0 and  !$bBlockallbouton} type="submit" {else} type="button" disabled  {/if} name="updateButton" id="updateButton" class="btn vd_btn vd_bg-blue"><span class="menu-icon"></span>Modifier le Rendez vous </button>
        </div>
        {/if}
        <div class="col-sm-4 controls" align="right">
           {if !$binterpro}
          <button type="button" name="updateButton"  {if $bBlockallbouton}  disabled {else}  {/if} id="updateButton" class="btn vd_btn vd_bg-yellow" onclick="document.getElementById('blocktotal').style.display='none';document.getElementById('divrdvdispoattente').style.display='block';location.replace('modal_deplacer_rdv.php?id_patient={$TabInfoRDV[0].idpatient_user}&idrdv={$TabInfoRDV[0].id_prise_rendez_vous}&jsEvent={$TabInfoRDV[0].id_prise_rendez_vous}&idcalendar={$idcalendar}')"><span class="menu-icon"></span>Déplacer</button>
          &nbsp;&nbsp;
          {/if}
          <button type="button" name="updateButton"  {if  $bBlockallbouton} disabled {else}   {/if} id="updateButton" onclick="bconfirm=confirm('Voulez vous supprimer ce rendez vous');if(bconfirm)location.replace('modal_fiche_rdv_patient.php?validation=supp&idrdv={$TabInfoRDV[0].id_prise_rendez_vous}&jsEvent={$TabInfoRDV[0].id_prise_rendez_vous}&idcalendar={$idcalendar}');" class="btn vd_btn vd_bg-red"><span class="menu-icon"></span> Supprimer</button>
        </div>
      </div>
    </form>
  {else}
    <div class="form-group">
      <div class="col-sm-12 controls" align="center">
        <button type="button" name="updateButton" id="updateButton" onclick="parent.close_modal_principal('','');" class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
      </div>
    </div>
  {/if}
  </div>

</div>

</body>
</html>