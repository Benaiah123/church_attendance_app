import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row5 extends StatelessWidget {
  const Row5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         const SizedBox(
          height: 25,
        ), 
       CustomTextField(labeltext: 'Youtube',),
       CustomTextField(labeltext: 'Zoom',),
      CustomTextField(labeltext: 'Facebook',),
       CustomTextField(labeltext: 'Instagram',),
       CustomTextField(labeltext: 'Onsite(Adult)',),
       CustomTextField(labeltext: 'Onsite(Kids)',),
     
      ],
    );;
  }
}