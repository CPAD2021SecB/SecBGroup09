import 'package:calorie_tracker/screens/health_status_screen/health_status_screen.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/action_button.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/camera_button.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/daily_progress.dart';
import 'package:calorie_tracker/screens/sport_event_screen/sport_event_screen.dart';
import 'package:calorie_tracker/services/calorie_service.dart';
import 'package:calorie_tracker/services/user_info_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int caloriesConsumed = 0;
  int totalCalories = 0;

  @override
  void initState() {
    super.initState();
    _fetchCalorieData();
  }

  _fetchCalorieData() async {
    caloriesConsumed = await CalorieService.fetchUserCalorieInfo();
    await UserInfoService.fetchUserData()
        .then((userData) => totalCalories = userData.dailyCalorieIntake ?? 1);
    setState(() {});
  }

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
            DailyProgress(
              caloriesConsumed: caloriesConsumed,
              totalCalories: totalCalories,
            ),
            SizedBox(
              height: Get.height * 0.2,
            ),
            Column(
              children: [
                const CameraButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      svgPath: "assets/svg/events.svg",
                      onPressed: () {
                        Get.to(() => const SportEventScreen());
                      },
                    ),
                    ActionButton(
                      svgPath: "assets/svg/status.svg",
                      onPressed: () {
                        Get.to(
                          () => HealthStatusScreen(
                            allocatedCalories: totalCalories,
                            isHealthy: (caloriesConsumed / totalCalories) < 1,
                          ),
                        );
                      },
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
