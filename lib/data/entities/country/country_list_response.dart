import 'package:client/data/entities/page_parameters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'country.dart';

part 'country_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryListResponse {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "page")
  Page page;
  @JsonKey(name: "data")
  List<Country> data;
  @JsonKey(name: "count")
  int count;

  CountryListResponse({
    required this.success,
    required this.page,
    required this.data,
    required this.count,
  });

  factory CountryListResponse.fromJson(Map<String, dynamic> json) => _$CountryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListResponseToJson(this);
}
