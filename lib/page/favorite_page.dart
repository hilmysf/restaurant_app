import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
    );
  }
}
