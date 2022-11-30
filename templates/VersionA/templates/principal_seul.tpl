<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html><!--<![endif]-->

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
    <link href="css/bootstrap.min.{$bosstrapMinG}.css" rel="stylesheet" type="text/css">
    <link href="css/font-awesome.min.{$awesomeMinG}.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <link href="css/font-entypo.{$entypoG}.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <link href="css/fonts.{$fontG}.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <link href="plugins/jquery-ui/jquery-ui.custom.min.{$cutomMinG}.css" rel="stylesheet" type="text/css">    
    <link href="plugins/prettyPhoto-plugin/css/prettyPhoto.{$prettypgotoG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/isotope/css/isotope.{$isotopeG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/pnotify/css/jquery.pnotify.{$pnotifyG}.css" media="screen" rel="stylesheet" type="text/css">    
    <link href="plugins/google-code-prettify/prettify.{$prettifyG}.css" rel="stylesheet" type="text/css"> 
   
         
    <link href="plugins/mCustomScrollbar/jquery.mCustomScrollbar.{$customscrollbarG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/tagsInput/jquery.tagsinput.{$tagsinputiG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-switch/bootstrap-switch.{$bosstrapSwitchG}.css" rel="stylesheet" type="text/css">    
    <link href="plugins/daterangepicker/daterangepicker-bs3.{$daterangepickerG}.css" rel="stylesheet" type="text/css">    
    <link href="plugins/bootstrap-timepicker/bootstrap-timepicker.min.{$timepickerG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/colorpicker/css/colorpicker.{$colorepickerG}.css" rel="stylesheet" type="text/css">            
    <!-- Specific CSS -->
    <link href="plugins/dataTables/css/jquery.dataTables.min.{$datatableMinG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/dataTables/css/dataTables.bootstrap.{$datatableBoostrapG}.css" rel="stylesheet" type="text/css">      
    <link href="plugins/jquery-file-upload/css/jquery.fileupload.{$fileuploadG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/jquery-file-upload/css/jquery.fileupload-ui.{$fileuploadUiG}.css" rel="stylesheet" type="text/css">
    <link href="plugins/bootstrap-wysiwyg/css/bootstrap-wysihtml5-0.0.2.{$wysihtml5G}.css" rel="stylesheet" type="text/css">  
    <link href='plugins/fullcalendar-2.3.1/fullcalendar.{$fullcalendarG}.css' rel='stylesheet' />
    <link href='plugins/fullcalendar-2.3.1/fullcalendar.print.{$fullcalendarPrintG}.css' rel='stylesheet' media='print' />  
    <!-- Theme CSS -->
    <link href="css/theme.{$themeG}.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="css/chrome.{$chromeG}.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    

  
    <!-- Responsive CSS -->
    <link href="css/theme-responsive.min.{$responsiveMiNG}.css" rel="stylesheet" type="text/css"> 

	
 
 
    <!-- for specific page in style css -->
        
    <!-- for specific page responsive in style css -->
        
    
    <!-- Custom CSS -->
    <link href="custom/custom.{$customG}.css" rel="stylesheet" type="text/css">


{literal}
    <!-- Head SCRIPTS -->
    <?php $modernizr_2 = filemtime(PATH_ASSETS.'js/modernizr.js'); ?>
    <script type="text/javascript" src="js/modernizr.<?php echo $modernizr_2 ?>.js"></script> 
    <?php $mobileDetectMin = filemtime(PATH_ASSETS.'js/mobile-detect.min.js'); ?>
    <script type="text/javascript" src="js/mobile-detect.min.<?php echo $mobileDetectMin ?>.js"></script> 
    <?php $mobileDetectModernizr = filemtime(PATH_ASSETS.'js/mobile-detect-modernizr.js'); ?>
    <script type="text/javascript" src="js/mobile-detect-modernizr.<?php echo $mobileDetectModernizr ?>.js"></script> 
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
    
    <!-- Javascript =============================================== --> 
    <!-- Placed at the end of the document so the pages load faster --> 
    <?php $jqueryMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.3.1/lib/jquery.min.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/lib/jquery.min.<?php echo $jqueryMin ?>.js'></script>

    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/excanvas.js"></script>      
    <![endif]-->
    <?php $bootstrapMin = filemtime(PATH_ASSETS.'js/bootstrap.min.js'); ?>
    <script type="text/javascript" src="js/bootstrap.min.<?php echo $bootstrapMin ?>.js"></script> 
    <?php $jqueryUiCustomMin = filemtime(PATH_ASSETS.'plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
    <script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryUiCustomMin ?>.js'></script>
    <?php $jqueryUiTouchPunchMin = filemtime(PATH_ASSETS.'plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryUiTouchPunchMin ?>.js"></script>

    <?php $caroufredsel_2 = filemtime(PATH_ASSETS.'js/caroufredsel.js'); ?>
    <script type="text/javascript" src="js/caroufredsel.<?php echo $caroufredsel_2 ?>.js"></script> 
    <?php $plugins_2 = filemtime(PATH_ASSETS.'js/plugins.js'); ?>
    <script type="text/javascript" src="js/plugins.<?php echo $plugins_2 ?>.js"></script>
    <?php $framework_2 = filemtime(PATH_ASSETS.'js/framwork_js.js'); ?>
    <script type="text/javascript" src="js/framwork_js.<?php echo $framework_2 ?>.js"></script>

    <?php $breakpoints_2 = filemtime(PATH_ASSETS.'plugins/breakpoints/breakpoints.js'); ?>
    <script type="text/javascript" src="plugins/breakpoints/breakpoints.<?php echo $breakpoints_2 ?>.js"></script>
    <?php $jqueryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesMin ?>.js"></script>
    <?php $jqueryPrettyPhoto = filemtime(PATH_ASSETS.'plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
    <script type="text/javascript" src="plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $jqueryPrettyPhoto ?>.js"></script> 

    <?php $jqueryMcustomScrollbarConcatMin = filemtime(PATH_ASSETS.'plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
    <script type="text/javascript" src="plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $jqueryMcustomScrollbarConcatMin ?>.js"></script>
    <?php $jqueryTagsInputMin = filemtime(PATH_ASSETS.'plugins/tagsInput/jquery.tagsinput.min.js'); ?>
    <script type="text/javascript" src="plugins/tagsInput/jquery.tagsinput.min.<?php echo $jqueryTagsInputMin ?>.js"></script>
    <?php $bootstrapSwitchMin = filemtime(PATH_ASSETS.'plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
    <script type="text/javascript" src="plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin ?>.js"></script>
    <?php $jqueryBlockUi = filemtime(PATH_ASSETS.'plugins/blockUI/jquery.blockUI.js'); ?>
    <script type="text/javascript" src="plugins/blockUI/jquery.blockUI.<?php echo $jqueryBlockUi ?>.js"></script>
    <?php $jqueryPnotifyMin = filemtime(PATH_ASSETS.'plugins/pnotify/js/jquery.pnotify.min.js'); ?>
    <script type="text/javascript" src="plugins/pnotify/js/jquery.pnotify.min.<?php echo $jqueryPnotifyMin ?>.js"></script>



    <?php $theme_2 = filemtime(PATH_ASSETS.'js/theme.js'); ?>
    <script type="text/javascript" src="js/theme.<?php echo $theme_2 ?>.js"></script>
    <?php $custom_2 = filemtime(PATH_ASSETS.'custom/custom.js'); ?>
    <script type="text/javascript" src="custom/custom.<?php echo $custom_2 ?>.js"></script>
     
    <!-- Specific Page Scripts Put Here -->

    <?php $jqueryDataTablesMin = filemtime(PATH_ASSETS.'plugins/dataTables/jquery.dataTables.min.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/jquery.dataTables.min.<?php echo $jqueryDataTablesMin ?>.js"></script>
    <?php $dataTablesBootstrap = filemtime(PATH_ASSETS.'plugins/dataTables/dataTables.bootstrap.js'); ?>
    <script type="text/javascript" src="plugins/dataTables/dataTables.bootstrap.<?php echo $dataTablesBootstrap ?>.js"></script>
    <?php $datapicker_2 = filemtime(PATH_ASSETS.'js/datepicker-fr.js'); ?>
    <script type="text/javascript" src="js/datepicker-fr.<?php echo $datapicker_2 ?>.js"></script>

    <?php $bootstrapTimePicker = filemtime(PATH_ASSETS.'plugins/bootstrap-timepicker/bootstrap-timepicker.min.js'); ?>
    <script type="text/javascript" src='plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $bootstrapTimePicker ?>.js'></script>
    <?php $momentMin = filemtime(PATH_ASSETS.'plugins/daterangepicker/moment.min.js'); ?>
    <script type="text/javascript" src='plugins/daterangepicker/moment.min.<?php echo $momentMin ?>.js'></script>
    <?php $daterangePicker_2 = filemtime(PATH_ASSETS.'plugins/daterangepicker/daterangepicker.js'); ?>
    <script type="text/javascript" src='plugins/daterangepicker/daterangepicker.<?php echo $daterangePicker_2 ?>.js'></script>
    <?php $colorPicker_2 = filemtime(PATH_ASSETS.'plugins/colorpicker/colorpicker.js'); ?>
    <script type="text/javascript" src='plugins/colorpicker/colorpicker.<?php echo $colorPicker_2 ?>.js'></script>


    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <?php $loadImageMin = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/load-image.min.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/load-image.min.<?php echo $loadImageMin ?>.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <?php $jqueryIframeTransport = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.iframe-transport.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.iframe-transport.<?php echo $jqueryIframeTransport ?>.js"></script>
    <!-- The basic File Upload plugin -->
    <?php $jqueryFileupload = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload.<?php echo $jqueryFileupload ?>.js"></script>
    <!-- The File Upload processing plugin -->
    <?php $jqueryFileupload_2 = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-process.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-process.<?php echo $jqueryFileupload_2 ?>.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <?php $jqueryFileuploadImage = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-image.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-image.<?php echo $jqueryFileuploadImage ?>.js"></script>
    <!-- The File Upload audio preview plugin -->
    <?php $jqueryFileuploadAudio = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-audio.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-audio.<?php echo $jqueryFileuploadAudio ?>.js"></script>
    <!-- The File Upload validation plugin -->
    <?php $jqueryFileuploadValidate = filemtime(PATH_ASSETS.'plugins/jquery-file-upload/js/jquery.fileupload-validate.js'); ?>
    <script type="text/javascript" src="plugins/jquery-file-upload/js/jquery.fileupload-validate.<?php echo $jqueryFileuploadValidate ?>.js"></script>

    

    <!-- Specific Page Scripts END -->

    <?php $momentMin_2 = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.3.1/lib/moment.min.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/lib/moment.min.<?php echo $momentMin_2 ?>.js'></script>
    
    <?php $fullcalendarMin = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.3.1/fullcalendar.min.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/fullcalendar.min.<?php echo $fullcalendarMin ?>.js'></script>
    <?php $langAll = filemtime(PATH_ASSETS.'plugins/fullcalendar-2.3.1/lang-all.js'); ?>
    <script src='plugins/fullcalendar-2.3.1/lang-all.<?php echo $langAll ?>.js'></script>


    <script type="text/javascript">
        $(document).ready(function() {
          "use strict";
          
          $('#data-tables').dataTable();


        });
    </script>
    {/literal}



<!-- End of Data -->
</head>    

<body id="tables" class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed      responsive    clearfix" data-active="tables "  data-smooth-scrolling="1">     
<div class="vd_body">
  <!-- Header Ends --> 
<div class="content">
  <div class="container">

    <!-- Middle Content Start -->

 
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


<!-- Footer END -->
 

</div>

<!-- .vd_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>

<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->



</body>
</html>