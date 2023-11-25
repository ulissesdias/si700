import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note.dart';
import '../model/notes.dart';

class LocalProvider {
  static LocalProvider helper = LocalProvider._createInstance();

  // Objeto do SQFLite para fazer as requisições.
  static Database? _database;

  LocalProvider._createInstance();

  // Configuração do banco: nomes de tabelas.
  String noteTable = "note_table";
  String colId = "id"; // Auto-numerar
  String colTitle = "title";
  String colDescription = "description";

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

// Gerar um arquivo e depois aplicar uma função que gera um banco de dados nesse arquivo.
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}notes.db";

    return openDatabase(path, version: 1, onCreate: _createDb);
  }

  _createDb(Database db, int newVersion) {
    db.execute("""
       CREATE TABLE $noteTable (
           $colId INTEGER PRIMARY KEY AUTOINCREMENT,
           $colTitle TEXT,
           $colDescription TEXT
          );
    """);
  }

  getNoteList() async {
    Database db = await database;

    List<Map<String, Object?>> noteMapList =
        await db.rawQuery("SELECT * FROM $noteTable;");

    NoteCollection noteCollection = NoteCollection();

    for (int i = 0; i < noteMapList.length; i++) {
      Note note = Note.fromMap(noteMapList[i]);

      noteCollection.insertNoteOfId(
        noteMapList[i][colId].toString(),
        note,
      );
    }
    return noteCollection;
  }

  getNote(noteId) async {
    Database? db = await database;
    List<Map<String, dynamic>> result =
        await db.query(noteTable, where: "$colId = ?", whereArgs: [noteId]);
    Note note = Note.fromMap(result[0]);
    return note;
  }

  insertNote(Note note) async {
    Database? db = await database;
    //await db.execute(
    //    "INSERT INTO $noteTable ($colTitle, $colDescription) VALUES (${note.title}, ${note.description})");
    await db.insert(noteTable, note.toMap());
  }

  updateNote(noteId, Note note) async {
    Database? db = await database;
    await db.update(noteTable, note.toMap(),
        where: "$colId = ?", whereArgs: [noteId]);
  }

  deleteNote(noteId) async {
    Database? db = await database;
    await db.delete(noteTable, where: "$colId = ?", whereArgs: [noteId]);
  }
}
