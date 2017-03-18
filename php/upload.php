<?php

require 'db_conn.php';
if(isset($_POST['id_proj'])  && isset($_FILES['userfile'])) {
	echo 'Preparazione del caricamento<br>';

	$idp = $_POST['id_proj'];
	$fileName = $_FILES['userfile']['name'];
	$tmpName  = $_FILES['userfile']['tmp_name'];
	$fileSize = $_FILES['userfile']['size'];
	$fileType = $_FILES['userfile']['type'];

	$fp = fopen($_FILES['userfile']['tmp_name'], "r");
	if ($fp) {
		$content = fread($fp, $_FILES['userfile']['size']);
		fclose($fp);
		$content = addslashes($content);
		//echo "Il contenuto è :".$content;
				
		// se ce nera uno allora devo eliminarlo cosi tengo quello piu recente
		$query_el = "SELECT * FROM Uploaded WHERE id_progetto = '$idp'";
		$result_el = (mysqli_query($conn, $query_el));
		if(mysqli_fetch_array($result_el)) {
			mysqli_query($conn, "DELETE FROM `Uploaded` WHERE `Uploaded`.id_progetto = $idp;") or die('<br>Error, query di delete failed<br>'.$query_el);
		}
		
		$folder="uploads/";
 
		move_uploaded_file($tmpName,$folder.$fileName);
		//inserisco il file nel db
		$query = "INSERT INTO `Uploaded` (`id_uploaded`, `id_progetto`, `nome_file`, `payload`, `note`)
		VALUES (NULL ,'$idp', '$idp', '$content', '');";		
		mysqli_query($conn, $query) or die('<br>Error, query di insert failed<br>'.$query);
		include 'library/closedb.php';
		header("Location: successo.php");
	} else {
		header("Location: errore.php");
	}
} else {
	header("Location: errore.php");
}
?>
