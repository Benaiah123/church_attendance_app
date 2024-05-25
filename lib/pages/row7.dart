import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row7 extends StatelessWidget {
  const Row7({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: 25,

        ), 
       CustomTextField(labeltext: 'LIGHT BEARERS',),
       CustomTextField(labeltext: 'Cup Bearers',),
       CustomTextField(labeltext: 'Preteens(Cadets)',),
       CustomTextField(labeltext: 'Creche',),
       
      ],
    );;
  }
}