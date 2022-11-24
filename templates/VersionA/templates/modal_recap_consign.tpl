<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<?php $select2 = filemtime(PATH_ASSETS . 'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js') ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.{$select2}.js"></script>
<link rel="stylesheet" href="css/liste_consignes.css">
<div class="modal fade " id="modalRecapInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title">Récapitulatif de consigne</h4>
            </div>
            <div class="modal-body">
                <h3 id='modalElemName'></h4>
                <h4 id='modalElemType' class="vd_blue"></h5>
                <div style="margin: 20px;">
                    <div>
                        <strong style='margin-left: 20px'>Consigne</strong>
                        <div id='modalElemContent' class="modalElemTextArea"></div>
                    </div>
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Appliquée sur :</strong>
                        <div id='modalElemVisibilities' class="modalElem" ></div>
                    </div>
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Faire apparaître :</strong>
                        <div id='modalElemShowBefore' class="modalElem"></div>

                    </div>
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Période :</strong>
                        <div id='modalElemPeriod' class="modalElem"></div>
                    </div>
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Récurrence :</strong>
                        <div>
                            <div id='modalElemDays' class="modalElem" style='display:flex'></div>
                            <div id='modalElemMonths' class="modalElem" style='display:flex'></div>
                        </div>
                    </div>
                    <hr style="width: 20%; margin-right: auto; margin-left: 0; border-color: #5D9AD4;" />
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Lieu(x) :</strong>
                        <div style="flex:1">
                            <select id='modalElemLocations' class="js-example-basic-multiple readonly modalElem" multiple="multiple" style='width:100%;'>
                            </select>
                        </div>
                    </div>

                    <div class="modalLineElement">
                        <strong style="width: 15%;">Spécialité(s) :</strong>
                        <div style="flex:1">
                            <select id='modalElemSpecialties' class="js-example-basic-multiple readonly modalElem" multiple="multiple" style='width:100%;'>
                            </select>
                        </div>
                    </div>
                    
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Praticien(s) :</strong>
                        <div style="flex:1">
                            <select id='modalElemPractitioners' class="js-example-basic-multiple readonly modalElem" multiple="multiple" style='width:100%;'>
                            </select>
                        </div>
                    </div>
                    
                    <div class="modalLineElement">
                        <strong style="width: 15%;">Motif(s) :</strong>
                        <div style="flex:1">
                            <select id='modalElemTypes' class="js-example-basic-multiple readonly modalElem" multiple="multiple" style='width:100%;'>
                            </select>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="modal-footer vd_bg-white">
                <button type="button" class="btn btn-primary vd_white" data-dismiss="modal">Valider</button>
            </div>
        </div>
    </div>
</div>
{literal}
<script>

    function addListElem(tagSelector, spanContents = [], needCheck = true, classNames = ''){
        const tagToAppend = $(tagSelector);
        const checkContent = needCheck ? "<i class='fa fa-check vd_blue'></i>" : '';
        spanContents.forEach(elem => {
            let content = `
                <div style='margin-right: 2em;'>
                    ${checkContent}
                    <span class='${classNames}'>${elem}</span>
                </div>
            `
            tagToAppend.append(content);
        })
            
    }

    function addSelectOptions(tagSelector, values){
        const tagToAppend = $(tagSelector);
        values.forEach(elem => {
            let newOption = new Option(elem, elem, true, true);
            tagToAppend.append(newOption);
        })
        tagToAppend.trigger('change');
    }

    function resetModal(){
        $('.modalElem').html('');
    }

    function showModalRecap(info){
        resetModal();
        const startDate = moment(info.startDate);
        const endDate = moment(info.endDate);
        const startText = `du <strong>${startDate.format('DD/MM/YYYY')}</strong>`;
        const endText = endDate.isValid() ? ` au <strong>${endDate.format('DD/MM/YYYY')}</strong>` : '';
        const periodDiv = startText + endText;
        const showAfterDiv = `${info.appearsAfter}`
        $('#modalElemName').text(info.name);
        $('#modalElemType').text(info.type);
        $('#modalElemContent').html(info.contenu);
        
        addListElem('#modalElemVisibilities',info.visibilities);
        addListElem('#modalElemShowBefore',[showAfterDiv], false, 'vd_blue');
        addListElem('#modalElemPeriod',[periodDiv], false);
        addListElem('#modalElemDays', Object.values(info.filters['jours']));
        addListElem('#modalElemMonths',Object.values(info.filters['mois']));
        addSelectOptions('#modalElemLocations', Object.values(info.filters['lieux']))
        addSelectOptions('#modalElemSpecialties', Object.values(info.filters['profession']))
        addSelectOptions('#modalElemPractitioners', Object.values(info.filters['praticiens']))
        addSelectOptions('#modalElemTypes', Object.values(info.filters['motifs']))

        $('#modalRecapInfo').modal('show');
    }

    document.addEventListener('DOMContentLoaded', function () {
        $('.js-example-basic-multiple.readonly').select2({disabled: 'readonly'});
    })
</script>
{/literal}
