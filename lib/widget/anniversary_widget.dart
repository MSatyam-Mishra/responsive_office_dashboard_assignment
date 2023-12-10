import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_office_dashboard_assignment/constants/colors.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';

class AnniversaryWidget extends StatelessWidget {
  const AnniversaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: reminderCardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(children: [
        Positioned(left: 25, top: 5, child: Image.asset("assets/star48.png")),
        Positioned(right: 5, top: 25, child: Image.asset("assets/star48.png")),
        const Positioned(
            left: 80,
            top: 20,
            child: Text(
              "Anniversary",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
        Positioned(
          top: 70,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: reminderCardProfileRingColor),
                          shape: BoxShape.circle),
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/boi.png")),
                  defaultHSpace,
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: reminderCardProfileRingColor),
                          shape: BoxShape.circle),
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/girl_av.png")),
                  defaultHSpace,
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: reminderCardProfileRingColor),
                          shape: BoxShape.circle),
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/girl_av.png")),
                ],
              ),
              defaultSpace,
              defaultSpace,
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                        color: reminderCardSubheadingColor, fontSize: 18),
                  ),
                  defaultHSpace,
                  Container(
                      height: 30, width: 3, color: reminderCardSubheadingColor),
                  defaultHSpace,
                  const Text(
                    "3",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800),
                  ),
                  defaultHSpace,
                  Container(
                      height: 30, width: 3, color: reminderCardSubheadingColor),
                  defaultHSpace
                ],
              ),
              defaultSpace,
              defaultSpace,
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: InkWell(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Sent Anniversary Email to 3 Employees",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.purple[300],
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: Container(
              // width: double.infinity,
              padding:
                  const EdgeInsets.only(left: 25, right: 25, top: 7, bottom: 7),
              decoration: BoxDecoration(
                  color: reminderCardButtonColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                SvgPicture.asset(
                  "assets/send.svg",
                  color: Colors.white,
                  width: 25,
                  height: 25,
                ),
                defaultHSpace,
                const Text(
                  "Anniversary Wishing",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
