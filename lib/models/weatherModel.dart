class Weather {
  final String cityName;
  final String temperature;
  final String description;
  final String mainCondition;
  final String icon;
  final String feels_like;
  final String humidity;
  final String windSpeed;
  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.description,
    required this.icon,
    required this.feels_like,
    required this.humidity,
    required this.windSpeed,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toString(),
      mainCondition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      feels_like: json['main']['feels_like'].toString(),
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
    );
  }
}
