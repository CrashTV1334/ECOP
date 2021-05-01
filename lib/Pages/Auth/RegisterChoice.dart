import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class RegisterChoice extends StatefulWidget {
  @override
  _RegisterChoiceState createState() => _RegisterChoiceState();
}

class _RegisterChoiceState extends State<RegisterChoice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Width,
        height: Height,
        child: Stack(
          children: [
            Container(
              height: 200,
              child: Center(
                child: Text("RegisterAs",style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Container(
              width: Width,
              height: Height,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          Image.asset("Asset/User.png",width: 80,height: 80,),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, RegisterUserRouteCode);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                child: Text("User",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),)
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("Asset/cop.png",width: 80, height: 80,),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, RegisterCopRouteCode);
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                child: Text("Cop",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                ),)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: (){
                      Navigator.popAndPushNamed(context, LoginRouteCode);
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Text("Login",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
