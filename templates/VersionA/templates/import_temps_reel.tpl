
{literal}

    <script type="text/javascript">

        function getDateTime() {
            var now     = new Date(); 
            var year    = now.getFullYear();
            var month   = now.getMonth()+1; 
            var day     = now.getDate();
            var hour    = now.getHours();
            var minute  = now.getMinutes();
            var second  = now.getSeconds(); 
            if(month.toString().length == 1) {
                var month = '0'+month;
            }
            if(day.toString().length == 1) {
                var day = '0'+day;
            }   
            if(hour.toString().length == 1) {
                var hour = '0'+hour;
            }
            if(minute.toString().length == 1) {
                var minute = '0'+minute;
            }
            if(second.toString().length == 1) {
                var second = '0'+second;
            }   
            var dateTime = day+'/'+month+'/'+year+' '+hour+':'+minute+':'+second;   
             return dateTime;
        }

        $(document).ready(function() {
            {/literal}{foreach from=$urloplus item=urlop1}{literal}
                $('#txtinfo').append("url :{/literal}{$urlop1.url}{literal}\n");
            {/literal}{/foreach}{literal}

        });

        if (!!window.EventSource) {

            {/literal}{foreach from=$urloplus item=urlop}{literal}

            
            var source = new EventSource('{/literal}{$urlop.url}{literal}');

            source.addEventListener("open", function(e) {
                $('#txtinfo').append("Connexion OK avec {/literal}{$urlop.url}{literal}\n");
            }, false);

            source.onerror = function(event){
                //$('#txtinfo').append(source.readystate+"\n");
                $('#txtinfo').append("Erreur - Connexion échoué avec {/literal}{$urlop.url}{literal}\n");
            }

            source.addEventListener("error", function(e) {
                //console.log("Erreur - Connexion perdu.");
                $('#txtinfo').append("Erreur - Connexion échoué avec {/literal}{$urlop.url}{literal}\n");

                /*var stype = "Alerte";
                var ssujet = "[ITR ALAXIONE] - Erreur - Connexion échoué";
                var smessage = "Connexion échoué avec {/literal}{$urlop.url}{literal}<br/>ID Structure :{/literal}{$urlop.id_entite}{literal}";
                $.ajax({
                    cache: false,
                    url: 'ajax/envoi_mail.php',
                    data: 'stype='+encodeURIComponent(stype)+'&ssujet='+encodeURIComponent(ssujet)+'&smessage='+encodeURIComponent(smessage),
                    dataType: 'json',
                    success: function(json) {}
                });*/

            }, false);

            source.addEventListener("message", function(e) {
                
                var id_entite = '{/literal}{$urlop.id_entite}{literal}';


                var xmlDoc = $.parseXML( e.data );
                var $xml = $( xmlDoc );

                var $Action = $xml.find( "Action" );
                var $IdRdv = $xml.find( "IdRdv" );
                var $IdRdvOplus = $xml.find( "IdRdvOplus" );
                var $IdAgenda = $xml.find( "IdAgenda" );
                var $Agenda = $xml.find( "Agenda" );
                var $sDate = $xml.find( "Date" );
                var $Heure = $xml.find( "Heure" );
                var $Duree = $xml.find( "Duree" );
                var $IdType = $xml.find( "IdType" );
                var $Type = $xml.find( "Type" );
                var $Note = $xml.find( "Note" );
                var $Numero = $xml.find( "Numero" );
                var $Nom = $xml.find( "Nom" );
                var $Prenom = $xml.find( "Prenom" );
                var $DateNaissance = $xml.find( "DateNaissance" );
                var $Sexe = $xml.find( "Sexe" );
                var $Telephone = $xml.find( "Telephone" );
                var $Email = $xml.find( "Email" );

                $('#txtinfo').append("lastEventId : "+e.lastEventId+"\n");

                oAction = $Action.text();
                oIdRdv = $IdRdv.text();
                oIdRdvOplus = $IdRdvOplus.text();
                oIdAgenda = $IdAgenda.text();
                oAgenda = $Agenda.text();
                osDate = $sDate.text();
                oHeure = $Heure.text();
                oDuree = $Duree.text();
                oIdType = $IdType.text();
                oType = $Type.text();
                oNote = $Note.text();
                oNumero = $Numero.text();
                oNom = $Nom.text();
                oPrenom = $Prenom.text();
                oDateNaissance = $DateNaissance.text();
                oSexe = $Sexe.text();
                oTelephone = $Telephone.text();
                oEmail = $Email.text();               

                var datetime = getDateTime();
                $('#txtinfo').append(datetime+' - ajax/import_oplus.php?identite='+id_entite+'&Action='+oAction+'&IdRdv='+oIdRdv+'&IdRdvOplus='+oIdRdvOplus+'&IdAgenda='+oIdAgenda+'&Agenda='+oAgenda+'&Date='+osDate+'&Heure='+oHeure+'&Duree='+oDuree+'&IdType='+oIdType+'&Type='+oType+'&Note='+oNote+'&Numero='+oNumero+'&Nom='+oNom+'&Prenom='+oPrenom+'&DateNaissance='+oDateNaissance+'&Sexe='+oSexe+'&Telephone='+oTelephone+'&Email='+oEmail+"\n");
                 
                $.ajax({
                    url: 'ajax/import_oplus.php',
                    method: 'POST',
                    data: 'identite='+id_entite+'&Action='+oAction+'&IdRdv='+oIdRdv+'&IdRdvOplus='+oIdRdvOplus+'&IdAgenda='+oIdAgenda+'&Agenda='+oAgenda+'&Date='+osDate+'&Heure='+oHeure+'&Duree='+oDuree+'&IdType='+oIdType+'&Type='+oType+'&Note='+oNote+'&Numero='+oNumero+'&Nom='+oNom+'&Prenom='+oPrenom+'&DateNaissance='+oDateNaissance+'&Sexe='+oSexe+'&Telephone='+oTelephone+'&Email='+oEmail,
                    dataType: 'json',
                    success: function(json) {}
                });

            }, false);

            {/literal}{/foreach}{literal}


        } else {
            alert("Votre navigateur ne supporte pas Server-sent events, veuillez utilise le navigateur Google Chrome.");
        }


    </script>
{/literal}

<div><h3>Import temps réel</h3></div>
<div><textarea name="txtinfo" id="txtinfo" readonly rows="20"></textarea></div>
<div name="txtinfo2" id="txtinfo2" ></div>