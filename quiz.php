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
		echo '<input type="hidden" name="idLogin" value="'.$_SESSION['idLogin'].'">';
		?>
		<div id="page">
			<form class="form" onSubmit="return false;">
				

				<div id="question" page="1"></div>
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

				<textarea id="source" class="code-input full" placeholder="Your answer here"></textarea>
				
				<button id="prev" class="btn-big third">Previous question</button>
				<button id="change-language" class="btn-big sixth">Switch to SQL</button>
				<button id="submit" class="btn-big sixth">Submit</button>
				<button id="next" class="btn-big third">Next question</button>

				<span class="clear"></span>
				<div id="result" class="code-input full">
					<span class="placeholder">Here are the query results</span>
				</div>
				<span class="clear"></span>
			</form>
		</div>
		<span class="clear" style="height:80px"></span>
		<footer>
			Relational Query Language Translator - 2016<br> Developed by Dérick Welman and Lucas Venezian
		</footer>
	</div>
</body>
</html>

<script>
	
	//INITIALIZE TOOLTIPS
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip({html: true});
		load(1);
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
				}
			}
			);
	};

	function getSqlResult(){
		var sqlQuery = $('#source').val();
		console.log(sqlQuery);
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
		var idQuestion = $('#question').attr('page');
		var idLogin = $('input[name=idLogin]').val();
		var answer = $('#source').val();

		if($('#current-language').html() == "RQL"){
			var language = "rqlAnswer";
		}else{
			var language = "sqlAnswer";
		}
		$.post(
			'save-question.php',
			{source : answer,
				idQuestion: idQuestion,
				idLogin: idLogin,
				language: language},
				function(data){
					console.log("Question " + idQuestion + " saved!");
				}
				);
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

	$('#prev').click(function(){
		var page = $('#question').attr('page');
		if(parseInt(page) <= minPage){
			return;
		}

		$('#question').attr('page', parseInt(page)-1);
		
		load(parseInt(page)-1);
	});

	$('#next').click(function(){
		var page = $('#question').attr('page');
		if(parseInt(page) >= maxPage) return;

		$('#question').attr('page', parseInt(page)+1);

		load(parseInt(page)+1);
	});

	function load(page){
		$.post(
			'questions/english/page' + page + '.html',
			{source : ""},
			function(data){
				$('#question').html(data);
			}
			);

		if(page == minPage){
			$('#prev').addClass('disabled');
			$('#next').removeClass('disabled');
		}else if(page == maxPage){
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
	}

	//CHANGE THE LANGUAGE
	$('#change-language').click(function(){
		if($('#change-language').hasClass('disabled')){
			return;
		}
		if($('#current-language').html()=="RQL"){
			$('#current-language').html("SQL");
			$('#change-language').html("Switch to RQL");
			$('.symbol-menu').slideUp(500);
		}else{
			$('#current-language').html("RQL");
			$('#change-language').html("Switch to SQL");
			$('.symbol-menu').slideDown(500);
		}
		getAnswer();
	});

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
			if(JSON.stringify(getJsonFromTable()) == JSON.stringify(expected)){
				$('table').css('background', 'rgb(100, 255, 100)');
				return true;
			}else{
				$('table').css('background', 'rgb(255, 100, 100)');
				return false;
			}
		}
		return JSON.stringify(getJsonFromTable()) == JSON.stringify(expected);
		//return deepCompare(getJsonFromTable(), expected);
	}
</script>