import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String UserLoggedInKey = "UserLoggedInKey";

  static saveUserLoggedIn({@required bool isLoggedIn}) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(UserLoggedInKey,isLoggedIn);
  }

  static Future<bool> getUserLoggedInDetails() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(UserLoggedInKey);
  }
}