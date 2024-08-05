import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/view/home_screen/widgets/optionscard.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.questions});
  final List questions;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentqstnindex = 0;
  int? selectedindex;
  int rightanswercount = 0;
  int wronganswercount = 0;
  int skippedanswercount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainblack,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: ColorConstants.mainwhite,
                )),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 20,
                color: ColorConstants.mainwhite,
              ),
            ),
          ),
        ),
        backgroundColor: ColorConstants.mainblack,
        title: Container(
          height: 30,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: ColorConstants.mainwhite,
              )),
          child: LinearPercentIndicator(
            backgroundColor: ColorConstants.mainwhite,
            progressColor: ColorConstants.mainorange,
            percent: (currentqstnindex + 1) / widget.questions.length,
            lineHeight: 5,
            width: 250,
            barRadius: Radius.circular(10),
            trailing: Text("${currentqstnindex + 1}/${widget.questions.length}",
                style:
                    TextStyle(color: ColorConstants.lightblue, fontSize: 16)),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 250,
                  ),
                  Positioned(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: ColorConstants.mainAsh,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          widget.questions[currentqstnindex]["question"]
                              .toString(),
                          style: TextStyle(
                              color: ColorConstants.mainwhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: ColorConstants.mainblack,
                      radius: 30,
                      child: CircularPercentIndicator(
                        backgroundColor: ColorConstants.mainAsh,
                        // animation: true,
                        lineWidth: 5,
                        percent:
                            (currentqstnindex + 1) / widget.questions.length,
                        radius: 30,
                        center: Text(
                          "${currentqstnindex + 1}",
                          style: TextStyle(
                              color: ColorConstants.mainwhite, fontSize: 20),
                        ),
                        progressColor: ColorConstants.lightblue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(
                  4,
                  (index) {
                    List ansoption =
                        widget.questions[currentqstnindex]["option"];
                    return optionscard(
                      bordercolor: getcolor(index),
                      optionicon: geticon(index),
                      onoptionstapped: () {
                        if (selectedindex == null) {
                          selectedindex = index;
                          setState(() {
                            selectedindex = index;
                            if (selectedindex ==
                                widget.questions[currentqstnindex]
                                    ["answerindex"]) {
                              rightanswercount++;
                              print(rightanswercount);
                            } else {
                              wronganswercount++;
                            }
                          });
                        }
                      },
                      option: ansoption[index],
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  if (selectedindex != null) {
                    if (currentqstnindex < widget.questions.length - 1) {
                      currentqstnindex++;
                      selectedindex = null;
                      setState(() {});
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              percentage: widget.questions.length,
                              skippedanswercount: skippedanswercount,
                              wronganswercount: wronganswercount,
                              rightanswercount: rightanswercount,
                            ),
                          ));
                    }
                  } else {
                    if (currentqstnindex < widget.questions.length - 1) {
                      skippedanswercount++;
                      currentqstnindex++;
                      selectedindex = null;
                      setState(() {});
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              skippedanswercount: skippedanswercount + 1,
                              wronganswercount: wronganswercount,
                              rightanswercount: rightanswercount,
                              percentage: widget.questions.length,
                            ),
                          ));
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorConstants.lightblue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: ColorConstants.mainwhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getcolor(int index) {
    if (selectedindex != null) {
      if (widget.questions[currentqstnindex]["answerindex"] == selectedindex &&
          index == selectedindex) {
        return ColorConstants.lightblue;
      } else if (widget.questions[currentqstnindex]["answerindex"] !=
              selectedindex &&
          index == selectedindex) {
        return ColorConstants.mainred;
      } else if (widget.questions[currentqstnindex]["answerindex"] == index) {
        return ColorConstants.lightblue;
      }
    }
    return ColorConstants.maingrey.shade800;
  }

  Widget geticon(int index) {
    if (selectedindex != null) {
      if (widget.questions[currentqstnindex]["answerindex"] == selectedindex &&
          index == selectedindex) {
        return Icon(
          Icons.check_circle,
          color: ColorConstants.lightblue,
        );
      } else if (widget.questions[currentqstnindex]["answerindex"] !=
              selectedindex &&
          index == selectedindex) {
        return Icon(
          Icons.cancel,
          color: ColorConstants.mainred,
        );
      } else if (widget.questions[currentqstnindex]["answerindex"] == index) {
        return Icon(
          Icons.check_circle,
          color: ColorConstants.lightblue,
        );
      }
    }
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorConstants.mainAsh)),
    );
  }
}
