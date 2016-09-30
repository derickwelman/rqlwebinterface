<?php
$idLogin = $_POST['idLogin'];
$idQuestion = $_POST['idQuestion'];
$languageError = $_POST['language'] . "Errors";

$con = new PDO("mysql:host=localhost;dbname=questionnaire", "root", ""); 
$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
$con->exec("SET CHARACTER SET utf8");

$query = $con->prepare("UPDATE Answer SET
		$languageError = $languageError + 1
		WHERE idQuestion = :question AND idLogin = :login;");

$query->bindParam(":question", $idQuestion);
$query->bindParam(":login", $idLogin);
$query->execute();
?>