import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'my_database.db';
  static final _dbVersion = 1;
  static final _tableName = 'notes';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $_tableName (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    type TEXT,
    startDate TEXT
  )
''');
  }

  Future<int> insertTree(Map<String, dynamic> tree) async {
  final db = await database;
  return await db.insert(_tableName, tree);
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;
    return await db.query(_tableName);
  }

  Future<void> deleteAllNotes() async {
    final db = await database;
    await db.delete(_tableName);
  }
}