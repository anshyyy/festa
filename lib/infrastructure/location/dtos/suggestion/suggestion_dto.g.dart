// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionDtoImpl _$$SuggestionDtoImplFromJson(Map<String, dynamic> json) =>
    _$SuggestionDtoImpl(
      placeId: json['place_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      mainText: json['main_text'] as String? ?? '',
    );

Map<String, dynamic> _$$SuggestionDtoImplToJson(_$SuggestionDtoImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.description,
      'main_text': instance.mainText,
    };
