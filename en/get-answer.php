<?php
$idLogin = $_POST['idLogin'];
$idQuestion = $_POST['idQuestion'];
$language = $_POST['language'];
$con = new PDO("mysql:host=localhost;dbname=questionnaire", "root", ""); 
$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
$con->exec("SET CHARACTER SET utf8");

$query = $con->query("SELECT $language FROM Answer WHERE idQuestion = $idQuestion AND idLogin = $idLogin;");
if($query->rowCount()==0){
	echo "";
}else{
	$result = $query->fetchAll();
	echo $result[0][0];
}

/*$query = $con->query("SELECT * FROM Answer WHERE idLogin = $idLogin AND idQuestion = $idQuestion");
if($query->rowCount() == 0){	
	$query = $con->prepare("INSERT INTO Answer (idQuestion, idLogin, $language) VALUES (:question, :login, :answer);");
}else{
	$query = $con->prepare("UPDATE Answer SET $language = :answer WHERE idQuestion = :question AND idLogin = :login;");
}

$query->bindParam(":question", $idQuestion);
$query->bindParam(":login", $idLogin);
$query->bindParam(":answer", $source);
$query->execute();*/
?>