import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/splash_screen.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,),
          errorBorder: OutlineInputBorder(borderSide: BorderSide.none,),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(vertical: 8),
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),

        ),
      ),
      home: SplashScreen(),
    );
  }
}
