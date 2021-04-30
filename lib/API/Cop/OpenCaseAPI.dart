import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> OpenCaseAPI(String firid, String copid, String courtid, String userid,
    String lawyer, String pa,BuildContext context) async {

  Map data = <String, String>{
    "FirId": firid,
    "CopId": copid,
    "CourtId": courtid,
    "UserId": userid,
    "Lawyer": lawyer,
    "ProsecutorAssigned": pa,
    "Status": "OPEN",
  };
  var response = await http.post(Uri.parse(AddNewCaseUrl),body: data);
  print(response.body);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success") return true;
  MakeToast(res["error"], context);
  return false;
}