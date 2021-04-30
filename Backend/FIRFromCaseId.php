<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CaseId'];
        $sql = $conn->query("SELECT FirId FROM `Case` WHERE CaseId = '{$a}'") or die($conn->error);
        $b = $sql->fetch_assoc();
        $sql = $conn->query("SELECT * FROM `FIR` WHERE FirId = '{$b}'");
        $res=$sql->fetch_assoc();
        $obj->data = $res;
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>