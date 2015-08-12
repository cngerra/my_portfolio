<?php

/**
 * Christopher Tabbed Settings Page
 */

add_action( 'init', 'x2fair_admin_init' );
add_action( 'admin_menu', 'x2fair_settings_page_init' );

function x2fair_admin_init() {
	$settings = get_option( "x2fair_theme_settings" );
	if ( empty( $settings ) ) {
		$settings = array(
			'x2fair_intro' 			=> 'Some intro text for the home page',
			'x2fair_favicon'		=> false,
			'x2fair_fb_url' 		=> false,
			'x2fair_twitter_url' 	=> false,
			'x2fair_gplus_url'		=> false,
			'x2fair_ga' 			=> false
		);
		add_option( "x2fair_theme_settings", $settings, '', 'yes' );
	}	
}

function x2fair_settings_page_init() {
	$theme_data = get_theme_data( TEMPLATEPATH . '/style.css' );
	$settings_page = add_theme_page( 'Christopher Theme Settings', 'Christopher Theme Settings', 'edit_theme_options', 'theme-settings', 'x2fair_settings_page' );
	add_action( "load-{$settings_page}", 'x2fair_load_settings_page' );
}

function x2fair_options_setup() {
	global $pagenow;
	if ('media-upload.php' == $pagenow || 'async-upload.php' == $pagenow) {
		// Now we'll replace the 'Insert into Post Button inside Thickbox' 
		add_filter( 'gettext', 'replace_thickbox_text' , 1, 2 );
	}
}
add_action( 'admin_init', 'x2fair_options_setup' );

function replace_thickbox_text($translated_text, $text ) {	
	if ( 'Insert into Post' == $text ) {
		$referer = strpos( wp_get_referer(), 'theme-settings' );
		if ( $referer != '' ) {
			return __('I want this to be my logo!', 'my_themes' );
		}
	}
	return $translated_text;
}

function x2fair_load_settings_page() {
	if ( $_POST["x2fair-settings-submit"] == 'Y' ) {
		check_admin_referer( "x2fair-settings-page" );
		x2fair_save_theme_settings();
		$url_parameters = isset($_GET['tab'])? 'updated=true&tab='.$_GET['tab'] : 'updated=true';
		wp_redirect(admin_url('themes.php?page=theme-settings&'.$url_parameters));
		exit;
	}  
}

function x2fair_save_theme_settings() {
	global $pagenow;
	$settings = get_option( "x2fair_theme_settings" );
	
	if ( $pagenow == 'themes.php' && $_GET['page'] == 'theme-settings' ){ 
		if ( isset ( $_GET['tab'] ) )
	        $tab = $_GET['tab']; 
	    else
	        $tab = 'homepage';

	    switch ( $tab ){
			case 'homepage' : 
				$settings['x2fair_intro']	  = $_POST['x2fair_intro'];
				$settings['x2fair_favicon']	  = $_POST['x2fair_favicon'];				
				$settings['x2fair_logo']	  = $_POST['x2fair_logo'];
				$settings['x2fair_big_image'] = $_POST['x2fair_big_image'];
			break;
	        case 'social_media' :
				$settings['x2fair_fb_url']	  	= $_POST['x2fair_fb_url'];
				$settings['x2fair_twitter_url']	= $_POST['x2fair_twitter_url'];
				$settings['x2fair_gplus_url']	= $_POST['x2fair_gplus_url'];
				$settings['x2fair_linkedin_url']= $_POST['x2fair_linkedin_url'];
			break; 
	        case 'footer' : 
				$settings['x2fair_ga']  = $_POST['x2fair_ga'];
			break;
	    }
	}
	
	if( !current_user_can( 'unfiltered_html' ) ){
		if ( $settings['x2fair_ga']  )
			$settings['x2fair_ga'] = stripslashes( esc_textarea( wp_filter_post_kses( $settings['x2fair_ga'] ) ) );
		if ( $settings['x2fair_intro'] )
			$settings['x2fair_intro'] = stripslashes( esc_textarea( wp_filter_post_kses( $settings['x2fair_intro'] ) ) );
	}

	$updated = update_option( "x2fair_theme_settings", $settings );
}

function x2fair_admin_tabs( $current = 'homepage' ) { 
    $tabs = array( 'homepage' => 'Homepage', 'social_media' => 'Social Media', 'footer' => 'Footer' ); 
    $links = array();
    echo '<div id="icon-themes" class="icon32"><br></div>';
    echo '<h2 class="nav-tab-wrapper">';
    foreach( $tabs as $tab => $name ){
        $class = ( $tab == $current ) ? ' nav-tab-active' : '';
        echo "<a class='nav-tab$class' href='?page=theme-settings&tab=$tab'>$name</a>";
        
    }
    echo '</h2>';
}



function delete_image( $image_url ) {
	global $wpdb;
	
	// We need to get the image's meta ID..
	$query = "SELECT ID FROM wp_posts where guid = '" . esc_url($image_url) . "' AND post_type = 'attachment'";  
	$results = $wpdb -> get_results($query);

	// And delete them (if more than one attachment is in the Library
	foreach ( $results as $row ) {
		wp_delete_attachment( $row -> ID );
	}	
}

/********************* JAVASCRIPT ******************************/
function christopher_options_enqueue_scripts() {
	wp_enqueue_script( 'christopher-upload', get_template_directory_uri() .'/js/christopher-upload.js', array('jquery','media-upload','thickbox') );	
	//wp_enqueue_script( 'jquery-script', get_template_directory_uri() . '/js/jquery-1.11.1.min.js', array(), '1', 'all' );

	if ( 'appearance_page_christopher-settings' == get_current_screen() -> id ) {
		wp_enqueue_script('jquery');
		
		wp_enqueue_script('thickbox');
		wp_enqueue_style('thickbox');
		
		wp_enqueue_script('media-upload');
		wp_enqueue_script('christopher-upload');
		
	}
	
}
add_action('admin_enqueue_scripts', 'christopher_options_enqueue_scripts');

function x2fair_settings_page() {
	global $pagenow;
	$settings = get_option( "x2fair_theme_settings" );
	$theme_data = get_theme_data( TEMPLATEPATH . '/style.css' );
	?>
	
	<div class="wrap">
		<h2>Christopher Theme Settings</h2>
		
		<?php
			if ( 'true' == esc_attr( $_GET['updated'] ) ) echo '<div class="updated" ><p>Theme Settings updated.</p></div>';
			
			if ( isset ( $_GET['tab'] ) ) x2fair_admin_tabs($_GET['tab']); else x2fair_admin_tabs('homepage');
		?>

		<div id="poststuff">
			<form method="post" action="<?php admin_url( 'themes.php?page=theme-settings' ); ?>" enctype="multipart/form-data">
				<?php
				wp_nonce_field( "x2fair-settings-page" ); 
				
				if ( $pagenow == 'themes.php' && $_GET['page'] == 'theme-settings' ){ 
				
					if ( isset ( $_GET['tab'] ) ) $tab = $_GET['tab']; 
					else $tab = 'homepage'; 
					
					echo '<table class="form-table">';
					switch ( $tab ){
						case 'homepage' : 
							?>
							<tr>
								<th><label for="x2fair_intro">Homepage Text:</label></th>
								<td>
									<textarea id="x2fair_intro" name="x2fair_intro" cols="60" rows="5" ><?php echo esc_html( stripslashes( $settings["x2fair_intro"] ) ); ?></textarea><br/>
									<span class="description">Enter the introductory text for the home page</span>
								</td>
							</tr>
							<tr>
								<th><label for="x2fair_intro">Favicon:</label></th>
								<td>
									<input type="text" id="favicon_url" name="x2fair_favicon" value="<?php echo esc_html( stripslashes( $settings["x2fair_favicon"] ) ); ?>" />
									<div id="upload_favicon_preview" style="margin-bottom: 10px;">
										<img style="max-width:100%;" src="<?php echo esc_url( $settings['x2fair_favicon'] ); ?>" />
									</div>
									<input id="upload_favicon_button" type="button" class="button" value="<?php _e( 'Upload Favicon', 'my_themes' ); ?>" />
									<?php if ( '' != $settings['x2fair_favicon'] ): ?>
										<input id="delete_favicon_button" name="x2fair_theme_settings[delete_favicon]" type="submit" class="button" value="<?php _e( 'Delete Favicon', 'christopher' ); ?>" />
									<?php endif; ?>	
									<br />
									<span class="description">Upload favicon</span>
								</td>
							</tr>
							<tr>
								<th><label for="x2fair_intro">Logo:</label></th>
								<td>
									<textarea id="x2fair_intro" name="x2fair_intro" cols="60" rows="5" ><?php echo esc_html( stripslashes( $settings["x2fair_intro"] ) ); ?></textarea><br/>
									<span class="description">Enter the introductory text for the home page:</span>
								</td>
							</tr>
							<tr>
								<th><label for="x2fair_intro">Homepage Image:</label></th>
								<td>
									<textarea id="x2fair_intro" name="x2fair_intro" cols="60" rows="5" ><?php echo esc_html( stripslashes( $settings["x2fair_intro"] ) ); ?></textarea><br/>
									<span class="description">Enter the introductory text for the home page:</span>
								</td>
							</tr>
							<?php
						break;
						case 'social_media' :
							?>
							<tr>
								<th><label>Facebook URL:</label></th>
								<td>
									<input id="x2fair_fb_url" name="x2fair_fb_url" type="text" value="<?php echo esc_html( stripslashes( $settings["x2fair_fb_url"] ) ); ?>" /> 
									<span class="description">Facebook url.</span>
								</td>
							</tr>
							<tr>
								<th><label>Twitter URL:</label></th>
								<td>
									<input id="x2fair_twitter_url" name="x2fair_twitter_url" type="text" value="<?php echo esc_html( stripslashes( $settings["x2fair_twitter_url"] ) ); ?>" /> 
									<span class="description">Twitter url.</span>
								</td>
							</tr>
							<tr>
								<th><label>Google Plus URL:</label></th>
								<td>
									<input id="x2fair_gplus_url" name="x2fair_gplus_url" type="text" value="<?php echo esc_html( stripslashes( $settings["x2fair_gplus_url"] ) ); ?>" /> 
									<span class="description">Google Plus url.</span>
								</td>
							</tr>
							<tr>
								<th><label>LinkedIn URL:</label></th>
								<td>
									<input id="x2fair_linkedin_url" name="x2fair_linkedin_url" type="text" value="<?php echo esc_html( stripslashes( $settings["x2fair_linkedin_url"] ) ); ?>" /> 
									<span class="description">LinkedIn url.</span>
								</td>
							</tr>
							<?php
						break; 
						case 'footer' : 
							?>
							<tr>
								<th><label for="x2fair_ga">Google Analytics:</label></th>
								<td>
									<textarea id="x2fair_ga" name="x2fair_ga" cols="60" rows="5"><?php echo esc_html( stripslashes( $settings["x2fair_ga"] ) ); ?></textarea><br/>
									<span class="description">Enter your Google Analytics tracking code:</span>
								</td>
							</tr>
							<?php
						break;
					}
					echo '</table>';
				}
				?>
				<p class="submit" style="clear: both;">
					<input type="submit" name="Submit"  class="button-primary" value="Update Settings" />
					<input type="hidden" name="x2fair-settings-submit" value="Y" />
				</p>
			</form>
		</div>

	</div>
<?php
}


?>