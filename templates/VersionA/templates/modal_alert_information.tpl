<link rel="stylesheet" href="css/modal_alert_information.css">

<div class="modal fade in modalInformation" id="modalInformation" aria-hidden="true">
    <div class="modal-dialog modalInformationDialog" >
        <div class="modal-content informationModal">
            <div class="modalInformationHeader">
                <i class="fa fa-exclamation-circle fa-5x modalHeaderLogo" aria-hidden="true"></i>
            </div>
            <div class="modal-body modalInformationBody" style="background: none;">
                <p class="modalInformationText" id="modalInformationText"></p>
                
                <div class="modalInformationButtons">
                    <button type="button" class="btn vd_white modalInformationButton" data-dismiss="modal" ><b>Valider</b></button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showInformationMessage(message){
            $("#modalInformationText").text(message);
            $("#modalInformation").modal('show');
        }

        function hideInformationMessage(){
            $("#modalInformation").modal('hide');
        }
    </script>
</div>