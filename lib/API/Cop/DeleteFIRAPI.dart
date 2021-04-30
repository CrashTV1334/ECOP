import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> DeleteFIRAPI(String firid,BuildContext context) async{
  Map data = <String, String>{
    "FIRId" : firid
  };
  var response = await http.post(Uri.parse(DeleteFIRUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success") return true;
  MakeToast(res["error"], context);
  return false;
}