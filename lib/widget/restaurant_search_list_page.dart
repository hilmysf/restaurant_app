import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/resto_provider.dart';
import 'list_item.dart';

class RestaurantSearchListPage extends StatelessWidget {
  final String searchQuery;

  RestaurantSearchListPage({required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.restaurantSearchResult!.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant =
                    state.restaurantSearchResult!.restaurants[index];
                return listItem(context, restaurant);
              },
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Center(child: Text(state.message));
          } else {
            return Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
}
