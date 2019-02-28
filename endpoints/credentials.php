<?php
/**
 * Created by PhpStorm.
 * User: Karim K. Kanji
 * Date: 24/02/2019
 * Time: 15:08
 */

//Create an error Handler function to handle any error that occurs.
function handleError($errno, $errstr){

        echo("<center style='border: black 2px solid;border-radius: 25px; margin: 10px; padding: 20px;'><h1 style='color: red'>Oh-no! </h1> The following error occurred: <br>$errno : $errstr</center>");

    }

//set the error handler to use handleError function to handle the error
set_error_handler("handleError");

//Check if the file exists in the directory
if(!file_exists("config.json")) {
    // Use the config file to get the domain details
    $json = file_get_contents('../config.json');
} else {
    // Use the config file to get the domain details
    $json = file_get_contents('./config.json');
}

//convert the json to a readable format by php
$decoded = json_decode($json);

//get the data from the JSON file concerning the details of the server and database
$domain = $decoded->domain;
$username = $decoded->username;
$password = $decoded->password;
$database = $decoded->database;

//connect to the database using the created variables
$conn = new mysqli($domain, $username,$password, $database);

//check if the connection has been made
if($conn->connect_error){
    die("<center style='border: black 2px solid;border-radius: 25px; margin: 10px; padding: 20px;'><h1 style='color: red'>Unable to connect!</h1> The following error occurred: <br>$conn->connect_error<br>
    Try the following: <br>
    <ol>
    <li>Connect your mysql server. Turn it on if it is off</li>
    <li>Check your configuration file for any misconfiguration</li>
    <li>Try Refreshing this page</li>
</ol>
</center>");
}
