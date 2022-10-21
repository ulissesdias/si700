import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_storage.dart';

import '../model/note.dart';
import '../model/notes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  // Atributo que irá afunilar todas as consultas
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();
  // Construtor privado
  FirestoreDatabase._createInstance();

  // uid do usuário logado
  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference noteCollection =
      FirebaseFirestore.instance.collection("notes");

  Future<Note> getNote(noteId) async {
    DocumentSnapshot doc =
        await noteCollection.doc(uid).collection("my_notes").doc(noteId).get();
    Note note = Note.fromMap(doc.data());
    return note;
  }

  Future<int> insertNote(Note note) async {
    DocumentReference ref = await noteCollection
        .doc(uid)
        .collection("my_notes")
        .add({
      "title": note.title,
      "description": note.description,
      "path": note.path
    });

    if (note.path != "") {
      UploadTask? task =
          StorageServer.helper.insertImage(uid!, ref.id, note.path);
      if (task != null) {
        var snapshot = await task.whenComplete(() {});
        note.path = await snapshot.ref.getDownloadURL();

        await noteCollection
            .doc(uid)
            .collection("my_notes")
            .doc(ref.id)
            .update({
          "title": note.title,
          "description": note.description,
          "path": note.path
        });
      }
    }

    return 42;
  }

  Future<int> updateNote(noteId, Note note) async {
    if (note.path != "") {
      UploadTask? task =
          StorageServer.helper.insertImage(uid!, noteId, note.path);
      if (task != null) {
        var snapshot = await task.whenComplete(() {});
        note.path = await snapshot.ref.getDownloadURL();
      }
    }

    await noteCollection.doc(uid).collection("my_notes").doc(noteId).update({
      "title": note.title,
      "description": note.description,
      "path": note.path
    });
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    await noteCollection.doc(uid).collection("my_notes").doc(noteId).delete();
    StorageServer.helper.deleteImage(uid!, noteId);
    return 42;
  }

  NoteCollection _noteListFromSnapshot(QuerySnapshot snapshot) {
    NoteCollection noteCollection = NoteCollection();
    for (var doc in snapshot.docs) {
      Note note = Note.fromMap(doc.data());
      noteCollection.insertNoteOfId(doc.id, note);
    }
    return noteCollection;
  }

  Future<NoteCollection> getNoteList() async {
    QuerySnapshot snapshot =
        await noteCollection.doc(uid).collection("my_notes").get();

    return _noteListFromSnapshot(snapshot);
  }

  Stream get stream {
    return noteCollection
        .doc(uid)
        .collection("my_notes")
        .snapshots()
        .map(_noteListFromSnapshot);
  }
}
