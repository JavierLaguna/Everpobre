import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

class Notebook with ChangeNotifier {
  static final shared = Notebook();

  final List<Note> _notes = [];

  int get length => _notes.length;

  // Constructores
  Notebook();

  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(100, (index) => Note("Item $index")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutadores
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

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other is Notebook && length == other.length) {
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
  int get hashCode => _notes
      .map((element) => element.hashCode)
      .reduce((value, element) => value + element);
}
