import 'package:task_manager/Model/task.dart';

class TaskListModel {
  String? status;
  List<Task>? tasklist;

  TaskListModel({this.status, this.tasklist});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      tasklist = <Task>[];
      json['data'].forEach((v) {
        tasklist!.add(new Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.tasklist != null) {
      data['data'] = this.tasklist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


