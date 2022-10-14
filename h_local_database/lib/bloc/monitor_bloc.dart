import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/notes.dart';
import '../provider/local_database.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    LocalDatabase.helper.stream.listen((event) {
      String noteId = event[0];

      if (event[1] == null) {
        // Ocorreu um delete
        noteCollection.deleteNoteOfId(noteId);
      } else {
        noteCollection.updateOrInsertNoteOfId(noteId, event[1]);
      }
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      noteCollection = await LocalDatabase.helper.getNoteList();
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
