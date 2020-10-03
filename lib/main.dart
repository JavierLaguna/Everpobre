import 'package:everpobre/scenes/notebooks_scene.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/scenes/notes_scene.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF689F38),
        accentColor: const Color(0xFFCDDC39),
      ),
      title: TextResources.appName,
      routes: {
        NotebooksListView.routeName: (context) => NotebooksListView(model),
        NotesListView.routeName: (context) => NotesListView(context),
      },
      initialRoute: NotebooksListView.routeName,
    );
  }
}
