<div id="header">
	<a href="index.php"><img id="logo" src="images/logo.svg" alt="RQL"></a>
	<span> To SQL Translator</span>
	<ul>
		<?php
		session_start();
		if(isset($_SESSION['idLogin'])){
			echo '<li>Bem vindo(a) ' . $_SESSION['name'] . '</li>';
			echo '<a href="tutorial.php"><li>TUTORIAL</li></a>';
			echo '<a href="index.php"><li>TRADUTOR</li></a>';
			echo '<a href="quiz.php"><li>QUIZ</li></a>';
			echo '<a href="logout-backend.php"><li>SAIR</li></a>';
		}else{
			echo '<a href="tutorial.php"><li>TUTORIAL</li></a>';
			echo '<a href="index.php"><li>TRADUTOR</li></a>';
			echo '<a href="login.php"><li>ENTRAR</li></a>';
			echo '<a href="register.php"><li>REGISTRAR</li></a>';
		}
		?>
	</ul>
</div>