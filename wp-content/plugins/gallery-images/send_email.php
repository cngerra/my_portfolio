<?php
require('../../../wp-load.php');
add_action( 'plugins_loaded', 'send_message' );

$products_enq	= $_POST['Enquired_Product'];
$client_email	= $_POST['User_Email'];
//$send_enquiry	= $_POST['send_enquiry'];

$to = get_option('admin_email');
$subject = 'Products Enquiry';
$message = "This email has been sent from " . $_SERVER['SERVER_NAME'] . " on the " . date('d/m/Y',time()) . "<br><br>";
$message .= '<b>Enquired Product</b>: '.$products_enq.'<br /><br />';
$message .= '<b>Client Email</b>: '.$client_email;

$toSender = $client_email;
$subjectNotif = 'Your Products Enquiry has been successfully sent.';
$messageNotif = "This email has been sent from " . $_SERVER['SERVER_NAME'] . " on the " . date('d/m/Y',time()) . "<br><br>";
$messageNotif .= 'Your enquiry for the product '.$products_enq.' has been successfully sent. We will email you soon about the product details.';

$headers = array('Content-Type: text/html; charset=UTF-8');

$send_email 		= wp_mail( $to, $subject, $message, $headers );
$send_emailNotif 	= wp_mail( $toSender, $subjectNotif, $messageNotif, $headers );

//header('Location: ' . $_SERVER['HTTP_REFERER']);
unset($products_enq);
unset($client_email);
echo 'Success';	

?>