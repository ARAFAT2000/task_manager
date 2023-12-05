import 'package:task_manager/ui/widget/taskitemcard.dart';

class Urls{
  static const String _baseUrl= 'https://task.teamrabbil.com/api/v1';

  //_reg error dekhay so,ata newya hoiche
  static const String regUrl= '$_baseUrl/registration';
  static const String logUrl= '$_baseUrl/login';
  static const String createTask ='$_baseUrl/createTask';
  static  String getnewtask ='$_baseUrl/listTaskByStatus/${TaskStatus.New.name}';
  static  String getInProgress ='$_baseUrl/listTaskByStatus/${TaskStatus.Progress.name}';
  static  String getcompleted ='$_baseUrl/listTaskByStatus/${TaskStatus.Completed.name}';
  static  String getCancelled ='$_baseUrl/listTaskByStatus/${TaskStatus.Cancelled.name}';
  static const String gettasksummerycount ='$_baseUrl/taskStatusCount';
  static String updatestutas(String taskId, String stutas) =>
      '$_baseUrl/updateTaskStatus/$taskId/$stutas';
  static const String profileUpdate ='$_baseUrl/profileUpdate';
}