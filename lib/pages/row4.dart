import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row4 extends StatelessWidget {
  const Row4({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        CustomTextField(labeltext: 'Onsite') 
      ]

    );
  }
}