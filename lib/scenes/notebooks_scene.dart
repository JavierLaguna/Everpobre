import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

class NotebooksListView extends StatefulWidget {
  static const routeName = "/";

  final Notebooks _model;

  const NotebooksListView(Notebooks model) : _model = model;

  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      body: ListView.builder(
        itemCount: widget._model.length,
        itemBuilder: (context, index) {
          return NotebookSliver(widget._model[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // model.add(Note("Una nueva nota"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotebookSliver extends StatelessWidget {
  final Notebook _notebook;

  const NotebookSliver(Notebook notebook) : _notebook = notebook;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.book),
        title: Text("${_notebook.length.toString()} notes"),
        subtitle: const Text("Subtitle"),
      ),
    );
  }
}
