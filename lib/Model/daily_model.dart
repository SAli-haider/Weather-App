// To parse this JSON data, do
//
//     final dailyWeather = dailyWeatherFromJson(jsonString);

import 'dart:convert';

DailyWeather dailyWeatherFromJson(String str) => DailyWeather.fromJson(json.decode(str));

String dailyWeatherToJson(DailyWeather data) => json.encode(data.toJson());

class DailyWeather {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  List<Daily> daily;

  DailyWeather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.daily,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) => DailyWeather(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    timezone: json["timezone"],
    timezoneOffset: json["timezone_offset"],
    daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "timezone_offset": timezoneOffset,
    "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
  };
}

class Daily {
  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  String summary;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<Weather> weather;
  int clouds;
  double pop;
  double? rain;
  double uvi;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    this.rain,
    required this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"]?.toDouble(),
    summary: json["summary"],
    temp: Temp.fromJson(json["temp"]),
    feelsLike: FeelsLike.fromJson(json["feels_like"]),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"]?.toDouble(),
    windSpeed: json["wind_speed"]?.toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"]?.toDouble(),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    clouds: json["clouds"],
    pop: json["pop"]?.toDouble(),
    rain: json["rain"]?.toDouble(),
    uvi: json["uvi"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "summary": summary,
    "temp": temp.toJson(),
    "feels_like": feelsLike.toJson(),
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "clouds": clouds,
    "pop": pop,
    "rain": rain,
    "uvi": uvi,
  };
}

class FeelsLike {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
    day: json["day"]?.toDouble(),
    night: json["night"]?.toDouble(),
    eve: json["eve"]?.toDouble(),
    morn: json["morn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Temp {
  double day;
  int min;
  int max;
  double night;
  double eve;
  double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
    day: json["day"]?.toDouble(),
    min: json["min"]?.toInt() ?? 0,
    max: json["max"]?.toInt() ?? 0,
    night: json["night"]?.toDouble(),
    eve: json["eve"]?.toDouble(),
    morn: json["morn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "min": min,
    "max": max,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}
