import 'package:ecop/API/Cop/TakingChargeAPI.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class AllAvailableFIR extends StatefulWidget {
  @override
  _AllAvailableFIRState createState() => _AllAvailableFIRState();
}

class _AllAvailableFIRState extends State<AllAvailableFIR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All FIR"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: AllRunningFIR.length,
            itemBuilder: (BuildContext ctx, int index){
              Color x = Colors.black12;
              if(AllRunningFIR[index].Status == "DELETED") x = Colors.red[200];
              else if(AllRunningFIR[index].Status == "CASE OPEN") x = Colors.green[200];
              return InkWell(
                onTap: (){
                  if(AllRunningFIR[index].CopId == "xxx"){
                    _showMyDialog(AllRunningFIR[index].FIRId,Cop.CopId);
                  }
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
                      Line("FIR ID", AllRunningFIR[index].FIRId),
                      Line("Complaint Holder Name", AllRunningFIR[index].ComplaintHolderName),
                      Line("Victim", AllRunningFIR[index].Victim),
                      Line("Place", AllRunningFIR[index].Place),
                      Line("Date", AllRunningFIR[index].Date),
                      Line("Status", AllRunningFIR[index].Status),
                      Line("Assignment", (AllRunningFIR[index].CopId == "xxx")?"Unassigned":"Assigned"),
                      SizedBox(height: 5,),
                      Center(
                        child: Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ),
                      Text(AllRunningFIR[index].Description,style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic)),
                    ],
                  ),
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

  Future<void> _showMyDialog(String a,String b) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Self Assignment'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want To take Charge of this FIR?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                TakingCharge(a,b,context).then((value){
                  if(value){
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                  else Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }

}
