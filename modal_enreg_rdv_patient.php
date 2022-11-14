<?php

header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sun, 29 Jul 2012 00:00:00 GMT"); // some day in the past

ini_set("display_errors", "ON");

include_once('class/class_alaxione.php');
include_once('class/class_oplus.php');
include_once('class/class_backoffice.php');

$sCookieAdv = '';
if (isset($_COOKIE['cookie_alaxione'])) {
    $sCookieAdv = $_COOKIE['cookie_alaxione'];
}

require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');

$objClassGenerique = new class_alaxione('', '', '');

$bDroit = $objClassGenerique->verificationConnexion(1, $sCookieAdv);
$objClassGenerique->redirection_centre($_COOKIE['AlaxioneAutreCentre']);

if (!$bDroit) {
    echo "<h2 align='center'>Votre connexion a expiré reconnectez vous</h2>";
    exit();
}


//récupération des infomations passée en post
$aVariable = array("id_patient", "validation","civilite_mod_up","nom_mod_up", "prenom_mod_up", "adresse_mod_up","heurepatient","idaff_nom", "idaff_prenon",
                        "email_mod_up", "tel_mod_up", "nom_fille_mod_up", "date_naissance_mod_up", "num_secu_mod_up","prenom","email",
                        "tel_fixe_mod_up", "code_postal_mod_up", "ville_mod_up","ladate","telport","telfixe","datenaissance",
                        "ville_medecin_mod_up", "profession_mod_up", "selectassurance", "medecin_traitant_mod_up","idrdv","iddocteur",
                        "ladate","heuredebut","heurefin","idtyperdv","idpatient","tpsconsultation","idlieu","nbrpersonne","nom",
                        "medecintrait","remarque","etape","genre","idcalendar","ladaterdv");


for ($i=0;$i<count($aVariable);$i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = $_GET[$aVariable[$i]];
    } else {
        ${$aVariable[$i]} = "";
    }
}

$bsucess=false;
$sMessageSucess="";
$berror=false;
$sMessageError="";
$bpasse=true;
$bwarming=false;
$sMessagewarning="";

$bremplacant = "";
$smessageremplacant="";

$objBackoffice = new class_backoffice();

$sMessagewarming="";

if ($validation=="ok" and ($idpatient=="" or $idpatient=="0")) {
    //verifier qu'il y a pas deja un patient avec ce même numero ou mail

    if ($etape==1) {
        $btest=false;
        $aTableauVerfiClient=array();
        $sRquete_select_verif ="select nom_user,prenom_user,email_user,tel_mobile_user from 
		alaxione_user where  ";
        
        if (trim($email)!="") {
            $sRquete_select_verif.="(  email_user='".$email."' ";
            $btest=true;
        }

        if (trim($telport)!="") {
            if ($btest) {
                $sRquete_select_verif.=" or ";
            } else {
                $sRquete_select_verif.="( ";
            }

            $sRquete_select_verif.="  tel_mobile_user='".$telport."' ";
            $btest=true;
        }

        if ($btest) {
            $sRquete_select_verif.=" ) ";
        }

        $sRquete_select_verif.=" and identifiant_entite='".$objClassGenerique->identifiant_entite."' and user_supplogique='N'";

        if ($btest) {
            $aTableauVerfiClient = $objClassGenerique->renvoi_info_requete($sRquete_select_verif);
        }

        if (!empty($aTableauVerfiClient)) {
            $bwarming=true;
            $sMessagewarning.= "Risque de conflit avec le mail ou le téléphone mobile de <br>";
            foreach ($aTableauVerfiClient as $valeurclient) {
                $sMessagewarning.= "".$valeurclient['prenom_user']." ".$valeurclient['nom_user'].
                " ".$valeurclient['email_user']." ".$valeurclient['tel_mobile_user']."<br>";
            }

            $sMessagewarning.="<center><button type='button' onclick=\"document.getElementById('id_etape').value='2';submit()\">Forcer la création de ce contact</button></center>";
            $validation="";
        }
    }
}


if ($validation=="ok") {
    if (!$objClassGenerique->isTime($heuredebut.":00")) {
        $validation="";
        $bwarming=true;
        $sMessagewarning.= "Votre heure du rendez vous n'est pas valide<br>";
    }
}

function ucname($string)
{
    $string =ucwords(strtolower($string));

    foreach (array('-', '\'') as $delimiter) {
        if (strpos($string, $delimiter)!==false) {
            $string =implode($delimiter, array_map('ucfirst', explode($delimiter, $string)));
        }
    }
    return $string;
}

if ($validation=="ok") {

    //creation du patient si ce n'est pas un selection
    if ($idpatient=="" or $idpatient=="0") {

        //Mettre le nom en majuscule et prenom first letter
        $idaff_nom = mb_strtoupper($idaff_nom, 'UTF-8');
        $nom_fille_mod_up = mb_strtoupper($nom_fille_mod_up, 'UTF-8');
        $prenom_mod_up = ucname($prenom_mod_up);
        $idaff_prenon = ucname($idaff_prenon);

        $idaff_nom = addslashes($idaff_nom);
        $nom_fille_mod_up = addslashes($nom_fille_mod_up);
        $prenom_mod_up = addslashes($prenom_mod_up);
        $idaff_prenon = addslashes($idaff_prenon);

        $idpatient = $objBackoffice->enregistrment_patient(
            $idaff_nom,
            $idaff_prenon,
            $nom_fille_mod_up,
            $genre,
            $code_postal_mod_up
            ,
            $ville_mod_up,
            $adresse_mod_up,
            $telport,
            $telfixe,
            $email,
            $objClassGenerique->renvoi_date($datenaissance, "eng"),
            $num_secu_mod_up,
            $selectassurance,
            $medecintrait,
            $ville_medecin_mod_up,
            $profession_mod_up,
            $remarque,
            $objClassGenerique->identifiant_entite,
            $objClassGenerique->id_user,
            $civilite_mod_up
        );
    }

    if ($idpatient!="" and $idpatient!=0) {
        $aTableauRetour =array();
        $aTableauRetour['result']=true;
        $aTableauRetour['idrdv']=0;
        $aTableauRetour['erreur']="";

        
        
        //***********************récupération des informations sur le patient
        $sRequete_info_patient ="SELECT nom_user,
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
		id_civilite,
		profession_user,
		abreviation_civilite, 
		id_user
		FROM alaxione_user 
		left join alaxione_civilite on alaxione_civilite.id_civilite = alaxione_user.id_civilite
		where id_user='$idpatient'";

        $aTableauPatient = $objClassGenerique->renvoi_info_requete($sRequete_info_patient);

        $atabpatient['sexe']=$aTableauPatient[0]['abreviation_civilite'];
        $atabpatient['nom']=$aTableauPatient[0]['nom_user'];
        $atabpatient['prenom']=$aTableauPatient[0]['prenom_user'];
        $atabpatient['num_securite_sociale_user']=$aTableauPatient[0]['num_securite_sociale_user'];
        $atabpatient['nom_jeune_fille_user']=$aTableauPatient[0]['nom_jeune_fille_user'];
        $atabpatient['identifiant_module_externe_user']=$aTableauPatient[0]['identifiant_module_externe_user'];
        $atabpatient['id_civilite']=$aTableauPatient[0]['id_civilite'];
        $atabpatient['profession_user']=$aTableauPatient[0]['profession_user'];
        $atabpatient['naissance']=$aTableauPatient[0]['datenaissance'];
        $atabpatient['adresse']=$aTableauPatient[0]['adresse_user'];
        $atabpatient['adresse2']="";
        $atabpatient['tel']=$aTableauPatient[0]['tel_mobile_user'];
        $atabpatient['cp']=$aTableauPatient[0]['code_postal_user'];
        $atabpatient['ville']=$aTableauPatient[0]['ville_user'];
        $atabpatient['mail']=$aTableauPatient[0]['email_user'];
        $atabpatient['note']=$remarque;
        $atabpatient['idpatient']=$aTableauPatient[0]['id_user'];

        $aTableauRetour = $objClassGenerique->enregistrement_modification_module_externe($idlieu, $ladate, $heuredebut, $iddocteur, $idtyperdv, $atabpatient, "C", 0);

        if ($aTableauRetour['result']) {
            $bresult = $objBackoffice->enregsitrement_rendez_vous(
                $idlieu,
                $idtyperdv,
                $objClassGenerique->renvoi_date($ladate, "eng"),
                $heuredebut,
                $tpsconsultation,
                $iddocteur,
                $idpatient,
                $nbrpersonne,
                $objClassGenerique->rajout_guid_user($objClassGenerique->id_user),
                0,
                '',
                '',
                '',
                $aTableauRetour['idrdv'],
                $heurepatient,
                $objClassGenerique->identifiant_entite,
                $objClassGenerique->rajout_guid_user($objClassGenerique->id_user),
                $remarque,
                "interne"
            );

            if ($bresult['success'] ==1) {
                $bpasse=false;
                $bsucess=true;
                $sMessageSucess="Enregistrment du Rendez vous réussie";
                if ($objClassGenerique->Email_Is_Valide($aTableauPatient[0]['email_user'])) {
                    $objClassGenerique->envoi_mail_recap_rdv($bresult['idrdv'], $idpatient);
                }
            } else {
                $berror=true;
                //$sMessageError="Problème survenue pendant l'enregistrement du Rendez vous ".$aTableauRetour['erreur'];
                $sMessageError="Ce rendez vous n'est plus disponible";
            }
        } else {
            //quand nous avons un problème avec un module externe on bloque le rdv dans l'algo
            if ($aTableauRetour['result']== false and $aTableauRetour['connexion']=="ok") {
                $atableaudecoupedate =explode("/", $ladate);
                $aTableaudecoupeheure =explode(":", $heuredebut);
                    
                $heurefin = date('H:i:00', mktime(
                    $aTableaudecoupeheure[0],
                    $aTableaudecoupeheure[1]+$tpsconsultation,
                    0,
                    $atableaudecoupedate[1],
                    $atableaudecoupedate[0],
                    $atableaudecoupedate[2]
                ));

                $objClassGenerique->ecriture_algo_en_dur_rdv($heuredebut, $heurefin, $objClassGenerique->renvoi_date($ladate, 'eng'), $iddocteur, 3);
            }

            $berror=true;
            $sMessageError="Ce rendez vous n'est plus disponible";
        }
    }
}


//***********************recupération de la liste des status
$sRequete_liste_status ="select nom_champ_vrac,	identifiant_champ_vrac,valeur_champ_vrac from outil_champ_vrac where filtre_champ_vrac='liststatusrdv'";
$aTableauListeStatut = $objClassGenerique->renvoi_info_requete($sRequete_liste_status);

//***********************recupération de la liste des types de RDV disponible dans le planning
$requete_liste_type_rdv = "SELECT libelle_type_rdv, id_type_rdv
FROM alaxione_type_rdv
WHERE identifiant_entite='".$objClassGenerique->identifiant_entite."'
and type_rdv_supplogique='N' and id_type_rdv in (SELECT alaxione_type_rdv_dispo.id_type_rdv FROM  alaxione_type_rdv_dispo
inner join alaxione_plannig_dispo on alaxione_plannig_dispo.id_plannig_dispo = alaxione_type_rdv_dispo.id_plannig_dispo
inner join alaxione_lieu_user on  alaxione_lieu_user.id_lieu_user = alaxione_plannig_dispo.id_lieu_user
where supplogique_type_rdv_dispo='N' and suplogique_plannig_dispo='N' and alaxione_lieu_user.id_user='$iddocteur' 
and date_debut_plannig_dispo='".$objClassGenerique->renvoi_date($ladate, "eng")."' and '".$heuredebut.":01' between heure_debut_plannig_dispo and heure_fin_plannig_dispo )
order by libelle_type_rdv";


$aTableauListeTypeRDV = $objClassGenerique->renvoi_info_requete($requete_liste_type_rdv);
$sFiltreRdvvAff="('0'";

if (!empty($aTableauListeTypeRDV)) {
    $u=0;
    foreach ($aTableauListeTypeRDV as $valeurtyperdv) {
        $aTableauTpsRDV = $objClassGenerique->renvoi_temps_type_rdv($valeurtyperdv['id_type_rdv'], $iddocteur, $idlieu);
        $tpsconsultation=$aTableauTpsRDV['temps'];
        $aTableauListeTypeRDV[$u]['tmprdv'] = $tpsconsultation;
        $aTableauListeTypeRDV[$u]['libelle_type_rdv'] = addslashes($aTableauListeTypeRDV[$u]['libelle_type_rdv']);
        $u++;
        $sFiltreRdvvAff.=",'".$valeurtyperdv['id_type_rdv']."'";
    }
}
$sFiltreRdvvAff.=")";

//*****************récupération des autres rdv qui ne sont pas dans le planning
$requete_liste_type_rdv = "SELECT libelle_type_rdv,alaxione_type_rdv.id_type_rdv
FROM alaxione_type_rdv
inner join alaxione_type_rdv_dispo on alaxione_type_rdv_dispo.id_type_rdv = alaxione_type_rdv.id_type_rdv
inner join alaxione_plannig_dispo on alaxione_plannig_dispo.id_plannig_dispo = alaxione_type_rdv_dispo.id_plannig_dispo
WHERE alaxione_type_rdv.identifiant_entite='".$objClassGenerique->identifiant_entite."'
and type_rdv_supplogique='N' and date_debut_plannig_dispo>now() and alaxione_type_rdv.id_type_rdv not in ".$sFiltreRdvvAff."
 group by  alaxione_type_rdv.id_type_rdv  order by libelle_type_rdv";

$aTableauListeTypeAutreRDV = $objClassGenerique->renvoi_info_requete($requete_liste_type_rdv);

if (!empty($aTableauListeTypeAutreRDV)) {
    $u=0;
    foreach ($aTableauListeTypeAutreRDV as $valeurtyperdv) {
        $aTableauTpsRDV = $objClassGenerique->renvoi_temps_type_rdv($valeurtyperdv['id_type_rdv'], $iddocteur, $idlieu);
        $tpsconsultation=$aTableauTpsRDV['temps'];
        $aTableauListeTypeAutreRDV[$u]['tmprdv'] = $tpsconsultation;
        $aTableauListeTypeAutreRDV[$u]['libelle_type_rdv'] = addslashes($aTableauListeTypeAutreRDV[$u]['libelle_type_rdv']);
        $u++;
    }
}

//***********************recupération de la liste des lieu de RDV
$requete_liste_lieu = "SELECT nom_lieux, id_lieux FROM  alaxione_lieux WHERE identifiant_entite='".$objClassGenerique->identifiant_entite."' 
and lieux_supplogique='N'";
$aTabLieu = $objClassGenerique->renvoi_info_requete($requete_liste_lieu);

if ($idlieu=="") {
    $requete_liste_lieu_defaut = "SELECT nom_lieux, id_lieux FROM  alaxione_lieux WHERE identifiant_entite='".$objClassGenerique->identifiant_entite."' 
	and lieux_supplogique='N' and defaut_synchro_lieu='Y'";

    $aTabLieuDefaut = $objClassGenerique->renvoi_info_requete($requete_liste_lieu_defaut);

    if (!empty($aTabLieuDefaut)) {
        $idlieu = $aTabLieuDefaut[0]['id_lieux'];
    } else {
        $idlieu = $aTabLieu[0]['id_lieux'];
    }
}

//***************************récupération des praticiens*******************
$sRequete_praticien ="select nom_user,
prenom_user,
id_user,
nom_cvilite	,
abreviation_civilite,
nom_profession,
abr_proffession,
derternimant_proffesion,
nom_affiche_profession
FROM  alaxione_user
LEFT JOIN alaxione_civilite on alaxione_civilite.id_civilite = alaxione_user.id_civilite
LEFT JOIN alaxione_profession  on alaxione_profession.id_profession = alaxione_user.id_profession
where user_supplogique='N' and identifiant_entite='".$objClassGenerique->identifiant_entite."'
and type_user='USER' order by prenom_user,nom_user";

$aTableauPraticien =  $objClassGenerique->renvoi_info_requete($sRequete_praticien);

// on indexe ici les informations du docteur qui est en cours
$aTableauDocteurEncour=array();

if (!empty($aTableauPraticien)) {
    foreach ($aTableauPraticien as $valeur) {
        if ($valeur['id_user']==$iddocteur) {
            $aTableauDocteurEncour=$valeur;
        }
    }
}

$TabHisto=array();
//***************************************récupération des minutes******************
$atabtpsConsult=array();

for ($i=1; $i <=30 ; $i++) {
    $atabtpsConsult[]=array('value'=>$i,'nom'=>$i." min");
}

$atabtpsConsult[] = array('value'=>"35", 'nom'=>"35 min");
$atabtpsConsult[] = array('value'=>"40", 'nom'=>"40 min");
$atabtpsConsult[] = array('value'=>"45", 'nom'=>"45 min");
$atabtpsConsult[] = array('value'=>"50", 'nom'=>"50 min");
$atabtpsConsult[] = array('value'=>"55", 'nom'=>"55 min");
$atabtpsConsult[] = array('value'=>"60", 'nom'=>"60 min");
$atabtpsConsult[] = array('value'=>"70", 'nom'=>"70 min");
$atabtpsConsult[] = array('value'=>"80", 'nom'=>"80 min");
$atabtpsConsult[] = array('value'=>"90", 'nom'=>"90 min");
$atabtpsConsult[] = array('value'=>"100", 'nom'=>"100 min");
$atabtpsConsult[] = array('value'=>"110", 'nom'=>"110 min");
$atabtpsConsult[] = array('value'=>"120", 'nom'=>"120 min (2h)");
$atabtpsConsult[] = array('value'=>"150", 'nom'=>"150 min");
$atabtpsConsult[] = array('value'=>"180", 'nom'=>"180 min (3h)");
$atabtpsConsult[] = array('value'=>"210", 'nom'=>"210 min");
$atabtpsConsult[] = array('value'=>"240", 'nom'=>"240 min (4h)");
$atabtpsConsult[] = array('value'=>"270", 'nom'=>"270 min");
$atabtpsConsult[] = array('value'=>"300", 'nom'=>"300 min (5h)");
$atabtpsConsult[] = array('value'=>"330", 'nom'=>"330 min");
$atabtpsConsult[] = array('value'=>"360", 'nom'=>"360 min (6h)");
$atabtpsConsult[] = array('value'=>"420", 'nom'=>"420 min (7h)");
$atabtpsConsult[] = array('value'=>"480", 'nom'=>"480 min (8h)");
$atabtpsConsult[] = array('value'=>"540", 'nom'=>"540 min (9h)");
$atabtpsConsult[] = array('value'=>"600", 'nom'=>"600 min (10h)");
$atabtpsConsult[] = array('value'=>"660", 'nom'=>"660 min (11h)");
$atabtpsConsult[] = array('value'=>"720", 'nom'=>"720 min (12h)");


$TabInfoRDV = $objBackoffice->get_info_rdv($idrdv);

$aTableauTpsRDV = $objClassGenerique->renvoi_temps_type_rdv($idtyperdv, $iddocteur, $idlieu);
$tpsconsultation=$aTableauTpsRDV['temps'];

if ($idtyperdv!="") {
    $heurepatient= $objClassGenerique->renvoi_heure_debut($heuredebut, $aTableauTpsRDV['decalage'], $aTableauTpsRDV['tranche_horaire']);
} else {
    $heurepatient = $heuredebut;
}

// on regarde ici les different blocage appliqué au centre
$bblocagetyperdv=false;
$boplus=false;
$bblocageall=false;

$TableauBlocage=$objClassGenerique->different_blocage_centet($objClassGenerique->identifiant_entite);

if ($TableauBlocage['module_externe']!="") {
    $boplus=true;
    $bblocagetyperdv=true;
    $bblocageall=true;
}

if ($TableauBlocage['niveau_blogage']=="rdv") {
    $bblocagetyperdv=true;
}

if ($TableauBlocage['niveau_blogage']=="total") {
    $bblocagetyperdv=true;
    $bblocageall=true;
}


$tabListeCivilite = $objBackoffice->liste_civilite();

$binterpro=false;
if ($objClassGenerique->idinterpro!=0) {
    $binterpro=true;
}

 //version de preprod
//on regarde si il ya un remplaçant posiitionné sur ce rdv
$aTabParam_remplacant=array();
$aTabParam_remplacant['identifiant_user']=$objClassGenerique->rajout_guid_user($iddocteur);
$aTabParam_remplacant['date_rdv']=$objClassGenerique->renvoi_date($ladate, "eng");
$aTabParam_remplacant['bdebug']=false;
$aTabParam_remplacant['heure_debut_rdv']=$heuredebut;

$aTableauRemplacant = $objClassGenerique->renvoi_remplacant($aTabParam_remplacant);
$bremplacant=false;
$smessageremplacant ="";

if (!empty($aTableauRemplacant)) {
    $bremplacant=true;
    $aTableauModif=array();
    $aTableauModif[] = array( "id" => "<nomremplacant>", "valeur" =>$aTableauRemplacant[0]['abreviation_civilite']." ".$aTableauRemplacant[0]['nom_user']);
    $aTableauModif[] = array( "id" => "<nomdocteur>", "valeur" =>$aTableauDocteurEncour['abreviation_civilite'].' '.$aTableauDocteurEncour['nom_user']);
    $smessageremplacant =   $sMessage = $objClassGenerique->renvoi_message_format("textaffremplacant", $aTableauModif);
}


$objSmarty->assign("bremplacant", $bremplacant);
$objSmarty->assign("smessageremplacant", $smessageremplacant);
$objSmarty->assign("tabListeCivilite", $tabListeCivilite);
$objSmarty->assign("binterpro", $binterpro);
$objSmarty->assign("idaff_nom", $idaff_nom);
$objSmarty->assign("boplus", $boplus);
$objSmarty->assign("bblocageall", $bblocageall);
$objSmarty->assign("bblocagetyperdv", $bblocagetyperdv);
$objSmarty->assign("heurepatient", $heurepatient);
$objSmarty->assign("genre", $genre);
$objSmarty->assign("adresse_mod_up", $adresse_mod_up);
$objSmarty->assign("remarque", $remarque);
$objSmarty->assign("profession_mod_up", $profession_mod_up);
$objSmarty->assign("ville_medecin_mod_up", $ville_medecin_mod_up);
$objSmarty->assign("medecintrait", $medecintrait);
$objSmarty->assign("num_secu_mod_up", $num_secu_mod_up);
$objSmarty->assign("datenaissance", $datenaissance);
$objSmarty->assign("email", $email);
$objSmarty->assign("telfixe", $telfixe);
$objSmarty->assign("telport", $telport);
$objSmarty->assign("ville_mod_up", $ville_mod_up);
$objSmarty->assign("code_postal_mod_up", $code_postal_mod_up);
$objSmarty->assign("nom_fille_mod_up", $nom_fille_mod_up);
$objSmarty->assign("prenom", $prenom);
$objSmarty->assign("nom", $idaff_nom);
$objSmarty->assign("idtyperdv", $idtyperdv);
$objSmarty->assign("bwarming", $bwarming);
$objSmarty->assign("sMessagewarning", $sMessagewarning);
$objSmarty->assign("bpasse", $bpasse);
$objSmarty->assign("bsucess", $bsucess);
$objSmarty->assign("sMessageSucess", $sMessageSucess);
$objSmarty->assign("berror", $berror);
$objSmarty->assign("sMessageError", $sMessageError);
$objSmarty->assign("idlieu", $idlieu);
$objSmarty->assign("tpsconsultation", $tpsconsultation);
$objSmarty->assign("atabtpsConsult", $atabtpsConsult);
$objSmarty->assign("ladate", $ladate);
$objSmarty->assign("heuredebut", $heuredebut);
$objSmarty->assign("heurefin", $heurefin);
$objSmarty->assign("iddocteur", $iddocteur);
$objSmarty->assign("atabPraticien", $aTableauPraticien);
$objSmarty->assign("aTabStatus", $aTableauListeStatut);
$objSmarty->assign("aTabTypeRDV", $aTableauListeTypeRDV);
$objSmarty->assign("TabInfoRDV", $TabInfoRDV);
$objSmarty->assign("TabHisto", $TabHisto);
$objSmarty->assign("aTabLieu", $aTabLieu);

$objSmarty->assign("iduserP", $id_patient);
$objSmarty->assign("id_patient", $id_patient);
$objSmarty->assign("aTableauListeTypeAutreRDV", $aTableauListeTypeAutreRDV);

$objSmarty->assign("idcalendar", $idcalendar);

$objSmarty->assign("bremplacant", $bremplacant);
$objSmarty->assign("smessageremplacant", $smessageremplacant);

$objSmarty->display("modal_enreg_rdv_patient.tpl");
