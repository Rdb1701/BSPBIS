<?php 
include("../../../utils/connection.php");
include '../../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$data_1 = array();
$res_success = 0;
$res_message = '';


$fileName = $_FILES['excel_1']['name'];
$file_ext = pathinfo($fileName, PATHINFO_EXTENSION);

$allowed_ext = ['xls','csv','xlsx'];

if(in_array($file_ext, $allowed_ext))
{
    $inputFileNamePath = $_FILES['excel_1']['tmp_name'];
    $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($inputFileNamePath);
    $data = $spreadsheet->getActiveSheet()->toArray();
    
    $count = "0";

    foreach($data as $row)
    {
    if($count > 0)
    {
        $fname        = $row['0'];
        $mname        = $row['1'];
        $lname        = $row['2'];
        $bday         = $row['3'];
        $age          = $row['4'];
        $gender       = $row['5'];
        $barangay     = $row['6'];
        $control_no   = $row['7'];
        $date_issued  = $row['8'];


        $query = "
        UPDATE tbl_solo_parent
        set
        status = '1'
        WHERE control_no = '$control_no'
        ";

        if($db->query($query)){
            $res_success = 1;
        }else{
            $res_success = 2;
        }

        //IF COUNT
        }else{
            $count = "1";
        }
    //FOREACH
    }

}

echo $res_success;




?>