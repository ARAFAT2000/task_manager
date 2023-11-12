import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widget/body_background.dart';

import 'forgate_password_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      Text('Join With Us',style: Theme.of(context).textTheme.titleLarge),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(

                          hintText: 'Mobile Number',
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 15,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){},
                            child: Icon(Icons.arrow_circle_right_outlined)),
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
            ))
    );
  }
}
