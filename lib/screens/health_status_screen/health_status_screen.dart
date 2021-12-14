import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HealthStatusScreen extends StatelessWidget {
  final int allocatedCalories;
  final bool isHealthy;
  const HealthStatusScreen(
      {Key? key, required this.allocatedCalories, required this.isHealthy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        backgroundColor:
            isHealthy ? const Color(0xFFA2C101) : const Color(0xFFFDC402),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/${isHealthy ? "healthy" : "obese"}-status-bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You are...",
                style: TextStyle(
                  fontSize: Get.height * 0.04,
                ),
              ),
              Text(
                isHealthy ? "HEALTHY" : "OBESE",
                style: TextStyle(
                  fontSize: Get.height * 0.08,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              isHealthy
                  ? Text(
                      "Congrats!\nYou've been keeping busy,\nmaintaining your body.\n\nDo continue in making it better!\n\nYou've been allocated",
                      style: TextStyle(fontSize: Get.height * 0.025),
                    )
                  : Text(
                      "Oh No!\nYou've been keeping busy,\nbut maintaining your body\nis very important.\n\nLets begin to make it better!\n\nYou've been allocated",
                      style: TextStyle(fontSize: Get.height * 0.025),
                    ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                allocatedCalories.toString(),
                style: TextStyle(
                  fontSize: Get.height * 0.08,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "calories/day",
                style: TextStyle(fontSize: Get.height * 0.05),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
