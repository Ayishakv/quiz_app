import 'package:flutter/material.dart';

import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/view/category_screen/category_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.rightanswercount,
    required this.wronganswercount,
    required this.skippedanswercount,
    required this.percentage,
  });
  final int rightanswercount;
  final int wronganswercount;
  final int skippedanswercount;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    double percent = rightanswercount * 100 / percentage;

    return Scaffold(
      backgroundColor: ColorConstants.mainblack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congrats!",
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 30),
            ),
            Text(
              "$percent % Score",
              style: TextStyle(color: ColorConstants.maingreen, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Correct Answers: $rightanswercount",
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 20),
            ),
            Text(
              "Wrong Answers: $wronganswercount",
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 20),
            ),
            Text(
              "Skipped Questions: $skippedanswercount",
              style: TextStyle(color: ColorConstants.mainwhite, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(0, 50)),
                  backgroundColor:
                      WidgetStatePropertyAll(ColorConstants.mainorange),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil(
                    (route) => route.isFirst,
                  );
                },
                child: Text(
                  "Restart",
                  style: TextStyle(
                      color: ColorConstants.mainwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(0, 50)),
                  backgroundColor:
                      WidgetStatePropertyAll(ColorConstants.mainorange),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: ColorConstants.mainwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
