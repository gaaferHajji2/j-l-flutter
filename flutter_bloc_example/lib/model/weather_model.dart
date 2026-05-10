class WeatherModel {
  final double temp;
  final String sky;
  final int pressure;
  final double windSpeed;
  final int humidity;

  const WeatherModel({
    required this.temp,
    required this.sky,
    required this.pressure,
    required this.windSpeed,
    required this.humidity,
  });

  /// Factory constructor to parse JSON data
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List<dynamic>).first;
    final wind = json['wind'] as Map<String, dynamic>;

    return WeatherModel(
      temp: (main['temp'] as num).toDouble(),
      sky: weather['main'] as String? ?? 'Unknown',
      pressure: (main['pressure'] as num).toInt(),
      windSpeed: (wind['speed'] as num).toDouble(),
      humidity: (main['humidity'] as num).toInt(),
    );
  }

  /// Serialize back to JSON (useful for caching or debugging)
  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'sky': sky,
      'pressure': pressure,
      'windSpeed': windSpeed,
      'humidity': humidity,
    };
  }

  @override
  String toString() {
    return 'CurrentWeather{'
        'temp: $temp, '
        'sky: $sky, '
        'pressure: $pressure hPa, '
        'windSpeed: $windSpeed m/s, '
        'humidity: $humidity%}';
  }
}
