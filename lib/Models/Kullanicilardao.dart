import 'package:case_infobox/Models/Kullanicilar.dart';
import 'package:case_infobox/database_helper/databaseHelper.dart';

class Kullanicilardao {

  Future<List<Kullanicilar>> tumKullanicilar() async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kullanicilar");

    return List.generate(maps.length, (i) {

      var satir = maps[i];

      return Kullanicilar(satir["kullanici_id"],satir["kullanici_ad"],satir["kullanici_soyad"],satir["kullanici_mail"],satir["kullanici_sifre"],);
    });

  }



  Future<void> kullaniciEkle(String kullanici_ad,String kullanici_soyad,kullanici_mail,kullanici_sifre) async {
    var db = await DatabaseHelper.databaseAccess();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kullanici_ad "] = kullanici_ad;
    bilgiler["kullanici_soyad"] = kullanici_soyad;
    bilgiler["kullanici_mail"] = kullanici_mail;
    bilgiler["kullanici_sifre"] = kullanici_sifre;

    await db.insert("kullanicilar", bilgiler);
  }

  Future<int> kayitKontrol(String kullanici_mail) async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT count(*) AS sonuc FROM kullanicilar WHERE kullanici_mail = '$kullanici_mail'");

    return maps[0]["sonuc"];

  }

  Future<int> girisKontrol(String kullanici_mail,String kullanici_sifre) async {

    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT count(*) AS sonuc FROM kullanicilar WHERE kullanici_mail = '$kullanici_mail' AND kullanici_sifre = '$kullanici_sifre'");

    return maps[0]["sonuc"];

  }


}