import 'package:calorie_tracker/models/fetched_food_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalorieInfo extends StatelessWidget {
  final FetchedFoodInfo fetchedFoodInfo;
  const CalorieInfo({Key? key, required this.fetchedFoodInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String combinedFoodItems = "";
    for (var foodItem in fetchedFoodInfo.foodItems) {
      combinedFoodItems += "$foodItem, ";
    }
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detected Food Items",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFB9B03),
              fontSize: Get.height * 0.035,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            combinedFoodItems,
            style: TextStyle(
              color: Colors.white,
              fontSize: Get.height * 0.025,
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Text(
            "Calories",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFB9B03),
              fontSize: Get.height * 0.035,
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            fetchedFoodInfo.totalCalories.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: Get.height * 0.025,
            ),
          ),
        ],
      ),
    );
  }
}
