import 'package:church_attendance_app/pages/row1.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class Row5 extends StatefulWidget {
  const Row5({super.key});

  @override
  State<Row5> createState() => Row5State();
}

class Row5State extends State<Row5> with GetFormValues{
   @override
  Map<String, dynamic> getFormValues() {
    return formData;
  }
  TextEditingController youtube = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController onsiteAdult = TextEditingController();
  TextEditingController zoom= TextEditingController();
  TextEditingController onsiteKids = TextEditingController(); 
  Map<String, dynamic> formData = {};

  onChange(Map<String, dynamic> json) {
    formData[json.keys.first] = json.values.first;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       CustomTextField(labeltext: 'Youtube',controller: youtube,onChange: onChange,),
       const SizedBox(height:20,),
       CustomTextField(labeltext: 'Zoom',controller: zoom,onChange: onChange),
       const SizedBox(height:20,),
      CustomTextField(labeltext: 'Facebook',controller: facebook,onChange: onChange),
      const SizedBox(height:20,),
       CustomTextField(labeltext: 'Instagram',controller: instagram,onChange: onChange),
       const SizedBox(height:20,),
       CustomTextField(labeltext: 'Onsite(Adult)',controller: onsiteAdult,onChange: onChange),
       const SizedBox(height:20,),
       CustomTextField(labeltext: 'Onsite(Kids)',controller: onsiteKids,onChange: onChange),
     
      ],
    );
  }
}