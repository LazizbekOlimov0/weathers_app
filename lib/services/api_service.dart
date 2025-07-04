import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String _apiKey = '070aedb34bec616dc8c44560d30cc25e';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = '$_baseUrl?q=$city&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("loading...");
    }
  }
}
