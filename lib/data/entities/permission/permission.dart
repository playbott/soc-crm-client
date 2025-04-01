import 'dart:convert';

import 'package:client/data/entities/title/title.dart';

class Permission {
  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String alias;
  Title? title;

  Permission({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.alias = "",
    this.title = const Title(),
  });

  factory Permission.fromJson(String str) =>
      Permission.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Permission.fromMap(Map<String, dynamic> json) => Permission(
        id: json["id"],
        createdAt: DateTime.tryParse(json["created_at"]),
        updatedAt: DateTime.tryParse(json["updated_at"]),
        alias: json["alias"],
        title: (json["title"] != null) ? Title.fromMap(json["title"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        if (createdAt != null) "created_at": createdAt?.toIso8601String(),
        if (updatedAt != null) "updated_at": updatedAt?.toIso8601String(),
        "alias": alias,
        "title": title?.toMap(),
      };
}
