
import 'package:theweather/logic/models/clouds.dart';
import 'package:theweather/logic/models/mainWeather.dart';
import 'package:theweather/logic/models/sys.dart';
import 'package:theweather/logic/models/weather.dart';
import 'package:theweather/logic/models/wind.dart';

class SingleForCast {
  late int dt;
  late MainWeather main;
  late List<WeatherDescription> weather;
  late Clouds clouds;
  late Wind wind;
  late int visibilty;
  late double pop;

  // late Rain rain;
  late Sys sys;
  late String dt_text;

  SingleForCast({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibilty,
    required this.pop,

    required this.sys,
    required this.dt_text,
  });

  SingleForCast.fromMap(Map<String, dynamic> map) {
    dt = int.parse(map["dt"].toString());
    main = MainWeather.fromMap(map["main"]);
    weather = [];
    (map["weather"]).forEach((element) {
      weather.add(WeatherDescription.fromMap(element));
    });

    clouds = Clouds.fromMap(map["clouds"]);

    wind = Wind.fromMap(map["wind"]);
    visibilty = int.parse(map["visibility"].toString());
    pop = double.parse(map["pop"].toString());


    sys = Sys.fromMap(map["sys"]);

    dt_text = map["dt_txt"];
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> list2 = [];
    this.weather.forEach((element) {
      list2.add(element.toMap());
    });
    Map<String, dynamic> map = {
      "dt": dt,
      "main": main.toMap(),
      "weather": list2,
      "clouds": clouds.toMap(),
      "wind": wind.toMap(),
      "visibility": visibilty,
      "pop": pop,

      "sys": sys.toMap(),
      "dt_txt": dt_text,
    };
    return map;
  }
}
