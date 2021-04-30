import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> FindUpdateIndex(String what,String url, String id, BuildContext context) async {
  Map data = <String , String>{
    what: url
  };
  var response = await http.post(Uri.parse(url),body: data);
  print(response.body);
}