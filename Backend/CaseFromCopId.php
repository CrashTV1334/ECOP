<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CopId'];
        $sql = $conn->query("SELECT * FROM `Case` WHERE CopId = '{$a}'") or die($conn->error);
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