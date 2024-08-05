import 'package:flutter/material.dart';
import 'package:quiz_app/dummydb.dart';

import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/utils/image_constatnts.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';
import 'package:quiz_app/view/leaderboard_screen/leaderboard_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainblack,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // profile section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, John",
                        style: TextStyle(
                            color: ColorConstants.mainwhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        "Let's make this day productive",
                        style: TextStyle(
                            color: ColorConstants.mainwhite, fontSize: 16),
                      )
                    ],
                  ),
                  Image.asset(
                    ImageConstatnts.profile_picture1,
                    height: 70,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),

              // Ranking and points section
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LeaderboardScreen(),
                      ));
                },
                child: Container(
                  height: 85,
                  decoration: BoxDecoration(
                      color: ColorConstants.mainAsh,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstatnts.trophy,
                          height: 50,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ranking",
                              style: TextStyle(
                                  color: ColorConstants.mainwhite,
                                  fontSize: 14),
                            ),
                            Text(
                              "348",
                              style: TextStyle(
                                  color: ColorConstants.lightblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Spacer(),
                        VerticalDivider(
                          color: ColorConstants.mainwhite,
                          endIndent: 5,
                          indent: 5,
                          thickness: 2,
                        ),
                        Spacer(),
                        Image.asset(
                          ImageConstatnts.coin,
                          height: 40,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Points",
                              style: TextStyle(
                                  color: ColorConstants.mainwhite,
                                  fontSize: 14),
                            ),
                            Text(
                              "1209",
                              style: TextStyle(
                                  color: ColorConstants.lightblue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Let's Play",
                style: TextStyle(
                    color: ColorConstants.mainwhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: Dummydb.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 260, crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            questions: Dummydb.question[index],
                          ),
                        ));
                  },
                  child: categoryCard(
                      image: Dummydb.categories[index]["image"],
                      categoryName: Dummydb.categories[index]["category name"],
                      categoryCount: Dummydb.categories[index]
                          ["category count"]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class categoryCard extends StatelessWidget {
  const categoryCard({
    super.key,
    required this.image,
    required this.categoryName,
    required this.categoryCount,
  });
  final String image;
  final String categoryName;
  final String categoryCount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 260,
          width: 180,
        ),
        Positioned(
            top: 50,
            child: Container(
              height: 200,
              width: 170,
              decoration: BoxDecoration(
                  color: ColorConstants.mainAsh,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryName,
                      style: TextStyle(
                          color: ColorConstants.mainwhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "$categoryCount Questions",
                      style: TextStyle(
                          color: ColorConstants.mainwhite, fontSize: 16),
                    ),
                  ],
                ),
              ),
            )),
        Positioned(
            child: Image.asset(
          image,
          height: 150,
        ))
      ],
    );
  }
}
