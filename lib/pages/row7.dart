import 'package:church_attendance_app/pages/row1.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row7 extends StatefulWidget {
  const Row7({super.key});

  @override
  State<Row7> createState() => Row7State();
}

class Row7State extends State<Row7> with GetFormValues {
  @override
  Map<String, dynamic> getFormValues() {
    return formData;
  }

  TextEditingController light = TextEditingController();
  TextEditingController cup = TextEditingController();
  TextEditingController pre = TextEditingController();
  TextEditingController creche = TextEditingController();
  Map<String, dynamic> formData = {};

  onChange(Map<String, dynamic> json) {
    formData[json.keys.first] = json.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: 'LIGHT BEARERS',
          controller: light,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Cup Bearers',
          controller: cup,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Preteens(Cadets)',
          controller: pre,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Creche',
          controller: creche,
          onChange: onChange,
        ),
      ],
    );
  }
}
