<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php
	include('connection.php');
	$con = getGuestConnection();

	$source = $_POST['source'];
	$source = str_replace('"', "'", $source);

	$query = $con->query($source);
	
	if($query){
	echo "
	<table class=\"table table-hover\">
		<thead>";
			foreach(range(0, $query->columnCount() -1) as $column){
				$meta = $query->getColumnMeta($column);
				echo "<th>" . $meta['name'] . "</th>";
			}
		echo "
			</thead>
			<tbody>";
			while($row = $query->fetch(PDO::FETCH_NUM)){
				echo "<tr>";
				foreach($row as $column => $value){
					echo "<td>" . $value . "</td>";
				}
				echo "</tr>";
			}
		echo "</tbody>
	</table>";
	}else{
		echo "<span style=\"background:rgb(255, 100, 100);padding:10px;display:block;\">Erro na consulta SQL. Verifique seu código.</span>";
	}
			?>
		</body>
		</html>