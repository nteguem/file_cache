<style>
.ui-autocomplete {
     z-index: 9999 !important;
}
</style>
<script src="js/customCarousel.{customCarousel_1}.js"></script>
<link rel="stylesheet" href="css/customCarousel.css">
<link rel="stylesheet" href="css/modal-ts.css">

<div style="overflow-x: hidden;overflow-y: auto;" class="modal fade in" id="modalListeFichePatient" tabindex="-1"
    role="dialog" aria-labelledby="LabelmodalLIsteFichePatient" aria-hidden="false" data-keyboard="false"
    data-backdrop="static">
    <div class="modal-dialog" style='width:80vw'>
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white" style='display:flex; flex-direction:row-reverse;'>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                        class="fa fa-times"></i></button>
            </div>
            <div class="modal-body" style='display:flex; flex-direction: row; max-height: 80vh'>
                <div style='flex:2; display:flex; flex-direction: column; gap: 2vh; padding-right:15px'>
                    <div style='align-self:center; width:50%; height: 7vh;'>
                        <label>Rechercher un patient :</label>
                        <div class="input-wrapper">
                            <input type="text" style='padding:4px' id="id_autocomplete_recherche_patient_fast" name="autocomplete_recherche_patient_fast"
                            class="vd_menu-search-text-TS" style="" />
                            <i class="fa fa-search fa-search-TS" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class='modalTitleBand'>
                        <b>Patient avec le numéro : {$numeroappelant}</b>
                    </div>
                    <div style='overflow: auto; height: 50vh; display:flex; flex-direction:column; justify-content:center;'>
                        <div id="bouclelistePatients" class="col-sm-12" style="height: 100%"></div>
                    </div>
                    <div style='align-self:center'>
                        <button name="updateButton" id="AddPatientList"
                            style='padding: 10px 20px; font-weight:600;'
                            class="btn vd_btn vd_bg-color btn-rounded" 
                            onclick="$('#modalFichePatient').modal('show');getInfoPatient('0','{$numeroappelant}');$('#modalListeFichePatient').modal('hide');"
                        >
                            <span style='margin-right:5px'>Ajouter un patient</span> <i class="fa fa-plus fa-lg" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
                {if count($locations) > 0 || $sMessageLieuxNotFound !== ""}
                <div style='flex:1; border-left: solid 1px #1B4B65; display:flex; flex-direction: column; gap: 2vh; padding-left:15px;'>
                    
                    {if $sMessageLieuxNotFound != ""}
                    <div class="col-sm-12 alert alert-danger" style='margin:auto;' id='txt_alert_message_avertissement'><span
                            class="vd_alert-icon"><i
                                class="fa fa-exclamation-circle vd_red"></i></span>{$sMessageLieuxNotFound}</div>
                    {else}
                    <div style='align-self:center; height:6vh; color: #5D9AD4; font-size:6vh;'>
                        <span><i class="ico-infoIcon" aria-hidden="true"></i>
                    </div>
                    <div class='modalTitleBand' style='text-align: center'>
                        {if count($locations) > 1}
                        <div class='carousel slide locationCarousel' data-pause="false" data-wrap="false" data-interval="false" id="locationCarousel">
                            <div class='carousel-inner'>
                                {foreach from=$locations item=location key=locationKey}
                                <div data-locationKey="{$locationKey}" class='item {if $locationKey === 0}active first{elseif $locationKey === (count($locations)-1)}last{/if}'><div>{$location['nom_lieux']}</div></div>
                                {/foreach}
                            </div>
                            <ol class="carousel-indicators customCarouselIndicators">
                                {foreach from=$locations item=location key=locationKey}
                                <li data-target='#locationCarousel' data-slide-to="{$locationKey}" {if $locationKey === 0} class='active' {/if} ></li>
                                {/foreach}
                            </ol>
                            <a  id='locationCarouselLeft' class="left carousel-control customCarouselControls disabled" href=".locationCarousel" data-slide="prev">
                                <i class="fa fa-chevron-left" aria-hidden="true"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a  id='locationCarouselRight' class="right carousel-control customCarouselControls" href=".locationCarousel" data-slide="next">
                                <i class="fa fa-chevron-right" aria-hidden="true"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        {elseif count($locations) === 1}
                        <div>{$locations[0]['nom_lieux']}</div>
                        {/if}
                    </div>
                    <div style="overflow: auto; padding: 5px 0; height: 100%;" id="locationConsignContent">
                        {if count($locations) > 1}
                        <div class='locationCarousel carousel slide h-100' data-pause="false" data-wrap="false" data-interval="false" id="locationCarouselContent">
                            <div class='carousel-inner h-100' style="overflow: auto">
                                {foreach from=$locations item=location key=locationKey}
                                <div class='h-100 item {if $locationKey === 0}active first{elseif $locationKey === (count($locations)-1)}last{/if}'>
                                    {if count($location['consigns']) > 1}
                                    <div class='customCarousel slide h-100 carouselConsigns' id="locationCarouselConsign-{$locationKey}">
                                        <div class='customCarousel-inner'>
                                            {foreach from=$location["consigns"] item=consign key=consignKey} 
                                                <div class='customItem {if $consignKey === 0}active{/if}'>{$consign['contenu']}</div>                                                
                                            {/foreach}  
                                        </div>
                                        <div class="customCarousel-indicators carouselIndicatorsNumbers">
                                            <i data-target='#locationCarouselConsign-{$locationKey}' class="fa fa-chevron-left customCarousel-left" aria-hidden="true"></i>
                                            {foreach from=$location["consigns"] item=consign key=consignKey}
                                            <div data-target='#locationCarouselConsign-{$locationKey}' data-slide-to="{$consignKey}" class='customIndicator {if $consignKey === 0} active {/if}' >{$consignKey+1}</div>
                                            {/foreach}
                                            <i data-target='#locationCarouselConsign-{$locationKey}' class="fa fa-chevron-right customCarousel-right" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    {else}
                                        {if $location['consigns'] != null}
                                            {$location['consigns'][0]['contenu']}
                                        {else}
                                            <div class="consignEmptyWrapper">
                                                <i class="fa fa-warning fa-5x noConsignWarningTS" aria-hidden="true"></i>
                                            </div>
                                        {/if}
                                    {/if}
                                </div>
                                {/foreach}
                            </div>
                        </div>
                        {elseif count($locations) === 1}
                            {if count($locations[0]['consigns']) > 1}
                                <div class='customCarousel slide h-100 carouselConsigns' id="locationCarouselConsign-0">
                                    <div class='customCarousel-inner'>
                                        {foreach from=$locations[0]["consigns"] item=consign key=consignKey} 
                                            <div class='customItem {if $consignKey === 0}active{/if}'>{$consign['contenu']}</div>                                                
                                        {/foreach}  
                                    </div>
                                    <div class="customCarousel-indicators carouselIndicatorsNumbers">
                                        <i data-target='#locationCarouselConsign-0' class="fa fa-chevron-left customCarousel-left" aria-hidden="true"></i>
                                        {foreach from=$locations[0]["consigns"] item=consign key=consignKey}
                                        <div data-target='#locationCarouselConsign-0' data-slide-to="{$consignKey}" class='customIndicator {if $consignKey === 0} active {/if}' >{$consignKey+1}</div>
                                        {/foreach}
                                        <i data-target='#locationCarouselConsign-0' class="fa fa-chevron-right customCarousel-right" aria-hidden="true"></i>
                                    </div>
                                </div>
                            {else}
                                {if $locations[0]['consigns'] != null}
                                    {$locations[0]['consigns'][0]['contenu']}
                                {else}
                                    <div class="consignEmptyWrapper">
                                        <i class="fa fa-warning fa-5x noConsignWarningTS" aria-hidden="true"></i>
                                    </div>
                                {/if}
                            {/if}
                        {/if}                      
                    </div>
                    <div style="display:flex; justify-content: end; gap:5px;">
                        <button class="btn btn-rounded btn-icon btn-filled roundIconButton whiteAndBlueBtn onClickTooltip biggerButtons hardShadow"
                            title="Horaire :"
                            id="btnLocationAvailabilities"
                        >
                            <i class="fa fa-calendar" aria-hidden="true"></i>
                        </button>
                        <button class="btn btn-rounded btn-icon btn-filled roundIconButton whiteAndBlueBtn onClickTooltip biggerButtons hardShadow"
                            title="Horaire :"
                            id="btnLocationHours"
                        >
                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                        </button>
                        <button title="Adresse :" type="button" 
                            class="btn btn-rounded btn-icon btn-filled roundIconButton whiteAndBlueBtn onClickTooltip biggerButtons hardShadow"
                            id="btnLocationAddress"
                        >
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                        </button>
                        <button title="Consigne complémentaire :" type="button" 
                            class="btn btn-rounded btn-icon btn-filled roundIconButton whiteAndBlueBtn onClickTooltip biggerButtons hardShadow"
                            id="btnLocationInfoSupp"    
                        >
                            <i class="fa fa-paperclip" aria-hidden="true"></i>
                        </button>
                    </div>
                    {/if}
                </div>
                {/if}
            </div>
        </div>
        
        <script>
            let allLocations = [];
            let actualLocation = 1;
            {literal}                
            function showLocationNumber(locations, number){
                actualLocation = number;
                const element = locations[number];
                let availabilitiesContent = "Pas de disponiblités"; // TODO: changer le message par défaut
                let hoursContent = "Pas d'horaires définis";
                let locationContent = "Pas d'adresse définie";
                let infoSuppContent = "Pas d'informations supplémentaires";
                
                if(element['horaires_ouverture_lieux'] !== ""){
                    hoursContent = `<b><font size="3pt">Horaires :</font></b>
                        <div>${element['horaires_ouverture_lieux']}</div>
                    `;
                }
                if(element['adresse_lieux'] !== "" || element['code_postal_lieux'] !== "" || element['complement_adresse_lieux'] !== "" || element['ville_lieux'] !== ""){
                    locationContent = `<b><font size="3pt">Adresse :</font></b>
                        <div>${element['adresse_lieux']}</div>
                        <div>${element['complement_adresse_lieux']}</div>
                        <div>${element['code_postal_lieux']} ${element['ville_lieux']}</div>
                    `;                        
                }
                if(element['infos_pratiques_lieux'] !== "" ){
                    infoSuppContent = `<b><font size="3pt">Consigne complémentaire :</font></b>
                        <div>${element['infos_pratiques_lieux']}</div>
                    `;                        
                }

                // Modifie le tooltip de btnLocationAvailabilities directement si résultat
                getPremiereDispoParMotifLieu(element['id_lieux']);

                $('#btnLocationAvailabilities').tooltip('option','content',availabilitiesContent);
                $('#btnLocationHours').tooltip('option','content',hoursContent);
                $('#btnLocationAddress').tooltip('option','content',locationContent);
                $('#btnLocationInfoSupp').tooltip('option','content',infoSuppContent);
            }
            {/literal}

            document.addEventListener('DOMContentLoaded', function () {
                const locations = {$locations|@json_encode nofilter};
                {literal}

                $(".onClickTooltip").tooltip({ 
                    position: { my: 'right center', at: 'left-10 center' } ,
                    tooltipClass: "customTooltip",
                    disabled: true,
                    close: function( event, ui ) { 
                        $(this).tooltip('disable'); 
                        /* instead of $(this) you could also use $(event.target) */
                    }
                });

                $('.onClickTooltip').on('mouseover', function () {
                    $(this).tooltip('enable').tooltip('open');
                });  
                
                $('#locationCarousel').on('slide.bs.carousel', function (event) {
                    const locationKey = event.relatedTarget.dataset['locationkey'];

                    if(event.relatedTarget.className.includes('first')){
                        $('#locationCarouselLeft').addClass('disabled');
                        $('#locationCarouselRight').removeClass('disabled');
                    }else if(event.relatedTarget.className.includes('last')){
                        $('#locationCarouselLeft').removeClass('disabled');
                        $('#locationCarouselRight').addClass('disabled');
                    }else{
                        $('#locationCarouselLeft').removeClass('disabled');
                        $('#locationCarouselRight').removeClass('disabled');
                    }
                    showLocationNumber(locations,locationKey);
                });
                showLocationNumber(locations,0);
            })
        </script>
        {/literal}
    </div>
    {literal}
        <script type="text/javascript">
            
            $("#id_autocomplete_recherche_patient_fast").autocomplete({
                source: 'ajax/recherche_fiche_patient_auto_complete_identifiant.php',
                focus: function(event, ui) {
                    event.preventDefault();
                },
                select: function(event, ui) {
                    event.preventDefault();

                    $('#modalFichePatient').modal('show');
                    getInfoPatient(ui.item.value, ui.item.term);

            },
            response: function(event, ui) {
                $("#ui-id-1").scrollTop(0);
            }
            });
            $("#id_autocomplete_recherche_patient_fast").on('keydown', function(e) {
                if (e.key === 'Enter' || e.keyCode === 13) {
                    if ($("#id_autocomplete_recherche_patient_fast").val().length != 0) {
                        $('#modalFichePatient').modal('show');
                        getInfoPatient(0, $("#id_autocomplete_recherche_patient_fast").val());
                        $(this).val("");
                    }
                    e.preventDefault();
                    return false;
                }
            });
        </script>
    {/literal}
</div>