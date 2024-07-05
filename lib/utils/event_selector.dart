import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<String?> chooseEventDialog(BuildContext context,{String? grpValue}) async {
  return await showDialog(
      context: context,
      builder: (_) =>  Dialog(
            alignment: AlignmentDirectional.bottomCenter,
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: ChooseEventType(grpValue: grpValue,),
          ));
}

class ChooseEventType extends StatefulWidget {
  final String? grpValue;
  const ChooseEventType({super.key, this.grpValue});

  @override
  State<ChooseEventType> createState() => _ChooseEventTypeState();
}

class _ChooseEventTypeState extends State<ChooseEventType> {
  String grpvalue = "";
  @override
  void initState() {
    super.initState();
    grpvalue = widget.grpValue ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom + 20),
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color.fromARGB(255, 1, 79, 143),
                    child: Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                "Church Events",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                  // runSpacing: 20,
                  children: [
                    'Hour of Encounter',
                    'Main Church Sunday Worship service',
                    'Youth focus worship service',
                    'Teens Church sunday worship service',
                    'Bible study',
                    'Friday prayer meeting',
                    'Children Church Worship sunday service'
                  ]
                      .map((e) => InkWell(
                            onTap: () {
                              grpvalue = e;
                              setState(() {});
                              Navigator.pop(context,grpvalue);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    e,
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  if (e == grpvalue)
                                    const Icon(
                                      Icons.check,
                                      size: 18,
                                      color: Color.fromARGB(255, 1, 79, 143),
                                    )
                                ],
                              ),
                            ),
                          ))
                      .toList())
            ],
          ),
        ),
      ),
    );
  }
}
