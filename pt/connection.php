<?
$dbhost = "localhost";
$db = "Bees";
$dbuser = "postgres";
$dbpass = "postgres";
$dbport = 5432;

$con = new PDO("pgsql: host=$dbhost; port=$dbport; dbname=$db; user=$dbuser; password=$dbpass;");
?>