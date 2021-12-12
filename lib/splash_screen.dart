import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/splash-screen.png",
          fit: BoxFit.fill,
          width: Get.width,
        ),
        Positioned(
          top: Get.height * 0.1,
          left: Get.width * 0.2,
          child: Image.asset(
            "assets/images/logo.png",
            width: Get.width * 0.6,
          ),
        )
      ],
    );
  }
}
