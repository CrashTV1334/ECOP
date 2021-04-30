import 'package:ecop/API/Secrets.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> FIRFromCaseId(String id, BuildContext context) async {

  print(id);

  Map data = <String, String>{
    "CaseId": id
  };

  var response = await http.post(Uri.parse(FIRFromCaseIdUrl),body: data);
  print(response.body);

}