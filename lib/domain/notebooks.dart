import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  // Singleton
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  // Constructors
  Notebooks();

  Notebooks.testDataBuilder() {
    _notebooks.addAll(List.generate(20, (index) => Notebook.testDataBuilder()));
  }

  // Accessors
  Notebook operator [](int index) {
    return _notebooks[index];
  }

  // Mutators
  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }

  bool remove(Notebook notebook) {
    final removed = _notebooks.remove(notebook);
    notifyListeners();
    return removed;
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notebooks>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else if (other is Notebooks && length == other.length) {
      for (var i = 0; i < length; i++) {
        if (_notebooks[i] != other[i]) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode {
    if (_notebooks.isEmpty) {
      return 0;
    } else {
      return _notebooks
          .map((element) => element.hashCode)
          .reduce((value, element) => value + element);
    }
  }
}
