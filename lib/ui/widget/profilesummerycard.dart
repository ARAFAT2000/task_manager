import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSummeryCard extends StatelessWidget {
  const ProfileSummeryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text('Rabbil hasan',style: TextStyle(color: Colors.white),),
      subtitle: Text('abcd@gmail.com',style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white),
      tileColor: Colors.green,
    );
  }
}