<?php

	echo'<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="it" lang="it">
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
				<li id="current_page"><a href="ricerca_progetto.php">Cerca titoli che contengono una certa parola</a></li>
				<li><a href="inserisci_progetto.php">Inserisci un progetto</a></li>
				<li><a href="elimina_progetto.php">Elimina un progetto</a></li>
			</ul>
		</div>
		<div id="content">';
			require_once 'db_conn.php';
			if (empty($_REQUEST['submit'])) {
				echo '
				<h2>Cerca titoli che contengono una certa parola</h2>
				<div class ="contenitore_generico">
				<p>Puoi visualizzare qui sotto i titoli che contengono una parola che ti ricordi.</p>
				<p>Inserisci la parola:</p>         
				<form action="" method="post" class="barra" >    
				<input type="text" name="submit" class="input-cerca" />
				<input type="submit" value="cerca"  class="button-input-cerca" /> 
				</form>
				</div>';
			} else {
				$sql = "SELECT * FROM Progetti WHERE titolo LIKE '%$submit%';";
				$result = mysqli_query($conn, $sql);
				while($row = mysqli_fetch_assoc($result)) {
					echo '
					<h2>Risultati ricerca titoli che contengono una certa parola</h2>
					<p>Stai visualizzando i titoli dei progetti che contengono la parola "'.$_REQUEST['submit'].'"</p>							
					<ul>
							<li>'.$row[titolo].' <em>(luogo: '.$row[luogo_geografico].')</em> </li>
					</ul>';
				}
			}
echo '	</div>
    </body>
</html>';
