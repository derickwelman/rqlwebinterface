<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php
	include('connection.php');
	$con = getRootConnection();

	if(!isset($_POST['login'])){
		echo '<script>alert("Error when logging in!");window.location="login.php"</script>';
		exit();
	}

	$login = $_POST['login'];
	$pass = $_POST['pass'];

	$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

	$query = $con->query("SELECT * FROM Login WHERE login = '$login' AND pass = '$pass'");
	if($query->rowCount()!=1){
		echo '<script>alert("Credenciais incorretas!");window.location="login.php"</script>';
		exit();
	}

	session_start();
	while($row = $query->fetch(PDO::FETCH_OBJ)){
		$idLogin = $row->idlogin;
		$name = $row->name;
	}

	$_SESSION['idLogin'] = $idLogin;
	$_SESSION['login'] = $login;
	$_SESSION['name'] = $name;

	echo '<script>window.location="index.php"</script>';

	?>
</body>
</html>