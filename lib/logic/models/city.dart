import 'package:theweather/logic/models/coordinates.dart';

class City {
late int id;
late int population;
late int timezone;
late int sunrise;
late int sunset;
late String country;
late String name;
late Coordinates coord;

City({
  required this.id,
  required this.population,
  required this.timezone,
  required this.sunrise,
  required this.sunset,
  required this.country,
  required this.name,
  required this.coord,
});

City.fromMap(Map<String, dynamic> map) {
id = map["id"];
population = map["population"];
timezone = map["timezone"];
sunrise = map["sunrise"];
sunset = map["sunset"];
country = map["country"];
name = map["name"];
coord = Coordinates.fromMap(map["coord"]);
}

Map<String, dynamic> tomap() {
Map<String, dynamic> map = {
"id": id,
"population": population,
"timezone": timezone,
"sunrise": sunrise,
"sunset": sunset,
"country": country,
"name": name,
"coord": coord,
};
return map;
}
}

