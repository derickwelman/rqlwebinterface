<!DOCTYPE html>
<html>
<head>
	<title>RQL 2 SQL</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="sources/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="sources/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="sources/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="page-wrap">
		<?php
		require_once("header.php");
		require_once("require_logout.php");
		?>

		<span class="clear"></span>
		
		<div id="page">
		<form id="register" class="center" action="login-backend.php" onSubmit="return validate();" method="POST">
			<center>
				<h2>Entre para salvar seus resultados</h2><br>
				<label for="login">E-mail: </label>
				<input type="text" name="login" placeholder="E-mail" class="input-field" required/><hr>

				<label for="pass">Senha: </label>
				<input type="password" name="pass" placeholder="Senha" class="input-field" required/><hr>

				<input type="submit" value="Login" class="btn-big full">
				<span class="clear"></span>
			</center>
		</form>
	</div>
	<span class="clear" style="height:80px"></span>
	<footer>
		Relational Query Language Translator - 2016<br> Developed by Dérick Welman and Lucas Venezian
	</footer>
	</div>
</div>
</body>
</html>

<script>
	function validate(){
		
	}
</script>
