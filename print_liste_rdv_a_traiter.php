<?php

//ini_set("display_errors","On");
include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');

//récupération des infomations passée en post
$aVariable = array("identifiant_entite","id_produit","action","validation","quantiteajour","comment","datesaisie","quantitealerte",
    "date_prise_rendez_vous","iddocteur_user","chfiltreplus","id_lieux","chactiv","chspecial","chservice","chsalle","heuredebut","heurefin","datesaisie_prise_rendez_vous",
    "idcreateur_user","id_action","id_activite_plus_prise_rendez_vous","traiter_liste_rdv","date_datesaisie_prise_rendez_vous","datesimple_datesaisie_prise_rendez_vous");

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
    // $aVariableRequete['datesaisie_prise_rendez_vous'] = $datesaisie_prise_rendez_vous;

    


    // Intervalle Date de saisie
    if(trim($datesaisie_prise_rendez_vous[0]) != ""){
        $sRequete_suite .= " and principal.datesaisie_prise_rendez_vous >= '".$objClassGenerique->renvoi_date($datesaisie_prise_rendez_vous[0],'eng'). " 00:00:00"."'";
    }
    if(trim($datesaisie_prise_rendez_vous[1]) != ""){
        $sRequete_suite .= " and principal.datesaisie_prise_rendez_vous <= '".$objClassGenerique->renvoi_date($datesaisie_prise_rendez_vous[1],'eng'). " 23:59:59"."'";
    }

    // Saisie par
    if(trim($idcreateur_user)!= "" ) {
        $aVariableRequete['idcreateur_user'] = $idcreateur_user;

        $sRequete_suite .= " and principal.idcreateur_user =:idcreateur_user";
    }
    // Praticien
    if(trim($iddocteur_user)!= "" ) {
        $aVariableRequete['iddocteur_user'] = $iddocteur_user;
        $sRequete_suite .= " AND principal.iddocteur_user =:iddocteur_user";
    }

    // Intervalle Date rendez vous
    if(trim($date_prise_rendez_vous[0]) != ""){
        $sRequete_suite .= " AND principal.date_prise_rendez_vous >= '".$objClassGenerique->renvoi_date($date_prise_rendez_vous[0],'eng'). " 00:00:00"."'";
    }
    
    if(trim($date_prise_rendez_vous[1]) != ""){
        $sRequete_suite .= " AND principal.date_prise_rendez_vous <= '".$objClassGenerique->renvoi_date($date_prise_rendez_vous[1],'eng'). " 23:59:59"."'";
    }
   
    // Activité
    if(trim($id_activite_plus_prise_rendez_vous)!="" ) {
        $aVariableRequete['id_activite_plus_prise_rendez_vous'] = $id_activite_plus_prise_rendez_vous;
        $sRequete_suite .= " AND principal.id_activite_plus_prise_rendez_vous=:id_activite_plus_prise_rendez_vous";
    }
    // Lieu
    if(trim($id_lieux)!="" ) {
        $aVariableRequete['id_lieux'] = $id_lieux;
        $sRequete_suite .= " AND principal.id_lieux = :id_lieux";
    }
    // Traité
    if(trim($traiter_liste_rdv)==="N" ) {
        $sRequete_suite .= " AND principal.traiter_liste_rdv = 'N'";
    }else{
        $sRequete_suite .= " AND principal.traiter_liste_rdv = 'Y'";
    }
    // Statut
    if(trim($id_action)!="" ) {
        $aVariableRequete['id_action'] = $id_action;
        $sRequete_suite .= " AND principal.id_action =:id_action";
    }


        $sRequete=" SELECT principal.id_prise_rendez_vous,
        principal.identification_rdv,
        principal.identifiant_entite_rdv,
        principal.idcreateur_user,
        concat(bd1.nom_user,' ',bd1.prenom_user) AS mon_idcreateur_user,
        DATE_FORMAT(principal.datesaisie_prise_rendez_vous, '%Y-%m-%d %H:%i:%s') AS date_datesaisie_prise_rendez_vous,
        DATE_FORMAT(principal.datesaisie_prise_rendez_vous, '%Y-%m-%d') AS datesimple_datesaisie_prise_rendez_vous,
        principal.iddocteur_user AS iddocteur_user,
        DATE_FORMAT(principal.date_prise_rendez_vous, '%Y-%m-%d %H:%i:%s') AS date_date_prise_rendez_vous,
        DATE_FORMAT(principal.date_prise_rendez_vous, '%d/%m/%Y') AS 'date',
        principal.heure_debut_prise_rendez_vous,
        DATE_FORMAT(principal.heure_debut_prise_rendez_vous, '%H:%i') AS heure_rdv_debut,
        principal.heure_fin_prise_rendez_vous,
        principal.id_activite_plus_prise_rendez_vous,
        bd3.libelle_type_activite AS activite,
        principal.id_lieux,
        bd4.nom_lieux AS mon_id_lieux,
        principal.traiter_date_liste_rdv,
        principal.traiter_identifiant_user_liste_rdv,
        concat(bd5.nom_user,' ',bd5.prenom_user) AS mon_traiter_identifiant_user_liste_rdv,
        principal.traiter_liste_rdv,
        principal.idpatient_user,
        concat(bd6.nom_user,' ',bd6.prenom_user) AS mon_idpatient_user,
        principal.idpatient_user,bd7.tel_mobile_user AS mon_idpatient_user2,
        principal.idpatient_user,bd8.tel_fixe_user AS mon_idpatient_user3,
        principal.idpatient_user,bd9.email_user AS mon_idpatient_user4,
        principal.idpatient_user,
        bd6.genre_user AS genre,
        bd6.nom_jeune_fille_user AS nom_jeune_fille,
        bd6.nom_user,
        bd6.prenom_user,
        concat(bd6.tel_mobile_user,' ',bd6.tel_fixe_user) AS telephone_patient,
        concat(civilite_patient.abreviation_civilite,' ',bd6.nom_user,' ',bd6.prenom_user) AS identite_patient,
        concat(bd6.adresse_user,' ',bd6.code_postal_user,' ',bd6.ville_user) AS adresse_user,   
        DATE_FORMAT(bd10.date_naissance_user, '%d/%m/%Y') AS 'date_naissance',  
        bd6.email_user AS email_patient,
        bd6.num_securite_sociale_user AS num_secu,
        bd6.medecin_traitant_user AS medecin_traitant,
        civilite_patient.abreviation_civilite AS civilite_patient,
        principal.id_action,bd11.valeur_champ_vrac AS mon_id_action,
        unite_fonctionnelle.nom_lieux AS nom_unite_fonctionnelle,
        concat(civilite_docteur.abreviation_civilite,' ',docteur.nom_user,' ',docteur.prenom_user,' ','(',docteur_profession.nom_profession,')') AS mon_iddocteur_user,
        principal.remarque_prise_rendez_vous AS remarque
        FROM alaxione_prise_rendez_vous AS principal 
        left join alaxione_user AS bd1 ON bd1.identifiant_user = principal.idcreateur_user 
        left join alaxione_type_activite AS bd3 ON bd3.id_type_activite = principal.id_activite_plus_prise_rendez_vous 
        left join alaxione_lieux AS bd4 ON bd4.id_lieux = principal.id_lieux 
        left join alaxione_user AS bd5 ON bd5.identifiant_user = principal.traiter_identifiant_user_liste_rdv 
        left join alaxione_user AS bd6 ON bd6.id_user = principal.idpatient_user 
        left join alaxione_user AS bd7 ON bd7.id_user = principal.idpatient_user 
        left join alaxione_user AS bd8 ON bd8.id_user = principal.idpatient_user 
        left join alaxione_user AS bd9 ON bd9.id_user = principal.idpatient_user 
        left join alaxione_user AS bd10 ON bd10.id_user = principal.idpatient_user 
        LEFT JOIN alaxione_user AS docteur ON docteur.id_user = principal.iddocteur_user 
        LEFT JOIN alaxione_lieux AS unite_fonctionnelle ON unite_fonctionnelle.id_lieux = principal.id_service
        LEFT JOIN alaxione_civilite AS civilite_patient ON civilite_patient.id_civilite = bd6.id_civilite
        LEFT JOIN alaxione_civilite AS civilite_docteur ON civilite_docteur.id_civilite = docteur.id_civilite
        INNER JOIN alaxione_profession AS docteur_profession ON docteur_profession.id_profession = docteur.id_profession
        left join outil_champ_vrac AS bd11 ON bd11.identifiant_champ_vrac = principal.id_action 
        WHERE principal.supplogique_prise_rendez_vous = 'N' 
        AND bd6.nom_user IS NOT NULL
        and etat_prise_rendez_vous='valide' 
        AND principal.iddocteur_user IN (SELECT id_user FROM alaxione_user WHERE user_supplogique='N' AND identifiant_entite=:identifiant_entite AND actifcalendar_user='Y' AND type_user='USER') AND (rdv_prive!='Y') 
        ";

        $sRequete.=$sRequete_suite;
        $aTableauInfoRDV = $objClassGenerique->renvoi_info_requete_new($sRequete, $aVariableRequete);





        foreach($aTableauInfoRDV as $value){
                // Création d'une clef unique pour rassembler les rdv d'un praticien avec une date
                $scles=$value['iddocteur_user']."_".$value['date'];
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
                        <th colspan="6"><h2>'.$valueHeader[0]['mon_iddocteur_user'].'</h2></th>
                        <th colspan="3"><h3>'.$valueHeader[0]['nom_unite_fonctionnelle'].'</h3></th>
                        <th colspan="2"><h3 id="first_date" style="float:right;">'.$valueHeader[0]['date'].'</h3></th>
                        ';
                        $print_liste_header.='</tr>
                    <tr id="colonne-print" style="text-align: left;border:1px black solid!important;">
                        <th>Horaire</th>
                        <th>Activité</th>
                        <th>Genre</th>
                        <th>Patient</th>
                        <th>Naissance</th>
                        <th>Adresse</th>
                        <th>Téléphone</th>
                        <th>Mail</th>
                        <th>N° sécu</th>
                        <th>Médecin traitant</th>
                        <th colspan="2">Commentaire</th>
                    </tr>
                </thead>
                <tbody>
                ';
                foreach($valueHeader as $valueListeRdv){
        
                    $print_liste_header.='
                        <tr style="height:30px;">
                            <td>'.$valueListeRdv['heure_rdv_debut'].'</td>
                            <td>'.$valueListeRdv['activite'].'</td>
                            <td>'.$valueListeRdv['genre'].'</td>
                            ';

                            if(empty($valueListeRdv['nom_jeune_fille'])){
                                $print_liste_header.='<td><b>'.$valueListeRdv['identite_patient'].'</b></td>';
                            }
                            elseif($valueListeRdv['nom_jeune_fille']==="UNDEFINED"){
                                $print_liste_header.='<td><b>'.$valueListeRdv['identite_patient'].'</b></td>';
                            }else{
                                $print_liste_header.='<td><b>'.$valueListeRdv['civilite_patient'].' '.$valueListeRdv['nom_user'].' - '.$valueListeRdv['nom_jeune_fille'].' '.$valueListeRdv['prenom_user'].'</b></td>';
                            }
                            
                            $print_liste_header.='
                            <td>'.$valueListeRdv['date_naissance'].'</td>
                            <td>'.$valueListeRdv['adresse_user'].'</td>
                            ';

                            if(empty($valueListeRdv['telephone_patient'])){
                                $print_liste_header.='<td></td>';
                            }
                            else{
                                $print_liste_header.='<td>'.str_replace(" ", " / ", trim($valueListeRdv['telephone_patient'])).'</td>';
                            }

                            $print_liste_header.='<td>'.$valueListeRdv['email_patient'].'</td>
                            <td>'.$valueListeRdv['num_secu'].'</td>
                            <td>'.$valueListeRdv['medecin_traitant'].'</td>
                            <td style="font-size:12px!important;" colspan="2">'.str_replace(CHR(13), " ", str_replace(CHR(10), " ", $valueListeRdv['remarque'])).'</td>';

                            $print_liste_header.='</tr>';
                }
            }
                $print_liste_header.=' </tbody>
            </table>';
            
    print_r($print_liste_header);
    //exit();
}

?>
<script>
    document.execCommand('print');
</script>
