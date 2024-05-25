import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row3 extends StatelessWidget {
  const Row3({super.key});

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