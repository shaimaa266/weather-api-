class Rain {
  late double h3;

  Rain({required this.h3});

  Rain.fromMap(Map<String, dynamic> map) {
    h3 = map["3h"];
  }

  Map<String, dynamic> toMap() {
    return {
      "3h": h3,
    };
  }
}
