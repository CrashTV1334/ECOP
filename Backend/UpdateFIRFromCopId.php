<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CopId'];
        $b = (String)$_POST['FIRId'];
        $sql = $conn->query("UPDATE `FIR` SET CopId = '{$a}' WHERE FIRId = '{$b}'");
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>
