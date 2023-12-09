// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_office_dashboard_assignment/responsive_layout.dart';

import 'constants/colors.dart';
import 'data/const_data.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

int _selectedindex = 0;

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height:
            ResponsiveLayout.isPhone(context) ? deviceHeight : double.infinity,
        width: ResponsiveLayout.isComputer(context) ? deviceWidth * 0.22 : 300,
        child: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: Colors.white,
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(
                      top: defaulPadding,
                      //left: defaulPadding,
                      bottom: defaulPadding),
                  child: Container(
                    height: ResponsiveLayout.isPhone(context)
                        ? deviceHeight
                        : double.infinity,
                    child: Column(
                      mainAxisAlignment: (ResponsiveLayout.isPhone(context))
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.start,
                      //set main axis to be space b/w
                      children: [
                        Column(
                          children: [
                            ResponsiveLayout.isPhone(context)
                                ? Image.asset(
                                    "assets/logo.png",
                                    width: 100,
                                  )
                                : Container(),
                            defaultSpace,
                            Container(
                              height: 1,
                              color: seperatorColor,
                            ),
                            defaultSpace,
                            Hero(
                              tag: CustomDrawer,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3, color: Colors.yellow)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      "assets/profile.jpg",
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            defaultSpace,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7.5),
                              child: Text("Admin"),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: seperatorColor, width: 2)),
                            ),
                            defaultSpace,
                            Container(
                              height: 1,
                              color: seperatorColor,
                            ),
                            defaultSpace,
                            //add seperator
                            //add admin image
                            //add  admin name
                            //add admin badge,
                            ...List.generate(
                                sideMenuItems.length,
                                (i) => Column(
                                      children: [
                                        Container(
                                          child: ListTile(
                                            onTap: () {
                                              setState(() {
                                                _selectedindex = i;
                                              });
                                            },
                                            title: Text(
                                              sideMenuItems[i].name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            leading: Padding(
                                              padding:
                                                  EdgeInsets.all(defaulPadding),
                                              child: SvgPicture.asset(
                                                  "assets/${sideMenuItems[i].image}"),
                                            ),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedBackgroundColor:
                                    const Color(0xffe3e9fe),
                                trailing: const Icon(Icons.add),
                                // initiallyExpanded: true,

                                title: Padding(
                                  padding: EdgeInsets.only(left: defaulPadding),
                                  child: const Text(
                                    "WORKSPACE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(left: 50),
                                    child: ListTile(
                                      title: Text("Adstacks"),
                                      trailing: Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 50),
                                    child: ListTile(
                                      title: Text("Finance"),
                                      trailing: Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              onTap: () {},
                              title: const Text(
                                "Setting",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              leading: Padding(
                                  padding: EdgeInsets.all(defaulPadding),
                                  child: const Icon(Icons.settings)),
                            ),
                            ListTile(
                              onTap: () {},
                              title: const Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              leading: Padding(
                                  padding: EdgeInsets.all(defaulPadding),
                                  child: const Icon(Icons.logout)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
