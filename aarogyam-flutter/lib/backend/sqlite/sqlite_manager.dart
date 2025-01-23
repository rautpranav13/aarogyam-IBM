import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'dbaarogyam',
      'dbaarogyam.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<ReadmedicationsRow>> readmedications() => performReadmedications(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future updateremainder({
    int? id,
    String? title,
    String? message,
    int? hour,
    int? minute,
  }) =>
      performUpdateremainder(
        _database,
        id: id,
        title: title,
        message: message,
        hour: hour,
        minute: minute,
      );

  Future updateturnedon({
    int? id,
    bool? caseonoff,
  }) =>
      performUpdateturnedon(
        _database,
        id: id,
        caseonoff: caseonoff,
      );

  Future insertReminder({
    int? id,
    String? title,
    String? message,
    String? hour,
    String? minute,
  }) =>
      performInsertReminder(
        _database,
        id: id,
        title: title,
        message: message,
        hour: hour,
        minute: minute,
      );

  /// END UPDATE QUERY CALLS
}
