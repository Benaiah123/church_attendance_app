import "package:church_attendance_app/pages/row1.dart";
import "package:church_attendance_app/pages/row2.dart";
import "package:church_attendance_app/pages/row3.dart";
import "package:church_attendance_app/pages/row4.dart";
import "package:church_attendance_app/pages/row5.dart";
import "package:church_attendance_app/pages/row6.dart";
import "package:church_attendance_app/pages/row7.dart";
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedItem = 'Hour of Encounter';
  int _selectedIndex = 0;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (_selectedItem == 'Hour of Encounter') {
      _selectedIndex = 0;
    }
    if (_selectedItem == 'Main Church Sunday Worship service') {
      _selectedIndex = 1;
    }
    if (_selectedItem == 'Youth focus worship service') {
      _selectedIndex = 2;
    }
    if (_selectedItem == 'Teens Church sunday worship service') {
      _selectedIndex = 3;
    }
    if (_selectedItem == 'Bible study') {
      _selectedIndex = 4;
    }
    if (_selectedItem == 'Bible study') {
      _selectedIndex = 5;
    }
    if (_selectedItem == 'Children Church Worship sunday service') {
      _selectedIndex = 6;
    }
    super.setState(fn);
  }

  

  final List<Widget> _pages = [
    const Row1(),
    const Row2(),
    const Row3(),
    const Row4(),
    const Row5(),
    const Row6(),
    const Row7(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: ListView(children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, left: 20),
            child: Text(
              "Foursquare VGC Church Attendance database entry",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: DropdownButton<String>(
              value: _selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
              items: <String>[
                'Hour of Encounter',
                'Main Church Sunday Worship service',
                'Youth focus worship service',
                'Teens Church sunday worship service',
                'Bible study',
                'Friday prayer meeting',
                'Children Church Worship sunday service'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            child: _pages[_selectedIndex],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit"))
        ]),
      ),
    );
  }
}
