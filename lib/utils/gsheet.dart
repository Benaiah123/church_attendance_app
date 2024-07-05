import 'package:gsheets/gsheets.dart';

class Gsheet {
  static const String _credentials = r"""
{
  "type": "service_account",
  "project_id": "downloader-385320",
  "private_key_id": "5da87e897624e6c88fd04df4959d01a6be39fab4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCdsHTV+NqMYbA+\nRlXzjmak+WIllwaKk8FvPfEN4C9OOUQmp8v5QDWlXPnDPbETLLOptfljOhCHuNEN\nO3EMXEMDIrd0Y8wwA0syeTrEbGZEk77YPIefEtcGLQ6YFkunkaH4UudcckPck2sf\ne1pm8i4lUHKf8d7yRhYQ5dyBMudxZjAAYu+Rah8yHGCvkd8Ry6XFG1MlguE/UDxU\n9uvf6Elja0d4WOyFeClqD0a9XSmTbib21WPWsCli8buw9UgBU06QoOwHqbYSvpMK\nkhmkcMTdkKkfkENYnSQJYn+Phm316JzW4V447EvyD3bTymKQOYMibY5JexvCPXXo\nKOVGdvA/AgMBAAECggEAJ+wUqFdofUH+LMYB3LegpQO+JWYm8c6WmmNENA8d6t/0\nsRSqP2BSNJtlYFiuC/y1P7IigUyiArp3srHp3Qc+r/yKFZ1uhHlRAGZQyonnGlWN\na5FnhI5wgc/Gchqy7KmiKAxVJsKHC8EGzeGc8ZM+u5OycWv61buIup53RP5uOfcP\nRDlrvaZhmMC8jl21Kx6nHv0GV9Tzq4ESpNTO6InNomgamA45eBR9qt0mQySECb7G\nieslgGZT94SERXeIIcgc8VJBXdLC1XV88p+7Z0Hn37yrq+QW/ZpLhdV8HnvpZCRj\nTF2VIqZgOSGXY9SvcTNuEZrtUQR9HnHQrjZ/x1XFgQKBgQDQA5qSSwbeAW0GI0UA\nbh3aHCTm7m8XFosZ4W8AYkblquSqoV0befXBwJTep3Up+kU+pp9096qFv3dbMG8k\nT7yiIJ1aen4YyJwexcVvs+3CseehI1/cNZa9TPT2g6Yn7R0OT2j3qx+yGOoYcVo0\nbBTJ5U6On6c/1jAFM6SWdWedewKBgQDCEORCwE6Hj3IMjWBRS7xTeQGyQAl9n6+v\nkUlntIwQVq2p69TJyd/g4hcmKvhtev+tLZ+ZxWmNdDIcNodpKoySXv4Ylf5thINv\ndACJPs9Nr6nXttLL1P7awtSx9wPyl8PKAyL2Oe8eLQ1qJoKlCi2fPXncq8ZPaPut\n7W6dWnqDDQKBgQDDx0CKBBdYh9sG9dcRypJKIEcTGsJv5oXRO/3vTJARxUAm4Gzz\nWVxWmV0EGnQJqEXX65cUza0u6L/7kaBpeqq9pRi0eamIxfc6d0WWFrDml+68GME2\nTzGqxW2hPtL5rQ+10kOnJuZUB2L80mLmB/ug8jN3xQfy6zKTEsIL4kA9VQKBgQCk\nlCSwg1xV1I35HTBw4VS+SaHppCsoUXNx5jmlbFVYSdoPf8O+uahWlAbjxI9YcXZB\nTK7MfsHMR51zlb7yrjX2r/63pQTXpgi9TVhjDFRMYswb95z/ZgwYRCCTKJQ9eP1+\n5XgR7wHdyoFU44HqKx6TrFQbk8WjdLn0P6aOZbv+RQKBgQCTGEwiocj2Kqt+J7GS\naue/Y7qWOeJF6Ws4wrUZMLz97OqPeKgJ8QbJpmiMeO8zEzRMPMItxmwWvzDeveH7\na7DdJ7PnLNSJHOr/QWMYQmqiMvZE3hi/+a/znjvGYTH5Nk/NNj3rtTuNz5AIf0cu\n4L6lJs/hPIZC8zE5JZQ0YoIBxg==\n-----END PRIVATE KEY-----\n",
  "client_email": "four-square-vgc@downloader-385320.iam.gserviceaccount.com",
  "client_id": "106936757862772958123",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/four-square-vgc%40downloader-385320.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}


""";

  static const String _workSheetId =
      "1VrbuJSPPuguw1gE902XiLydq1nSaQl98u5nKri2vElw";
  static late GSheets gSheets;
  static late Spreadsheet workSheet;

  static init() async {
    gSheets = GSheets(_credentials);
    // fetch spreadsheet by its id
    workSheet = await gSheets.spreadsheet(_workSheetId);

    // var sheet = workSheet.worksheetByTitle('Attendance');
    // final secondRow = {
    //   'index': '5',
    //   'letter': 'f',
    //   'number': '6',
    //   'label': 'f6',
    // };
    // await sheet!.values.map.appendRow(secondRow);
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
    Worksheet sheet = await addWordSheet(spreadsheet: workSheet, title: title,rowHeaders: body.keys.toList());
    return await sheet.values.map.appendRow(body);
  }
}
