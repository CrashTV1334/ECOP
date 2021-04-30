import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> RegisterUserAPI(String adhar, String name, String mobile, String password, BuildContext context) async {

  Map data = <String, String>{
    "Adhar": adhar,
    "Password" : password,
    "Mobile" : mobile,
    "Name" : name
  };
  var resp = await http.post(Uri.parse(RegisterUserUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
  if(res["error"] == "Success") return true;
  MakeToast(res["error"], context);
  return false;
}