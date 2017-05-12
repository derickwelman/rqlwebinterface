<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta charset="utf-8">
</head>
<body>
	<?php
	include('connection.php');
	$con = getRootConnection();

	if(!isset($_POST['name'])){
		echo '<script>alert("Erro ao registrar novo usuário!");window.location="register.php";</script>';
		exit();
	}
	
	$name = $_POST['name'];
	$birth = $_POST['birth'];
	$institution = $_POST['institution'];
	$formation = $_POST['formation'];
	if(isset($_POST['formation-area'])) $formationArea = $_POST['formation-area']; else $formationArea = '';
	if(isset($_POST['other-area']) AND $_POST['other-area'] != '') $formationArea = $_POST['other-area'];
	$situation = $_POST['situation'];
	$country = $_POST['country'];
	$email = $_POST['email'];
	$pass = $_POST['pass'];
	$confirmation = $_POST['confirmation'];
	$experience = $_POST['experience'];

	$cripEmail = hash('sha256', $email);
	$cripPass = hash('sha256', $pass);

	echo 'name ' . $name . '<br>';
	echo 'birth ' . $birth . '<br>';
	echo 'institution ' . $institution . '<br>';
	echo 'formation ' . $formation . '<br>';
	echo 'formationArea ' . $formationArea . '<br>';
	echo 'situation ' . $situation . '<br>';
	echo 'country ' . $country . '<br>';
	echo 'email ' . $email . ' ' . hash('sha256', $email) . '<br>';
	echo 'pass ' . $pass . ' ' . hash('sha256', $pass) . '<br>';
	echo 'confirmation ' . $confirmation . '<br>';
	echo 'experience ' . $experience . '<br>';

	$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );

	$query = $con->query("SELECT * FROM Login WHERE email = '$cripEmail'");
	if($query->rowCount()>0){
		echo '<script>alert("Email já cadastrado!");window.location="register.php";</script>';
		exit();
	}

	$query = $con->query("INSERT INTO Login (name, birth, institution, formation, area, situation, country, email, pass, experience) VALUES ('$name', '$birth', '$institution', '$formation', '$formationArea', '$situation', '$country', '$cripEmail', '$cripPass', $experience);");

	echo '<script>alert("Registrado com sucesso!");window.location="index.php";</script>';

	?>
</body>
</html>