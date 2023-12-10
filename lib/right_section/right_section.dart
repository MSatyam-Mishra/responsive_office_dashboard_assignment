import 'package:flutter/material.dart';
import 'package:responsive_office_dashboard_assignment/center_section/center_section.dart';

class RightSection extends StatefulWidget {
  const RightSection({Key? key}) : super(key: key);

  @override
  State<RightSection> createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CalendarWidget()],
    );
  }
}
