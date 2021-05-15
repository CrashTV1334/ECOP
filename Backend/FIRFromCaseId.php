<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['CaseId'];
<<<<<<< HEAD
        $sql = $conn->query("SELECT FirId FROM `Case` WHERE CaseId = '{$a}'") or die($conn->error);
        $b = $sql->fetch_assoc();
        $sql = $conn->query("SELECT * FROM `FIR` WHERE FirId = '{$b}'");
        $res=$sql->fetch_assoc();
        $obj->data = $res;
=======
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
>>>>>>> e4e5ddd411f8d696652990170f84fd259b84afaa
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);

<<<<<<< HEAD
?>
=======
?>
>>>>>>> e4e5ddd411f8d696652990170f84fd259b84afaa
