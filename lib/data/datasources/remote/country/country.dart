import 'dart:io';
import 'package:client/data/entities/country/country.dart';
import 'package:client/data/entities/country/country_list_request.dart';
import 'package:client/data/entities/country/country_list_response.dart';
import '../client.dart';

class CountryRemote {
  final DioHttpClient _client;

  CountryRemote._(this._client);

  factory CountryRemote({DioHttpClient? client}) =>
      CountryRemote._(DioHttpClient.instance);
  Future<Country?> getById({required int id}) async {
    final response = await _client.get(
      '/country/id/$id',
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

    return CountryResponse.fromJson(response.data ?? {}).data;
  }

  Future<CountryListResponse?> getList(
      {required CountryListRequest request}) async {
    final response = await _client.post(
      '/country',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: request.toJson(),
    );

    if (response.data == null) {
      return null;
    }

    if (response.statusCode != HttpStatus.ok) {
      return null;
    }

    return CountryListResponse.fromJson(response.data ?? {});
  }

  Future<bool> update({required Country country}) async {
    final response = await _client.patch(
      '/country/id/${country.id}',
      headers: <String, String>{
        HttpHeaders.acceptHeader: ContentType.json.mimeType,
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      },
      data: {'title': country.title},
    );

    if (response.data == null) {
      return false;
    }

    return (response.statusCode == HttpStatus.ok);
  }

  Future<int?> create({required String title}) async {
    final response = await _client.post(
      '/country/create',
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

    return Country.fromJson(response.data).id;
  }
}
