class Weather {
  final String day;
  final String iconUrl;
  final double weatherWidth;
  final List<int> forecast;

  Weather({
    required this.day,
    required this.iconUrl,
    required this.weatherWidth,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      day: json['day'] as String,
      iconUrl: json['iconUrl'] as String,
      weatherWidth: json['weatherWidth'],
      forecast: List<int>.from(json['forecast']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'iconUrl': iconUrl,
      'weatherWidth': weatherWidth,
      'forecast': forecast,
    };
  }
}
