// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
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
                              Text(
                                "Ethereum 2.0",
                                style: TextStyle(color: Colors.white),
                              ),
                              defaultSpace,
                              Text(
                                "Top Rating \nProject",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              defaultSpace,
                              Text(
                                "Trending project and high rating \nProject Created by team",
                                style: TextStyle(color: Colors.white),
                              ),
                              defaultSpace,
                              Container(
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
                                child: Center(
                                    child: Text(
                                  "Learn More.",
                                  style: TextStyle(color: Colors.white),
                                )),
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
                      Expanded(flex: 1, child: ProjectWidget()),
                      defaultSpace,
                      Expanded(flex: 1, child: CreatorWidget())
                    ],
                  )
                : Column(
                    children: [
                      ProjectWidget(),
                      defaultSpace,
                      CreatorWidget(),
                      defaultSpace,
                      LineChartSample1()
                    ],
                  ),
            defaultSpace,
          ],
        ),
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
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Top Creators",
                style: TextStyle(color: Colors.white),
              ),
            ),
            defaultSpace,
            Padding(
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
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                        fit: BoxFit.fill,
                                        "assets/${creatorList[i].image}"),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].id,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].artworks.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: baseRatingbarColor)),
                                  width: 28,
                                  height: 6,
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
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
            Padding(
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
                      padding: EdgeInsets.all(10),
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
                          Column(
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
                          Icon(
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
