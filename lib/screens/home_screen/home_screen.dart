import 'package:calorie_tracker/screens/home_screen/widgets/action_button.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/camera_button.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/daily_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/home-screen-background.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            const DailyProgress(),
            SizedBox(
              height: Get.height * 0.2,
            ),
            Column(
              children: [
                const CameraButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ActionButton(
                      svgPath: "assets/svg/events.svg",
                    ),
                    ActionButton(
                      svgPath: "assets/svg/status.svg",
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
