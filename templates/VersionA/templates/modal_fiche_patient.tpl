<script>
    {literal}
    let bRightModifyStatus = false;
    {/literal}
    {if in_array("bdroitstatusrendezvouscalendar",$tabdroituser)}
    bRightModifyStatus = true;

    {/if}
    $("#id_fiche_patient").change(function(){

        if ($("#id_fiche_patient").val().length == 0) {
            $("#idtabpatienthistorique").hide();
            $("#idtabprofile").hide();
            $("#idplantraitement").hide();
            $("#idtabdocument").hide();
            $("#idtabfamille").hide();
            $("#idtablog").hide();
            $("#idtabavis").hide();
        } else {
            $("#idtabpatienthistorique").show();
            $("#idtabprofile").show();
            $("#idplantraitement").show();
            $("#idtabdocument").show();
            $("#idtabfamille").show();
            $("#idtablog").show();
            $("#idtabavis").show();
        }
    });

    $(document).ready(function() {
        if ($("#id_fiche_patient").val().length == 0 ) {
            $("#idtabpatienthistorique").hide();
            $("#idtabprofile").hide();
            $("#idplantraitement").hide();
            $("#idtabdocument").hide();
            $("#idtabfamille").hide();
            $("#idtablog").hide();
            $("#idtabavis").hide();
        } else {
            $("#idtabpatienthistorique").show();
            $("#idtabprofile").show();
            $("#idplantraitement").show();
            $("#idtabdocument").show();
            $("#idtabfamille").show();
            $("#idtablog").show();
            $("#idtabavis").show();
        }
    });
</script>
<!-- [DEBUT] Modal Fiche Patient -->
<div style="overflow-x: hidden;overflow-y: auto;z-index: 2000;" class="modal fade in" id="modalFichePatient" tabindex="-1"
     role="dialog" aria-labelledby="LabelmodalFichePatient" aria-hidden="false" data-keyboard="false"
     data-backdrop="static">
    <div class="modal-dialog">
        {* <div class="modal-dialog" style="width: 793px;"> *}
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                            class="fa fa-times"></i></button>
                <h4 class="modal-title" id="LabelmodalFichePatient">Fiche patient </h4>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" value="" id='iduserP' name='iduserP' />

                    <div class="tabs">
                        <ul class="nav nav-tabs widget vd_bg-color">
                            <li class="active" id="idtabpatientinfo"> <a href="#info-tab" data-toggle="tab"> <span
                                            class="menu-icon"><i class="fa fa-user"></i></span>Informations <span
                                            class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                            {if $bactivvisuhistordvpatient }
                                <li id="idtabpatienthistorique"> <a id="info_histo_link" href="#histo-tab" data-toggle="tab"
                                                                    onclick="getHistoPatient();"> <span class="menu-icon"><i
                                                    class="fa fa-history"></i></span>Historique<span class="menu-active"><i
                                                    class="fa fa-caret-up"></i></span> </a></li>
                            {/if}
                            {if $bloquerInterpro == 'N' and $bactiveprofilage}
                                <li id="idtabprofile"> <a href="#profil-tab" data-toggle="tab" onclick="getprofilPatient();"> <span
                                                class="menu-icon"><i class="fa fa-history"></i></span>RDV Profilé<span
                                                class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                            {/if}
                            {if $bActifPlantraitement && $bloquerInterpro == 'N'}
                                <li id="idplantraitement"> <a href="#plan-traitement-tab" data-toggle="tab" onclick="getplanTraitmentPatient();">
                                        <span class="menu-icon"><i class="fa fa-list-ol"></i></span>Plan de traitement<span
                                                class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                            {/if}

                            {if in_array('bdroitdocument',$tabdroituser) }
                                <li id="idtabdocument"> <a href="#doc-tab" data-toggle="tab" onclick="getDocumentPatient();"> <span
                                                class="menu-icon"><i class="fa fa-files-o"></i></span>Documents<span
                                                class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                            {/if}
                            <li id="idtabfamille"> <a href="#famille-tab" data-toggle="tab" onclick="getFamillePatient();"> <span
                                            class="menu-icon"><i class="fa fa-user"></i></span>Comptes liés<span
                                            class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>

                            {if $bactivvisuhistopatient }
                                <li id="idtablog"> <a href="#log-patient" data-toggle="tab"
                                                      onclick="getLogPatient($('#id_fiche_patient').val());"> <span class="menu-icon"><i
                                                    class="fa fa-history"></i></span> Historique de gestion<span
                                                class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                            {/if}
                            {if $bActifSurvey && in_array('voiravispatients',$tabdroituser) }
                                <li id="idtabavis"> <a href="#avis-tab" data-toggle="tab"
                                                       onclick="getAvisPatients($('#id_fiche_patient').val(), '{$iddebug_user}', '{$token_user}', '{$sDomaine}', '{$sLinkAlaxioneSurveyApi}', '{$sLinkAlaxioneSurvey}');">
                                        <span class="menu-icon"><i class="ico-avis-patient"></i></span> Avis patient<span
                                                class="menu-active"><i class="fa fa-caret-up"></i></span> </a></li>
                            {/if}
                        </ul>
                        <div class="tab-content mgbt-xs-20">
                            <div class="tab-pane active col-sm-12" id="info-tab">
                                <div id="message_retour_info_fiche_patient" style="margin-top:15px; display: none;">
                                </div>

                                <div id="attente_info_patient" style="display: none;">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br>
                                    </div>
                                </div>
                                <div id="div_info_patient" style="display: none;">
                                    <form action="" role="form" id="modal_fiche_patient" class="form-horizontal">
                                        <input type="hidden" name="validation" value="ok" />
                                        <input type="hidden" name="id_fiche_patient" id="id_fiche_patient" value="" onloadeddata="afficheOnglet();"/>
                                        <input type="hidden" name="identifiant_user_fiche_patient" id="identifiant_user_fiche_patient" value="" />
                                        <input type="hidden" name="id_lieu" id="id_lieu" value="" />
                                        <input type="hidden" name="bdirect" id="bdirect" value="" />
                                        <input type="hidden" name="partage_compte_groupe" id="partage_compte_groupe" value="" />
                                        <input type="hidden" name="notification_document" id="notification_document" value="" />
                                        <input type="hidden" name="idrdv" id="idrdv" value="" />
                                        <input type="hidden" name="ab_civilite_fiche_patient"
                                               id="ab_civilite_fiche_patient" value="" />
                                        <input type="hidden" name="provenance_open" id="provenance_open" value="" />
                                        <div class="form-group" style="margin-top: 15px">
                                            <div class="col-sm-2 controls">
                                                <div class="vd_input-wrapper-modal" style="background-color:#fff;">
                                                    <select id="civilite_fiche_patient" name="civilite_fiche_patient"
                                                            required
                                                            onchange="civiliteNomJeuneFille(this.options[this.selectedIndex].text, 'divnomjeunefille_fiche_patient');"
                                                            {if $iAccess != '10'  && $iAccess!='5'}disabled{/if}>
                                                        <option value="">Civilité</option>
                                                        {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                            <option value="{$tabLC.id_civilite}">
                                                                {$tabLC.abreviation_civilite}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-sm-3 controls">
                                                <input type="text" placeholder="Nom" name="nom_fiche_patient"
                                                       id="nom_fiche_patient" value="" required
                                                       class="required input-majuscule"
                                                       {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-1 controls"
                                                 style="cursor: pointer;left: 5px;top: 10px;right: 10px;height: 26px;width:21px;background: url(img/switch.png) no-repeat;"
                                                 onclick='switchNomPrenom("#prenom_fiche_patient","#nom_fiche_patient")'>
                                            </div>
                                            {if count($tabListePatientType) == 1}
                                                <div class="col-sm-3 controls">
                                                    <input type="text" placeholder="Prénom" name="prenom_fiche_patient"
                                                           id="prenom_fiche_patient" value="" required
                                                           class="input-first-letter"
                                                           {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                                </div>

                                                <div class="col-sm-3 controls">
                                                    <input type="text" placeholder="Nom de naissance"
                                                           name="nom_fille_fiche_patient" id="nom_fille_fiche_patient" value=""
                                                           class="input-majuscule"
                                                           {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                                </div>
                                                <input type="hidden" name="type_fiche_patient" id="type_fiche_patient" value="{$idPatientTypeDefaut}" />
                                            {else}
                                                <div class="col-sm-2 controls">
                                                    <input type="text" placeholder="Prénom" name="prenom_fiche_patient"
                                                           id="prenom_fiche_patient" value="" required
                                                           class="input-first-letter"
                                                           {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                                </div>

                                                <div class="col-sm-2 controls">
                                                    <input type="text" placeholder="Nom de naissance"
                                                           name="nom_fille_fiche_patient" id="nom_fille_fiche_patient" value=""
                                                           class="input-majuscule"
                                                           {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                                </div>
                                                <div class="col-sm-2 controls">
                                                    <div class="vd_input-wrapper-modal" style="background-color:#fff;">
                                                        <select id="type_fiche_patient" name="type_fiche_patient">
                                                                {if $iAccess != '10'  && $iAccess!='5'}disabled{/if}>
                                                            {foreach from=$tabListePatientType item=tabLT name=stabListePatientType}
                                                                <option value="{$tabLT.id_patient_type}"
                                                                {if $tabLT.libelle == 'patient'}
                                                                    selected
                                                                {/if}
                                                                >
                                                                    {$tabLT.libelle}</option>
                                                            {/foreach}
                                                        </select>
                                                    </div>
                                                </div>
                                            {/if}


                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-6 controls">
                                                <input type="text" placeholder="Adresse" name="adresse_fiche_patient"
                                                       id="adresse_fiche_patient" value=""
                                                       {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-2 controls">
                                                <input type="text" placeholder="Code postal"
                                                       name="code_postal_fiche_patient" id="code_postal_fiche_patient"
                                                       autocomplete="new-password" value=""
                                                       {if $iAccess != '10' && $iAccess!='5'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-4 controls">
                                                <select placeholder="Ville" id="ville_fiche_patient"
                                                        name="ville_fiche_patient" autocomplete="new-password"
                                                        class="input-majuscule input-widget"
                                                        {if $iAccess != '10' && $iAccess!='5'}disabled{/if}></select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-3 controls" style="display: flex;">
                                                <input type="hidden" name="tel_mobile_fiche_patient_indicatif"
                                                       id="tel_mobile_fiche_patient_indicatif"
                                                       value="{$num_indicatif_structure}" />
                                                <input type="text" placeholder="Téléphone mobile"
                                                       name="tel_mobile_fiche_patient" id="tel_mobile_fiche_patient"
                                                       value="" {if $iAccess != '10' && $iAccess!='5'}disabled{/if}
                                                       style="width: 100%;" />
                                                <i class="ico-phone" id="btcallpatientMobile"
                                                   onclick="callPatient($('#id_fiche_patient').val(),$('#tel_mobile_fiche_patient').val());"
                                                   title="Appeler le patient"
                                                   style="font-size: 20px;color: #707070;background: #EEEEEE 0% 0% no-repeat padding-box;border: 1px solid #D5D5D5;border-radius: 0px 5px 6px 0px;opacity: 1;padding: 5px;"></i>

                                                {literal}
                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $("#tel_mobile_fiche_patient").intlTelInput({
                                                            preferredCountries: ["fr", "be", "ch"],
                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                            utilsScript: "js/utils.js"
                                                        });
                                                        if ($("#tel_mobile_fiche_patient_indicatif").val() ===
                                                            "41") {
                                                            $("#tel_mobile_fiche_patient").inputmask(
                                                                "999 999 99 99");
                                                        } else if ($("#tel_mobile_fiche_patient_indicatif")
                                                            .val() === "33") {
                                                            $("#tel_mobile_fiche_patient").inputmask(
                                                                "99 99 99 99 99");
                                                        }

                                                        $("#tel_mobile_fiche_patient").on("keyup change",
                                                            function() {
                                                                var countryData = $(
                                                                    "#tel_mobile_fiche_patient")
                                                                    .intlTelInput("getSelectedCountryData");
                                                                $("#tel_mobile_fiche_patient_indicatif")
                                                                    .val(countryData.dialCode);
                                                            });

                                                        $("#tel_mobile_fiche_patient").on("countrychange",
                                                            function(e, countryData) {
                                                                $("#tel_mobile_fiche_patient_indicatif")
                                                                    .val(countryData.dialCode);
                                                                var idpays = countryData.iso2;
                                                                if (idpays === "fr") {
                                                                    $("#tel_mobile_fiche_patient")
                                                                        .inputmask("99 99 99 99 99");
                                                                } else if (idpays === "ch") {
                                                                    $("#tel_mobile_fiche_patient")
                                                                        .inputmask("999 999 99 99");
                                                                }
                                                            });
                                                    });
                                                </script>
                                                {/literal}
                                            </div>
                                            <div class="col-sm-1 controls"
                                                 style="cursor: pointer;left: 5px;top: 10px;right: 10px;height: 26px;width:21px;background: url(img/switch.png) no-repeat;"
                                                 onclick='switchTel("#tel_mobile_fiche_patient","#tel_fixe_fiche_patient")'>
                                            </div>
                                            <div class="col-sm-3 controls" style="display: flex;">
                                                <input type="hidden" name="tel_fixe_fiche_patient_indicatif"
                                                       id="tel_fixe_fiche_patient_indicatif"
                                                       value="{$num_indicatif_structure}">
                                                <input type="text" placeholder="Téléphone fixe"
                                                       name="tel_fixe_fiche_patient" id="tel_fixe_fiche_patient" value=""
                                                       {if $iAccess != '10'  && $iAccess!='5'}disabled{/if}
                                                       style="width: 100%;" />
                                                <i class="ico-phone" id="btcallpatientFixe"
                                                   onclick="callPatient($('#id_fiche_patient').val(),$('#tel_fixe_fiche_patient').val());"
                                                   title="Appeler le patient"
                                                   style="font-size: 20px;color: #707070;background: #EEEEEE 0% 0% no-repeat padding-box;border: 1px solid #D5D5D5;border-radius: 0px 5px 6px 0px;opacity: 1;padding: 5px;"></i>

                                                {literal}
                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $("#tel_fixe_fiche_patient").intlTelInput({
                                                            preferredCountries: ["fr", "be", "ch"],
                                                            initialCountry: "{/literal}{$indicatif_structure}{literal}",
                                                            utilsScript: "js/utils.js"
                                                        });
                                                        if ($("#tel_fixe_fiche_patient_indicatif").val() ===
                                                            "41") {
                                                            $("#tel_fixe_fiche_patient").inputmask(
                                                                "999 999 99 99");
                                                        } else if ($("#tel_fixe_fiche_patient_indicatif")
                                                            .val() === "33") {
                                                            $("#tel_fixe_fiche_patient").inputmask(
                                                                "99 99 99 99 99");
                                                        }

                                                        $("#tel_fixe_fiche_patient").on("keyup change",
                                                            function() {
                                                                var countryData = $(
                                                                    "#tel_fixe_fiche_patient")
                                                                    .intlTelInput("getSelectedCountryData");
                                                                $("#tel_fixe_fiche_patient_indicatif").val(
                                                                    countryData.dialCode);
                                                            });

                                                        $("#tel_fixe_fiche_patient").on("countrychange",
                                                            function(e, countryData) {
                                                                $("#tel_fixe_fiche_patient_indicatif").val(
                                                                    countryData.dialCode);
                                                                var idpays = countryData.iso2;
                                                                if (idpays === "fr") {
                                                                    $("#tel_fixe_fiche_patient").inputmask(
                                                                        "99 99 99 99 99");
                                                                } else if (idpays === "ch") {
                                                                    $("#tel_fixe_fiche_patient").inputmask(
                                                                        "999 999 99 99");
                                                                }
                                                            });
                                                    });
                                                </script>
                                                {/literal}
                                            </div>

                                            <div class="col-sm-5 controls">
                                                <input type="email" placeholder="Email" name="email_fiche_patient"
                                                       id="email_fiche_patient" value=""
                                                       {if $iAccess != '10'  && $iAccess!='5'}disabled{/if} />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-4 controls">
                                                <div class="input-group">
                                                    <input type="text" placeholder="Date de naissance"
                                                           name="date_naissance_fiche_patient"
                                                           id="date_naissance_fiche_patient" value="" class="required"
                                                           required {if $iAccess != '10'  && $iAccess!='5'}disabled{/if} />
                                                    <span class="input-group-addon" id="datepicker-icon-trigger"
                                                          data-datepicker="#date_naissance_fiche_patient">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                    <div id="age_fiche_patient" class="vd_blue formPatientAge"></div>
                                                </div>
                                                <div id="bookingBoxdate_naissance_fiche_patient"
                                                     style="position: absolute;z-index: 1;"></div>
                                            </div>
                                            {literal}
                                                <script type="text/javascript">
                                                    $(document).ready(function() {
                                                        $("#date_naissance_fiche_patient").datepicker({
                                                            dateFormat: 'dd/mm/yy',
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            yearRange: "-100:+0",
                                                        }).on('change', function(ev) {
                                                            const inputDate = $(ev.target).datepicker("getDate");
                                                            if(inputDate){
                                                                const dateDiff = new Date(inputDate - new Date());
                                                                const age = Math.abs(dateDiff.getUTCFullYear() - 1970);
                                                                $("#age_fiche_patient").text( age + ' ans');
                                                            }else{
                                                                $("#age_fiche_patient").text('');
                                                            }
                                                        });
                                                        $('[data-datepicker]').click(function(e) {
                                                            var data = $(this).data('datepicker');
                                                            $(data).focus();
                                                        });
                                                    });
                                                </script>
                                            {/literal}
                                            <div class="col-sm-4 controls">
                                                <input type="text" onkeyup="checkInsee(this);"
                                                       placeholder="N° de sécurité sociale" name="num_secu_fiche_patient"
                                                       id="num_secu_fiche_patient" value=""
                                                       {if $iAccess != '10' or $iAccess=='5'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-4 controls">
                                                <select id="assurance_fiche_patient" name="assurance_fiche_patient"
                                                        {if $iAccess != '10'  && $iAccess!='5'}disabled{/if}>
                                                    <option value="">Veuillez choisir une assurance</option>
                                                    {foreach from=$TabAssurance item=objAssurance}
                                                        <option value="{$objAssurance.id_assurance_maladie}">
                                                            {$objAssurance.libelle_assurance_maladie}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-4 controls">
                                                <input type="text" placeholder="Médecin traitant"
                                                       name="medecin_traitant_fiche_patient"
                                                       id="medecin_traitant_fiche_patient" value=""
                                                       {if $iAccess != '10'  && $iAccess!='5'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-4 controls">
                                                <input type="text" placeholder="Ville du médecin"
                                                       name="ville_medecin_fiche_patient" id="ville_medecin_fiche_patient"
                                                       value="" {if $iAccess != '10'  && $iAccess!='5'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-4 controls">
                                                <input type="text" placeholder="Profession"
                                                       name="profession_fiche_patient" id="profession_fiche_patient"
                                                       value="" {if $iAccess != '10'  && $iAccess!='5'}disabled{/if} />
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-12 controls">
                                                <textarea placeholder="Remarque patient" name="remarque_fiche_patient"
                                                          id="remarque_fiche_patient"
                                                          {if $iAccess != '10'  && $iAccess!='5'}disabled{/if}></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-4 controls">
                                                <div class="input-group">
                                                    <select id="couleur_fiche_patient"
                                                            {if $iAccess != '10'  && $iAccess!='5'}disabled{/if}>
                                                        <option value="">Couleur du patient</option>
                                                        <option value="008000"
                                                                style="color:#FFFFFF; background-color: #008000">Vert
                                                        </option>
                                                        <option value="FF8D01"
                                                                style="color:#FFFFFF; background-color: #FF8D01">Orange
                                                        </option>
                                                        <option value="FF0000"
                                                                style="color:#FFFFFF; background-color: #FF0000">Rouge
                                                        </option>
                                                    </select>
                                                    <span id="cadre_couleur_fiche_patient"
                                                          class="input-group-addon color-input vd_hover"
                                                          style="color:#008000"><i class="fa fa-square"></i></span>
                                                </div>
                                            </div>
                                            <div class="col-sm-8 controls" style="text-align: right;">
                                                {if $bactivefusionpatient}<h4>IPP : <b><span id='span_fiche_patient_id_module_externe'></span></b></h4>
                                                {/if}

                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-4 controls">
                                                <select id="actif_fiche_patient" name="actif_fiche_patient"
                                                        {if $iAccess != '10'}disabled{/if}>
                                                    <option value="">Statut du compte web</option>
                                                    <option value="actif">Actif</option>
                                                    <option value="inactif" >Inactif</option>
                                                    <option value="bloquer">Bloqué</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-8 controls" style="text-align: right;">
                                                <h4>Fiche créée le : <b><span
                                                                id='span_fiche_patient_creee_le'></span></b></h4>
                                                <h4>Nouveau patient : <b><span
                                                                id='span_fiche_patient_nouveau'></span></b></h4>


                                            </div>

                                        </div>
                                        <hr>

                                        <div class="form-group">
                                            <div class="col-sm-12 controls" align="center">
                                                {* <button type="button" onclick="$('#modalFichePatient').modal('hide');modal_prendre_rendez_vous_patient('');" name="updatepriserdv" id="updatepriserdv" class="btn vd_btn vd_bg-color"><span class="menu-icon"></span> Prendre un rendez-vous</button> *}
                                                {if $iAccess == '10' or $iAccess=='5'}<button type="submit"
                                                                                              name="updateButton" id="updateButton"
                                                                                              class="btn vd_btn vd_bg-color"><span class="menu-icon"></span>
                                                    Enregistrer</button>&nbsp;&nbsp;{/if}
                                                <button type="button" data-dismiss="modal" aria-hidden="true"
                                                        class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span>
                                                    Fermer</button>
                                                <i class="fa fa-paper-plane-o" id="btnSendMessage"
                                                   onclick="sendMessagePatient();"
                                                   title="Communiquer avec le centre"
                                                   style="font-size:35px; color:#5D9AD4; float:right; margin-right:71px; "></i>
                                                <i class="fa fa-plus-circle" id="btplusrdvresult"
                                                   onclick="enregistrement_patient('nouveauRDV');"
                                                   title="Prendre un RDV"
                                                   style="font-size:45px; color:#5D9AD4; float:right; margin-right:10px; margin-top:-7px;"></i>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            {if $bactivvisuhistordvpatient}
                                <div class="tab-pane col-sm-12" id="histo-tab">
                                    <div id="filtre_histo">
                                        <div>
                                            <input onclick="checkbox_color(1);" class="checkbox_filtre" type="checkbox"
                                                   id="checkbox_traiter" name="checkbox_traiter">
                                            <label class="name_filtre_histo" id="name_checkbox_traiter"
                                                   for="checkbox_traiter">Traité</label>
                                        </div>
                                        <div>
                                            <input onclick="checkbox_color(2);" class="checkbox_filtre" type="checkbox"
                                                   id="checkbox_annuler" name="checkbox_annuler">
                                            <label class="name_filtre_histo" id="name_checkbox_annuler"
                                                   for="checkbox_annuler">Annulé</label>
                                        </div>
                                        <div>
                                            <input onclick="checkbox_color(3);" class="checkbox_filtre" type="checkbox"
                                                   id="checkbox_deprogrammer" name="checkbox_deprogrammer">
                                            <label class="name_filtre_histo" id="name_checkbox_deprogrammer"
                                                   for="checkbox_deprogrammer">Déprogrammé</label>
                                        </div>
                                        <div>
                                            <input onclick="checkbox_color(4);" class="checkbox_filtre" type="checkbox"
                                                   id="checkbox_rdv_planifie" name="checkbox_rdv_planifie">
                                            <label class="name_filtre_histo" id="name_checkbox_rdv_planifie"
                                                   for="checkbox_rdv_planifie">Planifié</label>
                                        </div>
                                        <div>
                                            <input onclick="checkbox_color(5);" class="checkbox_filtre" type="checkbox"
                                                   id="checkbox_tous" name="checkbox_tous" checked>
                                            <label class="name_filtre_histo" id="name_checkbox_tous"
                                                   for="checkbox_tous">Tous</label>
                                        </div>
                                    </div>
                                    <br />
                                    <div id="attente_historique_patient">
                                        <div align='center'><br><br>
                                            <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                            <br><br>
                                        </div>
                                    </div>
                                    <div id='pas_historique_patient' style="display: none;">
                                        <div class="alert alert-info">
                                            <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                            Aucun historique disponible
                                        </div>
                                    </div>
                                    <div id='historique_patient' style="display: none;">
                                        <div class="row">
                                            <div class="col-md-12" style="padding: unset;">
                                                <div class="panel widget">
                                                    <div class="panel-body-list  table-responsive" style="margin: unset;">
                                                        <table class="table table-striped table-hover no-head-border">
                                                            <thead class="head-histo" style=" width: 1168px;display: table;">
                                                            <tr>
                                                                <th class="th_tab" style="padding-left: 10px;width:152px;">Action<span
                                                                            class="separator_vertical" style="margin-top: -1px;">|</span></th>
                                                                <th class="th_tab" style="padding-left: 2px;width:140px;">Date<span
                                                                            class="separator_vertical" style="margin-top: -1px;">|</span></th>
                                                                <th class="th_tab" style="padding-left: 2px;width:140px;">Motif<span
                                                                            class="separator_vertical" style="margin-top: -1px;">|</span></th>
                                                                <th class="th_tab" style="padding-left: 2px;width:140px;">Spécialité<span
                                                                            class="separator_vertical" style="margin-top: -1px;">|</span></th>
                                                                <th class="th_tab" style="padding-left: 2px;width:240px;">Praticien<span
                                                                            class="separator_vertical" style="margin-top: -1px;">|</span></th>
                                                                <th class="th_tab" style="padding-left: 2px;width:150px;">Lieu<span
                                                                            class="separator_vertical" style="margin-top: -1px;">|</span></th>

                                                                <th class="th_tab" style="padding-left: 2px;">Statut</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="boucle_historique_modal_patient" style="font-size: 12px;max-height: 400px;overflow-y: auto;display: block;width: 1168px;"></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12" align="center">
                                        <button style="position: fixed;bottom: 20px;left: 30px;" type="button" onclick="printAppointments();" disabled
                                                name="printpriserdv" id="printpriserdv" class="btn bg_dark_blue vd_white"><span
                                                    class="menu-icon"><i class='icon-printer'></i> Imprimer la sélection</span></button>
                                        <button style="position: fixed;bottom: 20px;left: 230px;border-radius:4px;" type="button" onclick="sendAppointments();" disabled
                                                name="sendpriserdv" id="sendpriserdv" class="btn fg_dark_blue bd_dark_blue"><span
                                                    class="menu-icon"></span><i class='fa fa-envelope'></i> Envoyer la sélection</button>
                                        <button style="position: fixed;bottom: 20px;right: 30px;" type="button" onclick="modal_prendre_rendez_vous_patient('');"
                                                name="updatepriserdv" id="updatepriserdv" class="btn vd_btn vd_bg-color"><span
                                                    class="menu-icon"></span> Prendre un rendez-vous</button>
                                    </div>
                                </div>
                            {/if}

                            <div class="tab-pane col-sm-12" id="profil-tab">
                                <br />
                                <div id="attente_profil_patient">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br>
                                    </div>
                                </div>
                                <div id='message_retour_consentement_patient' style="display: none;"></div>
                                <div id='div_info_profilage_consentement_patient' style="margin-bottom: 15px;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div id="info_profilage_consentement_patient" style="text-align: center;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id='pas_profil_patient' style="display: none;">
                                    <div class="alert alert-info">
                                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                        Aucun rdv profilé disponible
                                    </div>
                                </div>
                                <div id='profil_patient' style="display: none;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel widget">
                                                <div class="panel-body-list  table-responsive">
                                                    <table class="table table-striped table-hover no-head-border">
                                                        <thead class="vd_bg-color vd_white">
                                                        <tr>
                                                            <th>Motif RDV</th>
                                                            <th>Lieu</th>
                                                            <th>Praticien</th>
                                                            <th>A partir de</th>
                                                            <th>URL</th>
                                                            <th>Statut</th>
                                                            <th>Date rappel</th>
                                                            <th>Action</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="boucle_profil"></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" align="center">
                                    <button type="button" data-dismiss="modal" aria-hidden="true"
                                            class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                </div>
                            </div>

                            <div class="tab-pane col-sm-12" id="plan-traitement-tab">
                                <br />
                                <div id="attente_plan_traitement_patient" style="display: none;">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br>
                                    </div>
                                </div>
                                <div style="margin-bottom: 15px;">
                                    <div class="row">
                                        <div class="col-md-12" style="text-align: center;">
                                            <button type="button" name="btnGenererPDTFichePAtient"
                                                    id="btnGenererPDTFichePAtient" class="btn vd_btn vd_bg-color"
                                                    onclick="initialise_modal_plan_traitement_patient($('#id_fiche_patient').val());"><span
                                                        class="menu-icon"><i class='fa fa-plus-circle'></i></span> Ajouter
                                                un plan de traitement</button>
                                        </div>
                                    </div>
                                </div>
                                <div id='pas_plan_traitement_patient' style="display: none;">
                                    <div class="alert alert-info">
                                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                        <!--Ce patient n'a actuellement aucun plan de traitement-->
                                    </div>
                                </div>
                                <div id='plan_traitement_patient' style="display: none;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel widget">
                                                <div class="panel-body-list  table-responsive">
                                                    <table class="table table-striped table-hover no-head-border">
                                                        <thead class="vd_bg-color vd_white">
                                                        <tr>
                                                            <th>Créé le</th>
                                                            <th>Liste des RDV</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="boucle_plan_traitement"></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" style="text-align: center">
                                    <button type="button" data-dismiss="modal" aria-hidden="true"
                                            class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                </div>
                            </div>

                            <div class="tab-pane col-sm-12" id="doc-tab">
                                <br />
                                <div id="attente_document_patient">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br>
                                    </div>
                                </div>

                                <div id='pas_mail_tel' style="display: none;">
                                    <div class="alert alert-danger" id="id_message_erreur">
                                        <span class="vd_alert-icon"><i class="fa fa-warning vd_red"></i></span>
                                        Aucun document disponible 2
                                    </div>
                                </div>

                                <div id='pas_document_patient' style="display: none;">
                                    <div class="alert alert-info">
                                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                        Aucun document disponible
                                    </div>
                                </div>
                                <div id='document_patient' style="display: none;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel widget">
                                                <div class="panel-body-list  table-responsive">
                                                    <table class="table table-striped table-hover no-head-border">
                                                        <thead class="vd_bg-color vd_white">
                                                        <tr>
                                                            <th></th>
                                                            <th>Date/Heure</th>
                                                            <th>Nom du document</th>
                                                            <th></th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="boucle_document"></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" align="center">
                                    <input style="visibility: collapse; width: 0px;" type="file" id="inputFile"
                                           onchange="upload_patient_file('{$idc}', '{$ident_user}')">
                                    {if $iAccess == '10'}<button type="button" name="uploadPatientFile"
                                                                 id="uploadPatientFile" class="btn vd_btn vd_bg-color"
                                                                 onclick="verifierCompteWeb();"><span class="menu-icon"></span>Charger un
                                        document</button>&nbsp;&nbsp;{/if}
                                    <button type="button" data-dismiss="modal" aria-hidden="true"
                                            class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                </div>
                            </div>

                            <div class="tab-pane col-sm-12" id="famille-tab">
                                <br />
                                <div id="attente_famille_patient">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br>
                                    </div>
                                </div>
                                <div id='pas_famille_patient' style="display: none;">
                                    <div class="alert alert-info">
                                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                        Aucun patient enregistré comme compte lié
                                    </div>
                                </div>
                                <div id='famille_patient' style="display: none;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel widget">
                                                <div class="panel-body-list  table-responsive">
                                                    <table class="table table-striped table-hover no-head-border">
                                                        <thead class="vd_bg-color vd_white">
                                                        <tr>
                                                            <th></th>
                                                            <th>Lien de parenté</th>
                                                            <th>Civilité</th>
                                                            <th>Nom</th>
                                                            <th>Prénom</th>
                                                            <th>Date de naissance</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="boucle_famille"></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id='form_famille_patient' style="display: none;">
                                    <form action="" role="form" id="modal_famille_patient" class="form-horizontal">
                                        <div class="form-group" style="margin-top: 15px">
                                            <div class="col-sm-4 controls">
                                                <div class="vd_input-wrapper-modal" style="background-color:#fff;">
                                                    <input type="hidden" placeholder="" name="id_famille_patient"
                                                           id="id_famille_patient" value=""
                                                           {if $iAccess != '10'}disabled{/if} />
                                                    <input type="hidden" placeholder="" name="id_lien_parent"
                                                           id="id_lien_parent" value=""
                                                           {if $iAccess != '10'}disabled{/if} />
                                                    <select id="civilite_famille_patient"
                                                            name="civilite_famille_patient" required class="required"
                                                            {if $iAccess != '10'}disabled{/if}>
                                                        <option value="">Civilité</option>
                                                        {foreach from=$tabListeCivilite item=tabLC name=stabListeCivilite}
                                                            <option value="{$tabLC.id_civilite}">
                                                                {$tabLC.abreviation_civilite}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 controls">
                                                <input type="text" placeholder="Nom" name="nom_famille_patient"
                                                       id="nom_famille_patient" value="" required
                                                       class="required input-majuscule"
                                                       {if $iAccess != '10'}disabled{/if} />
                                            </div>
                                            <div class="col-sm-6 controls">
                                                <input type="text" placeholder="Prénom" name="prenom_famille_patient"
                                                       id="prenom_famille_patient" value="" required
                                                       class="input-first-letter required"
                                                       {if $iAccess != '10'}disabled{/if} />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 controls">
                                                <div class="input-group">
                                                    <input type="text" placeholder="Date de naissance"
                                                           name="date_naissance_famille_patient"
                                                           id="date_naissance_famille_patient" value="" class="required"
                                                           required {if $iAccess != '10'}disabled{/if} />
                                                    <span class="input-group-addon" id="datepicker-icon-trigger"
                                                          data-datepicker="#date_naissance_famille_patient">
                                                        <i class="fa fa-calendar"></i>
                                                    </span>
                                                </div>
                                                <div id="bookingBoxdate_naissance_famille_patient"
                                                     style="position: absolute;z-index: 1;"></div>
                                            </div>
                                            {literal}
                                                <script type="text/javascript">
                                                    function displayPrintButton(){
                                                        let isChecked = false;
                                                        $("input[name='checkRDVPatient[]']").each( function () {
                                                            if($(this).is(':checked')){
                                                                isChecked=true;
                                                            }

                                                        });
                                                        if (isChecked ===true ){
                                                            $('#sendpriserdv').prop( "disabled", false );
                                                            $('#printpriserdv').prop( "disabled", false );
                                                        }else{
                                                            $('#sendpriserdv').prop( "disabled", true );
                                                            $('#printpriserdv').prop( "disabled", true );
                                                        }
                                                    }
                                                    $(document).ready(function() {
                                                        $("#date_naissance_famille_patient").datepicker({
                                                            dateFormat: 'dd/mm/yy',
                                                            changeMonth: true,
                                                            changeYear: true,
                                                            yearRange: "-100:+0",
                                                            beforeShow: function(textbox, instance) {
                                                                $('#ui-datepicker-div').css({
                                                                    position: 'initial',
                                                                    top: '325px',
                                                                    left: '30px'
                                                                });
                                                                $('#bookingBoxdate_naissance_famille_patient')
                                                                    .append($('#ui-datepicker-div'));
                                                                $('#ui-datepicker-div').hide();
                                                            }
                                                        });
                                                        $('[data-datepicker]').click(function(e) {
                                                            var data = $(this).data('datepicker');
                                                            $(data).focus();
                                                        });
                                                    });
                                                </script>
                                            {/literal}
                                            <div class="col-sm-6 controls">
                                                <div class="vd_input-wrapper-modal" style="background-color:#fff;">
                                                    <select id="parent_famille_patient" name="parent_famille_patient"
                                                            required class="required" {if $iAccess != '10'}disabled{/if}>
                                                        <option value="">Lien de parenté</option>
                                                        {foreach from=$tabListeParent item=tabLC name=tabListeParent}
                                                            <option value="{$tabLC.identifiant_champ_vrac}">
                                                                {$tabLC.valeur_champ_vrac}</option>
                                                        {/foreach}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-12 controls" align="center">
                                                {if $iAccess == '10'}<button type="button" name="updateButton"
                                                                             id="updateButtonFamille" class="btn vd_btn vd_bg-color"
                                                                             onclick="updateFamilyMember()"><span class="menu-icon"></span>
                                                    Modifier</button>&nbsp;&nbsp;{/if}
                                                {if $iAccess == '10'}<button type="button" name="updateButton"
                                                                             id="createButtonFamille" class="btn vd_btn vd_bg-color"
                                                                             onclick="createFamilyMember()"><span class="menu-icon"></span>
                                                    Créer</button>&nbsp;&nbsp;{/if}
                                                <button type="button" onclick="getFamillePatient()"
                                                        class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span>
                                                    Fermer</button>

                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="col-md-12" align="center" id="family_footer">
                                    {if $iAccess == '10'}<button type="button" name="AddFamilyMember"
                                                                 id="AddFamilyMember" class="btn vd_btn vd_bg-color"
                                                                 onclick="addFamilyMember()"><span class="menu-icon"></span>
                                        Ajouter</button>&nbsp;&nbsp;{/if}
                                    <button type="button" data-dismiss="modal" aria-hidden="true"
                                            class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                </div>
                            </div>

                            {* [DEBUT] Log patient *}
                            {if $bactivvisuhistopatient}
                                <div class="tab-pane col-sm-12" id="log-patient">
                                    <br />
                                    {* <div id="attente_log_patient">
                                        <div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2><br><br></div>
                                    </div> *}
                                    <div id='pas_log_patient' style="display: none;">
                                        <div class="alert alert-info">
                                            <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                            Aucun log disponible
                                        </div>
                                    </div>
                                    <div id='log_patient' style="display: none;">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="panel widget">
                                                    <div class="panel-body-list  table-responsive">
                                                        <table class="table table-striped table-hover no-head-border">
                                                            <thead class="vd_bg-color vd_white">
                                                            <tr>
                                                                <th></th>
                                                                <th>Date/Heure</th>
                                                                <th>Utilisateur</th>
                                                                <th>Commentaire</th>
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="boucle_log_patient"></tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12" align="center">
                                        <button type="button" data-dismiss="modal" aria-hidden="true"
                                                class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                    </div>
                                </div>
                            {/if}
                            {* [FIN] Log patient *}

                            <div class="tab-pane col-sm-12" id="avis-tab">
                                <br />
                                <div id="attente_avis_patient">
                                    <div align='center'><br><br>
                                        <h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_blue'></i></h2>
                                        <br><br>
                                    </div>
                                </div>
                                <div id='pas_avis_patient' style="display: none;">
                                    <div class="alert alert-info">
                                        <span class="vd_alert-icon"><i class="fa fa-info-circle vd_blue"></i></span>
                                        Aucun avis disponible
                                    </div>
                                </div>
                                <div id='avis_patient' style="display: none;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel widget">
                                                <div class="panel-body-list  table-responsive">
                                                    <table class="table table-striped table-hover no-head-border">
                                                        <thead class="vd_bg-color vd_white">
                                                        <tr>
                                                            <th></th>
                                                            <th>Questionnaire</th>
                                                            <th>Date de retour</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="boucle_avis"></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12" align="center">
                                    <button type="button" data-dismiss="modal" aria-hidden="true"
                                            class="btn vd_btn vd_bg-grey"><span class="menu-icon"></span> Fermer</button>
                                </div>
                            </div>

                            <div class="clearfix"></div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="idpatientpriserdv" value="">
<!-- [FIN] Modal Fiche Patient -->