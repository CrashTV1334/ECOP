import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> FindUpdateIndex(String id, BuildContext context) async {
  Map data = <String , String>{
    "CaseId": id
  };
  var response = await http.post(Uri.parse(UpdateIndexListFromCaseIdUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success"){
    updateindex = res["data"]["Id"];
    return true;
  }
  MakeToast(res["error"], context);
  return false;
}