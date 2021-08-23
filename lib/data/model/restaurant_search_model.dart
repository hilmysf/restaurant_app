import 'dart:convert';
import 'package:restaurant_app/data/model/restaurant_model.dart';

RestaurantSearchResult welcomeFromJson(String str) =>
    RestaurantSearchResult.fromJson(json.decode(str));

String welcomeToJson(RestaurantSearchResult data) => json.encode(data.toJson());

class RestaurantSearchResult {
  RestaurantSearchResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory RestaurantSearchResult.fromJson(Map<String, dynamic> json) =>
      RestaurantSearchResult(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
