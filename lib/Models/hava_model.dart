
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'hava_model.g.dart';

@JsonSerializable()
class HavaModel {
  HavaModel({
    this.success,
    this.city,
    this.result,
  });

  bool? success;
  String? city;
  List<HavaResult>? result;

  factory HavaModel.fromJson(Map<String, dynamic> json) => _$HavaModelFromJson(json);


  Map<String, dynamic> toJson() => _$HavaModelToJson(this);

}

@JsonSerializable()
class HavaResult {
  HavaResult({
    this.date,
    this.day,
    this.icon,
    this.description,
    this.status,
    this.degree,
    this.min,
    this.max,
    this.night,
    this.humidity,
  });

  String? date;
  String? day;
  String? icon;
  String? description;
  String? status;
  String? degree;
  String? min;
  String? max;
  String? night;
  String? humidity;

  factory HavaResult.fromJson(Map<String, dynamic> json) => _$HavaResultFromJson(json);

  Map<String, dynamic> toJson() => _$HavaResultToJson(this);

}
