import 'dart:convert';

import 'package:resto_app/modules/authenticated/domain/entities/restaurant_entity.dart';

import 'menu_model.dart';

class RestaurantModel extends RestaurantEntity {
  MenuModel menus;
  RestaurantModel({
    required super.id,
    required super.name,
    required super.description,
    required super.pictureId,
    required super.city,
    required super.rating,
    required this.menus,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: MenuModel.fromJson(json["menus"]),
      );
      
}
  List<RestaurantModel> parseRestaurants(String? json) {
    if (json == null) return [];

    final Map<String, dynamic> parsedMap = jsonDecode(json);
    List<dynamic> parsedList = parsedMap["restaurants"];
    return parsedList.map((json) {
      return RestaurantModel.fromJson(json);
    }).toList();
  }
