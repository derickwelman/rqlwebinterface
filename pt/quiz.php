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
	<div id="db-modal">
		<img src="images/BeeHiveDB.svg">
	</div>

	<div id="show-db">
		<img src="images/show.svg">
	</div>

	<div class="page-wrap">
		<?php
		require_once("header.php");
		require_once("require_login.php");

		include('connection.php');
		$con = getRootConnection();

		$idLogin = $_SESSION['idLogin'];

		$query = $con->query("SELECT * FROM Answer WHERE idLogin = $idLogin");
		if($query->rowCount()>0){
			echo '<script>alert("Limite de tentativas excedido!");window.location="index.php";</script>';
		}

		echo '<input type="hidden" name="idLogin" value="'.$_SESSION['idLogin'].'">';
		?>
		<div id="page">
			<form class="form" onSubmit="return false;">
				<div id="question" page="0"></div>
				<span class="clear"></span>
				<div id="current-language">RQL</div>
				<div class="symbol-menu" id="button-menu">
					<button class="rql-btn" data-toggle="tooltip" data-placement="top" title="Selection:<br>£ idRelation = 1 (Relation);" onClick="addSymbol('£', 1)"><span symbol="£">£</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Projection:<br>¢ idRelation (Relation);" onClick="addSymbol('¢', 1)"><span symbol="¢">¢</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Rename:<br>§ oldName newName (Relation);" onClick="addSymbol('§', 1)"><span symbol="§">§</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Union:<br>Relation v Relation;" onClick="addSymbol('v', 1)"><span symbol="v">v</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Intersection:<br>Relation ^ Relation;" onClick="addSymbol('^', 2)"><span symbol="^">^</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Difference:<br>Relation - Relation;" onClick="addSymbol('-', 1)"><span symbol="-">-</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Join:<br>Relation [] Relation<br>Relation [idL = idR] Relation;" onClick="addSymbol('[]', 1)">	<span symbol="[]">[]</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Transitive Closure:<br>&lt;&lt; Relation &gt;&gt;;" onClick="addSymbol('<<>>', 2)"><span symbol="<<>>"><<>></span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Division:<br>Relation / Relation;" onClick="addSymbol('/', 1)"><span symbol="/">/</span></button>
					<button class="rql-btn" html="true" data-toggle="tooltip" data-placement="top" title="Cross Join:<br>Relation x Relation;" onClick="addSymbol('x', 1)"><span symbol="x">x</span></button>
				</div>

				<textarea id="source" class="code-input full" placeholder="Sua resposta aqui"></textarea>
				
				<!--<button id="prev" class="btn-big third">Questão anterior</button>-->
				<!--<button id="change-language" class="btn-big sixth">Trocar para SQL</button>-->
				<button id="submit" class="btn-big half">Testar</button>
				<button id="next" class="btn-big half">Iniciar</button>

				<span class="clear"></span>
				<div id="result" class="code-input full">
					<span class="placeholder">Aqui vão os resultados</span>
				</div>
				<span class="clear"></span>
			</form>
		</div>
		<span class="clear" style="height:80px"></span>
		<footer>
			Relational Query Language Translator - 2016<br> Desenvolvido por Dérick Welman e Lucas Venezian
		</footer>
	</div>
</body>
</html>

<script>

	//VARIABLE FOR TIME COUNT
	var initialTime = performance.now();

	//INITIALIZE TOOLTIPS, LOAD THE FIRST PAGE AND SET THE INPUT BACKGROUND
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip({html: true});
		load(0);
		$('#source').css('background', 'rgb(255, 220, 130)');
	});

	//CLEAR TAGS HTML FROM A STRING
	function strip_tags(input){
		//return input.replace("/<\/?[^>]+(>|$)/g", "").trim();
	}

	//GET QUERY RESULTS
	function getData(query){
		$.post(
			"connect.php",
			{source : query},
			function(data){
				$('#result').html(data);
				compareResults();
			}
			);
	}

	function getRqlResult(){
		var sqlQuery;
		$.post(
			"request-translate-quiz.php",
			{source : $('#source').val()},
			function(data){
				sqlQuery = data;
				console.log(sqlQuery);
				if(data.indexOf("SELECT DISTINCT") !== -1){
					getData(sqlQuery);
				}
				else{
					$('#result').html(sqlQuery);
					addError();
				}
			}
			);
	};

	function getSqlResult(){
		var sqlQuery = $('#source').val();
		getData(sqlQuery);
	}

	function getResult(){
		if($('#current-language').html()=="RQL"){
			getRqlResult();
		}else{
			getSqlResult();
		}
	}

	$('#submit').click(function(){		
		saveQuestion();
		getResult();
	});

	//SAVE ANSWER
	function saveQuestion(){
		var currentTime = performance.now();
		var idQuestion = $('#question').attr('page');
		var idLogin = $('input[name=idLogin]').val();
		var answer = $('#source').val();

		if($('#current-language').html() == "RQL"){
			var language = "rql";
		}else{
			var language = "sql";
		}
		$.post(
			'save-question.php',
			{
				source : answer,
				idQuestion: idQuestion,
				idLogin: idLogin,
				language: language,
				timespent: parseInt((currentTime - initialTime) / 1000)
			},
				function(data){
					console.log("Question " + idQuestion + " saved!");
				}
				).done(function(msg){
					//DISPLAY ERRORS ON REQUISITION
					//console.log(msg);
					initialTime = performance.now();
				}).fail(function(xhr, status, error){
					console.log(error);
				});
	}

	//GET ANSWER
	function getAnswer(){
		var idQuestion = $('#question').attr('page');
		var idLogin = $('input[name=idLogin]').val();
		var source = $('#source');

		if($('#current-language').html() == "RQL"){
			var language = "rqlAnswer";
		}else{
			var language = "sqlAnswer";
		}

		$.post(
			'get-answer.php',
			{idQuestion: idQuestion,
				idLogin: idLogin,
				language: language},
				function(data){
					console.log(data);
					document.getElementById('source').innerHTML = data;
					source.val(data);
					console.log("Question " + idQuestion + " returned!");
				}
				);
	}

	//CONTROL THE PAGES
	var minPage = 0;
	var maxPage = 11;

	//LOCK THE PREVIOUS AND LANGUAGE BUTTON AND MAKE THE QUESTIONNAIRE SEQUENSE
	$('#prev, #change-language').hide();
	var languageChanged = false;

	$('#next').click(function(){
		var page = $('#question').attr('page');
		if(page < 0){
			next();
			return;
		}

		if(page == 0){
			if(!confirm('Iniciar teste? Só será permitida uma tentativa!'))return;
			$('#next').html("Trocar linguagem");
			next();
			return;
		}

		if(!confirm('Gravar questão e avançar?\nNão será possível retornar.'))return;
		
		if(page == maxPage && languageChanged == true){
			window.location="after-quiz.php";
		}

		if(languageChanged == false){
			changeLanguage();
			languageChanged = true;
			$('#next').html("Próxima questão");
		}else{
			next();
			languageChanged = false;
			$('#next').html("Trocar linguagem");
		}

		if(page == maxPage && languageChanged == true){
			$('#next').html("Finalizar");
		}

		$('#result').html('<span class="placeholder">Aqui vão os resultados</span>');
	});

	$('#prev').click(function(){prev()});
	function prev(){
		var page = $('#question').attr('page');
		if(parseInt(page) <= minPage){
			return;
		}

		$('#question').attr('page', parseInt(page)-1);
		
		load(parseInt(page)-1);
	}

	//$('#next').click(function(){next()});
	function next(){
		var page = $('#question').attr('page');
		if(parseInt(page) >= maxPage) return;
		saveQuestion();

		$('#question').attr('page', parseInt(page)+1);

		load(parseInt(page)+1);
	}

	function load(page){
		$('#result').html('');
		$.post(
			'questions/portuguese/page' + page + '.html',
			{source : ""},
			function(data){
				$('#question').html(data);
			}
			);

		if(page == minPage){
			$('#prev').addClass('disabled');
			$('#next').removeClass('disabled');
		}else if(page == maxPage && languageChanged == false){
			$('#next').addClass('disabled');
			$('#prev').removeClass('disabled');
		}else{
			$('#next').removeClass('disabled');
			$('#prev').removeClass('disabled');
		}

		if(page <= 0){
			$('#submit').addClass('disabled');
			$('#change-language').addClass('disabled');
			$('#current-language').hide();
			$('.symbol-menu button').hide();
			$('#source').hide();
			$('#result').hide();
		}else{
			$('#submit').removeClass('disabled');
			$('#change-language').removeClass('disabled');
			$('#current-language').fadeIn(1000);
			$('.symbol-menu button').fadeIn(1000);
			$('#source').fadeIn(1000);
			$('#result').fadeIn(1000);
		}
		getAnswer();
		initialTime = performance.now();
	}

	//CHANGE THE LANGUAGE
	$('#change-language').click(function(){changeLanguage()});
	function changeLanguage(){
		if($('#change-language').hasClass('disabled')){
			return;
		}
		
		saveQuestion();
		
		if($('#current-language').html()=="RQL"){
			$('#current-language').html("SQL");
			$('#change-language').html("Trocar para RQL");
			$('.symbol-menu').slideUp(500);
			$('#source').css('background', 'rgb(150, 255, 255)');
		}else{
			$('#current-language').html("RQL");
			$('#change-language').html("Trocar para SQL");
			$('.symbol-menu').slideDown(500);
			$('#source').css('background', 'rgb(255, 220, 130)');
		}
		getAnswer();
	};

	//DISPLAY THE EXAMPLE DATABASE
	$('#db-modal').click(function(){
		$('#db-modal').fadeOut(500);
	});

	$('#show-db').click(function(){
		$('#db-modal').fadeIn(500);
	});

	//DISPLAY THE RESULT JSON
	function getJsonFromTable(){
		return $('table').tableToJSON();
	}

	function printJsonFromTable(){
		console.log(JSON.stringify(getJsonFromTable()));
	}

	function compareResults(){
		if (typeof expected != 'undefined') {
			requestJsonCompare(JSON.stringify(getJsonFromTable()),JSON.stringify(expected));
		}else{
			addError();
		}
		//return JSON.stringify(getJsonFromTable()) == JSON.stringify(expected);
		//return deepCompare(getJsonFromTable(), expected);
	}

	function requestJsonCompare(expected, source){
		$.post(
			'request-json-compare.php',
			{expected: JSON.stringify(expected), source: JSON.stringify(source)},
			function(data){
				if(data.indexOf("true")!=-1){
					$('table').css('background', 'rgb(100, 255, 100)');
				}else{
					addError();
					$('table').css('background', 'rgb(255, 100, 100)');
				}
			}
			);
	}

	function addError(){
		if($('#current-language').html() == "RQL"){
			var language = "rql";
		}else{
			var language = "sql";
		}
		var idQuestion = $('#question').attr('page');
		var idLogin = $('input[name=idLogin]').val();

		$.post(
			'add-error.php',
			{idQuestion: idQuestion,
				idLogin: idLogin,
				language: language},
				function(data){

				}
		).done(function(msg){
			//DISPLAY ERRORS ON REQUISITION
			console.log(msg);
		});
	}
</script>