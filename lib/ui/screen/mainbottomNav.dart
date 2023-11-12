import 'package:flutter/material.dart';
import 'package:task_manager/ui/bottomnavabarscreen/canceled_task_screen.dart';
import 'package:task_manager/ui/bottomnavabarscreen/complete_task_screen.dart';
import 'package:task_manager/ui/bottomnavabarscreen/new_task_screen.dart';
import 'package:task_manager/ui/bottomnavabarscreen/progress_task_screen.dart';

class ButtomNavigator extends StatefulWidget {
  const ButtomNavigator({super.key});

  @override
  State<ButtomNavigator> createState() => _ButtomNavigatorState();
}

class _ButtomNavigatorState extends State<ButtomNavigator> {
 List<Widget>screens =[
   NewTaskScreen(),
   ProgressScreen(),
   CompleteScreen(),
   CanceledScreen(),
 ];
  int selectedindex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
         bottomNavigationBar:BottomNavigationBar(
           currentIndex: selectedindex,
           onTap: (index){
             setState(() {
               selectedindex =index;
             });
           },
           selectedItemColor: Colors.green,
             unselectedItemColor: Colors.grey,

             items: [
               BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'New'),
               BottomNavigationBarItem(icon: Icon(Icons.change_circle_outlined),label: 'Inprogress'),
               BottomNavigationBarItem(icon: Icon(Icons.done),label: 'Complete'),
               BottomNavigationBarItem(icon: Icon(Icons.clear),label: 'Canceled'),
             ]),
    );
  }
}
