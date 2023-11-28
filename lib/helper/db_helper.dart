import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'Place.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE User_Places(id TEXT PRIMARY KEY,title TEXT,image TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> fetchData(String table) async {
    // final dbPath = await sql.getDatabasesPath();
    // final sqldb = await sql.openDatabase(
    //   path.join(dbPath, 'Place.db'),
    //   onCreate: (db, version) {
    //     return db.execute(
    //         'CREATE DATABASE User_Places(id TEXT PRIMARY KEY,title TEXT,image TEXT)');
    //   },
    //   version: 1,
    // );
    final db = await DbHelper.database();
    return db.query(table);
  }
}
