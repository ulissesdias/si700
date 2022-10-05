// Data Provider para o banco de dados local sqflite
import 'package:dio/dio.dart';

import '../model/note.dart';
import '../model/notes.dart';

class RestServer {
  // Atributo que irá afunilar todas as consultas
  static RestServer helper = RestServer._createInstance();

  // Construtor privado
  RestServer._createInstance();

  final Dio _dio = Dio();

  String prefixUrl = "https://si7001s2022-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";

  Future<Note> getNote(noteId) async {
    Response response = await _dio.get(prefixUrl + noteId + suffixUrl);
    return Note.fromMap(response.data);
  }

  Future<int> insertNote(Note note) async {
    await _dio.post(
      prefixUrl + suffixUrl,
      data: note.toMap(),
    );
    return 42;
  }

  Future<int> updateNote(noteId, Note note) async {
    await _dio.put(
      "$prefixUrl/$noteId$suffixUrl",
      data: note.toMap(),
    );
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    await _dio.delete(
      "$prefixUrl/$noteId$suffixUrl",
    );
    return 42;
  }

  Future<NoteCollection> getNoteList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    NoteCollection noteCollection = NoteCollection();

    response.data.forEach((key, value) {
      Note note = Note.fromMap(value);
      noteCollection.insertNoteOfId(key, note);
    });
    return noteCollection;
  }
}
