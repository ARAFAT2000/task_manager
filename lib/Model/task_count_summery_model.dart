import 'package:task_manager/Model/task_count.dart';

class TaskCountSummeryModel {
  String? status;
  List<TaskCount>? taskcount;

  TaskCountSummeryModel({this.status, this.taskcount});

  TaskCountSummeryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskcount = <TaskCount>[];
      json['data'].forEach((v) {
        taskcount!.add(new TaskCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.taskcount != null) {
      data['data'] = this.taskcount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


