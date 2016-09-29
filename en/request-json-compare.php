<?php
$expected = $_POST['expected'];
$source = $_POST['source'];

$command = 'java -jar JsonComparator.jar ' . $expected . ' ' . $source;
$result = exec($command);
echo $result;

//echo $result;
?>