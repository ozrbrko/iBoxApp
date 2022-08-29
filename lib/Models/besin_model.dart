import 'package:json_annotation/json_annotation.dart';
part 'besin_model.g.dart';

@JsonSerializable()
class BesinModel {
  BesinModel({
    this.success,
    this.result,
  });

  bool? success;
  Result? result;

  factory BesinModel.fromJson(Map<String, dynamic> json) => _$BesinModelFromJson(json);

  Map<String, dynamic> toJson() => _$BesinModelToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    this.mevsim_meyve,
    this.mevsim_sebze,
    this.her_zaman_sebze,
  });

  List<String>? mevsim_meyve;
  List<String>? mevsim_sebze;
  List<String>? her_zaman_sebze;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
