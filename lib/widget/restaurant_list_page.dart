import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/resto_provider.dart';
import 'package:restaurant_app/widget/Utils.dart';
import 'list_item.dart';

class RestaurantListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildList());
  }

  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurantResult!.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.restaurantResult!.restaurants[index];
              return listItem(context, restaurant);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.NoConnection) {
          return Center(child: Text(state.message));
        } else {
          return Center(
            child: Text(''),
          );
        }
      },
    );
  }
}
