import 'package:ecop/API/User/NewFIRAPI.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class NewFIR extends StatefulWidget {
  @override
  _NewFIRState createState() => _NewFIRState();
}

class _NewFIRState extends State<NewFIR> {

  TextEditingController ComplaintHolderNameController = TextEditingController();
  TextEditingController VictimController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController PlaceController = TextEditingController();
  TextEditingController ContactInfoController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();

  bool errorComplaintHolderName = false;
  bool errorVictim = false;
  bool errorDate = false;
  bool errorPlace = false;
  bool errorContactInfo = false;
  bool errorDescription = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New FIR"),
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
                  SizedBox(height: 20.0,),
                  Form("Complaint Holder Name", ComplaintHolderNameController, errorComplaintHolderName,1),
                  SizedBox(height: 20.0,),
                  Form("Victim", VictimController, errorVictim,1),
                  SizedBox(height: 20.0,),
                  Form("Date of Incident", DateController, errorDate,1),
                  SizedBox(height: 20.0,),
                  Form("Place of Incident", PlaceController, errorPlace,1),
                  SizedBox(height: 20.0,),
                  Form("Contact Info", ContactInfoController, errorContactInfo,1),
                  SizedBox(height: 20.0,),
                  Form("Detailed Description", DescriptionController, errorDescription,10),
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: (){
                      if(Validate()){
                        setState(() {
                          loading = false;
                        });
                        NewFIRAPI(ComplaintHolderNameController.text, VictimController.text, DateController.text,
                            PlaceController.text, ContactInfoController.text, DescriptionController.text,context).then((value) {
                              if(value){
                                setState(() {
                                  loading = false;
                                });
                                MakeToast("successfully Registered FIR", context);
                                Navigator.of(context).pop();
                              }
                              if(this.mounted) setState(() {
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
                        child: Text("Add New FIR",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)
                    ),
                  ),
                  SizedBox(height: 30,),
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

  Widget Form(String hinttext, TextEditingController what,bool error,int lines){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: what,
        maxLines: lines,
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
    if(ComplaintHolderNameController.text.isNotEmpty) errorComplaintHolderName = false;
    else errorComplaintHolderName = true;

    if(VictimController.text.isNotEmpty) errorVictim = false;
    else errorVictim = true;

    if(DateController.text.isNotEmpty) errorDate = false;
    else errorDate = true;

    if(PlaceController.text.isNotEmpty) errorPlace = false;
    else errorPlace = true;

    if(ContactInfoController.text.isNotEmpty) errorContactInfo = false;
    else errorContactInfo = true;

    if(DescriptionController.text.isNotEmpty) errorDescription = false;
    else errorDescription = true;

    return (
        !errorComplaintHolderName &&
        !errorVictim &&
        !errorDate &&
        !errorPlace &&
        !errorContactInfo &&
        !errorDescription
    );

  }

}
