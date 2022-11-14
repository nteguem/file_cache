<?php

session_start();
unset($_SESSION);
unset($_COOKIE);
session_destroy();
header('Set-Cookie: cookie_alaxione_itr=;Max-Age='.$time.'; SameSite=None; Secure',false);
header('Location:index_itr.php');
