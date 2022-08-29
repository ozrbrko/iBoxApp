// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kripto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KriptoModel _$KriptoModelFromJson(Map<String, dynamic> json) => KriptoModel(
      success: json['success'] as bool?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => KriptoResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KriptoModelToJson(KriptoModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result,
    };

KriptoResult _$KriptoResultFromJson(Map<String, dynamic> json) => KriptoResult(
      changeHour: (json['changeHour'] as num?)?.toDouble(),
      changeHourstr: json['changeHourstr'] as String?,
      changeDay: (json['changeDay'] as num?)?.toDouble(),
      changeDaystr: json['changeDaystr'] as String?,
      changeWeek: (json['changeWeek'] as num?)?.toDouble(),
      changeWeekstr: json['changeWeekstr'] as String?,
      volumestr: json['volumestr'] as String?,
      volume: (json['volume'] as num?)?.toDouble(),
      pricestr: json['pricestr'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      marketCapstr: json['marketCapstr'] as String?,
      marketCap: (json['marketCap'] as num?)?.toDouble(),
      circulatingSupply: json['circulatingSupply'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$KriptoResultToJson(KriptoResult instance) =>
    <String, dynamic>{
      'changeHour': instance.changeHour,
      'changeHourstr': instance.changeHourstr,
      'changeDay': instance.changeDay,
      'changeDaystr': instance.changeDaystr,
      'changeWeek': instance.changeWeek,
      'changeWeekstr': instance.changeWeekstr,
      'volumestr': instance.volumestr,
      'volume': instance.volume,
      'pricestr': instance.pricestr,
      'price': instance.price,
      'marketCapstr': instance.marketCapstr,
      'marketCap': instance.marketCap,
      'circulatingSupply': instance.circulatingSupply,
      'code': instance.code,
      'name': instance.name,
    };
