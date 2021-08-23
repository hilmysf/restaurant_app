import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';

class MenuCardWidget extends StatelessWidget {
  final RestaurantDetail restaurantDetail;
  final double cardSize = 120.0;
  final int index;
  final bool isFood;

  MenuCardWidget(
      {required this.isFood,
      required this.index,
      required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardSize,
      width: cardSize,
      child: Card(
        elevation: 2,
        color: secondaryColor,
        child: Center(
          child: isFood
              ? Text(
                  restaurantDetail.menus.foods[index].name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.button!.apply(
                        color: Colors.white,
                      ),
                )
              : Text(
                  restaurantDetail.menus.drinks[index].name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .apply(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
