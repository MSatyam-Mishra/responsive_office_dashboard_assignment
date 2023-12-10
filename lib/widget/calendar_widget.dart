import 'package:flexible_calendar/flexible_calendar.dart';
import 'package:flutter/material.dart';

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
        styleOfDay: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}
