import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF90C700),
      ),
      padding: EdgeInsets.all(Get.width * 0.06),
      child: SvgPicture.asset(
        "assets/svg/camera.svg",
        width: Get.width * 0.15,
      ),
    );
  }
}
