<link rel="stylesheet" href="css/modal_filtre_dispo.{$cssModalFiltreCss}.css">

<div class="modal fade in" id="modalFilterFirstDispo" tabindex="-1" role="dialog" aria-labelledby="modalFilterFirstDispo" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white modalHeaderFilter">
                <h4 class="modal-title" id="myModalLabelfiltre">Critères du prochain RDV disponible</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
            </div>
            <div class="modal-body modalBodyFilter">
                <div id="loadingFilterModal" class="loadingFilterModal"><div align='center' ><br><br><h2>Veuillez patienter...<br><i class='fa fa-spinner fa-spin vd_green'></i></h2>
                        Dans certains cas la recherche des prochains rendez-vous disponibles peut prendre du temps.<br><br></div></div>
                <div class="alert alert-danger errorFilterModal" id="errorFilterModal" >
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span>
                    <div id="errorMsgFilterModal">
                        
                    </div>

                </div>
                <div id="bodyFilterModal" class="panel-body bodyFilterModal">
                    <form class="form-horizontal" action="" role="form" id="formListFilterModal" >
                        <div class="col-sm-12" >
                            <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8">                  
                                    <div class="col-sm-12">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quel est le professionnel de santé ?</b>
                                            </label>
                                        </div>
                                        <div class="vd_input-wrapper">
                                            <select name="professional" id="selectProfessionalFilterModal"></select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quelle est la spécialité ?</b>
                                            </label>
                                        </div>
                                        <div class="vd_input-wrapper">
                                            <select name="profession" id="selectProfessionFilterModal"></select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12" id="selectpraticien2Div">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quelle est le praticien ?</b>
                                            </label>
                                        </div>
                                        <div class="vd_input-wrapper">
                                            <select name="practitioner" id="selectPractitionerFilterModal"></select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quel est le motif de la consultation ?</b>
                                            </label>
                                        </div>
                                        <div class="vd_input-wrapper">
                                            <select name="type" id="selectTypeFilterModal" onchange="getAlertConsignsIfExist()"></select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="label-wrapper">
                                            <label class="control-label">
                                                <b>Quel est le lieu du rendez-vous ?</b>
                                            </label>
                                        </div>
                                        <div class="vd_input-wrapper">
                                            <select name="location" id="selectLocationFilterModal"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-2"></div>
                            </div>
                        </div>
                        <div class="col-sm-12" align="center">
                            <button type="button" class="btn vd_btn vd_bg-blue vd_white" data-dismiss="modal" >Annuler</button>
                            <button type="submit"  class="btn vd_btn vd_bg-blue vd_white" name="validateSearchFilterModal" id="validateSearchFilterModal" >Rechercher</button>&nbsp;&nbsp;
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
     
        function getAlertConsignsIfExist() {
            const appointmentDate = moment().format('Y-M-D');
            const locationId = $('#selectLocationFilterModal').val();
            const ProfessionId = $('#selectProfessionFilterModal').val();
            const appointmentType = $('#selectTypeFilterModal').val();
            const practitionerId = $('#selectPractitionerFilterModal').find(':selected').data('id');
            const idc = $('#idc').val();
            const alertParams = {
                idtyperdv: appointmentType,
                provenance: 'backoffice',
                idlieu: locationId, 
                appointmentDate: appointmentDate,
                idpraticien: practitionerId,
                idc: idc,
                beforeAppointment: true,
                idprofession: ProfessionId
            };
            $.ajax({
                cache: false,
                url: 'ajax/getAppointmentAlert.php',
                data: alertParams,
                dataType: 'json'
            }).done(function( msg ) {
                if(msg.success && msg.consigns && msg.consigns.length > 0){
                    showAlertConsigns(msg.consigns);
                }
            })
        }

        async function showModalFilter(idc,idprofession,idpractitioner,idlocation){
            let inputProfessional = $('#selectProfessionalFilterModal');
            let inputProfession = $('#selectProfessionFilterModal');
            let inputPractitioner = $('#selectPractitionerFilterModal');
            let inputType = $('#selectTypeFilterModal');
            let inputLocation = $('#selectLocationFilterModal');

            inputProfessional.off();
            inputProfession.off();
            inputPractitioner.off();
            inputType.off();
            inputLocation.off();
            $('#errorFilterModal').hide();
            setErrorMessage(false,"");
            inputProfessional.on('change', async function(event) {
                try {
                    const professions = await getProfessions(idc,idprofession,idpractitioner,event.target.value,idlocation);
                    setInputList(inputProfession,professions);  
                    setErrorMessage(false,"");
                } catch(err) {
                    let errorMsg = err.message;
                    let error = true;
                    setErrorMessage(error,errorMsg)
                }
            })

            inputProfession.on('change', async function(event) {
                try {
                    const practitioners = await getPractitioners(idc,idprofession?idprofession:event.target.value,idpractitioner,idlocation);
                    idprofession = event.target.value
                    var selectedPractitioner = practitioners.filter(pract => pract.id === idpractitioner)
                    setInputList(inputPractitioner,selectedPractitioner);
                    if(selectedPractitioner.length === 0){
                        let errorMsg = "Aucune disponibilité trouvée.";
                        let error = true;
                        setErrorMessage(error,errorMsg)
                    }else{
                        setErrorMessage(false,"");
                    }
                } catch(err) {
                    let errorMsg = err.message;
                    let error = true;
                    setErrorMessage(error,errorMsg)
                }
            })

            inputPractitioner.on('change', async function(event) {
                try {
                    const types = await getAppointmentTypes(idc,idprofession,idpractitioner?idpractitioner:event.target.value,idlocation);
                    idpractitioner = event.target.value
                    setInputList(inputType,types);
                    setErrorMessage(false,"");
                } catch(err) {
                    let errorMsg = err.message;
                    let error = true;
                    setErrorMessage(error,errorMsg);
                }
            })

            inputType.on('change', async function(event) {
                try {
                    const locations = await getLocations(idc,event.target.value,idprofession,idpractitioner,idlocation);
                    setInputList(inputLocation,locations);
                    setErrorMessage(false,"");
                } catch(err) {
                    let errorMsg = err.message;
                    let error = true;
                    setErrorMessage(error,errorMsg);
                }
            })            

            try {
                const categories = await getCategories(idc,idprofession,idpractitioner,idlocation);
                setInputList(inputProfessional,categories);
                setErrorMessage(false,"");
            } catch(err) {
                let errorMsg = err.message;
                let error = true;
                setErrorMessage(error,errorMsg);
            }

            $("#modalFilterFirstDispo").modal('show');
        }

        function setErrorMessage(isError,message){
            $('#validateSearchFilterModal').attr('disabled',isError)
            if(isError){
                $('#errorFilterModal').show();
                $('#errorMsgFilterModal').text(message)
            }else{
                $('#errorFilterModal').hide();
                $('#errorMsgFilterModal').text('');
            }
        }

        function setInputList(listObject,listToAppend){
            listObject.empty();
            listToAppend.forEach(elem => {
                listObject.append('<option data-id="' + elem.id_user + '" value="' + elem.id + '">' + elem.libelle + '</option>');
            })
            if(listToAppend.length <= 1){
                listObject.attr('disabled', true)
            }else{
                listObject.attr('disabled', false)
            }
            listObject.change();
        }

        function hideModalFilter() {
            $('#modalFilterFirstDispo').modal('hide');
        }

        function getCategories(idc,idprofession,idpractitioner,idlocation){

            let data = {};
            if(idc){
                data['idc'] = idc;
            }
            if(idpractitioner){
                data['idp'] = idpractitioner;
            }
            if(idprofession){
                data['idprodpush'] = idprofession;
            }
            if(idlocation){
                data['idlieux'] = idlocation;
            }

            return $.ajax({
                cache: false,
                url: 'ajax/liste_categorie.php',
                data: data,
                dataType: 'json',
            });
        }

        function getProfessions(idc,idprofession,idpractitioner,idcategory,idlocation){
            let data = {};
            if(idc){
                data['idc'] = idc;
            }
            if(idpractitioner){
                data['idp'] = idpractitioner;
            }
            if(idprofession){
                data['idprodpush'] = idprofession;
            }
            if(idlocation){
                data['idlieux'] = idlocation;
            }
            if(idcategory){
                data['idcatprofession'] = idcategory;
            }
            return $.ajax({
				cache: false,
				url: 'ajax/liste_profession.php',
				data: data,
				dataType: 'json',
			});
        }

        function getPractitioners(idc,idprofession,idpractitioner,idlocation){
            let data = {};
            if(idc){
                data['idc'] = idc;
            }
            if(idpractitioner){
                data['idp'] = idpractitioner;
            }
            if(idprofession){
                data['idprofession'] = idprofession;
            }
            if(idlocation){
                data['idlieu'] = idlocation;
            }
            return $.ajax({
				cache: false,
				url: 'ajax/liste_praticien_profession.php',
				data: data,
				dataType: 'json',
			});
        }

        function getAppointmentTypes(idc,idprofession,idpractitioner,idlocation){

            let data = {};
            if(idc){
                data['idc'] = idc;
            }
            if(idpractitioner){
                data['idp'] = idpractitioner;
            }
            if(idprofession){
                data['idprofession'] = idprofession;
            }
            if(idlocation){
                data['idlieu'] = idlocation;
            }

            return $.ajax({
				cache: false,
				url: 'ajax/liste_rdv_backoffice.php',
				data: data,
				dataType: 'json',
			});
        }

        function getLocations(idc,typeAppointment,idprofession,idpractitioner,idlocation){

            let data = {};
            if(idc){
                data['idc'] = idc;
            }
            if(typeAppointment){
                data['idtyperdv'] = typeAppointment;
            }
            if(idpractitioner){
                data['idp'] = idpractitioner;
            }
            if(idprofession){
                data['idprofession'] = idprofession;
            }
            if(idlocation){
                data['idlieu'] = idlocation;
            }

            return $.ajax({
				cache: false,
				url: 'ajax/liste_lieux.php',
				data: data,
				dataType: 'json',
			});
        }
    </script>
</div>