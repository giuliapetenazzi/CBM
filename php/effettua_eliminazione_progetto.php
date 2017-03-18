<?php
	if(isset($_POST['id_progetto'])) {
		require_once "db_conn.php";
		$sql = 'DELETE FROM Progetti WHERE id_progetto="' . $_POST['id_progetto'] . '"';
		if (mysqli_query($conn, $sql))    {
			mysqli_close($conn);
			header("Location: successo.php");
		} else {
			header("Location: errore.php");
		}
	} else {
		//nessun progetto selezionato
		header("Location: elimina_progetto.php");
	}
	exit();
?>
