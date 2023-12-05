import 'package:flutter/material.dart';
import 'package:task_manager/Data_caller/Utility/url_all.dart';
import 'package:task_manager/Data_caller/network_caller.dart';
import 'package:task_manager/Data_caller/network_response.dart';
import 'package:task_manager/Model/task_count_summery_model.dart';
import 'package:task_manager/Model/tasklistmodel.dart';
import '../bottomnavigate/addnewtaskscreen.dart';
import '../widget/profilesummerycard.dart';
import '../widget/summerycard.dart';
import '../widget/taskitemcard.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool inProgress = false;
  TaskListModel taskListModel = TaskListModel();

  ///Task summery count
  bool intasksummerycountProgress = false;
  TaskCountSummeryModel taskCountSummeryModel = TaskCountSummeryModel();

  Future<void> GettaskSummeryCountList ()async{
    intasksummerycountProgress=true;
    if(mounted){
      setState(() {
      });
    }
    final NetworkResponse response= await NetworkCaller().getRequest(Urls.gettasksummerycount);
    if(response.isSuccess){
      taskCountSummeryModel= TaskCountSummeryModel.fromJson(response.jsonResponse);
    }
    intasksummerycountProgress=false;
    if(mounted){
      setState(() {
      });
    }
  }

  /// task get
  Future<void> GettaskList ()async{
    inProgress=true;
    if(mounted){
      setState(() {
      });
    }
   final NetworkResponse response= await NetworkCaller().getRequest(Urls.getnewtask);
    if(response.isSuccess){
      taskListModel= TaskListModel.fromJson(response.jsonResponse);
    }
    inProgress=false;
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  void initState() {
    GettaskSummeryCountList();
   GettaskList();

   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddNewTaskScreen()));
      },
        child: Icon(Icons.add),),
      body: SafeArea(
        child: Column(
          children: [
           ProfileSummeryCard(),
      
            Visibility(
              visible:intasksummerycountProgress == false &&
                  (taskCountSummeryModel.taskcount?.isNotEmpty?? false),
                replacement: LinearProgressIndicator(),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    itemCount:taskCountSummeryModel.taskcount?.length?? 0,
                  itemBuilder: (context,index){
                    final  taskcounts= taskCountSummeryModel.taskcount![index];
                    return FittedBox(
                        child: SummeryCard(
                        count: taskcounts.sum.toString(),
                            title: taskcounts.sId ??''));
                  }),
                )),
            Expanded(child:
            Visibility(
              visible: inProgress== false,
              replacement: Center(child: CircularProgressIndicator()),
              child: RefreshIndicator(
                onRefresh: GettaskList,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:taskListModel.tasklist?.length?? 0,
                    itemBuilder: (context,index){
                      return TaskItemCard(task: taskListModel.tasklist![index],
                      onStutasrefresh: (){
                          GettaskList();
                      },
                        showProgress: (inProgress){
                        intasksummerycountProgress= inProgress;
                        if(mounted){
                          setState(() {

                          });
                        }
                        },
                      );
                    }),
              ),
            ))
          ],
        ),
      )
    );
  }
}





