import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';
import 'package:restaurant_app/utils/result_state.dart';


class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final BuildContext context;

  RestaurantProvider(this.apiService, this.context) {
    _fetchAllRestaurant();
  }

  RestaurantResult? _restaurantResult;
  RestaurantSearchResult? _restaurantSearchResult;
  String _message = '';
  ResultState? _state;
  String _query = '';

  String get message => _message;

  RestaurantResult? get restaurantResult => _restaurantResult;

  RestaurantSearchResult? get restaurantSearchResult => _restaurantSearchResult;

  ResultState? get state => _state;

  String get query => _query;

  void refresh() {
    _fetchAllRestaurant();
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    _fetchAllRestaurant();
    notifyListeners();
  }

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final resto = await getRestaurantData();
      if (resto.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        if (query == '') {
          return _restaurantResult = resto;
        } else {
          return _restaurantSearchResult = resto;
        }
      }
    } catch (e) {
      if (e is SocketException) {
        _state = ResultState.NoConnection;
        notifyListeners();
        return _message = 'No Internet Connection';
      } else {
        _state = ResultState.Error;
        notifyListeners();
        return _message = 'Error --> $e';
      }
    }
  }

  Future<dynamic> getRestaurantData() async {
    if (query == '') {
      return apiService.restaurantList();
    } else {
      return apiService.restaurantSearch(query);
    }
  }
}
