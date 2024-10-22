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

// Query to get Purok distribution from tblresident with a LEFT JOIN on tblpurok
$purokQuery = "SELECT tblpurok.name, COUNT(tblresident.id) as count 
               FROM tblpurok 
               LEFT JOIN tblresident ON tblpurok.id = tblresident.purok 
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
                                    <h4 class="card-title">Purok Distribution</h4>
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


        const purokLabels = <?php echo json_encode($puroks); ?>;
const purokData = <?php echo json_encode($purokCounts); ?>;
const purokPieCtx = document.getElementById('purokPieChart').getContext('2d');

// Log the purok labels and data to the console
console.log('Purok Labels:', purokLabels);
console.log('Purok Data:', purokData);

// Predefined color palette - ensure it has enough colors
const predefinedColors = [
    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF',
    '#FF9F40', '#FF5733', '#C70039', '#900C3F', '#581845',
    '#FFC300', '#DAF7A6', '#FF6F61', '#6A5ACD', '#FFB6C1',
    '#FFA07A', '#20B2AA', '#87CEFA', '#DDA0DD', '#F08080',
    '#778899', '#FFA500', '#008000', '#0000FF', '#800080',
    '#FFC0CB', '#FFD700', '#808080', '#00FFFF', '#FF4500',
];

// Ensure enough unique colors for each purok
const purokColors = [];
for (let i = 0; i < purokLabels.length; i++) {
    purokColors.push(predefinedColors[i % predefinedColors.length]);
}

// Log the assigned colors for debugging
console.log('Purok Colors:', purokColors);

new Chart(purokPieCtx, {
    type: 'pie',
    data: {
        labels: purokLabels,
        datasets: [{
            label: 'Number of Residents',
            data: purokData,
            backgroundColor: purokColors,
            borderColor: '#fff',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            tooltip: {
                callbacks: {
                    label: function(tooltipItem) {
                        return `${tooltipItem.label}: ${tooltipItem.raw}`;
                    }
                }
            }
        }
    }
});

    </script>
</body>
</html>
