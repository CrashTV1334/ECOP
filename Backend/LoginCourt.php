<?php
   include 'config.php';
   $a = (String)$_POST["CourtId"];
   $b = (String)$_POST["Password"];
   $sql=$conn->query("SELECT * FROM `Court` WHERE CourtId = '{$a}' AND password = '{$b}'")
   or die($conn->error);
   
   $res=$sql->fetch_assoc();
   
   $obj=new \stdClass();
   $obj->data=$res;
   
   if(is_null($res)) $obj->error="No User Found";
   else $obj->error="NULL";

   echo json_encode($obj);
?>