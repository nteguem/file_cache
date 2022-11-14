

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>
<div class="vd_content-section clearfix">
 <div class="row">
 	<div class="col-md-12">
 		   <div class="panel widget">
                  <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-magic"></i> </span> UI Tab </h3>
                  </div>
             <div class="panel-body">
			<form action="" method="GET">
				<input type="hidden" value="{$dir}" name="dir">
				<input type="hidden" value="ok" name="validation">


				{foreach from=$aTabBdd item=aTabBddItem}

				<div class="form-group">
					 <div class="col-sm-4 controls">
					 	{$aTabBddItem.nom_infobdd}
						<select name="tabdd[]">
							<option></option>
							{foreach from=$aTabBddItem.listbdd item=aTabBddOption}

								<option value="{$aTabBddOption.Database}">{$aTabBddOption.Database}</option>

							{/foreach}
						</select>
					</div>
				
				</div>
				{/foreach}


				
				<div class="form-group">
					<div class="col-sm-4 controls">
						&nbsp;
						<button type="submit" class="btn btn-primary" type="button">valider</button> &nbsp;&nbsp;{if $sContenutraitement!=""} <button type="button" onclick="$('#myModal').modal('show');"class="btn btn-primary" type="button">Voir result</button>{/if}
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="row">
{foreach from=$aTableauRetour item=aTabRetourItem}
 	<div class="col-md-4">
 				<div class="panel widget">

                  <div class="panel-heading vd_bg-grey">
                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-magic"></i> </span> {$aTabRetourItem.nombdd} </h3>
                  </div>
                  <div class="panel-body">
                    <div class="panel-group" id="{$aTabRetourItem.id}">
                    	
                      {foreach from=$aTabRetourItem.listtable item=aTabRetourItemTable}
                      <div class="panel panel-default">
                        <div class="panel-heading {if $aTabRetourItemTable.is_existe eq 1} vd_bg-red {elseif $aTabRetourItemTable.is_existe eq 3} vd_bg-yellow {else} vd_bg-blue{/if}">
                          <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#{$aTabRetourItem.id}"  class="collapsed" href="#collapse{$aTabRetourItemTable.nomtable}{$aTabRetourItemTable.idtable}" > {$aTabRetourItemTable.nomtable} </a> </h4>
                        </div>
                        <div id="collapse{$aTabRetourItemTable.nomtable}{$aTabRetourItemTable.idtable}" class="panel-collapse collapse" style="">
                          <div class="panel-body"> 
                          	<ul>
                          	 {foreach from=$aTabRetourItemTable.champ item=aTabRetourItemChamp}

                          	 	<li {if $aTabRetourItemChamp.test eq 3}style="color:red"{/if} {if $aTabRetourItemChamp.test eq 3}style="color:red"{/if}>
                          	 		  {if $aTabRetourItemChamp.Chaine == "C"}
                                    {$aTabRetourItemChamp.Field}=>{$aTabRetourItemChamp.Type}
                                  {/if}
                                  {if $aTabRetourItemChamp.Chaine == "link"}
                                      {$aTabRetourItemChamp.Link}
                                  {/if}
                          	 	
                              </li>

                          	 {/foreach}
                          	</ul>
                           </div>
                        </div>
                      </div>
                      {/foreach}

                    </div>
                  </div>
                </div>

</div>

{/foreach}



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

         {$sContenutraitement}


        </div>
    </div>
  </div>
</div>