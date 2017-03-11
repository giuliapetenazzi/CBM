<?php

require 'db_conn.php';
if(isset($_POST['id_proj'])  && isset($_FILES['userfile'])) {
	echo 'Preparazione del caricamento<br>';

	$fileName = $_FILES['userfile']['name'];
	$tmpName  = $_FILES['userfile']['tmp_name'];
	$fileSize = $_FILES['userfile']['size'];
	$fileType = $_FILES['userfile']['type'];

	$fp      = fopen($tmpName, 'r');
	$content = fread($fp, filesize($tmpName));
	$content = addslashes($content);
	fclose($fp);
	include 'library/config.php';
	include 'library/opendb.php';

	$query = "UPDATE TABLE Progetti (`id_progetto`, `titolo`, `codice_vecchio`, `data_inizio`, `data_fine`, `descrizione_testuale`, `emergenza_si_no`, `tipologia_geografica`, `luogo_geografico`, `file`)
	SET 'file'='".$content."' 
	WHERE 'id_progetto' ='".$_POST['id_proj']."'";

	mysqli_query($conn, $query) or die('Error, query failed');
	include 'library/closedb.php';
	header("Location: successo.php");

} else {echo "Errore del server nella ricezione dei parametri per il caricamento del file";}
?>
