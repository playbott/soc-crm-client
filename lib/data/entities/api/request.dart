import 'package:client/data/entities/page_parameters.dart';
import 'package:json_annotation/json_annotation.dart';

class ApiRequest<T> {
  @JsonKey(name: "filter")
  T? filter;
  @JsonKey(name: "page")
  Page? page;

  ApiRequest({this.filter, this.page});

  factory ApiRequest.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => ApiRequest(
    filter: fromJsonT(json['filter']),
    page: Page.fromJson(json['page']),
  );

  Map<String, dynamic> toMap() => {
    if (filter != null) 'filter': (filter as dynamic).toMap(),
    if (page != null) 'page': page?.toJson(),
  };
}
