import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';

void main() {
  group(
    'API Service Test',
    () {
      ApiService? apiService;
      Random? random;
      int randomIndex;

      setUp(
        () {
          apiService = ApiService();
          random = Random();
        },
      );

      test(
        'Verify JSON Parsing',
        () async {
          randomIndex = random!.nextInt(5);
          var restaurant = await apiService!.restaurantList();
          var result = restaurant.restaurants[randomIndex];
          var parsing = Restaurant.fromJson(result.toJson());

          expect(result.id, parsing.id);
          expect(result.name, parsing.name);
        },
      );

      test(
        'should contain at least one item',
        () async {
          var restaurants = await apiService!.restaurantList();
          var result = restaurants.restaurants.isNotEmpty;
          print(result);
          expect(true, result);
        },
      );
    },
  );
}
