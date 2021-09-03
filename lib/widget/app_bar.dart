import 'package:flutter/material.dart';
import 'package:restaurant_app/page/search_page.dart';

appBarWidget(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.black,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(context, SearchPage.routeName);
        },
      )
    ],
  );
}
