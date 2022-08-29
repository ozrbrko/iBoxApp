

import 'Corona.dart';

class CoronaCevap {
  int success;
  List<Corona> getCoronaLists;

  CoronaCevap(this.success, this.getCoronaLists);

  factory CoronaCevap.fromJson(Map<String, dynamic> json){

    var jsonArray = json["result"] as List;
    List<Corona> getCoronaLists = jsonArray.map((jsonArrayNesnesi) => Corona.fromJson(jsonArrayNesnesi)).toList();
    return CoronaCevap(json["success"] as int, getCoronaLists);
  }
}