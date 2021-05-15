import 'package:ecop/API/Court/MyAllCasesCourtAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/SharedPreferences/SharedPreferences.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class CourtHome extends StatefulWidget {
  @override
  _CourtHomeState createState() => _CourtHomeState();
}

class _CourtHomeState extends State<CourtHome> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_balance_rounded),
        title: Center(child: Text("Court")),
        actions: [
          IconButton(onPressed: (){
            SetStringFromSharedPref("Username", "@#");
            SetStringFromSharedPref("Password", "@#");
            Navigator.popAndPushNamed(context, LoginRouteCode);
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Stack(
        children: [
          Container(
              width: Width,
              height: Height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Line("Court Id", Court.CourtId),
                  Line("City", Court.City),
                  Line("Postal Code", Court.PostalCode),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        loading = true;
                      });
                      MyAllCasesCourtAPI().then((value) {
                        if(value){
                          setState(() {
                            loading = false;
                          });
                          Navigator.pushNamed(context, MyAllCasesCourtRouteCode);
                        }else MakeToast("Error Try Again", context);
                        if(this.mounted)setState(() {
                          loading = false;
                        });
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.all_inbox,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("My All Cases",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),),
                          ],
                        )
                    ),
                  ),
                ],
              )
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

  Widget Line(String a, String b){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(a + ": ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Text(b,style: TextStyle(fontSize: 20),)
      ],
    );
  }
}
