import 'package:church_attendance_app/pages/row1.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row2 extends StatefulWidget {
  const Row2({super.key});

  @override
  State<Row2> createState() => Row2State();
}

class Row2State extends State<Row2> with GetFormValues {
  @override
  Map<String, dynamic> getFormValues() {
    return formData;
  }

  TextEditingController youtube = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController onsite = TextEditingController();
  TextEditingController decision = TextEditingController();
  TextEditingController rededication = TextEditingController();
  TextEditingController firstTimers = TextEditingController();
  Map<String, dynamic> formData = {};

  onChange(Map<String, dynamic> json) {
    formData[json.keys.first] = json.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Youtube',
          controller: youtube,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Instagram',
          controller: instagram,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Facebook',
          controller: facebook,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Onsite',
          controller: onsite,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Decision',
          controller: decision,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Rededication',
          controller: rededication,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'First timers',
          controller: firstTimers,
          onChange: onChange,
        ),
      
      ],
    );
  }
}
