import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class ViewFIR extends StatefulWidget {
  @override
  _ViewFIRState createState() => _ViewFIRState();
}

class _ViewFIRState extends State<ViewFIR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIR"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20,),
              Line("FIR ID", thisFIR.FIRId),
              Line("Complaint Holder Name", thisFIR.ComplaintHolderName),
              Line("Victim", thisFIR.Victim),
              Line("Place", thisFIR.Place),
              Line("Date", thisFIR.Date),
              Line("Description", thisFIR.Description),
              Line("Contact Info", thisFIR.ContactInfo),
              Line("Cop", thisFIR.CopId),
              Line("Status", thisFIR.Status),
              SizedBox(height: 20,),
            ],
          ),
        ),
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
