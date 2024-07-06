import 'package:church_attendance_app/pages/row1.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row6 extends StatefulWidget {
  const Row6({super.key});

  @override
  State<Row6> createState() => Row6State();
}

class Row6State extends State<Row6> with GetFormValues {
  Map<String, dynamic> formData = {};
  @override
  Map<String, dynamic> getFormValues() {
    return formData;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController youtube = TextEditingController();
    TextEditingController instagram = TextEditingController();
    TextEditingController facebook = TextEditingController();
    TextEditingController onsiteAdult = TextEditingController();
    TextEditingController zoom = TextEditingController();
    TextEditingController onsiteKids = TextEditingController();

    onChange(Map<String, dynamic> json) {
      formData[json.keys.first] = json.values.first;
    }

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
            labelText: 'Zoom', controller: zoom, onChange: onChange),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
            labelText: 'Facebook', controller: facebook, onChange: onChange),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
            labelText: 'Instagram', controller: instagram, onChange: onChange),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
            labelText: 'Onsite(Adult)',
            controller: onsiteAdult,
            onChange: onChange),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
            labelText: 'Onsite(Kids)',
            controller: onsiteKids,
            onChange: onChange),
      ],
    );
  }
}
