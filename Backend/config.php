<?php
   $servername = "localhost";
   $username = "id16699349_ecopdbms";
   $password = "Ecop@1234567";
   $dbname = "id16699349_ecop";
   
   // Create connection
   $conn=new mysqli($servername,$username,$password,$dbname);
   // Check connection
   if (!$conn) {
     die("Connection failed: " . mysqli_connect_error());
   }
    // echo "Connected Successfully.";
?>