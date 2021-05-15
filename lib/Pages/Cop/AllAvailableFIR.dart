import 'package:ecop/API/Cop/TakingChargeAPI.dart';
import 'package:ecop/Models/FIRModel.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class AllAvailableFIR extends StatefulWidget {
  @override
  _AllAvailableFIRState createState() => _AllAvailableFIRState();
}

class _AllAvailableFIRState extends State<AllAvailableFIR> {
  bool loading = false;
  bool shuffle = false;

  List<String> shuffleList = [
    "Assigned",
    "Unassigned",
    "DELETED",
    "CASE FILED",
    "ALL"
  ];
  List<FIRModel> SortedList = [];

  Widget MyAppBar() {
    if (!shuffle) return Text("All FIR");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shuffleList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              SortedList.clear();
              if (shuffleList[index] == "Assigned") {
                for (FIRModel v in AllRunningFIR) {
                  if (v.CopId != "xxx") SortedList.add(v);
                }
              } else if (shuffleList[index] == "Unassigned") {
                for (FIRModel v in AllRunningFIR) {
                  if (v.CopId == "xxx") SortedList.add(v);
                }
              } else if (shuffleList[index] == "DELETED") {
                for (FIRModel v in AllRunningFIR) {
                  if (v.Status == "DELETED") SortedList.add(v);
                }
              } else if (shuffleList[index] == "CASE FILED") {
                for (FIRModel v in AllRunningFIR) {
                  if (v.Status == "CASE FILED") SortedList.add(v);
                }
              } else if (shuffleList[index] == "ALL") {
                SortedList.addAll(AllRunningFIR);
              }
              setState(() {
                shuffle = !shuffle;
              });
            },

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(child: Text(shuffleList[index])),
              height: 50,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    SortedList.addAll(AllRunningFIR);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  shuffle = !shuffle;
                });
              },
              icon: Icon(
                Icons.sort,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: SortedList.length,
                itemBuilder: (BuildContext ctx, int index) {
                  Color x = Colors.black12;
                  if (SortedList[index].Status == "DELETED")
                    x = Colors.red[200];
                  else if (SortedList[index].Status == "CASE FILED")
                    x = Colors.green[200];
                  return InkWell(
                    onTap: () {
                      if (SortedList[index].CopId == "xxx") {
                        _showMyDialog(SortedList[index].FIRId, Cop.CopId);
                      }
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: x,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          Line("FIR ID", SortedList[index].FIRId),
                          Line("Complaint Holder Name",
                              SortedList[index].ComplaintHolderName),
                          Line("Victim", SortedList[index].Victim),
                          Line("Place", SortedList[index].Place),
                          Line("Date", SortedList[index].Date),
                          Line("Status", SortedList[index].Status),
                          Line(
                              "Assignment",
                              (SortedList[index].CopId == "xxx")
                                  ? "Unassigned"
                                  : SortedList[index].CopId),
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text("Description",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          Text(SortedList[index].Description,
                              style: TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          (loading)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black12,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget Line(String a, String b) {
    return Row(
      children: [
        Text(
          a + ": ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          b,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    );
  }

  Future<void> _showMyDialog(String a, String b) async {
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
                setState(() {
                  loading = true;
                });
                TakingCharge(a, b, context).then((value) {
                  setState(() {
                    loading = false;
                  });
                  if (value) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else
                    Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
