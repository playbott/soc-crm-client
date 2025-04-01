import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:client/global.dart';
import 'package:client/core/error/failure.dart';

class HttpClientSettings {
  final String baseUrl;
  final int sendTimeout;
  final int receiveTimeout;

  const HttpClientSettings({
    this.baseUrl = '',
    required this.sendTimeout,
    required this.receiveTimeout,
  });
}

class RequestResponse {
  final dynamic data;
  final int? statusCode;
  final String? statusMessage;

  RequestResponse({this.data, this.statusCode, this.statusMessage});

  @override
  String toString() {
    return 'response (data: $data, statusCode: $statusCode, statusMessage: $statusMessage)';
  }
}

class DioHttpClient {
  late final Dio _dio;
  late HttpClientSettings _settings;

  DioHttpClient._() {
    _settings = HttpClientSettings(
      baseUrl: Env.apiUrl,
      sendTimeout: 60,
      receiveTimeout: 60,
    );
    _dio = Dio();
    _dio.options.baseUrl = _settings.baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, h) {
          String accessToken = Prefs.getString(accessTokenKey) ?? '';
          options.headers = {
            HttpHeaders.acceptHeader: ContentType.json.mimeType,
            HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
            HttpHeaders.authorizationHeader:
                accessToken.length > 20 ? 'Bearer $accessToken' : '',
          };
          return h.next(options);
        },
        onResponse: (response, handler) {
          Map<String, dynamic>? _data;
          if (response.data is List<dynamic>) {
            _data = {'data': null};
            _data['data'] = response.data;
          }
          return handler.resolve(
            Response(
              statusCode: response.statusCode,
              data: _data ?? response.data,
              requestOptions: response.requestOptions,
            ),
          );
        },
        onError: (DioException exception, handler) async {
          final response = exception.response;
          if (response != null) {
            if (response.statusCode != null) {
              response.data = {'data': response.data};
            }
            return handler.resolve(
              Response(
                statusCode: response.statusCode,
                data: response.data,
                requestOptions: exception.requestOptions,
              ),
            );
          }
          return handler.resolve(
            Response(
              statusCode: 100,
              data: {'status': exception.toString()},
              requestOptions: exception.requestOptions,
            ),
          );
        },
      ),
    );
  }

  static DioHttpClient? _instance;

  static DioHttpClient get instance => _instance ??= DioHttpClient._();

  HttpClientSettings get settings => _settings;

  Future<RequestResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await _wrappedCall(
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: _settings.sendTimeout),
          receiveTimeout: Duration(seconds: _settings.receiveTimeout),
        ),
      ),
    );

    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Future<RequestResponse> formPost(
    String path, {
    Object? data,
    Map<String, String>? headers,
    StreamController<double>? progressStream,
  }) async {
    final response = await _wrappedCall(
      _dio.post<dynamic>(
        path,
        data: data,
        onSendProgress: (count, total) {
          if (progressStream != null) {
            progressStream.add((count / total));
          }
        },
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: _settings.sendTimeout),
          receiveTimeout: Duration(seconds: _settings.receiveTimeout),
        ),
      ),
    );
    Map<String, dynamic> _data = {'data': null};
    if (response.data is String || response.data is String) {
      _data['data'] = response.data;
    }
    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Future<RequestResponse> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await _wrappedCall(
      _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: _settings.sendTimeout),
          receiveTimeout: Duration(seconds: _settings.receiveTimeout),
        ),
      ),
    );
    Map<String, dynamic> _data = {'data': null};
    if (response.data is String || response.data is String) {
      _data['data'] = response.data;
    }
    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Future<RequestResponse> patch(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await _wrappedCall(
      _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: _settings.sendTimeout),
          receiveTimeout: Duration(seconds: _settings.receiveTimeout),
        ),
      ),
    );

    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Future<RequestResponse> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await _wrappedCall(
      _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: _settings.sendTimeout),
          receiveTimeout: Duration(seconds: _settings.receiveTimeout),
        ),
      ),
    );

    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Future<RequestResponse> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await _wrappedCall(
      _dio.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          sendTimeout: Duration(seconds: _settings.sendTimeout),
          receiveTimeout: Duration(seconds: _settings.receiveTimeout),
        ),
      ),
    );
    Map<String, dynamic> _data = {'data': null};
    if (response.data is String || response.data is String) {
      _data['data'] = response.data;
    }
    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  Future<RequestResponse> _wrappedCall(Future<Response> futureResponse) async {
    dynamic response;

    response = await futureResponse;

    if (response != null) {
      if (response.statusCode != null) {
        if (response.statusCode < 200 || response.statusCode > 299) {
          throw Failure.throwException(response);
        }
      }
    }

    return RequestResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }
}
