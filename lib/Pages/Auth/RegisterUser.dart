import 'package:ecop/API/Auth/RegisterUserAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  TextEditingController Adharcontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController Mobilecontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();

  bool errorAdhar = false;
  bool errorName = false;
  bool errorMobile = false;
  bool errorPassword = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Width,
            height: Height,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("User Registration",style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Form("AdharCard Number", Adharcontroller, errorAdhar),
                    SizedBox(height: 20,),
                    Form("Name", Namecontroller, errorName),
                    SizedBox(height: 20,),
                    Form("Mobile", Mobilecontroller, errorMobile),
                    SizedBox(height: 20,),
                    Form("Create Password", Passwordcontroller, errorPassword),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: (){
                            if(validate()){
                              setState(() {
                                loading = true;
                              });
                              RegisterUserAPI(Adharcontroller.text, Namecontroller.text, Mobilecontroller.text, Passwordcontroller.text, context).then((value) {
                                setState(() {
                                  loading = false;
                                });
                                if(value){
                                  MakeToast("Successfully Registered", context);
                                  Navigator.of(context).pop();
                                  Navigator.popAndPushNamed(context, LoginRouteCode);
                                }
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
                              child: Text("Register",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),)
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
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
                  ],
                ),
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

  bool validate(){
    if(Adharcontroller.text.length != 12){
      errorAdhar = true;
      MakeToast("Wrong Adhar Number", context);
    }
    else errorAdhar = false;

    if(Namecontroller.text.length < 2){
      errorName = true;
    }
    else errorName = false;

    if(Mobilecontroller.text.length != 10){
      errorMobile = true;
    }
    else errorMobile = false;

    if(Passwordcontroller.text.length < 2){
      errorPassword = true;
    }
    else errorPassword = false;

    return (!errorAdhar && !errorName && !errorMobile && !errorPassword);

  }

}
