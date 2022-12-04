<?php

include '../connection.php';

$studentEmail = $_POST['student_email'];

$sqlQuery = "SELECT * FROM students WHERE student_email = '$studentEmail'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery->num_rows > 0) {
    echo json_encode(array('emailFound' => true));
} else {
    echo json_encode(array('emailFound' => false));
}