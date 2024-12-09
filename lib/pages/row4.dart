import 'package:church_attendance_app/pages/row1.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row4 extends StatefulWidget {
  const Row4({super.key});

  @override
  State<Row4> createState() => Row4State();
}

class Row4State extends State<Row4> with GetFormValues {
  @override
  Map<String, dynamic> getFormValues() {
    return formData;
  }

  TextEditingController onsite = TextEditingController();
  Map<String, dynamic> formData = {};

  onChange(Map<String, dynamic> json) {
    formData[json.keys.first] = json.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTextField(
        labelText: 'Onsite',
        controller: onsite,
        onChange: onChange,
      )
    ]);
  }
}
