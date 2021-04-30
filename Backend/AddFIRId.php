<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['ComplaintHolderName'];
        $b = (String)$_POST['Victim'];
        $c = (String)$_POST['Date'];
        $d = (String)$_POST['Place'];
        $e = (String)$_POST['UserId'];
        $f = (String)$_POST['CopId'];
        $g = (String)$_POST['ContactInfo'];
        $h = (String)$_POST['Status'];
        $i = (String)$_POST['Description'];
        $sql = $conn->query("INSERT INTO `FIR` (ComplaintHolderName, Victim, Date, Place, UserId, CopId, ContactInfo, Status,Description)
        VALUES ( '{$a}' , '{$b}', '{$c}', '{$d}', '{$e}', '{$f}', '{$g}', '{$h}', '{$i}')");
        // $conn->exec($sql);
        $obj->error = "Success";
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);
  
?>