<div class="modal fade in" id="modalInstruction" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="modalInstructionTitle"></h4>
            </div>
            <div class="modal-body" >
                <p id="modalInstructionText"></p>
                
                <div style="text-align: center;">
                    <button type="button" class="btn vd_bg-blue vd_white" data-dismiss="modal" ><b>Valider</b></button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showInstructionModal(title,message){
            $("#modalInstructionTitle").text(title);
            $("#modalInstructionText").html(message);
            $("#modalInstruction").modal('show');
        }

        function hideInstructionModal(){
            $("#modalInstruction").modal('hide');
        }
    </script>
</div>