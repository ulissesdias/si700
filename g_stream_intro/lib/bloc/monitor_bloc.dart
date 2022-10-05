import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/notes.dart';
import '../provider/rest_provider.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  NoteCollection noteCollection = NoteCollection();

  MonitorBloc() : super(MonitorState(noteCollection: NoteCollection())) {
    on<AskNewList>((event, emit) async {
      noteCollection = await RestServer.helper.getNoteList();
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
