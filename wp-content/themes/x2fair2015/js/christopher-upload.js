jQuery(document).ready(function($){
	$('#upload_logo_button').click(function() {
		tb_show('Upload a logo', 'media-upload.php?referer=theme-settings&amp;type=image&amp;TB_iframe=true&amp;post_id=0', false);
		return false;
	});

	$('#upload_homeimage_button').click(function() {
		tb_show('Upload a homepage image', 'media-upload.php?referer=theme-settings&amp;type=image&amp;TB_iframe=true&amp;post_id=0', false);
		return false;
	});

	$('#upload_favicon_button').click(function() {
		tb_show('Upload Favicon', 'media-upload.php?referer=theme-settings&amp;type=image&amp;TB_iframe=true&amp;post_id=0', false);
		return false;
	});	
	
	save_favicon();
	save_logo();
	save_home_image();

	function save_favicon(){
		window.send_to_editor = function(html) {
			// html returns a link like this:
			// <a href="{server_uploaded_image_url}"><img src="{server_uploaded_image_url}" alt="" title="" width="" height"" class="alignzone size-full wp-image-125" /></a>
			var image_url = $('img',html).attr('src');
			//alert(html);
			$('#favicon_url').val(image_url);
			tb_remove();	
			$('#upload_favicon_preview img').attr('src',image_url);
			
			//$('#submit_options_form').trigger('click');
			// $('#uploaded_logo').val('uploaded');
			
		}
	}

	function save_logo(){
		window.send_to_editor = function(html) {
			// html returns a link like this:
			// <a href="{server_uploaded_image_url}"><img src="{server_uploaded_image_url}" alt="" title="" width="" height"" class="alignzone size-full wp-image-125" /></a>
			var image_url = $('img',html).attr('src');
			//alert(html);
			$('#logo_url').val(image_url);
			tb_remove();	
			$('#upload_logo_preview img').attr('src',image_url);
			
			$('#submit_options_form').trigger('click');
			// $('#uploaded_logo').val('uploaded');
			
		}
	}

	function save_home_image(){
		window.send_to_editor = function(html) {
			// html returns a link like this:
			// <a href="{server_uploaded_image_url}"><img src="{server_uploaded_image_url}" alt="" title="" width="" height"" class="alignzone size-full wp-image-125" /></a>
			var image_url = $('img',html).attr('src');
			//alert(html);
			$('#homepage_image_url').val(image_url);
			tb_remove();	
			$('#upload_homeimage_preview img').attr('src',image_url);
			
			//$('#submit_options_form').trigger('click');
			// $('#uploaded_logo').val('uploaded');
			
		}
	}
	
	
});