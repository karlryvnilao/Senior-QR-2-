<?php 
session_start();
if (isset($_SESSION['id']) && isset($_SESSION['national_id'])) {
    // Database connection
    $conn = mysqli_connect("localhost", "root", "", "bis");

    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    $resident_id = $_SESSION['id'];
    
    // Fetch resident information
    $stmt = $conn->prepare("SELECT tblresident.*, tblpurok.name 
                            FROM tblresident 
                            INNER JOIN tblpurok ON tblresident.purok = tblpurok.id 
                            WHERE tblresident.id = ?");
    $stmt->bind_param("i", $resident_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        $resident = $result->fetch_assoc();
        $fullName = trim($resident['firstname'] . ' ' . $resident['middlename'] . ' ' . $resident['lastname']);
    } else {
        $resident = null;
        $fullName = "No data available";
    }
    
    // Fetch beneficiary information
    $beneficiary_stmt = $conn->prepare("SELECT * FROM tblbenificiary WHERE resident_id = ?");
    $beneficiary_stmt->bind_param("i", $resident_id);
    $beneficiary_stmt->execute();
    $beneficiary_result = $beneficiary_stmt->get_result();

    $beneficiaries = [];
    if ($beneficiary_result && $beneficiary_result->num_rows > 0) {
        while ($row = $beneficiary_result->fetch_assoc()) {
            $beneficiaries[] = $row;
        }
    }

    $stmt->close();
    $beneficiary_stmt->close();
    mysqli_close($conn);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Generate Resident Profile -  Barangay Management System</title>
</head>
<style>
    .card {
        width: 100%;
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .grid-container {
        display: grid;
        grid-template-columns: 30% 40% 30%; /* Column widths */
    }

    .grid-item {
        padding: 20px;
        text-align: center; /* Center text by default */
    }

    .grid-item.text-left {
        text-align: left; /* Override text alignment for the second column */
    }

    .two-column {
        display: grid;
        grid-template-columns: 1fr 1fr; /* Two equal columns */
        gap: 10px; /* Space between columns */
        position: relative; /* Position relative to place the dividing line */
    }

    .two-column::before {
        content: "";
        position: absolute;
        top: 0;
        left: 50%;
        width: 1px; /* Width of the dividing line */
        height: 100%;
        background-color: #000; /* Color of the dividing line */
        transform: translateX(-50%); /* Center the line */
    }

    .two-column .grid-item h5 {
        text-align: left; /* Align headings to the left */
    }

    .two-column .grid-item p {
        text-align: left; /* Align paragraphs to the left */
    }
    @media (max-width: 768px) {
    .card {
        width: 100%;
        padding: 10px;
    }

    .grid-container {
        grid-template-columns: 1fr;
    }
}
/* Modal styles */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

.close-btn {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close-btn:hover,
.close-btn:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
img.img-fluid {
    max-width: 150px;
}
</style>
<body>
                            <div class="card">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">Resident Profile</div>
										<div class="card-tools">
											<button class="btn btn-info btn-border btn-round btn-sm" onclick="printDiv('printThis')">
												<i class="fa fa-print"></i>
												Print Report
											</button>
										</div>
									</div>
								</div>
								<div class="card-body m-5" id="printThis">
                                    <div class="grid-container">
                                        <div class="grid-item">
                                            <img src="<?= preg_match('/data:image/i', $resident['picture']) ? $resident['picture'] : '../assets/uploads/resident_profile/'.$resident['picture'] ?>" alt="Resident Profile" class="img-fluid">
                                        </div>
                                        <div class="grid-item text-left">
                                            <p>ID Number - <?= $resident['national_id'] ?></p>
                                            <p>Fullname - <?= $fullName ?></p>
                                            <p>Barangay - <?= $resident['name'] ?></p>
                                            <p>Address - <?= ucwords(trim($resident['address'])) ?></p>
                                            <p>Pension Status - </p>
                                        </div>
                                        <div class="grid-item">
                                        <img src="<?= preg_match('/data:image/i', $resident['qrimage']) ? $resident['qrimage'] : '../assets/img/qrcode/'.$resident['qrimage'] ?>" alt="Resident Profile" class="img-fluid">
                                        <p><em>Claim your pensions every end of the month!</em></p>
                                        </div>
                                    </div>
                                    <!-- Insert the two-column layout with a dividing line -->
                                    <div class="two-column">
                                        <div class="grid-item">
                                            <h5><b>Additional Information</b></h5>
                                            <p>Birthdate - <?= date('F d, Y', strtotime($resident['birthdate'])) ?></p>
                                            <p>Age - <?= $resident['age'] ?> yrs. old</p>
                                            <p>Place of Birth - <?= $resident['birthplace'] ?></p>
                                            <p>Pension - <?= $resident['pension'] ?></p>
                                            <p>Status - <?= $resident['resident_type']==1 ? 'Alive' : 'Deceased' ?></p>
                                        </div>
                                        <div class="grid-item">
                                            <h5><b>Person to Contact Incase of Emergency</b></h5>
                                            <?php if (!empty($beneficiaries)): ?>
                                                <?php foreach ($beneficiaries as $beneficiary): ?>
                                                    <p>Name: <?= htmlspecialchars($beneficiary['fullname']) ?></p>
                                                    <p>Relationship: <?= htmlspecialchars($beneficiary['relationship']) ?></p>
                                                    <p>Contact Number: <?= htmlspecialchars($beneficiary['phone']) ?></p>
                                                    <p>Email: <?= htmlspecialchars($beneficiary['email']) ?></p>
                                                    <p>Address: <?= htmlspecialchars($beneficiary['address']) ?></p>
                                                    
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <p>No beneficiaries available.</p>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                </div>
                                <a href="logout.php" class="nav__link nav__logout">
                   <i class='bx bx-log-out nav__icon'></i>
                    <span class="nav__name" id="log_out">Logout</a></span>
                </a>
						</div>

                        
					
    <script>
         function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = '<html><head><title>Print</title></head><body>' + printContents + '</body></html>';

        window.print();

        document.body.innerHTML = originalContents;
    }
    document.addEventListener("DOMContentLoaded", function() {
    var modal = document.getElementById("pensionStatusModal");
    var btn = document.querySelector(".btn-secondary"); // Button that opens the modal
    var span = document.getElementsByClassName("close-btn")[0];
    
    // Open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // Close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // Close the modal when clicking outside of it
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
});



    </script>
</body>
</html>
<?php 
}else{
     header("Location: index.php");
     exit();
}
 ?>