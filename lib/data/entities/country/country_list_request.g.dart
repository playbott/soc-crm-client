// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListRequest _$CountryListRequestFromJson(Map<String, dynamic> json) =>
    CountryListRequest(
      title: json['title'] as String?,
      isAdmin: json['is_admin'] as bool? ?? true,
      page: json['page'] == null
          ? null
          : Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryListRequestToJson(CountryListRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'is_admin': instance.isAdmin,
      'page': instance.page?.toJson(),
    };
