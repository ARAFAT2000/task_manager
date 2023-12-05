
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/ui/Controller/auth_controller.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'network_response.dart';

class NetworkCaller{
  Future<NetworkResponse> postRequest(String url,{Map<String ,dynamic>? body , bool isLogIn = false})async{
    try{
  log(url);
  log(body.toString());
      final Response response = await post(Uri.parse(url),
          body:jsonEncode(body),
          headers:{
            "Content-type": "application/json",
            'token' : AuthController.token.toString()
          });
   log(response.statusCode.toString());
  log(response.body.toString());
      if(response.statusCode==200){
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            stutusCode: 200);
      } else if (response.statusCode == 401){
        if(isLogIn == false){
          BackToLogIn();
        }

        return NetworkResponse(
            isSuccess: false,
            jsonResponse: jsonDecode(response.body),
            stutusCode: 200
        );
      }

      else{
        return NetworkResponse(
            isSuccess: false,
            jsonResponse: jsonDecode(response.body),
            stutusCode: 200
        );
      }
    }
    catch(e){
      return NetworkResponse(
          isSuccess: false,
        errorMessege: e.toString()
      );
    }
  }

  Future<NetworkResponse> getRequest(String url)async{
    try{
      log(url);

      final Response response = await get(Uri.parse(url),

          headers:{
            "Content-type": "application/json",
            'token' : AuthController.token.toString()
          });
      log(response.statusCode.toString());
      log(response.body.toString());
      if(response.statusCode==200){
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            stutusCode: 200);
      } else if (response.statusCode == 401){
          BackToLogIn();
        return NetworkResponse(
            isSuccess: false,
            jsonResponse: jsonDecode(response.body),

        );
      }

      else{
        return NetworkResponse(
            isSuccess: false,
            jsonResponse: jsonDecode(response.body),
            stutusCode: 200
        );
      }
    }
    catch(e){
      return NetworkResponse(
          isSuccess: false,
          errorMessege: e.toString()
      );
    }
  }

  Future<void> BackToLogIn()async{
    await AuthController.ClearAuthData();
    Navigator.pushAndRemoveUntil(
       TodoManagerApp.navigationKey.currentContext! ,
        MaterialPageRoute(builder: (context)=> const LogInScreen()), (route) => false);
  }
}
