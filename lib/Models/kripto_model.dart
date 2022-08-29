
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'kripto_model.g.dart';


@JsonSerializable()

class KriptoModel {
  KriptoModel({
    this.success,
    this.result,
  });

  bool? success;
  List<KriptoResult>? result;

  factory KriptoModel.fromJson(Map<String, dynamic> json) => _$KriptoModelFromJson(json);

  Map<String, dynamic> toJson() => _$KriptoModelToJson(this);
}

@JsonSerializable()

class KriptoResult {
  KriptoResult({
    this.changeHour,
    this.changeHourstr,
    this.changeDay,
    this.changeDaystr,
    this.changeWeek,
    this.changeWeekstr,
    this.volumestr,
    this.volume,
    this.pricestr,
    this.price,
    this.marketCapstr,
    this.marketCap,
    this.circulatingSupply,
    this.code,
    this.name,
  });

  double? changeHour;
  String? changeHourstr;
  double? changeDay;
  String? changeDaystr;
  double? changeWeek;
  String? changeWeekstr;
  String? volumestr;
  double? volume;
  String? pricestr;
  double? price;
  String? marketCapstr;
  double? marketCap;
  String? circulatingSupply;
  String? code;
  String? name;

  factory KriptoResult.fromJson(Map<String, dynamic> json) =>
      _$KriptoResultFromJson(json);

  Map<String, dynamic> toJson() => _$KriptoResultToJson(this);

}
