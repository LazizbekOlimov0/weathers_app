import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherItem extends StatelessWidget {
  final String time;
  final String temp;
  final String iconUrl;

  const WeatherItem({
    super.key,
    required this.time,
    required this.temp,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time, style: TextStyle(color: Colors.white)),
        SvgPicture.asset(iconUrl),
        Text(temp, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}