import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/scenes/notes_scene.dart';
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
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  void modelDidChange() {
    setState(() {});
  }

  void addNewNotebook() {
    widget._model.add(Notebook("New Notebook"));
  }

  void onTapNotebook(Notebook notebook) async {
    await Navigator.pushNamed(context, NotesListView.routeName,
        arguments: notebook);

    modelDidChange();
  }

  void onDeleteNotebook(Notebook notebook) {
    widget._model.remove(notebook);
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
              onTapNotebook: onTapNotebook,
              onDeleteNotebook: onDeleteNotebook);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        onPressed: addNewNotebook,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotebookSliver extends StatelessWidget {
  final Notebook _notebook;
  final Function(Notebook) _onTapNotebook;
  final Function(Notebook) _onDeleteNotebook;

  const NotebookSliver({Notebook notebook,
    Function(Notebook) onTapNotebook,
    Function(Notebook) onDeleteNotebook})
      : _notebook = notebook,
        _onTapNotebook = onTapNotebook,
        _onDeleteNotebook = onDeleteNotebook;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        _onDeleteNotebook(_notebook);

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("The notebook '${_notebook.name}' has been deleted!"),
          ),
        );
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.book),
          title: Text(_notebook.name),
          subtitle: Text("${_notebook.length.toString()} notes"),
          onTap: () {
            _onTapNotebook(_notebook);
          },
        ),
      ),
    );
  }
}
