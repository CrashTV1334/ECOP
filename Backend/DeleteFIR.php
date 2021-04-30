<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['FIRId'];
        $sql = $conn->query("UPDATE `FIR` SET Status = 'DELETED' WHERE FIRId = '{$a}'") or die($conn->error);
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>
