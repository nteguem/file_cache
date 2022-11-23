<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html><!--<![endif]-->

<!-- Specific Page Data -->
<!-- End of Data -->

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Alaxione</title>
    <meta name="keywords" content="" />
    <meta name="description" content="">
    <meta name="author" content="Alaxione">
    
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
    <link href="css/fonts.css"  rel="stylesheet" type="text/css">
               
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

    <!-- <link href='plugins/fullcalendar-2.3.1/fullcalendar.css' rel='stylesheet' />
    <link href='plugins/fullcalendar-2.3.1/fullcalendar.print.css' rel='stylesheet' media='print' />  -->

    <link href='plugins/fullcalendar-2.5.0/fullcalendar.css' rel='stylesheet' />
    <link href='plugins/fullcalendar-2.5.0/scheduler.css' rel='stylesheet' />
    <link href='plugins/fullcalendar-2.5.0/fullcalendar.print.css' rel='stylesheet' media='print' />  

    <!-- Theme CSS -->
    <link href="css/theme.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    

  
    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.css" rel="stylesheet" type="text/css"> 

	
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="custom/custom.css" rel="stylesheet" type="text/css">


{literal}
    <!-- Head SCRIPTS -->
    <?php $modernizPrincipal_v1 = filemtime(PATH_ASSETS.'js/modernizr.js') ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizPrincipal_v1 ?>.js"></script>
        <?php $mobileDetectMiPrincipal_v1 = filemtime(PATH_ASSETS.'js/mobile-detect.min.js') ?>
        <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMiPrincipal_v1 ?>.js"></script>
        <?php $mobileDetectMdernPrincipal_v1 = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js') ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectMdernPrincipal_v1 ?>.js"></script>
 
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
    
    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <!-- <script src='plugins/fullcalendar-2.3.1/lib/jquery.min.js'></script> -->

    <?php $fullCalendarPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.5.0/lib/jquery.min.js') ?>
    <script src='plugins/fullcalendar-2.5.0/lib/jquery.min.<?php echo $fullCalendarPrincipal_v1 ?>.js'></script>

    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php $bootstrapPrincipal_v1 = filemtime(PATH_ASSETS.'js/bootstrap.min.js') ?>
<script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapPrincipal_v1 ?>.js"></script>
    <?php $customPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js') ?>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customPrincipal_v1 ?>.js'></script>
    <?php $touchPuncPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js') ?>
<script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $touchPuncPrincipal_v1 ?>.js"></script>

<?php $caroufPrincipalv1 = filemtime(PATH_ASSETS.'js/caroufredsel.js') ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufPrincipalv1 ?>.js"></script>
    <?php $pluginPrincipalv1 = filemtime(PATH_ASSETS.'js/plugins.js') ?>
  <script type="text/javascript" src="js/plugins.<?php echo $pluginPrincipalv1 ?>.js"></script>

  <?php $frameWorkPrincipal = filemtime(PATH_ASSETS.'js/framwork_js.js') ?>
    <script type="text/javascript" src="js/framwork_js.<?php echo $frameWorkPrincipal ?>.js"></script>

    <!-- Script pour l'auto-completion -->
    <?php $autoCompletePrincipal_v1 = filemtime(PATH_ASSETS.'js/jquery.autocomplete.min.js') ?>
    <script type="text/javascript" src="js/jquery.autocomplete.min.<?php $autoCompletePrincipal_v1 ?>.js"></script>


    <?php $breackPoinPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js') ?>
<script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breackPoinPrincipal_v1 ?>.js"></script>
    <?php $dataTablePrincipal_v1 = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js') ?>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $dataTablePrincipal_v1 ?>.js"></script>
    <?php $prettyPhotPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js') ?>
<script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhotPrincipal_v1 ?>.js"></script>
 

<?php $contactPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js') ?>
<script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $contactPrincipal_v1 ?>.js"></script>
    <?php $tagsInPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js') ?>
<script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInPrincipal_v1 ?>.js"></script>
    <?php $bootStPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js') ?>
<script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootStPrincipal_v1 ?>.js"></script>
    <?php $blocPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js') ?>
<script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $blocPrincipal_v1 ?>.js"></script>
    <?php $pnotPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js') ?>
<script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotPrincipal_v1 ?>.js"></script>


<?php $themPrincipal_v1 = filemtime(PATH_ASSETS.'js/theme.js') ?>
<script type="text/javascript" src="js/theme.<?php echo $themPrincipal_v1 ?>.js"></script>
    <?php $customCustoPrincipal_v1 = filemtime(PATH_ASSETS.'custom/custom.js') ?>
<script type="text/javascript" src="custom/custom.<?php echo $customCustoPrincipal_v1 ?>.js"></script>

     
    <!-- Specific Page Scripts Put Here -->

   
    <?php $dataTablePrincipal_v1 = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js') ?>
<script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $dataTablePrincipal_v1 ?>.js"></script>
   
<?php $principalDataTable_v1 = filemtime(PATH_ASSETS.'plugins/dataTables/dataTables.bootstrap.js') ?>
    <script type="text/javascript" src="plugins/dataTables/dataTables.bootstrap.<?php echo $principalDataTable_v1 ?>.js"></script>

    <?php $datePickerPrincipal_v1 = filemtime(PATH_ASSETS.'js/datepicker-fr.js') ?>
<script type="text/javascript" src="js/datepicker-fr.<?php $datePickerPrincipal_v1 ?>.js"></script>

        <?php $timePickerPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.js') ?>
<script type="text/javascript" src='plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timePickerPrincipal_v1 ?>.js'></script>
        <?php $momentPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/daterangepicker/moment.min.js') ?>
<script type="text/javascript" src='plugins/daterangepicker/moment.min.<?php echo $momentPrincipal_v1 ?>.js'></script>
        <?php $dataRangePrincipal_v1 = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker.') ?>
<script type="text/javascript" src='plugins/daterangepicker/daterangepicker.<?php echo $dataRangePrincipal_v1 ?>.js'></script>
        <?php $colorPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/colorpicker/colorpicker.js') ?>
<script type="text/javascript" src='plugins/colorpicker/colorpicker.<?php echo $colorPrincipal_v1 ?>.js'></script>


    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
        <?php $imgaMinPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/load-image.min.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/load-image.min.<?php echo $imgaMinPrincipal_v1 ?>.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
        <?php $iframeTranportPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/load-image.min.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.iframe-transport.<?php echo $iframeTranportPrincipal_v1 ?>.js"></script>
    <!-- The basic File Upload plugin -->
        <?php $fileUploadPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload.<?php echo $fileUploadPrincipal_v1 ?>.js"></script>
    <!-- The File Upload processing plugin -->
        <?php $fileuploadProcess = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-process.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-process.<?php echo $fileuploadProcess ?>.js"></script>
    <!-- The File Upload image preview & resize plugin -->
        <?php $fileuploadImage = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-image.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-image.<?php echo $fileuploadImage ?>.js"></script>
    <!-- The File Upload audio preview plugin -->
        <?php $fileUploadAudio = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-audio.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-audio.<?php echo $fileUploadAudio ?>.js"></script>
    <!-- The File Upload validation plugin -->
        <?php $validatesPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-validate.js') ?>
<script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-validate.<?php echo $validatesPrincipal_v1 ?>.js"></script>



    <!-- Specific Page Scripts END -->

    <!-- <script src='plugins/fullcalendar-2.3.1/lib/moment.min.js'></script>
    <script src='plugins/fullcalendar-2.3.1/fullcalendar.min.js'></script>
    <script src='plugins/fullcalendar-2.3.1/lang-all.js'></script> -->
        <?php $momenMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.5.0/lib/moment.min.js') ?>
<script src='plugins/fullcalendar-2.5.0/lib/moment.min.<?php echo $momenMin ?>.js'></script>
        <?php $fulcalendarMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.5.0/fullcalendar.min.js') ?>
<script src='plugins/fullcalendar-2.5.0/fullcalendar.min.<?php echo $fulcalendarMin ?>.js'></script>
        <?php $langAll = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.5.0/lang-all.js') ?>
<script src='plugins/fullcalendar-2.5.0/lang-all.<?php echo $langAll ?>.js'></script>
        <?php $shedulerPrincipal_v1 = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.5.0/scheduler.js') ?>
<script src='plugins/fullcalendar-2.5.0/scheduler.<?php echo $shedulerPrincipal_v1 ?>.js'></script>

        <?php $rigthClikPrincipal = filemtime(PATH_ASSETS.'js/fullcalendar-rightclick.js') ?>
<script type="text/javascript" src="js/fullcalendar-rightclick.<?php echo $rigthClikPrincipal ?>.js"></script>

        <?php $ckeditor = filemtime(PATH_ASSETS.'plugins/ckeditor/ckeditor.js') ?>
<script type="text/javascript" src='plugins/ckeditor/ckeditor.<?php echo $ckeditor ?>.js'></script>
        <?php $adapterJquery = filemtime(PATH_ASSETS.'plugins/ckeditor/adapters/jquery.js') ?>
<script type="text/javascript" src='plugins/ckeditor/adapters/jquery.<?php echo $adapterJquery ?>.js'></script>
        <?php $maskedInputPrincipal_v1 = filemtime(PATH_ASSETS.'js/jquery.maskedinput.min.js') ?>
<script type="text/javascript" src="js/jquery.maskedinput.min.<?php echo $maskedInputPrincipal_v1 ?>.js"></script>

        <?php $maskChampPrinciapl_v1 = filemtime(PATH_ASSETS.'js/maskchamps.js') ?>
<script type="text/javascript" src="js/maskchamps.<?php echo $maskChampPrinciapl_v1 ?>.js"></script>

<script type="text/javascript">

        function getCookie(name) {
            var dc = document.cookie;
            var prefix = name + "=";
            var begin = dc.indexOf("; " + prefix);
            if (begin == -1) {
                begin = dc.indexOf(prefix);
                if (begin != 0) return null;
            }
            else
            {
                begin += 2;
                var end = document.cookie.indexOf(";", begin);
                if (end == -1) {
                end = dc.length;
                }
            }
            return unescape(dc.substring(begin + prefix.length, end));
        } 

        setInterval(function(){
            var myCookie = getCookie("cookie_alaxione");

            if (myCookie == null) {
                alert("Votre session a expiré, vous devez vous identifier à nouveau!");
                document.location.href="index.php?centre={/literal}{$id_entite}{literal}";
            }
            /*
            if( $.cookie('cookie_alaxione') === null ) { 
                alert("Votre session a expiré, vous devez vous identifier à nouveau!");
                document.location.href="index.php";
            }*/

            //alert("test");
        }, 1000);

        $(document).ready(function() {
            "use strict";


            


            $('#data-tables').dataTable( {
                searching: false,
                language: {
                    lengthMenu: "Afficher _MENU_ rendez-vous par page",
                    processing:     "Traitement en cours...",
                    search:         "Rechercher&nbsp;:",
                    info:           "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                    infoEmpty:      "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                    infoFiltered:   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    infoPostFix:    "",
                    loadingRecords: "Chargement en cours...",
                    zeroRecords:    "Aucun rendez-vous &agrave; afficher",
                    emptyTable:     "Aucune donnée disponible",
                    paginate: {
                        first:      "Premier",
                        previous:   "Pr&eacute;c&eacute;dent",
                        next:       "Suivant",
                        last:       "Dernier"
                    },
                    aria: {
                        sortAscending:  ": activer pour trier la colonne par ordre croissant",
                        sortDescending: ": activer pour trier la colonne par ordre décroissant"
                    }
                }
            });

        });

        function close_modal_principal(idevent, saction, idcalendar){
            /*alert(idevent);
            alert(saction);
            alert(idcalendar);
            */
            $('#myModalinfordv').modal('hide');
            /*if(idevent==""){
                $('#calendar_'+idcalendar).fullCalendar('refetchEvents');
            }else{
                if(saction=="supp"){
                    $('#calendar_'+idcalendar).fullCalendar('removeEvents', idevent);
                }else if(saction=="deplace"){
                    $('#calendar_'+idcalendar).fullCalendar('refetchEvents');
                }else if(saction=="modif"){
                    $('#calendar_'+idcalendar).fullCalendar('refetchEvents');
                }else{
                    $('#calendar_'+idcalendar).fullCalendar('refetchEvents');
                }

            }*/
        }



    </script>


    <style type="text/css">
        .autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
        .autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
        .autocomplete-selected { background: #F0F0F0; }
        .autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }

        .vd_menu-search .vd_menu-search-submit2 { 
            position: absolute;
            top: 0;
            right: 0;
            background: #27A1C2;
            color: #FFF;
            padding: 2px 8px;
            -webkit-border-radius: 30px;
            -moz-border-radius: 30px;
            border-radius: 30px;
        }

        .vd_menu-search {
             width: 450px;
        }

        select {
          
          height: 39px;
        }


        .table-responsive {
            overflow-x: auto;
        }

        .vd_mega-menu-wrapper > .vd_mega-menu > .mega-ul > .mega-li > [data-action^="toggle-navbar-right"], .vd_mega-menu-wrapper > .vd_mega-menu > .mega-ul > .mega-li > [data-action^="toggle-navbar-left"] {
            color: #27A1C2;
        }

        .vd_mega-menu-wrapper .vd_mega-menu > .mega-ul > li.one-icon .mega-link:hover, .vd_mega-menu-wrapper .vd_mega-menu > .mega-ul > li.one-icon .mega-link.open {
            background-color: #ffffff !important;
            color: #27A1C2;
        }

        .vd_mega-menu-content:before {
            -moz-border-color: none;
            border-color: transparent transparent #27A1C2;

        }

        .vd_mega-menu-content {
            border: 3px solid #27A1C2;
        }
    
    </style>

{/literal}

<!-- End of Data -->
</head>    

<body id="tables" class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed      responsive    clearfix" data-active="tables "  data-smooth-scrolling="1"> 
<div class="modal fade" id="myModalinfordv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:850px">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="myModalLabelinfordv">Fiche patient</h4>
            </div>
            <div class="modal-body"> 
                <iframe id="iframerdv" frameborder="0" width="800px"  height="800px"></iframe>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalinforecom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:400px">
        <div class="modal-content">
            <div class="modal-header vd_bg-blue vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title" id="myModalLabelinfordv">Fiche patient</h4>
            </div>
            <div class="modal-body">
                <iframe id="iframerdvrecommandation" frameborder="0" width="400px"  height="400px"></iframe>
            </div>
        </div>
    </div>
</div>

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
                                
            <!-- vd_panel-menu -->
          </div>
          <!-- vd_panel-header -->
            
          </div>    
          <div class="vd_container">
          	<div class="row">
            	<div class="col-sm-5 col-xs-12">
            		<div class="vd_menu-search">
                        <form id="search-box" method="post" action="#">
                            <input type="text" id="id_autocomplete_recherche_patient" name="autocomplete_recherche_patient" class="vd_menu-search-text width-80" placeholder="Rechercher un patient">
                            <span class="vd_menu-search-submit2"><i class="fa fa-search"></i> </span>
                            {literal}
                                <script type="text/javascript">      
                                    $("#id_autocomplete_recherche_patient").autocomplete({
                                        serviceUrl: 'ajax/patient_auto_complete.php',
                                        onSelect: function(suggestion) {
                                            document.getElementById("iframerdv").src="modal_fiche_patient.php?id_patient="+suggestion.id;
                                            $('#myModalinfordv').modal('show');
                                        }
                                    });
                                </script>
                            {/literal}
                        </form>
                    </div>
                </div>
                 <div class="col-sm-7 col-xs-12">
              		<div class="vd_mega-menu-wrapper">
                    	<div class="vd_mega-menu pull-right">
            				<ul class="mega-ul">

                                <li id="top-menu-1" class="one-icon mega-li"> 
                                    <a href="index.php" class="mega-link" data-action="click-trigger" alt="Liste des RDV en attente de confirmation" title="Liste des RDV en attente de confirmation" >
                                        <span class="mega-icon">
                                            <i class="fa fa-warning"></i>
                                        </span> 
                                        <span class="badge vd_bg-red">{$iAlertRdvattente}</span>        
                                    </a>
                                    <div class="vd_mega-menu-content width-xs-3 width-sm-4 width-md-5 width-lg-4 right-xs left-sm" data-action="click-target" style="display: none;">
                                        <div class="child-menu">  
                                            <div class="title"> 
                                                Liste des RDV en attente de confirmation
                                            </div>                 
                                            <div class="content-list content-image">   
                                                <div data-rel="scroll" class="mCustomScrollbar _mCS_2" style="overflow: hidden;">
                                                    <div class="mCustomScrollBox mCS-light" id="mCSB_2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%; max-height: 400px;">
                                                        <div class="mCSB_container" style="position: relative; top: 0px;">
                                                            <ul class="list-wrapper  pd-lr-10">
                                                                {foreach from=$aTableauListeRDVattente item=objRDV}
                                                                <li> 
                                                                    <a href="#" onclick="document.getElementById('iframerdv').src='modal_fiche_rdv_patient.php?idrdv={$objRDV.id_prise_rendez_vous}'; $('#myModalinfordv').modal('show');">
                                                                        <div class="menu-icon"><img alt="example image" src="uploads/{$objRDV.photo_user}"></div> 
                                                                        <div class="menu-text"> Rendez du {$objRDV.daterdv} à {$objRDV.heurerdv}
                                                                            <div class="menu-info">
                                                                                <span class="menu-date">de {$objRDV.abreviation_civilite} {$objRDV.nompatient} {$objRDV.prenompatient}</span>                                                                         
                                                                                                                                                          
                                                                                </span>                                
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </li>
                                                                {/foreach}
                                                            </ul>
                                                        </div>
                                                        <div class="mCSB_scrollTools" style="position: absolute; opacity: 0; display: none;">
                                                            <div class="mCSB_draggerContainer">
                                                                <div class="mCSB_dragger" style="position: absolute; height: 209px; top: 0px;" oncontextmenu="return false;">
                                                                    <div class="mCSB_dragger_bar" style="position: relative; line-height: 209px;"></div>
                                                                </div>
                                                                <div class="mCSB_draggerRail"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                               <div class="closing text-center" style="">
                                                    <a href="main.php?dir=rdvattenteconf">Tous les RDV en attente de confirmation <i class="fa fa-angle-double-right"></i></a>
                                               </div>                                                                       
                                            </div>                              
                                        </div> <!-- child-menu -->                      
                                    </div>   <!-- vd_mega-menu-content --> 
                                </li>


                                <li id="top-menu-profile" class="profile mega-li"> 
                                    <a href="#" class="mega-link"  data-action="click-trigger"> 
                                        <span  class="mega-image">
                                            <img src="uploads/{$photouser}" alt="{$prenomuser}" />               
                                        </span>
                                        <span class="mega-name">
                                            {$prenomuser} <i class="fa fa-caret-down fa-fw"></i> 
                                        </span>
                                    </a> 
                                  <div class="vd_mega-menu-content  width-xs-2  left-xs left-sm" data-action="click-target">
                                    <div class="child-menu"> 
                                    	<div class="content-list content-menu">
                                            <ul class="list-wrapper pd-lr-10">
                                                <li> <a href="?dir=mon_compte"> <div class="menu-icon"><i class=" fa fa-user"></i></div> <div class="menu-text">Mon compte</div> </a> </li>
                                                {if $binfofile=='ok'}
                                                    <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-trophy"></i></div> <div class="menu-text">{$filescript}</div> </a> </li>
                                                {/if}
                                               
                                                <li> <a href="#"> <div class="menu-icon"><i class="fa fa-university"></i></div> <div class="menu-text">{$lecentre}</div><div class="menu-badge"></div> </a>  </li>
                                                <!-- <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-tasks
                            "></i></div> <div class="menu-text"> Tasks</div><div class="menu-badge"><div class="badge vd_bg-red">5</div></div> </a> </li> 
                                                <li class="line"></li>                
                                                <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-lock
                            "></i></div> <div class="menu-text">Privacy</div> </a> </li>-->
                                                <!--<li> <a href="#"> <div class="menu-icon"><i class=" fa fa-cogs"></i></div> <div class="menu-text">Settings</div> </a> </li>-->
                                               
                                                <li> <a href="deco.php"> <div class="menu-icon"><i class=" fa fa-sign-out"></i></div>  <div class="menu-text">Déconnexion</div> </a> </li>
                                                <!--<li class="line"></li>                
                                                <li> <a href="#"> <div class="menu-icon"><i class=" fa fa-question-circle"></i></div> <div class="menu-text">Help</div> </a> </li>
                                                <li> <a href="#"> <div class="menu-icon"><i class=" glyphicon glyphicon-bullhorn"></i></div> <div class="menu-text">Report a Problem</div> </a> </li>  -->            
                                            </ul>
                                        </div> 
                                    </div> 
                                  </div>     
                              
                                </li>  
                                             
                                <li id="top-menu-salle-attente" style="display:none;" class="one-big-icon hidden-xs hidden-sm mega-li" data-intro="" data-step="2" data-position="left"> 
                                    <a href="#" class="mega-link"  onclick="toggleNavbarOnly('right');" alt="Salle d'attente" title="Salle d'attente"> 
                                       <span class="mega-icon">
                                            <i class="fa fa-users"></i> 
                                        </span>         
                                        <span id="nb_salle_attente" class="badge vd_bg-red"></span>               
                                    </a>              
                                   
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
            <div class="vd_navbar vd_nav-width vd_navbar-tabs-profile vd_navbar-left">
                <div class="navbar-menu clearfix">
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
                                    <div class="child-menu"  data-action="click-target">
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
                <div class="navbar-spacing clearfix"></div>
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

            <!-- début salle d'attente -->
            <div class="vd_navbar vd_nav-width vd_navbar-tabs-menu vd_bg-black-80 vd_navbar-right">
                <div class="navbar-tabs-menu clearfix" style="height:auto;padding-bottom:15px;">
                    <div class="menu-container">               
                        <div class="navbar-search-wrapper">
                            <div class="navbar-search vd_bg-black-30">
                                <span class="append-icon"><i class="fa fa-filter"></i> Trier par:</span>
                            </div>
                            <div class="vd_input-wrapper">
                              <select name="trie_salle_attente" id="trie_salle_attente" style="height:32px;">
                                <option value="1">Heure d'arrivée</option>
                                <option value="2">Heure de passage</option>
                              </select>
                            </div>
                        </div>  
                    </div>                                            
                </div>
                <div class="navbar-menu clearfix">
                    <div class="content-list content-image content-chat">
                        <ul class="list-wrapper no-bd-btm pd-lr-10" id="tab_salle_attente">
                             
                        </ul>
                    </div>
                </div>
                <div class="navbar-spacing clearfix"></div>
            </div>
            <!-- fin salle d'attente -->

            <!-- Middle Content Start -->
            <div class="vd_content-wrapper">
                <div class="vd_container">
                    <div class="vd_content clearfix">
                        <div class="vd_head-section clearfix">
                            <div class="vd_panel-header">
                                <div class="vd_panel-menu hidden-sm hidden-xs" data-intro="<strong>Expand Control</strong><br/>To expand content page horizontally, vertically, or Both. If you just need one button just simply remove the other button code." data-step=5  data-position="left">
                                    <div data-action="remove-navbar" data-original-title="Remove Navigation Bar Toggle" data-toggle="tooltip" data-placement="bottom" class="remove-navbar-button menu"> <i class="fa fa-arrows-h"></i> </div>
                                    <div data-action="remove-header" data-original-title="Remove Top Menu Toggle" data-toggle="tooltip" data-placement="bottom" class="remove-header-button menu"> <i class="fa fa-arrows-v"></i> </div>
                                    <div data-action="fullscreen" data-original-title="Remove Navigation Bar and Top Menu Toggle" data-toggle="tooltip" data-placement="bottom" class="fullscreen-button menu"> <i class="glyphicon glyphicon-fullscreen"></i> </div>
                                </div>
                            </div>
                        </div>
                        <!--ici include tpl -->
                        {if isset($pagedirection)}
                            {if $pagedirection|is_array}
                                {foreach from=$pagedirection item=tpl}
                                    {include file="$tpl"}
                                {/foreach}
                            {else}
                                {include file="$pagedirection"}
                            {/if}
                        {/if}

                        <!--fin include tpl-->
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
    <footer class="footer-1"  id="footer">      
        <div class="vd_bottom ">
            <div class="container">
                <div class="row">
                    <div class=" col-xs-12">
                        <div class="copyright">Copyright &copy;<script>document.write(new Date().getFullYear())</script> Alaxione.fr - Tous droits réservés</div>
                    </div>
                </div><!-- row -->
            </div><!-- container -->
        </div>
    </footer>
    <!-- Footer END -->
</div>

<!-- .vd_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>

<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->



</body>
</html>