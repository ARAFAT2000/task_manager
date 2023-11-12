import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/pinvarificationscreen.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/widget/body_background.dart';

class ForgatePasswordScreen extends StatefulWidget {
  const ForgatePasswordScreen({super.key});

  @override
  State<ForgatePasswordScreen> createState() => _ForgatePasswordScreenState();
}

class _ForgatePasswordScreenState extends State<ForgatePasswordScreen> {
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
                      Text('Your Email Address',style: Theme.of(context).textTheme.titleLarge),
                      Text('A 6 digit OTP will be send your email',
                          style: TextStyle(
                            fontWeight: FontWeight.w300
                          ),),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(

                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>PinVarificationScreen()));
                        },
                            child: Icon(Icons.arrow_circle_right_outlined)),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>SignUpScreen()));
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
