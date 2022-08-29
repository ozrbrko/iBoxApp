
import 'package:json_annotation/json_annotation.dart';
part 'haberler_model.g.dart';

@JsonSerializable()
class HaberlerModel {
  HaberlerModel({
     this.success,
     this.result,
  });

  bool? success;
  List<HaberlerResult>? result;

  factory HaberlerModel.fromJson(Map<String, dynamic> json) => _$HaberlerModelFromJson(json);

  Map<String, dynamic> toJson() => _$HaberlerModelToJson(this);


}

@JsonSerializable()
class HaberlerResult {
  HaberlerResult({
     this.key,
     this.url,
     this.description,
     this.image,
     this.name,
     this.source,
     this.date,
  }) ;

  String? key;
  String? url;
  String? description;
  String? image;
  String? name;
  String? source;
  DateTime? date;

  factory HaberlerResult.fromJson(Map<String, dynamic> json) => _$HaberlerResultFromJson(json);

  Map<String, dynamic> toJson() => _$HaberlerResultToJson(this);


}
