import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> NewFIRAPI(String name, String victim, String date, String place, String contactinfo, String desription,BuildContext context) async {
  print("ger");
  Map data = <String, String>{
    "UserId" : User.Adhar,
    "ComplaintHolderName" : name,
    "Victim" : victim,
    "Date" : date,
    "Place" : place,
    "ContactInfo" : contactinfo,
    "Description" : desription,
    "CopId" : "xxx",
    "Status" : "NO CASE OPEN"
  };
  var response = await http.post(Uri.parse(AddFIRIdUrl),body: data);
  print(response.body);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success") return true;
  MakeToast(res["error"], context);
}