<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->

<!-- Specific Page Data -->
<!-- End of Data -->

<head>
    <meta charset="utf-8" />
    <title>Alaxione</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, Vendroid" />
    <meta name="description" content="Data Tables - Responsive Admin HTML Template">
    <meta name="author" content="Venmond">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="img/ico/favicon.png">

    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="css/fonts.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">


    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">
    <!-- Specific CSS -->
    <link href="plugins/dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <link href="plugins/dataTables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css">

    <link href="plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css">
    <link href="plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->


    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css">

    <link href='plugins/fullcalendar-2.3.1/fullcalendar.css' rel='stylesheet' />
    <link href='plugins/fullcalendar-2.3.1/fullcalendar.print.css' rel='stylesheet' media='print' />

    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">



    <!-- Head SCRIPTS -->
    <?php $modernizr = filemtime(PATH_ASSETS . 'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr ?>.js"></script>
    <?php $mobileDetect = filemtime(PATH_ASSETS . 'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetect ?>.js"></script>
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS . 'js/mobile-detect-modernizr.js'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->


    <!-- Javascript =============================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php $bootstrapMin = filemtime(PATH_ASSETS . 'js/bootstrap.min.js'); ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script>

    <?php $jqueryUiCustomMin = filemtime(PATH_ASSETS . 'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryUiCustomMin ?>.js'></script>

    <?php $jqueryUiTouchPMin = filemtime(PATH_ASSETS . 'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryUiTouchPMin ?>.js"></script>

    <?php $caroufredsel = filemtime(PATH_ASSETS . 'js/caroufredsel.js') ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel ?>.js"></script>

    <?php $plugins = filemtime(PATH_ASSETS . 'js/plugins.js'); ?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugins ?>.js"></script>

    <?php $frameworkJS = filemtime(PATH_ASSETS . 'js/framwork_js.js'); ?>
    <script type="text/javascript" src="js/framwork_js.<?php echo $frameworkJS ?>.js"></script>

    <?php $breakpoint = filemtime(PATH_ASSETS . 'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoint ?>.js"></script>

    <?php $jqueryDataTable = filemtime(PATH_ASSETS . 'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTable ?>.js"></script>

    <?php $prettyPhoto = filemtime(PATH_ASSETS . 'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhoto ?>.js"></script>

    <?php $mCustomScrollbar = filemtime(PATH_ASSETS . 'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbar ?>.js"></script>

    <?php $tagsInput = filemtime(PATH_ASSETS . 'plugins/tagsInput/jquery.tagsinput.min.js') ?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInput ?>.js"></script>

    <?php $bootstrapSwitch = filemtime(PATH_ASSETS . 'plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitch ?>.js"></script>

    <?php $blockUI = filemtime(PATH_ASSETS . 'plugins/blockUI/jquery.blockUI.js') ?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $blockUI ?>.js"></script>

    <?php $pNotify = filemtime(PATH_ASSETS . 'plugins/pnotify/js/jquery.pnotify.min.js') ?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pNotify ?>.js"></script>


    <?php $theme = filemtime(PATH_ASSETS . 'js/theme.js') ?>
    <script type="text/javascript" src="js/theme.<?php echo $theme ?>.js"></script>

    <?php $custom = filemtime(PATH_ASSETS . 'custom/custom.js'); ?>
    <script type="text/javascript" src="custom/custom.<?php $custom ?>.js"></script>

    <!-- Specific Page Scripts Put Here -->
    <?php $dataTables = filemtime(PATH_ASSETS . 'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $dataTables ?>.js"></script>

    <?php $datatablesBootstrap = filemtime(PATH_ASSETS . 'plugins/dataTables/dataTables.bootstrap.js') ?>
    <script type="text/javascript" src="plugins/dataTables/dataTables.bootstrap.<?php $datatablesBootstrap ?>.js"></script>

    <?php $datepickerFr = filemtime(PATH_ASSETS . 'js/datepicker-fr.js') ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datepickerFr ?>.js"></script>

    <?php $timepicker = filemtime(PATH_ASSETS . 'plugins/bootstrap-timepicker/bootstrap-timepicker.min.js') ?>
    <script type="text/javascript" src='plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timepicker ?>.js'></script>

    <?php $moment = filemtime(PATH_ASSETS . 'plugins/daterangepicker/moment.min.js') ?>
    <script type="text/javascript" src='plugins/daterangepicker/moment.min.<?php $moment ?>.js'></script>

    <?php $dateRangerPicker = filemtime(PATH_ASSETS . 'plugins/daterangepicker/daterangepicker.js') ?>
    <script type="text/javascript" src='plugins/daterangepicker/daterangepicker.<?php echo $dateRangerPicker ?>.js'></script>

    <?php $colorPicker = filemtime(PATH_ASSETS . 'plugins/colorpicker/colorpicker.js') ?>
    <script type="text/javascript" src='plugins/colorpicker/colorpicker.<?php echo $colorPicker ?>.js'></script>


    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <?php $loadImg = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/load-image.min.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/load-image.min.<?php echo $loadImg ?>.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <?php $iFrameTransport = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.iframe-transport.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.iframe-transport.<?php $iFrameTransport ?>.js"></script>
    <!-- The basic File Upload plugin -->
    <?php $fileUpload = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload.<?php echo $fileUpload ?>.js"></script>
    <!-- The File Upload processing plugin -->
    <?php $fileUploadProcess = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-process.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-process.<?php echo $fileUploadProcess ?>.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <?php $fileUploadImg = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-image.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-image,<? echo $fileUploadImg ?>.js"></script>
    <!-- The File Upload audio preview plugin -->
    <?php $fileUploadAudio = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-audio.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-audio.<?php echo $fileUploadAudio ?>.js"></script>
    <!-- The File Upload validation plugin -->
    <?php $fileUploadValidate = filemtime(PATH_ASSETS . 'plugins/jquery-file-upload/js/jquery.fileupload-validate.js') ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-validate.<?php echo $fileUploadValidate ?>.js"></script>

    <?php $moment_2 = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/lib/moment.min.js') ?>
    <script src='plugins/fullcalendar-2.3.1/lib/moment.min.<?php echo $moment_2 ?>.js'></script>

    <?php $jquery_2 = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/lib/jquery.min.js') ?>
    <script src='plugins/fullcalendar-2.3.1/lib/jquery.min.<?php echo $jquery ?>.js'></script>

    <?php $fullCalendar = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/fullcalendar.min.js') ?>
    <script src='plugins/fullcalendar-2.3.1/fullcalendar.min.<?php echo $fullCalendar ?>.js'></script>

    <?php $langAll = filemtime(PATH_ASSETS . 'plugins/fullcalendar-2.3.1/lang-all.js') ?>
    <script src='plugins/fullcalendar-2.3.1/lang-all.<?php echo $langAll ?>.js'></script>
    <script>
        $(document).ready(function() {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                lang: 'fr', //langue francais
                editable: true, //calendrier modifiable
                weekNumbers: true, //on affiche le num de semaine
                hiddenDays: [0], //on n'affiche pas le dimanche
                scrollTime: "07:00:00", //le scroll débute à 7h
                minTime: "07:00:00", //le calendar demarre à 7h
                maxTime: "20:00:00", //le calendar fini à 20h
                slotEventOverlap: false, //les event ne se chevoche pas
                defaultView: 'agendaWeek', //afficher la semaine par defaut
                events: [{
                        title: 'Test',
                        start: '2015-03-17T10:00:00',
                        constraint: 'availableForMeeting', // defined below
                        color: '#257e4a'
                    },
                    // areas where "Meeting" must be dropped
                    {
                        id: 'availableForMeeting',
                        start: '2015-03-17T08:00:00',
                        end: '2015-03-17T12:00:00',
                        rendering: 'background',
                        color: '#97BFFB'
                    },
                    {
                        id: 'availableForMeeting',
                        start: '2015-03-17T14:00:00',
                        end: '2015-03-17T17:00:00',
                        rendering: 'background',
                        color: '#97BFFB'
                    },
                    {
                        id: 'availableForTest',
                        start: '2015-03-18T08:00:00',
                        end: '2015-03-18T12:00:00',
                        rendering: 'background',
                        color: '#96FCC9'
                    },
                    {
                        id: 'availableForTest',
                        start: '2015-03-18T14:00:00',
                        end: '2015-03-18T17:00:00',
                        rendering: 'background',
                        color: '#96FCC9'
                    },
                    {
                        id: 'availableForMeeting',
                        start: '2015-03-19T08:00:00',
                        end: '2015-03-19T12:00:00',
                        rendering: 'background',
                        color: '#97BFFB'
                    },
                    {
                        id: 'availableForMeeting',
                        start: '2015-03-19T14:00:00',
                        end: '2015-03-19T17:00:00',
                        rendering: 'background',
                        color: '#97BFFB'
                    },
                    {
                        id: 'availableForMeeting',
                        start: '2015-03-20T08:00:00',
                        end: '2015-03-20T12:00:00',
                        rendering: 'background',
                        color: '#97BFFB'
                    },
                    {
                        id: 'availableForMeeting',
                        start: '2015-03-20T14:00:00',
                        end: '2015-03-20T17:00:00',
                        rendering: 'background',
                        color: '#97BFFB'
                    }
                    /*{
                    	title: 'All Day Event',
                    	start: '2015-02-01'
                    },
                    {
                    	title: 'Long Event',
                    	start: '2015-02-07',
                    	end: '2015-02-10'
                    },
                    {
                    	id: 999,
                    	title: 'Repeating Event',
                    	start: '2015-02-09T16:00:00'
                    },
                    {
                    	id: 999,
                    	title: 'Repeating Event',
                    	start: '2015-02-16T16:00:00'
                    },
                    {
                    	title: 'Conference',
                    	start: '2015-02-11',
                    	end: '2015-02-13'
                    },
                    {
                    	title: 'Meeting',
                    	start: '2015-02-12T10:30:00',
                    	end: '2015-02-12T12:30:00'
                    },
                    {
                    	title: 'Lunch',
                    	start: '2015-02-12T12:00:00'
                    },
                    {
                    	title: 'Meeting',
                    	start: '2015-02-12T14:30:00'
                    },
                    {
                    	title: 'Happy Hour',
                    	start: '2015-02-12T17:30:00'
                    },
                    {
                    	title: 'Dinner',
                    	start: '2015-02-12T20:00:00'
                    },
                    {
                    	title: 'Birthday Party',
                    	start: '2015-02-13T07:00:00'
                    },
                    {
                    	title: 'Click for Google',
                    	url: 'http://google.com/',
                    	start: '2015-02-28'
                    }*/
                ]
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            "use strict";

            $('#data-tables').dataTable();


        });
    </script>

</head>

<body id="tables" class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed      responsive    clearfix" data-active="tables " data-smooth-scrolling="1">
    <div class="vd_body">
        <!-- Header Start -->
        <header class="header-1" id="header">
            <div class="vd_top-menu-wrapper">
                <div class="container ">
                    <div class="vd_top-nav vd_nav-width  ">
                        <div class="vd_panel-header">
                            <div class="logo">
                                <a href="index.php"><img alt="logo" src="img/logo-noir.png"></a>
                            </div>
                            <!-- logo -->
                            <div class="vd_panel-menu  hidden-sm hidden-xs" data-intro="<strong>Minimize Left Navigation</strong><br/>Toggle navigation size to medium or small size. You can set both button or one button only. See full option at documentation." data-step=1>
                                <span class="nav-medium-button menu" data-toggle="tooltip" data-placement="bottom" data-original-title="Medium Nav Toggle" data-action="nav-left-medium">
                                    <i class="fa fa-bars"></i>
                                </span>

                                <span class="nav-small-button menu" data-toggle="tooltip" data-placement="bottom" data-original-title="Small Nav Toggle" data-action="nav-left-small">
                                    <i class="fa fa-ellipsis-v"></i>
                                </span>

                            </div>
                            <div class="vd_panel-menu left-pos visible-sm visible-xs">

                                <span class="menu" data-action="toggle-navbar-left">
                                    <i class="fa fa-ellipsis-v"></i>
                                </span>


                            </div>
                            <div class="vd_panel-menu visible-sm visible-xs">
                                <span class="menu visible-xs" data-action="submenu">
                                    <i class="fa fa-bars"></i>
                                </span>

                                <span class="menu visible-sm visible-xs" data-action="toggle-navbar-right">
                                    <i class="fa fa-comments"></i>
                                </span>

                            </div>
                            <!-- vd_panel-menu -->
                        </div>
                        <!-- vd_panel-header -->

                    </div>
                    <div class="vd_container">
                        <div class="row">
                            <div class="col-sm-5 col-xs-12">


                            </div>
                            <div class="col-sm-7 col-xs-12">
                                <div class="vd_mega-menu-wrapper">
                                    <div class="vd_mega-menu pull-right">
                                        <ul class="mega-ul">




                                            <li id="top-menu-profile" class="profile mega-li">
                                                <a href="#" class="mega-link" data-action="click-trigger">
                                                    <span class="mega-image">
                                                        <img src="img/avatar/avatar.jpg" alt="example image" />
                                                    </span>
                                                    <span class="mega-name">
                                                        <i class="fa fa-caret-down fa-fw"></i>
                                                    </span>
                                                </a>
                                                <div class="vd_mega-menu-content  width-xs-2  left-xs left-sm" data-action="click-target">
                                                    <div class="child-menu">
                                                        <div class="content-list content-menu">
                                                            <ul class="list-wrapper pd-lr-10">
                                                                <li> <a href="?dir=mon_compte">
                                                                        <div class="menu-icon"><i class=" fa fa-user"></i></div>
                                                                        <div class="menu-text">Mon compte</div>
                                                                    </a> </li>

                                                                <!--
                    <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-envelope"></i></div> <div class="menu-text">Messages</div><div class="menu-badge"><div class="badge vd_bg-red">10</div></div> </a>  </li>
                    <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-tasks
"></i></div> <div class="menu-text"> Tasks</div><div class="menu-badge"><div class="badge vd_bg-red">5</div></div> </a> </li> 
                    <li class="line"></li>                
                    <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-lock
"></i></div> <div class="menu-text">Privacy</div> </a> </li>-->
                                                                <!--<li> <a href="#"> <div class="menu-icon"><i class=" fa fa-cogs"></i></div> <div class="menu-text">Settings</div> </a> </li>-->

                                                                <li> <a href="deco.php">
                                                                        <div class="menu-icon"><i class=" fa fa-sign-out"></i></div>
                                                                        <div class="menu-text">Déconnexion</div>
                                                                    </a> </li>
                                                                <!--<li class="line"></li>                
                    <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-question-circle"></i></div> <div class="menu-text">Help</div> </a> </li>
                    <li> <a href="#"> <div class="menu-icon"><i class=" glyphicon glyphicon-bullhorn"></i></div> <div class="menu-text">Report a Problem</div> </a> </li>  -->
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                            </li>


                                        </ul>
                                        <!-- Head menu search form ends -->
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- container -->
            </div>
            <!-- vd_primary-menu-wrapper -->

        </header>
        <!-- Header Ends -->
        <div class="content">
            <div class="container">
                <div class="vd_navbar vd_nav-width vd_navbar-tabs-menu vd_navbar-left  ">

                    <div class="navbar-menu clearfix">
                        <div class="vd_panel-menu hidden-xs">
                            <span data-original-title="Expand All" data-toggle="tooltip" data-placement="bottom" data-action="expand-all" class="menu" data-intro="<strong>Expand Button</strong><br/>To expand all menu on left navigation menu." data-step=4>
                                <i class="fa fa-sort-amount-asc"></i>
                            </span>
                        </div>
                        <h3 class="menu-title hide-nav-medium hide-nav-small">Navigation</h3>
                        <div class="vd_menu">
                            <ul>

                                {section name=sec1 loop=$aTableauMenu}
                                {if $aTableauMenu[sec1][8]=='Y'}

                                <li>
                                    <a href="{$aTableauMenu[sec1][1]}">
                                        <span class="menu-icon"><i class="{$aTableauMenu[sec1][7]}"></i></span>
                                        <span class="menu-text">{$aTableauMenu[sec1][2]}</span>
                                    </a>
                                </li>
                                {else}

                                <li>
                                    <a href="javascript:void(0);" data-action="click-trigger">
                                        <span class="menu-icon"><i class="{$aTableauMenu[sec1][7]}"></i></span>
                                        <span class="menu-text">{$aTableauMenu[sec1][2]}</span>
                                        <span class="menu-badge"><span class="badge vd_bg-black-30"><i class="fa fa-angle-down"></i></span></span>
                                    </a>
                                    {if !empty($aTableauMenu[sec1][4])}
                                    <div class="child-menu" data-action="click-target">
                                        <ul>
                                            {section name=sec2 loop=$aTableauMenu[sec1][4]}
                                            <li>
                                                <a href="{$aTableauMenu[sec1][4][sec2][1]}">
                                                    <span class="menu-text">{$aTableauMenu[sec1][4][sec2][2]}</span>
                                                </a>
                                            </li>
                                            {/section}
                                        </ul>
                                    </div>
                                    {/if}
                                </li>
                                {/if}
                                {/section}

                            </ul>
                            <!-- Head menu search form ends -->
                        </div>
                    </div>
                    <div class="navbar-spacing clearfix">
                    </div>
                    <div class="vd_menu vd_navbar-bottom-widget">
                        <ul>
                            <li>
                                <a href="deco.php">
                                    <span class="menu-icon"><i class="fa fa-sign-out"></i></span>
                                    <span class="menu-text">Déconnexion</span>
                                </a>

                            </li>
                        </ul>
                    </div>
                </div>
                <div class="vd_navbar vd_nav-width vd_navbar-chat vd_bg-black-80 vd_navbar-right   ">
                    <div class="navbar-tabs-menu clearfix">
                        <span class="expand-menu" data-action="expand-navbar-tabs-menu">
                            <span class="menu-icon menu-icon-left">
                                <i class="fa fa-ellipsis-h"></i>
                                <span class="badge vd_bg-red">
                                    20
                                </span>
                            </span>
                            <span class="menu-icon menu-icon-right">
                                <i class="fa fa-ellipsis-h"></i>
                                <span class="badge vd_bg-red">
                                    20
                                </span>
                            </span>
                        </span>
                        <div class="menu-container">
                            <div class="navbar-search-wrapper">
                                <div class="navbar-search vd_bg-black-30">
                                    <span class="append-icon"><i class="fa fa-search"></i></span>
                                    <input type="text" placeholder="Search" class="vd_menu-search-text no-bg no-bd vd_white width-70" name="search">
                                    <div class="pull-right search-config">
                                        <a data-toggle="dropdown" href="javascript:void(0);" class="dropdown-toggle"><span class="prepend-icon vd_grey"><i class="fa fa-cog"></i></span></a>
                                        <ul role="menu" class="dropdown-menu">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Separated link</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="navbar-menu clearfix">
                        <div class="content-list content-image content-chat">
                            <ul class="list-wrapper no-bd-btm pd-lr-10">
                                <li class="group-heading vd_bg-black-20">FAVORITE</li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar.jpg" alt="example image"></div>
                                        <div class="menu-text">Jessylin
                                            <div class="menu-info">
                                                <span class="menu-date">Administrator </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-2.jpg" alt="example image"></div>
                                        <div class="menu-text">Rodney Mc.Cardo
                                            <div class="menu-info">
                                                <span class="menu-date">Designer </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="badge status vd_bg-grey">&nbsp;</span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-3.jpg" alt="example image"></div>
                                        <div class="menu-text">Theresia Minoque
                                            <div class="menu-info">
                                                <span class="menu-date">Engineering </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                    </a>
                                </li>
                                <li class="group-heading vd_bg-black-20">FRIENDS</li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-4.jpg" alt="example image"></div>
                                        <div class="menu-text">Greg Grog
                                            <div class="menu-info">
                                                <span class="menu-date">Developer </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="badge status vd_bg-grey">&nbsp;</span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-5.jpg" alt="example image"></div>
                                        <div class="menu-text">Stefanie Imburgh
                                            <div class="menu-info">
                                                <span class="menu-date">Dancer</span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="vd_grey font-sm"><i class="fa fa-mobile"></i></span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-6.jpg" alt="example image"></div>
                                        <div class="menu-text">Matt Demon
                                            <div class="menu-info">
                                                <span class="menu-date">Musician </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="vd_grey font-sm"><i class="fa fa-mobile"></i></span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-7.jpg" alt="example image"></div>
                                        <div class="menu-text">Jeniffer Anastasia
                                            <div class="menu-info">
                                                <span class="menu-date">Senior Developer </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="menu-icon"><img src="img/avatar/avatar-8.jpg" alt="example image"></div>
                                        <div class="menu-text">Daniel Dreamon
                                            <div class="menu-info">
                                                <span class="menu-date">Sales Executive </span>
                                            </div>
                                        </div>
                                        <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                    </a>
                                </li>

                            </ul>
                        </div>


                    </div>
                    <div class="navbar-spacing clearfix">
                    </div>
                </div>
                <!-- Middle Content Start -->

                <div class="vd_content-wrapper">
                    <div class="vd_container">
                        <div class="vd_content clearfix">
                            <div class="vd_head-section clearfix">
                                <div class="vd_panel-header">
                                    <div class="vd_panel-menu hidden-sm hidden-xs" data-intro="<strong>Expand Control</strong><br/>To expand content page horizontally, vertically, or Both. If you just need one button just simply remove the other button code." data-step=5 data-position="left">
                                        <div data-action="remove-navbar" data-original-title="Remove Navigation Bar Toggle" data-toggle="tooltip" data-placement="bottom" class="remove-navbar-button menu"> <i class="fa fa-arrows-h"></i> </div>
                                        <div data-action="remove-header" data-original-title="Remove Top Menu Toggle" data-toggle="tooltip" data-placement="bottom" class="remove-header-button menu"> <i class="fa fa-arrows-v"></i> </div>
                                        <div data-action="fullscreen" data-original-title="Remove Navigation Bar and Top Menu Toggle" data-toggle="tooltip" data-placement="bottom" class="fullscreen-button menu"> <i class="glyphicon glyphicon-fullscreen"></i> </div>

                                    </div>

                                </div>
                            </div>

                            <div class="vd_title-section clearfix">
                                <div class="vd_panel-header no-menu">
                                    <h1>Agenda</h1>
                                    <small class="subtitle">Gérer votre prise de Rendez-Vous</small>
                                </div>
                            </div>
                            <div class="vd_content-section clearfix">
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="panel widget light-widget panel-bd-top">
                                            <div class="panel-body">
                                                <div id="calendar" class="mgtp-10"> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- col-sm-12-->
                                </div>
                                <!-- row -->

                            </div>
                            <!-- .vd_content-section -->
                        </div>
                        <!-- .vd_content -->
                    </div>
                    <!-- .vd_container -->
                </div>
                <!-- .vd_content-wrapper -->

                <!-- Middle Content End -->

            </div>
            <!-- .container -->
        </div>
        <!-- .content -->

        <!-- Footer Start -->
        <footer class="footer-1" id="footer">
            <div class="vd_bottom ">
                <div class="container">
                    <div class="row">
                        <div class=" col-xs-12">
                            <div class="copyright">
                                Copyright &copy;<script>
                                    document.write(new Date().getFullYear())
                                </script> Alaxione.fr - Tous droits réservés
                            </div>
                        </div>
                    </div><!-- row -->
                </div><!-- container -->
            </div>
        </footer>
        <!-- Footer END -->

    </div>
    <!-- .vd_body END  -->
    <a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>

</body>

</html>