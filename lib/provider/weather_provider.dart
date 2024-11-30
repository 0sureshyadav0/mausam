import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  //api key
  final WeatherService _weatherService = WeatherService();
  Weather? _currentWeather;
  Weather? get currentWeather => _currentWeather;

  String? _currentCity;
  String? get currentCity => _currentCity;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _temperature;
  String? get temperature => _temperature;

  String? _description;
  String? get description => _description;

  String? _city;
  String? get city => _city;
  //fetch weather
  Future<void> fetchWeather(int cityId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentWeather = await _weatherService.getWeather(city.toString());
      _temperature = _currentWeather?.temperature.toString();
      _city = _currentWeather?.cityName.toString();
      _description = _currentWeather?.description.toString();
      _errorMessage = null;
    } catch (e) {
      // throw new Exception("Fetch weather failed");
      _errorMessage = "Failed weather failed: $e";
      _currentWeather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getCurrentCity() async {
    _currentCity = _weatherService.getCurrentCity().toString();
    notifyListeners();
  }

  String? _selectedId;
  String? get selectedId => _selectedId;
  void setSelectedId(String? id) {
    _selectedId = id;
    notifyListeners();
  }
}
