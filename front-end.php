<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->	<html><!--<![endif]-->
<?php

    include('../../class/class_front_end.php');

    $objFrontEnd = new class_front_end();

    /*$urlsite = "dev.alaxione.fr";
    $urlsite = "www.visis.fr";


    $tabInfo = $objFrontEnd->renvoi_identifiant_structure($urlsite);
*/
    $tabInfo = array();
    $tabInfo[0]['identifiant_entite'] = "3xemvhlbybqrhrjv";

    $tabInfoStructure = $objFrontEnd->renvoi_info_structure($tabInfo[0]['identifiant_entite']);
    $tabInfoLieux = $objFrontEnd->renvoi_liste_lieux($tabInfo[0]['identifiant_entite']);
    $tabInfoPraticiens = $objFrontEnd->renvoi_liste_praticiens($tabInfo[0]['identifiant_entite']);
    $tabInfoPhotoSlide = $objFrontEnd->renvoi_photo_slide($tabInfo[0]['identifiant_entite']);

/*	echo"<pre>";print_r($tabInfo);echo"</pre>";
    echo"<pre>";print_r($tabInfoStructure);echo"</pre>";
    echo"<pre>";print_r($tabInfoLieux);echo"</pre>";
    echo"<pre>";print_r($tabInfoPraticiens);echo"</pre>";
*/
/*  GENERAL SETTING  */

    $author = 'Alaxione'; // for author meta data: <meta name="author" content="$author; ">
    $website_name = $tabInfoStructure[0]['nom_entite']; // for closing title every page: <title>$title;  | $website_name;</title>
    $footer_message = 'Copyright &copy;2015 Alaxione'; // Set Copyright message on footer
    $logo_path = '../../img/logo.png';
    $background = ''; // '' = none, or 'background-login', 'vd_bg-grey', 'background-1' until 'background-8' or create your own background css



/*  LAYOUT SETTING  */

    $responsive = 1; // 1= Responsive, 0 = Non Responsive
    $width_non_responsive = 1170; // Width for middle or boxed layout with non responsive ( if $responsive set to 0)
    $layout = 'full-layout'; // 'full-layout', 'middle-layout', 'boxed-layout'
    $navbar_top_fixed = 1; // 1 = Top Navigation bar follow when scroll down, 0 = normal



/*  HEADER AND FOOTER SETTING  */

    $header = 'header-1'; // 'header-1' or 'header-2' or 'header-3' or 'header-4' ,or other 'header-*' located at templates/headers/$header.tpl.php
    $footer = 'footer-1'; // 'footer-1' or 'footer-2' or 'footer-3' or 'footer-4' ,or other 'header-*' located at templates/footers/$footer.tpl.php



/*  HEAD SECTION PANEL MENU SETTING  */

    $remove_navbar = 1; // Remove Navbar Toggle Button, 1 = show, 0 = hide
    $remove_header = 1; // Remove Header Toggle Button, 1 = show, 0 = hide
    $fullscreen = 1; // Full Screen Toggle Button, 1 = show, 0 = hide
    $boxedtofull = 0; // Boxed to Full Layout Toggle Button, 1 = show, 0 = hide
    


/*  LEFT SIDEBAR NAVIGATION SETTING  */

    $navbar_left_config = 1; // 2 = Available but Start Invisible, 1 = Available Start Visible, 0 = Not available
    $navbar_left = 'navbar-tabs-menu'; // 'navbar-tabs-menu' or 'navbar-tabs-profile' or 'navbar-tabs-tab' or 'navbar-email' or 'navbar-chat' or 'navbar-no-tab'
    $navbar_left_start_width = ''; // '' = default width, 'nav-left-medium' = medium width, 'nav-left-small' = small width
    $navbar_left_fixed = 0; // Navbar left: 1 = fixed position , 0 = normal, fixed position compatible with no footer layout
    $navbar_left_menu = 'default'; // located at templates/navbars/menu- $navbar_left_menu .tpl.php
    $navbar_left_extra_class ='';

        

/*  RIGHT SIDEBAR NAVIGATION SETTING  */
        
    $navbar_right_config = 2; // 2 = Available but Start Invisible, 1 = Available Start Visible, 0 = Not available
    $navbar_right = 'navbar-chat'; // 'navbar-tabs-menu' or 'navbar-tabs-profile' or 'navbar-tabs-tab' or 'navbar-email' or 'navbar-chat' or 'navbar-no-tab'
    $navbar_right_start_width = ''; // '' = default width, 'nav-right-medium' = medium width, 'nav-right-small' = small width
    $navbar_right_fixed = 0; // Condition: for right aligned navbar, $layout must be 'full-layout',  1 = fixed position , 0 = normal, compatible with no footer layout
    $navbar_right_menu = 'default'; // located at templates/navbars/menu- $navbar_right_menu .tpl.php
    $navbar_right_extra_class ='';
    


/*  SIDEBAR MENU TOGGLE BUTTON SETTING  */

    $medium_nav_toggle = 1; // visibility of change sidebar menu width from large to medium button: 1= visible, 0 = none
    $small_nav_toggle = 1; // visibility of change sidebar menu width from large to small or medium to small button: 1= visible, 0 = none
    $enlarge_left_to_medium = '0'; // if small_nav_toggle clicked, enlarge left sidebar menu to: '1' = medium, '0' default/large;
    $enlarge_right_to_medium = '0'; // if small_nav_toggle clicked, enlarge right sidebar menu to '1' = medium, '0' default/large;
    
    

/*  EXTRA CLASS SETTING  */

    $top_menu_extra_class = '';  // background class such as 'vd_bg-white', also 'light-top-menu', 'menu-search-style-2'
    $logo_container_extra_class =''; // background class such as 'vd_bg-green', also 'panel-menu-style-2'
    $bottom_extra_class = ''; // located inside footer <div class="vd_bottom $bottom_extra_class"> value: background class such as 'vd_bg-white' padding or any other class
    $body_extra_class = ''; // 'content-style-2' : No Border Bottom on Title, 'login-layout' Make Specific layout for login, register, and forget password page,
                            // 'front-layout' : Make Specific layout for login, register, and forget password page, 'remove-navbar' : Using no sidebar at all,
                            // 'no-header' : Make Fixed Navbar to Go to Top
                            // or other Additional Body Class
                            
                            
/*  SPECIFIC PAGE SETTING  */
// Use for adding specific css files or add style for that page to put inside <head> tags

//	$specific_css[] type: array, example use: $specific_css[0] = 'plugins/introjs/css/introjs.min.css';	 $specific_css[1] = 'plugins/introjs/css/introjs2.min.css';
//	$page_css = '' for adding style to specific page, no need to add <style> </style>
//	$page_responsive_css = '' for adding responsive style to specific page, no need to add <style> </style>

                            
?>

<!-- Specific Page Data -->
<?php $title = $tabInfoStructure[0]['nom_entite']; ?>
<?php $keywords = ''; ?>
<?php $description = ''; ?>
<?php $page = 'login-page';   // To set active on the same id of primary menu?>
<?php $id_page = 'login-page';   // To set active on the same id of primary menu?>
<!-- End of Data -->
<?php $layout="middle-layout" ;
    $body_extra_class="remove-navbar front-layout";
    $top_menu_extra_class="vd_bg-white light-top-menu";
    $header="header-front-2";

    $footer = "footer-4";
    $bottom_extra_class = "vd_bg-dark-green pd-20";
    $background = "background-login";
          
    $navbar_left_config = 0;
    $navbar_right_config = 0;

    $specific_css[0]="../../plugins/layerslider/css/layerslider.css";
    $specific_css[1] ="../../css/animate.css";
          
?>

<head>
    <meta charset="utf-8" />
    <title><?php if (isset($title)) {
    echo $title;
} ?></title>
    <meta name="keywords" content="<?php if (isset($keywords)) {
    echo $keywords;
} ?>" />
    <meta name="description" content="<?php if (isset($description)) {
    echo $description;
} ?>">
    <meta name="author" content="<?php if (isset($author)) {
    echo $author;
} ?>">
    
    <!-- Set the viewport width to device width for mobile -->
    <?php if ($responsive) {?><meta name="viewport" content="width=device-width, initial-scale=1.0"><?php }?>    
    
    
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../../img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../../img/ico/favicon.png">
    
    
    <!-- CSS -->
       
    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <?php $styleSheet = filemtime(PATH_ASSETS.'../../css/bootstrap.min.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../css/bootstrap.min.<?php echo $styleSheet ?>.css" rel="stylesheet" type="text/css">
    <?php $styleSheet_1 = filemtime(PATH_ASSETS.'../../css/font-awesome.min.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../css/font-awesome.min.<?php echo $styleSheet_1 ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
    <?php $styleSheet_2 = filemtime(PATH_ASSETS.'../../css/font-entypo.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../css/font-entypo.<?php echo $styleSheet_2 ?>.css" rel="stylesheet" type="text/css">    

    <!-- Fonts CSS -->
    <?php $styleSheet_3 = filemtime(PATH_ASSETS.'../../css/fonts.css"  rel="stylesheet" type="text/css'); ?>
	<link href="../../css/fonts.<?php echo $styleSheet_3 ?>.css"  rel="stylesheet" type="text/css">
               
    <!-- Plugin CSS -->
    <?php $customMin_2 = filemtime(PATH_ASSETS.'../../plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $customMin_2 ?>.css" rel="stylesheet" type="text/css">    
    <?php $prettyPhoto = filemtime(PATH_ASSETS.'../../plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../plugins/prettyPhoto-plugin/css/prettyPhoto.<?php echo $prettyPhoto ?>.css" rel="stylesheet" type="text/css">
    <?php $steelSheet_2 = filemtime(PATH_ASSETS.'../../plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../plugins/isotope/css/isotope.<?php echo $steelSheet_2 ?>.css" rel="stylesheet" type="text/css">
    <link href="../../plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">    
	<?php $pnotify_3 = filemtime(PATH_ASSETS.'../../plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet'); ?>
	<link href="../../plugins/google-code-prettify/prettify.<?php echo $pnotify_3 ?>.css" rel="stylesheet" type="text/css"> 
   
         
    <?php $mScrollarbar_2 = filemtime(PATH_ASSETS.'../../plugins/mCustomScrollbar/jquery.mCustomScrollbar.css'); ?>
	<link href="../../plugins/mCustomScrollbar/jquery.mCustomScrollbar.<?php echo $mScrollarbar_2 ?>.css" rel="stylesheet" type="text/css">
    <?php $tagsInput_2 = filemtime(PATH_ASSETS.'../../plugins/tagsInput/jquery.tagsinput.css'); ?>
	<link href="../../plugins/tagsInput/jquery.tagsinput.<?php echo $tagsInput_2 ?>.css" rel="stylesheet" type="text/css">
    <?php $bootstrap_3 = filemtime(PATH_ASSETS.'../../plugins/bootstrap-switch/bootstrap-switch.css'); ?>
	<link href="../../plugins/bootstrap-switch/bootstrap-switch.<?php echo $bootstrap_3 ?>.css" rel="stylesheet" type="text/css">    
    <?php $daterange = filemtime(PATH_ASSETS.'../../plugins/daterangepicker/daterangepicker-bs3.css'); ?>
	<link href="../../plugins/daterangepicker/daterangepicker-bs3.<?php echo $daterange ?>.css" rel="stylesheet" type="text/css">    
    <?php $timepicker_2 = filemtime(PATH_ASSETS.'../../plugins/bootstrap-timepicker/bootstrap-timepicker.min.css'); ?>
	<link href="../../plugins/bootstrap-timepicker/bootstrap-timepicker.min.<?php echo $timepicker_2 ?>.css" rel="stylesheet" type="text/css">
    <?php $colorPicker_3 = filemtime(PATH_ASSETS.'../../plugins/colorpicker/css/colorpicker.css'); ?>
	<link href="../../plugins/colorpicker/css/colorpicker.<?php echo $colorPicker_3 ?>.css" rel="stylesheet" type="text/css">            

	<!-- Specific CSS -->
	<?php if (isset($specific_css)) {
    foreach ($specific_css as $css) {
        echo '<link href="'.$css.'" rel="stylesheet" type="text/css">';
    }
}
    ?>
    
     
    <!-- Theme CSS -->
    <?php $syleSheet_4 = filemtime(PATH_ASSETS.'../../css/theme.min.css" rel="stylesheet" type="text/css'); ?>
	<link href="../../css/theme.min.<?php echo $syleSheet_4 ?>.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="css/ie.css" rel="stylesheet" > <![endif]-->
    <?php $syleSheet_5 = filemtime(PATH_ASSETS.'../../css/chrome.css" rel="stylesheet" type="text/chrome'); ?>
	<link href="../../css/chrome.<?php echo $syleSheet_5 ?>.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->    


        
    <!-- Responsive CSS -->
    <?php if ($responsive) {?>
    	<?php $syleSheet_6 = filemtime(PATH_ASSETS.'../../css/theme-responsive.min.css" rel="stylesheet'); ?>
		<link href="../../css/theme-responsive.min.<?php echo $syleSheet_6 ?>.css" rel="stylesheet" type="text/css"> 

	<?php } else { ?>
    	<?php $responsive_1 = filemtime(PATH_ASSETS.'../../css/non-responsive.css'); ?>
		<link href="../../css/non-responsive.<?php echo $responsive_1 ?>.css" rel="stylesheet" type="text/css">  
        <style>
		.middle-layout .container, .boxed-layout .container{
			width: <?php echo $width_non_responsive.'px'?> !important;
			max-width: <?php echo $width_non_responsive.'px'?> !important;					
		} 
		</style>
	<?php } ?>  
 
 
    <!-- for specific page in style css -->
    <?php if (isset($page_css)) { ?>
		<style>
	<?php echo $page_css ?>	
		</style>
	<?php }?>
    
    <!-- for specific page responsive in style css -->
    <?php if (($responsive) && (isset($page_responsive_css))) { ?>
		<style>
	<?php echo $page_responsive_css ?>	
		</style>
	<?php }?>    
    
    <!-- Custom CSS -->
    <?php $custom_3 = filemtime(PATH_ASSETS.'../../custom/custom.css'); ?>
	<link href="../../custom/custom.<?php echo $custom_3 ?>.css" rel="stylesheet" type="text/css">

    <style type="text/css">

    .light-top-menu .vd_mega-menu-wrapper.horizontal-menu .vd_mega-menu .mega-ul>.mega-li:hover,.light-top-menu .vd_mega-menu-wrapper.horizontal-menu .vd_mega-menu .mega-ul>.mega-li.active{
    	background:#27A1C2;
    }

    hr {
	  margin-top: 20px;
	  margin-bottom: 20px;
	  border: 0;
	  border-top: 1px solid #67B8CB;
	}


	.vd_testimonial .vd_carousel-control {
  		right: -50px;
  	}

  	.vd_section {
	   	padding-top: 30px; 
	  	padding-bottom: 30px; 
	}


	
	.btnspecial {
		font-weight: bold;
		text-shadow: 0 1px 0 white;
		border-radius: 3px;
		padding: 5px 10px;
		border: 1px solid #DDD;
		box-shadow:0px 0px 10px #4183C4;
		-webkit-box-shadow:0px 0px 10px #4183C4;
		-moz-box-shadow:0px 0px 10px #4183C4;
		-webkit-animation-name: bounce;
		-webkit-animation-duration: 1s;
		-webkit-animation-iteration-count:infinite;
		-moz-animation-name: bounce;
		-moz-animation-duration: 1s;
		-moz-animation-iteration-count:infinite;
		animation-name: bounce;
		animation-duration: 1s;
		animation-iteration-count:infinite;
	}
	
	@-webkit-keyframes bounce {
		0%{box-shadow:0px 0px 10px #4183C4;}
		50%{box-shadow:0px 0px 0px #4183C4;}
		100%{box-shadow:0px 0px 10px #4183C4;}
	}

	@-moz-keyframes bounce {
		0%{box-shadow:0px 0px 10px #4183C4;}
		50%{box-shadow:0px 0px 0px #4183C4;}
		100%{box-shadow:0px 0px 10px #4183C4;}
	}
		
	@keyframes bounce {
		0%{box-shadow:0px 0px 10px #4183C4;}
		50%{box-shadow:0px 0px 0px #4183C4;}
		100%{box-shadow:0px 0px 10px #4183C4;}
	}

    </style>

    <!-- Head SCRIPTS -->
	<?php $modernizr_1_1 = filemtime(PATH_ASSETS.'../../js/modernizr.js'); ?>
    <script type="text/javascript" src="../../js/modernizr.<?php echo $modernizr_1_1 ?>.js"></script> 
	<?php $mobileDtectMin_1_1 = filemtime(PATH_ASSETS.'../../js/mobile-detect.min.js'); ?>
	<script type="text/javascript" src="../../js/mobile-detect.min.<?php echo $mobileDtectMin_1_1 ?>.js"></script> 
	<?php $mobileDtectModernizr = filemtime(PATH_ASSETS.'../../js/mobile-detect-modernizr.js'); ?>
	<script type="text/javascript" src="../../js/mobile-detect-modernizr.<?php echo $mobileDtectModernizr ?>.js"></script> 
 
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
</head>    

<body id="<?php if (isset($page)) {
        echo $page;
    } ?>" class="<?php  if (isset($layout)) {
        echo $layout;
    } ?> <?php  if (isset($navbar_left_config)) {
        if ($navbar_left_config == 0) {
            echo 'no-nav-left';
        } elseif ($navbar_left_config == 2) {
            echo 'nav-left-hide nav-left-start-hide';
        }
    }     ?> <?php  if (isset($navbar_right_config)) {
        if ($navbar_right_config == 0) {
            echo 'no-nav-right';
        } elseif ($navbar_right_config == 2) {
            echo 'nav-right-hide nav-right-start-hide';
        }
    }     ?> <?php  if ($navbar_left_fixed) {
        echo 'nav-left-fixed';
    } if ($navbar_right_fixed) {
        echo 'nav-right-fixed';
    }  ?> <?php  if ($navbar_top_fixed) {
        echo 'nav-top-fixed';
    } ?> <?php  if (isset($background)) {
        echo $background;
    } ?> <?php  if (isset($navbar_left_start_width)) {
        echo $navbar_left_start_width;
    } ?> <?php  if (isset($navbar_right_start_width)) {
        echo $navbar_right_start_width;
    } ?> <?php  if ($enlarge_left_to_medium) {
        echo 'enlarge-left-to-medium';
    } ?> <?php  if ($enlarge_right_to_medium) {
        echo 'enlarge-right-to-medium';
    } ?> <?php if ($responsive) {
        echo 'responsive';
    } else {
        echo 'no-responsive';
    } ?> <?php  if (isset($body_extra_class)) {
        echo $body_extra_class;
    } ?>   clearfix" data-active="<?php if (isset($page)) {
        echo $page;
    } ?> "  data-smooth-scrolling="1">     
<div class="vd_body">
<!-- Header Start -->
  <header class="header-2" id="header">
      <div class="vd_top-menu-wrapper vd_bg-white light-top-menu">
        <div class="container">
          <div class="vd_top-nav vd_nav-width  ">
          <div class="vd_panel-header">
          	<div class="logo">
            	<a href="index.php"><?php if ($tabInfoStructure[0]['site_logo_entite']!="") {
        echo "<img alt='logo' src='../../img_front_end/".$tabInfoStructure[0]['site_logo_entite']."' height='30px' >";
    } ?></a>
            </div>
            <!-- logo -->
            <div class="vd_panel-menu visible-sm visible-xs">
                	<span class="menu visible-xs" data-action="submenu">
	                    <i class="fa fa-bars"></i>
                    </span>                                 
            </div>                                     
            <!-- vd_panel-menu -->
          </div>
          <!-- vd_panel-header -->
            
          </div>    
          <div class="vd_container">
          	<div class="row">
            	<div class="col-sm-12 col-xs-12">
              		<div class="vd_mega-menu-wrapper horizontal-menu">
                    	<div class="vd_mega-menu pull-right">                
            				<ul class="mega-ul nav">   
							    <li class="mega-li"> 
							        <a href="#" class="mega-link" data-waypoint="home"> 
							            <span class="menu-text"><i class="fa fa-home font-md hidden-xs"></i><span class="visible-xs">Home</span></span>
							        </a> 
							       
							    </li>
							    <li class="mega-li"> 
							        <a href="#" class="mega-link" data-waypoint="centre"> 
							            <span class="menu-text">Centre<?php if (sizeof($tabInfoLieux)>1) {
        echo "s";
    } ?></span>
							        </a> 
							       
							    </li>
							    <li class="mega-li"> 
							        <a href="#" class="mega-link" data-waypoint="praticien"> 
							            <span class="menu-text">Praticien<?php if (sizeof($tabInfoPraticiens)>1) {
        echo "s";
    } ?></span>
							        </a> 
							       
							    </li>
							    <li class="mega-li btnspecial"> 
							        <a href="#" class="mega-link " data-waypoint="rendezvous"> 
							            <span class="menu-text ">Prendre un rendez-vous</span>
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
<?php
    if ($tabInfoPhotoSlide[0]['site_slide_img1_entite']!="" || $tabInfoPhotoSlide[0]['site_slide_img2_entite']!="" || $tabInfoPhotoSlide[0]['site_slide_img3_entite']!="" || $tabInfoPhotoSlide[0]['site_slide_img4_entite']!="") {
        ?>
<div id="front-1-banner" class="vd_banner vd_bg-white clearfix slide-waypoint" data-waypoint="home" >
	<div id="layerslider" style="width:100%;height:500px;">
		<?php
            if ($tabInfoPhotoSlide[0]['site_slide_img1_entite']!="") {
                echo '<div class="ls-slide" data-ls="transition2d:8;slidedelay:4000;">
	            <img src="../../img_front_end/'.$tabInfoPhotoSlide[0]['site_slide_img1_entite'].'" class="ls-bg" alt="Slide background" width="1900px" height="500px" />
				</div>';
            }
        if ($tabInfoPhotoSlide[0]['site_slide_img2_entite']!="") {
            echo '<div class="ls-slide" data-ls="transition2d:8;slidedelay:4000;">
	            <img src="../../img_front_end/'.$tabInfoPhotoSlide[0]['site_slide_img2_entite'].'" class="ls-bg" alt="Slide background" width="1900px" height="500px" />
				</div>';
        }
        if ($tabInfoPhotoSlide[0]['site_slide_img3_entite']!="") {
            echo '<div class="ls-slide" data-ls="transition2d:8;slidedelay:4000;">
	            <img src="../../img_front_end/'.$tabInfoPhotoSlide[0]['site_slide_img3_entite'].'" class="ls-bg" alt="Slide background" width="1900px" height="500px" />
				</div>';
        }
        if ($tabInfoPhotoSlide[0]['site_slide_img4_entite']!="") {
            echo '<div class="ls-slide" data-ls="transition2d:8;slidedelay:4000;">
	            <img src="../../img_front_end/'.$tabInfoPhotoSlide[0]['site_slide_img4_entite'].'" class="ls-bg" alt="Slide background" width="1900px" height="500px" />
				</div>';
        } ?>              
	</div>
</div>
<?php
    } ?>

<?php if (!empty($tabInfoLieux)) { ?>
<div id="front-1-features" class="vd_section vd_banner vd_bg-white clearfix slide-waypoint" data-waypoint="centre">
  <div class="container">
    <div class="vd_content clearfix">
    	<?php $i=0; foreach ($tabInfoLieux as $tabIL) {
        $i++ ?>
	      	<div class="row">
	        	<?php if ($i!=1) {
            echo '<hr>';
        } ?>
	        	<div class="col-md-12" align="center">
	        		<h2 class="h1"><strong><?php echo $tabIL['nom_lieux']; ?></strong></h2>
		        	<?php if ($tabIL['photo_lieux']!="") {?>
		        	<div class="col-md-12" align="center">
			        	<div class="col-md-3"></div>
			        	<div class="col-md-6 text-center"> <img alt="example image" src="../../uploads/<?php echo $tabIL['photo_lieux']; ?>" /> </div>
			        	<div class="col-md-3"></div>
		        	</div>
		        	<?php } else { ?>
		        	<div class='menu-icon'>
		        		<i class='fa fa-university font-lg'></i>
		        	</div>
		        	<?php } ?>	
		          	
		          	<p class="font-sm">
		          		<?php
                            echo $tabIL['numero_lieux']." ".$tabIL['adresse_lieux']." ".$tabIL['complement_adresse_lieux']."<br/>";
        echo $tabIL['code_postal_lieux']." ".$tabIL['ville_lieux']."<br/><br/>";
        if ($tabIL['tel_lieux']!="") {
            echo 'Tel :'.$tabIL['tel_lieux'];
            if ($tabIL['fax_lieux']!="") {
                echo '- Fax :'.$tabIL['fax_lieux'];
            }
        }
        if ($tabIL['email_mail_lieux']!="") {
            echo '<br/>eMail :'.$tabIL['email_mail_lieux'];
        }
        if ($tabIL['horaires_ouverture_lieux']!="") {
            echo '<br/><br/><h3>Horaires d\'ouvertures</h3>'.$tabIL['horaires_ouverture_lieux'];
        } ?>
					</p>
					<br/>

					
	        	</div>
	      	</div>
		<?php
    } ?>
    </div>
  </div>
</div>
<?php } ?>

<?php if (!empty($tabInfoPraticiens)) { ?>
<div id="front-1-clients" class="vd_section vd_bg-soft-blue clearfix slide-waypoint" data-waypoint="praticien">
  <div class="container">
    <div class="vd_content clearfix">
      <div class="row">
        <div class="col-md-offset-2 col-md-8">
          	<h1 class="font-semibold mgbt-xs-20 vd_white"><strong>Praticien<?php if (sizeof($tabInfoPraticiens)>1) {
        echo "s";
    } ?></strong></h1>
            <div class="vd_testimonial clearfix">

              	<?php if (sizeof($tabInfoPraticiens)>1) { ?>
                <div class="vd_carousel-control"> 
                    <a href="#"> <i class="fa fa-chevron-left"></i></a> <a href="#"><i class="fa fa-chevron-right"></i></a> 
                </div>                        
                <?php } ?>

				<div class="vd_carousel">
                <?php foreach ($tabInfoPraticiens as $tabIP) { ?>
                    <div class="vd_carousel-column">
	                    <div class="col-md-12"> 
	                    	<div class="col-md-4">
	                    		<div class="menu-icon"> <?php if ($tabIP['photo_user']!="") { ?><img alt="example image" class="img-circle" src="../../uploads/<?php echo $tabIP['photo_user']; ?>" style="max-height: 100%;" /> <?php } ?></div>
	                        </div>
	                    	<div class="col-md-8">
	                    		<div class="content-list content-large">
		                    		<div class="menu-text"> <br/>
		                            	<br/>
		                            	<h3 class="vd_black font-semibold mgbt-xs-0"><strong>Dr. <?php echo $tabIP['nom_user']." ".$tabIP['prenom_user']; ?></strong></h3>
		                            	<p class="vd_black font-semibold"><?php if ($tabIP['specialite_user']!="") {
        echo $tabIP['specialite_user'];
    } else {
        echo " ";
    } ?></p>
		                          	</div>
		                          	<div class="clearfix mgtp-20">
			                        	<?php if ($tabIP['cursus_user']!="") { ?>
			                         	<div class="testimonial-word-wrapper">
			                            	<div class="caret-icon"> </div>
			                            	<div class="testimonial-word font-sm"><?php echo $tabIP['cursus_user']; ?></div>
			                          	</div>
			                          	<?php } ?>
			                        </div>
			                    </div>
	                    	</div>
	                    </div>
                    </div>
                <?php } ?>              
                </div> <!-- vd_carousel -->
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php } ?>


<div id="front-1-contacts" class="vd_section vd_bg-dark-white clearfix slide-waypoint" data-waypoint="rendezvous">
  	<div class="container">
    	<div class="vd_content clearfix">
      		<div class="row">
        		<div class="col-md-12">
		          	<h1 class="text-center vd_blue"> Prendre un rendez-vous en ligne ? </h1>
					<script type="text/javascript">var idc = "<?php echo $tabInfo[0]['identifiant_entite']; ?>";</script>
					<script type="text/javascript" src="http://prod.alaxione.fr/js/client.js"></script> 
      			</div>
    		</div>
  		</div>
	</div>
</div>
<!-- content -->

<!-- Middle Content End --> 



<!-- Footer Start -->
  <footer class="footer-2 "  id="footer">      
    <div class="vd_bottom <?php if (isset($bottom_extra_class)) {
        echo($bottom_extra_class);
    } ?> vd_bg-soft-blue">
        <div class="container">
            <div class="row">
              <div class=" col-xs-12">             
                <div class="copyright text-center"> 
							 
                	<p><span class="mgr-12">
                		<?php
                        echo $tabInfoStructure[0]['nom_entite']."<br/>";
                        echo $tabInfoStructure[0]['adresse_entite']." ".$tabInfoStructure[0]['code_postal_entite']." ".$tabInfoStructure[0]['ville_entite'];
                        ?>
                	</span><br/>
                	<?php
                    if ($tabInfoStructure[0]['tel_entite']!="") {
                        echo 'Tel :'.$tabInfoStructure[0]['tel_entite'];
                        if ($tabInfoStructure[0]['fax_entite']!="") {
                            echo '- Fax :'.$tabInfoStructure[0]['fax_entite'];
                        }
                    }
                    ?>
                    </p>
                  	<?php if (isset($footer_message)) {
                        echo($footer_message);
                    } ?> 
                </div>
              </div>
            </div><!-- row -->
        </div><!-- container -->
    </div>
  </footer>
<!-- Footer END -->

</div>
<!-- .vc_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>

<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->

<!-- Javascript =============================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script type="text/javascript" src="../../js/jquery.js"></script> 
<!--[if lt IE 9]>
  <script type="text/javascript" src="js/excanvas.js"></script>      
<![endif]-->
<?php $bootstapMin_2 = filemtime(PATH_ASSETS.'../../js/bootstrap.min.js'); ?>
<script type="text/javascript" src="../../js/bootstrap.min.<?php echo $bootstapMin_2 ?>.js"></script> 
<?php $jqueryUiCustomMin = filemtime(PATH_ASSETS.'../../plugins/jquery-ui/jquery-ui.custom.min.js'); ?>
<script type="text/javascript" src='../../plugins/jquery-ui/jquery-ui.custom.min.<?php echo $jqueryUiCustomMin ?>.js'></script>
<?php $jqueryUiTouchPunchMin = filemtime(PATH_ASSETS.'../../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js'); ?>
<script type="text/javascript" src="../../plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.<?php echo $jqueryUiTouchPunchMin ?>.js"></script>

<?php $caroufRedSel_2 = filemtime(PATH_ASSETS.'../../js/caroufredsel.js'); ?>
<script type="text/javascript" src="../../js/caroufredsel.<?php echo $caroufRedSel_2 ?>.js"></script> 
<?php $plugins_2 = filemtime(PATH_ASSETS.'../../js/plugins.js'); ?>
<script type="text/javascript" src="../../js/plugins.<?php echo $plugins_2 ?>.js"></script>

<?php $pluginsBreackPoints_2 = filemtime(PATH_ASSETS.'../../plugins/breakpoints/breakpoints.js'); ?>
<script type="text/javascript" src="../../plugins/breakpoints/breakpoints.<?php echo $pluginsBreackPoints_2 ?>.js"></script>
<?php $dataTablesMin_1 = filemtime(PATH_ASSETS.'../../plugins/dataTables/jquery.dataTables.min.js'); ?>
<script type="text/javascript" src="../../plugins/dataTables/jquery.dataTables.min.<?php echo $dataTablesMin_1 ?>.js"></script>
<?php $prettyPhoto_1 = filemtime(PATH_ASSETS.'../../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js'); ?>
<script type="text/javascript" src="../../plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.<?php echo $prettyPhoto_1 ?>.js"></script> 

<?php $mCustomScrollbarConcatMin_1 = filemtime(PATH_ASSETS.'../../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'); ?>
<script type="text/javascript" src="../../plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.<?php echo $mCustomScrollbarConcatMin_1 ?>.js"></script>
<?php $tagsInputMin_1 = filemtime(PATH_ASSETS.'../../plugins/tagsInput/jquery.tagsinput.min.js'); ?>
<script type="text/javascript" src="../../plugins/tagsInput/jquery.tagsinput.min.<?php echo $tagsInputMin_1 ?>.js"></script>
<?php $bootstrapSwitchMin_1 = filemtime(PATH_ASSETS.'../../plugins/bootstrap-switch/bootstrap-switch.min.js'); ?>
<script type="text/javascript" src="../../plugins/bootstrap-switch/bootstrap-switch.min.<?php echo $bootstrapSwitchMin_1 ?>.js"></script>
<?php $blockUi_1 = filemtime(PATH_ASSETS.'../../plugins/blockUI/jquery.blockUI.js'); ?>
<script type="text/javascript" src="../../plugins/blockUI/jquery.blockUI.<?php echo $blockUi_1 ?>.js"></script>
<?php $pnotifyMin_1 = filemtime(PATH_ASSETS.'../../plugins/pnotify/js/jquery.pnotify.min.js'); ?>
<script type="text/javascript" src="../../plugins/pnotify/js/jquery.pnotify.min.<?php echo $pnotifyMin_1 ?>.js"></script>

<?php $theme_2 = filemtime(PATH_ASSETS.'../../js/theme.js'); ?>
<script type="text/javascript" src="../../js/theme.<?php echo $theme_2 ?>.js"></script>
<?php $custom_2 = filemtime(PATH_ASSETS.'../../custom/custom.js'); ?>
<script type="text/javascript" src="../../custom/custom.<?php echo $custom_2 ?>.js"></script>
 


<!-- Specific Page Scripts Put Here -->
<?php $jqueryStellar = filemtime(PATH_ASSETS.'../../plugins/stellar/jquery.stellar.js'); ?>
<script type="text/javascript" src="../../plugins/stellar/jquery.stellar.<?php echo $jqueryStellar ?>.js"></script>
<?php $wayPointsMin = filemtime(PATH_ASSETS.'../../plugins/waypoints/waypoints.min.js'); ?>
<script type="text/javascript" src="../../plugins/waypoints/waypoints.min.<?php echo $wayPointsMin ?>.js"></script>
<?php $jqueryEasing = filemtime(PATH_ASSETS.'../../plugins/jquery-easing/jquery.easing.1.3.js'); ?>
<script type="text/javascript" src="../../plugins/jquery-easing/jquery.easing.1.3.<?php echo $jqueryEasing ?>.js"></script>

<?php $greenSock = filemtime(PATH_ASSETS.'../../plugins/layerslider/js/greensock.js'); ?>
<script src="../../plugins/layerslider/js/greensock.<?php echo $greenSock ?>.js" type="text/javascript"></script>
<!-- LayerSlider script files -->
<?php $layersliderTransitions = filemtime(PATH_ASSETS.'../../plugins/layerslider/js/layerslider.transitions.js'); ?>
<script src="../../plugins/layerslider/js/layerslider.transitions.<?php echo $layersliderTransitions ?>.js" type="text/javascript"></script>
<?php $layersliderKreaturamediaJquery = filemtime(PATH_ASSETS.'../../plugins/layerslider/js/layerslider.kreaturamedia.jquery.js'); ?>
<script src="../../plugins/layerslider/js/layerslider.kreaturamedia.jquery.<?php echo $layersliderKreaturamediaJquery ?>.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	"use strict";
	
	var options = { 
		type: "POST",
		url:  $("#contact-form-widget").attr('action'),
		dataType: "json",
		success: function(data) {
			if (data.response == "success") {
				$("#contact-form-result div").addClass('hidden');
				$("#contact-form-result #success").removeClass('hidden');						
			} else if (data.response == "error") {
				$("#contact-form-result div").addClass('hidden');
				$("#contact-form-result #error").removeClass('hidden');	
				$("#contact-form-result #error").append(data.message);				
			} else if (data.response == "empty") {
				$("#contact-form-result div").addClass('hidden');
				$("#contact-form-result #empty").removeClass('hidden');						
			} else if (data.response == "unexpected") {
				$("#contact-form-result div").addClass('hidden');
				$("#contact-form-result #unexpected").removeClass('hidden');						
			}	
			$("#contact-form-widget").find('#contact-form-submit #spin').remove();
			$("#contact-form-widget").find('#contact-form-submit').removeClass('disabled').removeAttr('disabled').blur();	 

			$("#contact-form-widget").fadeOut(500, function(){
				$('#contact-form-result').fadeIn(500);
			});										
		},
		error: function() {
				$("#contact-form-result div").addClass('hidden');
				$("#contact-form-result #unexpected").removeClass('hidden');	
		}
	}; 	
	
	$("#contact-form-widget").validate({
		submitHandler: function(form) {			
			$(form).find('#contact-form-submit').prepend('<i id="spin" class="fa fa-spinner fa-spin mgr-10"></i>').addClass('disabled').attr('disabled');			
			$(form).ajaxSubmit(options);			
		},
		success: function(form){	
		}
	});	
	
	
	   $(".vd_testimonial .vd_carousel").carouFredSel({
			prev:{
				button : function()
				{
					return $(this).parent().parent().children('.vd_carousel-control').children('a:first-child')
				}
			},
			next:{
				button : function()
				{
					return $(this).parent().parent().children('.vd_carousel-control').children('a:last-child')
				}
			},		
			scroll: {
				fx: "crossfade",
				onBefore: function(){
						var target = "#front-1-clients";
						$(target).css("transition","all .5s ease-in-out 0s");				
						$(target).addClass("vd_bg-soft-blue");

					/*if ($(target).hasClass("vd_bg-soft-yellow")){						
						$(target).removeClass("vd_bg-soft-yellow");
						$(target).addClass("vd_bg-soft-red");		
					} else
					if ($(target).hasClass("vd_bg-soft-red")){						
						$(target).removeClass("vd_bg-soft-red");
						$(target).addClass("vd_bg-soft-blue");		
					} else
					if ($(target).hasClass("vd_bg-soft-blue")){						
						$(target).removeClass("vd_bg-soft-blue");
						$(target).addClass("vd_bg-soft-green");		
					} else
					if ($(target).hasClass("vd_bg-soft-green")){						
						$(target).removeClass("vd_bg-soft-green");
						$(target).addClass("vd_bg-soft-yellow");		
					} 
					*/					
				}
			},
			width: "auto",
			height: "auto",
			responsive: true
			
		});
		
	    var slide = $('.slide-waypoint');		
		
		//Setup waypoints plugin
		slide.waypoint(function(direction) {
	//  		alert('Direction example triggered scrolling ' + direction);
			//cache the variable of the data-waypoint attribute associated with each slide
			var dataslide = $(this).attr('data-waypoint');
	
	
	
			//If the user scrolls up change the navigation link that has the same data-waypoint attribute as the slide to active and 
			//remove the active class from the previous navigation link 
/*			if (direction === 'down') {	
				resetActive();
				$('.vc_primary-menu  ul li a[data-waypoint="' + dataslide + '"]').parent().addClass('active');		
			}
			else {
				resetActive();
				$('.vc_primary-menu  ul li a[data-waypoint="' + dataslide + '"]').parent().prev().addClass('active');						
			}
			*/
	
		},{offset:0});		
		


		$(".feature-item, .vd_gallery .gallery-item").css("opacity",0);	
			
		
		
		//Create a function that will be passed a slide number and then will scroll to that slide using jquerys animate. The Jquery
		//easing plugin is also used, so we passed in the easing method of 'easeInOutQuint' which is available throught the plugin.
		function goToByScroll(dataslide) {
			if (dataslide=="home"){
				$('html,body').animate({scrollTop:0},1500, 'easeInOutQuint');	
			} else {
				$('html,body').animate({
				   scrollTop: $('.slide-waypoint[data-waypoint="' + dataslide + '"]').offset().top
				}, 1500, 'easeInOutQuint');				
			}
		}	

		
		$('.vd_top-menu-wrapper .horizontal-menu .nav > li >  a[data-waypoint]').click(function (e) {		
			e.preventDefault();
			
			var dataslide = $(this).attr('data-waypoint');
			goToByScroll(dataslide);		
		});		
		
		jQuery("#layerslider").layerSlider({
			responsive: false,
			responsiveUnder: 1280,
			layersContainer: 1280,
			skin: 'noskin',
			hoverPrevNext: false,
			skinsPath: '../../plugins/layerslider/skins/'
		});		
});
</script>

<!-- Specific Page Scripts END -->

</body>
</html>