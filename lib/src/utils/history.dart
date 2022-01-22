import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HistoryDatabase {
  HistoryDatabase._init();
  static final HistoryDatabase instance = HistoryDatabase._init();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await getDatabase();
      return _database;
    }
  }

  Future<void> deleteHistory() async {
    final db = await instance.database;
    db?.delete('history');
  }

  Future<List<Map<String, dynamic>>> getHistory() async {
    final db = await instance.database;

    return await db?.query('history', orderBy: 'id DESC')
        as List<Map<String, dynamic>>;
  }

  addHistory(String resultExpr, String result) async {
    final db = await instance.database;
    db?.execute(
      'INSERT INTO history (resultExpr, result) VALUES (?, ?)',
      [resultExpr, result],
    );
  }

  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'calculator.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE history(id INTEGER PRIMARY KEY AUTOINCREMENT, resultExpr TEXT NOT NULL, result TEXT NOT NULL)',
        );
      },
      version: 1,
    );
  }
}
