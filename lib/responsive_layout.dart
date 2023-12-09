import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  ResponsiveLayout(
      {super.key,
      required this.small,
      required this.phone,
      required this.tab,
      required this.largeTab,
      required this.computer});
  final Widget small;
  final Widget phone;
  final Widget tab;
  final Widget largeTab;
  final Widget computer;

  static final int smallheightLimit = 100;
  static final int smallLimit = 270;
  static final int phoneLimit = 550;
  static final int tabLimit = 800;
  static final int largeTabLimit = 1100;

  static bool isSmallheightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < smallheightLimit;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < smallLimit;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= smallLimit;

  static bool istablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  static bool isLargetablet(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTabLimit &&
      MediaQuery.of(context).size.width >= tabLimit;
  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxHeight < smallheightLimit ||
          constraints.maxWidth < smallLimit) {
        return small;
      }
      if (constraints.maxWidth < phoneLimit) {
        return phone;
      }
      if (constraints.maxWidth < tabLimit) {
        return tab;
      }
      if (constraints.maxWidth < largeTabLimit) {
        return largeTab;
      } else {
        return computer;
      }
    }));
  }
}
