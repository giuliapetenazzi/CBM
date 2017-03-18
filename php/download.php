<?php
require 'db_conn.php';

if(isset($_GET['id'])){
	include 'library/config.php';
	include 'library/opendb.php';
	$id    = $_GET['id'];
	$query = "SELECT payload FROM Uploaded WHERE id_progetto = '$id'";
	$result = mysqli_query($conn, $query) or die('Error, query failed');
	$file = mysqli_fetch_array($result);
	if(!$file) {
		header("Location: errore.php");
	} else {
		header("Content-Disposition: attachment; filename=$id");
		echo $file['payload'];
		include 'library/closedb.php';
		exit;
	}
}

?>
