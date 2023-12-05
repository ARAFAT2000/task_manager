import 'package:flutter/material.dart';
import 'package:task_manager/Data_caller/network_caller.dart';
import 'package:task_manager/Data_caller/network_response.dart';
import 'package:task_manager/Model/tasklistmodel.dart';
import 'package:task_manager/ui/widget/taskitemcard.dart';

import '../../Data_caller/Utility/url_all.dart';
import '../widget/profilesummerycard.dart';


class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  bool completeTaskProgress = false;
  TaskListModel taskListModel = TaskListModel();
  Future<void> CompleteTask()async{
    completeTaskProgress = true;
    if(mounted){
      setState(() {

      });
    }
    final NetworkResponse  response= await NetworkCaller().getRequest(Urls.getcompleted);
    if(response.isSuccess){
      taskListModel= TaskListModel.fromJson(response.jsonResponse);
    }
    completeTaskProgress = false;
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  void initState() {
    CompleteTask();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ProfileSummeryCard(),
             Expanded(
                 child: Visibility(
                   visible: completeTaskProgress == false,
                     replacement: Center(
                       child: CircularProgressIndicator(),
                     ),
                     child: ListView.builder(
                       shrinkWrap: true,
                       itemCount:  taskListModel.tasklist?.length?? 0,
                         itemBuilder: (context,index){
                         return TaskItemCard(
                             task:taskListModel.tasklist![index],
                             onStutasrefresh: (){
                               CompleteTask();
                             },
                             showProgress: (inProgress){
                               completeTaskProgress =inProgress;
                               if(mounted){
                                 setState(() {
                                 });
                               }
                             });
                         })))


            ],
          ),
        )
    );
  }
}
