import 'package:everpobre/domain/notebook.dart';

class Notebooks {
  // Singleton
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;

  // Accessors
  Notebook operator [](int index) {
    return _notebooks[index];
  }

  // Mutators
  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
  }

  bool remove(Notebook notebook) {
    final removed = _notebooks.remove(notebook);
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
