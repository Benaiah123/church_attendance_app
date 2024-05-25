import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row6 extends StatelessWidget {
  const Row6({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 25,
        ), 
       CustomTextField(labeltext: 'Zoom',),
       CustomTextField(labeltext: 'Facebook',),
       CustomTextField(labeltext: 'Instagram',),
       CustomTextField(labeltext: 'Youtube',),
       CustomTextField(labeltext: 'Onsite(Adult)',),
       CustomTextField(labeltext: 'Onsite(kids)',),
       
      ],
    );;
  }
}