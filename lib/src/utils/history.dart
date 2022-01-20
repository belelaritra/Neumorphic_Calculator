import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HistoryDatabase {
  late final _database;

  Future<void> _getDatabase() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'calculator.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE history(id INTEGER PRIMARY KEY, resultExpr TEXT, result TEXT)',
        );
      },
      version: 1,
    );
  }
}

class History {
  History({required this.id, required this.resultExpr, required this.result});

  final int id;
  final String resultExpr;
  final String result;
}
