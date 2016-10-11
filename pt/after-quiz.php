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
			<form action="submit-form.php" method="POST" id="after-quiz">
				<h1>Formulário de impressões</h1>
				<span class="clear" style="height:20px;"></span>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1">
						<input type="radio" name="question1" id="question1-2" class="rate rate-2">
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" checked>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4">
						<input type="radio" name="question1" id="question1-5" class="rate rate-5">
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1">
						<input type="radio" name="question1" id="question1-2" class="rate rate-2">
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" checked>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4">
						<input type="radio" name="question1" id="question1-5" class="rate rate-5">
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1">
						<input type="radio" name="question1" id="question1-2" class="rate rate-2">
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" checked>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4">
						<input type="radio" name="question1" id="question1-5" class="rate rate-5">
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1">
						<input type="radio" name="question1" id="question1-2" class="rate rate-2">
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" checked>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4">
						<input type="radio" name="question1" id="question1-5" class="rate rate-5">
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1">
						<input type="radio" name="question1" id="question1-2" class="rate rate-2">
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" checked>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4">
						<input type="radio" name="question1" id="question1-5" class="rate rate-5">
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1">
						<input type="radio" name="question1" id="question1-2" class="rate rate-2">
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" checked>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4">
						<input type="radio" name="question1" id="question1-5" class="rate rate-5">
					</div>
				</div>

				<input type="submit" name="enviar" value="Enviar">
			</form>
		</div>
		<span class="clear" style="height:80px"></span>
		<footer>
			Relational Query Language Translator - 2016<br> Desenvolvido por Dérick Welman e Lucas Venezian
		</footer>
	</div>
</body>
</html>