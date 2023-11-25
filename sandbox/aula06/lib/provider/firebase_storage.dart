import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServer {
  // Atributo que irá afunilar todas as consultas
  static StorageServer helper = StorageServer._createInstance();
  // Construtor privado
  StorageServer._createInstance();

  Reference noteImage = FirebaseStorage.instance.ref().child("images");

  UploadTask? insertImage(String username, String noteId, Uint8List fileBytes) {
    try {
      var ref = noteImage.child(username).child("$noteId.jpg");
      return ref.putData(fileBytes);
    } on FirebaseException {
      return null;
    }
  }

  deleteImage(String username, String noteId) {
    noteImage.child(username).child("$noteId.jpg").delete();
  }
}
