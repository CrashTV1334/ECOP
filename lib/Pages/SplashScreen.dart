import 'dart:async';
import 'package:ecop/API/Auth/LoginAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/SharedPreferences/SharedPreferences.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: SplashTimer), () async {
      getStringFromSharedPref("Username").then((username){
        if(username != "@#"){
          getStringFromSharedPref("Password").then((password) async {
            if(password != "@#"){
              String myAuth = await LoginAPI2(username, password);
              print(myAuth);
            }
            else Navigator.popAndPushNamed(context, LoginRouteCode);
          });
        }
        else Navigator.popAndPushNamed(context, LoginRouteCode);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Width = MediaQuery.of(context).size.width;
    Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: BackgroundColor,
        width: Width,
        height: Height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Ecop",style: TextStyle(
                color: Colors.grey,
                fontSize: 40,
                decoration: TextDecoration.underline
              ),),
              Text("Online Portal of Complaints",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
