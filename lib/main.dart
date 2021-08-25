import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/page/home_page.dart';
import 'package:restaurant_app/page/restaurant_detail_page.dart';
import 'package:restaurant_app/page/search_page.dart';
import 'package:restaurant_app/page/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider(create: (context) => Connectivity().onConnectivityChanged, initialData: null,),
        ],
        child: MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'openSans',
          backgroundColor: Colors.white,
          textTheme: textTheme),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomePage.routeName: (context) => HomePage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
        SearchPage.routeName: (context) => SearchPage()
      },
    ));
  }
}
