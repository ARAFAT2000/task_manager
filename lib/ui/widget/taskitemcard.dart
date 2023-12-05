

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Data_caller/network_caller.dart';

import '../../Data_caller/Utility/url_all.dart';
import '../../Model/task.dart';



enum TaskStatus{
  New,
  Progress,
  Completed,
  Cancelled,
  complete
}

class TaskItemCard extends StatefulWidget {
  const TaskItemCard({
    super.key,required this.task,
    required this.onStutasrefresh, required this.showProgress
  });

  final Task task;
  final Function (bool) showProgress;
  final VoidCallback onStutasrefresh;

  @override
  State<TaskItemCard> createState() => _TaskItemCardState();
}

class _TaskItemCardState extends State<TaskItemCard> {

  Future<void> UpdateTaskStutas(String stutas)async{
    widget.showProgress(true);
 final response= await NetworkCaller().getRequest(Urls.updatestutas(widget.task.sId??'', stutas));
 if(response.isSuccess){
   widget.onStutasrefresh();
 }
    widget.showProgress(false);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16,horizontal: 6),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.task.title ?? '',style: Theme.of(context).textTheme.titleSmall,),
            Text(widget.task.description ?? ''),
            Text('Date : ${widget.task.createdDate} '),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                    backgroundColor: Colors.blueAccent,
                    label: Text(widget.task.status ?? 'New')),
                Wrap(

                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_sharp)),
                    IconButton(onPressed:(){
                      showDialog(context: context, builder: (context){
                        List<ListTile> items= TaskStatus.values.map((e) =>
                            ListTile(title: Text(e.name),
                            onTap: (){
                              UpdateTaskStutas(e.name);
                              Navigator.pop(context);
                            },
                            )).toList();
                        return AlertDialog(
                          title: Text('Update Stutas'),
                          content:Column(
                            mainAxisSize: MainAxisSize.min,
                            children: items
                          ),
                          actions: [
                            ButtonBar(
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text('Cancel')),

                              ],
                            )
                          ],
                        );
                      });
                    }, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}