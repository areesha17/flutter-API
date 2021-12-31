class WeatherData {
  String name;
  int timezone;
  Main main;
  Wind wind;

  WeatherData(
      {required this.name,
      required this.timezone,
      required this.main,
      required this.wind});

  factory WeatherData.fromJson(Map<String, dynamic> jsData) {
    return WeatherData(
        name: jsData['name'],
        timezone: jsData['timezone'],
        main: Main.fromJson(jsData['main']),
        wind: Wind.fromJson(jsData['wind']));
  }
}

class Main {
  double temp;
  int pressure;
  int humidity;

  Main({required this.temp, required this.pressure, required this.humidity});
  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'],
        pressure: json['pressure'],
        humidity: json["humidity"]);
  }
}

class Wind {
  double speed;

  Wind({required this.speed});
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']);
  }
}
