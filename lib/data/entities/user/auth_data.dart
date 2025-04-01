import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserAuthorizedData {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "refresh_token")
  String refreshToken;

  UserAuthorizedData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserAuthorizedData.fromJson(Map<String, dynamic> json) =>
      _$UserAuthorizedDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserAuthorizedDataToJson(this);
}
