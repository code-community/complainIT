<?php
/**
 * Created by PhpStorm.
 * User: Karim K. Kanji
 * Date: 24/02/2019
 * Time: 15:06
 */

// Import credentials
require '../credentials.php';

//capture the action to be performed

if(isset($_GET['action'])){
    $action = $_GET['action'];
    switch ($action) {
        case 'create':
            createUsers($conn);
            break;
        case 'view':
            viewUsers($conn);
            break;
        default :
            showMessage();;
            break;
    }
}
else{
    showMessage();
}

function createUsers($conn)
{
    if(isset($_GET['name']) && isset($_GET['contacts']) && isset($_GET['description'])) {
        $name = $_GET['name'];
        $contacts = $_GET['contacts'];
        $description = $_GET['description'];
        if ($name !== null && $contacts !== null) {
            $check = "SELECT `name`, `contacts` FROM `departments` WHERE name = '$name' AND contacts='$contacts'";
            $resultCheck = $conn->query($check);
            if ($resultCheck->num_rows <= 0) {
                $sql = "INSERT INTO departments(name, contacts,description) VALUES ('$name', '$contacts','$description')";
                $result = $conn->query($sql);
                if ($result === true) {
                    echo "Successfully created a department";
                } else {
                    echo "An error has occurred: $conn->error !";
                }
            } else {
                echo "Record exists!";
            }
        } else {
            echo "The request was made partially and cannot be completed!";
        }
    }
    else{
        echo "The request was made partially and cannot be completed!";
    }
}

function viewUsers($conn)
{
    $sql = "SELECT * FROM users";
    $result  = $conn -> query($sql);
    if($result->num_rows==0){
        $arr = array('code' => 300, 'state' => 'empty', 'message' => 'There are no records to show.');
        header('Content-type: application/json');
        echo json_encode($arr);
    }
    else {
        $outp = array();
        $outpC = array('code' => 200, 'state' => 'success', 'message' => 'Users are available');
        $outp += array('code'=>$outpC,"data"=>$result->fetch_all(MYSQLI_ASSOC));
        header('Content-type: application/json');
        echo json_encode($outp);
    }
}
function showMessage()
{
    $arr = array('code' => 200, 'state' => 'success', 'message' => 'Shows the available endpoints.','action'=>'create/view/delete','name'=>'Place name here','description'=>'Place description here', 'example1'=>'/users/?action=view');
    header('Content-type: application/json');
    echo json_encode($arr);
}