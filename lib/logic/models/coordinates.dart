class Coordinates {
  late double lat, lon;

  Coordinates({
    required this.lat,
    required this.lon,
  });

  Coordinates.fromMap(Map<String, dynamic> map) {
    lon = map["lon"];
    lat = map["lat"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "lat": lat,
      "lon": lon,
    };
    return map;
  }
}
