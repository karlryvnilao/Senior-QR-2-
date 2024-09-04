<?php 
session_start(); 
include "../server/server.php";

if (isset($_POST['national_id'])) {

	function validate($data){
       $data = trim($data);
	   $data = stripslashes($data);
	   $data = htmlspecialchars($data);
	   return $data;
	}

	$national_id = validate($_POST['national_id']);


	if (empty($national_id)) {
		header("Location: index.php?error=QR CODE is required");
	    exit();
	}else{
		$sql = "SELECT * FROM tblresident WHERE national_id='$national_id'";

		$result = mysqli_query($conn, $sql);

		if (mysqli_num_rows($result) === 1) {
			$row = mysqli_fetch_assoc($result);
            if ($row['national_id'] === $national_id) {
            	$_SESSION['national_id'] = $row['national_id'];
				$_SESSION['lastname'] = $row['lastname'];
            	$_SESSION['id'] = $row['id'];
            	header("Location: home.php");
		        exit();
            }else{
				header("Location: index.php?error=INCORRECT QR CODE");
		        exit();
			}
		}else{
			header("Location: index.php?error=INCORRECT QR CODE");
	        exit();
		}
	}
	
}else{
	header("Location: index.php");
	exit();
}