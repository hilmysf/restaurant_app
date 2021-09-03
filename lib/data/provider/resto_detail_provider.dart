import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/utils/result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  RestaurantDetailProvider(this.apiService, {required this.id}) {
    _fetchRestaurantDetail();
  }

  RestaurantDetailResult? _restaurantDetailResult;
  String _message = '';
  ResultState? _state;

  String get message => _message;

  RestaurantDetailResult? get restaurantDetailResult => _restaurantDetailResult;

  ResultState? get state => _state;

  Future<dynamic> _fetchRestaurantDetail() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      final detailResto = await apiService.restaurantDetail(id);
      if (detailResto.restaurant.id.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantDetailResult = detailResto;
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
}
