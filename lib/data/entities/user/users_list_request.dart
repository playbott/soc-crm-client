class UserRequest {
  int? id;
  int? roleId;
  String? name;
  String? userName;
  String? phoneNumber;
  bool? isActive;
  bool? isDeleted;
  bool? isAdmin;

  UserRequest({
    this.id,
    this.roleId,
    this.name = '',
    this.userName = '',
    this.phoneNumber = '',
    this.isActive,
    this.isDeleted,
    this.isAdmin,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
    id: json["id"],
    roleId: json["role_id"],
    name: json["name"],
    userName: json["user_name"],
    phoneNumber: json["phone_number"],
    isActive: json["is_active"],
    isDeleted: json["is_deleted"],
    isAdmin: json["is_admin"],
  );

  Map<String, dynamic> toMap() => {
    if (id != null) "id": id,
    if (roleId != null) "role_id": roleId,
    "name": name,
    "user_name": userName,
    "phone_number": phoneNumber,
    if (isActive != null) "is_active": isActive,
    if (isDeleted != null) "is_deleted": isDeleted,
    if (isAdmin != null)"is_admin": isAdmin,
  };
}
