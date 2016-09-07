<div id="header">
	<a href="index.php"><img id="logo" src="images/logo.svg" alt="RQL"></a>
	<span> To SQL Translator</span>
	<ul>
		<?php
		session_start();
		if(isset($_SESSION['idLogin'])){
			echo '<li>Welcome ' . $_SESSION['name'] . '</li>';
			echo '<a href="index.php"><li>TRANSLATOR</li></a>';
			echo '<a href="quiz.php"><li>QUIZ</li></a>';
			echo '<a href="logout-backend.php"><li>LOGOUT</li></a>';
		}else{
			echo '<a href="index.php"><li>TRANSLATOR</li></a>';
			echo '<a href="login.php"><li>LOGIN</li></a>';
			echo '<a href="register.php"><li>SIGN-UP</li></a>';
		}
		?>
	</ul>
</div>