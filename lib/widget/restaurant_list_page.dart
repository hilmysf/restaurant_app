import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/resto_provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';
import 'package:restaurant_app/page/restaurant_detail_page.dart';
import 'package:restaurant_app/widget/card_restaurant.dart';

// class RestaurantListPage extends StatefulWidget {
//
//
//   @override
//   _RestaurantListPageState createState() => _RestaurantListPageState();
// }

class RestaurantListPage extends StatelessWidget {
  final String searchQuery;

  RestaurantListPage(this.searchQuery);

  RestaurantListPage.search({required this.searchQuery});

  Future<RestaurantResult>? _restaurant;
  Future<RestaurantSearchResult>? _restaurantSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // searchQuery.isEmpty ? _buildList() : _buildSearchList(context),
            _buildList());
  }

  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        // state.setQuery(searchQuery);
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurantResult!.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.restaurantResult!.restaurants[index];
              return _listItem(context, restaurant);
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
    );
  }

  Widget _buildSearchList(BuildContext context) {
    return FutureBuilder(
      future: _restaurantSearch,
      builder: (context, AsyncSnapshot<RestaurantSearchResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = snapshot.data?.restaurants[index];
                return _listItem(context, restaurant);
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Text('Data Empty');
          }
        }
      },
    );
  }

  _listItem(context, restaurant) {
    return CardRestaurant(
      restaurant: restaurant!,
      onPressed: () {
        print('onclick');
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    );
  }
}
