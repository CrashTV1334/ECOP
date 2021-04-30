import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> SendUpdate(String update, BuildContext context) async{

  String now = DateTime.now().toString();

  Map data = <String, String>{
    "Id" : updateindex,
    "DAT" : now.split('.')[0],
    "NewUpdate" : update,
    "Whom": auth
  };
  var response = await http.post(Uri.parse(AddUpdateUrl),body: data);
  print(response.body);
}