import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row1 extends StatefulWidget {
  const Row1({super.key});

  @override
  State<Row1> createState() => Row1State();
}

class Row1State extends State<Row1> with GetFormValues {
  TextEditingController adultOnsite = TextEditingController();
  TextEditingController adultOnline = TextEditingController();
  TextEditingController kids = TextEditingController();
  Map<String, dynamic> formData = {};

  onChange(Map<String, dynamic> json) {
    formData[json.keys.first] = json.values.first;
  }

  @override
  Map<String, dynamic> getFormValues() {
    return formData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // runSpacing: 10,
      children: [
        CustomTextField(
          labelText: "Adult-Onsite",
          controller: adultOnline,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Adult-Online',
          controller: adultOnsite,
          onChange: onChange,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: 'Kids',
          controller: kids,
          onChange: onChange,
        ),
      ],
    );
  }
}

mixin GetFormValues {
  Map<String, dynamic> getFormValues();
}
