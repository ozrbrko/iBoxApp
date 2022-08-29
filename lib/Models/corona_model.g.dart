// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corona_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoronaModel _$CoronaModelFromJson(Map<String, dynamic> json) => CoronaModel(
      success: json['success'] as bool?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => CoronaResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoronaModelToJson(CoronaModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

CoronaResult _$CoronaResultFromJson(Map<String, dynamic> json) => CoronaResult(
      country: json['country'] as String?,
      totalCases: json['totalCases'] as String?,
      newCases: json['newCases'] as String?,
      totalDeaths: json['totalDeaths'] as String?,
      newDeaths: json['newDeaths'] as String?,
      totalRecovered: json['totalRecovered'] as String?,
      activeCases: json['activeCases'] as String?,
    );

Map<String, dynamic> _$CoronaResultToJson(CoronaResult instance) =>
    <String, dynamic>{
      'country': instance.country,
      'totalCases': instance.totalCases,
      'newCases': instance.newCases,
      'totalDeaths': instance.totalDeaths,
      'newDeaths': instance.newDeaths,
      'totalRecovered': instance.totalRecovered,
      'activeCases': instance.activeCases,
    };
