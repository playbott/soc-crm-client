import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

import '../client.dart';

class FileRemote {
  final DioHttpClient _client;
  FileRemote._(this._client);

  factory FileRemote({DioHttpClient? client}) =>
      FileRemote._(DioHttpClient.instance);

  Future<bool> uploadFile({
    required String filePath,
    required String type,
    required int id,
    StreamController<double>? progressStreamController,
  }) async {
    FormData formData = FormData();

    formData.fields.add(const MapEntry('format', 'file'));
    formData.fields.add(MapEntry('type', type));
    formData.fields.add(MapEntry('id', id.toString()));

    String fileName = filePath.split('/').last;
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(filePath, filename: fileName),
      ),
    );

    final response = await _client.formPost(
      '/file/upload',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
      },
      data: formData,
    );

    if (response.data == null) {
      return false;
    }

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }

  Future<bool> uploadBytes({
    required Uint8List bytes,
    required String type,
    required int id,
    StreamController<double>? progressStreamController,
  }) async {
    FormData formData = FormData();

    formData.fields.add(const MapEntry('format', 'bytes'));
    formData.fields.add(MapEntry('type', type));
    formData.fields.add(MapEntry('id', id.toString()));
    formData.fields.add(MapEntry('bytes', base64Encode(Uint8List.fromList(bytes).toList())));

    final response = await _client.formPost(
      '/file/upload',
      progressStream: progressStreamController,
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
      },
      data: formData,
    );

    if (response.data == null) {
      return false;
    }

    return response.statusCode == HttpStatus.ok;
  }

  Future<Uint8List?> downloadFile({
    required String filePath,
    required String type,
  }) async {
    FormData formData = FormData();

    formData.fields.add(MapEntry('type', type));
    formData.fields.add(MapEntry('file', filePath));

    final response = await _client.formPost(
      '/file/download',
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
        HttpHeaders.acceptHeader: 'image/jpeg',
      },
      data: formData,
    );

    if (response.data == null) {
      return null;
    }

    if (response.statusCode == HttpStatus.ok) {
      return base64Decode(response.data);
    }

    return null;
  }
}
