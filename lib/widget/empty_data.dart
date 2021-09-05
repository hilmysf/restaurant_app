import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

emptyData(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/no_data.jpg',
          scale: 10,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'NO DATA',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'You don\'t have favorite restaurant yet :( \nAdd Restaurant Data To Your Favorite',
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
