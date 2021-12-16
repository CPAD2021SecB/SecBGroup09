import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final IconData iconData;
  const ActionButton(
      {Key? key,
      required this.onTap,
      required this.color,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: EdgeInsets.all(Get.width * 0.04),
        child: Icon(
          iconData,
          size: Get.width * 0.12,
        ),
      ),
    );
  }
}
