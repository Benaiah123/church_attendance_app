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

class SpecialEventModal extends StatefulWidget {
  const SpecialEventModal({super.key});

  @override
  State<SpecialEventModal> createState() => _SpecialEventModalState();
}

class _SpecialEventModalState extends State<SpecialEventModal> {
  DateTime? selectedDate;
  TextEditingController youtube = TextEditingController();
  TextEditingController eventName = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController onsite = TextEditingController();
  TextEditingController decision = TextEditingController();
  TextEditingController rededication = TextEditingController();
  TextEditingController firstTimers = TextEditingController();
  Map<String, dynamic> formData = {};
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool isLoading = false;
  onChange(Map<String, dynamic> json) {
    print(json);
    formData[json.keys.first] = json.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SfDateRangePicker(
                  onSelectionChanged: (value) {
                    selectedDate = value.value;
                  },
                  selectionColor: const Color.fromARGB(255, 1, 79, 143),
                  selectionTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  monthViewSettings: DateRangePickerMonthViewSettings(
                      viewHeaderHeight: 40,
                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      )),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 13),
                    todayTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    // disabledDatesTextStyle: GoogleFonts.poppins(
                    //   fontWeight: FontWeight.w500,
                    //   fontSize: 14,
                    //   color: Color.fromARGB(255, 84, 84, 84),
                    // ),

                    specialDatesTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color.fromARGB(255, 1, 79, 143),
                    ),
                  ),
                  headerStyle: DateRangePickerHeaderStyle(
                      textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24),
                      backgroundColor: Colors.transparent),
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  "Special Event",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: "Event Name",
                        controller: eventName,
                        formatter: const [],
                        onChange: onChange,
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'Youtube',
                        controller: youtube,
                        onChange: onChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'Instagram',
                        controller: instagram,
                        onChange: onChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'Facebook',
                        controller: facebook,
                        onChange: onChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'Onsite',
                        controller: onsite,
                        onChange: onChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'Decision',
                        controller: decision,
                        onChange: onChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'Rededication',
                        controller: rededication,
                        onChange: onChange,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        labelText: 'First timers',
                        controller: firstTimers,
                        onChange: onChange,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent),
                  child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      if (!_form.currentState!.validate() || isLoading) return;
                      setState(() {
                        isLoading = true;
                      });
                      await updateSheet(context,
                              sheetTitle: "Special Event", json: formData)
                          .then((value) {
                        print("here");
                        setState(() {
                          isLoading = false;
                        });
                        if (value) {
                          _form.currentState!.reset();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${eventName.text.trim()} Attendance saved Successfully",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white))));
                        }
                      });
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color:
                              //  eventController.text.trim().isEmpty
                              //     ? const Color.fromARGB(255, 75, 99, 118)
                              //     :
                              const Color.fromARGB(255, 1, 79, 143)),
                      child: isLoading
                          ? ConstrainedBox(
                              constraints: const BoxConstraints(
                                  maxHeight: 23, maxWidth: 23),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.paddingOf(context).bottom + 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
