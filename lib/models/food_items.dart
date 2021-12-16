// To parse this JSON data, do
//
//     final foodItems = foodItemsFromMap(jsonString);

import 'dart:convert';

FoodItems foodItemsFromMap(String str) => FoodItems.fromMap(json.decode(str));

String foodItemsToMap(FoodItems data) => json.encode(data.toMap());

class FoodItems {
  FoodItems({
    this.foods,
  });

  final List<Food>? foods;

  FoodItems copyWith({
    List<Food>? foods,
  }) =>
      FoodItems(
        foods: foods ?? this.foods,
      );

  factory FoodItems.fromMap(Map<String, dynamic> json) => FoodItems(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "foods": List<dynamic>.from(foods?.map((x) => x.toMap()) ?? []),
      };
}

class Food {
  Food({
    this.foodName,
    this.brandName,
    this.servingQty,
    this.servingUnit,
    this.servingWeightGrams,
    this.nfCalories,
    this.nfTotalFat,
    this.nfSaturatedFat,
    this.nfCholesterol,
    this.nfSodium,
    this.nfTotalCarbohydrate,
    this.nfDietaryFiber,
    this.nfSugars,
    this.nfProtein,
    this.nfPotassium,
    this.nfP,
    this.fullNutrients,
    this.nixBrandName,
    this.nixBrandId,
    this.nixItemName,
    this.nixItemId,
    this.upc,
    this.consumedAt,
    this.metadata,
    this.source,
    this.ndbNo,
    this.tags,
    this.altMeasures,
    this.lat,
    this.lng,
    this.mealType,
    this.photo,
    this.subRecipe,
    this.classCode,
    this.brickCode,
    this.tagId,
  });

  final String? foodName;
  final dynamic brandName;
  final dynamic servingQty;
  final String? servingUnit;
  final dynamic servingWeightGrams;
  final dynamic nfCalories;
  final dynamic nfTotalFat;
  final dynamic nfSaturatedFat;
  final dynamic nfCholesterol;
  final dynamic nfSodium;
  final dynamic nfTotalCarbohydrate;
  final dynamic nfDietaryFiber;
  final dynamic nfSugars;
  final dynamic nfProtein;
  final dynamic nfPotassium;
  final dynamic nfP;
  final List<FullNutrient>? fullNutrients;
  final dynamic nixBrandName;
  final dynamic nixBrandId;
  final dynamic nixItemName;
  final dynamic nixItemId;
  final dynamic upc;
  final DateTime? consumedAt;
  final Metadata? metadata;
  final dynamic source;
  final dynamic ndbNo;
  final Tags? tags;
  final List<AltMeasure>? altMeasures;
  final dynamic lat;
  final dynamic lng;
  final dynamic mealType;
  final Photo? photo;
  final dynamic subRecipe;
  final dynamic classCode;
  final dynamic brickCode;
  final dynamic tagId;

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        foodName: json["food_name"],
        brandName: json["brand_name"],
        servingQty: json["serving_qty"],
        servingUnit: json["serving_unit"],
        servingWeightGrams: json["serving_weight_grams"],
        nfCalories: json["nf_calories"],
        nfTotalFat: json["nf_total_fat"],
        nfSaturatedFat: json["nf_saturated_fat"],
        nfCholesterol: json["nf_cholesterol"],
        nfSodium: json["nf_sodium"],
        nfTotalCarbohydrate: json["nf_total_carbohydrate"],
        nfDietaryFiber: json["nf_dietary_fiber"],
        nfSugars: json["nf_sugars"],
        nfProtein: json["nf_protein"],
        nfPotassium: json["nf_potassium"],
        nfP: json["nf_p"],
        fullNutrients: List<FullNutrient>.from(
            json["full_nutrients"].map((x) => FullNutrient.fromMap(x))),
        nixBrandName: json["nix_brand_name"],
        nixBrandId: json["nix_brand_id"],
        nixItemName: json["nix_item_name"],
        nixItemId: json["nix_item_id"],
        upc: json["upc"],
        consumedAt: DateTime.parse(json["consumed_at"]),
        metadata: Metadata.fromMap(json["metadata"]),
        source: json["source"],
        ndbNo: json["ndb_no"],
        tags: Tags.fromMap(json["tags"]),
        altMeasures: List<AltMeasure>.from(
            json["alt_measures"].map((x) => AltMeasure.fromMap(x))),
        lat: json["lat"],
        lng: json["lng"],
        mealType: json["meal_type"],
        photo: Photo.fromMap(json["photo"]),
        subRecipe: json["sub_recipe"],
        classCode: json["class_code"],
        brickCode: json["brick_code"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toMap() => {
        "food_name": foodName,
        "brand_name": brandName,
        "serving_qty": servingQty,
        "serving_unit": servingUnit,
        "serving_weight_grams": servingWeightGrams,
        "nf_calories": nfCalories,
        "nf_total_fat": nfTotalFat,
        "nf_saturated_fat": nfSaturatedFat,
        "nf_cholesterol": nfCholesterol,
        "nf_sodium": nfSodium,
        "nf_total_carbohydrate": nfTotalCarbohydrate,
        "nf_dietary_fiber": nfDietaryFiber,
        "nf_sugars": nfSugars,
        "nf_protein": nfProtein,
        "nf_potassium": nfPotassium,
        "nf_p": nfP,
        "full_nutrients":
            List<dynamic>.from(fullNutrients?.map((x) => x.toMap()) ?? []),
        "nix_brand_name": nixBrandName,
        "nix_brand_id": nixBrandId,
        "nix_item_name": nixItemName,
        "nix_item_id": nixItemId,
        "upc": upc,
        "consumed_at": consumedAt?.toIso8601String(),
        "metadata": metadata?.toMap(),
        "source": source,
        "ndb_no": ndbNo,
        "tags": tags?.toMap(),
        "alt_measures":
            List<dynamic>.from(altMeasures?.map((x) => x.toMap()) ?? []),
        "lat": lat,
        "lng": lng,
        "meal_type": mealType,
        "photo": photo?.toMap(),
        "sub_recipe": subRecipe,
        "class_code": classCode,
        "brick_code": brickCode,
        "tag_id": tagId,
      };
}

class AltMeasure {
  AltMeasure({
    this.servingWeight,
    this.measure,
    this.seq,
    this.qty,
  });

  final dynamic servingWeight;
  final String? measure;
  final dynamic seq;
  final dynamic qty;

  AltMeasure copyWith({
    dynamic servingWeight,
    String? measure,
    dynamic seq,
    dynamic qty,
  }) =>
      AltMeasure(
        servingWeight: servingWeight ?? this.servingWeight,
        measure: measure ?? this.measure,
        seq: seq ?? this.seq,
        qty: qty ?? this.qty,
      );

  factory AltMeasure.fromMap(Map<String, dynamic> json) => AltMeasure(
        servingWeight: json["serving_weight"],
        measure: json["measure"],
        seq: json["seq"] == null ? null : json["seq"],
        qty: json["qty"],
      );

  Map<String, dynamic> toMap() => {
        "serving_weight": servingWeight,
        "measure": measure,
        "seq": seq == null ? null : seq,
        "qty": qty,
      };
}

class FullNutrient {
  FullNutrient({
    this.attrId,
    this.value,
  });

  final dynamic attrId;
  final dynamic value;

  FullNutrient copyWith({
    dynamic attrId,
    dynamic value,
  }) =>
      FullNutrient(
        attrId: attrId ?? this.attrId,
        value: value ?? this.value,
      );

  factory FullNutrient.fromMap(Map<String, dynamic> json) => FullNutrient(
        attrId: json["attr_id"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "attr_id": attrId,
        "value": value,
      };
}

class Metadata {
  Metadata({
    this.isRawFood,
  });

  final bool? isRawFood;

  Metadata copyWith({
    bool? isRawFood,
  }) =>
      Metadata(
        isRawFood: isRawFood ?? this.isRawFood,
      );

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        isRawFood: json["is_raw_food"],
      );

  Map<String, dynamic> toMap() => {
        "is_raw_food": isRawFood,
      };
}

class Photo {
  Photo({
    this.thumb,
    this.highres,
    this.isUserUploaded,
  });

  final String? thumb;
  final String? highres;
  final bool? isUserUploaded;

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        thumb: json["thumb"],
        highres: json["highres"],
        isUserUploaded: json["is_user_uploaded"],
      );

  Map<String, dynamic> toMap() => {
        "thumb": thumb,
        "highres": highres,
        "is_user_uploaded": isUserUploaded,
      };
}

class Tags {
  Tags({
    this.item,
    this.measure,
    this.quantity,
    this.foodGroup,
    this.tagId,
  });

  final String? item;
  final dynamic measure;
  final String? quantity;
  final dynamic foodGroup;
  final dynamic tagId;

  factory Tags.fromMap(Map<String, dynamic> json) => Tags(
        item: json["item"],
        measure: json["measure"],
        quantity: json["quantity"],
        foodGroup: json["food_group"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toMap() => {
        "item": item,
        "measure": measure,
        "quantity": quantity,
        "food_group": foodGroup,
        "tag_id": tagId,
      };
}
