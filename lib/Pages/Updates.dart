import 'dart:async';

import 'package:ecop/API/AllUpdates.dart';
import 'package:ecop/API/FIRFromCaseIdAPI.dart';
import 'package:ecop/API/SendUpdate.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  bool send;
  String caseId;
  Updates(this.send, this.caseId);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {

  TextEditingController controller = TextEditingController();
  bool errorController = false;
  Timer time;
  bool loading = false;

  @override
  void initState() {
    time = new Timer.periodic(Duration(seconds: 10), (val){
      AllUpdates(context).then((value){
        if(this.mounted) setState(() {});
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updates"),
        actions: [
          InkWell(
            onTap: () async {
              setState(() {
                loading = true;
              });
              await FIRFromCaseId(widget.caseId, context).then((value) {
                if(value) Navigator.pushNamed(context, ViewFIRRouteCode);
              });
              if(this.mounted){
                setState(() {
                  loading = false;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
                child: Center(child: Text("View FIR",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),))
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: MyChat.length+1,
                        itemBuilder: (BuildContext ctx, int index){
                          String x = "";
                          if(index == MyChat.length) return SizedBox(height: 150,);
                          Color y = Colors.black12;
                          if(MyChat[index].Whom == "us" && index != MyChat.length) x = "User";
                          else if(MyChat[index].Whom == "po" && index != MyChat.length){ x = "Cop"; y = Colors.red[200];}
                          else if(MyChat[index].Whom == "co" && index != MyChat.length){ x = "Court"; y = Colors.green[200];}
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              color: y,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black,width: 2),
                            ),
                            child: Column(
                              children: [
                                Line("Whom", x),
                                Line("Update", MyChat[index].Update),
                                Line("Time", MyChat[index].DAT),
                                SizedBox(height: 5,),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Visibility(
                    visible: widget.send,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width-80,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                                contentPadding:
                                EdgeInsets.only(bottom: 10, left: 10, right: 10),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              if(Validate()){
                                setState(() {
                                  loading = true;
                                });
                                SendUpdate(controller.text, context).then((value){
                                  AllUpdates(context).then((value){
                                    setState(() {
                                      controller.text = "";
                                      loading = false;
                                    });
                                  });
                                });
                              }else MakeToast("Write Something First", context);
                            },
                            child: Icon(Icons.send),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
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

  Widget Line(String a, String b){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(a + ": ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        Expanded(child: Text(b)),
      ],
    );
  }

  bool Validate(){
    return controller.text.isNotEmpty;
  }
}
