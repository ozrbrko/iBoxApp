class Corona {
  String country;
  String totalcases;
  String newCases;
  String totaldeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;


  Corona(this.country, this.totalcases, this.newCases, this.totaldeaths,
      this.newDeaths, this.totalRecovered, this.activeCases);

  factory Corona.fromJson(Map<String,dynamic> json){

    return Corona(json["country"] as String, json["totalcases"] as String, json["newCases"] as String, json["totaldeaths"] as String, json["newDeaths"] as String, json["totalRecovered"] as String, json["activeCases"] as String);
  }
}


