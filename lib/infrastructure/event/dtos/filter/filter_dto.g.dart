// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterDtoImpl _$$FilterDtoImplFromJson(Map<String, dynamic> json) =>
    _$FilterDtoImpl(
      displayName: json['displayName'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isApplied: json['isApplied'] as bool? ?? false,
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => FilterValueDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$FilterDtoImplToJson(_$FilterDtoImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'name': instance.name,
      'isApplied': instance.isApplied,
      'values': instance.values,
    };
