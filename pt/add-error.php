<?php
$dbhost = "localhost";
$db = "Bees";
$dbuser = "postgres";
$dbpass = "postgres";
$dbport = 5432;

$con = new PDO("pgsql: host=$dbhost; port=$dbport; dbname=$db; user=$dbuser; password=$dbpass;");

$idLogin = $_POST['idLogin'];
$idQuestion = $_POST['idQuestion'];
$languageError = $_POST['language'] . "Errors";

$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

$query = $con->prepare("UPDATE Answer SET
		$languageError = $languageError + 1
		WHERE idQuestion = :question AND idLogin = :login;");

$query->bindParam(":question", $idQuestion);
$query->bindParam(":login", $idLogin);
$query->execute();
?>