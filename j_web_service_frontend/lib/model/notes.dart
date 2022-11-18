import 'note.dart';

class NoteCollection {
  List<String> idList = [];
  List<Note> noteList = [];

  NoteCollection() {
    idList = [];
    noteList = [];
  }

  int length() {
    return idList.length;
  }

  Note getNoteAtIndex(int index) {
    Note note = noteList[index];
    return Note.withData(
      title: note.title,
      description: note.description,
    );
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertNoteOfId(String id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      // Update
      noteList[index] = Note.withData(
        title: note.title,
        description: note.description,
      );
    } else {
      // Insert
      idList.add(id);
      noteList.add(
        Note.withData(
          title: note.title,
          description: note.description,
        ),
      );
    }
  }

  updateNoteOfId(String id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] =
          Note.withData(title: note.title, description: note.description);
    }
  }

  deleteNoteOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertNoteOfId(String id, Note note) {
    idList.add(id);
    noteList.add(
      Note.withData(
        title: note.title,
        description: note.description,
      ),
    );
  }
}
