import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
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
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
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
