<?php
$db_hostname = 'localhost';
$db_username = 'root';
$db_password = '';
$db_database = 'cbm';

// Database Connection String
$con = mysql_connect($db_hostname,$db_username,$db_password);
if (!$con)
  {
  die('non sei connesoo al server: ' . mysql_error());   
  }

mysql_select_db($db_database, $con);
?>

<!DOCTYPE html>
<html lang="it">
    <head>
        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
        <button onclick="myFunction()">Inserire nuovo progetto</button>

<script>
function myFunction() {
    location.replace("inserire.html")
}
</script>
        
<div class="content">
<div class="form-cerca">
 
<form action="" method="post" class="barra" >  
    
<input type="text" name="submit" class="input-cerca" />
<input type="submit" value="cerca"  class="button-input-cerca" /> 
    
</form> 
</div>



 
    <table class='tabella'>
     <th>Codice Progetto</th>
     <th>Titolo</th>
     <th>Luogo</th>
    </tr>
    
     
<?php

if (!empty($_REQUEST['submit'])) {

$submit = mysql_real_escape_string($_REQUEST['submit']);
    

    
$sql = "SELECT * FROM progetti WHERE titolo LIKE '%$submit%'";      
$r_query = mysql_query($sql); 

while ($row = mysql_fetch_array($r_query)){


    
   
echo "<tr><td>".$row['id_progetto']."</td><td>".$row['titolo']."</td> <td>".$row['luogo_geografico']. "</td></tr>";


}

}
?>
 </table>          

    

<style>
    
    
    .content{
        width: 90%;
        border: 1px solid  #fff;
        margin: auto;
    }
    
    .input-cerca{
       
        width:50%;
        height:30px;
        border:1px solid #ddd;
        border-radius: 10px;
        background-color:#fff;  
    }
    
    .button-input-cerca{
         width: 60px;
         height:30px;
        text-align: center;
        background-color: orange;
    }
    
  
 
        
    .tabella{
        width: 60%;
        background-color: #ddd;
        text-align:center;
        margin: 0 auto;
        padding: 10px;
        border:1px solid #fff;
        
    }
    
    .form-cerca{
         margin-left: 25%;
        padding-top: 10%;
        padding-bottom: 10%;
    
    }
        
 </style>
 </div> 

    </body>
    
</html>










