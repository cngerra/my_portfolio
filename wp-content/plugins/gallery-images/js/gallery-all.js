// SET THIS VARIABLE FOR DELAY, 1000 = 1 SECOND

var delayLength = 4000;

	

function doMove(panelWidth, tooFar) {

	var leftValue = jQuery("#mover").css("left");

	

	// Fix for IE

	if (leftValue == "auto") { leftValue = 0; };

	

	var movement = parseFloat(leftValue, 10) - panelWidth;

	

	if (movement == tooFar) {

		jQuery(".slide img").animate({

			"top": -200

		}, function() {

			jQuery("#mover").animate({

				"left": 0

			}, function() {

				jQuery(".slide img").animate({

					"top": 20

				});

			});

		});

	}

	else {

		jQuery(".slide img").animate({

			"top": -200

		}, function() {

			jQuery("#mover").animate({

				"left": movement

			}, function() {

				jQuery(".slide img").animate({

					"top": 20

				});

			});

		});

	}

}



jQuery(function(){

	

    var $slide1 = jQuery("#slide-1");



	var panelWidth = $slide1.css("width");

	var panelPaddingLeft = $slide1.css("paddingLeft");

	var panelPaddingRight = $slide1.css("paddingRight");



	panelWidth = parseFloat(panelWidth, 10);

	panelPaddingLeft = parseFloat(panelPaddingLeft, 10);

	panelPaddingRight = parseFloat(panelPaddingRight, 10);



	panelWidth = panelWidth + panelPaddingLeft + panelPaddingRight;

	

	var numPanels = jQuery(".slide").length;

	var tooFar = -(panelWidth * numPanels);

	var totalMoverwidth = numPanels * panelWidth;

	jQuery("#mover").css("width", totalMoverwidth);



	jQuery("#slider").append('<a href="#" id="slider-stopper">Stop</a>');



	sliderIntervalID = setInterval(function(){

		doMove(panelWidth, tooFar);

	}, delayLength);

	

	jQuery("#slider-stopper").click(function(){

		if (jQuery(this).text() == "Stop") {

			clearInterval(sliderIntervalID);

		 	jQuery(this).text("Start");

		}

		else {

			sliderIntervalID = setInterval(function(){

				doMove(panelWidth, tooFar);

			}, delayLength);

		 	jQuery(this).text("Stop");

		}

		 

	});

	jQuery('.enquire_now').click(function(){
        //alert('t');
        jQuery(this).parents(".right-block").find('.enquire_form').show();
        jQuery(this).hide();
        //jQuery(".enquire_form").load("http://vanmochi.ca/wp-content/plugins/gallery-images/contact_form.php");
    });

	jQuery('#huge-popup-overlay').click(function(){
		jQuery('.enquire_now').show();
	});

    jQuery('.close').click(function(){
    	jQuery('.enquire_form').hide();
    	jQuery('.enquire_now').show();
    });

    jQuery('.buttonthis').click(function(){
    	var url = jQuery(this).attr('name');
    	window.open(url, '_blank');
    })


});

jQuery(document).ready(function(){
	jQuery(".client_email").keypress(function(e){
		var keycode = e.keycode || e.which;
		if(keycode == 13){
			//submit_enquiry_script();
			//jQuery(".submit_btn").click();
			alert("Please click the SEND button.");
			return false;
		}
	});
	//submit_enquiry_script();

});

function submit_enquiry_script(the_form){
	
	var the_form	= jQuery('#'+the_form).attr('id');
	
	//var url		= jQuery(form_name).attr('action');
	var url			= "http://vanmochi.ca/wp-content/plugins/gallery-images/send_email.php";
	var method		= jQuery('#'+the_form).attr('method');
	var data		= jQuery('#'+the_form).serialize();
	var form_names	= jQuery('#'+the_form).attr('id');

	var enquired_product= jQuery('#'+the_form).find('#Enquired_Product').val();
	var client_email 	= jQuery('#'+the_form).find('#User_Email').val();

	// alert(data);
	// alert(form_names);
	// alert(enquired_product);
	// alert(client_email);

	if(!isValidEmailAddress(client_email)){
		// alert('Error');
		jQuery('.form_input').focus();
		jQuery('.error_message_email').show().delay(5000).fadeOut();
		return false;
	}else{
		jQuery.ajax({
			'url':url,
			'method': method,
			'data': data,
			'success': function(data){
				//alert(data);
				if(data == 'Success'){
				
					jQuery('#'+the_form).find('#User_Email').val("");
					jQuery('.success_message_email').show().delay(5000).fadeOut();

				}
			}
		});
	}
}
function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return pattern.test(emailAddress);
}