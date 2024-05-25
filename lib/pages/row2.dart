import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row2 extends StatelessWidget {
  const Row2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 25,
        ), 
       CustomTextField(labeltext: 'Youtube',),
       CustomTextField(labeltext: 'Instagram',),
       CustomTextField(labeltext: 'Facebook',),
       CustomTextField(labeltext: 'Onsite',),
       CustomTextField(labeltext: 'Decision',),
       CustomTextField(labeltext: 'Rededication',),
       CustomTextField(labeltext: 'First timers',),
      ],
    );
  }
}