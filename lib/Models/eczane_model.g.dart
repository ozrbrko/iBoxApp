// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eczane_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EczaneModel _$EczaneModelFromJson(Map<String, dynamic> json) => EczaneModel(
      success: json['success'] as bool?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => EczaneResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EczaneModelToJson(EczaneModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

EczaneResult _$EczaneResultFromJson(Map<String, dynamic> json) => EczaneResult(
      name: json['name'] as String?,
      dist: json['dist'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      loc: json['loc'] as String?,
    );

Map<String, dynamic> _$EczaneResultToJson(EczaneResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dist': instance.dist,
      'address': instance.address,
      'phone': instance.phone,
      'loc': instance.loc,
    };
