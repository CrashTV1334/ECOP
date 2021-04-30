<?php
  
  $servername = "localhost";
  $username = "id16699349_ecopdbms";
  $password = "Ecop@1234567";
  $dbname = "id16699349_ecop";
   
  $conn=new mysqli($servername,$username,$password,$dbname);

  $obj=new \stdClass();
  
  try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $a = (String)$_POST['CopId'];
        $b = (String)($_POST['Name']);
        $c = (String)$_POST['Mobile'];
        $d = (String)$_POST['Password'];
        $e = (String)$_POST['Post'];
        $f = (String)$_POST['StationPosted'];
        $g = (String)$_POST['City'];
        $h = (String)$_POST['PostalCode'];
        $sql = "INSERT INTO `Cop` (CopId, Name, Mobile, Password, Post, StationPosted, City, PostalCode)
        VALUES ( '{$a}' , '{$b}', '{$c}', '{$d}', '{$e}', '{$f}', '{$g}', '{$h}')";
        $conn->exec($sql);
        $obj->error = "Success";
    }
    catch(PDOException $i){
        $obj->error = $i;
    }

  echo json_encode($obj);

?>