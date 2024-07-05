import 'package:church_attendance_app/custom_homepage.dart';
import 'package:church_attendance_app/utils/gsheet.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Gsheet.init();
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
        // home: const HomePage()
        home: const CustomHomepage());
  }
}
