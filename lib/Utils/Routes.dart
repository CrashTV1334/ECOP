import 'package:ecop/Pages/Auth/Login.dart';
import 'package:ecop/Pages/Auth/RegisterChoice.dart';
import 'package:ecop/Pages/Auth/RegisterCop.dart';
import 'package:ecop/Pages/Auth/RegisterUser.dart';
import 'package:ecop/Pages/Cop/AllAvailableFIR.dart';
import 'package:ecop/Pages/Cop/CopHome.dart';
import 'package:ecop/Pages/Cop/MyCaseCop.dart';
import 'package:ecop/Pages/Cop/MyFIRCop.dart';
import 'package:ecop/Pages/Cop/OpenCase.dart';
import 'package:ecop/Pages/Court/CourtHome.dart';
import 'package:ecop/Pages/Court/MyAllCasesCourt.dart';
import 'package:ecop/Pages/SplashScreen.dart';
import 'package:ecop/Pages/User/AllCases.dart';
import 'package:ecop/Pages/User/AllFIR.dart';
import 'package:ecop/Pages/User/NewFIR.dart';
import 'package:ecop/Pages/User/UserHome.dart';
import 'package:ecop/Pages/ViewFIR.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:flutter/material.dart';

var routes = <String,WidgetBuilder>{
  SplashRouteCode : (BuildContext context) => SplashScreen(),
  LoginRouteCode : (BuildContext context) => Login(),
  RegisterCopRouteCode : (BuildContext context) => RegisterCop(),
  RegisterUserRouteCode : (BuildContext context) => RegisterUser(),
  RegisterChoiceRouteCode : (BuildContext context) => RegisterChoice(),
  UserHomeRouteCode : (BuildContext context) => UserHome(),
  CopHomeRouteCode : (BuildContext context) => CopHome(),
  CourtHomeRouteCode : (BuildContext context) => CourtHome(),
  AllFIRUserRouteCode : (BuildContext context) => AllFIR(),
  NewFIRRouteCode : (BuildContext context) => NewFIR(),
  AllCasesUserRouteCode : (BuildContext context) => AllCases(),
  AllAvailableFIRRouteCode : (BuildContext context) => AllAvailableFIR(),
  MyAllFIRCopRouteCode : (BuildContext context) => MyFIRCop(),
  MyAllCasesCopRouteCode : (BuildContext context) => MyCaseCop(),
  MyAllCasesCourtRouteCode : (BuildContext context) => MyAllCasesCourt(),
  ViewFIRRouteCode : (BuildContext context) => ViewFIR(),
};