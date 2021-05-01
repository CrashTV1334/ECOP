import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> TakingCharge(String firid, String copid,BuildContext context) async {

  Map data = <String, String>{
    "FIRId": firid,
    "CopId": copid
  };
  var response = await http.post(Uri.parse(TakingChargeUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success") return true;
  MakeToast(res["error"], context);
  return false;
}