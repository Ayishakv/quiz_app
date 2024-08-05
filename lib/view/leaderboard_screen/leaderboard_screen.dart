import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/utils/image_constatnts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.ashblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: ColorConstants.mainwhite,
            )),
        title: Text(
          "Leaderboard",
          style: TextStyle(
              color: ColorConstants.mainwhite,
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: toggleSwitchSection(),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                    ),
                    Positioned(
                        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "David james",
                            style: TextStyle(color: ColorConstants.mainwhite),
                          ),
                          Text(
                            "145.093",
                            style: TextStyle(
                                color: ColorConstants.mainwhite,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      height: 160,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.mainAsh.withOpacity(.5),
                      ),
                    )),
                    Positioned(
                        left: 25,
                        bottom: 0,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Maria.c",
                                style:
                                    TextStyle(color: ColorConstants.mainwhite),
                              ),
                              Text(
                                "120.774",
                                style: TextStyle(
                                    color: ColorConstants.mainwhite,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          height: 160,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.mainAsh.withOpacity(.2),
                          ),
                        )),
                    Positioned(
                        right: 25,
                        bottom: 0,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Peter",
                                style:
                                    TextStyle(color: ColorConstants.mainwhite),
                              ),
                              Text(
                                "95.876",
                                style: TextStyle(
                                    color: ColorConstants.mainwhite,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          height: 160,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorConstants.mainAsh.withOpacity(.2),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 100,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: ColorConstants.mainyellow,
                                child: CircleAvatar(
                                  backgroundColor: ColorConstants.mainwhite,
                                  radius: 55,
                                  child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          ImageConstatnts.profile_picture1)),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                left: 88,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: ColorConstants.mainyellow,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: ColorConstants.mainwhite),
                                  ),
                                )),
                            Positioned(
                                left: 75,
                                top: 0,
                                child: Image.asset(
                                  ImageConstatnts.crown,
                                  height: 45,
                                ))
                          ],
                        )),
                    Positioned(
                        left: 0,
                        top: 60,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 80,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: ColorConstants.maingreen,
                                child: CircleAvatar(
                                  backgroundColor: ColorConstants.mainwhite,
                                  radius: 35,
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          ImageConstatnts.profile_picture2)),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                left: 75,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: ColorConstants.maingreen,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: ColorConstants.mainwhite),
                                  ),
                                )),
                          ],
                        )),
                    Positioned(
                        right: 0,
                        top: 60,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 80,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: ColorConstants.mainorange,
                                child: CircleAvatar(
                                  backgroundColor: ColorConstants.mainwhite,
                                  radius: 35,
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          ImageConstatnts.profile_picture3)),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                left: 75,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: ColorConstants.mainorange,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        color: ColorConstants.mainwhite),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          _buildLeaderboardList(),
        ],
      ),
    );
  }

  Container _buildLeaderboardList() {
    return Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 40),
        height: 479,
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorConstants.mainblack,
            borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(60, 60))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              leaderboardTile(
                index: "4",
                image: ImageConstatnts.profile_picture1,
                name: "Smith Carol",
                points: "91.736",
              ),
              SizedBox(
                height: 20,
              ),
              leaderboardTile(
                  index: "5",
                  image: ImageConstatnts.profile_picture2,
                  name: "Stina ",
                  points: "90.281"),
              SizedBox(
                height: 20,
              ),
              leaderboardTile(
                index: "6",
                image: ImageConstatnts.profile_picture3,
                name: "Benedict",
                points: "88.436",
              ),
              SizedBox(
                height: 20,
              ),
              leaderboardTile(
                  index: "7",
                  image: ImageConstatnts.profile_picture1,
                  name: "Gabriel",
                  points: "85.287"),
              SizedBox(
                height: 20,
              ),
              leaderboardTile(
                  index: "8",
                  image: ImageConstatnts.profile_picture2,
                  name: "Yahiro",
                  points: "84.007"),
              SizedBox(
                height: 20,
              ),
              leaderboardTile(
                  index: "9",
                  image: ImageConstatnts.profile_picture3,
                  name: "Saami",
                  points: "83.293"),
              SizedBox(
                height: 20,
              ),
              leaderboardTile(
                  index: "10",
                  image: ImageConstatnts.profile_picture1,
                  name: "James",
                  points: "82.123"),
            ],
          ),
        ));
  }
}

class toggleSwitchSection extends StatelessWidget {
  const toggleSwitchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      initialLabelIndex: 0,
      totalSwitches: 3,
      labels: ["All Time", "This Week", "Month"],
      minHeight: 50,
      minWidth: double.infinity,
      cornerRadius: 15,
      inactiveBgColor: ColorConstants.mainAsh,
      activeBgColor: [ColorConstants.lightblue],
      fontSize: 16,
      customTextStyles: [TextStyle(color: ColorConstants.mainwhite)],
      dividerColor: ColorConstants.mainAsh,
      radiusStyle: true,
      activeBorders: [Border.all(color: ColorConstants.mainAsh, width: 4)],
    );
  }
}

class leaderboardTile extends StatelessWidget {
  const leaderboardTile({
    super.key,
    required this.index,
    required this.image,
    required this.name,
    required this.points,
  });
  final String index;
  final String image;
  final String name;
  final String points;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.mainAsh),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              index,
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 16),
            ),
            SizedBox(
              width: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(
                  color: ColorConstants.mainwhite,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              points,
              style: TextStyle(
                  color: ColorConstants.lightblue,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
