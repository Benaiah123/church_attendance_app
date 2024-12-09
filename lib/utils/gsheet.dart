import 'package:church_attendance_app/utils/app_keys.dart';
import 'package:gsheets/gsheets.dart';

class Gsheet {
  static const String _credentials = AppKeys.googleCred;

  static const String _workSheetId =
      "1VrbuJSPPuguw1gE902XiLydq1nSaQl98u5nKri2vElw";
  static late GSheets gSheets;
  static late Spreadsheet workSheet;

  static init() async {
    gSheets = GSheets(_credentials);
    // fetch spreadsheet by its id
    workSheet = await gSheets.spreadsheet(_workSheetId);
  }

  static Future<Worksheet> addWordSheet(
      {required Spreadsheet spreadsheet,
      required String title,
      required List<String> rowHeaders}) async {
    try {
      Worksheet sheet = await spreadsheet.addWorksheet(title);
      sheet.values.insertRow(1, rowHeaders);
      return sheet;
    } catch (e) {
      print(e);
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<bool> appendAttendance(
      {required String title, required Map<String, dynamic> body}) async {
    Worksheet sheet = await addWordSheet(
        spreadsheet: workSheet, title: title, rowHeaders: body.keys.toList());
    return await sheet.values.map.appendRow(body);
  }
}
