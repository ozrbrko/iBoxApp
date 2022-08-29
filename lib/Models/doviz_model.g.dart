// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DovizModel _$DovizModelFromJson(Map<String, dynamic> json) => DovizModel(
      success: json['success'] as bool?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => DovizResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DovizModelToJson(DovizModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

DovizResult _$DovizResultFromJson(Map<String, dynamic> json) => DovizResult(
      name: json['name'] as String?,
      code: json['code'] as String?,
      buying: (json['buying'] as num?)?.toDouble(),
      buyingstr: json['buyingstr'] as String?,
      selling: (json['selling'] as num?)?.toDouble(),
      sellingstr: json['sellingstr'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      calculated: json['calculated'] as int?,
    );

Map<String, dynamic> _$DovizResultToJson(DovizResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'buying': instance.buying,
      'buyingstr': instance.buyingstr,
      'selling': instance.selling,
      'sellingstr': instance.sellingstr,
      'rate': instance.rate,
      'date': instance.date?.toIso8601String(),
      'datetime': instance.datetime?.toIso8601String(),
      'calculated': instance.calculated,
    };
