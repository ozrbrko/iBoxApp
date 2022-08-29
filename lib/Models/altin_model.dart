

import 'package:json_annotation/json_annotation.dart';
part 'altin_model.g.dart';


@JsonSerializable()
class AltinModel {
  AltinModel({
    this.result,
    this.success,
  });

  List<AltinResult>? result;
  bool? success;

  factory AltinModel.fromJson(Map<String, dynamic> json) => _$AltinModelFromJson(json);

  Map<String, dynamic> toJson() => _$AltinModelToJson(this);
}

@JsonSerializable()

class AltinResult {
  AltinResult({
    this.name,
    this.buying,
    this.buyingstr,
    this.selling,
    this.sellingstr,
    this.time,
    this.date,
    this.datetime,
    this.rate,
  });

  String? name;
  double? buying;
  String? buyingstr;
  double? selling;
  String? sellingstr;
  String? time;
  DateTime? date;
  DateTime? datetime;
  double? rate;

  factory AltinResult.fromJson(Map<String, dynamic> json) => _$AltinResultFromJson(json);

  Map<String, dynamic> toJson() => _$AltinResultToJson(this);
}
