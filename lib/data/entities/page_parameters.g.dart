// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      size: (json['size'] as num?)?.toInt() ?? 0,
      number: (json['number'] as num?)?.toInt() ?? 1,
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      orderBy: json['order_by'] as String?,
      desc: json['desc'] as bool? ?? false,
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'size': instance.size,
      'number': instance.number,
      'total_count': instance.totalCount,
      'order_by': instance.orderBy,
      'desc': instance.desc,
    };
