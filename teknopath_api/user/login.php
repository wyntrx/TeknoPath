<?php

include '../connection.php';

$studentId = $_POST['student_id'];
$studentEmail = $_POST['student_email'];


//$sqlQuery = "SELECT * FROM users_table WHERE user_email = '$userEmail' AND user_password = '$userPassword'";
$sqlQuery = "SELECT * FROM students WHERE student_id = '$studentId' AND student_email = '$studentEmail'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery->num_rows > 0) {

    $userRecord = array();
    while ($rowFound = $resultOfQuery->fetch_assoc()) {
        $userRecord[] = $rowFound;
    }
    echo json_encode(
        array
        (
            "success" => true,
            "userData" => $userRecord[0]
        ),
    );
} else {
    echo json_encode(array("success" => false));
}