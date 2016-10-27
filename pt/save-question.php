<?php
include('connection.php');
$con = getRootConnection();

$source = $_POST['source'];
$idLogin = $_POST['idLogin'];
$idQuestion = $_POST['idQuestion'];
$language = $_POST['language'] . "Answer";
$timeLanguage = $_POST['language'] . "Time";
$timespent = $_POST['timespent'];

if($_POST['language']=="rql"){
	$rqlTime = $timespent;
	$sqlTime = 0;
}else{
	$sqlTime = $timespent;
	$rqlTime = 0;
}

$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

$query = $con->query("SELECT * FROM Answer WHERE idLogin = $idLogin AND idQuestion = $idQuestion");
if($query->rowCount() == 0){	
	$query = $con->prepare("INSERT INTO Answer (idQuestion, idLogin, $language, rqlTime, sqlTime, rqlErrors, sqlErrors) VALUES (:question, :login, :answer, :rqlTime, :sqlTime, 0, 0);");
}else{
	$query = $con->prepare("UPDATE Answer SET
		$language = :answer,
		rqlTime = rqlTime + :rqlTime,
		sqlTime = sqlTime + :sqlTime
		WHERE idQuestion = :question AND idLogin = :login;");
}

$query->bindParam(":question", $idQuestion);
$query->bindParam(":login", $idLogin);
$query->bindParam(":answer", $source);
$query->bindParam(":rqlTime", $rqlTime);
$query->bindParam(":sqlTime", $sqlTime);
$query->execute();
?>