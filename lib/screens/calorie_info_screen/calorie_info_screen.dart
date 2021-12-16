import 'dart:io';
import 'package:calorie_tracker/models/fetched_food_info.dart';
import 'package:calorie_tracker/screens/calorie_info_screen/widgets/action_button.dart';
import 'package:calorie_tracker/screens/calorie_info_screen/widgets/calorie_info.dart';
import 'package:calorie_tracker/services/calorie_service.dart';
import 'package:calorie_tracker/services/food_calorie_info_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:shimmer/shimmer.dart';

class CalorieInfoScreen extends StatefulWidget {
  final File file;
  const CalorieInfoScreen({Key? key, required this.file}) : super(key: key);

  @override
  State<CalorieInfoScreen> createState() => _CalorieInfoScreenState();
}

class _CalorieInfoScreenState extends State<CalorieInfoScreen> {
  List<String> scannedItems = [];
  bool _isLoading = true;
  FetchedFoodInfo fetchedFoodInfo =
      FetchedFoodInfo(foodItems: [], totalCalories: 0);

  @override
  void initState() {
    super.initState();
    _fetchCalorieInfo();
  }

  _fetchCalorieInfo() async {
    final inputImage = InputImage.fromFile(widget.file);
    final imageLabeler = GoogleMlKit.vision.imageLabeler();
    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      scannedItems.add(label.label);
    }

    FoodCalorieInfoService.fetchFoodCalorieValue(scannedItems)
        .then((_fetchedFoodInfo) {
      fetchedFoodInfo = _fetchedFoodInfo;
      setState(() {
        _isLoading = false;
      });
    });
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.file(
                  widget.file,
                  height: Get.height * 0.4,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
                _isLoading
                    ? Shimmer.fromColors(
                        child: CalorieInfo(fetchedFoodInfo: fetchedFoodInfo),
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                      )
                    : CalorieInfo(fetchedFoodInfo: fetchedFoodInfo),
              ],
            ),
            _isLoading
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButton(
                          onTap: () {
                            CalorieService.updateUserCalorieInfo(
                                    fetchedFoodInfo.totalCalories)
                                .then((value) => Get.back());
                          },
                          color: const Color(0xFF90C700),
                          iconData: Icons.check,
                        ),
                        ActionButton(
                          onTap: () {
                            Get.back();
                          },
                          color: const Color(0xFFDA3B3B),
                          iconData: Icons.clear,
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
