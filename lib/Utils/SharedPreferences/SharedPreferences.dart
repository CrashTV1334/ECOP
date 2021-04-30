import 'package:shared_preferences/shared_preferences.dart';

Future<String> getStringFromSharedPref(String text) async {
  final prefs = await SharedPreferences.getInstance();
  final startupString = prefs.getString(text);
  if (startupString == null) {
    return "@#";
  }
  return startupString;
}

Future<bool> SetStringFromSharedPref(String code,String text) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(code,text);
  return true;
}