import 'package:ecop/API/Auth/RegisterCopAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class RegisterCop extends StatefulWidget {
  @override
  _RegisterCopState createState() => _RegisterCopState();
}

class _RegisterCopState extends State<RegisterCop> {
  TextEditingController CopIdcontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController Mobilecontroller = TextEditingController();
  TextEditingController Postcontroller = TextEditingController();
  TextEditingController StationPostedcontroller = TextEditingController();
  TextEditingController Citycontroller = TextEditingController();
  TextEditingController PostalCodecontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();

  bool errorCopId = false;
  bool errorName = false;
  bool errorMobile = false;
  bool errorPost = false;
  bool errorStationPosted = false;
  bool errorCity = false;
  bool errorPostalCode = false;
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
                    SizedBox(height: 100,),
                    Center(
                      child: Text("Cop Registration",style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Form("Cop Id", CopIdcontroller, errorCopId),
                    SizedBox(height: 20,),
                    Form("Name", Namecontroller, errorName),
                    SizedBox(height: 20,),
                    Form("Mobile", Mobilecontroller, errorMobile),
                    SizedBox(height: 20,),
                    Form("Post", Postcontroller, errorPost),
                    SizedBox(height: 20,),
                    Form("StationPosted", StationPostedcontroller, errorStationPosted),
                    SizedBox(height: 20,),
                    Form("City", Citycontroller, errorCity),
                    SizedBox(height: 20,),
                    Form("PostalCode", PostalCodecontroller, errorPostalCode),
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
                              RegisterCopAPI(
                                  CopIdcontroller.text,
                                  Namecontroller.text,
                                  Mobilecontroller.text,
                                  Postcontroller.text,
                                  StationPostedcontroller.text,
                                  Citycontroller.text,
                                  PostalCodecontroller.text,
                                  Passwordcontroller.text,
                                  context).then((value) {
                                    setState(() {
                                      loading = false;
                                    });
                                    if(value){
                                      MakeToast("Successfully Registered", context);
                                      Navigator.of(context).pop();
                                      Navigator.popAndPushNamed(context, LoginRouteCode);
                                    }
                              });
                            }else setState(() {});
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
                    SizedBox(height: 100,),
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
    if(CopIdcontroller.text.length != 10){
      errorCopId = true;
      MakeToast("Wrong Adhar Number", context);
    }
    else errorCopId = false;

    if(CopIdcontroller.text.substring(0, 2).toLowerCase() == "po"){
      errorCopId = false;
      CopIdcontroller.text.replaceRange(0, 2, "po");
    }
    else errorCopId = true;

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

    if(Postcontroller.text.length < 1) errorPost = true;
    else errorPost = false;

    if(StationPostedcontroller.text.length < 2) errorStationPosted = true;
    else errorStationPosted = false;

    if(PostalCodecontroller.text.length < 2) errorPostalCode = true;
    else errorPostalCode = false;

    if(Citycontroller.text.length < 2) errorCity = true;
    else errorCity = false;

    return (!errorCopId && !errorName && !errorMobile && !errorCity && !errorPost && !errorStationPosted && !errorPostalCode && !errorPassword);

  }

}
