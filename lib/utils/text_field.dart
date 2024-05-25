import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 String labeltext;

  CustomTextField({
    super.key,
    
    required this.labeltext,  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(
              color: Theme.of(context).hintColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).hintColor,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
