<?php
require 'db_conn.php';

if(isset($_GET['id'])){
	include 'library/config.php';
	include 'library/opendb.php';
	$id    = $_GET['id'];
	$query = "SELECT file FROM Progetti WHERE id_progetto = '$id'";
	$result = mysqli_query($conn, $query) or die('Error, query failed');
	list($file) = mysqli_fetch_array($result);
	header("Content-Disposition: attachment; id=$id");
	echo $file;
	include 'library/closedb.php';
	exit;
}

?>
