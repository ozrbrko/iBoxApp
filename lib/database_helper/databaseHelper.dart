import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final databaseName = "ibox.db";

  static Future<Database> databaseAccess() async {

    String databasePath = join(await getDatabasesPath(),databaseName);

    if(await databaseExists(databasePath)){
      print("veritabanı zaten var");

    }else{
      ByteData data = await rootBundle.load("lib/database/$databaseName");
      List<int> bytes = data.buffer.asUint8ClampedList(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print("Veritabanı kopyalandı");
    }

    return openDatabase(databasePath);

  }
}