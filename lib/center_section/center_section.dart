// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flexible_calendar/flexible_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/responsive_layout.dart';

import '../constants/colors.dart';
import '../data/const_data.dart';
import '../widget/linear_chart.dart';

class CenterSection extends StatefulWidget {
  const CenterSection({Key? key}) : super(key: key);

  @override
  State<CenterSection> createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                              const Text(
                                "Top Rating \nProject",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              defaultSpace,
                              const Text(
                                "Trending project and high rating \nProject Created by team",
                                style: TextStyle(color: Colors.white),
                              ),
                              defaultSpace,
                              GestureDetector(
                                onTap: () {
                                  // Fluttertoast.showToast(
                                  //     msg: "Please visit Website to Learn More",
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.CENTER,
                                  //     timeInSecForIosWeb: 1,
                                  //     backgroundColor: Colors.red,
                                  //     textColor: Colors.white,
                                  //     fontSize: 16.0);
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
                          : defaultSpace,
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
        )
      ]),
    );
  }
}

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget({
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
              "Today Birthday",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )),
        Positioned(
          top: 70,
          left: 30,
          child: Column(
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
                    "2",
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
          top: 60,
          left: 60,
          child: SvgPicture.asset(
            "assets/birthday-cake.svg",
            width: 20,
            height: 20,
          ),
        ),
        Positioned(
          top: 60,
          left: 125,
          child: SvgPicture.asset(
            "assets/birthday-cake.svg",
            width: 20,
            height: 20,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            // width: 200,
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
                "Birthday Wishing",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        )
      ]),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      //height: deviceWidth * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: FlexibleCalendarView(
        textPreMonthTitle: "Dec",
        decorationOfSelectedDay: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        colorDayInAnotherMonth: Colors.grey,
        borderBackgroundStartDay: const BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
        borderBackgroundEndDay: const BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        isSelectedOnlyOneDay: false,
        colorOfDayInMonth: Colors.black,
        colorOfSelectedDay: Colors.purple,
        styleOfDay: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CreatorWidget extends StatelessWidget {
  const CreatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(15),

      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: cardColor),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSpace,
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Top Creators",
                style: TextStyle(color: Colors.white),
              ),
            ),
            defaultSpace,
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Artworks",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: 180 - 30,
              child: ListView.builder(
                  // controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                        fit: BoxFit.fill,
                                        "assets/${creatorList[i].image}"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].id,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].artworks.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: baseRatingbarColor)),
                                  width: 28,
                                  height: 6,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: i == 0
                                        ? 25
                                        : i == 1
                                            ? 20
                                            : i == 2
                                                ? 23
                                                : 22,
                                    height: 6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: cardRatingBarColor))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(15),
      // width: widgetWidth,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: cardColor),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSpace,
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "All Projects",
                style: TextStyle(color: Colors.white),
              ),
            ),
            defaultSpace,
            Container(
              height: 180,
              child: ListView.builder(
                  //controller: scrollController,
                  itemCount: projectImages.length,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: i == 0
                              ? cardSelectedOptionColor
                              : cardUnselectedOptionColor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          bottom: 10,
                          left: i == 0 ? 10 : 20,
                          right: i == 0 ? 10 : 20),
                      height: 60,
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            width: 30,
                            height: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                projectImages[i],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const Column(
                            children: [
                              Text(
                                "Technology behind the Blockchain",
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text("Project #1",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.circle_sharp,
                                    size: 5,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "See project deatails",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      )),
                    );
                  }),
            )
          ]),
    );
  }
}
