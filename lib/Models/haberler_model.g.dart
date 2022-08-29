// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'haberler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HaberlerModel _$HaberlerModelFromJson(Map<String, dynamic> json) =>
    HaberlerModel(
      success: json['success'] as bool?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => HaberlerResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HaberlerModelToJson(HaberlerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

HaberlerResult _$HaberlerResultFromJson(Map<String, dynamic> json) =>
    HaberlerResult(
      key: json['key'] as String?,
      url: json['url'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      source: json['source'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$HaberlerResultToJson(HaberlerResult instance) =>
    <String, dynamic>{
      'key': instance.key,
      'url': instance.url,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
      'source': instance.source,
      'date': instance.date?.toIso8601String(),
    };
