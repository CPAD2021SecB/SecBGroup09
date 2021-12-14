import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class CalorieService {
  static Future<int> fetchUserCalorieInfo() async {
    int? calorie;
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    DocumentSnapshot response = await FirebaseFirestore.instance
        .collection('calorie_intake')
        .doc(userId)
        .get();
    if (response.exists) {
      calorie =
          (response.data() as Map)[DateFormat.yMd().format(DateTime.now())];
    }

    return calorie ?? 0;
  }

  static Future<void> updateUserCalorieInfo(int calorie) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    int currentCalorie = await fetchUserCalorieInfo();
    await FirebaseFirestore.instance
        .collection("calorie_intake")
        .doc(userId)
        .set(
      {DateFormat.yMd().format(DateTime.now()): currentCalorie + calorie},
      SetOptions(merge: true),
    );
  }
}
