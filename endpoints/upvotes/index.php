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
            createDepartment($conn);
            break;
        case 'view':
            viewDepartment($conn);
            break;
        default :
            showMessage();;
            break;
    }
}
else{
showMessage();
}

function createDepartment($conn)
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
                       $arr = array('code' => 200, 'state' => 'success', 'message' => 'Successfully created a department');
                    header('Content-type: application/json');
                       echo json_encode($arr);
                    //echo "Successfully created a department";
                } else {
                    $arr = array('code' => 100, 'state' => 'failure', 'message' => 'An error has occurred: '. $conn->error);
                    header('Content-type: application/json');
                    echo json_encode($arr);
                    //echo "An error has occurred: $conn->error !";
                }
            } else {
                $arr = array('code' => 100, 'state' => 'failure', 'message' => 'Record exists');
                header('Content-type: application/json');
                echo json_encode($arr);
                //echo "Record exists!";
            }
        } else {
            $arr = array('code' => 100, 'state' => 'failure', 'message' => 'The request was made partially and cannot be completed!');
            header('Content-type: application/json');
            echo json_encode($arr);
            //echo "The request was made partially and cannot be completed!";
        }
    }
    else{
        $arr = array('code' => 100, 'state' => 'failure', 'message' => 'The request was made partially and cannot be completed!');
        header('Content-type: application/json');
        echo json_encode($arr);
    }
}

function viewDepartment($conn)
{
    $sql = "SELECT * FROM upvotes";
    $result  = $conn -> query($sql);
    if($result->num_rows==0){
        $arr = array('code' => 300, 'state' => 'empty', 'message' => 'There are no records to show.');
        header('Content-type: application/json');
        echo json_encode($arr);
    }
    else {
        $outp = array();
        $outp += $result->fetch_all(MYSQLI_ASSOC);
        header('Content-type: application/json');
        echo json_encode($outp);
    }
}
function showMessage()
{
    echo "<center><h1>This will just load the page!</h1></center>";
}