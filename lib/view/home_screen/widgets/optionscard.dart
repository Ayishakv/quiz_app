import 'package:flutter/material.dart';

import 'package:quiz_app/utils/color_constants.dart';

class optionscard extends StatelessWidget {
  const optionscard({
    super.key,
    required this.option,
    this.onoptionstapped,
    this.bordercolor,
    required this.optionicon,
  });

  final String option;
  final Function()? onoptionstapped;
  final Color? bordercolor;
  final Widget optionicon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onoptionstapped,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(
                color: bordercolor ?? ColorConstants.maingrey.shade800,
                width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(
              option,
              style: TextStyle(
                  color: ColorConstants.mainwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            optionicon
          ],
        ),
      ),
    );
  }
}
