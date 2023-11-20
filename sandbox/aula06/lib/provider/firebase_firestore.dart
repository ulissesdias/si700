import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/note.dart';
import '../model/notes.dart';

class FirestoreDatabase {
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  FirestoreDatabase._createInstance();

  String? username;

  final CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("notes");

  getNoteList() async {
    QuerySnapshot snapshot =
        await noteCollection.doc(username).collection("my_notes").get();

    NoteCollection retorno = NoteCollection();

    for (var doc in snapshot.docs) {
      Note note = Note.fromMap(doc.data());
      retorno.insertNoteOfId(doc.id, note);
    }

    return retorno;
  }

  getNote(noteId) async {
    DocumentSnapshot doc = await noteCollection
        .doc(username)
        .collection("my_notes")
        .doc(noteId)
        .get();
    return Note.fromMap(doc.data());
  }

  insertNote(Note note) async {
    await noteCollection
        .doc(username)
        .collection(
          "my_notes",
        )
        .add({
      "title": note.title,
      "description": note.description,
    });
  }

  updateNote(noteId, Note note) async {
    noteCollection
        .doc(username)
        .collection("my_notes")
        .doc(
          noteId,
        )
        .update(
      {
        "title": note.title,
        "description": note.description,
      },
    );
  }

  deleteNote(noteId) async {
    await noteCollection
        .doc(username)
        .collection("my_notes")
        .doc(noteId)
        .delete();
  }

  Stream get stream {
    return noteCollection
        .doc(username)
        .collection("my_notes")
        .snapshots()
        .map((snapshot) {
      NoteCollection retorno = NoteCollection();

      for (var doc in snapshot.docs) {
        Note note = Note.fromMap(doc.data());
        retorno.insertNoteOfId(doc.id, note);
      }

      return retorno;
    });
  }
}
