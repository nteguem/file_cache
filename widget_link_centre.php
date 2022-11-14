<?php
ini_set("display_errors", "ON");
require 'class/class_alaxione.php';
$objClassGenerique = new class_alaxione('', '', '');

$bDroit = $objClassGenerique->verificationConnexion(0, '');

$aVariable = array("identifiant_entite","password_user","action","validation","id_champ_vrac","comment","datesaisie","quantitealerte",);

for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

//************récupération  des inforamtions sur la structure************************
$sRequete_info_structure="select nom_entite,id_entite,identifiant_entite from alaxione_entite where identifiant_entite='$identifiant_entite'";
$aTableauInfoStructure = $objClassGenerique->renvoi_info_requete($sRequete_info_structure);

/*
<script type="text/javascript" src="https://prod4.alaxione.fr/js/client_alx.js"></script>
<script type="text/javascript">
var idc = "84mfxuafyusuxjxby";
var v = "2";
var orientation="h";
var alx_widget_rdv = "rdv";
</script>
<script type="text/javascript" src="https://prod4.alaxione.fr/js/client.js"></script>
*/


echo "Structure ".$aTableauInfoStructure[0]['nom_entite']."<br>";
echo "<a href='".$objClassGenerique->linkapp."ReactRDV/?idc=".$identifiant_entite."&typewidget=normal' target='_blank'>".$objClassGenerique->linkapp."ReactRDV/?idc=".$identifiant_entite."&typewidget=normal</a><br>";
echo"<br>";

//****************************  recupération des praticiens du centre ******************
$aTableauSelectListePraticien=array();
$aTableauSelectListePraticien['identifiant_entite']=$identifiant_entite;
$sRequeteSelectListePraticien = "SELECT id_user, nom_user,prenom_user,identifiant_user FROM  alaxione_user 
WHERE identifiant_entite=:identifiant_entite 
AND actifcalendar_user='Y'";

$aTableauListeuser = $objClassGenerique->renvoi_info_requete_new($sRequeteSelectListePraticien,$aTableauSelectListePraticien);



if(!empty($aTableauListeuser)){

    foreach($aTableauListeuser as $valeurliste){

        echo "Agenda ".$valeurliste['nom_user']." ".$valeurliste['prenom_user']." <br>";
        echo "Proposition liste<br>";
        echo "<a href='".$objClassGenerique->linkapp."ReactRDV/?idc=".$identifiant_entite."&typewidget=normal&idp=".$valeurliste['identifiant_user']."' target='_blank'>".$objClassGenerique->linkapp."ReactRDV/?idc=".$identifiant_entite."&typewidget=normal&idp=".$valeurliste['identifiant_user']."</a><br>";
        echo"<br>";

        echo "Proposition calendar <br>";
        echo "<a href='".$objClassGenerique->linkapp."ReactRDV/?idc=".$identifiant_entite."&typewidget=normal&appointment=calendar&idp=".$valeurliste['identifiant_user']."' target='_blank'>".$objClassGenerique->linkapp."ReactRDV/?idc=".$identifiant_entite."&typewidget=normal&appointment=calendar&idp=".$valeurliste['identifiant_user']."</a><br>";
        echo"<br>";
    }

}
