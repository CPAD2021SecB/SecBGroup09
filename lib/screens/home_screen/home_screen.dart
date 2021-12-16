import 'package:calorie_tracker/screens/health_status_screen/health_status_screen.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/action_button.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/camera_button.dart';
import 'package:calorie_tracker/screens/home_screen/widgets/daily_progress.dart';
import 'package:calorie_tracker/screens/sport_event_screen/sport_event_screen.dart';
import 'package:calorie_tracker/services/calorie_service.dart';
import 'package:calorie_tracker/services/user_info_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _caloriesConsumed = 0;
  int _totalCalories = 0;
  int _steps = 0;
  late Stream<StepCount> _stepCountStream;

  _fetchCalorieData() async {
    _caloriesConsumed = await CalorieService.fetchUserCalorieInfo();
    _caloriesConsumed = _caloriesConsumed.clamp(0, double.infinity).toInt();
    await UserInfoService.fetchUserData()
        .then((userData) => _totalCalories = userData.dailyCalorieIntake ?? 1);
    setState(() {});
  }

  _onStepCount(StepCount event) {
    _steps += event.steps;
    int calorieBurned = _steps % 20;
    _steps = _steps - (calorieBurned * 20);
    CalorieService.updateUserCalorieInfo(-calorieBurned);
  }

  _onStepCountError(error) {
    final snackBar = SnackBar(
      content: Text(
        error.message.toString(),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;

    _stepCountStream.listen(_onStepCount).onError(_onStepCountError);
  }

  @override
  void initState() {
    super.initState();
    _fetchCalorieData();
    _initPlatformState();
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
              caloriesConsumed: _caloriesConsumed,
              totalCalories: _totalCalories,
            ),
            SizedBox(
              height: Get.height * 0.2,
            ),
            Column(
              children: [
                CameraButton(
                  fetchCalorieData: _fetchCalorieData,
                ),
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
                            allocatedCalories: _totalCalories,
                            isHealthy: (_caloriesConsumed / _totalCalories) < 1,
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
