import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final String svgPath;

  const ActionButton({Key? key, required this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFDA104),
      ),
      padding: EdgeInsets.all(Get.width * 0.04),
      child: SvgPicture.asset(
        svgPath,
        width: Get.width * 0.12,
      ),
    );
  }
}
