import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class SqlHelper {
  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE Post (
    id INTEGER PRIMARY KEY,
    thumbnail TEXT,
    title TEXT, 
    content TEXT, 
    userId INTEGER,
    quantity INTEGER
    )
    """);
  }

  static Future<Database> db() async {
    return openDatabase("post.db", version: 1, onCreate: (Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createItem(int id, String thumbnail, String title, String content, int userId, int quantity) async {
    final database = await SqlHelper.db();

    final data = {
      "id": id,
      "thumbnail": thumbnail,
      "title": title,
      "content": content,
      "userId": userId,
      "quantity": quantity,
    };
    final createId = await database.insert("Post", data, conflictAlgorithm: ConflictAlgorithm.replace);
    return createId;
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final database = await SqlHelper.db();
    return database.query("Post", where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final database = await SqlHelper.db();
    return database.query("Post");
  }

  static Future<int> updateItem(int id, String thumbnail, String title, String content, int userId, int quantity) async {
    final db = await SqlHelper.db();

    final data = {
      "id": id,
      "thumbnail": thumbnail,
      "title": title,
      "content": content,
      "userId": userId,
      "quantity": quantity,
    };

    final result = await db.update("Post", data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete("Post", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
