<?php
/**
 * Created by PhpStorm.
 * User: Guy
 * Date: 14/02/2016
 * Time: 17:23
 */

include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');
include_once('libs/smartyDM_fleet.php');

$objsmarty = new smartyDM_fleet("templates/VersionA");

$objClassGenerique = new class_alaxione('', '', '');

$bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv);

//récupération des infomations passée en post
$aVariable = array("identifiant_user");
for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

if (!empty($_POST)) {
    for ($i=0;$i<count($aVariable);$i++) {
        if (isset($_POST[$aVariable[$i]])) {
            ${$aVariable[$i]} = $_POST[$aVariable[$i]];
        } else {
            ${$aVariable[$i]} = "";
        }
    }
}

//recupération de la liste de recommandation enregistré par le praticien
$sReuqte_liste_recommandation ="SELECT contenu_recommandation, titre_recommandation FROM alaxione_recommandation
WHERE identifiant_user='$identifiant_user' and supplogique_recommandation='N' and datedebut_recommandation<=now() and (datefin_recommandation='0000-00-00' or datefin_recommandation>=now())";

$aTableauListeRecommandation =$objClassGenerique->renvoi_info_requete($sReuqte_liste_recommandation);

$objsmarty->assign("aTabRecommandation", $aTableauListeRecommandation);
$objsmarty->display("list_recommandation.tpl");
