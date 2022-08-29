import 'package:case_infobox/Models/besin_model.dart';
import 'package:case_infobox/constants/api_config.dart';
import 'package:dio/dio.dart';

import '../Models/altin_model.dart';
import '../Models/corona_model.dart';
import '../Models/doviz_model.dart';
import '../Models/eczane_model.dart';
import '../Models/haberler_model.dart';
import '../Models/hava_model.dart';
import '../Models/kripto_model.dart';



class CoronaService {
  Dio? dio;

  Future<CoronaModel?> getCoronaData() async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 751dOGGcgiSo9KBWM1V2zm:6TBeqO1fmQwTW7sT9eNcCc";

    var parameterData = {"country": "tr"};

    try {
      Response response =
      await dio!.get(ApiConfig.getCorona, queryParameters: parameterData);

      if (response.statusCode == 200) {
        return CoronaModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class HaberlerService {
  Dio? dio;

  Future<HaberlerModel?> getHaberlerData() async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";

    var parameterData = {"country": "tr","tag":"general"};

    try {
      Response response =
      await dio!.get(ApiConfig.getHaberler, queryParameters: parameterData);

      if (response.statusCode == 200) {
        return HaberlerModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}



class HavaService {
  Dio? dio;

  Future<HavaModel?> getHavaData(String lang,String city) async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";

    var parameterData = {"data.lang": "$lang","data.city":"$city"};

    try {
      Response response =
      await dio!.get(ApiConfig.getHavaDurumu, queryParameters: parameterData);

      if (response.statusCode == 200) {
        return HavaModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}


class BesinService {
  Dio? dio;

  Future<BesinModel?> getBesinData() async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";

    var date = DateTime.now();
    var month = date.month;
    print("${month}");
    var parameterData = {"ay": "${month}"};


    try {
      Response response =
      await dio!.get(ApiConfig.getBesin, queryParameters: parameterData);

      if (response.statusCode == 200) {
        return BesinModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class DovizService {
  Dio? dio;

  Future<DovizModel?> getDovizData() async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";


    try {
      Response response =
      await dio!.get(ApiConfig.getDoviz);

      if (response.statusCode == 200) {
        return DovizModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}


class AltinService {
  Dio? dio;

  Future<AltinModel?> getAltinData() async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";


    try {
      Response response =
      await dio!.get(ApiConfig.getAltin);

      if (response.statusCode == 200) {
        return AltinModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}


class KriptoService {
  Dio? dio;

  Future<KriptoModel?> getKriptoData() async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";


    try {
      Response response =
      await dio!.get(ApiConfig.getKripto);

      if (response.statusCode == 200) {
        return KriptoModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class EczaneService {
  Dio? dio;

  Future<EczaneModel?> getEczaneData(String il, String ilce) async {
    dio = Dio();

    dio!.options.headers['content-Type'] = 'application/json';
    dio!.options.headers["authorization"] =
    "apikey 22olM8QktnryimzmI2AWx1:5i3yg9oD5ArFmnRh8ErCVC";



    // if(il.isEmpty)
    //   {
    //     il = "ankara";
    //   }



    var parameterData = {"il": "$il","ilce":"$ilce"};


    try {
      Response response =
      await dio!.get(ApiConfig.getEczane, queryParameters: parameterData);

      if (response.statusCode == 200) {
        return EczaneModel.fromJson( response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}