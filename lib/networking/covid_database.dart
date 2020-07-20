import 'dart:io';
import 'package:covid_stats/models/covid_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class CovidDatabase {
  CovidDatabase._();

  static final CovidDatabase db = CovidDatabase._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'covidDatabase.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
        CREATE TABLE covidTable(
        state TEXT PRIMARY KEY,
        confirmed TEXT,
        active TEXT,
        deaths TEXT,
        recovered TEXT,
        deltaconfirmed TEXT,
        deltadeaths TEXT,
        deltarecovered TEXT
        )""");
    });
  }

  Future<int> addToDatabase(CovidModel covidModel) async {
    final db = await database;
    var a = db.insert('covidTable', covidModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return a;
  }

  Future<int> deleteCovidModelById(String state) async {
    final db = await database;
    var a = db.delete('covidTable', where: 'state = ?', whereArgs: [state]);
    return a;
  }
  
  
  Future<int> updateList(CovidModel covidModel) async{
    final db = await database;
    var a = db.update('covidTable', covidModel.toMap(), where: 'state = ?', whereArgs: [covidModel.state]);
    return a;

  }
  Future<List<CovidModel>> getUserList() async {
    final db = await database;
    var a = await db.query('covidTable');
    List<CovidModel> list =
        a.isNotEmpty ? a.map((e) => (CovidModel.fromJson(e))).toList() : [];
    return list;
  }
}
