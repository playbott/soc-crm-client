import 'dart:convert';

import 'package:client/data/entities/role/role.dart';

class User {
  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String name;
  String userName;
  String phoneNumber;
  String email;
  Role role;

  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.name = '',
    this.userName = '',
    this.phoneNumber = '',
    this.email = '',
    required this.role,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    createdAt: DateTime.tryParse(json["created_at"]),
    updatedAt: DateTime.tryParse(json["updated_at"]),
    name: json["name"] ?? '',
    userName: json["user_name"] ?? '',
    phoneNumber: json["phone_number"] ?? '',
    email: json["email"] ?? '',
    role: Role.fromMap(json["role"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "user_name": userName,
    "phone_number": phoneNumber,
    "email": email,
    "role": role.toMap(),
  };
}
