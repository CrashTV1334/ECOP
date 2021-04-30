<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CaseId'];
        $b = (String)$_POST['FirId'];
        $c = (String)$_POST['CopId'];
        $sql = "INSERT INTO `Case` (CaseId,FirId, CopId)
        VALUES ( {$a}' , '{$b}', '{$c}')";
        $conn->exec($sql);
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);