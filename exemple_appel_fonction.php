peux<?php
ini_set("display_errors", "ON");
require '/var/www/alaxione/alaxionedev/class/class_widget.php';

echo "debut affichage<br>";

$objWidget = new class_widget();

$idc="5ldjuyeefwfthubd";   //code du centre
$idtyperdv=476;//id du rdv
$bvisible=2;//type de visibilité si 0 tous les rdc si 1 ouvert au web 2 ouvert au télélphone
$iduser="";// identifiant du docteur
$bdebug=false;//si tru affiche ou pas les requetes de debug
$prov="web";//permet de choisir le type de order  si web order by type libelle web sinon type normal
$idp="";//
$idlieu=8;//identifiant du lieux
$idinterpro="";//filtre sur le type du medecin par exemple si on veut que les medecin qui ont obligatoire la fonction ortho;
$ijour="";//filtre sur le jour de la semaine lundi = 1, mardi 2 etc
$creneauhoraire="";//intervalle du temps sur lequelle on fait la recherche par exemple entre 10 et 12 on mettra 10/12
$nb_personne = 1;// nombre de personne dans la demande
$positionpage =1; //position de la page 1 premiere page 2 deuxieme page
$quand =0;//nous dis quelle type de filtre prendre si 1 un filtre avec le nombre de semaine si 2 filtre avec le mois
$nb_semaine=""; //Nombre de semaime a partie de la quelle on commencera le rechercher des disponibilité
$num_mois= "";//mois a partie du quelle on commence la recherche 1 pour janvier 2 fevrier etc
$type=""; //
$ball=false; //pour ouvrir l'application des filtres des focntion des medecin
$bpasdecalge=false;//si le docteur à programmer un degalage dans  dans le calcul de ses RDV

echo "Resultat pour la liste des RDV<br> ";

//liste des ùotifs de RDV
$aTableauListeTypeRDV = $objWidget->renvoi_liste_type_rdv($idc, $bvisible, $prov, false, $idinterpro, $iduser, $idp);
echo"<pre>";print_r($aTableauListeTypeRDV);echo"</pre>";
echo "Resultat pour la liste des Lieu<br> ";
//comment recupere la liste des lieus du RDV
$aTableauListeLieu = $objWidget->renvoi_liste_lieux($idtyperdv, "", $iduser, false, $idp);
echo"<pre>";print_r($aTableauListeLieu);echo"</pre>";
echo "Resultat pour la liste des praticiens<br> ";
//comment recupere la liste des praticiens
$bvisible=3;//cas ce cas la visibilité pour le téléphone est a 3
$aTableauPraticien = $objWidget->renvoi_liste_praticien($idlieu, $idtyperdv, $bvisible, false, "", $idinterpro, false, false);
echo"<pre>";print_r($aTableauPraticien);echo"</pre>";

echo "Resultat pour la liste des rdv dispo<br> ";
//comment recipérer la liste des RDV proposé

$bvisible=3;//cas ce cas la visibilité pour le téléphone est a 3
$aTableauListeRDV = $objWidget->renvoi_dispo(
    $iduser,
    $idlieu,
    $idtyperdv,
    $ijour,
    $creneauhoraire,
    $nb_personne,
    $positionpage,
    $nb_semaine,
    $quand,
    $num_mois,
    $type,
    false,
    $idinterpro="",
    $bvisible,
    $ball,
    $bpasdecalge
);
echo"<pre>";print_r($aTableauListeRDV);echo"</pre>";
/**/
?>