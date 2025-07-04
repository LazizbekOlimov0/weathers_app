import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathers_app/models/weather_model.dart';
import 'package:weathers_app/services/api_service.dart';

import '../models/weather_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getWeather() async {
    final data = await ApiService.fetchWeather("Tashkent");
    print("Temperature: ${data['main']['temp']}°C");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background image
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/images/background_image.jpg",
                fit: BoxFit.cover,
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 40),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment(0, 0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Seongnam-si", style: TextStyle(fontSize: 37)),
                          Text("21°", style: TextStyle(fontSize: 102)),
                          Text(
                            "Partly Cloudy",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text("H:29° L:15°", style: TextStyle(fontSize: 21)),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 36),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 200,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withOpacity(0.1)),
                            ),
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Cloudy conditions from 1AM-9AM, with",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Text(
                                      "showers expected at 9AM.",
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Divider(
                                  color: Colors.white.withOpacity(0.3),
                                  thickness: 0.5,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WeatherItem(
                                      time: 'Now',
                                      temp: '21°',
                                      iconUrl: "assets/images/sun.svg",
                                    ),
                                    WeatherItem(
                                      time: '10PM',
                                      temp: '21°',
                                      iconUrl: "assets/images/rain.svg",
                                    ),
                                    WeatherItem(
                                      time: '11PM',
                                      temp: '19°',
                                      iconUrl: "assets/images/middle.svg",
                                    ),
                                    WeatherItem(
                                      time: '12AM',
                                      temp: '19°',
                                      iconUrl: "assets/images/sun.svg",
                                    ),
                                    WeatherItem(
                                      time: '1AM',
                                      temp: '19°',
                                      iconUrl: "assets/images/cloudy_moon.svg",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Daily forecast section
                  SliverToBoxAdapter(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: Column(
                            children: weathers.map((weather) {
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          weather.day,
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          weather.iconUrl,
                                          width: 24,
                                          height: 24,
                                        ),
                                        Text(
                                          "${weather.forecast.first}°",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        Container(
                                          width: weather.weatherWidth,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: Colors.yellowAccent,
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        ),
                                        Text(
                                          "${weather.forecast.last}°",
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (weather != weathers.last)
                                    Divider(
                                      color: Colors.white.withOpacity(0.3),
                                      thickness: 0.5,
                                    ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 36),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/map.svg"),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/navigation.svg"),
                SizedBox(width: 8),
                SvgPicture.asset("assets/images/ellipse.svg"),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/menu.svg"),
            label: '',
          ),
        ],
      ),
    );
  }

  late List<Weather> weathers = [
    Weather(
      day: "Mon",
      iconUrl: "assets/images/cloudy_moon.svg",
      weatherWidth: 34,
      forecast: [15, 29],
    ),
    Weather(
      day: "Tue",
      iconUrl: "assets/images/sun.svg",
      weatherWidth: 34,
      forecast: [15, 29],
    ),
    Weather(
      day: "Wed",
      iconUrl: "assets/images/rain.svg",
      weatherWidth: 14,
      forecast: [18, 27],
    ),
    Weather(
      day: "Thu",
      iconUrl: "assets/images/middle.svg",
      weatherWidth: 28,
      forecast: [12, 32],
    ),
    Weather(
      day: "Fri",
      iconUrl: "assets/images/rain_sun.svg",
      weatherWidth: 30,
      forecast: [15, 24],
    ),
    Weather(
      day: "Sat",
      iconUrl: "assets/images/lightning.svg",
      weatherWidth: 15,
      forecast: [10, 12],
    ),
    Weather(
      day: "Sun",
      iconUrl: "assets/images/downpour.svg",
      weatherWidth: 22,
      forecast: [10, 29],
    ),
    Weather(
      day: "Mon",
      iconUrl: "assets/images/sun.svg",
      weatherWidth: 23,
      forecast: [15, 28],
    ),
    Weather(
      day: "Tue",
      iconUrl: "assets/images/cloudy_moon.svg",
      weatherWidth: 24,
      forecast: [12, 26],
    ),
    Weather(
      day: "Wed",
      iconUrl: "assets/images/rain.svg",
      weatherWidth: 34,
      forecast: [16, 31],
    ),
  ];
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}