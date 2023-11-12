import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/login_screen.dart';
import 'package:task_manager/ui/screen/mainbottomNav.dart';
import 'package:task_manager/ui/screen/splass_screen.dart';

class TodoManagerApp extends StatelessWidget {
  const TodoManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtomNavigator(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
            )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,

          )
        ),
        primaryColor: Colors.green,
          primarySwatch:Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14),
          )
        )
      ),
    );
  }
}
