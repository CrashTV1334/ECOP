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
              if(myAuth == "po") Navigator.popAndPushNamed(context, CopHomeRouteCode);
              else if(myAuth == "co") Navigator.popAndPushNamed(context, CourtHomeRouteCode);
              else if(myAuth == "us") Navigator.popAndPushNamed(context, UserHomeRouteCode);
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
        color: Colors.grey,
        width: Width,
        height: Height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("Asset/splash.png"),
              SizedBox(height: 20,),
              Text("Ecop",style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                decoration: TextDecoration.underline
              ),),
              Text("Online Portal of Complaints",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
