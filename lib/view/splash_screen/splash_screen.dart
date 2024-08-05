import 'package:flutter/material.dart';

import 'package:quiz_app/utils/color_constants.dart';
import 'package:quiz_app/utils/image_constatnts.dart';
import 'package:quiz_app/view/category_screen/category_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainblack,
      body: Center(
          child: Image.asset(
        ImageConstatnts.splash_logo,
        height: 150,
      )),
    );
  }
}
