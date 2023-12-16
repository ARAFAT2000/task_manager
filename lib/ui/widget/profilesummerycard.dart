import 'dart:convert';
import 'dart:typed_data';
import 'dart:developer';

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


  Widget _buildUserImage(String? imageBytes) {
    try {
      if (imageBytes != null) {
        Uint8List imageBytess = const Base64Decoder().convert(imageBytes.replaceAll('data:image/png;base64,',''));
        return Image.memory(
          imageBytess,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        );
      }
    } catch (e) {
      log('Error loading user image: $e');
    }
    // Return a default image or placeholder if an error occurs
    return const CircleAvatar(
      child: Icon(Icons.error),
    );
  }

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

                child:_buildUserImage(AuthController.user?.photo?? '')),

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