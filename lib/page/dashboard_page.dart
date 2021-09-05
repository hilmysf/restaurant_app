import 'package:flutter/material.dart';
import 'package:restaurant_app/widget/app_bar.dart';
import 'package:restaurant_app/widget/restaurant_list.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Restaurant',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .apply(color: Colors.black)),
              SizedBox(
                height: 4,
              ),
              Text(
                'Recommendation restaurant for you!',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .apply(color: Colors.grey),
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(child: RestaurantListPage()),
            ],
          ),
        ),
      ),
    );
  }
}
