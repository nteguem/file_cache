<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>

<div class="vd_content-section clearfix">

        <div class="row">
            <div class="col-sm-2">
                <div class="panel widget panel-bd-left light-widget">

                    <div class="panel-body">

                        <div class="btn-group-vertical">
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=ctrlfichiercvs&identifiant_entite={$identifiantentite}')">Contrôle fichier cvs</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=gestlieux&identifiant_entite={$identifiantentite}')">Lieux</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=listprostruct&identifiant_entite={$identifiantentite}')">Les produits</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=gestluserstructure&identifiant_entite={$identifiantentite}')">Utilisateurs</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=gestalluserstruc&identifiant_entite={$identifiantentite}')">Les patients</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=gestactivite&identifiant_entite={$identifiantentite}')">Activité</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=gestmotifrdv&identifiant_entite={$identifiantentite}')">Motif RDV</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=listerdvpraticien&identifiant_entite={$identifiantentite}')">Liste RDV</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=confimodconnec&identifiant_entite={$identifiantentite}')">Config Variable</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','main.php?pagesimple=ok&dir=testconnexion&identifiant_entite={$identifiantentite}')">Test connexion Module externe</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','lance_script_synchro_activite_oplus.html?entite={$id}')">Synchro des activités</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','lance_script_synchro_tranche_ouverture_oplus.html?entite={$id}')">Synchro des disponibilités</button>
                            <button class="btn btn-default" type="button" onclick="document.getElementById('idframe').setAttribute('src','lance_script_synchro_rdv_oplus.html?entite={$id}')">Synchro des rdv</button>
                            {*<button class="btn btn-default" type="button">Button</button>
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="btnGroupVerticalDrop1"> Dropdown <span class="caret"></span> </button>
                                <ul aria-labelledby="btnGroupVerticalDrop1" role="menu" class="dropdown-menu">
                                    <li><a href="#">Dropdown link</a></li>
                                    <li><a href="#">Dropdown link</a></li>
                                </ul>
                            </div>
                            <button class="btn btn-default" type="button">Button</button>
                            <button class="btn btn-default" type="button">Button</button>
                            <div class="btn-group">
                                <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button" id="btnGroupVerticalDrop2"> Dropdown <span class="caret"></span> </button>
                                <ul aria-labelledby="btnGroupVerticalDrop2" role="menu" class="dropdown-menu">
                                    <li><a href="#">Dropdown link</a></li>
                                    <li><a href="#">Dropdown link</a></li>
                                </ul>
                            </div>*}
                        </div>
                    </div>
                    <!-- panel-body -->
                </div>
                <!-- panel -->
            </div>
            <div class="col-sm-10">
                    <iframe name="frame" id="idframe" width="100%" height="800px" src="main.php?pagesimple=ok&dir=gestlieux&identifiant_entite={$identifiantentite}" frameborder="0"></iframe>
            </div>


        </div>

 </div>