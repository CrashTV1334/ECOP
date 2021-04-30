import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Models/chat.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<bool> AllUpdates(BuildContext context) async {
  Map data = <String, String>{
    "Id": updateindex
  };
  var response = await http.post(Uri.parse(UpdatesFromUpdateIdUrl), body: data);
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  if(res["error"] == "Success"){
    MyChat.clear();
    for(var chatx in res["data"]){
      chatModel x = chatModel();
      x.id = chatx["Id"];
      x.DAT = chatx["DAT"];
      x.Update = chatx["NewUpdate"];
      x.Whom = chatx["Whom"];
      MyChat.add(x);
      print(x.Update);
    }
    return true;
  }

  MakeToast(res["error"], context);

  return false;
}
