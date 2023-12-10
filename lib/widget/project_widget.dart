import 'package:flutter/material.dart';
import 'package:responsive_office_dashboard_assignment/constants/colors.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/data/const_data.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    super.key,
  });

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

int _selectedindex = 0;

class _ProjectWidgetState extends State<ProjectWidget> {
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
            const Padding(
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
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: projectImages.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedindex = i;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: i == _selectedindex
                                ? cardSelectedOptionColor
                                : cardUnselectedOptionColor,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(
                            bottom: 10,
                            left: i == _selectedindex ? 10 : 20,
                            right: i == _selectedindex ? 10 : 20),
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
                            const Column(
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
                            const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        )),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}
