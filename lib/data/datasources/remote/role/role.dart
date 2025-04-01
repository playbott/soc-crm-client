import 'dart:io';
import 'package:client/data/entities/role/role.dart';
import 'package:client/data/entities/role/role_list_request.dart';
import 'package:client/data/entities/role/role_update_request.dart';
import '../client.dart';
import 'package:client/data/entities/api/request.dart';
import 'package:client/data/entities/api/response.dart';

class RoleRemote {
  final DioHttpClient _client;

  RoleRemote._(this._client);

  factory RoleRemote({DioHttpClient? client}) =>
      RoleRemote._(DioHttpClient.instance);
  Future<Role?> getById({required int id}) async {
    final response = await _client.get(
      '/role/id/$id',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
    );

    if (response.data == null) {
      return null;
    }

    if (response.statusCode != HttpStatus.ok) {
      return null;
    }

    return Role.fromJson(response.data ?? {});
  }

  Future<ApiResponse<List<Role>>?> get({required ApiRequest<RoleRequest> request}) async {
    final response = await _client.post(
      '/access/role/search',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: request.toMap(),
    );

    if (response.data == null) {
      return null;
    }
    return ApiResponse<List<Role>>.fromJson(
      response.data,
          (data) => (data as List)
          .map((roleJson) => Role.fromMap(roleJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<bool> update({required RoleUpdateRequest request}) async {
    final response = await _client.patch(
      '/access/role',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: request.toMap(),
    );

    if (response.data == null) {
      return false;
    }

    return (response.statusCode == HttpStatus.ok);
  }

  Future<int?> create({required String title}) async {
    final response = await _client.post(
      '/role/create',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: {'title': title},
    );

    if (response.data == null) {
      return null;
    }

    if (response.statusCode != HttpStatus.ok) {
      return null;
    }

    return Role.fromJson(response.data).id;
  }
}
