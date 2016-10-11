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
		echo '<input type="hidden" name="idLogin" value="'.$_SESSION['idLogin'].'">';
		?>
		<div id="page" class="content-page">
			<h1 style="text-align:center;line-height:350px;font-size:40px;">Obrigado por nos enviar sua opnião!</h1>
		</div>
		<span class="clear" style="height:80px"></span>
		<footer>
			Relational Query Language Translator - 2016<br> Desenvolvido por Dérick Welman e Lucas Venezian
		</footer>
	</div>
</body>
</html>