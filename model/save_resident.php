<?php 
include '../server/server.php';
require_once 'phpqrcode/qrlib.php';

$path = '../assets/img/qrcode/';
$qrcode = $path . time() . ".png";
$qrimage = time() . ".png";

if (!isset($_SESSION['username'])) {
    if (isset($_SERVER["HTTP_REFERER"])) {
        header("Location: " . $_SERVER["HTTP_REFERER"]);
        exit;
    }
}

// Check database connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$national_id = $conn->real_escape_string($_POST['national']);
$citizen = $conn->real_escape_string($_POST['citizenship']);
$fname = $conn->real_escape_string($_POST['fname']);
$mname = $conn->real_escape_string($_POST['mname']);
$lname = $conn->real_escape_string($_POST['lname']);
$bplace = $conn->real_escape_string($_POST['bplace']);
$bdate = $conn->real_escape_string($_POST['bdate']);
$age = $conn->real_escape_string($_POST['age']);
$cstatus = $conn->real_escape_string($_POST['cstatus']);
$gender = $conn->real_escape_string($_POST['gender']);
$purok = $conn->real_escape_string($_POST['purok']);
$email = $conn->real_escape_string($_POST['email']);
$number = $conn->real_escape_string($_POST['number']);
$occupation = $conn->real_escape_string($_POST['occupation']);
$address = $conn->real_escape_string($_POST['address']);
$pension = $conn->real_escape_string($_POST['pension']);
$profile = $conn->real_escape_string($_POST['profileimg']); // base 64 image
$profile2 = $_FILES['img']['name'];

// Beneficiary details
$ben_fname = $conn->real_escape_string($_POST['ben_fname']);
$ben_number = $conn->real_escape_string($_POST['ben_number']);
$ben_email = $conn->real_escape_string($_POST['ben_email']);
$ben_address = $conn->real_escape_string($_POST['ben_address']);
$ben_relationship = $conn->real_escape_string($_POST['ben_relationship']);

// Change profile2 name
$newName = date('dmYHis') . str_replace(" ", "", $profile2);

// Image file directory
$target = "../assets/uploads/resident_profile/" . basename($newName);

// Check if national ID is unique
$check = "SELECT id FROM tblresident WHERE national_id='$national_id'";
$nat = $conn->query($check)->num_rows;    

if ($nat == 0) {
    if (!empty($fname)) {
        // Insert resident information
        if (!empty($profile) && !empty($profile2)) {
            $query = "INSERT INTO tblresident (national_id, citizenship, picture, firstname, middlename, lastname, birthplace, birthdate, age, civilstatus, gender, purok, phone, email, occupation, address, pension, qrimage) 
                      VALUES ('$national_id', '$citizen', '$profile', '$fname', '$mname', '$lname', '$bplace', '$bdate', $age, '$cstatus', '$gender', '$purok', '$number', '$email', '$occupation', '$address', '$pension', '$qrimage')";
            $resident_saved = $conn->query($query);

        } else if (!empty($profile) && empty($profile2)) {
            $query = "INSERT INTO tblresident (national_id, citizenship, picture, firstname, middlename, lastname, birthplace, birthdate, age, civilstatus, gender, purok, phone, email, occupation, address, pension, qrimage) 
                      VALUES ('$national_id', '$citizen', '$profile', '$fname', '$mname', '$lname', '$bplace', '$bdate', $age, '$cstatus', '$gender', '$purok', '$number', '$email', '$occupation', '$address', '$pension', '$qrimage')";
            $resident_saved = $conn->query($query);

        } else if (empty($profile) && !empty($profile2)) {
            $query = "INSERT INTO tblresident (national_id, citizenship, picture, firstname, middlename, lastname, birthplace, birthdate, age, civilstatus, gender, purok, phone, email, occupation, address, pension, qrimage) 
                      VALUES ('$national_id', '$citizen', '$newName', '$fname', '$mname', '$lname', '$bplace', '$bdate', $age, '$cstatus', '$gender', '$purok', '$number', '$email', '$occupation', '$address', '$pension', '$qrimage')";
            $resident_saved = $conn->query($query);

            if (move_uploaded_file($_FILES['img']['tmp_name'], $target)) {
                $_SESSION['message'] = 'Resident Information has been saved!';
                $_SESSION['success'] = 'success';
            } else {
                $_SESSION['message'] = 'File upload error!';
                $_SESSION['success'] = 'danger';
            }

        } else {
            $query = "INSERT INTO tblresident (national_id, citizenship, picture, firstname, middlename, lastname, birthplace, birthdate, age, civilstatus, gender, purok, phone, email, occupation, address, pension, qrimage) 
                      VALUES ('$national_id', '$citizen', 'person.png', '$fname', '$mname', '$lname', '$bplace', '$bdate', $age, '$cstatus', '$gender', '$purok', '$number', '$email', '$occupation', '$address', '$pension', '$qrimage')";
            $resident_saved = $conn->query($query);
        }

        if ($resident_saved) {
            // Get the last inserted resident ID
            $resident_id = $conn->insert_id;

            // Insert beneficiary information
            $ben_query = "INSERT INTO tblbenificiary (resident_id, fullname, phone, email, address, relationship) 
                          VALUES ('$resident_id', '$ben_fname', '$ben_number', '$ben_email', '$ben_address', '$ben_relationship')";
            if ($conn->query($ben_query) === true) {
                $_SESSION['message'] = 'Resident and Beneficiary Information has been saved!';
                $_SESSION['success'] = 'success';
            } else {
                $_SESSION['message'] = 'Beneficiary Database error: ' . $conn->error;
                $_SESSION['success'] = 'danger';
            }
        } else {
            $_SESSION['message'] = 'Database error: ' . $conn->error;
            $_SESSION['success'] = 'danger';
        }

    } else {
        $_SESSION['message'] = 'Please complete the form!';
        $_SESSION['success'] = 'danger';
    }
} else {
    $_SESSION['message'] = 'National ID is already taken. Please enter a unique national ID!';
    $_SESSION['success'] = 'danger';
}

QRcode::png($national_id, $qrcode, 'H', 4, 4);
header("Location: ../resident.php");
exit;

$conn->close();
?>
