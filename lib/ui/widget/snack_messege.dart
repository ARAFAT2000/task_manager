import 'package:flutter/material.dart';

void ShowsnackMessege(BuildContext context,String messege,[bool isError=false]){
ScaffoldMessenger.of(context).showSnackBar(
SnackBar( content: Text(messege),
backgroundColor: isError?Colors.red:null,
));
}