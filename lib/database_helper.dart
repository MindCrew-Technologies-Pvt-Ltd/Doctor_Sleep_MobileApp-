import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Screens/SleepData.dart';


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
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            week_number INTEGER,
            bed_time TEXT,
            sleep_latency TEXT,
            number_of_awakenings INTEGER,
            average_length_awakening INTEGER,
            wake_time TEXT,
            scoops_zenbev INTEGER,
            sleep_date TEXT NOT NULL
          )
        ''');
      },
    );
  }

  /* Future<int?> saveSleepData(SleepData sleepData) async {
    final Database? db = await database;

    // Check if data already exists for the given week number
    List<Map<String, dynamic>> existingData = await db?.query(
      'sleep_data',
      where: 'week_number = ?',
      whereArgs: [sleepData.weekNumber],
    ) ?? [];

    if (existingData.isNotEmpty) {
      // Data already exists, update it
      updateOrInsertSleepData(sleepData.weekNumber, sleepData);
    } else {
      // Data doesn't exist, insert it
      return await db?.insert('sleep_data', sleepData.toMap());
    }
  }*/
  Future<int?> saveSleepData(SleepData sleepData) async {
    final Database? db = await database;

    // Check if data already exists for the given week number
    List<Map<String, dynamic>> existingData = await db?.query(
      'sleep_data',
      where: 'week_number = ?',
      whereArgs: [sleepData.weekNumber],
    ) ?? [];

    if (existingData.isNotEmpty) {
      // Data already exists, update it
      updateOrInsertSleepData(sleepData.weekNumber, sleepData);
    } else {
      // Data doesn't exist, insert it
      return await db?.insert('sleep_data', sleepData.toMap());
    }

    // Return null if data was updated or inserted successfully
    return null;
  }


  Future<List<Map<String, dynamic>>?> getSleepData() async {
    final Database? db = await database;
    return await db?.query('sleep_data');
  }

  Future<List<Map<String, dynamic>>?> getSleepDataByWeek(int weekNumber) async {
    final Database? db = await database;
    return await db?.query('sleep_data', where: 'week_number = ?', whereArgs: [weekNumber]);
  }

  Future<List<Map<String, dynamic>>?> getSleepDataByWeekAndContainer(int weekNumber) async {
    final Database? db = await database;
    return await db?.query('sleep_data', where: 'week_number = ?', whereArgs: [weekNumber]);
  }

  Future<void> updateOrInsertSleepData(int weekNumber, SleepData sleepData) async {
    final Database? db = await database;

    // Delete existing data for the given weekNumber
    await db?.delete('sleep_data', where: 'week_number = ?', whereArgs: [weekNumber]);

    // Insert the updated data
    await db?.insert(
      'sleep_data',
      sleepData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<SleepData>> getAllSleepData() async {
    final Database? db = await database;
    List<Map<String, dynamic>> maps = await db?.query('sleep_data') ?? [];
    print("Fetched sleep data from the database: $maps");
    return List.generate(maps.length, (index) {
      return SleepData(
        id: maps[index]['id'],
        weekNumber: maps[index]['week_number'],
        bedTime: maps[index]['bed_time'],
        sleepLatency: maps[index]['sleep_latency'],
        numberOfAwakenings: maps[index]['number_of_awakenings'],
        averageLengthAwakening: maps[index]['average_length_awakening'],
        wakeTime: maps[index]['wake_time'],
        scoopsZenbev: maps[index]['scoops_zenbev'],
        sleepDate: maps[index]['sleep_date'],
      );
    });
  }

}
