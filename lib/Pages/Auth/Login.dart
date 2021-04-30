import 'package:ecop/API/Auth/LoginAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String UsernameText;
  String PasswordText;
  TextEditingController UsernameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  bool errorUsername = false;
  bool errorPassword = false;

  bool loading = false;

  @override
  void initState() {
    UsernameController.text = "";
    PasswordController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Width,
            height: Height,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Login",style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Form("AdharCard Number/ID", UsernameController,errorUsername),
                  SizedBox(height: 20,),
                  Form("Password", PasswordController,errorPassword),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: (){
                            if(Validator(context)){
                              setState(() {
                                loading = true;
                              });
                              LoginAPI(UsernameController.text, PasswordController.text, context).then((value) {
                                setState(() {
                                  loading = false;
                                });
                                print(value);
                                if(value == "po") Navigator.popAndPushNamed(context, CopHomeRouteCode);
                                else if(value == "co") Navigator.popAndPushNamed(context, CourtHomeRouteCode);
                                else if(value == "us") Navigator.popAndPushNamed(context, UserHomeRouteCode);
                                else MakeToast("Wrong Credentials", context);
                              });
                            }
                            else setState(() {});
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
                      TextButton(
                        onPressed: (){
                          Navigator.popAndPushNamed(context, RegisterChoiceRouteCode);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Text("Register",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          (loading)?Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black12,
            child: Center(child: CircularProgressIndicator()),
          ):Container(),
        ],
      ),
    );
  }

  Widget Form(String hinttext, TextEditingController what,bool error){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: what,
        decoration: InputDecoration(
          labelText: hinttext,
          errorText: error?"Error":null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          )
        ),
      ),
    );
  }

  bool Validator(BuildContext context){
    if(UsernameController.text.length < 10 || UsernameController.text.length > 12){
      errorUsername = true;
      MakeToast("Incorrect Username", context);
    }
    else errorUsername = false;
    if(PasswordController.text.length < 2){
      errorPassword = true;
    }
    else errorPassword = false;
    return (!errorPassword && !errorUsername);
  }

}
