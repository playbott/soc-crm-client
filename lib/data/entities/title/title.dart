import 'dart:convert';

class Title {
  final String en;
  final String ru;
  final String tm;

  const Title({this.en = "", this.ru = "", this.tm = ""});

  factory Title.fromJson(String str) => Title.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Title.fromMap(Map<String, dynamic> json) => Title(
    en: (json["en"] != null) ? json["en"] : "",
    ru: (json["ru"] != null) ? json["ru"] : "",
    tm: (json["tm"] != null) ? json["tm"] : "",
  );

  Map<String, dynamic> toMap() => {"en": en, "ru": ru, "tm": tm};
}
