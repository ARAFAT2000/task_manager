import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Data_caller/network_caller.dart';
import 'package:task_manager/Model/user_model.dart';
import 'package:task_manager/ui/Controller/auth_controller.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/widget/body_background.dart';
import 'package:task_manager/ui/widget/snack_messege.dart';
import '../../Data_caller/Utility/url_all.dart';
import '../../Data_caller/network_response.dart';
import 'forgate_password_screen.dart';
import 'mainbottomNav.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  RxBool _logInprosses = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      Text('Get Started with',style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (String? value){
                          if(value?.trim().isEmpty ?? true ){
                            return 'Enter the email';
                          } return null;
                        },
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,

                        decoration: InputDecoration(
                            hintText: 'Password',
                        ),
                        validator: (String? value){
                          if(value?.isEmpty ?? true ){
                            return 'Enter the password';
                          } return null;
                        },
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _logInprosses == false,
                          replacement: Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                              onPressed: logIn,
                              child: Icon(Icons.arrow_circle_right_outlined)),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Center(child: TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>ForgatePasswordScreen()));
                      },
                          child: Text('Forgot password',style: TextStyle(
                            color: Colors.grey
                          ),)),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?",style: TextStyle(
                              fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w800

                          ),),
                          TextButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>SignUpScreen()));
                          },
                              child: Text('Sign Up')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
    );
  }
  Future<void> logIn()async{
    if(!_globalKey.currentState!.validate()){
      return null;
    }
    _logInprosses =true.obs;
    if(mounted){
      setState(() {
      });
    }
    NetworkResponse response =await NetworkCaller().postRequest(Urls.logUrl,
        body: {
          "email": _emailController.text.trim(),
          "password": _passwordController.text,

        },isLogIn: true );
    _logInprosses = false.obs;
    if(mounted){
      setState(() {
      });
    }
    if(response.isSuccess){
      await AuthController.SaveUserInformation(response.jsonResponse['token'],
          UserModel.fromJson(response.jsonResponse['data']));

      if(mounted){
      Get.to(ButtomNavigator());
      }
    }else{
      if(response.stutusCode == 401){
        if(mounted){
          ShowsnackMessege(context, 'Log in failed ,Try again');
        }else{
          if(mounted){
            ShowsnackMessege(context, 'Log in failed ,Try again');
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
