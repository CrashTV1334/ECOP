<?php
   include 'config.php';
   $sql=$conn->query("SELECT * FROM `FIR`") or die($conn->error);
   $res=array();
   
   while($row=$sql->fetch_assoc()){
     $res[] = $row;
   }
   
   $x = array_reverse($res);
   
   $obj=new \stdClass();
   
   $obj->error = "Success";
   $obj->data = $x;

   echo json_encode($obj);
?>