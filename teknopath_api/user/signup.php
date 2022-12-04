<?php

include '../connection.php';

$studentId = $_POST['student_id'];
$studentEmail = $_POST['student_email'];


$sqlQuery = "INSERT INTO students SET student_id = '$studentId', student_email = '$studentEmail'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}