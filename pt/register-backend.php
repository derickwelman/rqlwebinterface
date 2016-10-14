<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
</head>
<body>
	<?php
	$dbhost = "localhost";
	$db = "Bees";
	$dbuser = "postgres";
	$dbpass = "postgres";
	$dbport = 5432;

	$con = new PDO("pgsql: host=$dbhost; port=$dbport; dbname=$db; user=$dbuser; password=$dbpass;");

	if(!isset($_POST['login'])){
		echo '<script>alert("Erro ao registrar novo usuário!");window.location="register.php"</script>';
		exit();
	}
	
	$name = $_POST['name'];
	$institution = $_POST['institution'];
	$country = $_POST['country'];
	$login = $_POST['login'];
	$pass = $_POST['pass'];
	$experience = $_POST['experience'];

	$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

	$query = $con->query("SELECT * FROM Login WHERE login = '$login'");
	if($query->rowCount()>0){
		echo '<script>alert("Nome de usuário em uso!");window.location="register.php"</script>';
		exit();
	}

	$query = $con->query("INSERT INTO Login (name, institution, login, pass, country, experience) VALUES ('$name', '$institution', '$login', '$pass', '$country', $experience);");

	echo '<script>alert("Registrado com sucesso!");window.location="index.php"</script>';

	?>
</body>
</html>