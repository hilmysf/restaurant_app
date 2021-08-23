import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/page/restaurant_detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback onPressed;

  const CardRestaurant({required this.restaurant, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pushNamed(context, RestaurantDetailPage.routeName,
        arguments: restaurant),
    child: Container(
      height: 90,
      width: 90,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Hero(
              tag: restaurant.pictureId,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    image: NetworkImage("https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Flexible(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.red,
                    ),
                    Text(
                      restaurant.city,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      restaurant.rating.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    )
    );
  }
}