<?php

session_start();
/*unset($_SESSION);
unset($_COOKIE);
session_destroy();*/
if (isset($_GET['administration'])){
    $centre = $_GET["administration"];
}else{
    if (isset($_COOKIE['cookie_centre'])){
        $centre = $_COOKIE["cookie_centre"];
    }
}
header('Set-Cookie: cookie_alaxione=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: AlaxioneAutreCentre=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: x-alx-idc=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: x-alx-login=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: x-alx-token=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: x-alx-sdomaine=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: linkprecedent_alaxione=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: NUMEROAPPELE=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Set-Cookie: NUMEROAPPELANT=;Max-Age='.$time.'; SameSite=None; Secure',false);

header('Location:index.php?administration='.$centre);//
