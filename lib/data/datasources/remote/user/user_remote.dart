import 'dart:io';

import 'package:client/data/entities/api/request.dart';
import 'package:client/data/entities/api/response.dart';
import 'package:client/data/entities/user/user.dart';
import 'package:client/data/entities/user/user_create.dart';
import '../../../entities/user/user_update_request.dart';
import '../../../entities/user/users_list_request.dart';
import '../client.dart';

class UserRemote {
  final DioHttpClient _client;

  UserRemote._(this._client);

  factory UserRemote({DioHttpClient? client}) =>
      UserRemote._(DioHttpClient.instance);

  Future<ApiResponse<List<User>>?> get({required ApiRequest<UserRequest> request}) async {
    final response = await _client.post(
      '/user/search',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: request.toMap(),
    );

    if (response.data == null) {
      return null;
    }
    return ApiResponse<List<User>>.fromJson(
      response.data,
          (data) => (data as List)
          .map((userJson) => User.fromMap(userJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<User?> getById({required int id}) async {
    final response = await _client.get(
      '/user/$id',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
    );

    if (response.data == null) {
      return null;
    }

    var data = (response.data as Map<String, dynamic>)['data'];
    return User.fromMap(data);
  }

  Future<User?> create({required UserCreateRequest request}) async {
    final response = await _client.post(
      '/user',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: request.toMap(),
    );

    if (response.data == null) {
      return null;
    }

    return User.fromJson(response.data ?? {});
  }

  Future<bool> update({required UserUpdateRequest request}) async {
    final response = await _client.patch(
      '/auth/user/',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: request.toMap(),
    );

    if (response.data == null) {
      return false;
    }

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }
}
