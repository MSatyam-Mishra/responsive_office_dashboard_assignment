// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:responsive_office_dashboard_assignment/ui/center_section/center_section.dart';
import 'package:responsive_office_dashboard_assignment/constants/colors.dart';
import 'package:responsive_office_dashboard_assignment/ui/custom_appbar/custom_appbar.dart';

import 'package:responsive_office_dashboard_assignment/responsive_layout.dart';
import 'package:responsive_office_dashboard_assignment/ui/right_section/right_section.dart';

import 'ui/custom_drawer/custom_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: (ResponsiveLayout.isSmall(context) ||
                  ResponsiveLayout.isSmallheightLimit(context))
              ? Container()
              : CustomAppBar()),
      body: ResponsiveLayout(
        small: Container(),
        phone: const CenterSection(),
        tab: const Row(
          children: [
            // Expanded(
            //   child: LeftSection(),
            // ),
            Expanded(child: CenterSection())
          ],
        ),
        largeTab: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //   child: LeftSection(),
            // ),
            Expanded(
              flex: 2,
              child: CenterSection(),
            ),
            Expanded(child: RightSection())
          ],
        ),
        computer: const Row(
          children: [
            CustomDrawer(),
            // Expanded(
            //   child: LeftSection(),
            // ),
            Expanded(
              flex: 2,
              child: CenterSection(),
            ),
            Expanded(child: RightSection())
          ],
        ),
      ),
    );
  }
}
