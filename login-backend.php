<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php
	if(!isset($_POST['login'])){
		echo '<script>alert("Error when logging in!");window.location="login.php"</script>';
		exit();
	}

	$login = $_POST['login'];
	$pass = $_POST['pass'];

	$con = new PDO("mysql:host=localhost;dbname=questionnaire", "root", ""); 
	$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$con->exec("SET CHARACTER SET utf8");

	$query = $con->query("SELECT * FROM Login WHERE login = '$login' AND pass = '$pass'");
	if($query->rowCount()!=1){
		echo '<script>alert("Incorrect credentials!");window.location="login.php"</script>';
		exit();
	}

	session_start();
	while($row = $query->fetch(PDO::FETCH_OBJ)){
		$idLogin = $row->idLogin;
		$name = $row->name;
	}

	$_SESSION['idLogin'] = $idLogin;
	$_SESSION['login'] = $login;
	$_SESSION['name'] = $name;

	echo '<script>window.location="index.php"</script>';

	?>
</body>
</html>