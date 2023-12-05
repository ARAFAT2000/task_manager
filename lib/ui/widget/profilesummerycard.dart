import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/Controller/auth_controller.dart';
import 'package:task_manager/ui/screen/login_screen.dart';

import '../bottomnavigate/editprofile_screen.dart';

class ProfileSummeryCard extends StatefulWidget {
  const ProfileSummeryCard({ this.enableTap=true,
    super.key,
  });
final bool enableTap;

  @override
  State<ProfileSummeryCard> createState() => _ProfileSummeryCardState();
}

class _ProfileSummeryCardState extends State<ProfileSummeryCard> {

  Uint8List imageBytes =  Base64Decoder().convert(AuthController.user?.photo?? '');

  @override
  Widget build(BuildContext context) {


    return  ListTile(
      onTap: (){
        if(widget.enableTap){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> EditProfileScreen()));
        }

      },
      leading: CircleAvatar(
        child: AuthController.user?.photo == null?
        Icon(Icons.person):
            ClipRRect(
                borderRadius: BorderRadius.circular(40),

                child: Image.memory(imageBytes,fit:BoxFit.cover,))
      ),
      title: Text(fullName,style: TextStyle(color: Colors.white),),
      subtitle: Text(email,style: TextStyle(color: Colors.white)),
      trailing: IconButton(onPressed:(){
        if(mounted){
          setState(() {

          });
        }
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context)=> LogInScreen()), (route) => false);
      },
          icon: Icon(Icons.logout_outlined)),
      tileColor: Colors.green,
    );
  }
  String get fullName{
    return (AuthController.user?.firstName??'') + '  ' +  (AuthController.user?.lastName??'');
  }
  String get email{
    return (AuthController.user?.email??'');
  }
}