import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/resto_provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/widget/restaurant_list_page.dart';
import 'package:restaurant_app/widget/restaurant_search_list_page.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search_page';
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _searchQuery = '';
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiService()),
          child: Consumer<RestaurantProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.Loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.state == ResultState.HasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Search',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .apply(color: Colors.black),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          controller: _searchController,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            hintText: "Restaurant",
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 14),
                            suffixIcon: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                splashRadius: 30.0,
                                color: Colors.black,
                                onPressed: () =>
                                    state.setQuery(_searchController.text),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Flexible(
                          child: _searchController.text.isEmpty
                              ? RestaurantListPage()
                              : RestaurantSearchListPage(
                                  searchQuery: _searchQuery)),
                    ],
                  ),
                );
              } else if (state.state == ResultState.NoData) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state.state == ResultState.Error) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Text('Data Empty');
              }
            },
          ),
        ),
      ),
    );
  }
}
