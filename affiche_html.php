<?php
    ini_set("display_errors", "ON");
    require 'class/class_alaxione.php';
    $objClassGenerique = new class_alaxione('', '', '');

    $bDroit = $objClassGenerique->verificationConnexion(0, '');

    $aVariable = array("identifiant_entite","password_user","action","validation","id_champ_vrac","comment","datesaisie","quantitealerte","email");

for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$aTableauResult=array();

$aTableauResult[0]['photo'] ="<img src='http://preprod.alaxione.fr/uploads/user.png' width='200px' border='0' />";
$aTableauResult[0]['mailcentre'] = "coordination@visis.fr";
$aTableauResult[0]['numerocentre'] = "04 68 35 92 70";
$aTableauResult[0]['link'] = "http://www.visis.fr/prendre-rendez-vous/";
$aTableauResult[0]['recap_info'] = "<b> M. VOTRE (Docteur)</b> vous confirme votre rendez-vous <br/><b> Jeudi 14 Janvier 2016 à 08:00</b><br/><br/>
                    Motif : <b>Consultation</b><br/><br/>
                    Participant :
                    <br/><b>Mme Fiston GNAKOURI</b><br><br/>
                    Lieu : 
                    <b><br>Centre d'Ophtalmologie VISIS - Perpignan<br/>
                    8, espace Méditerranée<br/>
                    66000 Perpignan<br/>
                    Tél. 04 68 35 92 70<b>";
$aTableauResult[0]['Infodocteur'] =" M. VOTRE (Docteur)";
$aTableauResult[0]['daterdv'] = "Jeudi 14 Janvier 2016";
$aTableauResult[0]['heurerdv'] = "08:00";
$aTableauResult[0]['rdvseul'] = "<b>Jeudi 14 Janvier 2016 à 08:00</b>";
$aTableauResult[0]['rdvseullite'] = "Jeudi 14 Janvier 2016 à 08:00";
$aTableauResult[0]['recap_compl'] = "<br/><br/>Nous sommes équipé pour accepter la Carte Vitale <img src='http://preprod.alaxione.fr/img/carte_vitale.jpg' width='50px' border='0' />";
$aTableauResult[0]['info_importante'] = "<p>Le centre vous accueille du lundi au vendredi de&nbsp;09h00 - 12h00 et de&nbsp;14h00 - 18h00.</p>
<br/><p><strong>N&#39;oubliez pas de vous munir de votre carte vitale.</strong></p>
<p><strong>Pour les titulaires de la CMU et de l&#39;ACS</strong><strong>, l&#39;attestation papier est obligatoire.</strong></p>
                          <br/><br/>
<img src='http://preprod.alaxione.fr/img/logo-handicape.jpg' width='25px' border='0' />&nbsp;&nbsp;Accessiblité handicapé: <b><i>OUI</i></b><br/><img src='http://preprod.alaxione.fr/img/ascenseur.jpg' width='25px' border='0' />&nbsp;&nbsp;Accessiblité ascenseur: <b><i>NON</i></b><br/><img src='http://preprod.alaxione.fr/img/carte_vitale.jpg' width='25px' border='0' />&nbsp;&nbsp;La carte Vitale est acceptée<br/>";
 $aTableauResult[0]['recap_map'] = "<img src='http://preprod.alaxione.fr/uploads/16062015110623_alaxione_lieux85.jpeg' width='100%' border='0' /><br/>";
 $aTableauResult[0]['recap_mdr'] = "<img src='http://preprod.alaxione.fr/img/logo_euro.jpg' width='25px' border='0' />&nbsp;&nbsp;Modes de règlement acceptés :<br/><img src='http://preprod.alaxione.fr/img/cheque2.jpg' width='100px' border='0' />&nbsp;&nbsp;<img src='http://preprod.alaxione.fr/img/especes.jpg' width='100px' border='0' />&nbsp;&nbsp;<img src='http://preprod.alaxione.fr/img/cb.jpg' width='100px' border='0' />&nbsp;&nbsp;";
 $aTableauResult[0]['fils']=array();


 $sRequete=" Select id_prise_rendez_vous FROM alaxione_prise_rendez_vous where etat_prise_rendez_vous='valide'
  and supplogique_prise_rendez_vous='N' ORDER BY RAND() limit 0,1";

 $aTableauInfoDV = $objClassGenerique->renvoi_info_requete($sRequete);

$aTableauResult = $objClassGenerique->renvoi_htm_info_recap($aTableauInfoDV[0]['id_prise_rendez_vous'], "", "", "", "ajax2");


$sRequete_info_vrac="select contenu_vrac from outil_champ_vrac where id_champ_vrac='".$id_champ_vrac."'";
$aTableauInfo = $objClassGenerique->renvoi_info_requete($sRequete_info_vrac);

$stringmail = $aTableauInfo[0]['contenu_vrac'];





$stringmail=str_replace("<rdvseul>", $aTableauResult[0]['rdvseul'], $stringmail);
$stringmail=str_replace("<photo>", $aTableauResult[0]['photo'], $stringmail);
$stringmail=str_replace("<recap_info>", $aTableauResult[0]['recap_info'], $stringmail);
$stringmail = str_replace("<docteur>", $aTableauResult[0]['Infodocteur'], $stringmail);
$stringmail = str_replace("<nomdocteur>", $aTableauResult[0]['link'], $stringmail);
$stringmail = str_replace("<link>", $aTableauResult[0]['link'], $stringmail);
$stringmail = str_replace("<linksup>", $aTableauResult[0]['link'], $stringmail);
$stringmail = str_replace("<numerocentre>", "Tel lieux", $stringmail);
$stringmail = str_replace("<mailcentre>", "mail centre", $stringmail);
$stringmail = str_replace("<info_importante>", $aTableauResult[0]['info_importante'], $stringmail);
$stringmail = str_replace("<recap_mdr>", $aTableauResult[0]['link'], $stringmail);
$stringmail = str_replace("<rdseulnew>", $aTableauResult[0]['rdvseul'], $stringmail);
$stringmail = str_replace("<link>", $aTableauResult[0]['link'], $stringmail);
$stringmail = str_replace("<link>", $aTableauResult[0]['link'], $stringmail);
$stringmail = str_replace("<tarif_consultation>", $aTableauResult[0]['tarif_consultation'], $stringmail);
$stringmail = str_replace("<infolegale_lieux>", $aTableauResult[0]['infolegale_lieux'], $stringmail);
$stringmail = str_replace("<photo_praticien>", $aTableauResult[0]['photo_praticien'], $stringmail);
$stringmail = str_replace("<motif>", $aTableauResult[0]['motif'], $stringmail);
$stringmail = str_replace("<abr_proffession>", $aTableauResult[0]['abr_proffession'], $stringmail);
$stringmail = str_replace("<nom_profession>", $aTableauResult[0]['nom_profession'], $stringmail);
$stringmail = str_replace("<nom_praticien>", $aTableauResult[0]['nom_praticien'], $stringmail);
$stringmail = str_replace("<preconisation_type_rdv>", $aTableauResult[0]['preconisation_type_rdv'], $stringmail);
$stringmail = str_replace("<sChaineTypepaiementV2>", $aTableauResult[0]['sChaineTypepaiementV2'], $stringmail);
$stringmail = str_replace("<adresse_lieux>", $aTableauResult[0]['adresse_lieux'], $stringmail);
$stringmail = str_replace("<code_postal_lieux>", $aTableauResult[0]['code_postal_lieux'], $stringmail);
$stringmail = str_replace("<ville_lieux>", $aTableauResult[0]['ville_lieux'], $stringmail);
$stringmail = str_replace("<tel_lieux>", $aTableauResult[0]['tel_lieux'], $stringmail);
$stringmail = str_replace("<infos_pratiques_lieux>", $aTableauResult[0]['infos_pratiques_lieux'], $stringmail);
$stringmail = str_replace("<tarif_remboursement>", $aTableauResult[0]['tarif_remboursement'], $stringmail);
$stringmail = str_replace("<linknomcompte>", $aTableauResult[0]['linknomcompte'], $stringmail);
$stringmail = str_replace("<listestringli>", $aTableauResult[0]['listestringli'], $stringmail);
$stringmail = str_replace("<nom_patient>", $aTableauResult[0]['nom_patient'], $stringmail);
$stringmail = str_replace("<linkapp>", $objClassGenerique->linkapp, $stringmail);
$stringmail = str_replace("<linkdeplacerrdv>", $aTableauResult[0]['linkdeplacersite'], $stringmail);
$stringmail = str_replace("<nompatient>", $aTableauResult[0]['fils'][0]['nom'], $stringmail);
$stringmail = str_replace("<nom_lieux>", $aTableauResult[0]['nom_lieux'], $stringmail);
$stringmail = str_replace("<linksuprdv>", $aTableauResult[0]['linksupprdv'], $stringmail);
$stringmail = str_replace("<linksite>", $aTableauResult[0]['url_centre_widget_entite'], $stringmail);
$stringmail = str_replace("<link_visible_site>", $aTableauResult[0]['link_visible_site'], $stringmail);

echo $stringmail;

if (isset($_GET['mail'])) {
    $smail = $_GET['mail'];
    if ($smail!="") {
        echo "Envoi mail a ".$smail."<br>",
        $sujet=" test envoi mail";
        $from="info@alaxione.fr";
        $aTableauretour=$objClassGenerique->envoi_mail_html_alaxione($smail, $stringmail, $sujet, $from);
        
    }
}
