class ApiConfig {
  static const String liveBaseURL = "https://api.collectapi.com/";

  static const String baseURL = liveBaseURL;

  //Corona Services


  static const String getHaberler = baseURL+ "news/getNews";

  static const String getHavaDurumu = baseURL+ "weather/getWeather";

  static const String getCorona = baseURL+ "corona/countriesData";

  static const String getBesin = baseURL+ "food/whenFoods";

  static const String getDoviz = baseURL+ "economy/allCurrency";


  static const String getAltin = baseURL+ "economy/goldPrice";

  static const String getKripto = baseURL+ "economy/cripto";

  static const String getEczane = baseURL+ "health/dutyPharmacy";

  static const String google_api_key = "AIzaSyA2Jm6nCkSPY_sIt2vYlOkPIWQhoaii7m4";

}
