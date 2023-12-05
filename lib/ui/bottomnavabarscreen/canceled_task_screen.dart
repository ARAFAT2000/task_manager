import 'package:flutter/material.dart';
import 'package:task_manager/Data_caller/network_caller.dart';
import 'package:task_manager/Data_caller/network_response.dart';
import 'package:task_manager/Model/tasklistmodel.dart';

import '../../Data_caller/Utility/url_all.dart';
import '../widget/profilesummerycard.dart';
import '../widget/taskitemcard.dart';

class CanceledScreen extends StatefulWidget {
  const CanceledScreen({super.key});

  @override
  State<CanceledScreen> createState() => _CanceledScreenState();
}

class _CanceledScreenState extends State<CanceledScreen> {
  bool cancelledIndicator= false;
  TaskListModel taskListModel=TaskListModel();
  Future<void> GetCancelled()async{
    cancelledIndicator=true;
    if(mounted){
      setState(() {

      });
    }
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getCancelled);
    if(response.isSuccess){
      taskListModel= TaskListModel.fromJson(response.jsonResponse);
    }
    cancelledIndicator= false;
    if(mounted){
      setState(() {

      });
    }
  }
  @override
  void initState() {
    GetCancelled();
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
                    visible: cancelledIndicator==false,
                      replacement: LinearProgressIndicator(),
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: taskListModel.tasklist?.length?? 0,
                          itemBuilder:(context,index){
                        return TaskItemCard(
                            task: taskListModel.tasklist![index],
                            onStutasrefresh: (){
                              GetCancelled();
                            },
                            showProgress: (inProgess){
                              cancelledIndicator= inProgess;
                            });
                          })))
            ],
          ),
        )
    );
  }
}
