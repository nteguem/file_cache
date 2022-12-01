<link rel="stylesheet" type="text/css" href="css/jquery.contextmenu.{$xtIframe}.css">

<iframe src="{$urlframe}" style="display:block; width:100%; height:185vh;" frameborder="no"></iframe>

<br/><br/><br/>

{literal}
  
    <script type="text/javascript" src="js/jquery.contextmenu.{$jQuerryContextMenu}.js"></script>
    <script type="text/javascript">

        function launch_getSalleAttente(){
            setInterval(function(){
                getSalleAttente();
            }, 60000);
        }

        function fiche_rdv(idrdv){
            get_fiche_rendez_vous(idrdv);
            $('#modalFicheRendezVous').modal('show');
            $('#info_rdv_modal_link').click();
        }

        function getSalleAttente() {
            var tabid = "{/literal}{$idp}{literal}";


            $.ajax({
                url: 'ajax/get_salle_attente.php',
                data: 'idp='+tabid+'&tri='+$('#trie_salle_attente').val(),
                dataType: 'json',
                async: true,
                cache: false,
                success: function(json) {
                    $.each(json, function(index, value) {
                        var text = "";
                        var picto = "";

                        if(value.nb_salle_attente != 0) {
                            $('#nb_salle_attente').html(value.nb_salle_attente);
                        }else{
                            $('#nb_salle_attente').html("");
                        }

                        //liste En cours
                        if(value.tab3.length!=0){
                            text +="<li class='group-heading vd_bg-black-20'>En cours d'examen</li>";
                        }

                        for (i = 0; i < value.tab3.length; i++) {
                            var sstyle = "";
                            if(value.tab3.length >1){
                                sstyle = "style='border-bottom: 1px solid #fff;'";
                            }

                            picto = "";
                            if(value.tab3[i]['ouverture_telconsullt_prise_rendez_vous'] == 'Y'){
                                picto = '<span title="Téléconsultation" style="font-size: small;"><i style="padding:2px;color:#DDDDDD;display: inline-block;text-align: center;" class="fa fa-video-camera"></i></span>&nbsp;';
                            }

                            text +="<li "+sstyle+" id='item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab3[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: #DDDDDD;'>"+picto+value.tab3[i]['civilite']+" "+value.tab3[i]['nom']+" "+value.tab3[i]['prenom']+" ( "+value.tab3[i]['temps_en_cours']+" )";
                            text +="<div class='menu-info'><span class='menu-date'>En cours depuis "+value.tab3[i]['heure_en_cours']+" </span> | <span class='menu-date'>Prévu à "+value.tab3[i]['heure_prevu']+" </span></div>";
                            text +="</div></a></li>";
                            text +="<script type='text/javascript'>";
                            text +="var menu_salle_attente_en_cours_"+value.tab3[i]['id_prise_rendez_vous']+" = ["+
                                "{'Patient traité': {"+
                                "onclick:function(menuItem,menu) {"+
                                "document.getElementById('myModalLabelinfordv').innerHTML='Paiement du patient : "+value.tab3[i]['civilite']+" "+value.tab3[i]['nom']+" "+value.tab3[i]['prenom']+"';"+
                                "document.getElementById('iframerdv').src='modal_patient_traite.php?idrdv="+value.tab3[i]['id_prise_rendez_vous']+"&random=" + (new Date()).getTime() + Math.floor(Math.random() * 1000000)+"';"+
                                "$('#myModalinfordv').modal('show');"+
                                "},"+
                                "icon:'css/patient_traite_icon.png',"+
                                "title:'Patient traité'"+
                                "}"+
                                "},"+
                                "{'Rendez-vous planifié': {"+
                                "onclick:function(menuItem,menu) {"+
                                "changement_status_rdv("+value.tab3[i]['id_prise_rendez_vous']+", 'rdvplanifie'); "+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "},"+
                                "title:'Rendez-vous planifié' "+
                                "}"+
                                "},"+
                                "{\"Patient en salle d\'attente\": {"+
                                "onclick:function(menuItem,menu) { "+
                                "changement_status_rdv("+value.tab3[i]['id_prise_rendez_vous']+", 'patientensalle'); "+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "}, "+
                                "title:\"Patient en salle d\'attente\" "+
                                "}"+
                                "}"+
                                "];";
                            //text +="$('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_en_cours,{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});";


                            text +="$('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').bind('mousedown', function (e) { if (e.which == 3) { $(\".menu_custom_alaxione\").hide(); $('#item_sa_"+value.tab3[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_en_cours_"+value.tab3[i]['id_prise_rendez_vous']+",{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});} });";


                            text +="<\/script>";
                        }


                        //liste salle d'attente
                        if(value.tab.length!=0){
                            text +="<li class='group-heading vd_bg-black-20'>En salle d'attente</li>";
                        }

                        for (i = 0; i < value.tab.length; i++) {
                            var sstyle1 = "";

                            if(value.tab.length >1){
                                sstyle1 = "style='border-bottom: 1px solid #fff;'";
                            }

                            picto = "";

                            if(value.tab[i]['ouverture_telconsullt_prise_rendez_vous'] == 'Y'){
                                picto = '<span title="Téléconsultation" style="font-size: small;"><i style="padding:2px;color:#27A1C2;display: inline-block;text-align: center;" class="fa fa-video-camera"></i></span>&nbsp;';
                            }

                            text +="<li "+sstyle1+" id='item_sa_"+value.tab[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: #27A1C2;'>"+picto+value.tab[i]['civilite']+" "+value.tab[i]['nom']+" "+value.tab[i]['prenom']+" ( "+value.tab[i]['temps_attente']+" )";
                            text +="<div class='menu-info'><span class='menu-date'>Arrivé à "+value.tab[i]['heure_arrive']+" </span> | <span class='menu-date'>Prévu à "+value.tab[i]['heure_prevu']+" </span></div>";
                            text +="</div></a></li>";
                            text +="<script type='text/javascript'>";
                            text +="var menu_salle_attente_"+value.tab[i]['id_prise_rendez_vous']+" = ["+
                                "{'Rendez-vous planifié': {"+
                                "onclick:function(menuItem,menu) {"+
                                "changement_status_rdv("+value.tab[i]['id_prise_rendez_vous']+", 'rdvplanifie'); "+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "},"+
                                "title:'Rendez-vous planifié' "+
                                "}"+
                                "},"+
                                "{\"Patient en cours d\'examen\": {"+
                                "onclick:function(menuItem,menu) { "+
                                "changement_status_rdv("+value.tab[i]['id_prise_rendez_vous']+", 'patientencours'); "+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "}, "+
                                "title:\"Patient en cours d\'examen\" "+
                                "}"+
                                "}";

                            //if(typeof(value.tab[i]['linkteleconsultation']) != 'undefined'){

                            if(value.tab[i]['linkteleconsultation'] === null || value.tab[i]['linkteleconsultation'] == ""){
                            //rien
                            }else{
                                text += ",{\"Lancer la téléconsultation\": {"+
                                    "onclick:function(menuItem,menu) { "+
                                    "changement_status_rdv("+value.tab[i]['id_prise_rendez_vous']+", 'patientencours');"+
                                    "openInNewTab('"+value.tab[i]['linkteleconsultation']+"'); "+
                                    "$(\".menu_custom_alaxione\").hide();" +
                                    "return true;"+
                                    "}, "+
                                    "title:\"Lancer la téléconsultation\" "+
                                    "}"+
                                    "}";
                            }
                            text +="];";
                            //text +="$('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente,{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});";

                            text +="$('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').bind('mousedown', function (e) { if (e.which == 3) { $(\".menu_custom_alaxione\").hide(); $('#item_sa_"+value.tab[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_"+value.tab[i]['id_prise_rendez_vous']+",{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false}); } });";

                            text +="<\/script>";
                        }

                        //liste en retard
                        if(value.tab2.length!=0){
                            text +="<li class='group-heading vd_bg-black-20'>En retard</li>";
                        }

                        for (i = 0; i < value.tab2.length; i++) {
                            var sstyle2 = "";
                            if(value.tab2.length >1){
                                sstyle2 = "style='border-bottom: 1px solid #fff;'";
                            }

                            picto = "";
                            if(value.tab2[i]['ouverture_telconsullt_prise_rendez_vous'] == 'Y'){
                                picto = '<span title="Téléconsultation" style="font-size: small;"><i style="padding:2px;color:#red;display: inline-block;text-align: center;" class="fa fa-video-camera"></i></span>&nbsp;';
                            }

                            text +="<li "+sstyle2+" id='item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"'><a href='#' onclick='fiche_rdv("+value.tab2[i]['id_prise_rendez_vous']+");'><div class='menu-text' style='margin-left: 0px; color: red;'>"+picto+value.tab2[i]['civilite']+" "+value.tab2[i]['nom']+" "+value.tab2[i]['prenom'];
                            text +="<div class='menu-info'><span class='menu-date'>Prévu à "+value.tab2[i]['heure_prevu']+" ( <span class='menu-date' style='color:red;''>"+value.tab2[i]['temps_retard']+"</span> de retard )</span></div>";
                            text +="</div></a></li>";
                            text +="<script type='text/javascript'>";
                            text +="var menu_salle_attente_retard_"+value.tab2[i]['id_prise_rendez_vous']+" = ["+
                                "{\"Patient en salle d\'attente\": {"+
                                "onclick:function(menuItem,menu) {"+
                                "changement_status_rdv("+value.tab2[i]['id_prise_rendez_vous']+", 'patientensalle'); "+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "},"+
                                "title:\"Patient en salle d\'attente\" "+
                                "}"+
                                "},"+
                                "$.contextMenu.separator,"+
                                "{\"Absence excusée\": {"+
                                "onclick:function(menuItem,menu) {"+
                                "bconfirm=confirm(\"En changeant le statut du rendez vous en \'Absence excusée\', l\'emplacement sera à nouveau disponible, confirmez-vous le changement ?\");"+
                                "if(bconfirm){"+
                                "del_rendez_vous_absence_excusee("+value.tab2[i]['id_prise_rendez_vous']+");"+
                                "}"+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "},"+
                                "title:\"Absence excusée\" "+
                                "}"+
                                "},"+
                                "{\"Absence NON excusée\": {"+
                                "onclick:function(menuItem,menu) {"+
                                "changement_status_rdv("+value.tab2[i]['id_prise_rendez_vous']+", 'absencenonexcusee'); "+
                                "$(\".menu_custom_alaxione\").hide();" +
                                "return true;"+
                                "},"+
                                "title:\"Absence NON excusée\" "+
                                "}"+
                                "}"+
                                "];";
                            //text +="$('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_retard,{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});";

                            text +="$('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').bind('mousedown', function (e) { if (e.which == 3) { $(\".menu_custom_alaxione\").hide(); $('#item_sa_"+value.tab2[i]['id_prise_rendez_vous']+"').contextMenu(menu_salle_attente_retard_"+value.tab2[i]['id_prise_rendez_vous']+",{className:'menu_custom_alaxione',theme:'gloss',showSpeed:200,hideSpeed:200,showTransition:'fadeIn',hideTransition:'fadeOut',shadow:false,useIframe:false});} });";


                            text +="<\/script>";
                        }

                        $('#tab_salle_attente').html(text);

                    });
                }
            });

        }

        $(document).ready(function() {
            document.getElementById("top-menu-salle-attente").style.display = "block";
            getSalleAttente();
            launch_getSalleAttente();
        });


    </script>

{/literal}