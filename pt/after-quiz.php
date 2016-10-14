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
		$idLogin = $_SESSION['idLogin'];

		$dbhost = "localhost";
		$db = "Bees";
		$dbuser = "postgres";
		$dbpass = "postgres";
		$dbport = 5432;

		$con = new PDO("pgsql: host=$dbhost; port=$dbport; dbname=$db; user=$dbuser; password=$dbpass;");

		$query = $con->query("SELECT * FROM Answer WHERE idLogin = $idLogin");
		if($query->rowCount() < 12){
			echo '<script>alert("É preciso completar o quiz antes de prencher o formulário!");window.location="quiz.php";</script>';
		}

		$query = $con->query("SELECT * FROM ComparationQuestion WHERE idLogin = $idLogin");
		if($query->rowCount()>0){
			while($row = $query->fetch(PDO::FETCH_OBJ)){
				$question[$row->questionnumber] = $row->answer;
			}
		}else{
			for($i = 1; $i < 7; $i++){
				$question[$i] = 1;
			}
		}

		?>
		<div id="page" class="content-page">
			<form action="submit-form.php" method="POST" id="after-quiz">
				<h1>Formulário de impressões</h1>
				<span class="clear" style="height:20px;"></span>

				<div class="after-quiz-question" id="question1">
					<label for="question1">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question1" id="question1-1" class="rate rate-1" value="1" <?php if($question[1]==1) echo "checked" ?>>
						<input type="radio" name="question1" id="question1-2" class="rate rate-2" value="2" <?php if($question[1]==2) echo "checked" ?>>
						<input type="radio" name="question1" id="question1-3" class="rate rate-3" value="3" <?php if($question[1]==3) echo "checked" ?>>
						<input type="radio" name="question1" id="question1-4" class="rate rate-4" value="4" <?php if($question[1]==4) echo "checked" ?>>
						<input type="radio" name="question1" id="question1-5" class="rate rate-5" value="5" <?php if($question[1]==5) echo "checked" ?>>
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question2">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question2" id="question1-1" class="rate rate-1" value="1" <?php if($question[2]==1) echo "checked" ?>>
						<input type="radio" name="question2" id="question1-2" class="rate rate-2" value="2" <?php if($question[2]==2) echo "checked" ?>>
						<input type="radio" name="question2" id="question1-3" class="rate rate-3" value="3" <?php if($question[2]==3) echo "checked" ?>>
						<input type="radio" name="question2" id="question1-4" class="rate rate-4" value="4" <?php if($question[2]==4) echo "checked" ?>>
						<input type="radio" name="question2" id="question1-5" class="rate rate-5" value="5" <?php if($question[2]==5) echo "checked" ?>>
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question3">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question3" id="question1-1" class="rate rate-1" value="1" <?php if($question[3]==1) echo "checked" ?>>
						<input type="radio" name="question3" id="question1-2" class="rate rate-2" value="2" <?php if($question[3]==2) echo "checked" ?>>
						<input type="radio" name="question3" id="question1-3" class="rate rate-3" value="3" <?php if($question[3]==3) echo "checked" ?>>
						<input type="radio" name="question3" id="question1-4" class="rate rate-4" value="4" <?php if($question[3]==4) echo "checked" ?>>
						<input type="radio" name="question3" id="question1-5" class="rate rate-5" value="5" <?php if($question[3]==5) echo "checked" ?>>
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question4">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question4" id="question1-1" class="rate rate-1" value="1" <?php if($question[4]==1) echo "checked" ?>>
						<input type="radio" name="question4" id="question1-2" class="rate rate-2" value="2" <?php if($question[4]==2) echo "checked" ?>>
						<input type="radio" name="question4" id="question1-3" class="rate rate-3" value="3" <?php if($question[4]==3) echo "checked" ?>>
						<input type="radio" name="question4" id="question1-4" class="rate rate-4" value="4" <?php if($question[4]==4) echo "checked" ?>>
						<input type="radio" name="question4" id="question1-5" class="rate rate-5" value="5" <?php if($question[4]==5) echo "checked" ?>>
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question5">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question5" id="question1-1" class="rate rate-1" value="1" <?php if($question[5]==1) echo "checked" ?>>
						<input type="radio" name="question5" id="question1-2" class="rate rate-2" value="2" <?php if($question[5]==2) echo "checked" ?>>
						<input type="radio" name="question5" id="question1-3" class="rate rate-3" value="3" <?php if($question[5]==3) echo "checked" ?>>
						<input type="radio" name="question5" id="question1-4" class="rate rate-4" value="4" <?php if($question[5]==4) echo "checked" ?>>
						<input type="radio" name="question5" id="question1-5" class="rate rate-5" value="5" <?php if($question[5]==5) echo "checked" ?>>
					</div>
				</div>

				<div class="after-quiz-question" id="question1">
					<label for="question6">Nível de satisfação com o questionário realizado:</label>
					<div class="radio-group">
						<input type="radio" name="question6" id="question1-1" class="rate rate-1" value="1" <?php if($question[6]==1) echo "checked" ?>>
						<input type="radio" name="question6" id="question1-2" class="rate rate-2" value="2" <?php if($question[6]==2) echo "checked" ?>>
						<input type="radio" name="question6" id="question1-3" class="rate rate-3" value="3" <?php if($question[6]==3) echo "checked" ?>>
						<input type="radio" name="question6" id="question1-4" class="rate rate-4" value="4" <?php if($question[6]==4) echo "checked" ?>>
						<input type="radio" name="question6" id="question1-5" class="rate rate-5" value="5" <?php if($question[6]==5) echo "checked" ?>>
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