class SignInPasswordRequestData {
  String userName;
  String password;

  SignInPasswordRequestData({
    required this.userName,
    required this.password,
  });

  factory SignInPasswordRequestData.fromMap(Map<String, dynamic> json) => SignInPasswordRequestData(
    userName: json["user_name"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "user_name": userName,
    "password": password,
  };
}
