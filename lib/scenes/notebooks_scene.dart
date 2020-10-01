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
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

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
          widget._model.add(Notebook("New Notebook"));
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
        title: Text(_notebook.name),
        subtitle: Text("${_notebook.length.toString()} notes"),
      ),
    );
  }
}
