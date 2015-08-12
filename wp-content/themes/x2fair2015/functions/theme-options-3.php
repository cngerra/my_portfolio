<?php

/**
 * theme Tabbed Settings Page
 */

add_action( 'init', 'theme_admin_init' );
add_action( 'admin_menu', 'theme_settings_page_init' );

function theme_admin_init() {
	$settings = get_option( "my_theme_options" );
	if ( empty( $settings ) ) {
		$settings = array(
			'theme_intro' => 'Some intro text for the home page',
			'theme_tag_class' => false,
			'theme_ga' => false,
			'logo' => '',
			'homepage_image' => '',
			'favicon' => ''
		);
		add_option( "my_theme_options", $settings, '', 'yes' );
	}	
}

function theme_settings_page_init() {
	$theme_data = get_theme_data( TEMPLATEPATH . '/style.css' );
	$settings_page = add_theme_page( ' Theme Settings', ' Theme Settings', 'edit_theme_options', 'theme-settings', 'theme_settings_page', 'my_theme_options_validate' );
	add_action( "load-{$settings_page}", 'theme_load_settings_page' );
}

function theme_load_settings_page() {
	if ( $_POST["theme-settings-submit"] == 'Y' ) {
		check_admin_referer( "theme-settings-page" );
		theme_save_theme_settings();
		$url_parameters = isset($_GET['tab'])? 'updated=true&tab='.$_GET['tab'] : 'updated=true';
		wp_redirect(admin_url('themes.php?page=theme-settings&'.$url_parameters));
		exit;
	}
}

function christopher_options_setup() {
	global $pagenow;
	if ('media-upload.php' == $pagenow || 'async-upload.php' == $pagenow) {
		// Now we'll replace the 'Insert into Post Button inside Thickbox' 
		add_filter( 'gettext', 'replace_thickbox_text' , 1, 2 );
	}
}
add_action( 'admin_init', 'christopher_options_setup' );

function replace_thickbox_text($translated_text, $text ) {	
	if ( 'Insert into Post' == $text ) {
		$referer = strpos( wp_get_referer(), 'theme-settings' );
		if ( $referer != '' ) {
			return __('Use this', 'christopher' );
		}
	}

	return $translated_text;
}

function my_theme_options_validate( $input ) {
	$default_options = christopher_get_default_options();
	$valid_input = $default_options;
	
	$my_theme_options = get_option('my_theme_options');
	
	$submit = ! empty($input['submit']) ? true : false;
	$reset = ! empty($input['reset']) ? true : false;
	$delete_logo = ! empty($input['delete_logo']) ? true : false;
	$delete_home_image = ! empty($input['delete_home_image']) ? true : false;
	$delete_favicon = ! empty($input['delete_favicon']) ? true : false;
	
	if ( $submit ) {

		if ( $my_theme_options['favicon'] != $input['favicon']  && $my_theme_options['favicon'] != '' )
			delete_image( $my_theme_options['favicon'] );
		
		$valid_input['favicon'] = $input['favicon'];

		if ( $my_theme_options['logo'] != $input['logo']  && $my_theme_options['logo'] != '' )
			delete_image( $my_theme_options['logo'] );

		$valid_input['logo'] = $input['logo'];

		if ( $my_theme_options['homepage_image'] != $input['homepage_image']  && $my_theme_options['homepage_image'] != '' )
			delete_image( $my_theme_options['homepage_image'] );
		
		$valid_input['homepage_image'] = $input['homepage_image'];


		$valid_input['introtextarea'] 	= $input['introtextarea'];

	}
	elseif ( $reset ) {
		delete_image( $my_theme_options['favicon'] );
		$valid_input['favicon'] = $default_options['favicon'];

		delete_image( $my_theme_options['logo'] );
		$valid_input['logo'] = $default_options['logo'];

		delete_image( $my_theme_options['homepage_image'] );
		$valid_input['homepage_image'] = $default_options['homepage_image'];
	}

	elseif ( $delete_favicon ) {
		delete_image( $my_theme_options['favicon'] );
		$valid_input['favicon'] = '';
	}

	elseif ( $delete_logo ) {
		delete_image( $my_theme_options['logo'] );
		$valid_input['logo'] = '';
	}

	elseif ( $delete_home_image ) {
		delete_image( $my_theme_options['homepage_image'] );
		$valid_input['homepage_image'] = '';
	}
	
	return $valid_input;
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
	wp_register_script( 'christopher-upload', get_template_directory_uri() .'/js/christopher-upload.js', array('jquery','media-upload','thickbox') );	

	if ( 'appearance_page_christopher-settings' == get_current_screen() -> id ) {
		wp_enqueue_script('jquery');
		
		wp_enqueue_script('thickbox');
		wp_enqueue_style('thickbox');
		
		wp_enqueue_script('media-upload');
		wp_enqueue_script('christopher-upload');
		
	}
	
}
add_action('admin_enqueue_scripts', 'christopher_options_enqueue_scripts');

function theme_save_theme_settings() {
	global $pagenow;
	$settings = get_option( "my_theme_options" );
	
	if ( $pagenow == 'themes.php' && $_GET['page'] == 'theme-settings' ){ 
		if ( isset ( $_GET['tab'] ) )
	        $tab = $_GET['tab']; 
	    else
	        $tab = 'homepage'; 

	    switch ( $tab ){ 
	        case 'images' :
				$settings['theme_tag_class'] = $_POST['theme_tag_class'];
			break; 
	        case 'footer' : 
				$settings['theme_ga'] = $_POST['theme_ga'];
			break;
			case 'homepage' : 
				$settings['theme_intro'] = $_POST['theme_intro'];
			break;
	    }
	}
	
	if( !current_user_can( 'unfiltered_html' ) ){
		if ( $settings['theme_ga']  )
			$settings['theme_ga'] = stripslashes( esc_textarea( wp_filter_post_kses( $settings['theme_ga'] ) ) );
		if ( $settings['theme_intro'] )
			$settings['theme_intro'] = stripslashes( esc_textarea( wp_filter_post_kses( $settings['theme_intro'] ) ) );
	}

	$updated = update_option( "my_theme_options", $settings );
}

function theme_admin_tabs( $current = 'homepage' ) { 
    $tabs = array('homepage' => 'Homepage', 'images' => 'Logos and Other Pictures', 'social_icons' => 'Social Icons', 'footer' => 'Footer');
    $links = array();
    echo '<div id="icon-themes" class="icon32"><br></div>';
    echo '<h2 class="nav-tab-wrapper">';
    foreach( $tabs as $tab => $name ){
        $class = ( $tab == $current ) ? ' nav-tab-active' : '';
        echo "<a class='nav-tab$class' href='?page=theme-settings&tab=$tab'>$name</a>";
        
    }
    echo '</h2>';
}

function theme_settings_page() {
	global $pagenow;
	$settings = get_option( "my_theme_options" );
	$theme_data = get_theme_data( TEMPLATEPATH . '/style.css' );
	?>
	
	<div class="wrap">
		<h2>Theme Settings</h2>
		
		<?php
			if ( 'true' == esc_attr( $_GET['updated'] ) ) echo '<div class="updated" ><p>Theme Settings updated.</p></div>';
			
			if ( isset ( $_GET['tab'] ) ) theme_admin_tabs($_GET['tab']); else theme_admin_tabs('homepage');
		?>

		<div id="poststuff">
			<form method="post" action="<?php admin_url( 'themes.php?page=theme-settings' ); ?>" enctype="multipart/form-data">
				<?php
				wp_nonce_field( "theme-settings-page" ); 
				
				if ( $pagenow == 'themes.php' && $_GET['page'] == 'theme-settings' ){ 
				
					if ( isset ( $_GET['tab'] ) ) $tab = $_GET['tab']; 
					else $tab = 'homepage'; 
					
					echo '<table class="form-table">';
					switch ( $tab ){						
						case 'homepage' : 
							?>
							<tr>
								<th><label for="theme_intro">Introduction</label></th>
								<td>
									<textarea id="theme_intro" name="theme_intro" cols="60" rows="5" ><?php echo esc_html( stripslashes( $settings["theme_intro"] ) ); ?></textarea><br/>
									<span class="description">Enter the introductory text for the home page:</span>
								</td>
							</tr>
							<?php
						break;
						case 'images' :
							?>
							<tr>
								<th><label for="theme_tag_class">Tags with CSS classes:</label></th>
								<td>
									<input id="theme_tag_class" name="theme_tag_class" type="checkbox" <?php if ( $settings["theme_tag_class"] ) echo 'checked="checked"'; ?> value="true" /> 
									<span class="description">Output each post tag with a specific CSS class using its slug.</span>
								</td>
							</tr>
							<tr>
								<td>Favicon:</td>
								<td>
									<input type="hidden" id="favicon_url" name="my_theme_options[favicon]" value="<?php echo esc_url( $settings['favicon'] ); ?>" />
									<div id="upload_favicon_preview" style="margin-bottom: 10px;">
										<img style="max-width:100%;" src="<?php echo esc_url( $settings['favicon'] ); ?>" />
									</div>
									<input id="upload_favicon_button" type="button" class="button" value="<?php _e( 'Upload Favicon', 'my_themes' ); ?>" />
									<?php if ( '' != $settings['favicon'] ): ?>
										<input id="delete_favicon_button" name="my_theme_options[delete_favicon]" type="submit" class="button" value="<?php _e( 'Delete Favicon', 'christopher' ); ?>" />
									<?php endif; ?>			
								</td>
							</tr>
							<tr>
							<td>Theme Logo: </td>
							<td>
								<input type="hidden" id="logo_url" name="my_theme_options[logo]" value="<?php echo esc_url( $settings['logo'] ); ?>" />
								<div id="upload_logo_preview" style="margin-bottom: 10px;">
									<img style="max-width:100%;" src="<?php echo esc_url( $settings['logo'] ); ?>" />
								</div>
								<input id="upload_logo_button" type="button" class="button" value="<?php _e( 'Upload Logo', 'my_themes' ); ?>" />
								<?php if ( '' != $settings['logo'] ): ?>
									<input id="delete_logo_button" name="my_theme_options[delete_logo]" type="submit" class="button" value="<?php _e( 'Delete Logo', 'christopher' ); ?>" />
								<?php endif; ?>			
							</td>
						</tr>

						<tr>
							<td>Homepage Image:</td>
							<td>
								<input type="hidden" id="homepage_image_url" name="my_theme_options[homepage_image]" value="<?php echo esc_url( $settings['homepage_image'] ); ?>" />
								<div id="upload_homeimage_preview" style="margin-bottom: 10px;">
									<img style="max-width:100%;" src="<?php echo esc_url( $settings['homepage_image'] ); ?>" />
								</div>
								<input id="upload_homeimage_button" type="button" class="button" value="<?php _e( 'Upload Logo', 'my_themes' ); ?>" />
								<?php if ( '' != $settings['homepage_image'] ): ?>
									<input id="delete_homeimage_button" name="my_theme_options[delete_home_image]" type="submit" class="button" value="<?php _e( 'Delete Homepage Image', 'christopher' ); ?>" />
								<?php endif; ?>			
							</td>
						</tr>
							<?php
						break; 
						case 'footer' : 
							?>
							<tr>
								<th><label for="theme_ga">Insert tracking code:</label></th>
								<td>
									<textarea id="theme_ga" name="theme_ga" cols="60" rows="5"><?php echo esc_html( stripslashes( $settings["theme_ga"] ) ); ?></textarea><br/>
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
					<input type="hidden" name="theme-settings-submit" value="Y" />
				</p>
			</form>
			
			<p><?php echo $theme_data['Name'] ?> theme by <a href="http://ilovecolors.com.ar/">ilovecolors.com.ar</a> | <a href="http://twitter.com/eliorivero">Follow me on Twitter</a>! | Join <a href="http://on.fb.me/themefb">ilovecolors on Facebook</a>!</p>
		</div>

	</div>
<?php
}


?>