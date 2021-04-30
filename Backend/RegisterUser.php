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
        $a = (String)$_POST['Adhar'];
        $b = (String)($_POST['Name']);
        $c = (String)$_POST['Mobile'];
        $d = (String)$_POST['Password'];
        $sql = "INSERT INTO `Users` (Adhar, Name, Mobile, Password)
        VALUES ( '{$a}' , '{$b}', '{$c}', '{$d}')";
        $conn->exec($sql);
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>