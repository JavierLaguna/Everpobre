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
          return NotebookSliver(
              notebook: widget._model[index],
              onDeleteNotebook: (notebook) {
                widget._model.remove(notebook);
              });
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

  final Function(Notebook) _onDeleteNotebook;

  const NotebookSliver({Notebook notebook, Function(Notebook) onDeleteNotebook})
      : _notebook = notebook,
        _onDeleteNotebook = onDeleteNotebook;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        _onDeleteNotebook(_notebook);
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.book),
          title: Text(_notebook.name),
          subtitle: Text("${_notebook.length.toString()} notes"),
        ),
      ),
    );
  }
}
