class Clouds {
  late int all;

  Clouds({required this.all});

  Clouds.fromMap(Map<String, dynamic> map) {
    all = int.parse(map["all"].toString());
  }

  Map<String, dynamic> toMap() => {"all": all};
}
