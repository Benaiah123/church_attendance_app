import 'package:church_attendance_app/custom_homepage.dart';
import 'package:church_attendance_app/special_event.dart';
import 'package:church_attendance_app/sunday_school.dart';
import 'package:church_attendance_app/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showAccessCodeDialog(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
          textScaler: MediaQuery.of(context)
              .textScaler
              .clamp(minScaleFactor: 1, maxScaleFactor: 1.2)),
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgound.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.paddingOf(context).top + 10,
              ),
              Row(
                children: [
                  Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        "assets/church_logo.png",
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      "FGC-VGC\nData record entry",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 1.2),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.white),
                child: GridView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15),
                  children: [
                    _selectionContainer(Position.topLeft,
                        title: "Main Event",
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const CustomHomepage())),
                        icon: "assets/teenyicons_church-solid.svg"),
                    _selectionContainer(Position.topRight,
                        title: "Sunday School",
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const SundaySchool())),
                        icon: "assets/sunday_school.svg"),
                    _selectionContainer(Position.bottomLeft,
                        title: "Special Event",
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SpecialEventModal())),
                        icon: "assets/special_event.svg"),
                    _selectionContainer(Position.bottomRight,
                        title: "Statistics", icon: "assets/stats.svg"),
                  ],
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
  }
}

Widget _selectionContainer(Position position,
    {required String title, required String icon, Function()? onTap}) {
  Color color;
  Color textColor;
  BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(position == Position.topLeft ? 20 : 10),
      topRight: Radius.circular(position == Position.topRight ? 20 : 10),
      bottomLeft: Radius.circular(position == Position.bottomLeft ? 20 : 10),
      bottomRight: Radius.circular(position == Position.bottomRight ? 20 : 10));
  switch (position) {
    case Position.topLeft:
      color = const Color(0xffE30513);
      textColor = Colors.white;
    case Position.topRight:
      color = const Color(0xffFFC54A);
      textColor = Colors.black;
    case Position.bottomLeft:
      color = const Color(0xff005A8C);
      textColor = Colors.white;
    case Position.bottomRight:
      color = const Color(0xff9D3F76);
      textColor = Colors.white;
  }

  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerRight, child: SvgPicture.asset(icon)),
          const Spacer(),
          FittedBox(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                  fontSize: 20,
                  color: textColor),
            ),
          )
        ],
      ),
    ),
  );
}

showAccessCodeDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: AccessCodeDialog()));
}

class AccessCodeDialog extends StatefulWidget {
  const AccessCodeDialog({super.key});

  @override
  State<AccessCodeDialog> createState() => _AccessCodeDialogState();
}

class _AccessCodeDialogState extends State<AccessCodeDialog> {
  TextEditingController accessController = TextEditingController();
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();
  String? error;
  bool canPop = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.1)),
                child: Text(
                  "Enter Access code",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  key: _key,
                  formatter: const [],
                  inputType: TextInputType.text,
                  controller: accessController,
                  validation: (value) => null,
                  labelText: "Access code"),
              if (error != null)
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      error!,
                      style: GoogleFonts.poppins(color: Colors.red),
                    )),
              const SizedBox(
                height: 15,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  splashColor: Colors.transparent,
                  onTap: () {
                    if (accessController.text.trim().toLowerCase() ==
                        "usher123") {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Access Granted",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))));
                      return;
                    }
                    error = "Invalid access code";
                    setState(() {});
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
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Position { topLeft, topRight, bottomLeft, bottomRight }
