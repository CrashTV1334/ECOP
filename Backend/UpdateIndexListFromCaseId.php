<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CaseId'];
        $sql = $conn->query("SELECT * FROM `updateIndexList` WHERE CaseId = '{$a}'") or die($conn->error);
        $row=$sql->fetch_assoc();
        $obj->data = $row;
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>
