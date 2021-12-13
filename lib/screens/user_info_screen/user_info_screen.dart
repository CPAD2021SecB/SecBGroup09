import 'package:calorie_tracker/models/user_info.dart';
import 'package:calorie_tracker/screens/home_screen/home_screen.dart';
import 'package:calorie_tracker/services/user_info_service.dart';
import 'package:calorie_tracker/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  _validateInputs() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      UserData userData = UserData(
        name: _nameController.text,
        age: int.parse(_ageController.text),
        height: double.parse(_heightController.text),
        weight: double.parse(_weightController.text),
        createdAt: DateTime.now(),
      );
      UserInfoService.saveUserData(userData).then((_) {
        setState(() {
          _isLoading = false;
        });

        Get.offAll(() => const HomeScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _validateInputs,
        child: _isLoading
            ? SizedBox.fromSize(
                size: const Size(24, 24),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                ),
              )
            : const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/user-info-background.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  Text(
                    "Please, Enter your Information!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.width * 0.1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    "This will be used in planning your diets, your exercises and helping you get more fit!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Get.width * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) => Validation.validateName(value),
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  TextFormField(
                    controller: _ageController,
                    validator: (value) => Validation.validateAge(value),
                    decoration: const InputDecoration(labelText: "Age"),
                  ),
                  TextFormField(
                    controller: _heightController,
                    validator: (value) => Validation.validateHeight(value),
                    decoration: const InputDecoration(labelText: "Height"),
                  ),
                  TextFormField(
                    controller: _weightController,
                    validator: (value) => Validation.validateWeight(value),
                    decoration: const InputDecoration(labelText: "Weight"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
