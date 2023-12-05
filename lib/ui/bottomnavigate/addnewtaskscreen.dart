import 'package:flutter/material.dart';
import 'package:task_manager/Data_caller/Utility/url_all.dart';
import 'package:task_manager/Data_caller/network_caller.dart';
import 'package:task_manager/Data_caller/network_response.dart';
import 'package:task_manager/ui/widget/body_background.dart';
import 'package:task_manager/ui/widget/profilesummerycard.dart';
import 'package:task_manager/ui/widget/snack_messege.dart';


class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
 bool _createTaskInprogress =false;
  TextEditingController _subjectTEController =TextEditingController();
  TextEditingController _descriptionTEController =TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          ProfileSummeryCard(),
          Expanded(child: BodyBackground(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text('Add New Task',style:  Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _subjectTEController,
                        decoration: InputDecoration(
                          hintText: 'Subject'
                        ),
                        validator: (value){
                          if(value?.trim().isEmpty?? true){
                            return 'Enter a subject';
                          }return null;
                        },
                      ),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _descriptionTEController,
                        maxLines: 8,
                        decoration: InputDecoration(
                            hintText: 'Description'
                        ),
                        validator: (value){
                          if(value?.trim().isEmpty?? true){
                            return 'Enter a description';
                          }return null;
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _createTaskInprogress ==false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(onPressed: CreateTask ,
                              child: Icon(Icons.arrow_circle_right_outlined)),
                        )
                    ,
                      )
                    ],
                  ),
                ),
              ),),
          ))
        ],
      )),
    );
  }
  Future <void>CreateTask()async{
    if(_formKey.currentState!.validate()){
    _createTaskInprogress = true;
    if(mounted){
      setState(() {
      });
    }
    }
   final NetworkResponse response = await NetworkCaller().postRequest(Urls.createTask,
       body: {
         "title":_subjectTEController.text.trim(),
         "description":_descriptionTEController.text.trim(),
         "status":"New"
       });
    _createTaskInprogress = false;
    if(mounted){
      setState(() {
      });
    }
    if(response.isSuccess){
      _descriptionTEController.clear();
      _subjectTEController.clear();
      if(mounted){
        ShowsnackMessege(context, 'New Task Added ');
      }
    }else{
      ShowsnackMessege(context, 'Failed? Try again ');
    }
  }

  @override
  void dispose() {
    _descriptionTEController.dispose();
    _subjectTEController.dispose();
    super.dispose();
  }
}
