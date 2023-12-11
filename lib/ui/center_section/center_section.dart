// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/responsive_layout.dart';
import 'package:responsive_office_dashboard_assignment/widget/anniversary_widget.dart';
import 'package:responsive_office_dashboard_assignment/widget/birthday_widget.dart';
import 'package:responsive_office_dashboard_assignment/widget/calendar_widget.dart';
import 'package:responsive_office_dashboard_assignment/widget/creator_widget.dart';
import 'package:responsive_office_dashboard_assignment/widget/project_widget.dart';

import '../../constants/colors.dart';
import '../../data/const_data.dart';
import '../../widget/linear_chart.dart';

class CenterSection extends StatefulWidget {
  const CenterSection({Key? key}) : super(key: key);

  @override
  State<CenterSection> createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(defaulPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              padding: EdgeInsets.symmetric(
                  vertical: defaulPadding, horizontal: defaulPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: bannerGradientColor,
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight)),
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      child: Image.asset(
                          fit: BoxFit.fill, "assets/3dfluid.png", height: 200)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ethereum 2.0",
                                style: TextStyle(color: Colors.white),
                              ),
                              defaultSpace,
                              Text("Top Rating \nProject",
                                  style: GoogleFonts.dmSans(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700)),
                              defaultSpace,
                              Text(
                                "Trending project and high rating \nProject Created by team",
                                style: GoogleFonts.dmSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              defaultSpace,
                              InkWell(
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: "Please visit Website to Learn More",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.purple[300],
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Container(
                                  width: 140,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: bannerButtonColor),
                                  padding: EdgeInsets.only(
                                      left: defaulPadding, right: defaulPadding
                                      // top:
                                      //     deviceWidth * 0.015,
                                      // bottom:
                                      //     deviceWidth * 0.015,
                                      ),
                                  child: const Center(
                                      child: Text(
                                    "Learn More.",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),

                        // Image.asset(
                        //     fit: BoxFit.fill, "assets/3dfluid.png", width: imageSize)
                      ]),
                ],
              ),
            ),
            defaultSpace,
            //creator widget
            (ResponsiveLayout.isComputer(context) ||
                    ResponsiveLayout.isLargetablet(context))
                ? Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 7.5),
                            child: const ProjectWidget(),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                              margin: const EdgeInsets.only(left: 7.5),
                              child: const CreatorWidget())),
                    ],
                  )
                : Column(
                    children: [
                      ResponsiveLayout.istablet(context)
                          ? Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 7.5),
                                      child: const ProjectWidget(),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 7.5),
                                        child: const CreatorWidget())),
                              ],
                            )
                          : SizedBox(height: 0),
                      ResponsiveLayout.isPhone(context)
                          ? Column(
                              children: [
                                const ProjectWidget(),
                                defaultSpace,
                                const CreatorWidget(),
                                defaultSpace
                              ],
                            )
                          : defaultSpace,
                      const LineChartSample1(),
                      defaultSpace,
                      Text(
                        "GENERAL 10:00 AM To 7:00 PM",
                        style: GoogleFonts.dmSans(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const CalendarWidget(),
                      defaultSpace,
                      ResponsiveLayout.istablet(context)
                          ? const Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 7.5),
                                      child: BirthdayWidget(),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 7.5),
                                      child: AnniversaryWidget(),
                                    ))
                              ],
                            )
                          : const SizedBox.shrink(),
                      ResponsiveLayout.isPhone(context)
                          ? Column(
                              children: [
                                const BirthdayWidget(),
                                defaultSpace,
                                const AnniversaryWidget()
                              ],
                            )
                          : defaultSpace,
                    ],
                  ),
            defaultSpace,
            (ResponsiveLayout.isComputer(context) ||
                    ResponsiveLayout.isLargetablet(context)
                ? const LineChartSample1()
                : defaultSpace)
          ],
        ),
      ),
    );
  }
}
