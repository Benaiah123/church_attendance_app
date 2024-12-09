import 'package:church_attendance_app/utils/gsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<bool> updateSheet(BuildContext context,
    {required sheetTitle,
    required Map<String, dynamic> json,
    DateTime? selectedDate}) async {
  String date = DateFormat.yMMMMd().format(selectedDate ?? DateTime.now());

  json = {"Date": date, ...json};
  json.removeWhere((key, value) => value == null || value.toString().isEmpty);
  print(json);

  return await Gsheet.appendAttendance(title: sheetTitle, body: json);
}
