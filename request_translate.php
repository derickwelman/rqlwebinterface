<meta charset="utf-8">
<?php
	$rqlSource = correctQuotes($_POST['source']);
	$rqlSource = str_replace("\n", " ", $rqlSource);
	$rqlSource = str_replace(";", "; ", $rqlSource);
	$result = exec("java -jar RqlTranslator.jar \"People.idPeople:INTEGER;People.name:VARCHAR;People.age:INTEGER;Sale.idSale:INTEGER;Sale.idPeople:INTEGER;Sale.saleDate:VARCHAR;ItemSale.idSale:INTEGER;ItemSale.idProduct:INTEGER;ItemSale.quantity:INTEGER;Product.idProduct:INTEGER;Product.name:VARCHAR;Product.price:DOUBLE;Product.idCategory:INTEGER;Category.idCategory:INTEGER;Category.description:VARCHAR;Composition.idCompound:INTEGER;Composition.idComponent:INTEGER;\" \"".$rqlSource."\"", $output);
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