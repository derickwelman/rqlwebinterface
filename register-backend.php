<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php
	if(!isset($_POST['login'])){
		echo '<script>alert("Error when registering new user!");window.location="register.html"</script>';
		exit();
	}
	
	$name = $_POST['name'];
	$institution = $_POST['institution'];
	$country = $_POST['country'];
	$login = $_POST['login'];
	$pass = $_POST['pass'];
	$experience = $_POST['experience'];

	$con = new PDO("mysql:host=localhost;dbname=questionnaire", "root", ""); 
	$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$con->exec("SET CHARACTER SET utf8");

	$query = $con->query("SELECT * FROM Login WHERE login = '$login'");
	if($query->rowCount()>0){
		echo '<script>alert("User name already in use!");window.location="register.html"</script>';
		exit();
	}

	$query = $con->query("INSERT INTO Login (name, institution, login, pass, country, experience) VALUES ('$name', '$institution', '$login', '$pass', '$country', $experience);");

	echo '<script>alert("Sucefully registered")window.location="index.html"</script>';

	?>
</body>
</html>