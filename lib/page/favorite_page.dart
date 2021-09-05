import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/provider/database_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widget/app_bar.dart';
import 'package:restaurant_app/widget/empty_data.dart';
import 'package:restaurant_app/widget/list_item.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Restaurants',
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .apply(color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(child: _buildFavList())
          ],
        ),
      ),
    );
  }
}

Widget _buildFavList() {
  return Consumer<DatabaseProvider>(
    builder: (context, provider, child) {
      if (provider.state == ResultState.Loading) {
        return CircularProgressIndicator();
      } else if (provider.state == ResultState.HasData) {
        return ListView.builder(
          itemCount: provider.favorite.length,
          itemBuilder: (context, index) {
            return listItem(context, provider.favorite[index]);
          },
        );
      } else {
        return Center(child: emptyData(context));
      }
    },
  );
}
