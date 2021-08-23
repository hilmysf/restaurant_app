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
//
// class Restaurant {
//   Restaurant({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.pictureId,
//     required this.city,
//     required this.rating,
//   });
//
//   String id;
//   String name;
//   String description;
//   String pictureId;
//   String city;
//   double rating;
//
//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//     id: json["id"],
//     name: json["name"],
//     description: json["description"],
//     pictureId: json["pictureId"],
//     city: json["city"],
//     rating: json["rating"].toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "description": description,
//     "pictureId": pictureId,
//     "city": city,
//     "rating": rating,
//   };
// }
