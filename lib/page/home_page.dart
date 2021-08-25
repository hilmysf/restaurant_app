import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/resto_provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/page/search_page.dart';
import 'package:restaurant_app/widget/restaurant_list_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
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
              Flexible(
                  child: ChangeNotifierProvider<RestaurantProvider>(
                      create: (_) =>
                          RestaurantProvider(ApiService(), context),
                      child: RestaurantListPage())),
            ],
          ),
        ),
      ),
    );
  }
}
