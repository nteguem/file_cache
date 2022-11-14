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

echo "<center><h3 algin='center'>QRCODE du Centre ".$aTableauInfoStructure[0]['nom_entite']." </h3><br><br></center>";


echo"<center><img src='img_widget/qrcode_".$aTableauInfoStructure[0]['identifiant_entite'].".png' width='200px'> </center>";
