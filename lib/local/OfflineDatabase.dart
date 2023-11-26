import 'package:flutter_noe_app/models/Note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase {
  Future<Database> openDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'note.db'), version: 1,
        onCreate: (db, version) {
      db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, password TEXT,datetime TEXT)");
    });
  }

  Future<void> insertNoteInDb(Note note) async {
    Database db = await openDB();
    await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotesFromDb() async {
    Database db = await openDB();
    List<Map<String, dynamic>> data = await db.query('notes');
    Note note = Note();
    List<Note> notes = data.map((e) => Note.fromMap(e)).toList();
    return notes;
  }

  Future<int> deleteNote(Note note) async {
    Database db = await openDB();
    return await db.delete(
      'notes',
      where: "id = ?",
      whereArgs: [note.id],
    );
  }
}
