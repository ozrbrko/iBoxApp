
import 'package:case_infobox/database_helper/databaseHelper.dart';
import 'package:case_infobox/views/homepage/sidebar/Notlar.dart';

class Notlardao {
  Future<List<Notlar>> tumNotlar() async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM notes");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Notlar(satir["not_id"], satir["not_baslik"], satir["not_detay"]);
    });
  }

  Future<void> notEkle(String not_baslik, String not_detay) async {
    var db = await DatabaseHelper.databaseAccess();
    var bilgiler = Map<String, dynamic>();
    bilgiler["not_baslik"] = not_baslik;
    bilgiler["not_detay"] = not_detay;
    
    await db.insert("notes", bilgiler);
  }


  Future<void> notGuncelle(int not_id, String not_baslik, String not_detay) async {
    var db = await DatabaseHelper.databaseAccess();
    var bilgiler = Map<String, dynamic>();
    bilgiler["not_baslik"] = not_baslik;
    bilgiler["not_detay"] = not_detay;

    await db.update("notes", bilgiler,where: "not_id=?",whereArgs: [not_id]);
  }


  Future<void> notSil(int not_id) async {
    var db = await DatabaseHelper.databaseAccess();

    await db.delete("notes",where: "not_id=?",whereArgs: [not_id]);
  }

}
