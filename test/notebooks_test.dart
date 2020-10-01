import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';
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

  group("Object Protocol", () {
    test("Equality", () {
      final note1 = Note("Mi nota 1");
      final note2 = Note("Mi nota 2");

      final notebook = Notebook();
      notebook.add(note1);
      notebook.add(note2);

      final notebooks1 = Notebooks();
      notebooks1.add(notebook);
      final notebooks2 = Notebooks();
      notebooks2.add(notebook);

      expect(notebooks1, notebooks2);
    });

    test("Not Equality - different length", () {
      final notebook1 = Notebook();
      final notebook2 = Notebook();

      final notebooks1 = Notebooks();
      notebooks1.add(notebook1);
      notebooks1.add(notebook2);
      final notebooks2 = Notebooks();
      notebooks2.add(notebook1);

      expect(notebooks1 == notebooks2, isFalse);
    });

    test("Not Equality - same length, different notebook", () {
      final notebook1 = Notebook();
      final notebook2 = Notebook();
      final note1 = Note("Note 1");
      final notebook3 = Notebook();
      notebook3.add(note1);

      final notebooks1 = Notebooks();
      notebooks1.add(notebook1);
      notebooks1.add(notebook2);
      final notebooks2 = Notebooks();
      notebooks2.add(notebook1);
      notebooks2.add(notebook3);

      expect(notebooks1 == notebooks2, isFalse);
    });

    test("HashCode - equal", () {
      final note1 = Note("NOTE 1");

      final notebook1 = Notebook();
      notebook1.add(note1);
      final notebook2 = Notebook();

      final notebooks1 = Notebooks();
      notebooks1.add(notebook1);
      notebooks1.add(notebook2);
      final notebooks2 = Notebooks();
      notebooks2.add(notebook1);
      notebooks2.add(notebook2);

      expect(notebooks1.hashCode, notebooks2.hashCode);
    });

    test("HashCode - not equal", () {
      final notebook1 = Notebook();
      final notebook2 = Notebook();
      final note1 = Note("Note 1");
      final notebook3 = Notebook();
      notebook3.add(note1);

      final notebooks1 = Notebooks();
      notebooks1.add(notebook1);
      notebooks1.add(notebook2);
      final notebooks2 = Notebooks();
      notebooks2.add(notebook1);
      notebooks2.add(notebook3);

      expect(notebooks1.hashCode == notebooks2.hashCode, isFalse);
    });
  });
}
