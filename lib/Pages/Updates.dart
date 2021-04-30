import 'package:ecop/API/AllUpdates.dart';
import 'package:ecop/API/SendUpdate.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class Updates extends StatefulWidget {
  bool send;
  Updates(this.send);

  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {

  TextEditingController controller = TextEditingController();
  bool errorController = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updates"),
      ),
      body: Container(
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

                      if(MyChat[index].Whom == "us" && index != MyChat.length) x = "User";
                      else if(MyChat[index].Whom == "po" && index != MyChat.length) x = "Cop";
                      else if(MyChat[index].Whom == "co" && index != MyChat.length) x = "Court";
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black12,
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
                            SendUpdate(controller.text, context).then((value){
                              AllUpdates(context).then((value){
                                setState(() {
                                  controller.text = "";
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
