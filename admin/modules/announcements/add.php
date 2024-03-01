<?php
include("../../../utils/connection.php");
date_default_timezone_set('Asia/Manila');

extract($_POST);

$res_success = 0;
$res_message = "";
$data        = array();


$query = "
INSERT INTO tbl_barangay_activities(
    activity_desc,
    purpose,
    date_inserted)VALUES(
    '$description',
    '$purpose',
    '".date("Y-m-d H:i:s")."'
)";

if (mysqli_query($db, $query)) {
    $res_success = 1;

} else {
    $res_message = "Query Failed";
}


$data['res_success'] = $res_success;
$data['res_message'] = $res_message;


echo json_encode($data);

?>