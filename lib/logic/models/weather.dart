class WeatherDescription {

  late int id;
  late String main;
  late String description;
  late String icon;

  WeatherDescription({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  WeatherDescription.fromMap(Map<String, dynamic> map) {
    id = int.parse(map["id"].toString());
    main = map["main"];
    description = map["description"];
    icon = map["icon"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": id,
      "main": main,
      "description": description,
      "icon": icon,
    };
    return map;
  }
}
