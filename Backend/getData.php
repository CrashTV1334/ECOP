<?php
   include 'config.php';
   $sql=$conn->query("SELECT * FROM `Users`") or die($conn->error);
   $res=array();
   
   while($row=$sql->fetch_assoc()){
     $res[] = $row;
   }
   $x = array_reverse($res);

   echo json_encode($x);
?>