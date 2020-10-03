import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatefulWidget {
  static const routeName = "/notesList";

  final Notebook _model;

  NotesListView(BuildContext context)
      : _model = ModalRoute
      .of(context)
      .settings
      .arguments as Notebook;

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._model.name),
      ),
      body: ListView.builder(
        itemCount: widget._model.length,
        itemBuilder: (context, index) {
          return NoteSliver(
            note: widget._model[index],
            onDeleteNote: (note) {
              widget._model.remove(note);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        onPressed: () {
          widget._model.add(Note("New note"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteSliver extends StatelessWidget {
  final Note _note;
  final Function(Note) _onDeleteNote;

  const NoteSliver({Note note, Function(Note) onDeleteNote})
      : _note = note,
        _onDeleteNote = onDeleteNote;

  @override
  Widget build(BuildContext context) {
    DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        _onDeleteNote(_note);

        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Note '${_note.body}' has been deleted!"),
          ),
        );
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.note),
          title: Text(_note.body),
          subtitle: Text(fmt.format(_note.modificationDate)),
        ),
      ),
    );
  }
}
