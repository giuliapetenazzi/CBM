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
					<li><a href="home.php">Home</a></li>
					<li><a href="ricerca_progetto.php">Ricerca per lettera</a></li>
					<li><a href="inserisci_progetto.php">Inserisci un progetto</a></li>
					<li><a href="elimina_progetto.php">Elimina un progetto</a></li>
				</ul>
			</div>
			<div id="content">
				<h2>Informazioni del progetto: '.$_POST["titolo_inserito"].'</h2>

				';	
	/*
	$sql = "SHOW TABLES FROM CBM";
	$result = mysql_query($conn, $sql);
	$databases = mysqli_list_dbs($connessione);
	while($row = mysqli_fetch_row($result)) {
			 $tabella = $row[0];
		 echo "$tabella<br>";
		 $risultato = mysqli_query("SELECT * FROM `$tabella`");
		 $conta = mysqli_num_rows($risultato);
		 echo "$conta<br>";
	 }  
	 echo $conta.'<br>';
	*/
		
	echo '<table>';
	$res = mysqli_query($conn, 'SHOW COLUMNS FROM Progetti');
		echo '<tr>';
			while($row = mysqli_fetch_object($res))
			{
				echo '<th>';
				echo str_replace("_", " ", $row->Field);
				echo '</th>';
			}
		echo '</tr>';
	echo '</table>';

	//$sql = 'SELECT * FROM Missioni WHERE titolo="'.$_POST["titolo_inserito"].'";';


	echo ' </div>
		</body>
	</html>';
?>
