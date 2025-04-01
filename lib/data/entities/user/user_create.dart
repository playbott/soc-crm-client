import 'dart:convert';

class UserCreateRequest {
  String userName;
  String phoneNumber;
  String password;

  UserCreateRequest({
    required this.userName,
    this.phoneNumber = '',
    required this.password,
  });

  factory UserCreateRequest.fromJson(String str) =>
      UserCreateRequest.fromMap(json.decode(str));

  factory UserCreateRequest.fromMap(Map<String, dynamic> json) => UserCreateRequest(
        userName: json["user_name"],
        phoneNumber: json["phone_number"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        if (userName.isNotEmpty) "user_name": userName,
        if (phoneNumber.isNotEmpty) "phone_number": phoneNumber,
        if (password.isNotEmpty) "password": password,
      };
}
