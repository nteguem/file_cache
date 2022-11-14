<?php

include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');

//récupération des infomations passée en post




$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(0, '');

If(isset($_GET['action'])){
    $action =$_GET['action'];
}else{
    $action ="";
}

If(isset($_GET['validation'])){
    $action =$_GET['validation'];
}else{
    $action ="";
}
If(isset($_GET['idrdv'])){
    $idrdv =$_GET['idrdv'];
}else{
    $idrdv ="";
}


if ($idrdv=="") {
    exit();
}



$aTableauModif=array();



$aTabVal=array();
$aTabVal['id_rdv']=$idrdv;
$identifiantlong=$idrdv;

// recupération des informations sur le RDV dans le cadre d'un service de repush
$sRequete_inf_rdv = "SELECT alaxione_prise_rendez_vous.id_prise_rendez_vous,
idpatient_user,
iddocteur_user,
id_lieux,
validdeplace_prise_rendez_vous,
supplogique_prise_rendez_vous,
email_user,	
identifiant_entite_rdv,
idpere_prise_rendez_vous,
validdeplace_prise_rendez_vous,
date_format(date_prise_rendez_vous,'%d/%m/%Y') as ladate,
date_format(heure_debut_prise_rendez_vous,'%H:%i') as heuredebut,
remarque_prise_rendez_vous,
id_module_externe_prise_rendez_vous,
nom_user,
prenom_user,
email_user,
adresse_user,
tel_mobile_user,
ville_user,
code_postal_user,
date_format(datenaissance_user,'%d/%m/%Y') as datenaissance,
num_securite_sociale_user,   
nom_jeune_fille_user,
identifiant_module_externe_user,
alaxione_civilite.id_civilite,
profession_user,
abreviation_oplus_civilite,
alaxione_prise_type_rdv.id_type_rdv,
identification_rdv,
alaxione_user.identifiant_user,
alaxione_user.indicatif_national,
idparent_deplace_prise_rendez_vous,
date_prise_rendez_vous,
validdeplace_prise_rendez_vous,
supplogique_prise_rendez_vous
FROM alaxione_prise_rendez_vous
LEFT JOIN alaxione_user on alaxione_user.id_user = alaxione_prise_rendez_vous.idpatient_user
Left join alaxione_civilite on alaxione_civilite.id_civilite = alaxione_user.id_civilite
LEFT JOIN alaxione_prise_type_rdv  on alaxione_prise_type_rdv.id_prise_rendez_vous = alaxione_prise_rendez_vous.id_prise_rendez_vous and supplogique_prise_type_rdv='N'
WHERE identification_rdv = :id_rdv";

$aTableauInfoRDV = $objClassGenerique->renvoi_info_requete_new($sRequete_inf_rdv, $aTabVal);



$idrdv  =$aTableauInfoRDV[0]['id_prise_rendez_vous'];
$idrdvold  =$aTableauInfoRDV[0]['idparent_deplace_prise_rendez_vous'];

$identmessage="choixlconfirmationdeplacementrdv";

$aTableauHtmlRecapRdv = $objClassGenerique->renvoi_htm_info_recap($idrdv);





if($aTableauInfoRDV[0]['validdeplace_prise_rendez_vous']=="ok"){
    $action="";
    $identmessage="valconfirmationdeplacementrdv";
}

if($aTableauInfoRDV[0]['supplogique_prise_rendez_vous']=="Y"){
    $action="";
    $identmessage="emailgeneralsuppRDV";
}


$aTableauHtmlRecapRdvOld = $objClassGenerique->renvoi_htm_info_recap($idrdvold);
//coonfirmation du RDV
//confirmation du RDV dans la base de donnée
if($action=="ok") {
    $aTabVal = array();
    $aTabVal['identification_rdv'] = $identifiantlong;
    $sRequete_update = "UPDATE alaxione_prise_rendez_vous
	SET validdeplace_prise_rendez_vous='ok',datemodif_prise_rendez_vous=now(),
	remarque_prise_rendez_vous='" . str_replace('***rdv en attente de validation***', '***RDV confirmé***', $aTableauInfoRDV[0]['remarque_prise_rendez_vous']) . "'
	where  identification_rdv=:identification_rdv";

    $objClassGenerique->executionRequete_new($sRequete_update, $aTabVal);


//MAJ du rendez vous dans un module esxterne s'il existe
    $aTableauInfoPatientRDV = $objClassGenerique->renvoi_info_rdv($identifiantlong, "identification_rdv");

    if( trim($aTableauInfoPatientRDV[0]['telmobilepatient']) == "" ) {
        $stel = $aTableauInfoPatientRDV[0]['telfixepatient'];
    } else {
        $stel = $aTableauInfoPatientRDV[0]['telmobilepatient'];
    }

    $aTabPatient = array();
    $aTabPatient['sexe'] = $aTableauInfoPatientRDV[0]['patientabrciviliteoplus'];
    $aTabPatient['nom'] = $aTableauInfoPatientRDV[0]['nompatient'];
    $aTabPatient['prenom'] = $aTableauInfoPatientRDV[0]['prenompatient'];
    $aTabPatient['adresse'] = $aTableauInfoPatientRDV[0]['adressepatient'];
    $aTabPatient['adresse2'] = '';
    $aTabPatient['tel'] = $stel;
    $aTabPatient['cp'] = $aTableauInfoPatientRDV[0]['codepostalpatient'];
    $aTabPatient['identifiant_module_externe_user']=$aTableauInfoPatientRDV[0]['identifiantexternepatient'];
    $aTabPatient['ville'] = $aTableauInfoPatientRDV[0]['villepatient'];
    $aTabPatient['idpatient'] = $aTableauInfoPatientRDV[0]['idpatient_user'];
    $atabpatient['naissance'] = $aTableauInfoRDV[0]['datenaissance'];
    $aTabPatient['mail'] = $aTableauInfoPatientRDV[0]['email_user'];//suppression du rendez vous
    $aTabPatient['note'] = str_replace('***rdv en attente de validation***', '***RDV confirmé***', $aTableauInfoRDV[0]['remarque_prise_rendez_vous']);//suppression du rendez vous

    $idlieu = $aTableauInfoPatientRDV[0]['id_lieux'];
    $daterdv = $aTableauInfoPatientRDV[0]['daterdv'];
    $heuredebut = $aTableauInfoPatientRDV[0]['heurereel'];
    $iddocteur = $aTableauInfoPatientRDV[0]['iddocteur_user'];

//récupération idenifiant_user
    $sRequete_info_docteur = "SELECT identifiant_user FROM alaxione_user where id_user=" . $aTableauInfoRDV[0]['iddocteur_user'];
    $aTableauInfDocteur = $objClassGenerique->renvoi_info_requete($sRequete_info_docteur);
    $identifiantdocteur = $aTableauInfDocteur[0]['identifiant_user'];

    $idtyperdv = $aTableauInfoPatientRDV[0]['id_type_rdv'];

    $aTableauReservModuleExterne = $objClassGenerique->enregistrement_modification_module_externe(
        $idlieu,
        $daterdv,
        $heuredebut,
        $identifiantdocteur,
        $idtyperdv,
        $aTabPatient,
        'M',
        $aTableauInfoPatientRDV[0]['id_module_externe_prise_rendez_vous']
    );

    $aTableauLog = array();
    $commentaireLog = 'Déplacement confirmé par le patient';

    $aTableauLog['ip'] = $_SERVER['REMOTE_ADDR'];
    $aTableauLog['user'] = 'patient';
    $aTableauLog['user_name'] = $objClassGenerique->fct_nom_user_connecte();
    $aTableauLog['date'] = date('Y-m-d H:i:s');
    $aTableauLog['script'] = $_SERVER['SCRIPT_NAME'];
    $aTableauLog['methode'] = 'UPDATE';
    $aTableauLog['objet'] = 'rdv';
    $aTableauLog['ressource'] = $aTableauInfoRDV[0]['id_prise_rendez_vous'];
    $aTableauLog['status'] = 'ok';
    $aTableauLog['os'] = $_SERVER['HTTP_USER_AGENT'];
    $aTableauLog['navigateur'] = $_SERVER['HTTP_USER_AGENT'];
    $aTableauLog['type'] = 'fonctionnel';
    $aTableauLog['serveur'] = $objClassGenerique->sNomServeurDBB;
    $aTableauLog['entite'] = $_COOKIE['AlaxioneAutreCentre'];
    $aTableauLog['commentaire'] = $commentaireLog;


    $objClassGenerique->push_trace_objet($aTableauLog);
    $identmessage="valconfirmationdeplacementrdv";

    //***************  ********************************;
    $objClassGenerique->envoi_sms_recap_rdv($idrdv,false,"",false,"");
    $objClassGenerique->envoi_mail_recap_rdv(
        $idrdv,
        $aTableauInfoRDV[0]['idpatient_user'],
        "",
        "",
        false,
        ""
    );
//************************************
}

if($action=="supp"){

    $identmessage="emailgeneralsuppRDV";
    $reqGetFils = "SELECT fils.id_prise_rendez_vous
                    FROM alaxione_prise_rendez_vous as prv
                    INNER JOIN alaxione_prise_rendez_vous as fils ON
                        fils.idgrouperecurrent_prise_rendez_vous = prv.idgrouperecurrent_prise_rendez_vous
                    WHERE prv.id_prise_rendez_vous = :idrdv
                    AND fils.idgrouperecurrent_prise_rendez_vous != ''
                    AND fils.id_prise_rendez_vous != prv.id_prise_rendez_vous";

    $paramGetFils = array();
    $paramGetFils["idrdv"] = $aTableauInfoRDV[0]['id_prise_rendez_vous'];
    $rdvFils = $objClassGenerique->renvoi_info_requete_new($reqGetFils, $paramGetFils);

    if (!empty($rdvFils)) {
        foreach ($rdvFils as $elem) {
            $objClassGenerique->cb_suppression_rdv($elem['id_prise_rendez_vous'], false, "N", "", false, "", "", $sMessageRetour, $aTab);
        }
    }

    $aTableauResult = $objClassGenerique->cb_suppression_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous'], false, "N", "", false, "", "", $sMessageRetour,
        $aTab);


    // on passe a attente de validation a ok
    $sRequeteAttentValidation ="UPDATE alaxione_prise_rendez_vous set validdeplace_prise_rendez_vous='refuser',id_action='absenceexcusee' 
                                WHERE id_prise_rendez_vous = :idrdv";
    $objClassGenerique->renvoi_info_requete_new($sRequeteAttentValidation, $paramGetFils);
    $aTableauLog = array();
    $commentaireLog = 'Rendez-vous annulé par le patient';

    $aTableauLog['ip'] = $_SERVER['REMOTE_ADDR'];
    $aTableauLog['user'] = 'patient';
    $aTableauLog['user_name'] = $objClassGenerique->fct_nom_user_connecte();
    $aTableauLog['date'] = date('Y-m-d H:i:s');
    $aTableauLog['script'] = $_SERVER['SCRIPT_NAME'];
    $aTableauLog['methode'] = 'UPDATE';
    $aTableauLog['objet'] = 'rdv';
    $aTableauLog['ressource'] = $aTableauInfoRDV[0]['id_prise_rendez_vous'];
    $aTableauLog['status'] = 'ok';
    $aTableauLog['os'] = $_SERVER['HTTP_USER_AGENT'];
    $aTableauLog['navigateur'] = $_SERVER['HTTP_USER_AGENT'];
    $aTableauLog['type'] = 'fonctionnel';
    $aTableauLog['serveur'] = $objClassGenerique->sNomServeurDBB;
    $aTableauLog['entite'] = $_COOKIE['AlaxioneAutreCentre'];
    $aTableauLog['commentaire'] = $commentaireLog;


    $objClassGenerique->push_trace_objet($aTableauLog);

}

$Message_erreur = "Attention si vous allez au bout de l'action vous allez supprimer votre rendez vous du " . $aTableauHtmlRecapRdv[0]['date_fr'] . "
                à " . $aTableauHtmlRecapRdv[0]['heure_aff'] . " avec le docteur " . $aTableauHtmlRecapRdv[0]['nomdocteur'];

$stokendeplacement = $objClassGenerique->genere_token_link(777600, $aTableauHtmlRecapRdv[0]['identifiantdocteur'], $aTableauHtmlRecapRdv[0]['identifiantuser'],
    $aTableauHtmlRecapRdv[0]['idlieux'], "", false, "", $aTableauHtmlRecapRdv[0]['identification_rdv'], $Message_erreur, "", "annule-remplace");



//recupération rul logo entite
$aTabVal=array();
$aTabVal['identifiant_entite']=$aTableauHtmlRecapRdv[0]['identifiant_entite'];
$sRequeteInfoLog ="SELECT valeur_entite_infosupp FROM WHERE cles_entite_infosupp='url_logo_entite' and identifiant_entite=:identifiant_entite";
$aTableaulogo = $objClassGenerique->renvoi_info_requete_new($sRequeteInfoLog, $aTabVal);

if(!empty($aTableaulogo)){
    $srvlogo=$aTableaulogo[0]['valeur_entite_infosupp'];
}else {
    $srvlogo = "img/logodefault.jpg";
}

$iddocteur = $aTableauHtmlRecapRdv[0]['iddocteuruser'];
$idlieu = $aTableauHtmlRecapRdv[0]['id_lieux'];



$aTableauRetourGenre = $objClassGenerique->renvoi_genre_user($iddocteur);
$atableauInfoLieu = $objClassGenerique->renvoi_info_lieu($idlieu);
$linknomcompte =$objClassGenerique->fc_renvoi_type_lien($aTableauHtmlRecapRdv[0]['identifiant_entite'],"compte","","",$aTableauHtmlRecapRdv[0]['linkpage_lieux']);

$linkdeplacement =$objClassGenerique->fc_renvoi_type_lien($aTableauHtmlRecapRdv[0]['identifiant_entite'],"deplacerRdv",$stokendeplacement,"",$aTableauHtmlRecapRdv[0]['linkpage_lieux']);

$slinkconfirm="confirm_deplacement_rdv.php?validation=ok&idrdv=".$identifiantlong;
$slinkconfirmsup="confirm_deplacement_rdv.php?validation=supp&idrdv=".$identifiantlong;





$aTableauModif[]=array("id"=>"<rdvseul>","valeur"=>$objClassGenerique->renvoi_jour_mois_format_v2($aTableauHtmlRecapRdv[0]['date_fr'])." à ".substr($aTableauHtmlRecapRdv[0]['heureaffrdv'], 0, 5));
$aTableauModif[]=array("id"=>"<rdseulnew>","valeur"=>$objClassGenerique->renvoi_jour_mois_format_v2($aTableauHtmlRecapRdvOld[0]['date_fr'])." à ".substr($aTableauHtmlRecapRdvOld[0]['heureaffrdv'], 0, 5));
$aTableauModif[]=array("id"=>"<photo_praticien>","valeur"=>$aTableauHtmlRecapRdv[0]['photo_praticien']);
$aTableauModif[]=array("id"=>"<daterdv>","valeur"=>$objClassGenerique->renvoi_jour_mois_format_v2($aTableauHtmlRecapRdv[0]['date_fr']));
$aTableauModif[]=array("id"=>"<heurerdv>","valeur"=>substr($aTableauHtmlRecapRdv[0]['heureaffrdv'], 0, 5));
$aTableauModif[]=array("id"=>"<recap_info>","valeur"=>$aTableauHtmlRecapRdv[0]['recap_info']);
$aTableauModif[]=array("id"=>"<info_importante>","valeur"=>$aTableauHtmlRecapRdv[0]['info_importante']);
$aTableauModif[]=array("id"=>"<listestringli>","valeur"=>$aTableauHtmlRecapRdv[0]['listestringli']);
$aTableauModif[]=array("id"=>"<motif>","valeur"=>$aTableauHtmlRecapRdv[0]['motif']);
$aTableauModif[]=array("id"=>"<infos_pratiques_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['infos_pratiques_lieux']);
$aTableauModif[]=array("id"=>"<tarif_remboursement>","valeur"=>$aTableauHtmlRecapRdv[0]['tarif_consultation']);
$aTableauModif[]=array("id"=>"<nom_profession>","valeur"=>$aTableauHtmlRecapRdv[0]['recap_mdr']);
$aTableauModif[]=array("id"=>"<preconisation_type_rdv>","valeur"=>$aTableauHtmlRecapRdv[0]['preconisation_type_rdv']);
$aTableauModif[]=array("id"=>"<sChaineTypepaiementV2>","valeur"=>$aTableauHtmlRecapRdv[0]['recap_mdr']);
$aTableauModif[]=array("id"=>"<nom_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['nom_lieux_service']);
$aTableauModif[]=array("id"=>"<adresse_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['adresse_lieux_service']);
$aTableauModif[]=array("id"=>"<code_postal_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['code_postal_lieux_service']);
$aTableauModif[]=array("id"=>"<ville_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['ville_lieux_service']);
$aTableauModif[]=array("id"=>"<tel_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['tel_lieux_service']);
$aTableauModif[]=array("id"=>"<linkphotolieu>","valeur"=>$aTableauHtmlRecapRdv[0]['photo_lieux_service']);
$aTableauModif[]=array("id"=>"<docteur>","valeur"=>$aTableauRetourGenre['abr']." ".$aTableauHtmlRecapRdv[0]['nom_praticien']);
$aTableauModif[]=array("id"=>"<nomdocteur>","valeur"=>$aTableauRetourGenre['abr']." ".$aTableauHtmlRecapRdv[0]['nom_praticien']);
$aTableauModif[]=array("id"=>"<infolegale_lieux>","valeur"=>$aTableauHtmlRecapRdv[0]['infolegale_lieux_service']);
$aTableauModif[]=array("id"=>"<linkapp>","valeur"=>$objClassGenerique->linkapp);
$aTableauModif[]=array("id"=>"<numerocentre>","valeur"=>$atableauInfoLieu[0]['tel_lieux']);
$aTableauModif[]=array("id"=>"<numerocentre>","valeur"=>$atableauInfoLieu[0]['tel_lieux']);
$aTableauModif[]=array("id"=>"<messageentete>","valeur"=>" est en attente de confirmation");
$aTableauModif[]=array("id"=>"<mailcentre>","valeur"=>$atableauInfoLieu[0]['email_mail_lieux']);
$aTableauModif[]=array("id"=>"<linkconfirme>","valeur"=>$slinkconfirm);
$aTableauModif[]=array("id"=>"<linksupp>","valeur"=>$slinkconfirmsup);
$aTableauModif[]=array("id"=>"<linkautreredv>","valeur"=>$linkdeplacement);
$aTableauModif[]=array("id"=>"<linknomcompte>","valeur"=>$linkdeplacement);
$aTableauModif[]=array("id"=>"<urlnewrdv>","valeur"=>$linkdeplacement);
$aTableauModif[]=array("id"=>"<linklogoentite>","valeur"=>$srvlogo);
$mailpatient=$aTableauHtmlRecapRdv[0]['email_user'];
$sMessage = $objClassGenerique->renvoi_message_format($identmessage, $aTableauModif);

echo $sMessage;
exit();


