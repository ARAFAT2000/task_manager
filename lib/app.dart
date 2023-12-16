import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:task_manager/ui/screen/splass_screen.dart';


class TodoManagerApp extends StatelessWidget {
  const TodoManagerApp({super.key});

 static GlobalKey<NavigatorState> navigationKey= GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplassScreen(),
      theme: ThemeData(
        useMaterial3: false,
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
