import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool isReadonly;
  final Function()? onTap;
  final bool hasSuffix;
  final String? hint;
  final List<TextInputFormatter>? formatter;
  final TextInputType? inputType;
  final Function(Map<String, dynamic> valuePair)? onChange;

  const CustomTextField(
      {super.key,
      this.onTap,
      this.hint,
      this.inputType,
      this.formatter,
      this.hasSuffix = false,
      required this.labelText,
      this.controller,
      this.onChange,
      this.isReadonly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 51, 51, 51)),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          validator: (va) {
            if ((va ?? "").isEmpty) {
              return "field is required";
            }
            return null;
          },
          onTap: onTap,
          readOnly: isReadonly,
          keyboardType: inputType?? TextInputType.number,
          inputFormatters: formatter ?? [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            if (onChange != null) {
              onChange!({labelText: value});
            }
          },
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            suffixIcon: hasSuffix
                ? const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.black,
                    size: 30,
                  )
                : null,
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  BorderSide(width: 2.0, color: Colors.black.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
                  BorderSide(width: 2.0, color: Colors.black.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.7),
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
