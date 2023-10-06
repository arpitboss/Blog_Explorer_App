import 'package:path/path.dart';
import '../data_model/blog.dart';
import 'package:sqflite/sqflite.dart';

class BlogDatabaseServices {
  Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    final database = await openDatabase(
      join(dbPath, 'blogsexplorer.db'),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE blogs (
            id TEXT PRIMARY KEY,
            title TEXT,
            image_url TEXT
          )
        ''');
      },
      version: 1,
    );
    return database;
  }

  Future<int> insertBlog(Blog blog) async {
    final db = await getDatabase();
    return await db.insert(
      'blogs',
      blog.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Blog>> loadBlogs() async {
    final db = await getDatabase();
    final data = await db.query('blogs');
    return data.map((row) {
      return Blog(
        id: row['id'] as String,
        title: row['title'] as String,
        imageUrl: row['image_url'] as String,
      );
    }).toList();
  }
}
