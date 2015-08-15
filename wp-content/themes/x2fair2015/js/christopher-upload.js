jQuery(document).ready(function(jQuery){
	jQuery('#upload_favicon_button').click(function() {
		tb_show('Upload Favicon', 'media-upload.php?referer=theme-settings&amp;type=image&amp;TB_iframe=true&amp;post_id=0', false);
		save_favicon();	
		return false;
	});	

	jQuery('#upload_logo_button').click(function() {
		tb_show('Upload a logo', 'media-upload.php?referer=theme-settings&amp;type=image&amp;TB_iframe=true&amp;post_id=0', false);
		save_logo();
		return false;
	});

	jQuery('#upload_homeimage_button').click(function() {
		tb_show('Upload a homepage image', 'media-upload.php?referer=theme-settings&amp;type=image&amp;TB_iframe=true&amp;post_id=0', false);
		save_home_image();
		return false;
	});	

	jQuery('#delete_favicon_button').click(function() {
		jQuery('#favicon_url').val('')
		jQuery('#upload_favicon_preview img').attr('src','');
	});	

	jQuery('#delete_logo_button').click(function() {
		jQuery('#logo_url').val('')
		jQuery('#upload_logo_preview img').attr('src','');
	});	

	jQuery('#delete_homeimage_button').click(function() {
		jQuery('#homepage_image_url').val('')
		jQuery('#upload_homeimage_preview img').attr('src','');
	});	
	

	function save_favicon(){
		window.send_to_editor = function(html) {
			// html returns a link like this:
			// <a href="{server_uploaded_image_url}"><img src="{server_uploaded_image_url}" alt="" title="" width="" height"" class="alignzone size-full wp-image-125" /></a>
			var favicon_url = jQuery('img',html).attr('src');
			//alert(html);
			jQuery('#favicon_url').val(favicon_url);
			tb_remove();
			jQuery('#upload_favicon_preview img').attr('src',favicon_url);
			
			//$('#submit_options_form').trigger('click');
			// $('#uploaded_logo').val('uploaded');
			
		}
	}
	function save_logo(){
		window.send_to_editor = function(html) {
			// html returns a link like this:
			// <a href="{server_uploaded_image_url}"><img src="{server_uploaded_image_url}" alt="" title="" width="" height"" class="alignzone size-full wp-image-125" /></a>
			var logo_url = jQuery('img',html).attr('src');
			//alert(image_url);
			//alert(html);
			jQuery('#logo_url').val(logo_url);
			tb_remove();	
			jQuery('#upload_logo_preview img').attr('src',logo_url);
			
			//$('#submit_options_form').trigger('click');
			// $('#uploaded_logo').val('uploaded');
			
		}
	}

	function save_home_image(){
		window.send_to_editor = function(html) {
			// html returns a link like this:
			// <a href="{server_uploaded_image_url}"><img src="{server_uploaded_image_url}" alt="" title="" width="" height"" class="alignzone size-full wp-image-125" /></a>
			var home_image_url = jQuery('img',html).attr('src');
			//alert(image_url);
			//alert(html);
			jQuery('#homepage_image_url').val(home_image_url);
			tb_remove();	
			jQuery('#upload_homeimage_preview img').attr('src',home_image_url);
			
			//$('#submit_options_form').trigger('click');
			// $('#uploaded_logo').val('uploaded');
			
		}
	}

});