import 'package:calorie_tracker/screens/home_screen/home_screen.dart';
import 'package:calorie_tracker/screens/login_screen/login_screen.dart';
import 'package:calorie_tracker/screens/user_info_screen/user_info_screen.dart';
import 'package:calorie_tracker/services/user_info_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _authCheck();
  }

  void _authCheck() async {
    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user == null) {
        Get.offAll(() => const LoginScreen());
      } else if (await UserInfoService.userDetailExistsInDb(user.uid)) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => const UserInfoScreen());
      }
    });
  }

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
