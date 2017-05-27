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
				<label for="name" >Nome completo: </label>
				<input type="text" name="name" placeholder="Nome" class="input-field" requiredy/><hr>

				<label for="birth" >Data de nascimento: </label>
				<input type="text" name="birth" placeholder="Nascimento (dd/mm/aaaa)" class="input-field" requiredy/><hr>

				<label for="institution" >Instituição: </label>
				<input type="text" name="institution" placeholder="Instituição" class="input-field" requiredy/><hr>

				<label for="formation">Formação: </label>
				<select name="formation" id="formation" class="input-field">
					<option value="" selected>Selecione</option>
					<option value="1">Ensino Médio</option>
					<option value="2">Ensino Técnico de Nível Médio</option>
					<option value="3">Ensino Superior</option>
					<option value="4">Especialização Lato Sensu</option>
					<option value="5">Mestrado</option>
					<option value="6">Doutorado</option>
				</select><hr>

				<span id="formation-area-location"></span>

				<label for="situation">Situação da formação:</label>
				<select name="situation" class="input-field" requiredy>
					<option value="" selected>Selecione</option>
					<option value="1">Em andamento</option>
					<option value="2">Concluída</option>
				</select><hr>

				<label for="country" >País: </label>
				<input type="text" name="country" placeholder="País" class="input-field" requiredy/><hr>

				<label for="email" >E-mail: </label>
				<input type="email" name="email" placeholder="E-mail" class="input-field" requiredy/><hr>

				<label for="pass" >Senha: </label>
				<input type="password" name="pass" placeholder="Senha" class="input-field" requiredy/><hr>

				<label for="confirmation" >Confirme sua senha: </label>
				<input type="password" name="confirmation" placeholder="Confirmação" class="input-field" requiredy/><hr>

				<label for="experience">Tempo de experiência<br>com a SQL: </label>
				<select name="experience" class="input-field" requiredy>
					<option value="" selected>Selecione</option>
					<option value="1">Menos de dois anos</option>
					<option value="2">Mais que dois e menos que quatro anos</option>
					<option value="3">Mais que quatro e menos que cinco anos</option>
					<option value="4">Mais que cinco anos</option>
				</select>

				<span class="clear" style="height:20px"></span>
				<input type="submit" value="Registrar" class="btn-big full">
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

		//Clear input errors
		$('input').removeClass('input-error');
		$('select').removeClass('input-error');

		//Name check
		var name = $('input[name=name]');
		if(name.val()==''){
			alert('Favor informar um nome');
			name.focus().addClass('input-error');
			return false;
		}

		//Birth check
		var birth = $('input[name=birth]');
		console.log(birth.val());
		if(birth.val()==''||!checkDate(birth.val())){
			alert('Favor informar uma data de nascimento válida');
			birth.focus().addClass('input-error');
			return false;
		}

		//Institution check
		var institution = $('input[name=institution]');
		if(institution.val()==''){
			alert('Favor informar uma instituição de ensino');
			institution.focus().addClass('input-error');
			return false;
		}

		//Formation check
		var formation = $('select[name=formation]');
		console.log(formation.text());
		if(formation.val()==''||formation.val()==undefined){
			alert('Favor informar um grau de formação');
			formation.focus().addClass('input-error');
			return false;
		}

		//Formation Area check
		if(hasArea && ( $('select[name=formation-area]').val()=='' || $('select[name=formation-area]').val()==null) ){
			$('select[name=formation-area]').focus().addClass('input-error');
			alert('Favor informar a área da formação');
			return false;
		}
		if(hasOtherArea && ( $('input[name=other-area]').val()=='' || $('input[name=other-area]').val()==null) ){
			$('input[name=other-area]').focus().addClass('input-error');
			alert('Favor especificar a área da formação');
			return false;
		}

		//Situation check
		var situation = $('select[name=situation]');
		if(situation.val()==''||situation.val()==undefined){
			alert('Favor informar a situação de sua formação');
			situation.focus().addClass('input-error');
			return false;
		}

		//Country check
		var country = $('input[name=country]');
		if(country.val()==''){
			alert('Favor informar um país de origem');
			country.focus().addClass('input-error');
			return false;
		}

		//Email check
		var email = $('input[name=email]');
		if(!checkEmail(email.val())){
			alert('Favor informar um email correto');
			email.focus().addClass('input-error');
			return false;
		}

		//Password check
		var pass = $('input[name=pass]');
		var confirmation = $('input[name=confirmation]');
		if(pass.val().length<4){
			alert('A senha deve ter pelo menos 4 caracteres');
			pass.focus().addClass('input-error');
			return false;
		}
		if(pass.val()!=confirmation.val()){
			alert('As senhas devem ser iguais');
			confirmation.focus().addClass('input-error');
			return false;
		}

		//Experience check
		var experience = $('select[name=experience]');
		if(experience.val()==''||experience.val()==undefined){
			alert('Favor informar seu tempo de experiência');
			experience.focus().addClass('input-error');
			return false;
		}

		return true;
	}

	function checkEmail(email){
		if(email=='')return false;
		var regExpEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		return regExpEmail.test(email);
	}

	// Original JavaScript code by Chirp Internet: www.chirp.com.au
	// Please acknowledge use of this code by including this header.
	function checkDate(date){
		var allowBlank = true;
		var minYear = 1902;
		var maxYear = (new Date()).getFullYear();
		var errorMsg = "";
		// regular expression to match required date format
		re = /^(\d{1,2})\/(\d{1,2})\/(\d{4})$/;

		if(date != '') {
		  if(regs = date.match(re)) {
		    if(regs[1] < 1 || regs[1] > 31) {
		      errorMsg = "Invalid value for day: " + regs[1];
		    } else if(regs[2] < 1 || regs[2] > 12) {
		      errorMsg = "Invalid value for month: " + regs[2];
		    } else if(regs[3] < minYear || regs[3] > maxYear) {
		      errorMsg = "Invalid value for year: " + regs[3] + " - must be between " + minYear + " and " + maxYear;
		    }
		  } else {
		    errorMsg = "Invalid date format: " + date;
		  }
		} else if(!allowBlank) {
		  errorMsg = "Empty date not allowed!";
		}

		if(errorMsg != "") {
		  //console.log(errorMsg);
		  return false;
		}
		return true;
	}

	//Formation Area
	var formation = $('select[name=formation]');
	var formationAreaLocation = $('#formation-area-location');
	var formationAreaLabel = $('<label>').attr('for', 'formation-area').html('Área de formação:&nbsp');
	var formationAreaSelect = $('<select>').attr('name', 'formation-area').addClass('input-field');	
	
	var hasArea = false;
	var hasOtherArea = false;

	formation.change(formationAreaEvent);

	function formationAreaEvent(){
		formationAreaLocation.html('');
		formationAreaSelect.html('');
		$('#other-span').remove();

		if(formation.val()<2){
			hasArea = false;
			hasOtherArea = false;
		}else{

			var otherLabel = $('<label>').attr('for', 'other-area').html('Nome da área:&nbsp');
			var otherInput = $('<input>').attr('type', 'text').attr('name', 'other-area').attr('placeholder','Área da formação').addClass('input-field');
			var otherSpan = $('<span>').attr('id','other-span');
			otherSpan.append(otherLabel).append(otherInput).append('<hr>').hide();
			formationAreaLocation.after(otherSpan);

			if(formation.val()==2){
				formationAreaLocation.append(formationAreaLabel).append(formationAreaSelect).append('<hr>');
				formationAreaSelect.append($('<option>').attr('value', '').html('Selecione'));
				formationAreaSelect.append($('<option>').attr('value', 'Informática').html('Informática'));
				formationAreaSelect.append($('<option>').attr('value', 'Administração').html('Administração'));
				formationAreaSelect.append($('<option>').attr('value', 'Contabilidade').html('Contabilidade'));
				formationAreaSelect.append($('<option>').attr('value', 'Outro').html('Outro'));

				hasArea = true;
				hasOtherArea = false;
			}else if(formation.val()==4){
				otherSpan.show();

				hasArea = false;
				hasOtherArea = true;
			}else{
				formationAreaLocation.append(formationAreaLabel).append(formationAreaSelect).append('<hr>');
				formationAreaSelect.append($('<option>').attr('value', '').html('Selecione'));
				formationAreaSelect.append($('<option>').attr('value', 'Engenharia da Computação').html('Engenharia da Computação'));
				formationAreaSelect.append($('<option>').attr('value', 'Engenharia Mecânica').html('Engenharia Mecânica'));
				formationAreaSelect.append($('<option>').attr('value', 'Engenharia Civil').html('Engenharia Civil'));
				formationAreaSelect.append($('<option>').attr('value', 'Engenharia Eletrônica').html('Engenharia Eletrônica'));
				formationAreaSelect.append($('<option>').attr('value', 'Engenharia Elétrica').html('Engenharia Elétrica'));
				formationAreaSelect.append($('<option>').attr('value', 'Sistema de Informação').html('Sistema de Informação'));
				formationAreaSelect.append($('<option>').attr('value', 'Ciência da Computação').html('Ciência da Computação'));
				formationAreaSelect.append($('<option>').attr('value', 'Economia').html('Economia'));
				formationAreaSelect.append($('<option>').attr('value', 'Administração').html('Administração'));
				formationAreaSelect.append($('<option>').attr('value', 'Análise e Desenvolvimento de Sistemas').html('Análise e Desenvolvimento de Sistemas'));
				formationAreaSelect.append($('<option>').attr('value', 'Outro').html('Outro'));

				hasArea = true;
				hasOtherArea = false;
			}

			formationAreaSelect.change(function(){
				if(formationAreaSelect.val()=='Outro'){
					otherSpan.show();
					hasOtherArea = true;
				}else{
					otherSpan.hide();
					hasOtherArea = false;
				}
			});
		}
	};
</script>
