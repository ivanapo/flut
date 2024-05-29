import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../models/event.dart';

class AppDatabase {
  static Database? _database;
  static final AppDatabase instance = AppDatabase._constructor();

  final String _tasksTableName = "events";
  final String _tasksIdColumnName = "id";
  final String _tasksTitleColumnName = "title";
  final String _tasksDescriptionColumnName = "description";
  final String _tasksDurationColumnName = "duration";

  AppDatabase._constructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB();
    return _database!;
  }

  Future<Database> _initializeDB() async {
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
    }
    const databasePath = 'my_web_db.db';

    final database = await openDatabase(databasePath, version: 1, onCreate: (db, version) {
      db.execute('''
      CREATE TABLE $_tasksTableName (
        $_tasksIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
        $_tasksTitleColumnName TEXT NOT NULL,
        $_tasksDescriptionColumnName TEXT NOT NULL,
        $_tasksDurationColumnName INTEGER NOT NULL
      ) 
      ''');
    });
    return database;
  }

  Future<void> addEvent(String title, String description, int duration) async {
    final db = await database;
    await db.insert(
      _tasksTableName,
      {
        _tasksTitleColumnName: title,
        _tasksDescriptionColumnName: description,
        _tasksDurationColumnName: duration,
      },
    );
  }

  Future<List<Event>> getTasks() async {
    final db = await database;
    final data = await db.query(_tasksTableName);
    List<Event> tasks = data
        .map(
          (e) => Event(
            id: e[_tasksIdColumnName] as int,
            title: e[_tasksTitleColumnName] as String,
            description: e[_tasksDescriptionColumnName] as String,
            duration: e[_tasksDurationColumnName] as int,
          ),
        )
        .toList();
    return tasks;
  }

  Future<void> updateEvent(int id, String title, String description, int duration) async {
    final db = await database;
    await db.update(
      _tasksTableName,
      {
        _tasksTitleColumnName: title,
        _tasksDescriptionColumnName: description,
        _tasksDurationColumnName: duration,
      },
      where: '$_tasksIdColumnName = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteEvent(int id) async {
    final db = await database;
    await db.delete(
      _tasksTableName,
      where: '$_tasksIdColumnName = ?',
      whereArgs: [id],
    );
  }
}
