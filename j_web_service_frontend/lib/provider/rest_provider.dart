// Data Provider para o banco de dados local sqflite
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';

import '../model/note.dart';
import '../model/notes.dart';

class RestDataProvider {
  // Atributo que irá afunilar todas as consultas
  static RestDataProvider helper = RestDataProvider._createInstance();

  // Construtor privado
  RestDataProvider._createInstance();

  final Dio _dio = Dio();

  /*String prefixUrl = "https://si7002s2022-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";*/

  String prefixUrl = "http://localhost:3000/notes";
  String suffixUrl = "";

  Future<Note> getNote(noteId) async {
    Response response = await _dio.get(prefixUrl + noteId + suffixUrl);
    return Note.fromMap(response.data);
  }

  Future<int> insertNote(Note note) async {
    Response response = await _dio.post(
      prefixUrl + suffixUrl,
      data: note.toMap(),
    );
    return 42;
  }

  Future<int> updateNote(noteId, Note note) async {
    Response response = await _dio.put(
      "$prefixUrl/$noteId$suffixUrl",
      data: note.toMap(),
    );
    return 42;
  }

  Future<int> deleteNote(noteId) async {
    Response response = await _dio.delete(
      "$prefixUrl/$noteId$suffixUrl",
    );
    return 42;
  }

  Future<NoteCollection> getNoteList() async {
    Response response = await _dio.get(prefixUrl + suffixUrl);

    NoteCollection noteCollection = NoteCollection();

    response.data.forEach((value) {
      Note note = Note.fromMap(value);
      noteCollection.insertNoteOfId(value["id"].toString(), note);
    });
    return noteCollection;
  }

  /*
     Parte da STREAM
  */

  // Método que envia dados para a Stream
  notify(String noteId, Note? note) async {
    _controller?.sink.add([noteId, note]);
  }

  Stream get stream {
    _controller ??= StreamController.broadcast();

    Socket socket = io(
        "http://localhost:3000",
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .build());

    /*
     Criando uma conexão com o servidor. Vamos ler apenas mensagens do tipo "server_information"
    */
    socket.on('server_information', (data) {
      /*
       O servidor nos informa o dado que foi modificado.
      */
      String noteId = data["noteId"].toString();
      String title = data["title"];
      String description = data["description"];

      // Vamos assumir que "title=null" significa uma remoção.
      if (title == "") {
        notify(noteId, null);
      } else {
        Note note = Note();
        note.title = title;
        note.description = description;
        notify(noteId, note);
      }
    });

    return _controller!.stream;
  }

  dispose() {
    if (_controller != null) {
      if (!_controller!.hasListener) {
        _controller!.close();
        _controller = null;
      }
    }
  }

  static StreamController? _controller;
}
