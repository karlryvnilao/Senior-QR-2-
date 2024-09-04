<?php
include '../server/server.php';

// Check if the request is a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get and sanitize the input values
    $id = $conn->real_escape_string($_POST['residentId']);
    $status = $conn->real_escape_string($_POST['pensionStatus']);

    // Prepare the SQL update query
    $query = "UPDATE tblresident SET status = '$status' WHERE id = '$id'";

    // Execute the query
    if ($conn->query($query) === TRUE) {
        // Return a success message
        echo "Pension status updated successfully.";
    } else {
        // Return an error message
        echo "Error updating record: " . $conn->error;
    }

    // Close the database connection
    $conn->close();
} else {
    // If not a POST request, return an error
    http_response_code(405); // Method Not Allowed
    echo "Invalid request method.";
}
?>
