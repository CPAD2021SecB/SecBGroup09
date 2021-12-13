import 'dart:convert';

UserData userInfoFromMap(String str) => UserData.fromMap(json.decode(str));

String userInfoToMap(UserData data) => json.encode(data.toMap());

class UserData {
  UserData({
    this.name,
    this.age,
    this.height,
    this.weight,
    this.dailyCalorieIntake,
    this.createdAt,
  });

  final String? name;
  final int? age;
  final double? height;
  final double? weight;
  final int? dailyCalorieIntake;
  final DateTime? createdAt;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
      name: json["name"],
      age: json["age"],
      dailyCalorieIntake: json["daily_calorie_intake"],
      height: json["height"].toDouble(),
      weight: json["weight"].toDouble(),
      createdAt: DateTime.parse(json["created_at"]));

  Map<String, dynamic> toMap() => {
        "name": name,
        "age": age,
        "height": height,
        "weight": weight,
        "daily_calorie_intake": dailyCalorieIntake,
        "created_at": createdAt?.toIso8601String(),
      };
}
