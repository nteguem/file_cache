<?php

include_once('class/class_alaxione.php');
include_once('class/class_backoffice.php');

//récupération des infomations passée en post
$aVariable = array("idrdv", "action","prov");


for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

if ($idrdv=="") {
    exit();
}

$objClassGenerique = new class_alaxione('', '', '');
$bDroit = $objClassGenerique->verificationConnexion(0, '');

$objBackoffice = new class_backoffice();

//recupération des informations sur le RDV ,"","",1,false,$aTableauInfoRDV[0]['identification_rdv'],$aTableauInfoRDV[0]['identiant_user']
$aTabVal=array();
$aTabVal['identification_rdv']=trim($idrdv);
$sRequete_inf_rdv="SELECT id_prise_rendez_vous,
						idpatient_user,
						validdeplace_prise_rendez_vous,
						supplogique_prise_rendez_vous,
						idparent_deplace_prise_rendez_vous,
						url_centre_widget_entite,
						email_user,
						id_lieux,
						iddocteur_user,
						remarque_prise_rendez_vous,
						alaxione_entite.identifiant_entite,
						identification_rdv,
						alaxione_user.identifiant_user
						FROM alaxione_prise_rendez_vous
						INNER JOIn alaxione_user on alaxione_user.id_user = alaxione_prise_rendez_vous.idpatient_user
						LEFT JOIN alaxione_entite on alaxione_entite.identifiant_entite = alaxione_prise_rendez_vous.identifiant_entite_rdv
						WHERE identification_rdv=:identification_rdv";


$aTableauInfoRDV =  $objClassGenerique->renvoi_info_requete_new($sRequete_inf_rdv,$aTabVal);


$identite=$aTableauInfoRDV[0]['identifiant_entite'];
//****************recupération du recap sur le RDV***************   nomdocteur
$sRecapRDV  ="SELECT date_ancien_tel_deplacment_rdv,
heure_ancien_tel_deplacment_rdv,
date_nouveau_tel_deplacment_rdv,
heure_nouveau_tel_deplacment_rdv,
nom_docteur_tel_deplacment_rdv,
nom_patient_tel_depalcement_rdv,
genre_patient_tel_deplacement_rdv,
lien_confimation_tel_deplacement_rdv,
num_tel_deplacement
FROM alaxione_tel_deplacement_rdv
WHERE idrdv_tel_deplacment_rdv=".$aTableauInfoRDV[0]['id_prise_rendez_vous'];



$aTableauInfRDVDeplacer =  $objClassGenerique->renvoi_info_requete($sRecapRDV);
//*********************récupération des informations sur les RDV***************************
$mailpatient = $aTableauInfoRDV[0]['email_user'];
$idlieu = $aTableauInfoRDV[0]['id_lieux'];
$iddocteur  = $aTableauInfoRDV[0]['iddocteur_user'];
$idvrdvancien = $aTableauInfoRDV[0]['idparent_deplace_prise_rendez_vous'];
$nompatient = $aTableauInfRDVDeplacer[0]['nom_patient_tel_depalcement_rdv'];
$dateancien = $aTableauInfRDVDeplacer[0]['date_ancien_tel_deplacment_rdv'];
$datenouveau = $aTableauInfRDVDeplacer[0]['date_nouveau_tel_deplacment_rdv'];
$heureancien = $aTableauInfRDVDeplacer[0]['heure_ancien_tel_deplacment_rdv'];
$heurenouveau = $aTableauInfRDVDeplacer[0]['heure_nouveau_tel_deplacment_rdv'];
$nomdocteur = $aTableauInfRDVDeplacer[0]['nom_docteur_tel_deplacment_rdv'];
$genre = $aTableauInfRDVDeplacer[0]['genre_patient_tel_deplacement_rdv'];
$identifiantrdv = $aTableauInfRDVDeplacer[0]['lien_confimation_tel_deplacement_rdv'];
$teldeplacement = $aTableauInfRDVDeplacer[0]['num_tel_deplacement'];
$idrdvdepalcer = $aTableauInfoRDV[0]['id_prise_rendez_vous'];

if (trim($mailpatient)=="") {
    //récupération des inforamtions sur le pere
    $aTableauInfoPere = $objClassGenerique->renvoi_info_parent($aTableauInfoRDV[0]['idpatient_user']);
    $mailpatient = $aTableauInfoPere[0]['email_user'];
}

/*
*	Si aucun RDV ne correspond à la rechercher
*/
if (empty($aTableauInfoRDV)) {
    $sRecapHtml="<h2 align='center'>Aucun Rendez ne correspond à votre recherche</h2>";

    if ($prov=="tel") {
        $aTableauResult=array();
        $aTableauResult['result']="0";
        $aTableauResult['Message']="Aucun Rendez ne correspond à votre recherche";
        echo json_encode($aTableauResult);
    } else {
        echo $sRecapHtml;
    }

    $action="";
    exit();
}

/*
*Si le RDV est déjà supprimé
*/
if ($aTableauInfoRDV[0]['supplogique_prise_rendez_vous']=="Y") {
    $sRecapHtml  =  $objClassGenerique->mail_recap_html_rdv(
        $aTableauInfoRDV[0]['id_prise_rendez_vous']
        ,
        $aTableauInfoRDV[0]['idpatient_user'],
        "attente",
        " a déjà été supprimé",
        true,
        "emailannulerdv"
    );
    
    if ($prov=="tel") {
        $aTableauResult=array();
        $aTableauResult['result']="3";
        $aTableauResult['Message']="Ce Rendez vous a déjà été supprimé";
        echo json_encode($aTableauResult);
    } else {
        echo $sRecapHtml;
    }
    
    $action="sdfsdfsdfsdsdf";
}
/*
*Si le RDV est déjà validé
*/
elseif ($aTableauInfoRDV[0]['validdeplace_prise_rendez_vous']=="ok") {
    $sRecapHtml  =  $objClassGenerique->mail_recap_html_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous'], $aTableauInfoRDV[0]['idpatient_user'], "confirme", " a déjà été confirmé");
    
    if ($prov=="tel") {
        $aTableauResult=array();
        $aTableauResult['result']="1";
        $aTableauResult['Message']="Ce Rendez vous a déjà été confirmé";
        echo json_encode($aTableauResult);
    } else {
        echo $sRecapHtml;
    }
    
    $action="ddfsdfsdfsdfsdfsdfsdf";
} else {
    $vide="";
}
/*
*Action de confirmation du RRDV
*/

if ($action=="1") {

    //confirmation du RDV dans la base de donnée
    $sRequete_update ="UPDATE alaxione_prise_rendez_vous
	SET validdeplace_prise_rendez_vous='ok',datemodif_prise_rendez_vous=now(),
	remarque_prise_rendez_vous='".str_replace('***rdv en attente de validation***', '***RDV confirmé***', $aTableauInfoRDV[0]['remarque_prise_rendez_vous'])."'
	where  identification_rdv='$idrdv'";

    $objClassGenerique->executionRequeteId($sRequete_update);
    $sRecapHtml  =  $objClassGenerique->mail_recap_html_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous'], $aTableauInfoRDV[0]['idpatient_user']);
    


    //MAJ du rendez vous dans un module esxterne s'il existe
    $aTableauInfoPatientRDV=$objClassGenerique->renvoi_info_rdv($idrdv, "identification_rdv");

    if (trim($aTableauInfoPatientRDV[0]['telmobilepatient'])=="") {
        $stel=$aTableauInfoPatientRDV[0]['telfixepatient'];
    } else {
        $stel=$aTableauInfoPatientRDV[0]['telmobilepatient'];
    }

    $aTabPatient=array();
    $aTabPatient['sexe']=$aTableauInfoPatientRDV[0]['patientabrciviliteoplus'];
    $aTabPatient['nom']=$aTableauInfoPatientRDV[0]['nompatient'];
    $aTabPatient['prenom']=$aTableauInfoPatientRDV[0]['prenompatient'];
    $aTabPatient['adresse']=$aTableauInfoPatientRDV[0]['adressepatient'];
    $aTabPatient['adresse2']='';
    $aTabPatient['tel']=$stel;
    $aTabPatient['cp']=$aTableauInfoPatientRDV[0]['codepostalpatient'];
    $aTabPatient['identifiant_module_externe_user']=$aTableauInfoPatientRDV[0]['identifiantexternepatient'];
    $aTabPatient['ville']=$aTableauInfoPatientRDV[0]['villepatient'];
    $aTabPatient['idpatient']=$aTableauInfoPatientRDV[0]['idpatient_user'];
    $atabpatient['naissance']=$aTableauInfoRDV[0]['datenaissance'];
    $aTabPatient['mail']=$aTableauInfoPatientRDV[0]['email_user'];//suppression du rendez vous
    $aTabPatient['note']=str_replace('***rdv en attente de validation***', '***RDV confirmé***', $aTableauInfoRDV[0]['remarque_prise_rendez_vous']);//suppression du rendez vous

    $idlieu=$aTableauInfoPatientRDV[0]['id_lieux'];
    $daterdv=$aTableauInfoPatientRDV[0]['daterdv'];
    $heuredebut=$aTableauInfoPatientRDV[0]['heurereel'];
    $iddocteur=$aTableauInfoPatientRDV[0]['iddocteur_user'];

    //récupération idenifiant_user
    $sRequete_info_docteur="SELECT identifiant_user FROM alaxione_user where id_user=".$aTableauInfoRDV[0]['iddocteur_user'];
    $aTableauInfDocteur =  $objClassGenerique->renvoi_info_requete($sRequete_info_docteur);
    $identifiantdocteur =$aTableauInfDocteur[0]['identifiant_user'];

    $idtyperdv=$aTableauInfoPatientRDV[0]['id_type_rdv'];

    $aTableauReservModuleExterne  = $objClassGenerique->enregistrement_modification_module_externe(
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
    $aTableauLog['user'] ='patient';
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
    $aTableauLog['entite'] =$_COOKIE['AlaxioneAutreCentre'];
    $aTableauLog['commentaire'] =$commentaireLog;

    $objClassGenerique->push_trace_objet($aTableauLog);

    if ($prov=="tel") {
        $aTableauResult=array();
        $aTableauResult['result']="2";
        $aTableauResult['Message']="Votre Rendez vous est confirmé";
        echo json_encode($aTableauResult);
        //mise à jour depalcer
        $sRequete_update ="UPDATE alaxione_prise_rendez_vous set provenance_saisi_prise_rendez_vous='deplacer' where identification_rdv='".$idrdv."'";
        $objClassGenerique->executionRequete($sRequete_update);
    } else {
        echo $sRecapHtml;
        //$objClassGenerique->envoi_mail_recap_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous'], $aTableauInfoRDV[0]['idpatient_user']);
        //$objClassGenerique->envoi_sms_recap_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous']);
        $sRequete_update ="UPDATE alaxione_prise_rendez_vous set provenance_saisi_prise_rendez_vous='deplacer' where identification_rdv='".$idrdv."'";
        $objClassGenerique->executionRequete($sRequete_update);
        exit();
    }
}
//si sms

if ($action==6) {
    $aTableauModif=array();

    $aTableauRetourGenre = $objClassGenerique->renvoi_genre_user($iddocteur);
    $atableauInfoLieu = $objClassGenerique->renvoi_info_lieu($idlieu);

    $aTableauHtmlRecapRdv = $objClassGenerique->renvoi_htm_info_recap($idrdvdepalcer);

    
    //formatage pour envoyer les mails sujetmaildepalcement<linksup>
    $aTableauModif[]=array("id"=>"<rdvseul>","valeur"=>$objClassGenerique->renvoi_jour_mois_format_v2($objClassGenerique->renvoi_date($dateancien, "fr"))." à ".substr($heureancien, 0, 5));
    $aTableauModif[]=array("id"=>"<rdseulnew>","valeur"=>$objClassGenerique->renvoi_jour_mois_format_v2($objClassGenerique->renvoi_date($datenouveau, "fr"))." à ".substr($heurenouveau, 0, 5));
    $aTableauModif[]=array("id"=>"<photo>","valeur"=>$aTableauHtmlRecapRdv[0]['photo']);
    $aTableauModif[]=array("id"=>"<recap_info>","valeur"=>$aTableauHtmlRecapRdv[0]['recap_info']);
    $aTableauModif[]=array("id"=>"<info_importante>","valeur"=>$aTableauHtmlRecapRdv[0]['info_importante']);
    $aTableauModif[]=array("id"=>"<recap_mdr>","valeur"=>$aTableauHtmlRecapRdv[0]['recap_mdr']);
    $aTableauModif[]=array("id"=>"<docteur>","valeur"=>$aTableauRetourGenre['abr']." ".$nomdocteur);
    $aTableauModif[]=array("id"=>"<nomdocteur>","valeur"=>$aTableauRetourGenre['abr']." ".$nomdocteur);
    $aTableauModif[]=array("id"=>"<link>","valeur"=>$identifiantrdv);
    $aTableauModif[]=array("id"=>"<linksup>","valeur"=>str_replace("action=1", "action=2", $identifiantrdv));//str_replace("action=1","action=2",$identifiantrdv)
    $aTableauModif[]=array("id"=>"<numerocentre>","valeur"=>$atableauInfoLieu[0]['tel_lieux']);
    $aTableauModif[]=array("id"=>"<numerocentre>","valeur"=>$atableauInfoLieu[0]['tel_lieux']);
    $aTableauModif[]=array("id"=>"<messageentete>","valeur"=>" est en attente de confirmation");
    $aTableauModif[]=array("id"=>"<mailcentre>","valeur"=>$atableauInfoLieu[0]['email_mail_lieux']);
    $aTableauModif[]=array("id"=>"<tel_service>","valeur"=>$aTableauHtmlRecapRdv[0]['tel_service']);
    $aTableauModif[]=array("id"=>"<nom_service>","valeur"=>$aTableauHtmlRecapRdv[0]['nom_service']);

    $mailpatient=$aTableauHtmlRecapRdv[0]['email_user'];

    $sMessage = $objClassGenerique->renvoi_message_format("maildeplacementrdv", $aTableauModif);

    //configuration email envoi
    $aTableauModif=array();
    $aTableauModif[]=array("id"=>"<rdvseul>","valeur"=>$objClassGenerique->renvoi_jour_mois_format_v2($objClassGenerique->renvoi_date($dateancien, "fr"))." à ".substr($heureancien, 0, 5));
    $aTableauModif[]=array("id"=>"<docteur>","valeur"=>$aTableauRetourGenre['abr']." ".$nomdocteur);

    $sSujetMailDeplacementRdv = $objClassGenerique->renvoi_message_format("sujetmaildepalcement", $aTableauModif);

    
    $from = $atableauInfoLieu[0]['email_mail_lieux'];
    $retmail = $objClassGenerique->envoi_mail_html_alaxione($mailpatient, $sMessage, $sSujetMailDeplacementRdv, $from);

    $aTableauModif=array();
    $aTableauModif[]=array("id"=>"<nom>","valeur"=>$genre." ".$nompatient);
    $aTableauModif[]=array("id"=>"<nomdocteur>","valeur"=>$aTableauRetourGenre['abr']." ".$nomdocteur);
    $aTableauModif[]=array("id"=>"<jour>","valeur"=>$objClassGenerique->renvoi_date($dateancien, "fr"));
    $aTableauModif[]=array("id"=>"<heure>","valeur"=>substr($heureancien, 0, 5));
    $aTableauModif[]=array("id"=>"<jour2>","valeur"=>$objClassGenerique->renvoi_date($datenouveau, "fr"));
    $aTableauModif[]=array("id"=>"<heure2>","valeur"=>substr($heurenouveau, 0, 5));
    $aTableauModif[]=array("id"=>"<lieu>","valeur"=>$atableauInfoLieu[0]['nom_sms_lieu']);
    $aTableauModif[]=array("id"=>"<likndeplacement>","valeur"=>$identifiantrdv);
    $aTableauModif[]=array("id"=>"<likndepllacrefuser>","valeur"=>str_replace("action=1", "action=6", $identifiantrdv));

    $sSmsDeplacementRdv = $objClassGenerique->renvoi_message_format("smsconfirmeationdeplacment", $aTableauModif);
    $bResult = $objClassGenerique->envoi_sms_alaxione($sSmsDeplacementRdv, $identite, $teldeplacement, "", "", 1, false, $aTableauInfoRDV[0]['identification_rdv'], $aTableauInfoRDV[0]['identiant_user']);

    echo $sMessage;
    exit();
}
/*
*Action de demande d'annulation du déplacement
*/

if ($action==2) {
    $sRecapHtml  =  $objClassGenerique->mail_recap_html_rdv(
        $aTableauInfoRDV[0]['id_prise_rendez_vous'],
        $aTableauInfoRDV[0]['idpatient_user'],
        "attente",
        " est en attente de confirmation"
    );
    echo $sRecapHtml;
}


/*
*Action annulation du RDV
*/

if ($action=="3") {
    $aTableauResult = $objBackoffice->suppression_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous']);
    if ($aTableauResult['result']) {
        $sRecapHtml  =  $objClassGenerique->mail_recap_html_rdv(
            $aTableauInfoRDV[0]['id_prise_rendez_vous'],
            $aTableauInfoRDV[0]['idpatient_user'],
            "attente",
            " a bien été supprimé",
            false,
            "emailannulerdv"
        );

        

        echo $sRecapHtml;
        $objClassGenerique->envoi_mail_suppression_rdv($aTableauInfoRDV[0]['idparent_deplace_prise_rendez_vous']);
    }
}

if ($action=="4") {

    $aTableauResult = $objBackoffice->suppression_rdv($aTableauInfoRDV[0]['id_prise_rendez_vous']);

    $aTableauRecap = $objClassGenerique->renvoi_htm_info_recap($aTableauInfoRDV[0]['id_prise_rendez_vous']);

    echo "<script <script type='text/javascript'>location.replace('".$aTableauRecap[0]['linkpage_lieux']."')</script>";
    $objClassGenerique->envoi_mail_suppression_rdv($aTableauInfoRDV[0]['idparent_deplace_prise_rendez_vous']);
}
