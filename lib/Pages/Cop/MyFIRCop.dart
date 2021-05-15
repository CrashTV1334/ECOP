import 'package:ecop/API/Cop/DeleteFIRAPI.dart';
import 'package:ecop/Pages/Cop/OpenCase.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class MyFIRCop extends StatefulWidget {
  @override
  _MyFIRCopState createState() => _MyFIRCopState();
}

class _MyFIRCopState extends State<MyFIRCop> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My All FIR"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: AllRunningFIR.length,
                itemBuilder: (BuildContext ctx, int index){
                  Color x = Colors.black12;
                  if(AllRunningFIR[index].Status == "DELETED") x = Colors.red[200];
                  else if(AllRunningFIR[index].Status == "CASE FILED") x = Colors.green[200];

                  return InkWell(
                    onTap: (){
                      if(AllRunningFIR[index].Status != "DELETED" && AllRunningFIR[index].Status != "CASE OPEN"){
                        _showMyDialog(AllRunningFIR[index].FIRId,AllRunningFIR[index].UserId);
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

  Future<void> _showMyDialog(String a, String b) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('What to do with FIR?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('What to do with FIR?'),
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
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  loading = true;
                });
                DeleteFIRAPI(a,context).then((value){
                  setState(() {
                    loading = false;
                  });
                  Navigator.of(context).pop();
                  if(value) Navigator.of(context).pop();
                });
              },
            ),
            TextButton(
              child: Text('Open Case'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpenCase(a, b)),
                );
              },
            ),
          ],
        );
      },
    );
  }

}
