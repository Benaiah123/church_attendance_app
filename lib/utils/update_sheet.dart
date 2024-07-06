import 'package:church_attendance_app/utils/gsheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<bool> updateSheet(BuildContext context,
    {required sheetTitle,
    required Map<String, dynamic> json,
    DateTime? selectedDate}) async {
  json["Date"] = (selectedDate ?? DateTime.now()).toIso8601String();
  return await Gsheet.appendAttendance(title: sheetTitle, body: json)
      ;
}
