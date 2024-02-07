import 'package:theweather/logic/models/city.dart';
import 'package:theweather/logic/models/forecast.dart';

class WeatherResponse {
  late String cod;
  late int message;
  late int cnt;
  late List<SingleForCast> list;
  late City city;

  WeatherResponse({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  WeatherResponse.FromMap(Map<String, dynamic> map) {
    cod = map["cod"];

    message = int.parse(map["message"].toString());

    cnt = int.parse(map["cnt"].toString());

    list = [];
    (map["list"]).forEach(
      (element) => list.add(SingleForCast.fromMap(element)),
    );

    city = City.fromMap(map["city"]);
  }

  Map<String, dynamic> toMap() {
    List<Map> list2 = [];
    list.forEach((element) {
      list2.add(element.toMap());
    });
    Map<String, dynamic> map = {
      "cod": cod,
      "message": message,
      "cnt": cnt,
      "list": list2,
      "city": city.tomap(),
    };
    return map;
  }
}
