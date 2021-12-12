import 'package:calorie_tracker/auth/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash-screen.png",
            fit: BoxFit.fill,
            width: Get.width,
          ),
          Positioned(
            top: Get.height * 0.1,
            left: Get.width * 0.2,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: Get.width * 0.6,
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                SignInButtonBuilder(
                  text: 'LOGIN WITH GOOGLE',
                  elevation: 2,
                  textColor: const Color(0xFFFFFFFF),
                  image: Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: const Image(
                      image: AssetImage(
                        'assets/logos/google_dark.png',
                        package: 'flutter_signin_button',
                      ),
                      height: 36.0,
                    ),
                  ),
                  backgroundColor: const Color(0xFFFB9B03),
                  onPressed: () {
                    signInWithGoogle().catchError((error) {
                      final snackBar = SnackBar(
                        content: Text(
                          error.message.toString(),
                        ),
                        backgroundColor: Colors.red,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  },
                  padding: const EdgeInsets.all(0),
                  innerPadding: const EdgeInsets.all(0),
                  height: 36.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
