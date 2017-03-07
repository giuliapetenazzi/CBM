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
					<li><a href="ricerca_progetto.php">Cerca titoli che contengono una certa parola</a></li>
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
		//echo $tabelle[$i];
		if ($nome_tabella != "Progetti" &&
			$nome_tabella != "AssDisabilita" &&
			$nome_tabella != "AssSettori" &&
			$nome_tabella != "AssStrumenti" &&
			$nome_tabella != "Disabilita" &&
			$nome_tabella != "Settori" &&
			$nome_tabella != "Strumenti"
		) {
			echo '<h3>'.$nome_tabella.'</h3>';
			echo '<table>';
			$res = mysqli_query($conn, 'SHOW COLUMNS FROM '.$nome_tabella);
			echo '<tr>';
			while($row = mysqli_fetch_object($res))	{
				if ($row->Field!="id_progetto" /*&& strpos($row->Field, "id_")==0*/) {
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
		
		//stampo gli strumenti
		echo '<h3>'.'Strumenti'.'</h3>';
		echo '<ul>';
		$res_query = mysqli_query($conn, 'SELECT Strumenti.nome FROM Progetti, AssStrumenti, Strumenti WHERE Progetti.id_progetto=AssStrumenti.id_progetto AND AssStrumenti.id_strumento=Strumenti.id_strumento;');
		while($row_query = mysqli_fetch_row($res_query)) {
			echo '<li>'.$row_query[0].'</li>';
		}
		echo '</ul>';	
		
		//stampo i settori
		echo '<h3>'.'Settori'.'</h3>';
		echo '<ul>';
		$res_query = mysqli_query($conn, 'SELECT Settori.macro_settore, Settori.dettaglio_settore FROM Progetti, AssSettori, Settori WHERE Progetti.id_progetto=AssSettori.id_progetto AND AssSettori.id_settore=Settori.id_settore;');
		while($row_query = mysqli_fetch_row($res_query)) {
			echo '<li>'.$row_query[1].'(<em>Categoria: '.$row_query[0].')</em></li>';
		}
		echo '</ul>';
		
		//stampo le disabilità
		echo '<h3>'.'Disabilità'.'</h3>';
		echo '<ul>';
		$res_query = mysqli_query($conn, 'SELECT Disabilita.tipologia, Disabilita.nome FROM Progetti, AssDisabilita, Disabilita WHERE Progetti.id_progetto=AssDisabilita.id_progetto AND AssDisabilita.id_disabilita=Disabilita.id_disabilita;');
		while($row_query = mysqli_fetch_row($res_query)) {
			echo '<li>'.$row_query[1].'(<em>Tipologia: '.$row_query[0].')</em></li>';
		}
		echo '</ul>';
	
	echo ' </div>
		</body>
	</html>';
?>
