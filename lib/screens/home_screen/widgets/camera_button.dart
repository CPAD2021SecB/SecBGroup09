import 'dart:io';
import 'package:calorie_tracker/screens/calorie_info_screen/calorie_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraButton extends StatefulWidget {
  final Function fetchCalorieData;
  const CameraButton({Key? key, required this.fetchCalorieData})
      : super(key: key);

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("Image Source"),
                content: SizedBox(
                  height: Get.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DialogButton(
                        iconData: Icons.camera_alt,
                        title: "Camera",
                        imageSource: ImageSource.camera,
                        fetchCalorieData: widget.fetchCalorieData,
                      ),
                      DialogButton(
                        iconData: Icons.landscape_sharp,
                        title: "Gallery",
                        imageSource: ImageSource.gallery,
                        fetchCalorieData: widget.fetchCalorieData,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF90C700),
        ),
        padding: EdgeInsets.all(Get.width * 0.06),
        child: SvgPicture.asset(
          "assets/svg/camera.svg",
          width: Get.width * 0.15,
        ),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final ImageSource imageSource;
  final Function fetchCalorieData;
  const DialogButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.imageSource,
    required this.fetchCalorieData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        await _picker.pickImage(source: imageSource).then((file) async {
          if (file != null) {
            Get.back();
            Get.to(() => CalorieInfoScreen(file: File(file.path)))?.then((_) {
              fetchCalorieData();
            });
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Icon(iconData),
            const SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
