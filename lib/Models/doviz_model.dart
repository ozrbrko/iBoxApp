
import 'package:json_annotation/json_annotation.dart';
part 'doviz_model.g.dart';

@JsonSerializable()
class DovizModel {
  DovizModel({
    this.success,
    this.result,
  });

  bool? success;
  List<DovizResult>? result;

  factory DovizModel.fromJson(Map<String, dynamic> json) => _$DovizModelFromJson(json);

  Map<String, dynamic> toJson() => _$DovizModelToJson(this);
}

@JsonSerializable()
class DovizResult {
  DovizResult({
    this.name,
    this.code,
    this.buying,
    this.buyingstr,
    this.selling,
    this.sellingstr,
    this.rate,
    this.date,
    this.datetime,
    this.calculated,
  });

  String? name;
  String? code;
  double? buying;
  String? buyingstr;
  double? selling;
  String? sellingstr;
  double? rate;
  DateTime? date;
  DateTime? datetime;
  int? calculated;

  factory DovizResult.fromJson(Map<String, dynamic> json) => _$DovizResultFromJson(json);

  Map<String, dynamic> toJson() => _$DovizResultToJson(this);
}


