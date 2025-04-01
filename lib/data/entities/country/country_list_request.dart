import 'package:client/data/entities/page_parameters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_list_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryListRequest {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "is_admin")
  bool isAdmin;
  @JsonKey(name: "page")
  Page? page;

  CountryListRequest({
    this.title,
    this.isAdmin = true,
    this.page,
  });

  factory CountryListRequest.fromJson(Map<String, dynamic> json) =>
      _$CountryListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListRequestToJson(this);
}
