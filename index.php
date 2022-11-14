<?php
ini_set("display_errors", "On");

session_start();
//ini_set("display_errors","On");
$identifiant = "";
if (isset($_COOKIE['cookie_alaxione'])) {
    $identifiant = $_COOKIE['cookie_alaxione'];
}

include('class/class_alaxione.php');
//include('class/class_generique.php');

require('libs/Smarty.class.php');

$objSmarty = new Smarty();
$objSmarty->setTemplateDir('templates/VersionA/templates');
$objSmarty->setCompileDir('templates/VersionA/templates_c');
$objSmarty->setCacheDir('templates/VersionA/cache');
$objSmarty->setConfigDir('templates/VersionA/configs');


//récupération des infomations passée en post
$aVariable = array( "validation", "log", "pwd", "dir", "centre", "administration","lock" );
for ($i = 0; $i < count($aVariable); $i++) {
    if (isset($_GET[$aVariable[$i]])) {
        ${$aVariable[$i]} = htmlspecialchars($_GET[$aVariable[$i]]);
    } else {
        ${$aVariable[$i]} = "";
    }
}

if (!empty($_POST)) {
    for ($i = 0; $i < count($aVariable); $i++) {
        if (isset($_POST[$aVariable[$i]])) {
            ${$aVariable[$i]} = $_POST[$aVariable[$i]];
        } else {
            ${$aVariable[$i]} = "";
        }
    }
}


if($lock=="ok"){
    session_start();
    $_SESSION['centre']=$administration;
    header("Location:deco.php".$sParams);
}


$time =86400;
$MessageConnexion = "";

$aTableauconnexion = array();
$aTableauconnexion[] = "adminstructure";
$aTableauconnexion[] = "adnimgeneral";
$aTableauconnexion[] = "secretaire";
$aTableauconnexion[] = "praticien";
$aTableauconnexion[] = "interpro";
$aTableauconnexion[] = "operateur";
$aTableauconnexion[] = "secrelimite";
$aTableauconnexion[] = "agendaconsult";
$aTableauconnexion[] = "operateurlimite";
$aTableauconnexion[]="praticienlimite";




if ($validation == 'ok') {
    $objConnexion = new class_alaxione($log, $pwd, "");
    $bConnexion = $objConnexion->verificationConnexion(1, $identifiant, $centre);


    //recupération des groupe créer par le centre
    $aTableauSelectListeGroupe=array();
    $aTableauSelectListeGroupe['identifiant_entite']=$centre;
    $sRequeteSelectListeGroupeCentre ="SELECT identifiantall_groupe FROM alaxione_groupe 
     WHERE identifiant_entite=:identifiant_entite and groupe_supplogique='N'";
    $aTableauListeGroupe = $objConnexion->renvoi_info_requete_new($sRequeteSelectListeGroupeCentre,$aTableauSelectListeGroupe);

    if(!empty($aTableauSelectListeGroupe)){
        foreach($aTableauSelectListeGroupe as $key=>$value){

            $sRequeteSelectListeGroupeCentre=str_replace(":".$key,"'".addslashes($value)."'",$sRequeteSelectListeGroupeCentre);
        }
    }



    if(!empty($aTableauListeGroupe)){
        foreach($aTableauListeGroupe as $valeurGroupe){
            $aTableauconnexion[] = $valeurGroupe['identifiantall_groupe'];
        }
    }




    //session_start();
    if ($bConnexion and in_array($objConnexion->identifiantgroupe, $aTableauconnexion)) {



        $arr_cookie_options = array (
            'Expires' => time() + 86400,
            'path' => '/',
            'domain' => '/', // leading dot for compatibility or use subdomain
            'Secure' => true,     // or false
            'httponly' => true,    // or false
            'SameSite' => 'None' // None || Lax  || Strict
        );

        $guid = $objConnexion->accesdirect;
        $objConnexion->rajout_guid_user($objConnexion->id_user);
        $aDomaine = explode('.', $_SERVER['HTTP_HOST']);
        $objDate = new DateTime(date('Y-m-d H:i:s'));
        $objDate->modify('+1 days');


        header('Set-Cookie: cookie_alaxione='.$guid.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: AlaxioneAutreCentre='.$objConnexion->identifiant_entite.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-idc='.$objConnexion->identifiant_entite.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-login='.$log.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-token='.$guid.';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: x-alx-sdomaine='.$aDomaine[0].';Max-Age='.$time.'; SameSite=None; Secure',false);
        header('Set-Cookie: linkprecedent_alaxione=mon_compte;Max-Age='.$time.'; SameSite=None; Secure',false);

        //$objConnexion->rajout_guid_user($objConnexion->id_user);
        $insert_update = "INSERT alaxione_user_infosup set identifiant_user='".$objConnexion->identifiantuser."',
                            cle_user_infosup='keyaouth',
                            valeur_user_infosup='".$guid."',
                            identifiant_entite='".$objConnexion->identifiant_entite."'
                            ON DUPLICATE KEY update  valeur_user_infosup='".$guid."'";
        $objConnexion->executionRequete($insert_update);

        if ($dir != "") {
            header("Location:main.php?dir=" . $dir);
        } else {
            $sParams = "";
            if (isset($_COOKIE['NUMEROAPPELANT'])) {
                if ($_COOKIE['NUMEROAPPELANT'] != ""){
                    $sParams = "?NUMEROAPPELANT=".$_COOKIE['NUMEROAPPELANT'];
                } else{
                    if (isset($_GET['NUMEROAPPELANT'])){
                        $sParams = "?NUMEROAPPELANT=".$_GET['NUMEROAPPELANT'];
                    }
                }

            }else{
                if (isset($_GET['NUMEROAPPELANT'])){
                    $sParams = "?NUMEROAPPELANT=".$_GET['NUMEROAPPELANT'];
                }
            }

            if (isset($_COOKIE['NUMEROAPPELE'])) {
                if ($_COOKIE['NUMEROAPPELE'] != ""){
                    if ($sParams == ""){
                        $sParams .= "?";
                    }else{
                        $sParams .= "&";
                    }
                    $sParams .= "NUMEROAPPELE=".$_COOKIE['NUMEROAPPELE'];
                } else{
                    if (isset($_GET['NUMEROAPPELE'])){
                        if ($sParams == ""){
                            $sParams .= "?";
                        }else{
                            $sParams .= "&";
                        }
                        $sParams .= "NUMEROAPPELE=".$_GET['NUMEROAPPELE'];
                    }
                }

            }else{
                if (isset($_GET['NUMEROAPPELE'])){
                    if ($sParams == ""){
                        $sParams .= "?";
                    }else{
                        $sParams .= "&";
                    }
                    $sParams .= "NUMEROAPPELE=".$_GET['NUMEROAPPELE'];
                }
            }

            header("Location:main.php".$sParams);
        }
        return false;
    } else {
        $MessageConnexion = "Erreur d'authentification !!";
    }
} else {
    if (isset($_COOKIE['cookie_alaxione']) and trim($_COOKIE['cookie_alaxione']!="")) {
        $objConnexion = new class_alaxione("", "", "");
        $bConnexion = $objConnexion->verificationConnexion(1, $_COOKIE['cookie_alaxione']);
        if (!in_array($objConnexion->identifiantgroupe, $aTableauconnexion)) {
            if($administration != ""){
                header("Location:deco.php?administration=$administration");
            }else{
                header("Location:deco.php");
            }
        }

        if ($bConnexion) {
            $objConnexion->rajout_guid_user($objConnexion->id_user);
            $guid = $objConnexion->guid();
            $insert_update = "INSERT alaxione_user_infosup set identifiant_user='".$objConnexion->identifiantuser."',
                            cle_user_infosup='keyaouth',
                            valeur_user_infosup='".$guid."',
                            identifiant_entite='".$objConnexion->identifiant_entite."'
                            ON DUPLICATE KEY update  suplogique_user_infosup='N'";
            $objConnexion->executionRequete($insert_update);


            if ($dir != "") {
                header("Location:main.php?dir=" . $dir);
            } else {
                $sParams = "";
                if (isset($_COOKIE['NUMEROAPPELANT'])) {
                    if ($_COOKIE['NUMEROAPPELANT'] != ""){
                        $sParams = "?NUMEROAPPELANT=".$_COOKIE['NUMEROAPPELANT'];
                    }else{
                        if (isset($_GET['NUMEROAPPELANT'])){
                            $sParams = "?NUMEROAPPELANT=".$_GET['NUMEROAPPELANT'];
                        }
                    }

                }else{
                    if (isset($_GET['NUMEROAPPELANT'])){
                        $sParams = "?NUMEROAPPELANT=".$_GET['NUMEROAPPELANT'];
                    }
                }

                if (isset($_COOKIE['NUMEROAPPELE'])) {
                    if ($_COOKIE['NUMEROAPPELE'] != ""){
                        if ($sParams == ""){
                            $sParams .= "?";
                        }else{
                            $sParams .= "&";
                        }
                        $sParams .= "NUMEROAPPELE=".$_COOKIE['NUMEROAPPELE'];
                    } else{
                        if (isset($_GET['NUMEROAPPELE'])){
                            if ($sParams == ""){
                                $sParams .= "?";
                            }else{
                                $sParams .= "&";
                            }
                            $sParams .= "NUMEROAPPELE=".$_GET['NUMEROAPPELE'];
                        }
                    }

                }else{
                    if (isset($_GET['NUMEROAPPELE'])){
                        if ($sParams == ""){
                            $sParams .= "?";
                        }else{
                            $sParams .= "&";
                        }
                        $sParams .= "NUMEROAPPELE=".$_GET['NUMEROAPPELE'];
                    }
                }

                header("Location:main.php".$sParams);
            }
        }
    } else {
        $objConnexion = new class_alaxione("", "", "");
        if (!isset($_COOKIE['cookie_alaxione'])) {
            $_COOKIE['cookie_alaxione'] = "";
        }
        $bConnexion = $objConnexion->verificationConnexion(0, $_COOKIE['cookie_alaxione']);
    }
}

if ($administration != "") {
    header('Set-Cookie: cookie_centre='.$administration.';Max-Age='.$time.'; SameSite=None; Secure',false);
} else {
    $administration = "";
    if (isset($_COOKIE['cookie_centre'])) {
        $administration = $_COOKIE['cookie_centre'];
    }
}


if (trim($administration) != "") {
    $sRequete_recupe_centre = "select identifiant_entite,nom_entite from alaxione_entite where entite_supplogique='N'and raccourcir_admin_entite='$administration'";
    $aTabstructure = $objConnexion->renvoi_info_requete($sRequete_recupe_centre);
    if(isset($aTabstructure[0]['identifiant_entite'])) $centre = $aTabstructure[0]['identifiant_entite'];
}

$sRequete_recupe_centre = "select identifiant_entite,nom_entite from alaxione_entite where entite_supplogique='N'";
$aTabstructure = $objConnexion->renvoi_info_requete($sRequete_recupe_centre);

$aTableau_champ = array();
$aTableau_valeur = array();

$objSmarty->assign("sAnneeCopyright", date('Y'));
$objSmarty->assign("leserveur", $sAlaxioneLeServeur);
$objSmarty->assign("centre", $centre);
$objSmarty->assign("MessageConnexion", $MessageConnexion);
$objSmarty->assign("aTabstructure", $aTabstructure);
$objSmarty->assign("sURLSite", "");
$objSmarty->assign("sSite", "Alaxione");
$objSmarty->assign("iLogo", "img/logo-alaxione.png");
$objSmarty->assign("sLostPassword", "update_mdp.php");
$objSmarty->assign("sRegister", "index.php?dir=register");
$objSmarty->assign("sTitleRecupPass", "Récupération de mot de passe");
$objSmarty->assign("sTxtRecupPass", "Mot de passe oublié ?");
$objSmarty->assign("sTxtIdentifiant", "Identifiant");
$objSmarty->assign("sTxtEmail", "Email");
$objSmarty->assign("sTxtMDP", "Mot de passe");
$objSmarty->assign("sTxtSeSouvenir", "Se souvenir de moi");
$objSmarty->assign("sTxtConnecter", "Se connecter");
$objSmarty->assign("sTxtConnexionEnCours", "Connexion en cours...");
$objSmarty->assign("sTxtChampsObligatoire", "Vous devez remplir tous les champs obligatoires");
$objSmarty->assign("sTxtEchec", "Echec !");
$objSmarty->assign("sTxtCreerUnCompte", "CREER UN COMPTE");
$objSmarty->assign("sTxtConnectezVousAVotreCompte", "CONNECTEZ VOUS A VOTRE COMPTE");
$objSmarty->assign("sTxtVerifChampsObligatoire", "Veuillez vérifier les champs obligatoires.");
$objSmarty->assign("dir", $dir);

$objSmarty->display("index.tpl");
