import 'dart:convert';

class SuperheroesModel {
  String name;
  String realName;
  List<String> powers;
  List<String> weaknesses;
  Affiliation affiliation;
  String firstAppearance;
  String profileImage;
  String backgroundImage;

  SuperheroesModel({
    required this.name,
    required this.realName,
    required this.powers,
    required this.weaknesses,
    required this.affiliation,
    required this.firstAppearance,
    required this.profileImage,
    required this.backgroundImage,
  });

  factory SuperheroesModel.fromRawJson(String str) =>
      SuperheroesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuperheroesModel.fromJson(Map<String, dynamic> json) =>
      SuperheroesModel(
        name: json["name"],
        realName: json["real_name"],
        powers: List<String>.from(json["powers"].map((x) => x)),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        affiliation: affiliationValues.map[json["affiliation"]]!,
        firstAppearance: json["first_appearance"],
        profileImage: json["profile_image"],
        backgroundImage: json["background_image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "real_name": realName,
        "powers": List<dynamic>.from(powers.map((x) => x)),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => x)),
        "affiliation": affiliationValues.reverse[affiliation],
        "first_appearance": firstAppearance,
        "profile_image": profileImage,
        "background_image": backgroundImage,
      };
}

enum Affiliation { AVENGERS, JUSTICE_LEAGUE }

final affiliationValues = EnumValues({
  "Avengers": Affiliation.AVENGERS,
  "Justice League": Affiliation.JUSTICE_LEAGUE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
