import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> RegisterCopAPI(String id, String name, String mobile, String post,
    String stationposted, String city, String postalcode,String password,
    BuildContext context) async {

  Map data = <String, String>{
    "CopId": id,
    "Password" : password,
    "Mobile" : mobile,
    "Name" : name,
    "Post" : post,
    "StationPosted" : stationposted,
    "City" : city,
    "PostalCode" : postalcode
  };
  var resp = await http.post(Uri.parse(RegisterCopUrl),body: data);
  Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
  if(res["error"] == "Success") return true;
  MakeToast(res["error"], context);
  return false;
}