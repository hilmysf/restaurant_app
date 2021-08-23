import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/widget/menu_card_widget.dart';

class RestaurantDetailPage extends StatefulWidget {
  final Restaurant restaurant;
  static const routeName = '/restaurant_detail_page';

  RestaurantDetailPage({required this.restaurant});

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  Future<RestaurantDetailResult>? _restaurantDetail;
  bool isFood = true;
  late RestaurantDetail restaurantDetail;

  @override
  void initState() {
    super.initState();
    _restaurantDetail = ApiService().restaurantDetail(widget.restaurant.id);
  }

  @override
  Widget build(BuildContext context) {
    return _buildDetail(context);
  }

  Widget _buildDetail(BuildContext context) {
    return FutureBuilder(
      future: _restaurantDetail,
      builder: (context, AsyncSnapshot<RestaurantDetailResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            var restaurantDetail = snapshot.data!.restaurant;
            return _buildDetailPage(context, restaurantDetail);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        }
      },
    );
  }

  Widget _buildDetailPage(
      BuildContext context, RestaurantDetail restaurantDetail) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: restaurantDetail.pictureId,
            child: Container(
              height: pageHeight / 3,
              width: pageWidth,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24)),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.grey, BlendMode.softLight),
                  image: NetworkImage(
                      "https://restaurant-api.dicoding.dev/images/large/${restaurantDetail.pictureId}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurantDetail.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        restaurantDetail.rating.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: pageWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Colors.red,
                    size: 14,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${restaurantDetail.city} City',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                restaurantDetail.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Foods Menu',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Container(
                width: pageWidth,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurantDetail.menus.foods.length,
                    itemBuilder: (context, index) {
                      return menuCardWidget(
                          restaurantDetail, index, isFood = true);
                    }),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Drinks Menu',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Container(
                width: pageWidth,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurantDetail.menus.drinks.length,
                  itemBuilder: (context, index) {
                    return menuCardWidget(
                        restaurantDetail, index, isFood = false);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  menuCardWidget(restaurantDetail, index, isFood) => MenuCardWidget(
      restaurantDetail: restaurantDetail, index: index, isFood: isFood);
}
