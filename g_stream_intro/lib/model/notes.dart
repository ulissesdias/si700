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

  Note getNodeAtIndex(int index) {
    return noteList[index];
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
      noteList[index] = note;
    } else {
      idList.add(id);
      noteList.add(note);
    }
  }

  updateNoteOfId(String id, Note note) {
    int index = getIndexOfId(id);
    if (index != -1) {
      noteList[index] = note;
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
    noteList.add(note);
  }
}
