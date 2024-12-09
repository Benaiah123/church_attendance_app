import 'package:church_attendance_app/selection_page.dart';
import 'package:church_attendance_app/utils/gsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent));
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, // Change to your desired primary color
        hintColor: Colors.blueAccent, // Change to your desired accent color
        fontFamily: 'Poppins',
      ),
      home: const SelectionPage(),
      // home: const HomePage()
      // home: const CustomHomepage()
    );
  }
}
