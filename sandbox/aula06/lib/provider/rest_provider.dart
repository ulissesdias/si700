import 'package:dio/dio.dart';

import '../model/note.dart';
import '../model/notes.dart';

class RestDataProvider {
  static RestDataProvider helper = RestDataProvider._createInstance();

  RestDataProvider._createInstance();

  final Dio _dio = Dio();

  String prefix = "https://si7002s2023-default-rtdb.firebaseio.com/";
  String suffix = ".json";

  getNoteList() async {
    Response response = await _dio.get(prefix + suffix);

    NoteCollection noteCollection = NoteCollection();

    response.data.forEach((key, value) {
      Note note = Note.fromMap(value);
      noteCollection.insertNoteOfId(key, note);
    });
    return noteCollection;
  }

  getNote(noteId) async {
    Response response = await _dio.get("${prefix + noteId}/$suffix");
    return Note.fromMap(response.data);
  }

  insertNote(Note note) async {
    await _dio.post(
      prefix + suffix,
      data: note.toMap(),
    );
  }

  updateNote(noteId, Note note) async {
    await _dio.put("${prefix + noteId}/$suffix", data: note.toMap());
  }

  deleteNote(noteId) async {
    await _dio.delete("${prefix + noteId}/$suffix");
  }
}
