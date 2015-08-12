<?php

add_action( 'admin_init', 'theme_options_init' );
add_action( 'admin_menu', 'theme_options_add_page' );

/**
 * Init plugin options to white list our options
 */
function theme_options_init(){
	register_setting( 'sample_options', 'x2fair_theme_options', 'theme_options_validate' );
}

/**
 * Load up the menu page
 */
function theme_options_add_page() {
	add_theme_page( __( 'Christopher Theme Options', 'x2fairtheme' ), __( 'Christopher Theme Options', 'x2fairtheme' ), 'edit_theme_options', 'theme_options', 'theme_options_do_page' );
}

/**
 * Create arrays for our select and radio options
 */
$select_options = array(
	'0' => array(
		'value' =>	'0',
		'label' => __( 'Zero', 'x2fairtheme' )
	),
	'1' => array(
		'value' =>	'1',
		'label' => __( 'One', 'x2fairtheme' )
	),
	'2' => array(
		'value' => '2',
		'label' => __( 'Two', 'x2fairtheme' )
	),
	'3' => array(
		'value' => '3',
		'label' => __( 'Three', 'x2fairtheme' )
	),
	'4' => array(
		'value' => '4',
		'label' => __( 'Four', 'x2fairtheme' )
	),
	'5' => array(
		'value' => '3',
		'label' => __( 'Five', 'x2fairtheme' )
	)
);

$radio_options = array(
	'yes' => array(
		'value' => 'yes',
		'label' => __( 'Yes', 'x2fairtheme' )
	),
	'no' => array(
		'value' => 'no',
		'label' => __( 'No', 'x2fairtheme' )
	),
	'maybe' => array(
		'value' => 'maybe',
		'label' => __( 'Maybe', 'x2fairtheme' )
	)
);

function x2fair_get_default_options(){
	$options = array(
		'logo'	=> ''
	);
}

function x2fair_options_init(){
	$options = get_option('x2fair_theme_options');

	if($options === false){
		$options = x2fair_get_default_options();
		add_option('x2fair_theme_options', $options);
	}
}
add_action( 'after_setup_theme', 'x2fair_options_init' );

/**
 * Create the options page
 */
function theme_options_do_page() {
	global $select_options, $radio_options;

	if ( ! isset( $_REQUEST['settings-updated'] ) )
		$_REQUEST['settings-updated'] = false;

	?>
	<div class="wrap">
		<?php screen_icon(); echo "<h2>" . get_current_theme() . __( ' Theme Options', 'x2fairtheme' ) . "</h2>"; ?>

		<?php if ( false !== $_REQUEST['settings-updated'] ) : ?>
		<div class="updated fade"><p><strong><?php _e( 'Options saved', 'x2fairtheme' ); ?></strong></p></div>
		<?php endif; ?>

		<form id="form-christopher-options" method="post" action="options.php" enctype="multipart/form-data">
			<?php settings_fields( 'sample_options' ); ?>
			<?php $options = get_option( 'x2fair_theme_options' ); ?>

			<table class="form-table">


				<?php
				/**
				 * Uploading a Logo
				*/
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Upload Theme Logo', 'x2fairtheme' ); ?></th>
					<td>
						<input type="text" id="logo_url" name="x2fair_theme_options[logo]" value="<?php echo esc_url( $options['logo'] ); ?>" />
				        <input id="upload_logo_button" type="button" class="button" value="<?php _e( 'Upload Logo'); ?>" />
				        <span class="description"><?php _e('Upload an image for the banner.' ); ?></span>
				    </td>
				</tr>
				<?php
				/**
				 * Theme Logo
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Theme Logo', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[logo]" class="regular-text" type="text" name="x2fair_theme_options[logo]" value="<?php esc_attr_e( $options['logo'] ); ?>" />
						<br />
						<label class="description" for="x2fair_theme_options[logo]"><?php _e( 'Paste your logo url', 'x2fairtheme' ); ?></label>
					</td>
				</tr>

				<?php
				/**
				 * Alternative Theme Logo
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Alternative Theme Logo', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[alternative_logo]" class="regular-text" type="text" name="x2fair_theme_options[alternative_logo]" value="<?php esc_attr_e( $options['alternative_logo'] ); ?>" />
						<br />
						<label class="description" for="x2fair_theme_options[alternative_logo]"><?php _e( 'Paste your alternative logo url', 'x2fairtheme' ); ?></label>
					</td>
				</tr>

				<?php
				/**
				 * Theme Favicon
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Theme Favicon', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[favicon]" class="regular-text" type="text" name="x2fair_theme_options[favicon]" value="<?php esc_attr_e( $options['favicon'] ); ?>" />
						<br />
						<label class="description" for="x2fair_theme_options[favicon]"><?php _e( 'Paste your favicon url', 'x2fairtheme' ); ?></label>
					</td>
				</tr>

				<?php
				/**
				 * Company Address
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Company Address', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[companyaddress]" class="regular-text" type="text" name="x2fair_theme_options[companyaddress]" value="<?php esc_attr_e( $options['companyaddress'] ); ?>" />
					</td>
				</tr>

				<?php
				/**
				 * Company Phone No
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Company Contact No', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[contactno]" class="regular-text" type="text" name="x2fair_theme_options[contactno]" value="<?php esc_attr_e( $options['contactno'] ); ?>" />
					</td>
				</tr>

				<?php
				/**
				 * Company Email
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Company Email', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[email]" class="regular-text" type="text" name="x2fair_theme_options[email]" value="<?php esc_attr_e( $options['email'] ); ?>" />
					</td>
				</tr>

				<?php
				/**
				 * Products Section
				 */
				?>
				<tr valign="top">
   					<th scope="row" width="20%" valign="middle"><?php _e( 'Product Section to Show', 'x2fairtheme' ); ?></strong></th>
   					<td>
   						<select style="width:240px;" name="x2fair_theme_options[underbanner]; ?>" id="x2fair_theme_options<?php echo $value['id']; ?>">
       					<?php 
							$categories = get_categories('hide_empty=0&orderby=name');
							foreach ($categories as $category_list ) {
  						?>
       					<option value="<?php echo $category_list->cat_ID; ?>" <?php if ( get_settings( $value['id'] ) == $category_list->cat_name) { echo ' selected="selected"'; } elseif ($category_list->cat_name == $value['std']) { echo ' selected="selected"'; } ?>><?php echo $category_list->cat_name; ?></option>
       					<?php } ?>
     				</select></td>
 				</tr>

				<?php
				/**
				 * Company Slogan
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Slogan', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[slogan]" class="regular-text" type="text" name="x2fair_theme_options[slogan]" value="<?php esc_attr_e( $options['slogan'] ); ?>" />
						<br />
						<label class="description" for="x2fair_theme_options[slogan]"><?php _e( 'Company Slogan', 'x2fairtheme' ); ?></label>
					</td>
				</tr>

				<?php
				/**
				 * Intro Text
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Intro Text', 'x2fairtheme' ); ?></th>
					<td>
						<textarea id="x2fair_theme_options[introtextarea]" class="large-text" cols="50" rows="10" name="x2fair_theme_options[introtextarea]"><?php echo esc_textarea( $options['introtextarea'] ); ?></textarea>
					</td>
				</tr>

				<?php
				/**
				 * Google Analytics
				 */
				?>
				<tr valign="top"><th scope="row"><?php _e( 'Google Analytics Tracking Code', 'x2fairtheme' ); ?></th>
					<td>
						<input id="x2fair_theme_options[googleanalytics]" class="regular-text" type="text" name="x2fair_theme_options[googleanalytics]" value="<?php esc_attr_e( $options['googleanalytics'] ); ?>" />
					</td>
				</tr>

			</table>

			<p class="submit">
				<input type="submit" class="button-primary" value="<?php _e( 'Save Options', 'x2fairtheme' ); ?>" />
			</p>
		</form>
	</div>
	<?php
}

function wptuts_options_enqueue_scripts() {
    wp_enqueue_script( 'wptuts-upload', get_template_directory_uri() .'/js/wptuts-upload.js', array('jquery','media-upload','thickbox') );
    //wp_enqueue_script( 'wptuts-upload', get_template_directory_uri() . '/js/wptuts-upload.js', array(), '1', 'all' );
 
    if ( 'appearance_page_wptuts-settings' == get_current_screen() -> id ) {
        wp_enqueue_script('jquery');
 
        wp_enqueue_script('thickbox');
        wp_enqueue_style('thickbox');
 
        wp_enqueue_script('media-upload');
        wp_enqueue_script('wptuts-upload');
 
    }
 
}
add_action('admin_enqueue_scripts', 'wptuts_options_enqueue_scripts');

/**
 * Sanitize and validate input. Accepts an array, return a sanitized array.
 */
function theme_options_validate( $input ) {
	global $select_options, $radio_options;


	// Say our text option must be safe text with no HTML tags
	$input['logo'] 				= wp_filter_nohtml_kses( $input['logo'] );
	$input['alternative_logo'] 	= wp_filter_nohtml_kses( $input['alternative_logo'] );
	$input['favicon'] 			= wp_filter_nohtml_kses( $input['favicon'] );
	$input['slogan'] 			= wp_filter_nohtml_kses( $input['slogan'] );
	$input['companyaddress'] 	= wp_filter_nohtml_kses( $input['companyaddress'] );	
	$input['contactno'] 		= wp_filter_nohtml_kses( $input['contactno'] );
	$input['email'] 			= wp_filter_nohtml_kses( $input['email'] );
	$input['googleanalytics']	= wp_filter_nohtml_kses( $input['googleanalytics'] );	

	// Say our textarea option must be safe text with the allowed tags for posts
	$input['introtextarea'] 	= wp_filter_post_kses( $input['introtextarea'] );

	// Our checkbox value is either 0 or 1
	/*if ( ! isset( $input['option1'] ) )
		$input['option1'] = null;
	$input['option1'] = ( $input['option1'] == 1 ? 1 : 0 );*/

	// Our select option must actually be in our array of select options
	if ( ! array_key_exists( $input['underbanner'], $select_options ) )
		$input['underbanner'] = null;

	if ( ! array_key_exists( $input['featuredproducts'], $select_options) )
		$input['featuredproducts'] = null;

	// Our radio option must actually be in our array of radio options
	/*if ( ! isset( $input['radioinput'] ) )
		$input['radioinput'] = null;
	if ( ! array_key_exists( $input['radioinput'], $radio_options ) )
		$input['radioinput'] = null;*/	

	return $input;
}

// adapted from http://planetozh.com/blog/2009/05/handling-plugins-options-in-wordpress-28-with-register_setting/