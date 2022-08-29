// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'besin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BesinModel _$BesinModelFromJson(Map<String, dynamic> json) => BesinModel(
      success: json['success'] as bool?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BesinModelToJson(BesinModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      mevsim_meyve: (json['mevsim_meyve'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mevsim_sebze: (json['mevsim_sebze'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      her_zaman_sebze: (json['her_zaman_sebze'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'mevsim_meyve': instance.mevsim_meyve,
      'mevsim_sebze': instance.mevsim_sebze,
      'her_zaman_sebze': instance.her_zaman_sebze,
    };
