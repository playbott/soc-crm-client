// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListResponse _$CountryListResponseFromJson(Map<String, dynamic> json) =>
    CountryListResponse(
      success: json['success'] as bool,
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$CountryListResponseToJson(
        CountryListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'page': instance.page.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
