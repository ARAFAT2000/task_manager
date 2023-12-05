import 'package:flutter/material.dart';
import 'package:task_manager/Data_caller/Utility/url_all.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widget/body_background.dart';
import 'package:task_manager/ui/widget/snack_messege.dart';

import '../../Data_caller/network_caller.dart';
import '../../Data_caller/network_response.dart';
import 'forgate_password_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController =TextEditingController();
  TextEditingController _firstNameController =TextEditingController();
  TextEditingController _secondNameController =TextEditingController();
  TextEditingController _mobileController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  final GlobalKey<FormState>_globalKey= GlobalKey<FormState>();
  bool _inSignUpProgress =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyBackground(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Form(
                    key:_globalKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Text('Join With Us',style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (String?value){
                            if(value?.trim().isEmpty??true){
                              return 'Enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller:_firstNameController,
                          keyboardType: TextInputType.text,

                          decoration: InputDecoration(
                            hintText: 'First Name',
                          ),

                          //todo validator
                          validator: (String?value){
                            if(value?.trim().isEmpty??true){
                              return 'Enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: _secondNameController,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                          ),
                          validator: (String?value){
                            if(value?.trim().isEmpty??true){
                              return 'Enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.text,

                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                          ),
                          validator: (String?value){
                            if(value?.trim().isEmpty??true){
                              return 'Enter your mobile Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (String?value){
                            if(value?.isEmpty??true){
                              return 'Enter your password';
                            }
                            if(value!.length<6){
                              return 'Enter password more than 6 letters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15,),
                        SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: _inSignUpProgress == false,
                            replacement: Center(child: CircularProgressIndicator(),),
                            child: ElevatedButton(
                                onPressed: (){
                                  _signUp();
                            },
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
                            Text("Have an account ?",style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.w800

                            ),),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>LogInScreen()));
                            },
                                child: Text('Sign In')),
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
  Future<void>_signUp()async{
    if(_globalKey.currentState!.validate()){
      _inSignUpProgress= true;
      if(mounted){
        setState(() {

        });
      }
      final NetworkResponse response = await
      NetworkCaller().postRequest(Urls.regUrl,
          body: {
            "email":_emailController.text.trim(),
            "firstName":_firstNameController.text.trim(),
            "lastName":_secondNameController.text.trim(),
            "mobile":_mobileController.text.trim(),
            "password":_passwordController.text,
          });
      _inSignUpProgress= false;
      if(mounted){
        setState(() {

        });
      }
      if(response.isSuccess){

        if(mounted)
          ShowsnackMessege(context, 'Account Created Successfully,Please log in');
      }
      else{
        if(mounted)
          _clearTextField();
        ShowsnackMessege(context, 'Wrong ? Please try again ');
      }

    }
  }
  void _clearTextField(){
    _emailController.clear();
    _firstNameController.clear();
    _secondNameController.clear();
    _passwordController.clear();
    _mobileController.clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();

  }
}
