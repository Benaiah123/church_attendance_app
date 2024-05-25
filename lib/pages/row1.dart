import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row1 extends StatelessWidget {
 const  Row1({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        CustomTextField(
          labeltext: "Adult-Onsite",
        ),
        CustomTextField(
          labeltext: 'Adult-Online',
        ),
        CustomTextField(
          labeltext: 'Adult-Onkids',
        ),
      ],
    );
  }
}
