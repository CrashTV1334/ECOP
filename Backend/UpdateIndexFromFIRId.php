<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['FirId'];
        $sql = $conn->query("SELECT * FROM `upadteIndexList` WHERE FirId = '{$a}'") or die($conn->error);
        $row=$sql->fetch_assoc();
        $obj->data = $row;
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>
