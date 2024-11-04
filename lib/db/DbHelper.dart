// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:local_database/db/constants.dart';

class DbHelper {
// 1) single instance
  DbHelper._();
  static final DbHelper helper = DbHelper._();

// 2) get database path
  Future<String> _getpath() async {
    String path = await getDatabasesPath();
    // String noteDbPath = path+'/notes.db';                دا السطر بدون استخدام باكدج ال path 
    return join(path , databaseName);                    // وهو بقي هيحط الفاصل بينهم علي حسب ال platform
  }
  
// 3) open or create database
  Future<Database> CreateOrOpen () async {
    String path = await _getpath();
    return openDatabase(path, version: dbVersion, singleInstance: true , readOnly: false , onCreate: (db, version) => _onCreatedb(db) ,  );
  }

// 4) create table
  void _onCreatedb(Database db){
    try {
      db.execute(createTable);
    }on DatabaseException catch (e) {
      print(e.toString());
    }
  }

}
