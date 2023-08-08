import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    path = join(path, 'sleep_diary.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE sleep_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            week_number INTEGER,
            bed_time TEXT,
            sleep_latency TEXT,
            number_of_awakenings TEXT,
            average_length_awakening TEXT,
            wake_time TEXT,
            scoops_zenbev TEXT,
            sleep_date TEXT
            )
        ''');
      },
    );
  }

  Future<int?> saveSleepData(Map<String, dynamic> sleepData) async {
    final Database? db = await database;
    return await db?.insert('sleep_data', sleepData);
  }

  Future<List<Map<String, dynamic>>?> getSleepData() async {
    final Database? db = await database;
    return await db?.query('sleep_data');
  }

  Future<List<Map<String, dynamic>>?> getSleepDataByWeek(int weekNumber) async {
    final Database? db = await database;
    return await db?.query('sleep_data', where: 'week_number = ?', whereArgs: [weekNumber]);
  }

  Future<int?> updateSleepData(int weekNumber, Map<String, dynamic> sleepData) async {
    final Database? db = await database;
    return await db?.update('sleep_data', sleepData, where: 'week_number = ?', whereArgs: [weekNumber]);
  }
}
