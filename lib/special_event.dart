import 'package:flutter/material.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:church_attendance_app/utils/update_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';

class SpecialEventModal extends StatefulWidget {
  const SpecialEventModal({super.key});

  @override
  State<SpecialEventModal> createState() => _SpecialEventModalState();
}

class _SpecialEventModalState extends State<SpecialEventModal> {
  DateTime selectedDate = DateTime.now();
  DateTime startDate = DateTime.now();
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
    formData[json.keys.first] = json.values.first;
  }

  clear() {
    youtube.text="";
    eventName.text="";
    instagram.text="";
    facebook.text="";
    onsite.text="";
    decision.text="";
    rededication.text="";
    firstTimers.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          "Special Event",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicWidth(
                    child: TextButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  firstDate: DateTime(DateTime.now().year - 5),
                                  initialDate: selectedDate,
                                  lastDate: DateTime(DateTime.now().year + 5))
                              .then((value) {
                            if (value != null) {
                              startDate = value;
                              selectedDate = value;
                              setState(() {});
                            }
                          });
                        },
                        style: const ButtonStyle(
                            visualDensity: VisualDensity.compact,
                            padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat.yMMMM().format(startDate),
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4, left: 6),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                size: 28,
                                color: Color(0xff005A8C),
                              ),
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DatePicker(
                    // DateTime(DateTime.now().year,DateTime.now().month-3),
                    startDate,
                    initialSelectedDate: selectedDate,
                    height: 90,
                    selectionColor: const Color(0xff005A8C),
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
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
                      selectedDate: selectedDate,
                                sheetTitle: "Special Event", json: {"Event Name":formData["Event Name"],...formData})
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });
                          if (value) {
                            _form.currentState!.reset();
                            clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "${eventName.text.trim()} Attendance saved Successfully",
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
      }),
    );
  }
}
