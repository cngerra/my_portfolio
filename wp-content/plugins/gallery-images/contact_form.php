<form method="post" action="<?php //echo plugins_url( 'send_email.php', dirname(__FILE__) ); ?>" id="enquiry_contact_form" name="enquiry_contact_form" class="enquiry_contact_form">
	<div class="form-group">
		<input type="hidden" name="Enquired_Product" id="Enquired_Product" value="<?php echo $row->name; ?>" />
		<input type="text" name="User_Email" id="User_Email" value="" placeholder="Enter Your Email" class="form-control form_input client_email">
		<!-- <input type="submit" name="send_enquiry" value="SEND" class="submit_btn" /> -->
		<input type="button" name="send_enquiry" value="SEND" class="submit_btn" onClick="submit_enquiry_script('enquiry_contact_form');">
	</div>
	<div class="alert alert-success success_message_email" style="display: none">Inquiry successfully sent. We will get in touch with you soon.</div>
	<div class="alert alert-danger error_message_email" style="display: none">Please enter valid email address</div>
</form>