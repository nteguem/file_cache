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
    <meta name="author" content="">
    
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    
    
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../img/ico/favicon.png">
    
    
    <!-- CSS -->
       
    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="../css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="../css/fonts.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="../plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="../plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="../plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="../plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">
   
         
    <link href="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="../plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="../plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">
    <!-- Specific CSS -->
    <link href="../plugins/dataTables/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
    <link href="../plugins/dataTables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
    <link href="../plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css">
    <link href="../plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css">
    <link href="../plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.css" rel="stylesheet" type="text/css">
    <link href='../plugins/fullcalendar-2.3.1/fullcalendar.css' rel='stylesheet' />
    <link href='../plugins/fullcalendar-2.3.1/fullcalendar.print.css' rel='stylesheet' media='print' />
    <!-- Theme CSS -->
    <link href="../css/theme.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="../css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="../css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->

  
    <!-- Responsive CSS -->
    <link href="../css/theme-responsive.min.css" rel="stylesheet" type="text/css">

	
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="../custom/custom.css" rel="stylesheet" type="text/css">


{literal}
    <!-- Head SCRIPTS -->
<?php
  $modernizr = filemtime(PATH_ASSETS.'../js/modernizr.js');
?>
    <script type="text/javascript" src="../js/modernizr.<?php echo $modernizr ?>.js"></script>

<?php
  $mobileDetectMin = filemtime(PATH_ASSETS.'../js/mobile-detect.min.js');
?>
    <script type="text/javascript" src="../js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script>

<?php
  $mobileDetectModernizr = filemtime(PATH_ASSETS.'../js/mobile-detect-modernizr.js');
?>
    <script type="text/javascript" src="../js/mobile-detect-modernizr.<?php echo $mobileDetectMin ?>.js"></script>

 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="../js/html5shiv.js"></script>
      <script type="text/javascript" src="../js/respond.min.js"></script>
    <![endif]-->
    
    
    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 

<?php
  $pluginsFullCalender = filemtime(PATH_ASSETS.'../plugins/fullcalendar-2.3.1/lib/jquery.min.js');
?>
    <script src='../plugins/fullcalendar-2.3.1/lib/jquery.min.<?php echo $pluginsFullCalender ?>.js'></script>

    <!--[if lt IE 9]>
      <script type="text/javascript" src="../js/excanvas.js"></script>
    <![endif]-->
<?php
  $bootstrapMin = filemtime(PATH_ASSETS.'../js/bootstrap.min.js');
?>
    <script type="text/javascript" src="../js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script>

<?php
  $pluginsJquery = filemtime(PATH_ASSETS.'../plugins/jquery-ui/jquery-ui.custom.min.js');
?> 
    <script type="text/javascript" src='../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $pluginsJquery ?>.js'></script>

<?php
  $pluginsJqueryUiTouch = filemtime(PATH_ASSETS.'../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js');
?>     

    <script type="text/javascript" src="../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $pluginsJqueryUiTouch ?>.js"></script>

<?php
  $caroufredsel = filemtime(PATH_ASSETS.'../js/caroufredsel.js');
?>   

    <script type="text/javascript" src="../js/caroufredsel.<?php echo $caroufredsel ?>.js"></script>

<?php
  $jsPlugins = filemtime(PATH_ASSETS.'../js/plugins.js');
?>      

    <script type="text/javascript" src="../js/plugins.<?php echo $jsPlugins ?>.js"></script>

<?php
  $framworkJs = filemtime(PATH_ASSETS.'../js/framwork_js.js');
?>   
    <script type="text/javascript" src="../js/framwork_js.<?php echo $framworkJs ?>.js"></script>

    <!-- Script pour l'auto-completion -->

<?php
  $autocomplete = filemtime(PATH_ASSETS.'../js/jquery.autocomplete.min.js');
?> 
    <script type="text/javascript" src="../js/jquery.autocomplete.min.<?php echo $autocomplete ?>.js"></script>

<?php
  $pluginsBreakpoints = filemtime(PATH_ASSETS.'../plugins/breakpoints/breakpoints.js');
?> 
    <script type="text/javascript" src="../plugins/breakpoints/breakpoints.<?php echo $pluginsBreakpoints ?>.js"></script>

<?php
  $pluginsDatatables = filemtime(PATH_ASSETS.'../plugins/dataTables/jquery.dataTables.min.js');
?> 

    <script type="text/javascript" src="../plugins/dataTables/jquery.dataTables.min.<?php echo $pluginsDatatables ?>.js"></script>

<?php
  $pluginsPrettyPhoto = filemtime(PATH_ASSETS.'../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js');
?>   
    <script type="text/javascript" src="../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $pluginsPrettyPhoto ?>.js"></script>

<?php
  $pluginsMCustomScrollbar = filemtime(PATH_ASSETS.'../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js');
?> 
    <script type="text/javascript" src="../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $pluginsMCustomScrollbar ?>.js"></script>

<?php
  $pluginsTagsInput = filemtime(PATH_ASSETS.'../plugins/tagsInput/jquery.tagsinput.min.js');
?> 

    <script type="text/javascript" src="../plugins/tagsInput/jquery.tagsinput.min.<?php echo $pluginsTagsInput ?>.js"></script>

<?php
  $pluginsBootstrap = filemtime(PATH_ASSETS.'../plugins/bootstrap-switch/bootstrap-switch.min.js');
?> 

    <script type="text/javascript" src="../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $pluginsTagsInput ?>.js"></script>

<?php
  $pluginsBlockUi = filemtime(PATH_ASSETS.'../plugins/blockUI/jquery.blockUI.js');
?> 

    <script type="text/javascript" src="../plugins/blockUI/jquery.blockUI.<?php echo $pluginsBlockUi ?>.js"></script>

<?php
  $pluginsPnotify = filemtime(PATH_ASSETS.'../plugins/pnotify/js/jquery.pnotify.min.js');
?>  
    <script type="text/javascript" src="../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pluginsPnotify ?>.js"></script>


<?php
  $theme = filemtime(PATH_ASSETS.'../js/theme.js');
?> 
    <script type="text/javascript" src="../js/theme.<?php echo $theme ?>.js"></script>

<?php
  $custom = filemtime(PATH_ASSETS.'../custom/custom.js');
?>   
    <script type="text/javascript" src="../custom/custom.<?php echo $custom ?>.js"></script>
     

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
    </style>

{/literal}

<!-- End of Data -->
</head>    

<body id="tables" class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed      responsive    clearfix" data-active="tables "  data-smooth-scrolling="1"> 
<div class="vd_body">
<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>Les Structures</h1>
    </div>
</div>

{foreach from=$aTableauRetour item=aTabRetourItem}
    <div class="col-md-4">
        <div class="panel widget">

            <div class="panel-heading vd_bg-blue" style="height: 53px;">
                <h3 class="panel-title"> {$aTabRetourItem.nom_entite} ( N° {$aTabRetourItem.id_entite} {$aTabRetourItem.identifiant_entite} )</h3>
            </div>
            <div class="panel-body">
                <ul>
                    <li> <a href="../index.php?administration={$aTabRetourItem.raccourcir_admin_entite}" target="_blank">Le Backoffice</a>
                    <li> <a href="centre-{$aTabRetourItem.raccourcir_admin_entite}.html" target="_blank">Lien Backoffice propre</a>
                    <li> <a href="../index_public_debug.php?idc={$aTabRetourItem.identifiant_entite}" target="_blank">Le Widget prise de RDV</a>
                    <li> <a href="../index_public_anesthesiste_debug.php?idc={$aTabRetourItem.identifiant_entite}" target="_blank">Le Widget anesthesiste</a>
                    <li> <a href="../index_public_compte_debug.php?idc={$aTabRetourItem.identifiant_entite}" target="_blank">Le Widget compte client</a>
                        {*<li> <a href="mini_site/{$aTabRetourItem.identifiant_entite}" target="_blank">Site du Widget</a>*}
                    <li> <a href="{$aTabRetourItem.urlsite_entite}" target="_blank">Site du Widget</a>
                    <li> <a href="../index_borne.php?idc={$aTabRetourItem.identifiant_entite}" target="_blank">Borne lieu</a>
                    <li> <a href="../votre-centre-{$aTabRetourItem.raccourcir_admin_entite}" target="_blank">Liste action client seul</a>
                    <li> <a href="../ReactSuiviPatient/?idc={$aTabRetourItem.identifiant_entite}#/login" target="_blank">Projet bayer</a>
                    <li> Tel: {$aTabRetourItem.tel_entite}
                    <li> Module externe: <b>{$aTabRetourItem.type_module_externe_entite}</b>
                </ul>

            </div>

        </div>
    </div>
{/foreach}

</div>

</body>
</html>
