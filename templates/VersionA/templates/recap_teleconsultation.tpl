<div class="vd_title-section clearfix">
  <div class="vd_panel-header">
    <h1>Recap consultation</h1>
  </div>
</div>
<div class="vd_content-section clearfix">
    <div class="col-md-12">
        <div class="panel widget">
            <div class="panel-heading vd_bg-grey">
                <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-search"></i> </span>Recherche </h3>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" action="" role="form" id="formList" method="GET">
                    <input type="hidden" name="dir" value="recapteleconsul">
                    <input type="hidden" name="validation" value="ok">
                    <input type="hidden" name="pagesimple" value="">

                    <div class="form-group">
                        <label class="col-sm-1 control-label">Date debut</label>
                        <div class="col-sm-1 controls">
                            <div class="input-group">
                                <input type="date" id="id_daterech_1" name="datedebut" class="hasDatepicker"  value="{$datedebut}">

                            </div>
                        </div>

                        <label class="col-sm-1 control-label">date fin</label>
                        <div class="col-sm-1 controls">
                            <div class="input-group">
                                <input type="date" id="id_daterech_2" name="datefin" class="hasDatepicker"  value="{$datefin}">

                            </div>
                        </div>
                        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>


                        <label  class="col-sm-2 control-label">Choix des centres</label>
                        <div class="col-sm-2 controls">
                            <div class="input-group">
                                <select name="typecentre[]" class="js-example-basic-multiple"  id="id_praticien"  multiple="multiple">

                                    <option value="4" {if in_array('4',$typecentre)}selected="selected" {/if} ></option>
                                    {foreach from=$aTableauCentre item=objcentre}
                                        <option {if in_array($objcentre.identifiant_entite,$typecentre)}selected="selected" {/if}value="{$objcentre.identifiant_entite}">{$objcentre.nom_entite}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>


                        <label  class="col-sm-2 control-label">Choix medecin</label>
                        <div class="col-sm-2 controls">
                            <div class="input-group">
                                <select name="medecin[]" class="js-example-basic-multiple"  id="id_medecin"  multiple="multiple">

                                    <option value="4" {if in_array('4',$typecentre)}selected="selected" {/if} ></option>
                                    {foreach from=$aTableaupraticien item=objpraticien}
                                        <option {if in_array($objpraticien.identifiant_user,$medecin)}selected="selected" {/if}value="{$objpraticien.identifiant_user}">{$objpraticien.nom}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                    </div>
                    <script>
                        // In your Javascript (external .js resource or <script> tag)
                        $(document).ready(function() {
                            $('.js-example-basic-multiple').select2();
                        });
                    </script>



                    <div class="form-group form-actions">
                        <div class="col-sm-3"> </div>
                        <div class="col-sm-6">
                            <button type="submit" class="btn vd_btn vd_bg-green" id="id_btsubmit" name="btsubmit" > Rechercher</button>

                            <a href="main.php?dir=recapteleconsul">
                                <button type="button" class="btn vd_btn vd_bg-grey"> Annuler</button>
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


  <div class="row">
      {*
    <div class="col-md-4">
      <div class="panel widget">

        <div class="panel-body-list  table-responsive">
          <table class="table no-head-border table-striped">
            <thead class="vd_bg-blue vd_white">
            <tr>
                <th colspan="5">
                    <h3>Téléconsultation demandée</h3>
                </th>
            </tr>
              <tr>
                  <th>Centre</th>
                  <th style="">Date</th>
                  <th style="">Docteur</th>
                  <th style="">patient</th>
                  <th style="">Montant</th>
              </tr>
            </thead>
            <tbody>
              {foreach from=$aTableauListedemande item=objdemande}
              <tr>
                <td>{$objdemande.nom_entite}</td>
                <td>{$objdemande.datetele}</td>
                <td >{$objdemande.nom_docteur}</td>
                <td >{$objdemande.nom_patient}</td>
                <td >{$objdemande.montant}</td>
              </tr>

              {/foreach}

            </tbody>
          </table>
        </div>
      </div>
    *}
    </div>
      <div class="col-md-6">
          <div class="panel widget">
              <div class="panel-body-list  table-responsive">
                  <table class="table no-head-border table-striped">
                      <thead class="vd_bg-blue vd_white">
                      <tr>
                          <th colspan="7">
                              <h3>Téléconsultation preaiement validé</h3>
                          </th>
                      </tr>
                      <tr>
                          <th colspan="7">
                              Nombre de ligne :{$iligneprepaiement} | Montant Total : {$imontantotalprepaiement} €
                          </th>
                      </tr>
                      <tr>
                          <th>Centre</th>
                          <th style="">Date</th>
                          <th style="">Docteur</th>
                          <th style="">patient</th>
                          <th style="">Montant</th>
                          <th style="">Status RDV</th>
                          <th style="">Valider doc</th>
                      </tr>
                      </thead>
                      <tbody>
                      {foreach from=$aTableauListedemandeprepaiement item=objdemandeprepaye}
                          <tr>
                              <td>{$objdemandeprepaye.nom_entite}</td>
                              <td>{$objdemandeprepaye.datetele}</td>
                              <td >{$objdemandeprepaye.nom_docteur}</td>
                              <td >{$objdemandeprepaye.nom_patient}</td>
                              <td >{$objdemandeprepaye.montant}</td>
                              <td >{$objdemandeprepaye.valeur_champ_vrac}</td>
                              <td >{$objdemandeprepaye.result_paiement_teleconsultation}</td>
                          </tr>
                      {/foreach}

                      </tbody>
                  </table>
              </div>
          </div>

      </div>

      <div class="col-md-6">
          <div class="panel widget">
              <div class="panel-body-list  table-responsive">
                  <table class="table no-head-border table-striped">
                      <thead class="vd_bg-blue vd_white">
                      <tr>
                          <th colspan="5">
                              <h3>Téléconsultation paiement validé</h3>
                          </th>
                      </tr>
                      <tr>
                          <th colspan="5">
                              Nombre de ligne :{$iligneppaiement} | Montant Total : {$imontantotalpaiement} €
                          </th>
                      </tr>
                      <tr>
                          <th>Centre</th>
                          <th style="">Date</th>
                          <th style="">Docteur</th>
                          <th style="">patient</th>
                          <th style="">Montant</th>
                      </tr>
                      </thead>
                      <tbody>
                      {foreach from=$aTableauListedemandepaiement item=objdemandepaye}
                          <tr>
                              <td>{$objdemandepaye.nom_entite}</td>
                              <td>{$objdemandepaye.datetele}</td>
                              <td >{$objdemandepaye.nom_docteur}</td>
                              <td >{$objdemandepaye.nom_patient}</td>
                              <td >{$objdemandepaye.montant}</td>
                          </tr>

                      {/foreach}

                      </tbody>
                  </table>
              </div>
          </div>

      </div>



  </div>



{literal}

<!-- Specific Page Scripts Put Here -->
<!-- Flot Chart  -->
<script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="plugins/flot/jquery.flot.resize.js"></script>
<script type="text/javascript" src="plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="plugins/flot/jquery.flot.categories.min.js"></script>
<script type="text/javascript" src="plugins/flot/jquery.flot.time.min.js"></script>
<script type="text/javascript" src="plugins/flot/jquery.flot.animator.min.js"></script>

<!-- Vector Map -->
<script type="text/javascript" src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script type="text/javascript" src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Sky Icons -->
<script type="text/javascript" src='plugins/skycons/skycons.js'></script>



{/literal}