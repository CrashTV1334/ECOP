import 'package:ecop/API/Cop/OpenCaseAPI.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class OpenCase extends StatefulWidget {
  String firid;
  String userid;
  OpenCase(this.firid,this.userid);

  @override
  _OpenCaseState createState() => _OpenCaseState();
}

class _OpenCaseState extends State<OpenCase> {

  TextEditingController CourtidController = TextEditingController();
  TextEditingController LawyerController = TextEditingController();
  TextEditingController PAController = TextEditingController();

  bool errorCourtid = false;
  bool errorLawyer = false;
  bool errorPA = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open case"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Form("Court Id", CourtidController, errorCourtid),
                  SizedBox(height: 20,),
                  Form("Lawyer", LawyerController, errorLawyer),
                  SizedBox(height: 20,),
                  Form("Prosecutor Assigned", PAController, errorPA),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: (){
                      if(Validate()){
                        setState(() {
                          loading = true;
                        });
                        OpenCaseAPI(widget.firid, Cop.CopId, CourtidController.text, widget.userid,
                            LawyerController.text, PAController.text, context).then((value) {
                              if(value){
                                setState(() {
                                  loading = false;
                                });
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              }
                              if(this.mounted)setState(() {
                                loading = false;
                              });
                        });
                      }else setState(() {
                        loading = false;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Text("Open Case",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)
                    ),
                  ),
                  SizedBox(height: 20,),
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

  bool Validate(){
    if(CourtidController.text.isNotEmpty) errorCourtid = false;
    else errorCourtid = true;

    if(LawyerController.text.isNotEmpty) errorLawyer = false;
    else errorLawyer = true;

    if(PAController.text.isNotEmpty) errorPA = false;
    else errorPA = true;

    return (
        !errorCourtid &&
        !errorLawyer &&
        !errorPA
    );
  }

}
