import 'package:church_attendance_app/special_event.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:church_attendance_app/utils/update_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

showSpecialEventModal(BuildContext context) async {
  await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      barrierColor: Colors.transparent,
      constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height -
              (MediaQuery.paddingOf(context).top + 80)),
      context: context,
      builder: (context) => const SpecialEventModal());
}

