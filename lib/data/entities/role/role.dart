import 'dart:convert';

import 'package:client/data/entities/app/title_provider.dart';
import 'package:client/data/entities/permission/permission.dart';
import 'package:client/data/entities/title/title.dart';

class Role extends TitleBase {
  @override
  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String alias;
  List<Permission> permissions;
  @override
  Title title;

  @override
  bool firstElement;

  Role({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.alias = "",
    this.permissions = const [],
    this.title = const Title(),
    this.firstElement = false,
  });

  factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

  factory Role.fromMap(Map<String, dynamic> json) => Role(
    id: json["id"],
    createdAt: DateTime.tryParse(json["created_at"]),
    updatedAt: DateTime.tryParse(json["updated_at"]),
    alias: json["alias"],
    permissions: List<Permission>.from(
      json["permissions"].map((x) => Permission.fromMap(x)),
    ),
    title: Title.fromMap(json["title"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    if (createdAt != null) "created_at": createdAt?.toIso8601String(),
    if (updatedAt != null) "updated_at": updatedAt?.toIso8601String(),
    "alias": alias,
    "permissions": List<dynamic>.from(permissions.map((x) => x.toMap())),
    "title": title.toMap(),
  };
}
