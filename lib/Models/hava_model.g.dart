// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hava_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HavaModel _$HavaModelFromJson(Map<String, dynamic> json) => HavaModel(
      success: json['success'] as bool?,
      city: json['city'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => HavaResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HavaModelToJson(HavaModel instance) => <String, dynamic>{
      'success': instance.success,
      'city': instance.city,
      'result': instance.result,
    };

HavaResult _$HavaResultFromJson(Map<String, dynamic> json) => HavaResult(
      date: json['date'] as String?,
      day: json['day'] as String?,
      icon: json['icon'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      degree: json['degree'] as String?,
      min: json['min'] as String?,
      max: json['max'] as String?,
      night: json['night'] as String?,
      humidity: json['humidity'] as String?,
    );

Map<String, dynamic> _$HavaResultToJson(HavaResult instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'icon': instance.icon,
      'description': instance.description,
      'status': instance.status,
      'degree': instance.degree,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'humidity': instance.humidity,
    };
