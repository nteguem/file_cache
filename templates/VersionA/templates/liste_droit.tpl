{literal}

    <script type="text/javascript">

      function updateDroit(id_menu){

        type = $("#type").val();
        id = $("#id").val();
        droit = $('input[name=optionsRadios' + id_menu +']:checked').val()
        //envoi de la requete ajax
        sendRequest(type, id_menu, id, droit)

      }

      function sendRequest(type, menu, id, droit){
        cheminapi = $("#id_chemin").val();
        identifiant_entite = $("#identifiant_entite").val();
          var email_user = $('#email_user').val();
          var guid_user = $('#token_user').val();
        var sUrl = 'api2/';
        if (type === 'groupe'){
            sUrl+='droit_groupe';
        }else{
            sUrl+='droit_user';
        }
        $.ajax({
        //url: cheminapi + '/change_droit.php',
        url: sUrl,
        type: 'PUT',
        data: '{"id":"'+id+'","type":"'+type+'","id_menu":"'+menu+'","droit":"'+droit+'"}',
        dataType: 'json',
        headers: {
            "x-alx-idc": identifiant_entite,
            "authorization": email_user + " " + guid_user,
        },
        success: function(json) {
            $.pnotify({
                title: "Mise à jour des droits",
                text: json.message,
                type: 'success',
                addclass: "stack-bottomright",
                delay: 3000
            });
        }
    });
      }

    </script>

{/literal}

{if $bDebugRequete}
    <p>
        Requete Select : <br><br>
        {$sDebugRequeteSelect}<br><br>
        Requete Insert/Update : <br><br>
        {$sDebugRequeteInsertUpdate}<br><br>
    </p>
{/if}


<input type="hidden" name="chemin" id="id_chemin" value="{$cheminapi}">
<input type="hidden" name="type" id="type" value="{$type}">
<input type="hidden" name="id" id="id" value="{$id}">
<input type="hidden" name="identifiant_entite" id="identifiant_entite" value="{$identifiant_entite}">

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
    <br/>
    <a href="{$sLinkRetour}">
      <button type="button" class="btn vd_btn vd_bg-grey">Retour</button>
    </a>
</div>
<br/><br/>

<div class="col-md-12">
  {$nom_groupe_old=""}
  
  {foreach from=$aTableauDroitsUser item=objListe}

    
    <div class="panel widget">
    {if $objListe.nom_groupe != $nom_groupe_old }
      <div class="panel-heading vd_bg-grey">
        <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span> {$objListe.nom_groupe} </h3>
      </div>
      {$i=0}
    {/if}
    {$nom_groupe_old = $objListe.nom_groupe}

        <table class="table table-hover">
          {if $i == 0}
          <thead>
            {foreach from=$aEntete item=objEntete}
              <th>
                {$objEntete.nom}
              </th>
            {/foreach}
          </thead>
          {/if}
          {$i=1}
            
              <tr>
                <td width="40%">{$objListe.fr_intitule_menu}</td>
                <td width="40%">{$objListe.description_new_function_menu}</td>

                <td  width="20%" class="menu-action">
                <div class="col-sm-7 controls">
                          
                    <div class="">
                    <input type="radio" name="optionsRadios{$objListe.id_menu}" id="optionsRadios{$objListe.id_menu}" value="1" {$objListe.droit_ok} onClick="updateDroit({$objListe.id_menu})">
                    <label for="optionsRadios1"> oui </label>
                    <input type="radio" name="optionsRadios{$objListe.id_menu}" id="optionsRadios{$objListe.id_menu}" value="0" {$objListe.droit_nop} onClick="updateDroit({$objListe.id_menu})">
                    <label for="optionsRadios2"> non </label>
                  </div></div> </td>
              </tr>
        </table>
      <!-- Panel Widget --> 
    </div>
  {/foreach}
</div>

              
