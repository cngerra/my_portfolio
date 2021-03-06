<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width">
	<title><?php
		/*
		 * Print the <title> tag based on what is being viewed.
		 */
		global $page, $paged;

		wp_title( '|', true, 'right' );

		// Add the blog name.
		bloginfo( 'name' );

		?>
	</title>
	<?php $x2fair_options = get_option('x2fair_theme_settings'); ?>
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<link rel="shortcut icon" href="<?php echo $x2fair_options['x2fair_favicon']; ?>" />
	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js"></script>
	<![endif]-->
	<?php wp_head(); ?>
	<!-- Google Analytics Tracking Code Begins- DO NOT remove --> 
    <script type="text/javascript"> 
    	// var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www."); document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E")); </script> <script type="text/javascript"> try { var pageTracker = _gat._getTracker("<?php echo $x2fair_options['x2fair_ga'] ?>"); pageTracker._trackPageview(); } catch(err) {}
    </script>
    <!-- Google Analytics Tracking Code ends- DO NOT remove -->  
    <link rel='stylesheet' href='<?php echo get_template_directory_uri(); ?>/css/animate.min.css' type='text/css' media='all' />
</head>
<body>
<div id="container">