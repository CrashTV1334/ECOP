import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class AllFIR extends StatefulWidget {
  @override
  _AllFIRState createState() => _AllFIRState();
}

class _AllFIRState extends State<AllFIR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIR"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: AllRunningFIR.length,
            itemBuilder: (BuildContext ctx, int index){

              Color x = Colors.black12;
              if(AllRunningFIR[index].Status == "DELETED") x = Colors.red[200];
              else if(AllRunningFIR[index].Status == "CASE FILED") x = Colors.green[200];

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
                   Line("FIR ID", AllRunningFIR[index].FIRId),
                   Line("Complaint Holder Name", AllRunningFIR[index].ComplaintHolderName),
                   Line("Victim", AllRunningFIR[index].Victim),
                   Line("Place", AllRunningFIR[index].Place),
                   Line("Date", AllRunningFIR[index].Date),
                   Line("Status", AllRunningFIR[index].Status),
                    SizedBox(height: 5,),
                    Center(
                      child: Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                    ),
                    Text(AllRunningFIR[index].Description,style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic)),
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
