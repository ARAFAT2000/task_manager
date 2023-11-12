import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/signup_screen.dart';
import 'package:task_manager/ui/widget/body_background.dart';

import 'forgate_password_screen.dart';
import 'mainbottomNav.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                    Text('Get Started with',style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
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
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>ButtomNavigator()));
                      },
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
          ))
    );
  }
}
