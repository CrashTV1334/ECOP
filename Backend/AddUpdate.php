<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['Id'];
        $b = (String)$_POST['DAT'];
        $c = (String)$_POST['NewUpdate'];
        $d = (String)$_POST['Whom'];
        $sql = $conn->query("INSERT INTO `Updates` (Id,DAT, NewUpdate, Whom)
        VALUES ( '{$a}' , '{$b}', '{$c}', '{$d}')");
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);