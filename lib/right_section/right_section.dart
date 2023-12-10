import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_office_dashboard_assignment/center_section/center_section.dart';
import 'package:responsive_office_dashboard_assignment/constants/colors.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/data/const_data.dart';

class RightSection extends StatefulWidget {
  const RightSection({Key? key}) : super(key: key);

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      color: righBgcolor,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "GENERAL 10:00 AM To 7:00 PM",
              style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            defaultSpace,
            CalendarWidget(),
            defaultSpace,
            BirthdayWidget(),
            defaultSpace,
            AnniversaryWidget(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
