// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AltinModel _$AltinModelFromJson(Map<String, dynamic> json) => AltinModel(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => AltinResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$AltinModelToJson(AltinModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'success': instance.success,
    };

AltinResult _$AltinResultFromJson(Map<String, dynamic> json) => AltinResult(
      name: json['name'] as String?,
      buying: (json['buying'] as num?)?.toDouble(),
      buyingstr: json['buyingstr'] as String?,
      selling: (json['selling'] as num?)?.toDouble(),
      sellingstr: json['sellingstr'] as String?,
      time: json['time'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AltinResultToJson(AltinResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'buying': instance.buying,
      'buyingstr': instance.buyingstr,
      'selling': instance.selling,
      'sellingstr': instance.sellingstr,
      'time': instance.time,
      'date': instance.date?.toIso8601String(),
      'datetime': instance.datetime?.toIso8601String(),
      'rate': instance.rate,
    };
