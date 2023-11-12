import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/pinvarificationscreen.dart';
import 'package:task_manager/ui/widget/body_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                      Text('Set Password',style: Theme.of(context).textTheme.titleLarge),
                      Text('Minimun password should be more than 6 letters',
                        style: TextStyle(
                            fontWeight: FontWeight.w300
                        ),),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Conferm Password',
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(

                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>PinVarificationScreen()));
                        },
                            child: Text('Conferm')),
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
