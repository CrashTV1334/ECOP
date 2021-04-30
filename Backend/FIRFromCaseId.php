<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CaseId'];
        $sql = $conn->query("SELECT FirId FROM `Case` WHERE CaseId = '{$a}'");
        $res=array();
        while($row=$sql->fetch_assoc()){
        $res[] = $row;
        }
        $b = $res[0]["FirId"];
        $sql = $conn->query("SELECT * FROM `FIR` WHERE FirId = '{$b}'");
        $res=array();
        while($row=$sql->fetch_assoc()){
        $res[] = $row;
        }
        $x = array_reverse($res);
        $obj->data = $x;
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

?>
