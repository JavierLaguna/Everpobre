import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/domain/note.dart';

final Notebook model = Notebook.testDataBuilder();
final Notebooks modelNotebooks = Notebooks.testDataBuilder();

void main() {
  print(modelNotebooks);
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF388E3C),
        accentColor: Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(TextResources.appName),
        ),
        body: NotesListView(model),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.add(Note("Una nueva nota"));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
