import 'dart:convert';

import 'package:ecop/API/Secrets.dart';
import 'package:ecop/Models/FIRModel.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:http/http.dart' as http;

Future<bool> AllFIRCopAPI() async {

  var response = await http.post(Uri.parse(ReturnAllFIRUrl));
  Map<dynamic, dynamic> res = await jsonDecode(response.body.toString());
  AllRunningFIR.clear();
  for(var fir in res["data"]){
    FIRModel newfir = new FIRModel();
    newfir.FIRId = fir["FirId"];
    newfir.ComplaintHolderName = fir["ComplaintHolderName"];
    newfir.Victim = fir["Victim"];
    newfir.Date = fir["Date"];
    newfir.Place = fir["Place"];
    newfir.UserId = fir["UserId"];
    newfir.CopId = fir["CopId"];
    newfir.ContactInfo = fir["ContactInfo"];
    newfir.Status = fir["Status"];
    newfir.Description = fir["Description"];
    AllRunningFIR.add(newfir);
  }

  return true;
}