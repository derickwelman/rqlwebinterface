<?php
	$rqlSource = correctQuotes($_POST['source']);
	$rqlSource = str_replace("\n", " ", $rqlSource);
	$rqlSource = str_replace(";", "; ", $rqlSource);
	$result = exec("java -jar RqlTranslator.jar \"Hive.idHive:INTEGER;Hive.positionX:INTEGER;Hive.positionY:INTEGER;Hive.honey:DOUBLE;Comb.idComb:INTEGER;Comb.idHive:INTEGER;Job.idJob:INTEGER;Job.description:VARCHAR;Job.salary:DOUBLE;Bee.idBee:INTEGER;Bee.name:VARCHAR;Bee.age:INTEGER;Bee.honey:DOUBLE;Bee.idJob:INTEGER;Bee.idComb:INTEGER;Hierarchy.idInferior:INTEGER;Hierarchy.idSuperior:INTEGER;Flower.idFlower:INTEGER;Flower.positionX:INTEGER;Flower.positionY:INTEGER;Pollen.idFlower:INTEGER;Pollen.idBee:INTEGER;\" \"".$rqlSource."\"", $output);
	$translation = "";
	foreach($output as $row){
		$translation .= $row;
	}
	$translation = explode("**--Section--**", $translation);
	if(isset($translation[1])) echo clearParagraphs($translation[1], false);
	if(isset($translation[2])) echo clearParagraphs($translation[2], false);
	if(isset($translation[3])) echo clearParagraphs($translation[3], true);
	
	function clearParagraphs($string, $success){
		 $return = "";
		 $query = explode("<br>", $string);
		 foreach($query as $line){
		 	if($line != ""){
		 		if($success){
		 			$return .= $line;
		 		}else{
		 			$return .=  $line;
		 		}
		 	}
		 }
		 return $return;
	}

	function correctQuotes($string){
		return str_replace("\"", "\\\"", $string);
	}
?>