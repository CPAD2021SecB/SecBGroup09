import 'package:calorie_tracker/services/calorie_service.dart';
import 'package:calorie_tracker/services/user_info_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DailyProgress extends StatefulWidget {
  const DailyProgress({Key? key}) : super(key: key);

  @override
  State<DailyProgress> createState() => _DailyProgressState();
}

class _DailyProgressState extends State<DailyProgress> {
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
    return CircularPercentIndicator(
      radius: Get.width * 0.6,
      lineWidth: 8.0,
      percent: (caloriesConsumed / totalCalories).clamp(0, 1),
      progressColor: ((caloriesConsumed / totalCalories) > 1)
          ? const Color(0xFFFDC402)
          : const Color(0xFFA2C101),
      backgroundColor: const Color(0xFF4E4E4E),
      center: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.05),
        child: Column(
          children: [
            Text(
              '$caloriesConsumed \n/ $totalCalories',
              style: TextStyle(
                fontSize: Get.width * 0.12,
                color: Colors.white,
              ),
            ),
            Text(
              'cal left',
              style: TextStyle(
                fontSize: Get.width * 0.08,
                color: const Color(0xFFFDA104),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
