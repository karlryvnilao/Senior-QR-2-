<?php
include 'server/server.php';
$id = $_GET['id'];

// Prepare and execute the query for resident data
$stmt = $conn->prepare("
    SELECT tblresident.*, tblpurok.name 
    FROM tblresident 
    INNER JOIN tblpurok ON tblresident.purok = tblpurok.id 
    WHERE tblresident.id = ?
");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$resident = $result->fetch_assoc();
$fullName = trim($resident['firstname'] . ' ' . $resident['middlename'] . ' ' . $resident['lastname']);

// Prepare and execute the query for beneficiaries
$beneficiariesStmt = $conn->prepare("
    SELECT * 
    FROM tblbenificiary 
    WHERE resident_id = ?
");
$beneficiariesStmt->bind_param("i", $id);
$beneficiariesStmt->execute();
$beneficiariesResult = $beneficiariesStmt->get_result();
$beneficiaries = $beneficiariesResult->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<?php include 'templates/header.php' ?>
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
        grid-template-columns: 20% 40% 20% 20%; /* Column widths */
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
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
    max-width: 500px;
    border-radius: 8px;
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

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.btn-primary {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #0056b3;
}

</style>
<body>
<?php include 'templates/loading_screen.php' ?>
	<div class="wrapper">
		<!-- Main Header -->
		<?php include 'templates/main-header.php' ?>
		<!-- End Main Header -->

		<!-- Sidebar -->
		<?php include 'templates/sidebar.php' ?>
		<!-- End Sidebar -->

		<div class="main-panel">
			<div class="content">
				<div class="panel-header bg-primary-gradient">
					<div class="page-inner">
						<div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
							<div>
								<h2 class="text-white fw-bold">Generate Resident Profile</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="page-inner">
					<div class="row mt--2">
						<div class="col-md-12">

                            <?php if(isset($_SESSION['message'])): ?>
                                <div class="alert alert-<?php echo $_SESSION['success']; ?> <?= $_SESSION['success']=='danger' ? 'bg-danger text-light' : null ?>" role="alert">
                                    <?php echo $_SESSION['message']; ?>
                                </div>
                            <?php unset($_SESSION['message']); ?>
                            <?php endif ?>

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
                                            <img src="<?= preg_match('/data:image/i', $resident['picture']) ? $resident['picture'] : 'assets/uploads/resident_profile/'.$resident['picture'] ?>" alt="Resident Profile" class="img-fluid">
                                        </div>
                                        <div class="grid-item text-left">
                                            <p>ID Number - <?= $resident['national_id'] ?></p>
                                            <p>Fullname - <?= $fullName ?></p>
                                            <p>Barangay - <?= $resident['name'] ?></p>
                                            <p>Address - <?= ucwords(trim($resident['address'])) ?></p>
                                            <p>Pension Status - <?= $resident['status'] ?></p>
                                        </div>
                                        <div class="grid-item">
                                        <img src="<?= preg_match('/data:image/i', $resident['qrimage']) ? $resident['qrimage'] : 'assets/img/qrcode/'.$resident['qrimage'] ?>" alt="Resident Profile" class="img-fluid">
                                        </div>
                                        <div class="grid-item">
                                            <button type="button" class="btn btn-primary">Beneficiary</button>
                                            <button type="button" class="btn btn-secondary">Pension Status</button>
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
                                        <?php foreach ($beneficiaries as $beneficiary): ?>
                                            <h5><b>Person to Contact Incase of Emergency</b></h5>
                                            <p>Fullname - <?= $beneficiary['fullname'] ?></p></p>
                                            <p>Number - <?= $beneficiary['phone'] ?></p></p>
                                            <p>Email - <?= $beneficiary['email'] ?></p></p>
                                            <p>Address - <?= $beneficiary['address'] ?></p></p>
                                            <p>Relationship - <?= $beneficiary['relationship'] ?></p></p>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal Structure -->
                                <div id="pensionStatusModal" class="modal">
                                    <div class="modal-content">
                                        <span class="close-btn">&times;</span>
                                        <h2>Update Pension Status</h2>
                                        <form id="pensionStatusForm">
                                            <div class="form-group">
                                                <label for="pensionStatus">Pension Status:</label>
                                                <select id="pensionStatus" name="pensionStatus">
                                                    <option value="claimed">Claimed</option>
                                                    <option value="unclaimed">Unclaimed</option>
                                                </select>
                                            </div>
                                            <input type="hidden" id="residentId" name="residentId" value="<?= htmlspecialchars($resident['id']) ?>">
                                            <button type="submit" class="btn btn-primary">Update</button>
                                        </form>
                                    </div>
                                </div>

						</div>
					</div>
				</div>
			</div>

            


			<!-- Main Footer -->
			<?php include 'templates/main-footer.php' ?>
			<!-- End Main Footer -->
			
		</div>
		
	</div>
	<?php include 'templates/footer.php' ?>
    <script>
         function printDiv(divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = '<html><head><title>Print</title></head><body>' + printContents + '</body></html>';

        window.print();

        document.body.innerHTML = originalContents;
    }

    document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById("pensionStatusModal");
    var btn = document.querySelector(".btn-secondary");
    var span = document.getElementsByClassName("close-btn")[0];
    var form = document.getElementById("pensionStatusForm");

    // Open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // Close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // Handle form submission
    form.onsubmit = function(e) {
        e.preventDefault();
        
        var formData = new FormData(form);

        fetch('model/update_pension.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(result => {
            alert(result); // Show a message or handle success
            modal.style.display = "none";
            location.reload(); // Reload the page to reflect changes
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
});

  


    </script>
</body>
</html>