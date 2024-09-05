<?php

require("../server/server.php");

// get Users
$query = "SELECT national_id,firstname,middlename,lastname,birthplace,birthdate,age,civilstatus,gender,purok,phone,email,address FROM tblresident";
if (!$result = $conn->query($query)) {
    exit($conn->error);
}

$users = array();
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $users[] = $row;
    }
}

header('Content-Type: text/csv; charset=utf-8');
header('Content-Disposition: attachment; filename=Residents.csv');
$output = fopen('php://output', 'w');
fputcsv($output, array('National ID', 'First Name','Middle Name', 'Last Name', 'Birtplace', 'Birthdate', 'Age', 'Civil Status', 'Gender', 'Purok', 'Contact Number', 'Email Address', 'Address'));

if (count($users) > 0) {
    foreach ($users as $row) {
        fputcsv($output, $row);
    }
}


?>