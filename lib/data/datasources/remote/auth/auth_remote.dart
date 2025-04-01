import 'dart:io';

import 'package:client/data/entities/api/response.dart';
import 'package:client/data/entities/user/auth_data.dart';
import 'package:client/data/entities/user/otp_send_data.dart';
import 'package:client/data/entities/user/sign_in_password_data.dart';
import 'package:client/data/entities/user/sign_in_phone_data.dart';
import '../client.dart';

class AuthRemote {
  final DioHttpClient _client;

  AuthRemote._(this._client);

  factory AuthRemote({DioHttpClient? client}) =>
      AuthRemote._(DioHttpClient.instance);

  Future<ApiResponse?> signInWithPassword(
      {required SignInPasswordRequestData signInData}) async {
    dynamic response = await _client.post(
      '/auth/sign-in',
      data: signInData.toMap(),
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType. json.mimeType,
      },
    );

    if (response.data == null) {
      return null;
    }

    return ApiResponse<UserAuthorizedData>.fromJson(
      response.data,
          (data) => UserAuthorizedData.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<OTPSendDataResponse?> sendOTPCode(
      {required OTPSendData otpSendData}) async {
    dynamic response = await _client.post(
      '/auth/signIn',
      data: otpSendData.toMap(),
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
    );

    if (response.data == null) {
      return null;
    }

    return OTPSendDataResponse.fromMap(response.data ?? {});
  }

  Future<UserAuthorizedData?> confirmPhoneNumber(
      {required SignInPhoneRequestData signInData}) async {
    dynamic response = await _client.post(
      '/auth/confirmPhone',
      data: signInData.toMap(),
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
    );

    if (response.data == null) {
      return null;
    }

    return UserAuthorizedData.fromJson(response.data ?? {});
  }

  Future<bool> logOut() async {
    RequestResponse response = await _client.post(
      '/logout',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
    );

    if (response.data == null) {
      return false;
    }

    if (response.statusCode != null) {
      return (response.statusCode == HttpStatus.ok);
    }

    return false;
  }
}
