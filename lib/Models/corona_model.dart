// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'package:json_annotation/json_annotation.dart';
part 'corona_model.g.dart';

@JsonSerializable()
class CoronaModel {
  CoronaModel({
    this.success,
    this.result,
  });

  bool? success;
  List<CoronaResult>? result;

  factory CoronaModel.fromJson(Map<String, dynamic> json) => _$CoronaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoronaModelToJson(this);
}

@JsonSerializable()
class CoronaResult {
  CoronaResult({
    this.country,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
  });

  String? country;
  String? totalCases;
  String? newCases;
  String? totalDeaths;
  String? newDeaths;
  String? totalRecovered;
  String? activeCases;

  factory CoronaResult.fromJson(Map<String, dynamic> json) => _$CoronaResultFromJson(json);

  Map<String, dynamic> toJson() => _$CoronaResultToJson(this);

}