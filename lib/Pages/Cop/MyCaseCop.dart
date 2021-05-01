import 'package:ecop/API/AllUpdates.dart';
import 'package:ecop/API/FindUpdateIndex.dart';
import 'package:ecop/Pages/Updates.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class MyCaseCop extends StatefulWidget {
  @override
  _MyCaseCopState createState() => _MyCaseCopState();
}

class _MyCaseCopState extends State<MyCaseCop> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My All Cases"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: AllRunningCases.length,
                itemBuilder: (BuildContext ctx, int index){
                  Color x = Colors.black12;
                  if(AllRunningCases[index].Status == "DELETED") x = Colors.red[200];
                  else if(AllRunningCases[index].Status == "CLOSED") x = Colors.green[200];
                  return InkWell(
                    onTap: (){
                      setState(() {
                        loading = true;
                      });
                      FindUpdateIndex(AllRunningCases[index].CaseId, context).then((value){
                        if(value){
                          AllUpdates(context).then((value){
                            setState(() {
                              loading = false;
                            });
                            bool send = false;
                            if(AllRunningCases[index].Status == "OPEN") send = true;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Updates(send,AllRunningCases[index].CaseId)));
                          });
                        }else setState(() {
                          loading = false;
                        });
                      });
                    },
                    child: Container(
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
                    ),
                  );
                }
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
      children: [
        Text(a + ": ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        Text(b,overflow: TextOverflow.ellipsis,maxLines: 2,),
      ],
    );
  }

}
