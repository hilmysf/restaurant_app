import 'dart:async';
import 'package:flutter/material.dart';
import '../common/styles.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _splashScreen();
  }

  _splashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.pushNamed(context, HomePage.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu_rounded,
              color: primaryColor,
              size: 150,
            ),
            Text(
              'Home Resto',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
