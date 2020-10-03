import 'package:everpobre/domain/note.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

class NoteDetailView extends StatefulWidget {
  static const routeName = "/notesList/noteDetail";

  final Note _note;

  NoteDetailView(BuildContext context)
      : _note = ModalRoute
      .of(context)
      .settings
      .arguments as Note;

  @override
  _NoteDetailViewState createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget._note.body);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  void saveChanges() {
    widget._note.body = _editingController.text;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.detailNoteTitle),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: saveChanges,
                child: const Icon(Icons.save),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EditableText(
          autofocus: true,
          backgroundCursorColor: Theme
              .of(context)
              .primaryColor,
          controller: _editingController,
          cursorColor: Theme
              .of(context)
              .accentColor,
          focusNode: FocusNode(),
          maxLines: null,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
