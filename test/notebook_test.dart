import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construction", () {
    test("Can access the shared single notebook singleton", () {
      expect(Notebook.shared, isNotNull);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Note n = Note("hola");
      Notebook.shared.add(n);
      expect(() => Notebook.shared.removeAt(0), returnsNormally);

      Notebook.shared.add(n);
      expect(Notebook.shared.removeAt(0), n);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebook();
      final nb2 = Notebook();
      final n = Note("Lorem Ipsum");

      expect(nb.length, 0);

      nb2.add(n);

      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });

  group("Object Protocol", () {
    test("Equality", () {
      final note1 = Note("Mi nota 1");
      final note2 = Note("Mi nota 2");

      final notebook1 = Notebook();
      notebook1.add(note1);
      notebook1.add(note2);

      final notebook2 = Notebook();
      notebook2.add(note1);
      notebook2.add(note2);

      expect(notebook1, notebook2);
    });

    test("Not Equality - different length", () {
      final note1 = Note("Mi nota 1");
      final note2 = Note("Mi nota 2");

      final notebook1 = Notebook();
      notebook1.add(note1);
      notebook1.add(note2);

      final notebook2 = Notebook();
      notebook2.add(note1);

      expect(notebook1 == notebook2, isFalse);
    });

    test("Not Equality - same length, different notes", () {
      final note1 = Note("Mi nota 1");
      final note2 = Note("Mi nota 2");
      final note3 = Note("Mi nota 3");

      final notebook1 = Notebook();
      notebook1.add(note1);
      notebook1.add(note2);
      notebook1.add(note2);

      final notebook2 = Notebook();
      notebook2.add(note1);
      notebook2.add(note3);
      notebook2.add(note2);

      expect(notebook1 == notebook2, isFalse);
    });

    test("HashCode - equal", () {
      final note1 = Note("Mi nota 1");
      final note2 = Note("Mi nota 2");

      final notebook1 = Notebook();
      notebook1.add(note1);
      notebook1.add(note2);

      final notebook2 = Notebook();
      notebook2.add(note1);
      notebook2.add(note2);

      expect(notebook1.hashCode, notebook2.hashCode);
    });

    test("HashCode - not equal", () {
      final note1 = Note("Mi nota 1");
      final note2 = Note("Mi nota 2");
      final note3 = Note("Mi nota 3");

      final notebook1 = Notebook();
      notebook1.add(note1);
      notebook1.add(note2);

      final notebook2 = Notebook();
      notebook2.add(note1);
      notebook2.add(note3);

      expect(notebook1.hashCode == notebook2.hashCode, isFalse);
    });
  });
}
