<meta charset="utf-8">
<?php
	$rqlSource = correctQuotes($_POST['source']);
	$rqlSource = str_replace("\n", " ", $rqlSource);
	$rqlSource = str_replace(";", "; ", $rqlSource);
	$result = exec("java -jar RqlTranslator.jar \"Hive.idHive:INTEGER;Hive.positionX:INTEGER;Hive.positionY:INTEGER;Hive.honey:DOUBLE;Comb.idComb:INTEGER;Comb.idHive:INTEGER;Job.idJob:INTEGER;Job.description:VARCHAR;Job.salary:DOUBLE;Bee.idBee:INTEGER;Bee.name:VARCHAR;Bee.age:INTEGER;Bee.honey:DOUBLE;Bee.idJob:INTEGER;Bee.idComb:INTEGER;Hierarchy.idInferior:INTEGER;Hierarchy.idSuperior:INTEGER;Flower.idFlower:INTEGER;Flower.positionX:INTEGER;Flower.positionY:INTEGER;Pollen.idFlower:INTEGER;Pollen.idBee:INTEGER;Colmeia.idColmeia:INTEGER;Colmeia.posicaoX:INTEGER;Colmeia.posicaoY:INTEGER;Colmeia.mel:DOUBLE;Favo.idFavo:INTEGER;Favo.idColmeia:INTEGER;Trabalho.idTrabalho:INTEGER;Trabalho.descricao:VARCHAR;Trabalho.salario:DOUBLE;Abelha.idAbelha:INTEGER;Abelha.nome:VARCHAR;Abelha.idade:INTEGER;Abelha.mel:DOUBLE;Abelha.idTrabalho:INTEGER;Abelha.idFavo:INTEGER;Hierarquia.idInferior:INTEGER;Hierarquia.idSuperior:INTEGER;Flor.idFlor:INTEGER;Flor.posicaoX:INTEGER;Flor.posicaoY:INTEGER;Polen.idFlor:INTEGER;Polen.idAbelha:INTEGER;\" \"".$rqlSource."\"", $output);
	$translation = "";
	foreach($output as $row){
		$translation .= $row . "<br>";
	}
	$translation = explode("**--Section--**", $translation);
	if(isset($translation[1])) echo '<span style="color:red">'. clearParagraphs($translation[1], false) . '</span>';
	if(isset($translation[2])) echo '<span style="color:red">'. clearParagraphs($translation[2], false) . '</span>';
	if(isset($translation[3])) echo clearParagraphs($translation[3], true);
	
	function clearParagraphs($string, $success){
		 $return = "";
		 $query = explode("<br>", $string);
		 foreach($query as $line){
		 	if($line != ""){
		 		if($success){
		 			$return .= '<div class="query" onClick="query(this);">' . $line . '</div>';
		 		}else{
		 			$return .=  $line . '</br>';
		 		}
		 	}
		 }
		 return $return;
	}

	function correctQuotes($string){
		return str_replace("\"", "\\\"", $string);
	}
?>