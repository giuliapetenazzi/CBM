<?php

//mi ricavo tutti i nomi delle tabelle nell'array $tabelle
	//massimo numero di tabelle da gestire
	$numero_tabelle = 15;
	$conn = mysqli_connect('localhost', 'root', 'pwdb');
	if (!$conn) {
		echo 'Connessione fallita';
		exit;
	}
	$result = mysqli_query($conn, 'SHOW TABLES FROM CBM;');
	$i = 0;
	$tabelle[$numero_tabelle];
	while ($row = mysqli_fetch_row($result)) {
		$tabelle[$i] = $row[0];
		$i++;
	}
	
//stampo la pagina
require_once 'db_conn.php';
echo '
	<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
			<meta name="author" content="Hossain Safdari, Giulia Petenazzi" />
			<link rel="stylesheet" type="text/css" href="../stylesheet.css" media="screen" />
		</head>
		<body>
			<div id="header">
				<h1>CBM</h1>
				<ul>
					<li><a href="home.php">Home</a></li>
					<li><a href="ricerca_progetto.php">Ricerca per lettera</a></li>
					<li><a href="inserisci_progetto.php">Inserisci un progetto</a></li>
					<li><a href="elimina_progetto.php">Elimina un progetto</a></li>
				</ul>
			</div>
			<div id="content">
				<h2>Informazioni del progetto: '.$_POST["titolo_inserito"].'</h2>
				';	
		
	$id_ris = mysqli_query($conn, 'SELECT id_progetto FROM Progetti WHERE titolo="'.$_POST["titolo_inserito"].'";');
	$id = -1;
	if($riga = mysqli_fetch_row($id_ris)) {
		$id = ($riga[0]);
	}
	//cerco di fixare
	$temp=0;
	while ($temp < 5) {$temp++; echo $tabellr[$temp];}
	
	echo '<h3>Informazioni generali</h3>';
	echo '<table>';
	$res_query = mysqli_query($conn, 'SELECT * FROM Progetti WHERE id_progetto="'.$id.'";');
	if(!($row_query = mysqli_fetch_assoc($res_query))) {
		echo "Errore del server nella selezione del progetto";
		exit;
	} else {
		$res = mysqli_query($conn, 'SHOW COLUMNS FROM Progetti');
		while($row = mysqli_fetch_object($res))	{
			echo '<tr>';
			echo '<td>';
			echo '<strong>'.ucfirst(str_replace('_', ' ', $row->Field)).': </strong>';
			echo '</td>';
			echo '<td>';
			echo $row_query[$row->Field];
			echo '</td>';
			echo '</tr>';
		}
	}
	echo '</table>';
	
	$i=0;
	while ($i < $numero_tabelle) {
		//echo $i;
		//ottengo il nome della tabella
		$nome_tabella = $tabelle[$i];
		echo $tabelle[$i];
		if ($nome_tabella != "Progetti" &&
			$nome_tabella != "AssDisabilita" &&
			$nome_tabella != "AssSettori" &&
			$nome_tabella != "AsStrumenti"
		) {
			echo '<h3>'.$nome_tabella.'</h3>';
			echo '<table>';
			$res = mysqli_query($conn, 'SHOW COLUMNS FROM '.$nome_tabella);
			echo '<tr>';
			while($row = mysqli_fetch_object($res))	{
				if ($row->Field!="id_progetto") {
					echo '<th>';
					echo '<strong>'.ucfirst(str_replace('_', ' ', $row->Field)).': </strong>';
					echo '</th>';
				}
			}
			echo '</tr>';
			$res_query = mysqli_query($conn, 'SELECT * FROM '.$nome_tabella.' WHERE id_progetto="'.$id.'";');
			while($row_query = mysqli_fetch_assoc($res_query)) {
				echo '<tr>';
				$res = mysqli_query($conn, 'SHOW COLUMNS FROM '.$nome_tabella);
				while($row = mysqli_fetch_object($res))	{
					if ($row->Field!="id_progetto") {
						echo '<td>';
						echo $row_query[$row->Field];
						echo '</td>';
					}
				}
				echo '</tr>';
			}
			echo '</table>';
		}
		$i++;
	}
	echo ' </div>
		</body>
	</html>';
?>
