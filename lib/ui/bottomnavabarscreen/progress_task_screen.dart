import 'package:flutter/material.dart';
import '../../Data_caller/Utility/url_all.dart';
import '../../Data_caller/network_caller.dart';
import '../../Data_caller/network_response.dart';
import '../../Model/tasklistmodel.dart';
import '../widget/profilesummerycard.dart';
import '../widget/taskitemcard.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {

  bool getintaskProgress = false;

  TaskListModel taskListModel = TaskListModel();
  Future<void> GetProgressList ()async{
    getintaskProgress=true;
    if(mounted){
      setState(() {
      });
    }
    final NetworkResponse response= await NetworkCaller().getRequest(Urls.getInProgress);
    if(response.isSuccess){
      taskListModel= TaskListModel.fromJson(response.jsonResponse);
    }
    getintaskProgress=false;
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  void initState() {
    GetProgressList();
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
                visible: getintaskProgress== false,
                replacement: Center(child: CircularProgressIndicator()),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:taskListModel.tasklist?.length,
                    itemBuilder: (context,index){
                      return TaskItemCard(task: taskListModel.tasklist![index],
                        onStutasrefresh: (){
                          GetProgressList();
                        },
                        showProgress: (inProgress){
                          getintaskProgress= inProgress;
                          if(mounted){
                            setState(() {

                            });
                          }
                        },
                      );
                    }),
              ),
            )
            ],
          ),
        )
    );
  }
}
