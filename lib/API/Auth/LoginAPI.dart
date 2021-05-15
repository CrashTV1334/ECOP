import 'dart:convert';
import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Utils/SharedPreferences/SharedPreferences.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String> LoginAPI(String username, String password, BuildContext context) async {

  String authx = username.substring(0, 2);
  if(authx.toLowerCase() == "po"){
    Map data = <String, String>{
      "CopId": username,
      "Password" : password,
    };
    var resp = await http.post(Uri.parse(LoginCopUrl),body: data);
    Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
    if(res["error"] == "NULL"){
      SetStringFromSharedPref("Username", username);
      SetStringFromSharedPref("Password", password);
      auth = "po";
      Cop.thisdata(
        res["data"]["CopId"],
        res["data"]["Name"],
        res["data"]["Mobile"],
        res["data"]["Password"],
        res["data"]["Post"],
        res["data"]["StationPosted"],
        res["data"]["City"],
        res["data"]["PostalCode"],
      );
      return "po";
    }
    MakeToast(res["error"], context);
  }
  else if(authx.toLowerCase() == "co"){
    Map data = <String, String>{
      "CourtId": username,
      "Password" : password,
    };
    var resp = await http.post(Uri.parse(LoginCourtUrl),body: data);
    Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
    if(res["error"] == "NULL"){
      SetStringFromSharedPref("Username", username);
      SetStringFromSharedPref("Password", password);
      auth = "co";
      Court.thisdata(
          res["data"]["CourtId"],
          res["data"]["Password"],
          res["data"]["City"],
          res["data"]["Postal Code"],
      );
      return "co";
    }
    MakeToast(res["error"], context);
  }
  else{
    Map data = <String, String>{
      "Adhar": username,
      "Password" : password,
    };
    var resp = await http.post(Uri.parse(LoginUserUrl),body: data);
    Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
    if(res["error"] == "NULL"){
      SetStringFromSharedPref("Username", username);
      SetStringFromSharedPref("Password", password);
      auth = "us";
      User.thisdata(
          res["data"]["Adhar"],
          res["data"]["Name"],
          res["data"]["Mobile"],
          res["data"]["Password"],
      );
      return "us";
    }
    MakeToast(res["error"], context);
  }
  return "no";
}


Future<String> LoginAPI2(String username, String password) async {

  String authx = username.substring(0, 2);
  if(authx.toLowerCase() == "po"){
    Map data = <String, String>{
      "CopId": username,
      "Password" : password,
    };
    var resp = await http.post(Uri.parse(LoginCopUrl),body: data);
    Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
    if(res["error"] == "NULL"){
      SetStringFromSharedPref("Username", username);
      SetStringFromSharedPref("Password", password);
      auth = "po";
      Cop.thisdata(
        res["data"]["CopId"],
        res["data"]["Name"],
        res["data"]["Mobile"],
        res["data"]["Password"],
        res["data"]["Post"],
        res["data"]["StationPosted"],
        res["data"]["City"],
        res["data"]["PostalCode"],
      );
      return "po";
    }
  }
  else if(authx.toLowerCase() == "co"){
    Map data = <String, String>{
      "CourtId": username,
      "Password" : password,
    };
    var resp = await http.post(Uri.parse(LoginCourtUrl),body: data);
    Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
    if(res["error"] == "NULL"){
      SetStringFromSharedPref("Username", username);
      SetStringFromSharedPref("Password", password);
      auth = "co";
      Court.thisdata(
        res["data"]["CourtId"],
        res["data"]["Password"],
        res["data"]["City"],
        res["data"]["Postal Code"],
      );
      return "co";
    }

  }
  else{
    Map data = <String, String>{
      "Adhar": username,
      "Password" : password,
    };
    var resp = await http.post(Uri.parse(LoginUserUrl),body: data);
    Map<dynamic, dynamic> res = await jsonDecode(resp.body.toString());
    if(res["error"] == "NULL"){
      SetStringFromSharedPref("Username", username);
      SetStringFromSharedPref("Password", password);
      auth = "us";
      User.thisdata(
        res["data"]["Adhar"],
        res["data"]["Name"],
        res["data"]["Mobile"],
        res["data"]["Password"],
      );
      return "us";
    }
  }
  return "no";
}