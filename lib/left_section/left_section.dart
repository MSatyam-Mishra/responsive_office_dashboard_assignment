import 'package:flutter/material.dart';

class LeftSection extends StatefulWidget {
  const LeftSection({Key? key}) : super(key: key);

  @override
  State<LeftSection> createState() => _LeftSectionState();
}

class _LeftSectionState extends State<LeftSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
