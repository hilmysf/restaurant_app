import 'package:flutter/material.dart';
import 'package:restaurant_app/page/restaurant_detail_page.dart';
import 'card_restaurant.dart';

listItem(context, restaurant) {
  return CardRestaurant(
    restaurant: restaurant!,
    onPressed: () {
      print('onclick');
      Navigator.pushNamed(context, RestaurantDetailPage.routeName,
          arguments: restaurant);
    },
  );
}
