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
	<script>
		function addSymbol(symbol, modifier){
			var source = $('#source');
			var pos = source.getCursorPosition();
			var content = source.val();
			source.val(content.substring(0, pos) + symbol + content.substring(pos, content.length));
			source.focus();
			source[0].setSelectionRange(pos + modifier, pos + modifier);
		}

		$.fn.extend({
			getCursorPosition: function() {
				var el = $(this).get(0);
				var pos = 0;
				if('selectionStart' in el){
					pos = el.selectionStart;
				}else if('selection' in document){
					el.focus();
					var Sel = document.selection.createRange();
					var SelLength = document.selection.createRange().text.length;
					Sel.moveStart('character', -el.value.length);
					pos = Sel.text.length - SelLength
				}
				return pos;
			}
		});
	</script>

</head>
<body>
	<div class="page-wrap">
		<?php
		require_once("header.php");
		require_once("require_logout.php");
		?>

		<span class="clear"></span>

		<div id="page">
		<form id="register" class="center" action="register-backend.php" onSubmit="return validate();" method="POST">
			<center>
				<h2>Cadastre-se para salvar seus resultados</h2><br>
				<label for="name" >Nome: </label>
				<input type="text" name="name" placeholder="Bome" class="input-field" required/><hr>

				<label for="institution" >Instituição: </label>
				<input type="text" name="institution" placeholder="Instituição" class="input-field" required/><hr>

				<label for="country" >País: </label>
				<input type="text" name="country" placeholder="País" class="input-field" required/><hr>

				<label for="login" >Nome de usuário: </label>
				<input type="text" name="login" placeholder="Nome de usuário" class="input-field" required/><hr>

				<label for="pass" >Senha: </label>
				<input type="password" name="pass" placeholder="Senha" class="input-field" required/><hr>

				<label for="confirmation" >Confirme sua senha: </label>
				<input type="password" name="confirmation" placeholder="Confirmação" class="input-field" required/><hr>

				<label for="experience" >Meses aproximados de experiência com a SQL: </label><hr>
				<input type="number" name="experience" placeholder="Experiência" value="0" class="input-field" required/>
				<input type="submit" value="Enviar" class="btn-big full">
				<span class="clear"></span>
			</center>
		</form>
	</div>
	<span class="clear" style="height:80px"></span>
	<footer>
		Relational Query Language Translator - 2016<br> Desenvolvido por Dérick Welman e Lucas Venezian
	</footer>
	</div>
</div>
</body>
</html>

<script>
	function validate(){

	}
</script>
