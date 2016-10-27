<?php
function getRootConnection(){
	$dbhost = "localhost";
	$db = "Bees";
	$dbuser = "postgres";
	$dbpass = "postgres";
	$dbport = 5432;

	$con = new PDO("pgsql: host=$dbhost; port=$dbport; dbname=$db; user=$dbuser; password=$dbpass;");
	return $con;
}

function getGuestConnection(){
	$dbhost = "localhost";
	$db = "Bees";
	$dbuser = "guest";
	$dbpass = "guest";
	$dbport = 5432;

	$con = new PDO("pgsql: host=$dbhost; port=$dbport; dbname=$db; user=$dbuser; password=$dbpass;");
	return $con;
}
?>