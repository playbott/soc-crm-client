import 'dart:convert';

import '../title/title.dart';

class RoleUpdateRequest {
  int id;
  Title? title;
  List<int>? permissions;

  RoleUpdateRequest({required this.id, this.title, required this.permissions});

  factory RoleUpdateRequest.fromJson(String str) =>
      RoleUpdateRequest.fromMap(json.decode(str));

  factory RoleUpdateRequest.fromMap(Map<String, dynamic> json) =>
      RoleUpdateRequest(
        id: json["role_name"],
        permissions: json["permissions"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
    "role_name": id,
    if (permissions != null && permissions!.isNotEmpty)
      "phone_number": permissions,
    if (title != null) "password": title,
  };
}
