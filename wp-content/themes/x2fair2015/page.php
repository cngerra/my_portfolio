<?php

/*
	Template Name: Full Width
	Description: A full width template with no sidebar
*/

get_header();
?>
<?php $x2fair_options = get_option('theme_christopher_options'); ?>
<header class="header_inner navbar-fixed-top">
	<div class="container"> 
		<div class="row">
			<div class="logo_wrapper">
		        <?php if ( $x2fair_options['logo'] != '' ): ?>
		            <a href='<?php echo esc_url( home_url( '/' ) ); ?>' rel='home' class="logo">
		                <img src="<?php echo $x2fair_options['logo']; ?>" />
		            </a>
		        <?php  else: ?>
		        	<a href='<?php echo esc_url( home_url( '/' ) ); ?>' rel='home'><?php bloginfo( 'name' ); ?></a>
		        <?php  endif; ?>
		    </div>
		    <nav class="col-xs-12 col-sm-6 col-md-5 navbar navbar-default" role="navigation">
				<div class="row">
					<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#webnav-nav">
							<span class="sr-only">Toggle navigation</span>
							<span class="caret"></span>
						</button>
						<a class="navbar-brand visible-xs" href="<?php echo home_url(); ?>">HOME</a>
					</div>

						<?php
							wp_nav_menu( array(
								'menu'              => 'primary',
								'theme_location'    => 'primary',
								'depth'             => 2,
								'container'         => 'div',
								'container_class'   => 'collapse navbar-collapse',
								'container_id'      => 'webnav-nav',
								'menu_class'        => 'nav navbar-nav',
								'fallback_cb'       => 'wp_bootstrap_navwalker::fallback',
								'walker'            => new wp_bootstrap_navwalker())
							);
						?>
					</div>
				</div>
			</nav>
		</div>
	</div>
</header>
<?php
$args = array(
	'sort_order'	=> 'ASC',
	'sort_column'	=> 'menu_order', //post title
	'hierarchical'	=> 1,
	'exclude'		=> '',
	'child_of'		=> 0,
	'parent'		=> -1,
	'exclude_tree'	=> '',
	'number'		=> '',
	'offset'		=> 0,
	'post_type'		=> 'page',
	'post_status'	=> 'publish'
);

$pages	= get_pages($args);

foreach ($pages as $page_data) {
	$content	= apply_filters('the_content', $page_data->post_content);
	$title		= $page_data->post_title;
	$slug		= $page_data->post_name;
?>
<section id="<?php echo $slug;?>" class="<?php echo $slug; ?>">			
	<div class="container pages">
		<h2 class="title"><?php echo $title; ?></h2>
		<?php echo $content; ?>
	</div>
</section>
<?php
	}//enf of foreach
?>
</div>
<?php get_footer(); ?>