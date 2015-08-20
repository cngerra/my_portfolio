<?php
/*
Theme Name: Christopher Gerra Portfolio
Theme URI: http://christophergerra.com
Description: My Portfolio Template
Version: 1.0
Author: Christopher Gerra
Author URI: http://christophergerra.com
*/

//getting the header
get_header(); ?>
<?php $x2fair_options = get_option('x2fair_theme_settings'); ?>
<header>
	<div class="container"> 
		<div class="row">
			<div class="logo_wrapper">
		        <?php if ( $x2fair_options['x2fair_logo'] != '' ): ?>
		            <a href='<?php echo esc_url( home_url( '/' ) ); ?>' rel='home' class="logo">
		                <img src="<?php echo $x2fair_options['x2fair_logo']; ?>" />
		            </a>
		        <?php  else: ?>
		        	<a href='<?php echo esc_url( home_url( '/' ) ); ?>' rel='home'><?php bloginfo( 'name' ); ?></a>
		        <?php  endif; ?>
		    </div>
		</div>
	</div>
</header>
<section class="container homepage_content text-center">
	<div class="row">
	    <?php if ( $x2fair_options['x2fair_homepage_image'] != '' ): ?>
	        <div class="homepage_image">
	            <img src="<?php echo $x2fair_options['x2fair_homepage_image']; ?>" />
	        </div>
	    <?php  endif; ?>
	    <div class="myname">
	    	christopher <span>gerra</span>
	    </div>
	    <div class="homepage_intro">
	    	<p><?php echo $x2fair_options['x2fair_intro']; ?></p>
	    </div>
	    <div class="homepage_menu">
		    <ul class="home_menu display-inline list-unstyled" id="menu-main-menu">
		    	<li class="menu-item" id="menu-item">
		    		<a href="http://localhost/x2fair.com/works#works">
		    			<i class="fa fa-code"></i> Works
		    		</a>
		    	</li>
				<li class="menu-item" id="menu-item">
					<a href="http://localhost/x2fair.com/works#about">
						<i class="fa fa-user"></i> About
					</a>
				</li>
				<li class="menu-item" id="menu-item">
					<a href="http://localhost/x2fair.com/works#contact">
						<i class="fa fa-envelope"></i> Contact
					</a>
				</li>
				<!-- <li class="menu-item" id="menu-item">
		    		<a href="http://localhost/x2fair.com/works">
		    			<i class="fa fa-arrow-right"></i> Enter My Website
		    		</a>
		    	</li> -->
			</ul>
		</div>
	</div>
</section>
</div>
<?php get_footer(); ?>