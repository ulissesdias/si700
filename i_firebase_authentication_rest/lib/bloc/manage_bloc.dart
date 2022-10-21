import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/note.dart';
import '../provider/firebase_firestore.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(noteId: event.noteId, previousNote: event.previousNote));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        //ToDo: Inserir uma chamada de insert
        FirestoreDatabase.helper.insertNote(event.note);
      } else if (state is UpdateState) {
        //ToDo: Inserir uma chamada de Update
        FirestoreDatabase.helper
            .updateNote((state as UpdateState).noteId, event.note);
        emit(InsertState());
      }
    });
    on<DeleteEvent>((event, emit) {
      // ToDo: Inserir uma chamada de Delete

      FirestoreDatabase.helper.deleteNote(event.noteId);
    });
  }
}

/*
  Eventos
*/
abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Note note;
  SubmitEvent({required this.note});
}

class DeleteEvent extends ManageEvent {
  String noteId;
  DeleteEvent({required this.noteId});
}

class UpdateRequest extends ManageEvent {
  String noteId;
  Note previousNote;
  UpdateRequest({required this.noteId, required this.previousNote});
}

class UpdateCancel extends ManageEvent {}

/*
Estados
*/

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String noteId;
  Note previousNote;
  UpdateState({required this.noteId, required this.previousNote});
}
