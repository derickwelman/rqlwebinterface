<?php
	if(!isset($_SESSION['idLogin'])){
		echo '<script>window.location="login.php"</script>';
	}
?>