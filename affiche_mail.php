<?php
ini_set("display_errors", "ON");
require 'class/class_alaxione.php';
$objClassGenerique = new class_alaxione('', '', '');

$bDroit = $objClassGenerique->verificationConnexion(0, '');

$aVariable = array("identifiant_entite","password_user","action","validation","id_champ_vrac","comment","id_historique","quantitealerte",);

for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}


$sRequete=" Select contenu_historique_envoi_emailing FROM historique_envoi_emailing where idhistorique_envoi_emailing='".$id_historique."'";

$aTableauInfoMail = $objClassGenerique->renvoi_info_requete($sRequete);

if (!empty($aTableauInfoMail)) {
    echo $aTableauInfoMail[0]['contenu_historique_envoi_emailing'];
}
