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
}
