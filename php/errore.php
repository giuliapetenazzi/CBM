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
					<li><a href="ricerca_progetto.php">Cerca titoli che contengono una certa parola</a></li>
					<li><a href="inserisci_progetto.php">Inserisci un progetto</a></li>
					<li><a href="elimina_progetto.php">Elimina un progetto</a></li>
				</ul>
			</div>
			<div id="content">
				<h2>C''è stato un errore durante l''operazione</h2>';
	echo ' </div>
		</body>
	</html>';
?>
