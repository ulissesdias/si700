import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/notes.dart';
import '../provider/firebase_firestore.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    FirestoreDatabase.helper.stream.listen((event) {
      noteCollection = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      noteCollection = await FirestoreDatabase.helper.getNoteList();
      emit(MonitorState(noteCollection: noteCollection));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(noteCollection: noteCollection));
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

/*
Estados
*/
class MonitorState {
  NoteCollection noteCollection;
  MonitorState({required this.noteCollection});
}
