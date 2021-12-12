import 'package:calorie_tracker/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoService {
  static Future<bool> userDetailExistsInDb(String userId) async {
    final snapShot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    return snapShot.exists;
  }

  static Future<UserData> fetchUserData() async {
    DocumentSnapshot response;
    UserData userData;
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    response =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    userData = userInfoFromMap(response.data().toString());

    return userData;
  }

  static Future<void> saveUserData(UserData userData) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userData.toMap());
  }
}
