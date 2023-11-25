import 'dart:async';

import 'package:aula06/provider/local_provider.dart';
import 'package:aula06/provider/rest_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/notes.dart';
import '../provider/firebase_firestore.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();
  StreamSubscription? subscription;

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    /**/

    on<AskNewList>((event, emit) async {
      //noteCollection = await RestDataProvider.helper.getNoteList();
      //noteCollection = await LocalProvider.helper.getNoteList();
      noteCollection = await FirestoreDatabase.helper.getNoteList();
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<UpdateStreamSubscription>((event, emit) {
      subscription?.cancel();
      subscription = FirestoreDatabase.helper.stream.listen((event) {
        noteCollection = event;
        add(UpdateList());
      });
    });
    add(AskNewList());
  }
}

/*
Eventos
*/
abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {}

class UpdateStreamSubscription extends MonitorEvent {}

/*
Estados
*/
class MonitorState {
  NoteCollection noteCollection;
  MonitorState({required this.noteCollection});
}
