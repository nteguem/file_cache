<?php

//ini_set("display_errors","On");
include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');

//récupération des infomations passée en post
$aVariable = array("identifiant_entite","id_produit","action","validation","quantiteajour","comment","datesaisie","quantitealerte",
    "date_prise_rendez_vous","iddocteur_user","chfiltreplus","chlieu","chactiv","chspecial","chmotif","chservice","chsalle","heuredebut","heurefin");

//$date_prise_rendez_vous="";
$sRequete_suite="";
$sRequete_fin="";

for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(1, $_COOKIE['cookie_alaxione']);

if ($bDroit){
    $sFiltre="";

    $aVariableRequete = array();
    $aVariableRequete['identifiant_entite'] = $objClassGenerique->identifiant_entite;
    $aVariableRequete['idcreateur_user'] = $objClassGenerique->identifiantuser;

    if(trim($chfiltreplus)!="" and $chfiltreplus=="rdvspatient"){
        $sRequete_suite.=" and principal.idpatient_user='0' ";
    }

    if(trim($chlieu)!="" ){
        $aVariableRequete['id_lieux'] = $chlieu;
        $sRequete_suite.=" and principal.id_lieux =:id_lieux ";
    }
        
    if(trim($chactiv)!="" ){
        $aVariableRequete['id_activite_plus_prise_rendez_vous'] = $chactiv;
        $sRequete_suite.=" and principal.id_activite_plus_prise_rendez_vous  =:id_activite_plus_prise_rendez_vous ";
    }

    if(trim($chspecial)!="" ) {
        $aVariableRequete['id_profession'] = $chspecial;
        $aVariableRequete['identifiant_entite'] = $objClassGenerique->identifiant_entite;
        $sRequete_suite .= " and principal.iddocteur_user  in (select id_user from alaxione_user where id_profession =:id_profession 
        and user_supplogique='N' and type_user='USER' and identifiant_entite=:identifiant_entite) ";
    }

    if ($iddocteur_user != ""){
        $aVariableRequete['iddocteur_user'] = $iddocteur_user;
        $sRequete_suite.= " and iddocteur_user =:iddocteur_user ";
    }

    if(!empty($chmotif)!="" ) {

        $in = "0";
        foreach($chmotif as $valrdv){
            if(is_numeric($valrdv)){
                $in.=",".$valrdv;
            }
        }
        $in.='';
        $sRequete_suite .= " and principal.id_prise_rendez_vous  in (select id_prise_rendez_vous from alaxione_prise_type_rdv where id_type_rdv in (".$in.")
        and supplogique_prise_type_rdv='N')";
    }

    if(trim($chservice)!="" ) {
        $aVariableRequete['id_service'] = $chservice;
        $sRequete_suite .= " and principal.id_service =:id_service";
    }

    if(trim($chsalle)!="" ) {
        $aVariableRequete['id_salle'] = $chsalle;
        $sRequete_suite .= " and principal.id_planning  in (select id_plannig_dispo  from alaxione_plannig_dispo where id_salle =:id_salle 
        and suplogique_plannig_dispo='N')";
    }

    if(trim($heuredebut)!="" ) {
        $aVariableRequete['heuredebut'] = $heuredebut;
        $sRequete_suite .= " and principal.heure_debut_prise_rendez_vous>=:heuredebut";
    }

    if(trim($heurefin)!="" ) {
        $aVariableRequete['heurefin'] = $heurefin;
        $sRequete_suite .= " and principal.heure_debut_prise_rendez_vous<=:heurefin";
    }


    $sRequete_suite .= " and principal.date_prise_rendez_vous between '".$objClassGenerique->renvoi_date($date_prise_rendez_vous[0],'eng')."' 
    and '".$objClassGenerique->renvoi_date($date_prise_rendez_vous[1],'eng')."'";


    //recupération user autorisés sur les lieux et SELAS
    $bGestionSelas = $objClassGenerique->activ_variable_config($objClassGenerique->identifiant_entite, "gestionselas", "ok");
    $sListeUser = "";
    if ($bGestionSelas) {
        $sListeUser = $objClassGenerique->GetAuthorizedUsers($objClassGenerique->id_user);
    }

    if ($sListeUser != ""){
        $sRequete_suite .= " And docteur.id_user in (".$sListeUser.")";
    }

    // On filtre si on a reçu un numéro SDA de centre par URL
    $sFiltreSDA = "";
    if (isset($_SESSION['AlaxioneIdLieux'])){
        $sFiltreSDA = " INNER JOIN alaxione_lieu_user ON alaxione_lieu_user.id_user = alaxione_user.id_user AND alaxione_lieu_user.supplogiqueid_lieu_user = 'N' ";
        $sRequete_suite .= " AND alaxione_lieu_user.id_lieux IN (".$_SESSION['AlaxioneIdLieux'].")";
    }


        $sRequete="SELECT principal.id_prise_rendez_vous ,principal.id_prise_rendez_vous,
        DATE_FORMAT(principal.date_prise_rendez_vous, '%d/%m/%Y') AS 'date_date_prise_rendez_vous',
        DATE_FORMAT(principal.heure_debut_prise_rendez_vous, '%H:%i') AS heure_rdv_debut,
        'ch_id_prise_rendez_vous_motif',
        principal.idpatient_user,
        concat(patient.nom_user,' ',patient.prenom_user) AS mon_idpatient_user,
        patient.nom_user,
        patient.prenom_user,
        patient.nom_jeune_fille_user AS nom_jeune_fille,
        principal.idpatient_user,
        patient.identifiant_module_externe_user AS ipp_patient,
        DATE_FORMAT(patient.date_naissance_user,'%d/%m/%Y') AS date_naissance,
        principal.idpatient_user,
        concat(patient.tel_mobile_user,' ',patient.tel_fixe_user) AS mon_idpatient_user_tel,
        principal.remarque_prise_rendez_vous,
        principal.iddocteur_user AS iddocteur_user,
        alaxione_type_rdv.libelle_type_rdv,
        docteur.nom_user AS nom_praticien,
        concat(civilite_docteur.abreviation_civilite,' ',docteur.nom_user,' ',docteur.prenom_user,' ','(',docteur_profession.nom_profession,')') AS mon_iddocteur_user,
        DATE_FORMAT(principal.heure_fin_prise_rendez_vous, '%H:%i') AS heure_rdv_fin,
        principal.identification_rdv,
        principal.id_activite_plus_prise_rendez_vous,bd5.libelle_type_activite AS mon_id_activite_plus_prise_rendez_vous,
        principal.id_action,bd6.identifiant_champ_vrac AS mon_id_action,
        centre.nom_lieux AS nom_centre,
        unite_fonctionnelle.nom_lieux AS nom_unite_fonctionnelle,
        alaxione_prise_type_rdv.id_type_rdv
        FROM alaxione_prise_rendez_vous AS principal 
        LEFT JOIN alaxione_user AS patient ON patient.id_user = principal.idpatient_user 
        LEFT JOIN alaxione_user AS docteur ON docteur.id_user = principal.iddocteur_user 
        LEFT JOIN alaxione_type_activite AS bd5 ON bd5.id_type_activite = principal.id_activite_plus_prise_rendez_vous 
        LEFT JOIN outil_champ_vrac AS bd6 ON bd6.identifiant_champ_vrac = principal.id_action
        INNER JOIN alaxione_profession AS docteur_profession ON docteur_profession.id_profession = docteur.id_profession
        INNER JOIN alaxione_lieux AS centre ON centre.id_lieux = principal.id_lieux
        LEFT JOIN alaxione_lieux AS unite_fonctionnelle ON unite_fonctionnelle.id_lieux = principal.id_service
        INNER JOIN alaxione_prise_type_rdv ON alaxione_prise_type_rdv.id_prise_rendez_vous = principal.id_prise_rendez_vous
        INNER JOIN  alaxione_type_rdv ON alaxione_type_rdv.id_type_rdv = alaxione_prise_type_rdv.id_type_rdv
        LEFT JOIN alaxione_civilite AS civilite_docteur ON civilite_docteur.id_civilite = docteur.id_civilite".
        $sFiltreSDA. "
        WHERE principal.supplogiquefixe_prise_rendez_vous = 'N' 
        AND etat_prise_rendez_vous='valide'
        and alaxione_prise_type_rdv.supplogique_prise_type_rdv = 'N'
        AND docteur.user_supplogique='N'
        AND docteur.identifiant_entite =:identifiant_entite
        AND docteur.actifcalendar_user='Y'
        AND docteur.type_user='USER'
        and etat_prise_rendez_vous='valide' 
        AND ((supplogique_prise_rendez_vous='N') OR (supplogique_prise_rendez_vous='Y' AND (id_action='annulationparsms' OR id_action='annulationparvocal') )) 
        AND (rdv_prive<>'Y' OR idcreateur_user=:idcreateur_user ) 
        ";


        $sRequete_suite.=" order by nom_praticien, principal.date_prise_rendez_vous, heure_rdv_debut limit 20000";
        $sRequete.=$sRequete_suite;



        $aTableauInfoRDV = $objClassGenerique->renvoi_info_requete_new($sRequete, $aVariableRequete);

        foreach($aTableauInfoRDV as $value){

                // Création d'une clef unique pour rassembler les rdv d'un praticien avec une date
                $scles=$value['iddocteur_user']."_".$value['date_date_prise_rendez_vous'];
                $aTableauListePraticien[$scles][]=$value;
        }
        
        $print_liste_header="";
        $print_liste_header.='
        <style>
            @page{
                margin:10px;
                size: A4 landscape;
            }
            td{
                border-top: 1px solid #a9a3a3;
            }
            .table{
                width: 100%!important;
                font-family: serif;
                font-size:14px!important;
                background-color: #fff!important;
                color: #000!important;
            }
            thead{
                display: table-header-group!important;
            }
            #last_date:last-child{

            }
        </style>';
            
        foreach($aTableauListePraticien as $valueHeader){

            $print_liste_header.='
            <table class="table table-bordered" style="text-align: left;page-break-after:always; border:1px black solid;padding:10px;">
                <thead>
                    <tr id="enTete-print">
                        <th colspan="2"><h2>'.$valueHeader[0]['mon_iddocteur_user'].'</h2></th>
                        <th colspan="3"><h3>'.$valueHeader[0]['nom_unite_fonctionnelle'].'</h3></th>
                        ';
                        if(empty($aVariableRequete['heuredebut'])){
                            $print_liste_header.='<th colspan="2"><h3 id="first_date" style="float:right;">'.$valueHeader[0]['date_date_prise_rendez_vous'].'</h3></th>';
                        }else{
                            $print_liste_header.='<th colspan="2"><h3 id="first_date" style="float:right;">'.$valueHeader[0]['date_date_prise_rendez_vous'].' - Recherche horaire ► '.$aVariableRequete['heuredebut'].' / '.$aVariableRequete['heurefin'].'</h3></th>';
                        }
                        $print_liste_header.='</tr>
                    <tr id="colonne-print" style="text-align: left;border:1px black solid!important;">
                        <th>Horaire</th>
                        <th>Patient</th>
                        <th>IPP</th>
                        <th>Naissance</th>
                        <th>Motif</th>
                        <th>Commentaire</th>
                        <th>Tel</th>
                    </tr>
                </thead>
                <tbody>
                ';
                foreach($valueHeader as $valueListeRdv){
                    $print_liste_header.='
                        <tr style="height:30px">
                            <td style="width:100px">'.$valueListeRdv['heure_rdv_debut'].' - '.$valueListeRdv['heure_rdv_fin'].'</td>';
                            if(empty($valueListeRdv['nom_jeune_fille'])){
                                $print_liste_header.='<td style="min-width:150px"><b>'.$valueListeRdv['nom_user'].'</b> '.$valueListeRdv['prenom_user'].'</td>';
                            }else{
                                $print_liste_header.='<td style="min-width:200px"><b>'.$valueListeRdv['nom_user'].'</b> - '.$valueListeRdv['nom_jeune_fille'].' '.$valueListeRdv['prenom_user'].'</td>';
                            }
                            $print_liste_header.='<td style="width:100px">'.substr($valueListeRdv['ipp_patient'], 0,20).'</td>
                            <td style="width:100px">'.$valueListeRdv['date_naissance'].'</td>
                            
                            <td style="min-width:100px;font-size:12px">'.$valueListeRdv['libelle_type_rdv'].'</td>
                            <td style="min-width:200px">'.$valueListeRdv['remarque_prise_rendez_vous'].'</td>';

                            if(empty($valueListeRdv['mon_idpatient_user_tel'])){
                                $print_liste_header.='<td></td>';
                            }else{
                                $print_liste_header.='<td>'.str_replace(" ", " / ", trim($valueListeRdv['mon_idpatient_user_tel'])).'</td>';
                            }
                            $print_liste_header.='</tr>';
                }
            }
                $print_liste_header.=' </tbody>
            </table>';
            

	echo '<body onload = " window.print()">';
    print_r($print_liste_header);
	
	echo'<body>';
}

?>
