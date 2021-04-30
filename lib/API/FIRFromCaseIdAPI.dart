import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> FIRFromCaseId(String id, BuildContext context) async {

  Map data = <String, String>{
    "CaseId": id
  };

  var response = await http.post(Uri.parse(FIRFromCaseIdUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success"){
    thisFIR.FIRId = res["data"][0]["FirId"];
    thisFIR.ComplaintHolderName = res["data"][0]["ComplaintHolderName"];
    thisFIR.Victim = res["data"][0]["Victim"];
    thisFIR.Date = res["data"][0]["Date"];
    thisFIR.Place = res["data"][0]["Place"];
    thisFIR.UserId = res["data"][0]["UserId"];
    thisFIR.CopId = res["data"][0]["CopId"];
    thisFIR.ContactInfo = res["data"][0]["ContactInfo"];
    thisFIR.Status = res["data"][0]["Status"];
    thisFIR.Description = res["data"][0]["Description"];
    return true;
  }
  MakeToast(res["error"], context);
  return false;

}