<?php
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
					<li id="current_page"><a href="home.php">Home</a></li>
					<li><a href="ricerca_progetto.php">Ricerca per lettera</a></li>
					<li><a href="inserisci_progetto.php">Inserisci un progetto</a></li>
					<li><a href="elimina_progetto.php">Elimina un progetto</a></li>
				</ul>
			</div>
			<div id="content">
				<h2>Home</h2>
				<div class ="contenitore_generico">
					<p>Puoi visualizzare tutte le informazioni riguardo uno specifico progetto</p>
					<form action="info_un_progetto.php" method="post">
						<label> Inserisci il titolo esatto del progetto</label>
						<input type="text" name="titolo_inserito">
						<input type="submit" value="Ricerca">
					</form>
				</div>
				<p>Ecco l\'elenco di tutti i progetti:</p>
				';
	
	$sql = 'SELECT * FROM Progetti ORDER BY titolo;';
	$result = mysqli_query($conn, $sql);

	if (mysqli_num_rows($result) > 0) 	{
		echo'<table>';
		echo'<tr>
						<th>Link</th>
						<th>Titolo</th>
						<th>Luogo</th>
						<th>Data inizio</th>
						<th>Data fine</th>
			</tr>';
		while($row = mysqli_fetch_assoc($result)) {
			echo'<tr>
						<td> ((LINK $row[id])) </td>
						<td>'.$row[titolo].'</td>
						<td>'.$row[luogo_geografico].'</td>
						<td>'.$row[data_inizio].'</td>
						<td>'.$row[data_fine].'</td>
				</tr>';
		}
		echo'</table>';
	} else {
		echo "Error: " . $sql . "<br>" . mysqli_error($conn);
	}

	echo ' </div>
		</body>
	</html>';
?>
