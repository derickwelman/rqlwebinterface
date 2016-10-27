<!DOCTYPE html>
<html>
<head>
	<title>RQL 2 SQL</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="sources/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="sources/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="sources/jquery.tabletojson.min.js"></script>
	<script type="text/javascript" src="sources/deep-json-compare.js"></script>
	<script type="text/javascript" src="sources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="page-wrap">
		<?php
		require_once("header.php");
		require_once("require_login.php");
		
		include('connection.php');
		$con = getRootConnection();

		$idLogin = $_SESSION['idLogin'];

		$insertValues = "";
		for($i = 1; $i < 10; $i++){
			$question = $_POST['question'.$i];
			$insertValues .= "($idLogin, $i, $question), ";
		}

		$insertValues = substr($insertValues, 0, strlen($insertValues) - 2);
		
		$con->query("DELETE FROM ComparationQuestion WHERE idLogin = $idLogin");
		$query = $con->query("INSERT INTO ComparationQuestion (idLogin, questionNumber, answer) VALUES $insertValues;")
		
		?>

		<div id="page" class="content-page">
			<h1 style="text-align:center;font-size:40px;padding:100px 0;">
			<?php if($query){ ?>
				Obrigado por nos enviar sua opnião!
			<?php }else{ ?>
				Erro ao registrar informações!<br>Por favor tente novamente mais tarde.
			<?php } ?>
			</h1>
		</div>
		<span class="clear" style="height:80px"></span>
		<footer>
			Relational Query Language Translator - 2016<br> Desenvolvido por Dérick Welman e Lucas Venezian
		</footer>
	</div>
</body>
</html>