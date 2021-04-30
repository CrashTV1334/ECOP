<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CaseId'];
        $sql = $conn->query("UPDATE `Case` SET Status = 'DELETED' WHERE CaseId = '{$a}'") or die($conn->error);
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>
