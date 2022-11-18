class Note {
  String _title = "";
  String _description = "";

  Note() {
    _title = "";
    _description = "";
  }

  Note.withData({title = "", description = ""}) {
    _title = title;
    _description = description;
  }

  Note.fromMap(map) {
    _title = map["title"];
    _description = map["description"];
  }

  String get title => _title;
  String get description => _description;

  set title(String newTitle) {
    if (newTitle.isNotEmpty) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.isNotEmpty) {
      _description = newDescription;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    return map;
  }
}
