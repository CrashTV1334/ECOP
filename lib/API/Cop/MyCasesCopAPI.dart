import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Models/CaseModel.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:http/http.dart' as http;

Future<bool> MyCasesCopAPI() async {

  Map data = <String, String>{
    "CopId" : Cop.CopId,
  };
  var response = await http.post(Uri.parse(CaseFromCopIdUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] != "Success") return false;
  AllRunningCases.clear();
  for(var cases in res["data"]){
    CaseModel newCase = CaseModel();
    newCase.FIRId = cases["FirId"];
    newCase.CaseId = cases["CaseId"];
    newCase.UserId = cases["UserId"];
    newCase.CopId = cases["CopId"];
    newCase.CourtId = cases["CourtId"];
    newCase.Lawyer = cases["Lawyer"];
    newCase.ProsecutorAssigned = cases["ProsecutorAssigned"];
    newCase.Status = cases["Status"];
    AllRunningCases.add(newCase);
  }

  return true;
}