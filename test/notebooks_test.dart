import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Constructors", () {
    test("Can access the shared single notebooks singleton", () {
      expect(Notebooks.shared, isNotNull);
    });
  });

  group("Add", () {
    test("Add Notebook", () {
      final Notebook n = Notebook();

      expect(() => Notebooks.shared.add(n), returnsNormally);
    });
  });

  group("Remove", () {
    test("Remove Notebook", () {
      final Notebook n = Notebook();
      Notebooks.shared.add(n);

      expect(Notebooks.shared.remove(n), isTrue);
    });
  });

  group("Contents", () {
    test("Length behaves correctly", () {
      final Notebook n = Notebook();

      expect(Notebooks.shared.length, 0);

      Notebooks.shared.add(n);
      expect(Notebooks.shared.length, 1);

      Notebooks.shared.remove(n);
      expect(Notebooks.shared.length, 0);
    });
  });
}
