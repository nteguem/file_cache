<link rel="stylesheet" href="../../../css/liste_consignes.{$cssListeConsignes}.css">
<div class="modal fade modalConsign" style="top:25%;z-index:2500;" data-backdrop='false' id="modalAlertConsigns" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div id='fadeAlertConsign' class="fadeAlertConsign">
    </div>
    <div class="modal-dialog" role="document" style="width: 35vw;">
        <div class="modal-content" style='display:flex;'>
            <div class="modalBorderStatus warningColor-bg" style='border-radius: 4px 0 0px 4px;'>
                <div class="modalCornerIcon">
                    <i class="fa fa-exclamation-triangle warningColor" aria-hidden="true" style='font-size: 1.2vw;'></i>
                </div>
            </div>
            <div style='width: 100%;'>
                <div style="padding: 15px 30px;" class="modal-body">
                    <h4 style='font-weight:bold' id="alertConsignsTitle" class="modal-title"></h4>
                    <div id='alertConsignsBody'></div>
                </div>
                <div class="modal-footer vd_bg-white" style='display:flex; align-items: center; border-radius: 0 0 4px 0;'>
                    <div></div>
                    <nav id="alertConsignsNav" style='margin-left: auto;'>
                        <ul id="alertConsignsNavList" class="pagination paginationCustom warningColor" style='display:block; margin: 0;'>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                        </ul>
                    </nav>
                    <button type="button" class="btn warningColor-bg vd_white roundButton largeTextButton" onclick="handleNextButton()" style='margin-left:auto;'>
                        Suivant
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
{literal}
<script>
    let allConsigns = [];
    let actualConsign = 1;

    /**
     * Show the consign of the given index
     * @param {Array} consigns Array of consigns containing "name" and "contenu" fields objects
     * @param {number} number The index of consign to show
     */
    function showConsignNumber(consigns, number){
        actualConsign = number;
        if(consigns.length > 1){
            $('.page-item').removeClass('active');
            $($('.page-item')[number]).addClass('active');
        }
        setAlertContent(consigns[number].name,consigns[number].contenu);      
    }

    /**
     * Update title and body of the alert consign modal
     * @param {string} title Title of the consign to show
     * @param {string} content Content of the consign to show
     */
    function setAlertContent(title,content){
        $('#alertConsignsTitle').text(title);
        $('#alertConsignsBody').html(content);
    }

    /**
     * Close modal
     */
    function closeAlertConsigns(){
        $('#modalAlertConsigns').modal('hide');
    }

    /**
     * Handle click on next button
     * If last consign is selected, close modal
     * Else show next consign
     */
    function handleNextButton(){
        if(actualConsign < allConsigns.length-1 ){
            showConsignNumber(allConsigns, actualConsign+1);
        }else{
            closeAlertConsigns();
        }
    }

    /**
     * Create navigation list for alert consign modal
     * @param {Array} consigns Array of consigns containing "name" and "contenu" fields objects
     */
    function createNavList(consigns){
        const nbConsigns = consigns.length;
        if(nbConsigns <= 1){
            $('#alertConsignsNav').hide();
            return;
        }
        const navList = $('#alertConsignsNavList');
        $('#alertConsignsNavList').empty();
        for(let x = 0; x < nbConsigns; x++){
            const listElement = document.createElement('li');
            listElement.classList.add('page-item');
            listElement.innerHTML = `<a class='page-link' href='#'>${x+1}</a>`
            listElement.addEventListener('click', () => showConsignNumber(consigns, x))
            navList.append(listElement);
        }
            
        $('#alertConsignsNav').show();
    }

    /**
     * Get the dropdown for the practitioner given (cog shaped button)
     * @param {Array} consigns Array of consigns containing "name" and "contenu" fields objects
     */
    function showAlertConsigns(consigns){
        allConsigns = consigns;
        createNavList(consigns);
        showConsignNumber(consigns, 0);
        $('#modalAlertConsigns').modal({keyboard:false, show:true});
    }
</script>
{/literal}
