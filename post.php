<?php
// File to save form data
$file = 'submissions.txt';

// Collect form data
$name = $_POST['et_pb_contact_name_0'];
$email = $_POST['et_pb_contact_email_0'];
$phone = $_POST['et_pb_contact_phone_0'];
$ndis_participant = $_POST['et_pb_contact_field_4_2_0'];
$management_type = $_POST['et_pb_contact_field_4_0'];

// Format the data
$data = "Name: $name, Email: $email, Phone: $phone, NDIS Participant: $ndis_participant, Management Type: $management_type" . PHP_EOL;

// Write the data to the file
file_put_contents($file, $data, FILE_APPEND);

// Send a success response
echo "Form data saved successfully!";
?>
