<?php

// connection to serve

$user_host = 'localhost';
$user_server = 'root';
$password = 'pwdb';
$user DB = 'CBM';



$conn = mysqli_connect($user_host,$user_server,$password, $user_DB);

if(!$conn){

	die ("non sei connesso al server " .mysqli_connect_error());

}


if(isset($_POST['submit'])){
$titolo = $_POST['titolo'];
$codice_vecchio= $_POST['codice_vecchio'];
$data_inizio = $_POST['data_inizio'];
$data_fine= $_POST['data_fine'];
$descrizione_testuale=$_POST['descrizione_testuale'];
$emergenza_si_no = $_POST['emergenza_si_no'];
$tipologia_geografica = $_POST['tipologia_geografica'];
$luogo_geografico= $_POST['luogo_geografico'];

 
  $sql = "INSERT INTO progetti (titolo, codice_vecchio, data_inizio, data_fine, descrizione_testuale, emergenza_si_no, tipologia_geografica, luogo_geografico )  VALUES ('$titolo','$codice_vecchio', '$data_inizio', '$data_fine','$descrizione_testuale', '$emergenza_si_no', '$tipologia_geografica', '$luogo_geografico')";


  if(mysqli_query( $conn, $sql)){

  	echo "il progetto salvato con sucesso!";

  }

  	else{

  		echo "errore nel collegamento al database" .$sql.  "<br>" .mysqli_error($conn);
  }
}


  mysqli_close($conn);



?>



<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<FORM ><INPUT Type="button" VALUE="Torna alla pagina iniziale" onClick="history.go(-1);return true;"  id="goback" ></FORM>

<style type="text/css">
	#goback{
		margin: 0 auto;
		background-color: orange;
		width: 40%;
		height: 8%;
		overflow: hidden;
		font-family: sans-serif;
		font-size: 16px;
	}


	


}
</style>
</body>
</html>
