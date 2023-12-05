import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/Data_caller/network_caller.dart';
import 'package:task_manager/Data_caller/network_response.dart';
import 'package:task_manager/Model/user_model.dart';
import 'package:task_manager/ui/Controller/auth_controller.dart';
import 'package:task_manager/ui/widget/body_background.dart';

import '../../Data_caller/Utility/url_all.dart';

import '../widget/profilesummerycard.dart';
import '../widget/snack_messege.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailController= TextEditingController();
  TextEditingController firstnameController= TextEditingController();
  TextEditingController lastnameController= TextEditingController();
  TextEditingController mobileController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  bool updateProfileProgress= false;
  XFile? photo;



 // GlobalKey<FormState> _globalKey= GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = AuthController.user!.email??'';
    firstnameController.text = AuthController.user!.firstName??'';
    lastnameController.text = AuthController.user!.lastName??'';
    mobileController.text = AuthController.user!.mobile??'';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: [
              ProfileSummeryCard(
                enableTap: false,
              ),
              Expanded(child: BodyBackground(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Text('Update Profile',style:  Theme.of(context).textTheme.titleLarge,),
                        SizedBox(height: 16,),
                       Container(
                         height: 50,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(8)
                         ),
                         child: Row(
                           children: [
                             Expanded(
                                 flex:1,
                                 child: Container(
                                   decoration: BoxDecoration(
                                       color: Colors.grey,
                                       borderRadius: BorderRadius.only(
                                         bottomLeft: Radius.circular(8),
                                         topLeft: Radius.circular(8),
                                       ),

                                   ),
                                   alignment: Alignment.center,
                                   child: Text('Photos',style: TextStyle(color: Colors.white),),

                                 )),
                             Expanded(
                                 flex:3,
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 16),
                                   child: InkWell(
                                     onTap: ()async{
                                  final XFile?
                                  images = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50);
                                    if(images!= null){
                                      photo= images;
                                      if(mounted){
                                        setState(() {

                                        });
                                      }
                                    }
                                     },
                                     child: Container(
                                       child: Visibility(
                                         visible: photo == null,
                                           replacement:Text(photo ?.name?? '') ,
                                           child: Text(' Take a Picture')),
                                     ),
                                   ),
                                 )),
                           ],
                         ),
                       ),
                        SizedBox(height: 8,),
                       Container(
                         child: Form(
                         //  key: _globalKey,
                           child: Column(
                             children: [
                               TextFormField(
                                 controller: emailController,
                                 decoration: InputDecoration(
                                     hintText: 'Email'
                                 ),
                                 // validator: (String ? value){
                                 //   if(value?.isEmpty?? true){
                                 //     return 'Enter email';
                                 //   } return null;
                                 // },
                               ),
                               SizedBox(height: 8,),
                               TextFormField(
                                 controller: firstnameController,
                                 decoration: InputDecoration(
                                     hintText: 'First Name'
                                 ),

                               ),
                               SizedBox(height: 8,),
                               TextFormField(
                                 controller: lastnameController,
                                 decoration: InputDecoration(
                                     hintText: 'Last Name'
                                 ),

                               ),
                               SizedBox(height: 8,),
                               TextFormField(
                                 controller: mobileController,
                                 decoration: InputDecoration(
                                     hintText: 'Mobile'
                                 ),

                               ),
                               SizedBox(height: 8,),
                               TextFormField(
                                 controller: passwordController,
                                 decoration: InputDecoration(
                                     hintText: 'Password (Optional)'
                                 ),

                               ),
                             ],
                           ),
                         ),
                       ),
                        SizedBox(height: 8,),
                        SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: updateProfileProgress== false,
                            replacement: Center(child: CircularProgressIndicator(),),
                            child: ElevatedButton(onPressed: ProfileUpdate,
                                child: Icon(Icons.arrow_circle_right_outlined)),
                          )
                          ,
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }
  Future<void>ProfileUpdate()async{
    updateProfileProgress = true;
    if(mounted){
      setState(() {

      });
    }
    String ? photoInBase64;
    Map<String, dynamic>inputData= {
      "email":emailController.text.trim(),
      "firstName":firstnameController.text.trim(),
      "lastName":lastnameController.text.trim(),
      "mobile":mobileController.text.trim(),
    };
    if(passwordController.text.isEmpty){
      inputData['password']= passwordController.text;
    }

    try {
      if (photo != null) {
        List<int> imagesBytes = await photo!.readAsBytes();
        String photoInBase64 = base64Encode(imagesBytes);

        // Remove the first 23 characters
        if (photoInBase64.length > 23) {
          photoInBase64 = photoInBase64.substring(23);
        } else {

          print('please cheack');
        }

        inputData['photo'] = photoInBase64;
      }
    } catch (e) {
      print(e.toString());
    }


    final NetworkResponse response= await NetworkCaller().postRequest(Urls.profileUpdate,
        body:inputData );
    updateProfileProgress = false;
    if(mounted){
      setState(() {

      });
    }
    if(response.isSuccess){
      AuthController.user= UserModel(
          email: emailController.text.trim(),
          firstName: firstnameController.text.trim(),
          lastName: lastnameController.text.trim(),
        mobile: mobileController.text.trim(),
          photo:  photoInBase64?? AuthController.user?.photo
      );

      ShowsnackMessege(context, 'Profil Update Succesfully');
    }

    else{
      ShowsnackMessege(context, 'Update Failed');
    }

  }
}
