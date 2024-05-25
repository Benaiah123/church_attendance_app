import 'package:church_attendance_app/home_page.dart';
import 'package:flutter/material.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      
      theme: ThemeData(
        primaryColor: Colors.blue, // Change to your desired primary color
        hintColor: Colors.blueAccent, // Change to your desired accent color
        fontFamily: 'Roboto',
      ),
      home: const HomePage()
    );
  }
}

