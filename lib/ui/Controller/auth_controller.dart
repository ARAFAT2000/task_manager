 import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user_model.dart';

class AuthController{
  static String ? token;
  static UserModel ? user;
   static Future<void> SaveUserInformation(String t , UserModel model)async{
    final SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.setString('token', t);
    await prefs.setString('user', jsonEncode(model.toJson()));
    token =t;
     user= model;
  }
  static Future<void>UserInitializeUserCache()async{
     SharedPreferences prefs= await SharedPreferences.getInstance();
    token = prefs.getString('token');
   user = UserModel.fromJson (jsonDecode((prefs.getString('token')?? '{}')));
  }
  static Future<bool> CheckAuthState()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token =prefs.getString('token');
    if(token  != null){
      await UserInitializeUserCache();
      return true;
    }
    return false;
  }

  static Future<void>ClearAuthData()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    await prefs.clear();
        token =null;

  }
 }