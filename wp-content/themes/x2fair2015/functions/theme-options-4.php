<?php
function christopher_get_default_options() {
	$options = array(
		'logo' => '',
		'homepage_image' => '',
		'favicon' => ''
	);
	return $options;
}

function christopher_options_init() {
     $christopher_options = get_option( 'theme_christopher_options' );
	 
	 // Are our options saved in the DB?
     if ( false === $christopher_options ) {
		  // If not, we'll save our default options
          $christopher_options = christopher_get_default_options();
		  add_option( 'theme_christopher_options', $christopher_options );
     }
	 
     // In other case we don't need to update the DB
}

// Initialize Theme options
add_action( 'after_setup_theme', 'christopher_options_init' );

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
		$referer = strpos( wp_get_referer(), 'christopher-settings' );
		if ( $referer != '' ) {
			return __('Use this', 'christopher' );
		}
	}

	return $translated_text;
}

function christopher_admin_tabs($curent = 'homepage'){
	$tabs 	= array('homepage' => 'Homepage', 'images' => 'Logos and Other Pictures', 'social_icons' => 'Social Icons', 'footer' => 'Footer');
	$links	= array();
	?>
	<div id="icon-themes" class="icons32"><br></div>
	<h2 class="nav-tab-wrapper">
	<?php
		foreach($tabs as $tab => $name){
			$class 	= ($tab == $current) ? ' nav-tab-active' : '';
			echo "<a class='nav-tab$class' href='?page=christopher-settings&tab=$tab'>$name</a>";
		}
	?>
	</h2>
	<?php
}

// Add "Christopher Theme Options" link to the "Appearance" menu
function christopher_menu_options() {	
     $theme_data = get_theme_data( TEMPLATEPATH . '/style.css' );
	//add_theme_page( $page_title, $menu_title, $capability, $menu_slug, $function);
     add_theme_page( 'Christopher Theme Options',  'Christopher Theme Options', 'edit_theme_options', 'christopher-settings', 'christopher_admin_options_page');
}
// Load the Admin Options page
add_action('admin_menu', 'christopher_menu_options');

function christopher_admin_options_page() {
	?>
		<!-- 'wrap','submit','icon32','button-primary' and 'button-secondary' are classes 
		for a good WP Admin Panel viewing and are predefined by WP CSS -->
		<?php
			global $pagenow;
			$settings = get_option( "theme_christopher_options" );
			$theme_data = get_theme_data( TEMPLATEPATH . '/style.css' );
		?>
		<div class="wrap">
			
			<div id="icon-themes" class="icon32"><br /></div>		
			<h2><?php _e( 'Christopher Theme Options', 'christopher' ); ?></h2>			
			<!-- If we have any error by submiting the form, they will appear here -->
			<?php settings_errors( 'christopher-settings-errors' ); ?>
			<?php
				//if ( 'true' == esc_attr( $_GET['updated'] ) ) echo '<div class="updated" ><p>Theme Settings updated.</p></div>';
				
				//if ( isset ( $_GET['tab'] ) ) christopher_admin_tabs($_GET['tab']); else christopher_admin_tabs('homepage');
			?>
			<form id="form-christopher-options" action="options.php?christopher-settings" method="post" enctype="multipart/form-data">
			
				<?php
					settings_fields('theme_christopher_options');
					do_settings_sections('christopher');
				?>
			
				<p class="submit">
					<input name="theme_christopher_options[submit]" id="submit_options_form" type="submit" class="button-primary" value="<?php esc_attr_e('Save Settings', 'christopher'); ?>" />
					<input name="theme_christopher_options[reset]" type="submit" class="button-secondary" value="<?php esc_attr_e('Reset Defaults', 'christopher'); ?>" />		
				</p>
			
			</form>
			
		</div>
	<?php
}

function christopher_options_validate( $input ) {
	$default_options = christopher_get_default_options();
	$valid_input = $default_options;
	
	$christopher_options = get_option('theme_christopher_options');
	
	$submit = ! empty($input['submit']) ? true : false;
	$reset = ! empty($input['reset']) ? true : false;
	$delete_logo = ! empty($input['delete_logo']) ? true : false;
	$delete_home_image = ! empty($input['delete_home_image']) ? true : false;
	$delete_favicon = ! empty($input['delete_favicon']) ? true : false;
	
	if ( $submit ) {

		if ( $christopher_options['favicon'] != $input['favicon']  && $christopher_options['favicon'] != '' )
			delete_image( $christopher_options['favicon'] );
		
		$valid_input['favicon'] = $input['favicon'];

		if ( $christopher_options['logo'] != $input['logo']  && $christopher_options['logo'] != '' )
			delete_image( $christopher_options['logo'] );

		$valid_input['logo'] = $input['logo'];

		if ( $christopher_options['homepage_image'] != $input['homepage_image']  && $christopher_options['homepage_image'] != '' )
			delete_image( $christopher_options['homepage_image'] );
		
		$valid_input['homepage_image'] = $input['homepage_image'];


		$valid_input['introtextarea'] 	= $input['introtextarea'];

	}
	elseif ( $reset ) {
		delete_image( $christopher_options['favicon'] );
		$valid_input['favicon'] = $default_options['favicon'];

		delete_image( $christopher_options['logo'] );
		$valid_input['logo'] = $default_options['logo'];

		delete_image( $christopher_options['homepage_image'] );
		$valid_input['homepage_image'] = $default_options['homepage_image'];
	}

	elseif ( $delete_favicon ) {
		delete_image( $christopher_options['favicon'] );
		$valid_input['favicon'] = '';
	}

	elseif ( $delete_logo ) {
		delete_image( $christopher_options['logo'] );
		$valid_input['logo'] = '';
	}

	elseif ( $delete_home_image ) {
		delete_image( $christopher_options['homepage_image'] );
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


function christopher_options_settings_init() {
	register_setting( 'theme_christopher_options', 'theme_christopher_options', 'christopher_options_validate' );
	
	// Add a form section for the logo
	//add_settings_section('christopher_settings_header', __( 'Logo Options', 'christopher' ), 'christopher_settings_header_text', 'christopher');
	
	// Add Logo uploader
	add_settings_section('christopher_settings',  '', 'christopher_settings', 'christopher', 'christopher_settings_header');
}
add_action( 'admin_init', 'christopher_options_settings_init' );

function christopher_settings() {
	$christopher_options = get_option( 'theme_christopher_options' );
	?>

	<?php
	global $pagenow;
	if ( isset ( $_GET['tab'] ) ) christopher_admin_tabs($_GET['tab']); else christopher_admin_tabs('homepage');
	if ( $pagenow == 'themes.php' && $_GET['page'] == 'christopher-settings' ){	
		if ( isset ( $_GET['tab'] ) ) $tab = $_GET['tab']; 
		else $tab = 'homepage'; 
		echo '<table class="form-table">';

		switch ( $tab ){
			case 'general' :
				?>
				<tr>
					<th><label for="ilc_tag_class">Tags with CSS classes:</label></th>
					<td>
						<input id="ilc_tag_class" name="ilc_tag_class" type="checkbox" <?php if ( $settings["ilc_tag_class"] ) echo 'checked="checked"'; ?> value="true" /> 
						<span class="description">Output each post tag with a specific CSS class using its slug.</span>
					</td>
				</tr>
				<?php
			break; 
			case 'footer' : 
				?>
				<tr>
					<th><label for="ilc_ga">Insert tracking code:</label></th>
					<td>
						<textarea id="ilc_ga" name="ilc_ga" cols="60" rows="5"><?php echo esc_html( stripslashes( $settings["ilc_ga"] ) ); ?></textarea><br/>
						<span class="description">Enter your Google Analytics tracking code:</span>
					</td>
				</tr>
				<?php
			break;
			case 'homepage' : 
				?>
				<tr>
					<td>Homepage Intro:</td>
					<td>
						<textarea id="introtextarea" class="large-text" cols="50" rows="10" name="theme_christopher_options[introtextarea]"><?php echo esc_textarea( $christopher_options['introtextarea'] ); ?></textarea>	
					</td>
				</tr>
				<?php
			break;
			case 'images':
				?>
				<tr>
					<td>Favicon:</td>
					<td>
						<input type="hidden" id="favicon_url" name="theme_christopher_options[favicon]" value="<?php echo esc_url( $christopher_options['favicon'] ); ?>" />
						<div id="upload_favicon_preview" style="margin-bottom: 10px;">
							<img style="max-width:100%;" src="<?php echo esc_url( $christopher_options['favicon'] ); ?>" />
						</div>
						<input id="upload_favicon_button" type="button" class="button" value="<?php _e( 'Upload Favicon', 'christopher' ); ?>" />
						<?php if ( '' != $christopher_options['favicon'] ): ?>
							<input id="delete_favicon_button" name="theme_christopher_options[delete_favicon]" type="submit" class="button" value="<?php _e( 'Delete Favicon', 'christopher' ); ?>" />
						<?php endif; ?>			
					</td>
				</tr>
				
				<tr>
					<td>Theme Logo: </td>
					<td>
						<input type="hidden" id="logo_url" name="theme_christopher_options[logo]" value="<?php echo esc_url( $christopher_options['logo'] ); ?>" />
						<div id="upload_logo_preview" style="margin-bottom: 10px;">
							<img style="max-width:100%;" src="<?php echo esc_url( $christopher_options['logo'] ); ?>" />
						</div>
						<input id="upload_logo_button" type="button" class="button" value="<?php _e( 'Upload Logo', 'christopher' ); ?>" />
						<?php if ( '' != $christopher_options['logo'] ): ?>
							<input id="delete_logo_button" name="theme_christopher_options[delete_logo]" type="submit" class="button" value="<?php _e( 'Delete Logo', 'christopher' ); ?>" />
						<?php endif; ?>			
					</td>
				</tr>

				<tr>
					<td>Homepage Image:</td>
					<td>
						<input type="hidden" id="homepage_image_url" name="theme_christopher_options[homepage_image]" value="<?php echo esc_url( $christopher_options['homepage_image'] ); ?>" />
						<div id="upload_homeimage_preview" style="margin-bottom: 10px;">
							<img style="max-width:100%;" src="<?php echo esc_url( $christopher_options['homepage_image'] ); ?>" />
						</div>
						<input id="upload_homeimage_button" type="button" class="button" value="<?php _e( 'Upload Logo', 'christopher' ); ?>" />
						<?php if ( '' != $christopher_options['homepage_image'] ): ?>
							<input id="delete_homeimage_button" name="theme_christopher_options[delete_home_image]" type="submit" class="button" value="<?php _e( 'Delete Homepage Image', 'christopher' ); ?>" />
						<?php endif; ?>			
					</td>
				</tr>
				<?php
				break;
		}

		echo '</table>';
	}
	?>

	<table style="margin-top: 20px" cellpadding="10">

		

		
	</table>		
	<?php
}



?>