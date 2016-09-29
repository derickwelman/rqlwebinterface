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
	<div id="db-modal">
		<img src="images/BeeHiveDB.svg">
	</div>

	<div id="show-db">
		<img src="images/show.svg">
	</div>

	<div class="page-wrap">
		<?php
		require_once("header.php");
		?>

		<span class="clear"></span>
		
		<div id="page">
			<form class="form" onSubmit="return false;">
				<div id="current-language">Relational Query Language</div>
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

				<textarea id="source" class="code-input half" placeholder="Seu RQL aqui"></textarea>
				<div id="translation" class="code-input half"><span class="placeholder">Structured Query Language gerada</span></div>
				<button id="translate" class="btn-big">TRADUZIR!</button>

				<div id="result" class="code-input full">
					<span class="placeholder">Aqui vão os resultados</span>
				</div>
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
	$('#translate').click(function(){
		$.post(
			"request-translate.php",
			{source : $('#source').val()},
			function(data){
				$('#translation').html(data);
			}
			);
	});

	function query(query){
		$.post(
			"connect.php",
			{source : query.innerHTML},
			function(data){
				$('#result').html(data);
			}
			);
	}

	var buttons = $('#button-menu button');
	var rqlLabel = $('#menu-label');


	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip({html: true});
	});

	$('#db-modal').click(function(){
		$('#db-modal').fadeOut(500);
	});

	$('#show-db').click(function(){
		$('#db-modal').fadeIn(500);
	});
</script>
