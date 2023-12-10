// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:ui' as ui;
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/ui/custom_drawer/custom_drawer.dart';
import 'package:responsive_office_dashboard_assignment/data/const_data.dart';
import 'package:responsive_office_dashboard_assignment/responsive_layout.dart';

import '../../constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _currentSelectedButton = 0;
  DateTime selectedDate = DateTime.now();
  TextEditingController textController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _confirmTurnOff(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to close this Tab?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Platform.isFuchsia ? _closeTab() : closeApp();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _closeTab() {}

  void closeApp() {
    exit(0);
  }

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
                        height: 40,
                        padding: EdgeInsets.only(
                            left: 20, top: 7.5, bottom: 7.5, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: searchBarBgColor),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          // textAlign: TextAlign.center,
                          style: TextStyle(color: searchTextColor),
                          decoration: InputDecoration(
                              // icon: Icon(
                              //   Icons.search,
                              //   color: searchTextColor,
                              // ),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: searchTextColor),
                              suffixIcon: Icon(
                                Icons.search,
                                color: searchTextColor,
                              ),
                              border: InputBorder.none
                              // border: OutlineInputBorder(
                              //   borderRadius:
                              //       BorderRadius.circular(8.0),
                              // ),
                              ),
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
                                InkWell(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: SvgPicture.asset(
                                        "assets/calendar-linear.svg")),
                                defaultHSpace,
                                SvgPicture.asset(
                                    "assets/notification-outline.svg"),
                                defaultHSpace,
                                InkWell(
                                    onTap: () => _confirmTurnOff(context),
                                    child:
                                        SvgPicture.asset("assets/poweroff.svg"))
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
                            AnimSearchBar(
                              // suffixIcon:
                              color: bgColor,
                              textFieldColor: searchBarBgColor,
                              style: TextStyle(color: bgColor2),
                              textFieldIconColor: bgColor2,
                              searchIconColor: bgColor,
                              boxShadow: false,
                              prefixIcon: Icon(Icons.search_rounded),
                              width: 200,
                              textController: textController,
                              onSuffixTap: () {
                                setState(() {
                                  textController.clear();
                                });
                              },
                              onSubmitted: (String) {},
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
                                      InkWell(
                                          onTap: () {
                                            _selectDate(context);
                                          },
                                          child: SvgPicture.asset(
                                              "assets/calendar-linear.svg")),
                                      defaultHSpace,
                                      SvgPicture.asset(
                                          "assets/notification-outline.svg"),
                                      defaultHSpace,
                                      InkWell(
                                          onTap: () => _confirmTurnOff(context),
                                          child: SvgPicture.asset(
                                              "assets/poweroff.svg"))
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
                            width: 70,
                          ),
                        ),
                        Text("Home"),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: deviceWidth / 4,
                              padding: EdgeInsets.only(
                                  left: 20, top: 7.5, bottom: 7.5, right: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: searchBarBgColor),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                // textAlign: TextAlign.center,
                                style: TextStyle(color: searchTextColor),
                                decoration: InputDecoration(
                                    // icon: Icon(
                                    //   Icons.search,
                                    //   color: searchTextColor,
                                    // ),
                                    hintText: 'Search',
                                    hintStyle:
                                        TextStyle(color: searchTextColor),
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: searchTextColor,
                                    ),
                                    border: InputBorder.none
                                    // border: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.circular(8.0),
                                    // ),
                                    ),
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
                                      InkWell(
                                          onTap: () {
                                            _selectDate(context);
                                          },
                                          child: SvgPicture.asset(
                                              "assets/calendar-linear.svg")),
                                      defaultHSpace,
                                      SvgPicture.asset(
                                          "assets/notification-outline.svg"),
                                      defaultHSpace,
                                      InkWell(
                                          onTap: () => _confirmTurnOff(context),
                                          child: SvgPicture.asset(
                                              "assets/poweroff.svg"))
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
