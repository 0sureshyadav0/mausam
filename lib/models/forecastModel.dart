class ForecastWeather {
  final String iconName;
  final String description;
  final int time;
  ForecastWeather({
    required this.iconName,
    required this.description,
    required this.time,
  });
  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      iconName: json['list'][0]['weather'][0]['icon'].toString(),
      description: json['list'][0]['weather'][0]['description'],
      time: json['list'][0]['dt'].toInt(),
    );
  }
}
