<?php
include 'server/server.php';

// Query to get gender distribution from tblresident
$genderQuery = "SELECT gender, COUNT(*) as count FROM tblresident GROUP BY gender";
$genderResult = $conn->query($genderQuery);

$genders = [];
$genderCounts = [];
while($row = $genderResult->fetch_assoc()) {
    $genders[] = $row['gender'];
    $genderCounts[] = $row['count'];
}

// Query to get Purok distribution from tblresident with join on tblpurok
$purokQuery = "SELECT tblpurok.name, COUNT(tblresident.id) as count 
               FROM tblresident 
               JOIN tblpurok ON tblresident.purok = tblpurok.id 
               GROUP BY tblpurok.name";
$purokResult = $conn->query($purokQuery);

$puroks = [];
$purokCounts = [];
while($row = $purokResult->fetch_assoc()) {
    $puroks[] = $row['name'];
    $purokCounts[] = $row['count'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <?php include 'templates/header.php' ?>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <title>Barangay Revenues - Barangay Management System</title>
</head>
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
                                <h2 class="text-white fw-bold">Report Charts</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-inner">
                    <div class="row mt--2">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Gender's</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="genderBarChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Baranggay's</h4>
                                </div>
                                <div class="card-body">
                                    <canvas id="purokPieChart"></canvas>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Gender Bar Chart
        // Gender Bar Chart
        const genderLabels = <?php echo json_encode($genders); ?>;
        const genderData = <?php echo json_encode($genderCounts); ?>;
        const genderBarCtx = document.getElementById('genderBarChart').getContext('2d');

        // Assign specific colors based on gender
        const genderColors = genderLabels.map(label => label === 'Female' ? 'rgba(255, 182, 193, 0.6)' : 'rgba(75, 192, 192, 0.2)'); // Pink for Female, Teal for others
        const genderBorderColors = genderLabels.map(label => label === 'Female' ? 'rgba(255, 105, 180, 1)' : 'rgba(75, 192, 192, 1)'); // Dark pink border for Female, Teal for others

        new Chart(genderBarCtx, {
            type: 'bar',
            data: {
                labels: genderLabels,
                datasets: [{
                    label: 'Number of Residents',
                    data: genderData,
                    backgroundColor: genderColors,
                    borderColor: genderBorderColors,
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });


        // Purok Pie Chart
        const purokLabels = <?php echo json_encode($puroks); ?>;
        const purokData = <?php echo json_encode($purokCounts); ?>;
        const purokPieCtx = document.getElementById('purokPieChart').getContext('2d');
        new Chart(purokPieCtx, {
            type: 'pie',
            data: {
                labels: purokLabels,
                datasets: [{
                    data: purokData,
                    backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>
</body>
</html>
