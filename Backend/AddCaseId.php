<?php
  include 'config.php';

  $obj=new \stdClass();
  
  try {
        $a = (String)$_POST['FirId'];
        $b = (String)$_POST['CopId'];
        $c = (String)$_POST['CourtId'];
        $d = (String)$_POST['UserId'];
        $e = (String)$_POST['Lawyer'];
        $f = (String)$_POST['ProsecutorAssigned'];
        $g = (String)$_POST['Status'];
        $sql=$conn->query("SELECT * FROM `Court` WHERE CourtId = '{$c}' ");
        $res=$sql->fetch_assoc();
        if($res == NULL)
        {
           $obj->error = "Id doesn't exists";
        }
        else
        {
           $sql = $conn->query("INSERT INTO `Case` (FirId, CopId, CourtId, UserId,  Lawyer, ProsecutorAssigned, Status)
           VALUES ( '{$a}' , '{$b}', '{$c}', '{$d}', '{$e}', '{$f}', '{$g}')");
           $sql = $conn->query("UPDATE `FIR` SET Status = 'CASE OPEN' WHERE FirId = '{$a}'");
           $sql = $conn->query("SELECT CaseId FROM `Case` WHERE FirId = '{$a}'");
            $res=array();
            while($row=$sql->fetch_assoc()){
            $res[] = $row;
            }
            $x = $res[0]["CaseId"];
           $sql = $conn->query("INSERT INTO `updateIndexList` (CaseId, FirId, CopId, UserId) VALUES ( '{$x}' , '{$a}' , '{$b}' ,'{$d}')");
           $obj->error = "Success";
        } 
    }
    catch(PDOException $e){
        $obj->error = $e;
    }

  echo json_encode($obj);
