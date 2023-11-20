class Note {
  String _title = "";
  String _description = "";
  String _path = "";

  Note() {
    _title = "";
    _description = "";
    _path = "";
  }

  Note.withData({title = "", description = "", path = ""}) {
    _title = title;
    _description = description;
    _path = path;
  }

  Note.fromMap(map) {
    _title = map["title"];
    _description = map["description"];
    _path = map["path"];
  }

  String get title => _title;
  String get description => _description;
  String get path => _path;

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

  set path(String newPath) {
    if (newPath.isNotEmpty) {
      _path = newPath;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["path"] = _path;
    return map;
  }
}
