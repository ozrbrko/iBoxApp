

import 'package:json_annotation/json_annotation.dart';
part 'eczane_model.g.dart';


@JsonSerializable()
class EczaneModel {
  EczaneModel({
    this.success,
    this.result,
  });

  bool? success;
  List<EczaneResult>? result;

  factory EczaneModel.fromJson(Map<String, dynamic> json) => _$EczaneModelFromJson(json);

  Map<String, dynamic> toJson() => _$EczaneModelToJson(this);
}

@JsonSerializable()
class EczaneResult {
  EczaneResult({
    this.name,
    this.dist,
    this.address,
    this.phone,
    this.loc,
  });

  String? name;
  String? dist;
  String? address;
  String? phone;
  String? loc;

  factory EczaneResult.fromJson(Map<String, dynamic> json) => _$EczaneResultFromJson(json);

  Map<String, dynamic> toJson() => _$EczaneResultToJson(this);
}
