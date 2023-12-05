import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/widget/body_background.dart';

import '../Controller/auth_controller.dart';
import 'mainbottomNav.dart';

class SplassScreen extends StatefulWidget {
  const SplassScreen({super.key});

  @override
  State<SplassScreen> createState() => _SplassScreenState();
}
class _SplassScreenState extends State<SplassScreen> {
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    gotologin();
  }


  Future<void> gotologin() async {
   final bool isLoggedIn = await AuthController.CheckAuthState();
    Future.delayed(const Duration(seconds:3)).then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=> isLoggedIn? const ButtomNavigator ():LogInScreen()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: BodyBackground(
           child: Center(child: SvgPicture.asset('assets/images/logo.svg',width: 120,fit: BoxFit.scaleDown,)),),
     )
    );
  }
}
