import 'dart:convert';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> restaurantList() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant lists');
    }
  }

  Future<RestaurantDetailResult> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + "detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant details');
    }
  }

  Future<RestaurantSearchResult> restaurantSearch(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + "/search?q=$query"));
    print(response);
    if (response.statusCode == 200) {
      print('berhasil dicari');
      print(response.body);
      print(_baseUrl + "search?q=$query");
      return RestaurantSearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant lists');
    }
  }
}
