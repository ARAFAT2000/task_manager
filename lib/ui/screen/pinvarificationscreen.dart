import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screen/setpasswordscreen.dart';
import 'package:task_manager/ui/widget/body_background.dart';

import 'login_screen.dart';

class PinVarificationScreen extends StatefulWidget {
  const PinVarificationScreen({super.key});

  @override
  State<PinVarificationScreen> createState() => _PinVarificationScreenState();
}

class _PinVarificationScreenState extends State<PinVarificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BodyBackground(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      Text('Pin Varification',style: Theme.of(context).textTheme.titleLarge),
                      Text('A 6 digit OTP will be send your email',
                        style: TextStyle(
                            fontWeight: FontWeight.w300
                        ),),
                      SizedBox(height: 20,),
                      PinCodeTextField(
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          activeColor: Colors.green,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white
                        ),
                        animationDuration: Duration(milliseconds: 300),

                        enableActiveFill: true,
                       
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                         
                        },
                        beforeTextPaste: (text) {
                          
                          return true;
                        }, appContext: context,
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>SetPasswordScreen()));
                        },
                            child: Text('Varify')),
                      ),
                      SizedBox(height: 40,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have an account ?",style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                              fontWeight: FontWeight.w800

                          ),),
                          TextButton(onPressed: (){
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context)=>LogInScreen()),
                                    (route) => false);
                          },
                              child: Text('Sign In')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ))
    );
  }
}


