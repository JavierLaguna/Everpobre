import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

class Notebook with ChangeNotifier {
  static final shared = Notebook("Singleton Notebook");

  final String _name;
  final List<Note> _notes = [];

  String get name => _name;

  int get length => _notes.length;

  // Constructors
  Notebook(String name) : _name = name;

  Notebook.testDataBuilder(String name) : _name = name {
    _notes.addAll(List.generate(100, (index) => Note("Item $index")));
  }

  // Accessors
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutators
  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  bool remove(Note note) {
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $_name with $length notes>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other is Notebook &&
        _name == other.name &&
        length == other.length) {
      for (var i = 0; i < length; i++) {
        if (_notes[i] != other[i]) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode {
    final nameHash = _name.hashCode;

    if (_notes.isEmpty) {
      return nameHash;
    } else {
      final notesHash = _notes
          .map((element) => element.hashCode)
          .reduce((value, element) => value + element);

      return nameHash + notesHash;
    }
  }
}
