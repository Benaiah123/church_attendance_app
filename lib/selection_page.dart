import 'package:church_attendance_app/custom_homepage.dart';
import 'package:church_attendance_app/pages/modals/special_event_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/backgound.jpg"))),
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
                     const SizedBox(width: 15,),
                      Text(
                "FGC-VGC\nData record entry",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.2),
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
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CustomHomepage())),
                        icon: "assets/teenyicons_church-solid.svg"),
                    _selectionContainer(Position.topRight,
                        title: "Sunday School",
                        icon: "assets/sunday_school.svg"),
                    _selectionContainer(Position.bottomLeft,
                        title: "Special Event",
                        onTap: ()=>showSpecialEventModal(context),
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
          Align(alignment: Alignment.centerRight, child: SvgPicture.asset(icon)),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                height: 1.2,
                fontSize: 20,
                color: textColor),
          )
        ],
      ),
    ),
  );
}

enum Position { topLeft, topRight, bottomLeft, bottomRight }
