/*
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Screens/sleep_data.dart';

class SleepDataDatabase {

  static final SleepDataDatabase _instance = SleepDataDatabase._internal();

  factory SleepDataDatabase() => _instance;

  SleepDataDatabase._internal();

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
        await db.execute(
          'CREATE TABLE sleep_data(id INTEGER PRIMARY KEY AUTOINCREMENT, bedTime TEXT, sleepLatency INTEGER, numAwakenings INTEGER, avgLengthOfAwakening INTEGER, wakeTime TEXT, scoopsOfZenbev INTEGER, date TEXT)',
        );
      },
    );
  }

  Future<bool> insertSleepData(SleepData data) async {
    try {
      final Database? db = await database; // Await the database initialization

      if (db == null) {
        print('_database is null, cannot insert data.');
        return false;
      }

      print(data.toMap());

      final int insertedRows = await db.insert(
        'sleep_data',
        data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      if (insertedRows > 0) {
        print('Data inserted successfully.');
        return true;
      } else {
        print('Data insertion failed.');
        return false;
      }
    } catch (e) {
      print('Error inserting data: $e');
      return false;
    }
  }

  Future<void> resetData() async {
    try {
      final Database? db = await database;

      if (db == null) {
        print('_database is null, cannot reset data.');
        return;
      }

      await db.delete('sleep_data'); // Delete all rows from the table
      print('Data reset successful.');
    } catch (e) {
      print('Error resetting data: $e');
    }
  }

  Future<List<SleepData>> getSleepData() async {
    final List<Map<String, dynamic>> maps = await _database!.query('sleep_data');
    return List.generate(maps.length, (i) {
      return SleepData(
        id: maps[i]['id'],
        bedTime: maps[i]['bedTime'],
        sleepLatency: maps[i]['sleepLatency'],
        numAwakenings: maps[i]['numAwakenings'],
        avgLengthOfAwakening: maps[i]['avgLengthOfAwakening'],
        wakeTime: maps[i]['wakeTime'],
        scoopsOfZenbev: maps[i]['scoopsOfZenbev'],
        date: maps[i]['date'],
      );
    });
  }

  Future<List<SleepData>> getSortedSleepDataByDate() async {
    try {
      final Database? db = await database;

      if (db == null) {
        print('_database is null, cannot retrieve data.');
        return [];
      }

      final List<Map<String, dynamic>> maps = await db.query(
        'sleep_data',
        orderBy: 'date ASC', // Order by date in ascending order
      );

      return List.generate(maps.length, (i) {
        return SleepData(
          id: maps[i]['id'],
          bedTime: maps[i]['bedTime'],
          sleepLatency: maps[i]['sleepLatency'],
          numAwakenings: maps[i]['numAwakenings'],
          avgLengthOfAwakening: maps[i]['avgLengthOfAwakening'],
          wakeTime: maps[i]['wakeTime'],
          scoopsOfZenbev: maps[i]['scoopsOfZenbev'],
          date: maps[i]['date'],
        );
      });
    } catch (e) {
      print('Error retrieving sorted data: $e');
      return [];
    }
  }

}
*/
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Screens/sleep_data.dart';

class SleepDataDatabase {

  static final SleepDataDatabase _instance = SleepDataDatabase._internal();

  factory SleepDataDatabase() => _instance;

  SleepDataDatabase._internal();

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
        await db.execute(
          'CREATE TABLE sleep_data(id INTEGER PRIMARY KEY AUTOINCREMENT, bedTime TEXT, sleepLatency INTEGER, numAwakenings INTEGER, avgLengthOfAwakening INTEGER, wakeTime TEXT, scoopsOfZenbev INTEGER, date TEXT)',
        );
      },
    );
  }

  Future<bool> insertSleepData(SleepData data) async {
    try {
      final Database? db = await database; // Await the database initialization

      if (db == null) {
        print('_database is null, cannot insert data.');
        return false;
      }

      print(data.toMap());

      final int insertedRows = await db.insert(
        'sleep_data',
        data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      if (insertedRows > 0) {
        print('Data inserted successfully.');
        return true;
      } else {
        print('Data insertion failed.');
        return false;
      }
    } catch (e) {
      print('Error inserting data: $e');
      return false;
    }
  }

  Future<void> resetData() async {
    try {
      final Database? db = await database;

      if (db == null) {
        print('_database is null, cannot reset data.');
        return;
      }

      await db.delete('sleep_data'); // Delete all rows from the table
      print('Data reset successful.');
    } catch (e) {
      print('Error resetting data: $e');
    }
  }

  Future<List<SleepData>> getSleepData() async {
    if (_database == null) {
      print("_database is null!"); // Add this line for debugging
      return []; // or handle this case accordingly
    }
    final List<Map<String, dynamic>> maps = await _database!.query('sleep_data');
    return List.generate(maps.length, (i) {
      return SleepData(
        id: maps[i]['id'],
        bedTime: maps[i]['bedTime']??'',
        sleepLatency: maps[i]['sleepLatency']??0,
        numAwakenings: maps[i]['numAwakenings']??0,
        avgLengthOfAwakening: maps[i]['avgLengthOfAwakening']??0,
        wakeTime: maps[i]['wakeTime']??'',
        scoopsOfZenbev: maps[i]['scoopsOfZenbev']??0,
        date: maps[i]['date']??'',
      );
    });
  }

  Future<List<SleepData>> getSortedSleepDataByDate() async {
    try {
      final Database? db = await database;

      if (db == null) {
        print('_database is null, cannot retrieve data.');
        return [];
      }

      final List<Map<String, dynamic>> maps = await db.query(
        'sleep_data',
        orderBy: 'date ASC', // Order by date in ascending order
      );

      return List.generate(maps.length, (i) {
        return SleepData(
          id: maps[i]['id'],
          bedTime: maps[i]['bedTime'],
          sleepLatency: maps[i]['sleepLatency'],
          numAwakenings: maps[i]['numAwakenings'],
          avgLengthOfAwakening: maps[i]['avgLengthOfAwakening'],
          wakeTime: maps[i]['wakeTime'],
          scoopsOfZenbev: maps[i]['scoopsOfZenbev'],
          date: maps[i]['date'],
        );
      });
    } catch (e) {
      print('Error retrieving sorted data: $e');
      return [];
    }
  }

  Future<bool> isDateAlreadyExists(String date) async {
    final Database? db = await database;

    if (db == null) {
      print('_database is null, cannot check for existing data.');
      return false;
    }

    final count = Sqflite.firstIntValue(await db.rawQuery(
      'SELECT COUNT(*) FROM sleep_data WHERE date = ?',
      [date],
    ));

    return count! > 0;
  }
}

