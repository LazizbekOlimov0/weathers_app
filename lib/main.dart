import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weathers_app/app.dart';
import 'package:weathers_app/provider/weather_provider.dart';

void main(){
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => WeatherProvider()),
    ],
    child: const MyApp(),
  ),);
}