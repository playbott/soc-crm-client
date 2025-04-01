import 'package:client/data/entities/page_parameters.dart';
import 'package:json_annotation/json_annotation.dart';

class ApiResponse<T> {
  ApiResponse({this.data, this.message, this.page});

  @JsonKey(name: "data")
  T? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "page")
  Page? page;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => ApiResponse(
    data: fromJsonT(json['data']),
    message: (json['message'] as String?),
    page: json['page'] != null ? Page.fromJson(json['page']) : Page(),
  );
}
