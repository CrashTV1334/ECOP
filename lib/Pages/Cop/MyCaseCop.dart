import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class MyCaseCop extends StatefulWidget {
  @override
  _MyCaseCopState createState() => _MyCaseCopState();
}

class _MyCaseCopState extends State<MyCaseCop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My All Cases"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: AllRunningCases.length,
            itemBuilder: (BuildContext ctx, int index){
              Color x = Colors.black12;
              if(AllRunningCases[index].Status == "DELETED") x = Colors.red[200];
              else if(AllRunningCases[index].Status == "CLOSED") x = Colors.green[200];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: x,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black,width: 2),
                ),
                child: Column(
                  children: [
                    Line("Case ID", AllRunningCases[index].CaseId),
                    Line("FIR ID", AllRunningCases[index].FIRId),
                    Line("Lawyer", AllRunningCases[index].Lawyer),
                    Line("Prosecutor Assigned", AllRunningCases[index].ProsecutorAssigned),
                    Line("Status", AllRunningCases[index].Status),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  Widget Line(String a, String b){
    return Row(
      children: [
        Text(a + ": ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        Text(b,overflow: TextOverflow.ellipsis,maxLines: 2,),
      ],
    );
  }

}
