// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/custom_drawer.dart';
import 'package:responsive_office_dashboard_assignment/data/const_data.dart';
import 'package:responsive_office_dashboard_assignment/responsive_layout.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _currentSelectedButton = 0;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
        // padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: (ResponsiveLayout.isComputer(context))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: deviceWidth * 0.22,
                    padding: EdgeInsets.symmetric(horizontal: 115),
                    color: Color(0xfff7f5fb),
                    child: Image.asset(
                      "assets/logo.png",
                      width: 100,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: deviceWidth / 4,
                        padding: EdgeInsets.only(
                            left: 20, top: 7.5, bottom: 7.5, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: searchBarBgColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search",
                              style: TextStyle(color: searchTextColor),
                            ),
                            Icon(
                              Icons.search_rounded,
                              color: searchTextColor,
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                      defaultHSpace,
                      Container(
                        // // width: searchWidth,
                        //  padding: EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/calendar-linear.svg"),
                                defaultHSpace,
                                SvgPicture.asset(
                                    "assets/notification-outline.svg"),
                                defaultHSpace,
                                SvgPicture.asset("assets/poweroff.svg")
                              ],
                            ),
                            defaultHSpace,
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appBarProfileBGColor,
                                  image: DecorationImage(
                                      image: AssetImage("assets/boi.png"))),
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            : (ResponsiveLayout.isPhone(context))
                ? SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: CustomDrawer,
                          child: IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appBarProfileBGColor,
                                  image: DecorationImage(
                                      image: AssetImage("assets/boi.png"))),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.search_rounded),
                            defaultHSpace,
                            Container(
                              // // width: searchWidth,
                              //  padding: EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/calendar-linear.svg"),
                                      defaultHSpace,
                                      SvgPicture.asset(
                                          "assets/notification-outline.svg"),
                                      defaultHSpace,
                                      SvgPicture.asset("assets/poweroff.svg")
                                    ],
                                  ),
                                  defaultHSpace,
                                  // Container(
                                  //   width: 40,
                                  //   height: 40,
                                  //   decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: appBarProfileBGColor,
                                  //       image: DecorationImage(
                                  //           image:
                                  //               AssetImage("assets/boi.png"))),
                                  // ),
                                  // SizedBox(
                                  //   width: 20,
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Image.asset(
                            "assets/logo.png",
                            width: 60,
                          ),
                        ),
                        Text("Home"),
                        Row(
                          children: [
                            Container(
                              width: deviceWidth / 4,
                              padding: EdgeInsets.only(
                                  left: 20, top: 7.5, bottom: 7.5, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: searchBarBgColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Search",
                                    style: TextStyle(color: searchTextColor),
                                  ),
                                  Icon(
                                    Icons.search_rounded,
                                    color: searchTextColor,
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                            defaultHSpace,
                            Container(
                              // // width: searchWidth,
                              //  padding: EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/calendar-linear.svg"),
                                      defaultHSpace,
                                      SvgPicture.asset(
                                          "assets/notification-outline.svg"),
                                      defaultHSpace,
                                      SvgPicture.asset("assets/poweroff.svg")
                                    ],
                                  ),
                                  defaultHSpace,
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appBarProfileBGColor,
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/boi.png"))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
  }
}
