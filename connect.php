<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<?php
	$source = $_POST['source'];
	$con = new PDO("mysql:host=localhost:8080;dbname=rql", "root", "usbw"); 
	$con->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	$con->exec("SET CHARACTER SET utf8");

	$query = $con->query($source);

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











	    //$meta = $query->getColumnMeta(0);
	    //var_dump($meta);
	    //echo $meta['name'];
			?>
		</body>
		</html>