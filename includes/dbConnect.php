<?php
//dbconnect allows me to connect to the database. I have to replace the $database by my bdd. the file must be include before my requests

$servername = "localhost";
//the name of your database
$database = "memoirecmw";
$username = "root";
$password = "root";
$options = [
    PDO::MYSQL_ATTR_LOCAL_INFILE => true,
];
//
$sql = "mysql:host=$servername;dbname=$database;";

try {
	//creation af the object pdo we use to make our query1
	$pdo = new PDO($sql, $username, $password,$options);
	//echo "Connected successfully";
} catch (PDOException $error) {
	echo 'Connection error: ' . $error->getMessage();
}

