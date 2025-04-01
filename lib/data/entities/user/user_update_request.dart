import 'dart:convert';

class UserUpdateRequest {
  int id;
  String? name;
  String? phoneNumber;
  String? username;
  int? roleId;

  UserUpdateRequest({
    required this.id,
    this.phoneNumber,
    this.name,
    this.username,
    this.roleId,
  });

  factory UserUpdateRequest.fromJson(String str) =>
      UserUpdateRequest.fromMap(json.decode(str));

  factory UserUpdateRequest.fromMap(Map<String, dynamic> json) =>
      UserUpdateRequest(
        id: json["id"],
        username: json["user_name"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    if (username != null && username!.isNotEmpty) "user_name": username,
    if (name != null && name!.isNotEmpty) "name": name,
    if (phoneNumber != null && phoneNumber!.isNotEmpty)
      "phone_number": phoneNumber,
    if (roleId != null && roleId! > 0) "role_id": roleId,
  };
}
