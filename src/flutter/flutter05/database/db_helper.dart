import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/note.dart';
import '../model/user.dart';

class DatabaseHelper {
  static Database? _database; //static + nullable

  static final DatabaseHelper instance = DatabaseHelper._(); //Singleton Pattern

  DatabaseHelper._(); //Private constructor

  //getter lấy instance của database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //khởi tạo database
  //version để quản lý pb database
  //onCreate đc gọi khi database đc tạo lần đầu
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'note.db');
    return openDatabase(path, version: 1, onCreate: _createDB);
  }

  //câu lệnh tạo table trong notes.db
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
  CREATE TABLE notes(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    createdAt TEXT NOT NULL
  );
  
  CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        pass TEXT NOT NULL,
        dateOfBirth TEXT
      );
    ''');
  }

  //thêm ghi chú
  Future<int> insertNote(Note note) async {
    final db = await database; //gọi getter lấy db
    return await db.insert('notes', note.toMap());
  }

  //lấy danh sách ghi chú
  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes', orderBy: 'createdAt DESC');
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  Future<int> updateNote(Note note) async {
    final db = await database;
    return await db
        .update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUser(String username, String password) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? AND pass = ?',
      whereArgs: [username, password],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
