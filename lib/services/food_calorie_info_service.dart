import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:calorie_tracker/models/fetched_food_info.dart';
import 'package:calorie_tracker/models/food_items.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/get_utils.dart';

class FoodCalorieInfoService {
  static Future<List<String>> fetchFoodLabels(Uint8List file) async {
    String base64Image = base64Encode(file);
    Response? response;
    List<String> labels = [];

    try {
      Options options = Options(headers: {"Content-Type": "application/json"});

      String baseUrl =
          kIsWeb ? "http://localhost:3000" : "http://10.0.2.2:3000";

      response = await Dio().post(
        baseUrl + "/labels",
        data: jsonEncode({"image": base64Image}),
        options: options,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response?.statusCode == 200) {
      for (var element in (response?.data as List)) {
        if (!["fruit", "food"].contains(element.toString().toLowerCase())) {
          labels.add(element.toString());
        }
      }
    }

    return labels;
  }

  static Future<FetchedFoodInfo> fetchFoodCalorieValue(
      List<String> foodItems) async {
    FetchedFoodInfo fetchedFoodInfo =
        FetchedFoodInfo(foodItems: [], totalCalories: 0);
    String combinedFoodItems = "";
    Response? response;
    for (var foodItem in foodItems) {
      combinedFoodItems += "$foodItem ";
    }

    try {
      Options options = Options(headers: {
        "x-app-id": "d10a344b",
        "x-app-key": "3f3bf5446658e9116dd0c970e8122ada",
        "Content-Type": "application/json"
      });
      response = await Dio().post(
        "https://trackapi.nutritionix.com/v2/natural/nutrients",
        data: '{"query":"$combinedFoodItems","timezone": "US/Eastern"}',
        options: options,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (response?.statusCode == 200) {
      final foodItems = FoodItems.fromMap(response?.data);
      foodItems.foods?.forEach((food) {
        fetchedFoodInfo.foodItems
            .add(GetUtils.capitalize(food.foodName ?? '') ?? '');
        fetchedFoodInfo.totalCalories +=
            double.tryParse(food.nfCalories?.toString() ?? '0')?.toInt() ?? 0;
      });
    }

    return fetchedFoodInfo;
  }
}
