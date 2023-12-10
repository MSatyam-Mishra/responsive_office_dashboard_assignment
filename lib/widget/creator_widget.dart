import 'package:flutter/material.dart';
import 'package:responsive_office_dashboard_assignment/constants/colors.dart';
import 'package:responsive_office_dashboard_assignment/constants/geometry.dart';
import 'package:responsive_office_dashboard_assignment/data/const_data.dart';

class CreatorWidget extends StatelessWidget {
  const CreatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(15),

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
                "Top Creators",
                style: TextStyle(color: Colors.white),
              ),
            ),
            defaultSpace,
            const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Artworks",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: 180 - 30,
              child: ListView.builder(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                        fit: BoxFit.fill,
                                        "assets/${creatorList[i].image}"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].id,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].artworks.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: baseRatingbarColor)),
                                  width: 28,
                                  height: 6,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: i == 0
                                        ? 25
                                        : i == 1
                                            ? 20
                                            : i == 2
                                                ? 23
                                                : 22,
                                    height: 6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: cardRatingBarColor))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}
