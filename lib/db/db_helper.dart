import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/office.dart';
import '../models/worker.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'office_management.db'),
      onCreate: (db, version) {
        return db.transaction((txn) async {
          await txn.execute(
              'CREATE TABLE offices(id INTEGER PRIMARY KEY, officeName TEXT, physicalAddress TEXT, emailAddress TEXT, phoneNumber TEXT, maximumCapacity INTEGER, officeColor INTEGER)');
          await txn.execute(
              'CREATE TABLE workers(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, avatar TEXT, officeId INTEGER)');
        });
      },
      version: 1,
    );
  }

  static Future<void> insertOffice(Office office) async {
    final db = await DBHelper.database();
    await db.insert('offices', office.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> insertWorker(Worker worker) async {
    final db = await DBHelper.database();
    await db.insert('workers', worker.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getOffices() async {
    final db = await DBHelper.database();
    return db.query('offices');
  }

  static Future<List<Map<String, dynamic>>> getWorkers(int officeId) async {
    final db = await DBHelper.database();
    return db.query('workers', where: 'officeId = ?', whereArgs: [officeId]);
  }

  static Future<void> updateOffice(Office office) async {
    final db = await DBHelper.database();
    await db.update('offices', office.toMap(),
        where: 'id = ?', whereArgs: [office.id]);
  }

  static Future<void> updateWorker(Worker worker) async {
    final db = await DBHelper.database();
    await db.update('workers', worker.toMap(),
        where: 'id = ?', whereArgs: [worker.id]);
  }

  static Future<void> deleteOffice(int id) async {
    final db = await DBHelper.database();
    await db.delete('offices', where: 'id = ?', whereArgs: [id]);
    await db.delete('workers', where: 'officeId = ?', whereArgs: [id]);
  }

  static Future<void> deleteWorker(int id) async {
    final db = await DBHelper.database();
    await db.delete('workers', where: 'id = ?', whereArgs: [id]);
  }
}
