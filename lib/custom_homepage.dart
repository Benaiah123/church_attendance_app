import 'package:church_attendance_app/pages/row1.dart';
import 'package:church_attendance_app/pages/row2.dart';
import 'package:church_attendance_app/pages/row3.dart';
import 'package:church_attendance_app/pages/row4.dart';
import 'package:church_attendance_app/pages/row5.dart';
import 'package:church_attendance_app/pages/row6.dart';
import 'package:church_attendance_app/pages/row7.dart';
import 'package:church_attendance_app/utils/event_selector.dart';
import 'package:church_attendance_app/utils/gsheet.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:church_attendance_app/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CustomHomepage extends StatefulWidget {
  const CustomHomepage({super.key});

  @override
  State<CustomHomepage> createState() => _CustomHomepageState();
}

class _CustomHomepageState extends State<CustomHomepage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController eventController = TextEditingController();
  DateTime selectedDate =DateTime.now();
  bool isLoading = false;
  List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  int selectedIndex = -1;
  List activityString = [
    'Hour of Encounter',
    'Main Church Sunday Worship service',
    'Youth focus worship service',
    'Teens Church sunday worship service',
    'Bible study',
    'Friday prayer meeting',
    'Children Church Worship sunday service'
  ];
  GlobalKey<Row1State> testKey = GlobalKey<Row1State>();
  final List<GlobalKey<State<StatefulWidget>>> _pagesInformation = [
    GlobalKey<Row1State>(),
    GlobalKey<Row2State>(),
    GlobalKey<Row3State>(),
    GlobalKey<Row4State>(),
    GlobalKey<Row5State>(),
    GlobalKey<Row6State>(),
    GlobalKey<Row7State>(),
  ];
  late final List<Widget> _pages;
  DateTime startDate = DateTime.now();

  @override
  void initState() {
    _pages = [
      Row1(
        key: _pagesInformation[0],
      ),
      Row2(
        key: _pagesInformation[1],
      ),
      Row3(
        key: _pagesInformation[2],
      ),
      Row4(
        key: _pagesInformation[3],
      ),
      Row5(
        key: _pagesInformation[4],
      ),
      Row6(
        key: _pagesInformation[5],
      ),
      Row7(
        key: _pagesInformation[6],
      ),
    ];
    super.initState();
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
            "Main Events",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.paddingOf(context).top + 10,
                      ),
                      IntrinsicWidth(
                        child: TextButton(
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      firstDate:
                                          DateTime(DateTime.now().year - 5),
                                      initialDate: selectedDate,
                                      lastDate:
                                          DateTime(DateTime.now().year + 5))
                                  .then((value) {
                                if (value != null) {
                                  startDate = value;
                                  selectedDate = value;
                                  print(selectedDate);
                                  setState(() {});
                                }
                              });
                            },
                            style: const ButtonStyle(
                                visualDensity: VisualDensity.compact,
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.zero)),
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
                      const SizedBox(height: 20,),
                      Row(children: [
                        Expanded(child: _attendanceTypeSelection("Onsite",icon: "assets/healthicons--church.svg",isSelected: selectedIndex ==0,onTap: () =>
                                  setState(() => selectedIndex = 0),)),
                                  const SizedBox(width: 20,),
                        Expanded(child: _attendanceTypeSelection("Online",isSelected: selectedIndex ==1,onTap: () =>
                                  setState(() => selectedIndex = 1),)),
                      ],),
                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      //   height: 300,
                      //   clipBehavior: Clip.antiAlias,
                      //   decoration: BoxDecoration(
                      //       color: const Color.fromARGB(255, 248, 248, 248),
                      //       borderRadius: BorderRadius.circular(15),
                      //       boxShadow: const [
                      //         BoxShadow(spreadRadius: -10, blurRadius: 10)
                      //       ]),
                      //   child: SfDateRangePicker(
                      //     onSelectionChanged: (value) {
                      //       selectedDate = value.value;
                      //     },
                      //     selectionColor: const Color.fromARGB(255, 1, 79, 143),
                      //     selectionTextStyle: GoogleFonts.poppins(
                      //         fontWeight: FontWeight.w600, fontSize: 14),
                      //     monthViewSettings: DateRangePickerMonthViewSettings(
                      //         viewHeaderHeight: 40,
                      //         viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      //           textStyle: GoogleFonts.poppins(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 13,
                      //           ),
                      //         )),
                      //     monthCellStyle: DateRangePickerMonthCellStyle(
                      //       textStyle: GoogleFonts.poppins(
                      //           fontWeight: FontWeight.w500, fontSize: 13),
                      //       todayTextStyle: GoogleFonts.poppins(
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 14,
                      //       ),
                      //       // disabledDatesTextStyle: GoogleFonts.poppins(
                      //       //   fontWeight: FontWeight.w500,
                      //       //   fontSize: 14,
                      //       //   color: Color.fromARGB(255, 84, 84, 84),
                      //       // ),

                      //       specialDatesTextStyle: GoogleFonts.poppins(
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 14,
                      //         color: const Color.fromARGB(255, 1, 79, 143),
                      //       ),
                      //     ),
                      //     headerStyle: DateRangePickerHeaderStyle(
                      //         textStyle: GoogleFonts.poppins(
                      //             fontWeight: FontWeight.w600, fontSize: 24),
                      //         backgroundColor: Colors.transparent),
                      //     backgroundColor: Colors.transparent,
                      //   ),
                      // ),

                      const SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        labelText: "Select event",
                        isReadonly: true,
                        controller: eventController,
                        hint: "Select Event",
                        onTap: () {
                          chooseEventDialog(context,
                                  grpValue: eventController.text)
                              .then((
                            value,
                          ) {
                            if (value != null) {
                              eventController.text = value;
                              selectedIndex = activityString.indexOf(value);
                              setState(() {});
                            }
                          });
                        },
                        hasSuffix: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Form(
                          key: _form,
                          child: selectedIndex == -1
                              ? const Offstage()
                              : _pages[selectedIndex]),
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
                          onTap: () {
                            if (!_form.currentState!.validate() ||
                                eventController.text.trim().isEmpty ||
                                isLoading) return;
                            setState(() {
                              isLoading = true;
                            });
                            Map<String, dynamic> json = {};
                            switch (selectedIndex) {
                              case 0:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row1State>)
                                    .currentState!
                                    .formData;
                              case 1:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row2State>)
                                    .currentState!
                                    .formData;
                                break;
                              case 2:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row3State>)
                                    .currentState!
                                    .formData;
                                break;
                              case 3:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row4State>)
                                    .currentState!
                                    .formData;
                                break;
                              case 4:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row5State>)
                                    .currentState!
                                    .formData;
                                break;
                              case 5:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row6State>)
                                    .currentState!
                                    .formData;
                                break;
                              case 6:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row7State>)
                                    .currentState!
                                    .formData;
                                break;
                              default:
                                json = (_pagesInformation[selectedIndex]
                                        as GlobalKey<Row1State>)
                                    .currentState!
                                    .formData;
                                break;
                            }

                            // _form.currentState.

                            json["Date"] = (selectedDate ?? DateTime.now())
                                .toIso8601String();
                            Gsheet.appendAttendance(
                                    title: activityString[selectedIndex],
                                    body: json)
                                .then((value) {
                              setState(() {
                                isLoading = false;
                              });
                              if (value) {
                                _form.currentState!.reset();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "${activityString[selectedIndex]} Attendance saved Successfully",
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
                                color: eventController.text.trim().isEmpty
                                    ? const Color.fromARGB(255, 75, 99, 118)
                                    : const Color.fromARGB(255, 1, 79, 143)),
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
                        height: MediaQuery.paddingOf(context).bottom + 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
    // return Scaffold(
    //   backgroundColor: Colors.white,
    // appBar: AppBar(
    //   leadingWidth: 0,
    //   backgroundColor: Colors.white,
    //   scrolledUnderElevation: 0,
    //   elevation: 0,
    //   title: const Text(
    //     "Attendance Entry",
    //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   ),
    //     bottom: PreferredSize(
    //         preferredSize: const Size(double.maxFinite, 90),
    //         child: Builder(builder: (context) {
    //           List<int> dateList = weekDaysList();
    //           return Padding(
    //             padding:
    //                 const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: List.generate(dateList.length,
    //                   (index) => _buildWeek(dateList[index], index)),
    //             ),
    //           );
    //         })),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Builder(builder: (context) {
    //           return SingleChildScrollView(
    //             scrollDirection: Axis.horizontal,
    //             child: Row(
    //                 children: List.generate(
    //                     activityString.length,
    //                     (index) => GestureDetector(
    //                           onTap: () =>
    //                               setState(() => selectedIndex = index),
    //                           child: _attendanceTypeSelection(
    //                               activityString[index],
    //                               isSelected: index == selectedIndex),
    //                         ))
    //                 // <String>.map((value)=>_attendanceTypeSelection(value)).toList(),
    //                 ),
    //           );
    //         }),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 activityString[selectedIndex],
    //                 style: const TextStyle(
    //                     fontSize: 20, fontWeight: FontWeight.bold),
    //               ),
    //               Form(key: _form, child: _pages[selectedIndex]),
    // InkWell(
    //   onTap: () {
    //     if (!_form.currentState!.validate()) return;
    //     Map<String, dynamic> json = {};
    //     switch (selectedIndex) {
    //       case 0:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row1State>)
    //             .currentState!
    //             .formData;
    //       case 1:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row2State>)
    //             .currentState!
    //             .formData;
    //         break;
    //       case 2:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row3State>)
    //             .currentState!
    //             .formData;
    //         break;
    //       case 3:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row4State>)
    //             .currentState!
    //             .formData;
    //         break;
    //       case 4:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row5State>)
    //             .currentState!
    //             .formData;
    //         break;
    //       case 5:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row6State>)
    //             .currentState!
    //             .formData;
    //         break;
    //       case 6:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row7State>)
    //             .currentState!
    //             .formData;
    //         break;
    //       default:
    //         json = (_pagesInformation[selectedIndex]
    //                 as GlobalKey<Row1State>)
    //             .currentState!
    //             .formData;
    //         break;
    //     }
    //     // _form.currentState.
    //     json["Date"] = DateTime.now().toIso8601String();
    //     Gsheet.appendAttendance(
    //             title: activityString[selectedIndex], body: json)
    //         .then((value) {
    //       if (value) {
    //         _form.currentState!.reset();
    //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //             content: Text(
    //                 "${activityString[selectedIndex]} Attendance saved Successfully",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),)));
    //       }
    //     });
    //   },
    //   child: Container(
    //     width: double.maxFinite,
    //     height: 55,
    //     margin: const EdgeInsets.symmetric(
    //         horizontal: 10, vertical: 20),
    //     alignment: Alignment.center,
    //     decoration: ShapeDecoration(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(12)),
    //         color: Colors.blueAccent),
    //     child: const Text(
    //       "Submit",
    //       style: TextStyle(
    //           fontSize: 16,
    //           fontWeight: FontWeight.w700,
    //           color: Colors.white),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: MediaQuery.paddingOf(context).bottom + 20,
    // )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _attendanceTypeSelection(String data, {String icon = "assets/live.svg",bool isSelected = true,Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Container(
          
          height: 100,
          decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(
                      width: 2, color: Colors.blueAccent.withOpacity(0.7))
                  : null,
              color: isSelected ? null : const Color.fromARGB(10, 0, 0, 0),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 40,
                height: 40,
                // fit: ,
                colorFilter: ColorFilter.mode(
                    isSelected
                        ? Colors.white
                        : const Color.fromARGB(255, 94, 94, 94),
                    BlendMode.srcIn),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: isSelected
                        ? Colors.white
                        : const Color.fromARGB(255, 94, 94, 94)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      );

  Widget _buildWeek(int value, int index) {
    bool isToday = DateTime.now().day == value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          weekDays[index],
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 50,
          padding: const EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isToday ? Colors.blueAccent : null),
          child: Text(value.toString(),
              style: TextStyle(
                  color: isToday ? Colors.white : null,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
        )
      ],
    );
  }
}

String activityIcon(String value) {
  List activityString = [
    'Hour of Encounter',
    'Main Church Sunday Worship service',
    'Youth focus worship service',
    'Teens Church sunday worship service',
    'Bible study',
    'Friday prayer meeting',
    'Children Church Worship sunday service'
  ];
  if (value == activityString[0]) {
    return AppSvg.time;
  } else if (value == activityString[4]) {
    return AppSvg.bible;
  } else if (value == activityString[5]) {
    return AppSvg.pray;
  } else {
    return AppSvg.group;
  }
}

List<int> weekDaysList() {
  List<int> weekDays = [];
  DateTime endOfTheWeek =
      DateTime.now().add(Duration(days: 7 - DateTime.now().weekday));

  for (int i = 6; i >= 0; i--) {
    weekDays.add(endOfTheWeek.subtract(Duration(days: i)).day);
  }
  // print(weekDays);
  return weekDays;
}
