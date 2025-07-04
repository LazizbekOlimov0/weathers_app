import 'package:flutter/material.dart';
import 'package:weathers_app/services/api_service.dart';

class WeatherProvider extends ChangeNotifier {
  Map<String, dynamic>? weatherData;
  bool isLoading = false;

  Future<void> getWeather(String city) async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await ApiService.fetchWeather(city);
      weatherData = data;
    } catch (e) {
      print("Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
