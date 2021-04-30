import 'package:ecop/Models/CaseModel.dart';
import 'package:ecop/Models/CopModel.dart';
import 'package:ecop/Models/CourtModel.dart';
import 'package:ecop/Models/FIRModel.dart';
import 'package:ecop/Models/UserModel.dart';
import 'package:ecop/Models/chat.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

double Height = 100;
double Width = 100;
int SplashTimer = 5;
Color BackgroundColor = Colors.grey[900];
String auth = "none";
UserModel User = UserModel();
CopModel Cop = CopModel();
CourtModel Court = CourtModel();
List<FIRModel> AllRunningFIR = [];
List<CaseModel> AllRunningCases = [];
List<chatModel> MyChat = [];
FIRModel thisFIR = FIRModel();
String updateindex;

void MakeToast(String msg,BuildContext context){
  Toast.show(msg, context,duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}